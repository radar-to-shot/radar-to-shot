#!/usr/bin/env python3
"""Benchmark reproducibility, honest survival scoring, and native replay records."""
import argparse
from collections import Counter
from contextlib import redirect_stderr
import io
import itertools
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
BINARY = ROOT / "build/robotwar"
sys.path.insert(0, str(ROOT / "tools"))
from robot_benchmark import CANDIDATE, NativeSession, main as benchmark_main, make_schedule, run_benchmark, seed_list, summarize

IDLE = "loop\ngoto loop\n"
SELF_SHOOTER = "FIRE_RATE 4\nloop\n0 to shot\ngoto loop\n"


class ScheduleTests(unittest.TestCase):
    def test_small_fields_are_exhaustive_with_every_candidate_seat(self):
        ids = ["a", "b", "c", "d"]
        games = make_schedule(ids, [1], groups_per_size=16)
        for size in (2, 3, 4, 5):
            matches = [game for game in games if game["size"] == size]
            groups = Counter(tuple(sorted(set(game["order"]) - {CANDIDATE})) for game in matches)
            self.assertEqual(set(groups), set(itertools.combinations(ids, size - 1)))
            self.assertEqual(set(groups.values()), {size})
            for group in groups:
                seats = [game["order"].index(CANDIDATE) for game in matches
                         if set(game["order"]) - {CANDIDATE} == set(group)]
                self.assertEqual(sorted(seats), list(range(size)))

    def test_sampling_is_reproducible_and_duels_always_cover_field(self):
        ids = [str(i) for i in range(30)]
        first = make_schedule(ids, [1], groups_per_size=3)
        self.assertEqual(first, make_schedule(ids[::-1], [1], groups_per_size=3))
        self.assertEqual(sum(game["size"] == 2 for game in first), 60)
        for size in (3, 4, 5):
            matches = [game for game in first if game["size"] == size]
            self.assertEqual(len(matches), 3 * size)
            self.assertEqual(len({tuple(sorted(game["order"])) for game in matches}), 3)

    def test_explicit_seed_inputs_and_duplicate_rejection(self):
        self.assertEqual(seed_list("1"), [1])
        self.assertEqual(seed_list("[1]"), [1])
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "seeds.json"
            path.write_text("[1]")
            self.assertEqual(seed_list(str(path)), [1])
        for text in ("1,1", "[true]", "[]"):
            with self.assertRaises(ValueError):
                seed_list(text)

    def test_work_budget_and_invalid_configuration_fail_before_running(self):
        with self.assertRaisesRegex(ValueError, "exceeds"):
            make_schedule([str(i) for i in range(51_000)], [1], sizes=[2])
        for options in ({"groups_per_size": 1.5}, {"sizes": [1]}, {"seeds": [1, 1]}):
            with self.assertRaises(ValueError):
                make_schedule(["a"], **{"seeds": [1], **options})


class StatisticsTests(unittest.TestCase):
    def test_surviving_draw_is_not_a_win_and_ties_have_midrank(self):
        game = {"order": [CANDIDATE, "a", "b"], "ranks": [1, 1, 3],
                "tick": 20, "death_ticks": [None, None, 10], "winner": None,
                "survived": [True, True, False], "final_damage": [3, 4, 10],
                "cpu_resets": [2, 0, 0]}
        result = summarize([game])
        self.assertEqual((result["wins"], result["draws"], result["losses"]), (0, 1, 0))
        self.assertEqual(result["average_place"], 1.5)
        self.assertEqual(result["pairwise_survival_score"], 0.75)
        self.assertEqual(result["survivals"], 1)
        self.assertEqual(result["cpu_resets"], 2)


