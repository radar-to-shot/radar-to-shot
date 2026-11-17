#!/usr/bin/env python3
"""Discord table images, showcase attachments, metadata, and failure handling."""
from __future__ import annotations

from contextlib import redirect_stderr, redirect_stdout
from copy import deepcopy
import hashlib
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from discord_leaderboard import (MAX_ATTACHMENT_BYTES, TABLE_FILES, attachment_names,
                                 main, payload, prepare_delivery, send, validate_files)

RUN_URL = "https://github.com/radar-to-shot/radar-to-shot/actions/runs/123"
WEBHOOK = "https://discord.com/api/webhooks/123456/PRIVATE_TOKEN"
# The transport checks media signatures; image decoding/rendering is tested in
# the table and showcase suites rather than requiring Pillow in the sender job.
PNG = b"\x89PNG\r\n\x1a\ntransport-test-png"
GIF = b"GIF89atransport-test-gif"


def report():
    rows = [{"id": f"ada/robot-{i}.bot", "robot_name": "Vector Sentinel" if i == 0 else f"Robot {i}",
             "robot_id": f"ada/robot-{i}", "author": "Ada Lovelace", "author_id": "ada",
             "version": "1.2.3", "rank": i + 1, "rating": 1800.0 - i * 10,
             "games": 40, "wins": 30, "draws": 5, "losses": 5,
             "win_rate": 0.75, "survival_rate": 0.8, "average_place": 1.5,
             "provisional": False} for i in range(5)]
    return {"status": "completed", "week": "2026-W47", "overall": rows,
            "modes": {str(size): {"standings": deepcopy(rows)} for size in range(2, 6)},
            "authors": [{"author_id": "ada", "author": "Ada Lovelace", "rank": 1,
                         "rating": 1800.0, "robots": 5, "games": 200, "win_rate": 0.75}],
            "participants": [], "unavailable_modes": [], "battle_count": 800,
            "table_images": [{"filename": name, "title": title,
                              "description": "Full standings and statistics are attached as text and JSON."}
                             for name, title in zip(TABLE_FILES,
                                 ("This week's leaders", "Battle formats", "Historical leaders"))],
            "showcase": {"status": "completed", "gif_file": "showcase.gif",
                         "replay_file": "showcase.json", "seed": 42, "tick": 150,
                         "winner": rows[0]["id"], "order": [row["id"] for row in rows]}}


def file_bytes(message):
    return [PNG if name.endswith(".png") else GIF if name.endswith(".gif") else b"{}"
            for name in attachment_names(message)]


def write_report(directory, data):
    (directory / "leaderboard.json").write_text(json.dumps(data), encoding="utf-8")
    (directory / "leaderboard.md").write_text("# Complete standings\n", encoding="utf-8")
    for name in TABLE_FILES:
        (directory / name).write_bytes(PNG)
    (directory / "showcase.gif").write_bytes(GIF)


class FakeOpener:
    def __init__(self):
        self.requests = []

    def open(self, request, timeout):
        self.requests.append(request)
        return io.BytesIO(b'{"id":"123456789"}')


