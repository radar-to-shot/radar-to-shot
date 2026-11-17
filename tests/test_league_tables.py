#!/usr/bin/env python3
"""Table attachment coverage, layout budgets, and metadata edge cases."""
from __future__ import annotations

from copy import deepcopy
import hashlib
from pathlib import Path
import re
import sys
import tempfile
import unittest
from unittest.mock import patch

from PIL import Image, ImageChops

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from league_tables import MAX_PNG_BYTES, PANELS, WIDTH, render_tables
import league_tables


def example_report():
    robots = [{"id": f"team/robot-{index}.bot", "robot_name": f"Vector Sentinel {index}",
               "author": f"Author {index}", "version": "2.1.0", "rank": index + 1,
               "rating": 2035.3 - index * 41.6, "games": 448, "wins": 110 - index,
               "draws": 98, "losses": 240 + index, "win_rate": (110 - index) / 448,
               "survival_rate": 0.65, "average_place": 1.67, "rank_change": 2 - index,
               "rating_change": 12.8, "provisional": index == 9}
              for index in range(13)]
    authors = [{"author_id": f"author-{index}", "author": f"Author {index}",
                "rank": index + 1, "rating": 2035.3 - index * 41.6, "robots": 2,
                "games": 896, "wins": 220 - index, "win_rate": (220 - index) / 896,
                "rank_change": index - 3, "rating_change": -12.8}
               for index in range(12)]
    history_robots = [{"robot_id": f"author-{index}/robot-{index}",
                       "robot_name": f"Vector Sentinel {index}", "author": f"Author {index}",
                       "version": "2.1.0", "rank": index + 1, "points": 250 - index * 7.2,
                       "weeks": 8, "weekly_wins": 3, "best_rank": 1, "last_seen": "2026-W47"}
                      for index in range(12)]
    history_authors = [{"author_id": f"author-{index}", "author": f"Author {index}",
                        "rank": index + 1, "points": 250 - index * 7.2, "weeks": 8,
                        "weekly_wins": 3, "best_rank": 1, "last_seen": "2026-W47"}
                       for index in range(12)]
    return {"status": "completed", "week": "2026-W47", "battle_count": 1560,
            "overall": robots, "authors": authors,
            "modes": {str(size): {"standings": deepcopy(robots)} for size in range(2, 6)},
            "history": {"weeks": 8, "authors": history_authors, "robots": history_robots}}


class TableTests(unittest.TestCase):
    def test_fixed_headers_and_numeric_stats_are_not_ellipsized(self):
        original = league_tables._fit
        headings = {"#", "Rating", "Best rating", "Δ rank", "Games", "Win %", "Alive %",
                    "Avg place", "W–D–L", "Robots", "Wins", "Win", "Alive", "Points",
                    "Weeks", "#1 weeks", "Best rank", "Last seen"}
        def verify(draw, value, font, width):
            result = original(draw, value, font, width)
            text = str(value)
            if text in headings or re.fullmatch(r"[↑↓]?[\d,.%k–]+", text):
                self.assertEqual(result, text, f"Clipped statistic or heading: {text}")
            return result
        with tempfile.TemporaryDirectory() as directory, patch.object(league_tables, "_fit", verify):
            render_tables(example_report(), Path(directory))

    def test_three_nonblank_table_panels_fit_attachment_budget(self):
        report = example_report()
        before = deepcopy(report)
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory)
            attachments = render_tables(report, output)
            self.assertEqual([item["filename"] for item in attachments], [item[0] for item in PANELS])
            self.assertTrue(all(item["title"] and item["description"] for item in attachments))
            total = 0
            for item in attachments:
                path = output / item["filename"]
                total += path.stat().st_size
                with Image.open(path) as image:
                    self.assertEqual(image.format, "PNG")
                    self.assertEqual(image.width, WIDTH)
                    self.assertGreater(image.height, 1000)
                    self.assertLess(image.height, 2000)
                    flat = Image.new("RGB", image.size, image.getpixel((0, 0)))
                    self.assertIsNotNone(ImageChops.difference(image.convert("RGB"), flat).getbbox())
                    red, green, blue = image.convert("RGB").split()
                    self.assertIsNone(ImageChops.difference(red, green).getbbox(), "Classic tables must remain monochrome")
                    self.assertIsNone(ImageChops.difference(green, blue).getbbox(), "Classic tables must remain monochrome")
            self.assertLessEqual(total, MAX_PNG_BYTES)
            self.assertEqual(report, before, "Rendering must not mutate the league report")

    def test_rendering_is_reproducible_and_full_unshown_rows_do_not_change_images(self):
        report = example_report()
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory)
            def hashes():
                return [hashlib.sha256((output / name).read_bytes()).hexdigest() for name, _, _ in PANELS]
            render_tables(report, output)
            first = hashes()
            report["overall"][-1]["robot_name"] = "This row is outside the top ten"
            for mode in report["modes"].values():
                mode["standings"][-1]["robot_name"] = "Also outside the top ten"
            render_tables(report, output)
            self.assertEqual(first, hashes())

    def test_legacy_reports_missing_metadata_and_stats_still_render(self):
        report = {"status": "completed", "week": "2026-W47", "battle_count": 32,
                  "overall": [{"id": "examples/Chicken", "rank": 1, "rating": 1500, "games": 32}],
                  "modes": {"2": {"standings": [{"id": "examples/Chicken", "rank": 1, "rating": 1500}]}}}
        with tempfile.TemporaryDirectory() as directory:
            attachments = render_tables(report, Path(directory))
            self.assertEqual(len(attachments), 3)
            for item in attachments:
                with Image.open(Path(directory) / item["filename"]) as image:
                    self.assertGreater(image.height, 400)

    def test_long_unicode_and_control_labels_cannot_break_layout(self):
        report = example_report()
        hostile = "@everyone\n```<img>\u202e\x00" + "漢字 Éowyn Ελληνικά 🚀 " * 100
        for row in report["overall"]:
            row.update(robot_name=hostile, author=hostile, version=hostile)
        for mode in report["modes"].values():
            for row in mode["standings"]:
                row.update(robot_name=hostile, author=hostile, version=hostile)
        for row in report["authors"] + report["history"]["authors"]:
            row["author"] = hostile
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory)
            attachments = render_tables(report, output)
            self.assertLessEqual(sum((output / item["filename"]).stat().st_size for item in attachments), MAX_PNG_BYTES)

    def test_failed_report_removes_stale_panels(self):
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory)
            for name, _, _ in PANELS:
                (output / name).write_bytes(b"stale winner")
            with self.assertRaises(ValueError):
                render_tables({"status": "failed"}, output)
            self.assertTrue(all(not (output / name).exists() for name, _, _ in PANELS))


if __name__ == "__main__":
    unittest.main(verbosity=2)
