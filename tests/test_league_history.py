#!/usr/bin/env python3
"""Weekly identity continuity, author scoring, archive validation and trends."""
from __future__ import annotations

from copy import deepcopy
import json
from pathlib import Path
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from league_history import enrich_history, load_snapshots, make_snapshot, validate_snapshot, write_snapshot


def robot(identity, author_id, rating, *, version="1.0.0", path=None, name=None, author=None):
    return {"id": path or f"{identity}.bot", "robot_id": identity,
            "robot_name": name or identity.rsplit("/", 1)[-1], "author_id": author_id,
            "author": author or author_id or "Unattributed", "version": version,
            "rating": rating, "games": 40, "wins": 12, "draws": 8, "losses": 20,
            "win_rate": 0.3, "survival_rate": 0.5, "average_place": 2.0,
            "source_sha256": "a" * 64}


def report(week, rows):
    rows = sorted(deepcopy(rows), key=lambda row: (-row["rating"], row["id"]))
    last, rank = None, 0
    for index, row in enumerate(rows, 1):
        if row["rating"] != last:
            rank = index
        row["rank"], last = rank, row["rating"]
    return {"status": "completed", "week": week, "revision": "a" * 40,
            "overall": rows, "modes": {"2": {"standings": deepcopy(rows)}}}


class HistoryTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.directory = Path(self.temporary.name)

    def tearDown(self):
        self.temporary.cleanup()

    def save(self, value):
        write_snapshot(value, self.directory / "weeks" / f"{value['week']}.json")

    def test_initial_week_has_no_fabricated_history_or_deltas(self):
        value = report("2026-W46", [robot("ada/alpha", "ada", 1700), robot("bob/beta", "bob", 1300)])
        self.assertIs(enrich_history(value), value)
        self.assertEqual(value["history"]["weeks"], 1)
        self.assertIsNone(value["history"]["previous_week"])
        self.assertEqual([row["points"] for row in value["history"]["authors"]], [100, 0])
        self.assertTrue(all(row["rank_change"] is None for row in value["overall"] + value["authors"]))

    def test_author_score_uses_best_robot_but_statistics_count_all_entries(self):
        value = report("2026-W46", [robot("ada/alpha", "ada", 1700), robot("ada/other", "ada", 900),
                                   robot("bob/beta", "bob", 1600)])
        enrich_history(value)
        author = value["authors"][0]
        self.assertEqual((author["author_id"], author["rating"], author["robots"]), ("ada", 1700, 2))
        self.assertEqual((author["games"], author["wins"], author["draws"], author["losses"]), (80, 24, 16, 40))
        self.assertEqual(author["win_rate"], 0.3)
        self.assertEqual(author["best_robot_id"], "ada/alpha")

    def test_identity_survives_path_name_author_label_and_version_changes(self):
        first = report("2026-W46", [robot("ada/alpha", "ada", 1400), robot("bob/beta", "bob", 1600)])
        self.save(first)
        second = report("2026-W47", [robot("ada/alpha", "ada", 1800, path="renamed/new.bot",
                                          name="Alpha II", author="Ada Lovelace", version="2.0.0"),
                                    robot("bob/beta", "bob", 1200)])
        enrich_history(second, self.directory)
        alpha = second["overall"][0]
        self.assertEqual((alpha["rank_change"], alpha["rating_change"]), (1, 400))
        self.assertEqual(alpha["previous_version"], "1.0.0")
        self.assertEqual(second["authors"][0]["rank_change"], 1)
        self.assertEqual(second["modes"]["2"]["standings"][0]["rating_change"], 400)
        self.assertEqual(second["modes"]["2"]["standings"][0]["previous_version"], "1.0.0")
        self.assertEqual(second["history"]["weeks"], 2)
        historical = next(row for row in second["history"]["robots"] if row["robot_id"] == "ada/alpha")
        self.assertEqual((historical["robot_name"], historical["version"], historical["author"]),
                         ("Alpha II", "2.0.0", "Ada Lovelace"))
        self.assertEqual((historical["weeks"], historical["points"], historical["weekly_wins"]), (2, 100, 1))

    def test_rerun_replaces_current_week_without_double_counting(self):
        first = report("2026-W46", [robot("ada/alpha", "ada", 1700), robot("bob/beta", "bob", 1300)])
        self.save(first)
        original = report("2026-W47", [robot("ada/alpha", "ada", 1700), robot("bob/beta", "bob", 1300)])
        self.save(original)
        rerun = report("2026-W47", [robot("ada/alpha", "ada", 1300), robot("bob/beta", "bob", 1700)])
        enrich_history(rerun, self.directory)
        self.assertEqual(rerun["history"]["weeks"], 2)
        self.assertEqual({row["points"] for row in rerun["history"]["authors"]}, {100})
        self.assertEqual({row["rank"] for row in rerun["history"]["authors"]}, {1})
        self.assertEqual(rerun["overall"][0]["rank_change"], 1)
        self.save(rerun)
        before = deepcopy(rerun)
        enrich_history(rerun, self.directory)
        self.assertEqual(before, rerun)

    def test_ties_use_midranks_and_single_author_gets_neutral_points(self):
        tied = report("2026-W46", [robot("ada/alpha", "ada", 1600), robot("bob/beta", "bob", 1600),
                                  robot("cy/gamma", "cy", 1200)])
        enrich_history(tied)
        self.assertEqual([row["points"] for row in tied["history"]["robots"]], [75, 75, 0])
        all_tied = report("2026-W46", [robot("ada/a", "ada", 1500), robot("ada/b", "ada", 1500)])
        enrich_history(all_tied)
        self.assertEqual([row["points"] for row in all_tied["history"]["robots"]], [50, 50])
        self.assertEqual(all_tied["history"]["authors"][0]["points"], 50)

    def test_unattributed_robots_do_not_form_an_invented_author(self):
        value = report("2026-W46", [robot("legacy:sample-a", None, 1600), robot("legacy:sample-b", None, 1400)])
        enrich_history(value)
        self.assertEqual(value["authors"], [])
        self.assertEqual(value["history"]["authors"], [])
        self.assertEqual(len(value["history"]["robots"]), 2)

    def test_future_weeks_are_excluded_and_missing_previous_entry_has_no_delta(self):
        self.save(report("2026-W46", [robot("ada/alpha", "ada", 1600), robot("bob/beta", "bob", 1400)]))
        self.save(report("2026-W48", [robot("new/future", "new", 1600), robot("bob/beta", "bob", 1400)]))
        value = report("2026-W47", [robot("cy/gamma", "cy", 1700), robot("bob/beta", "bob", 1300)])
        enrich_history(value, self.directory)
        self.assertEqual((value["history"]["weeks"], value["history"]["previous_week"]), (2, "2026-W46"))
        self.assertNotIn("new/future", {row["robot_id"] for row in value["history"]["robots"]})
        self.assertIsNone(value["overall"][0]["rank_change"])
        absent = next(row for row in value["history"]["robots"] if row["robot_id"] == "ada/alpha")
        self.assertFalse(absent["active"])
        self.assertEqual(absent["last_seen"], "2026-W46")

    def test_prior_recorded_week_is_used_across_calendar_gaps(self):
        self.save(report("2020-W53", [robot("ada/a", "ada", 1400), robot("bob/b", "bob", 1600)]))
        value = report("2021-W02", [robot("ada/a", "ada", 1700), robot("bob/b", "bob", 1300)])
        enrich_history(value, self.directory)
        self.assertEqual(value["history"]["previous_week"], "2020-W53")
        self.assertEqual(value["overall"][0]["rating_change"], 300)

    def test_duplicate_robot_identity_or_invalid_week_is_rejected(self):
        duplicated = report("2026-W46", [robot("ada/a", "ada", 1600), robot("ada/a", "ada", 1400, path="v2.bot")])
        with self.assertRaisesRegex(ValueError, "Duplicate history robot_id"):
            enrich_history(duplicated)
        for week in ("2021-W53", "2026-W00", "../../escape", "2026-W1"):
            with self.assertRaises(ValueError):
                enrich_history(report(week, [robot("ada/a", "ada", 1500)]))

    def test_corrupted_history_fails_instead_of_silently_bootstrapping(self):
        value = report("2026-W46", [robot("ada/a", "ada", 1600), robot("bob/b", "bob", 1400)])
        self.save(value)
        path = self.directory / "weeks/2026-W46.json"
        valid = json.loads(path.read_text())
        corruptions = []
        wrong_week = deepcopy(valid); wrong_week["week"] = "2026-W47"; corruptions.append(wrong_week)
        wrong_authors = deepcopy(valid); wrong_authors["authors"][0]["rating"] = 9999; corruptions.append(wrong_authors)
        wrong_rank = deepcopy(valid); wrong_rank["robots"][0]["rank"] = 2; corruptions.append(wrong_rank)
        missing_name = deepcopy(valid); del missing_name["robots"][0]["robot_name"]; corruptions.append(missing_name)
        wrong_rate = deepcopy(valid); wrong_rate["robots"][0]["win_rate"] = 1; corruptions.append(wrong_rate)
        for corruption in corruptions:
            path.write_text(json.dumps(corruption))
            with self.assertRaisesRegex(ValueError, "Invalid weekly history"):
                enrich_history(value, self.directory)
        path.write_text('{"schema_version":1,"schema_version":1}')
        with self.assertRaisesRegex(ValueError, "Duplicate JSON key"):
            load_snapshots(self.directory)

    def test_symlinks_and_unsafe_snapshot_names_are_rejected(self):
        weeks = self.directory / "weeks"
        weeks.mkdir()
        outside = self.directory / "outside.json"
        outside.write_text("{}")
        (weeks / "2026-W46.json").symlink_to(outside)
        with self.assertRaises(ValueError):
            load_snapshots(self.directory)
        (weeks / "2026-W46.json").unlink()
        (weeks / "not-a-week.json").write_text("{}")
        with self.assertRaises(ValueError):
            load_snapshots(self.directory)
        with self.assertRaises(ValueError):
            write_snapshot(report("2026-W46", [robot("ada/a", "ada", 1500)]), self.directory / "bad.txt")

    def test_failed_league_and_nonfinite_ratings_never_enter_history(self):
        with self.assertRaises(ValueError):
            enrich_history({"status": "failed", "overall": []})
        for rating in (float("nan"), float("inf"), True, 10 ** 400):
            with self.assertRaises(ValueError):
                enrich_history(report("2026-W46", [robot("ada/a", "ada", rating)]))

    def test_public_validator_handles_staged_snapshot_and_rejects_wrong_week(self):
        value = report("2026-W46", [robot("ada/a", "ada", 1500)])
        staged = self.directory / "history-week.json"
        write_snapshot(value, staged)
        snapshot = json.loads(staged.read_text())
        self.assertEqual(validate_snapshot(snapshot), snapshot)
        self.assertEqual(make_snapshot(value), snapshot)
        with self.assertRaises(ValueError):
            validate_snapshot(snapshot, "2026-W47")
        snapshot["schema_version"] = True
        with self.assertRaises(ValueError):
            validate_snapshot(snapshot)


if __name__ == "__main__":
    unittest.main(verbosity=2)