class PresentationTests(unittest.TestCase):
    def test_metadata_leaders_and_every_embed_use_attached_media(self):
        message = payload(report(), RUN_URL)
        names = attachment_names(message)
        self.assertEqual(names, ["leaderboard.json", "leaderboard.md", *TABLE_FILES, "showcase.gif"])
        self.assertEqual(len(message["embeds"]), 4)
        self.assertIn("Vector Sentinel v1.2.3 · Ada Lovelace", message["content"])
        self.assertIn("Author leader: `Ada Lovelace`", message["content"])
        self.assertNotIn("ada/robot-0.bot", message["content"])
        self.assertEqual(message["allowed_mentions"], {"parse": []})
        for embed in message["embeds"]:
            self.assertIn(embed["image"]["url"].removeprefix("attachment://"), names)
        exhibition = message["embeds"][-1]
        self.assertIn("does not affect ratings", exhibition["description"])
        self.assertIn("Seed 42", exhibition["description"])
        self.assertIn("Winner: `Vector Sentinel", exhibition["description"])

    def test_tied_leaders_are_not_relabelled_as_a_sole_winner(self):
        data = report()
        for row in data["overall"][:3]:
            row["rank"] = 1
        data["showcase"]["winner"] = None
        message = payload(data, RUN_URL)
        self.assertIn("Robot leaders:", message["content"])
        self.assertIn("(+1 tied)", message["content"])
        self.assertIn("without a winner", message["embeds"][-1]["description"])

    def test_hostile_metadata_cannot_break_inline_code_or_trigger_mentions(self):
        data = report()
        for row in data["overall"]:
            row["robot_name"] = "@everyone\n`click` <@123> **fake**" + "x" * 1000
            row["author"] = "@here\r<evil>`" + "🙂" * 1000
            row["version"] = "1.0.0`\n" + "x" * 1000
        data["authors"][0]["author"] = data["overall"][0]["author"]
        message = payload(data, RUN_URL)
        self.assertNotIn("@everyone", message["content"])
        self.assertNotIn("@here", message["content"])
        self.assertEqual(message["content"].count("`"), 4)
        self.assertLess(len(message["content"].encode("utf-16-le")) // 2, 2000)
        self.assertEqual(message["allowed_mentions"]["parse"], [])

    def test_insufficient_robots_skips_showcase_explicitly(self):
        data = report()
        data["showcase"] = {"status": "skipped", "reason": "Five ranked robots are required."}
        data["unavailable_modes"] = [5]
        message = payload(data, RUN_URL)
        self.assertEqual(len(message["attachments"]), 5)
        self.assertNotIn("showcase.gif", attachment_names(message))
        self.assertIn("Showcase skipped", message["content"])
        self.assertIn("Five ranked robots are required", message["content"])

    def test_partial_media_manifests_and_invalid_showcases_are_rejected(self):
        mutations = [lambda data: data["table_images"].pop(),
                     lambda data: data.update(table_images=[]),
                     lambda data: data["table_images"][0].update(filename="../other.png"),
                     lambda data: data["table_images"][0].update(filename=[]),
                     lambda data: data.pop("showcase"),
                     lambda data: data["showcase"].update(status="failed"),
                     lambda data: data["showcase"].update(gif_file="../secret.gif"),
                     lambda data: data["showcase"].update(seed=None),
                     lambda data: data["showcase"].update(winner="unknown"),
                     lambda data: data.update(showcase={"status": "skipped"})]
        for mutate in mutations:
            with self.subTest(mutation=mutate):
                data = report()
                mutate(data)
                with self.assertRaises(ValueError):
                    payload(data, RUN_URL)

    def test_legacy_text_fallback_includes_metadata_games_and_win_percentage(self):
        data = report()
        data.pop("table_images")
        data.pop("showcase")
        message = payload(data, RUN_URL)
        self.assertEqual(len(message["embeds"]), 5)
        self.assertEqual(len(message["attachments"]), 2)
        description = message["embeds"][0]["description"]
        self.assertIn("Vector Sentinel v1.2.3", description)
        self.assertIn("Ada Lovelace", description)
        self.assertIn("75%", description)
        self.assertIn("Games Win%", description)


class DeliveryTests(unittest.TestCase):
    def test_dynamic_multipart_has_correct_media_types_and_all_bytes(self):
        message = payload(report(), RUN_URL)
        files, opener = file_bytes(message), FakeOpener()
        self.assertEqual(send(WEBHOOK, message, files, opener=opener), "123456789")
        self.assertEqual(len(opener.requests), 1)
        body = opener.requests[0].data
        for name in attachment_names(message):
            self.assertIn(f'filename="{name}"'.encode(), body)
        self.assertEqual(body.count(b"Content-Type: image/png\r\n"), 3)
        self.assertEqual(body.count(b"Content-Type: image/gif\r\n"), 1)
        self.assertIn(b'"url": "attachment://showcase.gif"', body)
        self.assertNotIn(b"PRIVATE_TOKEN", body)

    def test_missing_mismatched_oversized_and_corrupt_files_fail_before_network(self):
        message = payload(report(), RUN_URL)
        opener = FakeOpener()
        invalid_files = [file_bytes(message)[:-1],
                         [b"x" * (MAX_ATTACHMENT_BYTES + 1), *file_bytes(message)[1:]],
                         [*file_bytes(message)[:-1], b"not a gif"],
                         [*file_bytes(message)[:2], b"not a png", *file_bytes(message)[3:]]]
        for files in invalid_files:
            with self.subTest(sizes=list(map(len, files))), self.assertRaises(ValueError):
                send(WEBHOOK, message, files, opener=opener)
        self.assertFalse(opener.requests)
        message["embeds"][0]["image"]["url"] = "https://example.com/image.png"
        with self.assertRaises(ValueError):
            validate_files(message, file_bytes(message))

    def test_file_manifest_is_bounded_unique_and_uses_known_safe_names(self):
        for entries in ([{"id": 0, "filename": "../secret"}],
                        [{"id": 0, "filename": ["leaderboard.json"]}],
                        [{"id": 0, "filename": "leaderboard.json"},
                         {"id": 1, "filename": "leaderboard.json"}],
                        [{"id": 2, "filename": "leaderboard.json"}],
                        [{"id": i, "filename": "leaderboard.json"} for i in range(11)]):
            with self.subTest(entries=entries), self.assertRaises(ValueError):
                attachment_names({"attachments": entries})

    def test_dry_run_checks_real_files_without_using_network(self):
        with tempfile.TemporaryDirectory() as temporary:
            directory = Path(temporary)
            write_report(directory, report())
            output = io.StringIO()
            with patch("discord_leaderboard.build_opener", side_effect=AssertionError("network used")):
                with redirect_stdout(output):
                    status = main(["--report-dir", str(directory), "--run-url", RUN_URL, "--dry-run"])
            self.assertEqual(status, 0)
            self.assertEqual(len(json.loads(output.getvalue())["attachments"]), 6)
            (directory / "showcase.gif").unlink()
            with redirect_stderr(io.StringIO()):
                status = main(["--report-dir", str(directory), "--run-url", RUN_URL, "--dry-run"])
            self.assertEqual(status, 2)

    def test_declared_missing_media_or_symlinks_cannot_silently_disappear(self):
        with tempfile.TemporaryDirectory() as temporary:
            directory = Path(temporary)
            for missing in (*TABLE_FILES, "showcase.gif"):
                write_report(directory, report())
                (directory / missing).unlink()
                with self.subTest(missing=missing), self.assertRaises(ValueError):
                    prepare_delivery(directory, RUN_URL)
            write_report(directory, report())
            path = directory / TABLE_FILES[0]
            path.unlink()
            path.symlink_to(directory / TABLE_FILES[1])
            with self.assertRaisesRegex(ValueError, "symbolic link"):
                prepare_delivery(directory, RUN_URL)

    def test_recorded_showcase_hash_rejects_a_stale_gif(self):
        with tempfile.TemporaryDirectory() as temporary:
            directory = Path(temporary)
            data = report()
            data["showcase"]["gif_sha256"] = hashlib.sha256(GIF).hexdigest()
            write_report(directory, data)
            prepare_delivery(directory, RUN_URL)
            (directory / "showcase.gif").write_bytes(GIF + b"different battle")
            with self.assertRaisesRegex(ValueError, "artifact hash"):
                prepare_delivery(directory, RUN_URL)


if __name__ == "__main__":
    unittest.main(verbosity=2)