class NativeTests(unittest.TestCase):
    def test_parallel_native_runs_reproduce_replay_records_and_exclude_candidate(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            candidate = root / "candidate.rw"
            candidate.write_text(IDLE)
            (root / "self-shooter.rw").write_text(SELF_SHOOTER)
            options = dict(candidate=candidate, opponents_dir=root, seeds=[1],
                           sizes=[2], ticks=100, max_seconds=30, binary=BINARY)
            serial = run_benchmark(**options, workers=1)
            parallel = run_benchmark(**options, workers=2)
            self.assertEqual(serial["engine"]["path"], str(BINARY.resolve()))
            self.assertEqual(serial["games"], parallel["games"])
            self.assertEqual(serial["schedule_sha256"], parallel["schedule_sha256"])
            self.assertEqual(serial["modes"]["2"]["wins"], 2)
            self.assertEqual(serial["modes"]["2"]["cpu_resets"], 0)
            self.assertEqual(len(serial["entrants"]), 2)
            for game in serial["games"]:
                self.assertEqual(len(game["state_sha256"]), 64)
                self.assertEqual(game["winner"], CANDIDATE)
                self.assertEqual(game["ranks"][game["order"].index(CANDIDATE)], 1)
            # A different file name and identical source still use the same slot,
            # schedule, and engine names when the opponent field is frozen.
            replacement = root.parent / (root.name + "-replacement.rw")
            try:
                candidate.rename(replacement)
                renamed = run_benchmark(**{**options, "candidate": replacement}, workers=1)
                self.assertEqual(serial["schedule_sha256"], renamed["schedule_sha256"])
                self.assertEqual(serial["games"], renamed["games"])
            finally:
                replacement.unlink(missing_ok=True)


class CommandTests(unittest.TestCase):
    def test_malformed_engine_state_replaces_stale_success(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            candidate = root / "candidate.rw"
            candidate.write_text(IDLE)
            opponents = root / "opponents"
            opponents.mkdir()
            (opponents / "opponent.rw").write_text(IDLE)
            engine = root / "malformed-engine"
            output = root / "result.json"
            for state in ({}, {"robots": None}):
                with self.subTest(state=state):
                    engine.write_text(f"#!{sys.executable}\nimport sys\n"
                                      f"for line in sys.stdin:\n    print({json.dumps(state)!r}, flush=True)\n")
                    engine.chmod(0o700)
                    output.write_text('{"status":"completed"}')
                    with redirect_stderr(io.StringIO()) as errors:
                        status = benchmark_main([
                            "--candidate", str(candidate), "--opponents-dir", str(opponents),
                            "--binary", str(engine), "--seed-list", "1", "--workers", "1",
                            "--sizes", "2", "--output", str(output)])
                    self.assertEqual(status, 1)
                    self.assertIn("malformed battle state", errors.getvalue())
                    report = json.loads(output.read_text())
                    self.assertEqual(report["status"], "failed")
                    self.assertIn("malformed battle state", report["error"])

    def test_failed_rerun_replaces_stale_success_without_overwriting_inputs(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            candidate = root / "candidate.rw"
            candidate.write_text(IDLE)
            output = root / "result.json"
            output.write_text('{"status":"completed"}')
            options = ["--candidate", str(candidate), "--opponents-dir", str(root / "opponents"),
                       "--binary", str(BINARY), "--seed-list", "1"]
            with patch("robot_benchmark.run_benchmark", side_effect=RuntimeError("invalid program")), redirect_stderr(io.StringIO()):
                self.assertEqual(benchmark_main([*options, "--output", str(output)]), 1)
                self.assertEqual(benchmark_main([*options, "--output", str(candidate)]), 1)
            self.assertEqual(json.loads(output.read_text())["status"], "failed")
            self.assertEqual(candidate.read_text(), IDLE)


class SessionTests(unittest.TestCase):
    def test_unresponsive_engine_times_out_and_is_reaped(self):
        with tempfile.TemporaryDirectory() as directory:
            engine = Path(directory) / "hung-engine"
            engine.write_text(f"#!{sys.executable}\nimport time\ntime.sleep(10)\n")
            engine.chmod(0o700)
            with self.assertRaises(TimeoutError):
                with NativeSession(engine, timeout=0.05) as session:
                    session.request({"kind": "battle", "seed": 1})
            self.assertIsNotNone(session.process.poll())
            self.assertTrue(session.process.stdin.closed)
            self.assertTrue(session.process.stdout.closed)


def main():
    global BINARY
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary", type=Path, default=BINARY)
    args, remainder = parser.parse_known_args()
    BINARY = args.binary.resolve()
    unittest.main(argv=[sys.argv[0], *remainder], verbosity=2)


if __name__ == "__main__":
    main()
