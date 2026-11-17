#!/usr/bin/env python3
"""Native parity, finalist selection, GIF integrity and failure handling."""
from __future__ import annotations

import argparse
from copy import deepcopy
import hashlib
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
BINARY = ROOT / "build/robotwar"
sys.path.insert(0, str(ROOT / "tools"))
from battle_runner import read_robot, run_native
from league_showcase import MAX_GIF_BYTES, NativeSession, capture, generate_showcase, select_finalists, showcase_seed

IDLE = "loop\ngoto loop\n"
SELF_SHOOTER = "FIRE_RATE 4\nloop\n0 to shot\ngoto loop\n"


class ShowcaseTests(unittest.TestCase):
    def setUp(self):
        self.sources = tempfile.TemporaryDirectory(prefix=".showcase-test-", dir=ROOT / "robots")
        self.outputs = tempfile.TemporaryDirectory(prefix="robotwar-showcase-")
        self.directory, self.output = Path(self.sources.name), Path(self.outputs.name)
        rows, participants = [], []
        for index in range(6):
            path = self.directory / f"robot-{index}.bot"
            path.write_text(SELF_SHOOTER if index == 0 else IDLE)
            identity = path.relative_to(ROOT / "robots").as_posix()
            rows.append({"id": identity, "robot_name": f"Robot {index}", "author": f"Author {index}",
                         "version": "1.2.0", "rating": 1700 - index * 20, "rank": index + 1})
            participants.append({"id": identity, "source_sha256": hashlib.sha256(path.read_bytes()).hexdigest()})
        self.report = {"status": "completed", "week": "2026-W47",
                       "config": {"ticks": 60, "encoding": "utf-8"},
                       "engine_sha256": hashlib.sha256(BINARY.read_bytes()).hexdigest(),
                       "participants": participants, "modes": {"5": {"standings": rows}}}

    def tearDown(self):
        self.sources.cleanup()
        self.outputs.cleanup()

    def request(self, order, ticks, seed):
        robots = [{**read_robot(ROOT / "robots" / identity, "utf-8"), "name": identity} for identity in order]
        return {"robots": robots, "ticks": ticks, "seed": seed,
                "stop_when_finished": True, "include_rng_seed": True, "events": False}

    def test_finalists_are_the_first_five_standings_rows_with_stable_tie_cutoff(self):
        rows = self.report["modes"]["5"]["standings"]
        rows[4]["rating"] = rows[5]["rating"]
        rows[4]["rank"] = rows[5]["rank"] = 5
        self.assertEqual(select_finalists(self.report), rows[:5])
        first = showcase_seed("2026-W47", [row["id"] for row in rows[:5]])
        self.assertEqual(first, showcase_seed("2026-W47", [row["id"] for row in rows[:5]]))
        self.assertNotEqual(first, showcase_seed("2026-W48", [row["id"] for row in rows[:5]]))
        self.assertTrue(0 < first < 0x7FFFFFFF)
        rows[4]["id"] = rows[0]["id"]
        with self.assertRaisesRegex(ValueError, "duplicate"):
            select_finalists(self.report)

    def test_native_showcase_matches_fast_battle_and_records_animated_gif(self):
        original = deepcopy(self.report)
        result = generate_showcase(self.report, self.output, BINARY, max_frames=12)
        self.assertEqual(self.report, original, "An exhibition must not change the league's rating evidence")
        self.assertEqual(result["status"], "completed")
        self.assertTrue(result["exhibition_only"])
        self.assertEqual(result["order"], [row["id"] for row in original["modes"]["5"]["standings"][:5]])
        self.assertLessEqual(result["frame_count"], 12)
        self.assertLess(result["gif_bytes"], MAX_GIF_BYTES)
        replay = json.loads((self.output / "showcase.json").read_text())
        expected = run_native(self.request(result["order"], result["tick_limit"], result["seed"]), BINARY)
        self.assertEqual(replay["final_state"], expected)
        self.assertEqual(replay["frames"][0]["tick"], 0)
        self.assertEqual(replay["frames"][-1]["tick"], expected["tick"])
        self.assertTrue(replay["frames"][-1]["done"])
        self.assertFalse(expected["robots"][0]["active"])
        self.assertIsNone(result["winner"])
        with Image.open(self.output / "showcase.gif") as gif:
            self.assertEqual(gif.format, "GIF")
            self.assertTrue(gif.is_animated)
            self.assertEqual(gif.n_frames, result["frame_count"])
            self.assertEqual(gif.size, (768, 782))
            gif.seek(gif.n_frames - 1)
            self.assertEqual(gif.info["duration"], 2400)
            self.assertGreater(len(gif.convert("L").getcolors()), 2)

    def test_sampling_covers_complete_battle_when_interval_exceeds_native_step_limit(self):
        order = [row["id"] for row in self.report["modes"]["5"]["standings"][:5]]
        request = self.request(order, 1001, 12345)
        frames, final, interval = capture(request, BINARY, max_frames=6)
        self.assertGreater(interval, 100)
        self.assertEqual(final, run_native(request, BINARY))
        self.assertEqual(final["tick"], 1001)
        self.assertEqual(len(frames), 6)
        self.assertEqual([frame["tick"] for frame in frames], [0, 201, 402, 603, 804, 1001])

    def test_fewer_than_five_skips_and_removes_previous_gif(self):
        (self.output / "showcase.gif").write_bytes(b"OLD GIF")
        self.report["modes"]["5"]["standings"] = self.report["modes"]["5"]["standings"][:4]
        result = generate_showcase(self.report, self.output, BINARY)
        self.assertEqual(result["status"], "skipped")
        self.assertIn("Fewer than five", result["reason"])
        self.assertFalse((self.output / "showcase.gif").exists())
        self.assertEqual(json.loads((self.output / "showcase.json").read_text()), result)

    def test_changed_sources_or_engine_are_rejected_without_stale_output(self):
        first = self.directory / "robot-0.bot"
        first.write_text(IDLE)
        (self.output / "showcase.gif").write_bytes(b"OLD GIF")
        with self.assertRaisesRegex(ValueError, "source changed"):
            generate_showcase(self.report, self.output, BINARY)
        self.assertFalse((self.output / "showcase.gif").exists())
        self.report["engine_sha256"] = "wrong"
        with self.assertRaisesRegex(ValueError, "binary differs"):
            generate_showcase(self.report, self.output, BINARY)

    def test_failed_league_and_unsafe_output_are_rejected(self):
        self.report["status"] = "failed"
        with self.assertRaisesRegex(ValueError, "completed"):
            generate_showcase(self.report, self.output, BINARY)
        with self.assertRaisesRegex(ValueError, "sources"):
            generate_showcase(self.report, self.directory, BINARY)
        self.assertEqual((self.directory / "robot-0.bot").read_text(), SELF_SHOOTER)

    def test_oversized_gif_is_rejected_and_temporary_file_removed(self):
        with patch("league_showcase.MAX_GIF_BYTES", 1):
            with self.assertRaisesRegex(RuntimeError, "exceeds"):
                generate_showcase(self.report, self.output, BINARY, max_frames=3)
        self.assertFalse((self.output / "showcase.gif").exists())
        self.assertFalse((self.output / ".showcase.gif.tmp").exists())

    def test_persistent_process_is_closed_after_rejected_request(self):
        with self.assertRaisesRegex(RuntimeError, "rejected"):
            with NativeSession(BINARY) as session:
                session.request({"kind": "not-an-operation"})
        self.assertIsNotNone(session.process.poll())


def main():
    global BINARY
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary", type=Path, default=BINARY)
    args, remaining = parser.parse_known_args()
    BINARY = args.binary.resolve()
    unittest.main(argv=[__file__, *remaining], verbosity=2)


if __name__ == "__main__":
    main()
