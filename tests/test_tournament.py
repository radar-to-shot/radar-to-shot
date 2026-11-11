#!/usr/bin/env python3
"""Tournament scheduling, fairness, failure handling and native CLI integration.

The suite uses injected deterministic battles for statistical and scheduling
properties, plus a small tournament against the real native executable.
Run: python tests/test_tournament.py --binary build/robotwar
"""
from __future__ import annotations

import argparse
from collections import Counter, defaultdict
import itertools
import json
import math
from pathlib import Path
import subprocess
import sys
import tempfile
import threading
import time
import unittest

ROOT = Path(__file__).resolve().parents[1]
RUNNER = ROOT / "scripts/run_tournament.py"
BINARY = ROOT / "build/robotwar"
IDLE = "loop\rgoto loop\r"
SELF_SHOOTER = "FIRE_RATE 4\rloop\r0 to shot\rgoto loop\r"
sys.path.insert(0, str(ROOT / "tools"))
from tournament import TournamentConfig, TournamentError, run_tournament
from tournament_format import TournamentFormat


def pair_key(a, b):
    return tuple(sorted((a, b)))


def brute_minimum_repeats(players, seen):
    """Independent exhaustive perfect matching oracle, used only for N <= 8."""
    if not players:
        return 0
    first = players[0]
    return min(
        int(pair_key(first, partner) in seen)
        + brute_minimum_repeats(players[1:index] + players[index + 1:], seen)
        for index, partner in enumerate(players[1:], 1)
    )


def record_draw_round(tournament, round_info):
    for a, b in round_info["pairs"]:
        tournament.record_pair(a, b, 6, 6, 0, 0, 6)
    tournament.finish_round()


class FormatTests(unittest.TestCase):
    def make(self, count, **kwargs):
        return TournamentFormat([f"robot-{i:03}" for i in range(count)],
                                seed=kwargs.pop("seed", 7), games_per_pair=6, **kwargs)

    def test_round_robin_visits_every_pair_once_for_odd_and_even_fields(self):
        for count in (2, 3, 4, 5, 8):
            with self.subTest(count=count):
                tournament = self.make(count, format="round-robin")
                pairs, byes, rounds = [], Counter(), 0
                while (round_info := tournament.next_round()) is not None:
                    rounds += 1
                    participants = list(itertools.chain.from_iterable(round_info["pairs"]))
                    self.assertEqual(len(participants), len(set(participants)))
                    self.assertEqual(len(round_info["pairs"]), count // 2)
                    if round_info["bye"] is not None:
                        self.assertNotIn(round_info["bye"], participants)
                        byes[round_info["bye"]] += 1
                    pairs.extend(pair_key(a, b) for a, b in round_info["pairs"])
                    record_draw_round(tournament, round_info)
                self.assertEqual(rounds, count - 1 if count % 2 == 0 else count)
                self.assertEqual(len(pairs), count * (count - 1) // 2)
                self.assertEqual(len(set(pairs)), len(pairs))
                if count % 2:
                    self.assertEqual(set(byes.values()), {1})
                self.assertEqual(set(tournament.champions()), {f"robot-{i:03}" for i in range(count)})
                self.assertEqual({row["rank"] for row in tournament.standings()}, {1})

    def test_auto_format_switches_at_sixteen_robots(self):
        self.assertEqual(self.make(16, format="auto").format, "round-robin")
        larger = self.make(17, format="auto")
        self.assertEqual(larger.format, "swiss")
        self.assertEqual(larger.rounds, 11)

    def test_swiss_matching_has_minimum_possible_repeats(self):
        # Compare each round to a separate exhaustive matching implementation,
        # including late rounds where greedy pairing can get stuck.
        for count in (4, 5, 6, 7, 8):
            with self.subTest(count=count):
                tournament = self.make(count, format="swiss", rounds=count - 1)
                seen = set()
                while (round_info := tournament.next_round()) is not None:
                    players = sorted(set(itertools.chain.from_iterable(round_info["pairs"])))
                    self.assertEqual(len(players), count - (count % 2))
                    minimum = brute_minimum_repeats(players, seen)
                    repeats = sum(pair_key(a, b) in seen for a, b in round_info["pairs"])
                    self.assertEqual(repeats, minimum)
                    self.assertEqual(round_info["minimum_repeats"], minimum)
                    self.assertEqual({pair_key(a, b) for a, b in round_info["repeat_pairs"]},
                                     {pair_key(a, b) for a, b in round_info["pairs"]
                                      if pair_key(a, b) in seen})
                    for index, (a, b) in enumerate(round_info["pairs"]):
                        # Uneven outcomes change score groups before the next round.
                        if index % 2:
                            tournament.record_pair(a, b, 10, 2, 5, 1, 0)
                        else:
                            tournament.record_pair(a, b, 6, 6, 0, 0, 6)
                        seen.add(pair_key(a, b))
                    tournament.finish_round()

    def test_swiss_early_rounds_avoid_repeats(self):
        tournament = self.make(8, format="swiss", rounds=4)
        seen = set()
        while (round_info := tournament.next_round()) is not None:
            self.assertEqual(round_info["minimum_repeats"], 0)
            for a, b in round_info["pairs"]:
                self.assertNotIn(pair_key(a, b), seen)
                seen.add(pair_key(a, b))
            record_draw_round(tournament, round_info)
        self.assertEqual(len(seen), 16)

    def test_swiss_bye_is_neutral_and_is_not_a_win(self):
        tournament = self.make(5, format="swiss", rounds=2)
        round_info = tournament.next_round()
        bye = round_info["bye"]
        self.assertIsNotNone(bye)
        record_draw_round(tournament, round_info)
        row = next(row for row in tournament.standings() if row["id"] == bye)
        self.assertEqual(row["byes"], 1)
        self.assertEqual(row["points_twice"], 6)
        self.assertEqual(row["played_games"], 0)
        for field in ("wins", "draws", "losses"):
            self.assertEqual(row[field], 0)
        self.assertFalse(row["opponents"])
        second = tournament.next_round()
        record_draw_round(tournament, second)
        self.assertTrue(all(row["played_games"] > 0 for row in tournament.standings()))

    def test_odd_swiss_needs_two_rounds_so_every_robot_plays(self):
        for count in (3, 5, 17):
            with self.subTest(count=count), self.assertRaises(ValueError):
                self.make(count, format="swiss", rounds=1)
        even = self.make(4, format="swiss", rounds=1)
        self.assertEqual(even.rounds, 1)

    def test_three_robot_two_round_draws_share_first_place(self):
        tournament = self.make(3, format="swiss", rounds=2)
        while (round_info := tournament.next_round()) is not None:
            record_draw_round(tournament, round_info)
        standings = tournament.standings()
        self.assertTrue(all(row["played_games"] > 0 for row in standings))
        self.assertEqual({row["rank"] for row in standings}, {1})
        self.assertEqual(set(tournament.champions()), {"robot-000", "robot-001", "robot-002"})

    def test_exact_ties_produce_joint_winners_without_seed_tiebreak(self):
        champions = []
        for seed in (0, 1, 0xFFFFFFFF):
            tournament = self.make(4, seed=seed, format="round-robin")
            while (round_info := tournament.next_round()) is not None:
                record_draw_round(tournament, round_info)
            champions.append(set(tournament.champions()))
            self.assertEqual({row["rank"] for row in tournament.standings()}, {1})
        self.assertTrue(all(winners == champions[0] for winners in champions))
        self.assertEqual(len(champions[0]), 4)

    def test_majority_of_seed_block_results_beats_one_outlier(self):
        tournament = TournamentFormat(["A", "B"], seed=1, games_per_pair=6,
                                      format="round-robin")
        round_info = tournament.next_round()
        a, b = round_info["pairs"][0]
        # Two games per seed: A wins two blocks and loses the outlier block.
        scores = {"A": (8, 4), "B": (4, 2)}
        tournament.record_pair(a, b, scores[a][0], scores[b][0],
                               scores[a][1], scores[b][1], 0)
        tournament.finish_round()
        self.assertEqual(tournament.champions(), ["A"])

    def test_swiss_determinism_and_512_robot_scale(self):
        def schedule(count, seed):
            tournament = self.make(count, seed=seed, format="swiss")
            rounds = []
            while (round_info := tournament.next_round()) is not None:
                rounds.append(round_info)
                record_draw_round(tournament, round_info)
            return rounds

        self.assertEqual(schedule(12, 123), schedule(12, 123))
        started = time.monotonic()
        rounds = schedule(512, 123)
        elapsed = time.monotonic() - started
        self.assertEqual(len(rounds), min(511, 2 * math.ceil(math.log2(512)) + 1))
        pair_count = sum(len(round_info["pairs"]) for round_info in rounds)
        self.assertEqual(pair_count * 6, 29184)
        self.assertLess(pair_count * 6, 100000)
        # A broad bound catches accidental factorial scheduling without timing
        # normal interpreter/CI variance too tightly.
        self.assertLess(elapsed, 30, f"512-robot scheduling took {elapsed:.2f}s")


class TournamentTests(unittest.TestCase):
    def setUp(self):
        self.robots_temp = tempfile.TemporaryDirectory(prefix="test-tournament-", dir=ROOT / "robots")
        self.output_temp = tempfile.TemporaryDirectory(prefix="robotwar-tournament-")
        self.addCleanup(self.robots_temp.cleanup)
        self.addCleanup(self.output_temp.cleanup)
        self.robots = Path(self.robots_temp.name)
        self.outputs = Path(self.output_temp.name)
        self.fake_binary = self.outputs / "fake-native"
        self.fake_binary.write_bytes(b"injected-test-backend\n")
        self.fake_binary.chmod(0o755)

    def source(self, name, content=IDLE):
        path = self.robots / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(content.encode("utf-8"))
        return path

    def config(self, **kwargs):
        defaults = dict(robots_dir=self.robots, binary=self.fake_binary,
                        seeds_per_pair=3, ticks=10, workers=1, seed=123,
                        format="round-robin")
        defaults.update(kwargs)
        return TournamentConfig(**defaults)

    def executor(self, winner=None, fail_preflight=None, fail_battle=None, log=None):
        lock = threading.Lock()
        battle_index = 0

        def execute(request, binary):
            nonlocal battle_index
            with lock:
                if log is not None:
                    log.append(request)
                if len(request["robots"]) == 1:
                    if fail_preflight is not None and request["robots"][0]["name"] == fail_preflight:
                        raise ValueError("injected compile error")
                else:
                    battle_index += 1
                    if fail_battle is not None and battle_index == fail_battle:
                        raise RuntimeError("injected battle failure")
            names = [robot["name"] for robot in request["robots"]]
            selected = winner(request) if winner is not None and len(names) == 2 else None
            robots = [{"name": name, "active": selected is None or name == selected,
                       "registers": [0] * 19, "score": int(name == selected),
                       "raw_damage": 0 if selected is None or name == selected else 100}
                      for name in names]
            return {"tick": request["ticks"], "alive": sum(r["active"] for r in robots),
                    "robots": robots, "rng_seed": request.get("seed", 1)}
        return execute

    def test_every_robot_is_preflighted_before_seat_reversed_ranked_games(self):
        for name in ("alpha", "nested/beta", "gamma"):
            self.source(name)
        self.source(".ignored", "not a robot")
        self.source(".hidden/ignored", "not a robot")
        calls = []
        report = run_tournament(self.config(), battle_executor=self.executor(log=calls))
        self.assertEqual(report["status"], "completed")
        preflight = [call for call in calls if len(call["robots"]) == 1]
        games = [call for call in calls if len(call["robots"]) == 2]
        self.assertEqual(len(preflight), 3)
        self.assertEqual(calls[:3], preflight)
        self.assertTrue(all(call["ticks"] == 0 for call in preflight))
        self.assertEqual(len(games), 3 * 2 * 3)
        self.assertEqual(report["battle_count"], len(games))
        groups = defaultdict(list)
        for game in games:
            order = tuple(robot["name"] for robot in game["robots"])
            groups[(tuple(sorted(order)), game["seed"])].append(order)
        self.assertEqual(len(groups), 9)
        for (pair, seed), orders in groups.items():
            self.assertEqual(set(orders), {pair, tuple(reversed(pair))})
            self.assertEqual(len(orders), 2)
            self.assertNotEqual(seed % 0x7FFFFFFF, 0)
        self.assertEqual(set(report["champions"]), {"alpha", "nested/beta", "gamma"})
        self.assertIsNone(report["winner"])

    def test_seed_blocks_are_shared_across_pairs_and_seat_bias_cancels(self):
        for name in ("A", "B", "C", "D"):
            self.source(name)
        calls = []
        always_first = lambda request: request["robots"][0]["name"]
        report = run_tournament(self.config(), battle_executor=self.executor(always_first, log=calls))
        games = [call for call in calls if len(call["robots"]) == 2]
        # RR has two pairs per round. Every round uses six requests per pair
        # (three shared seeds, each replayed in the opposite seat order).
        for first in range(0, len(games), 12):
            counts = Counter(game["seed"] for game in games[first:first + 12])
            self.assertEqual(len(counts), 3)
            self.assertEqual(set(counts.values()), {4})
        self.assertEqual(set(report["champions"]), {"A", "B", "C", "D"})
        self.assertIsNone(report["winner"])
        for row in report["standings"]:
            self.assertEqual(row["wins"], row["losses"])
            self.assertEqual(row["rank"], 1)

    def test_majority_winner_survives_one_outlier_seed(self):
        self.source("A")
        self.source("B")
        seeds = []

        def result(request):
            if request["seed"] not in seeds:
                seeds.append(request["seed"])
            return "B" if request["seed"] == seeds[0] else "A"

        report = run_tournament(self.config(), battle_executor=self.executor(result))
        self.assertEqual(len(seeds), 3)
        self.assertEqual(report["champions"], ["A"])
        self.assertEqual(report["winner"], "A")
        a = next(row for row in report["standings"] if row["id"] == "A")
        self.assertEqual((a["wins"], a["losses"]), (4, 2))

    def test_seed_and_worker_count_do_not_change_results(self):
        for name in ("A", "B", "C", "D", "E"):
            self.source(name)
        reports = [run_tournament(self.config(format="swiss", rounds=3, workers=workers, seed=0),
                                  battle_executor=self.executor()) for workers in (1, 3)]
        self.assertEqual(reports[0], reports[1])
        repeat = run_tournament(self.config(format="swiss", rounds=3, workers=1, seed=0),
                                battle_executor=self.executor())
        self.assertEqual(reports[0], repeat)

    def test_compile_failure_is_closed_before_any_ranked_game(self):
        self.source("A")
        self.source("bad")
        self.source("C")
        calls = []
        with self.assertRaises(TournamentError) as caught:
            run_tournament(self.config(),
                           battle_executor=self.executor(fail_preflight="bad", log=calls))
        report = caught.exception.report
        self.assertEqual(report["status"], "failed")
        self.assertEqual(report["champions"], [])
        self.assertIsNone(report["winner"])
        self.assertEqual(report["battle_count"], 0)
        self.assertTrue(all(len(call["robots"]) == 1 for call in calls))

    def test_runtime_failure_never_crowns_partial_results(self):
        self.source("A")
        self.source("B")
        with self.assertRaises(TournamentError) as caught:
            run_tournament(self.config(), battle_executor=self.executor(
                winner=lambda request: "A", fail_battle=3))
        report = caught.exception.report
        self.assertEqual(report["status"], "failed")
        self.assertEqual(report["champions"], [])
        self.assertIsNone(report["winner"])
        self.assertLess(report["battle_count"], 6)

    def test_paths_must_be_real_subdirectories_of_robots(self):
        self.source("A")
        self.source("B")
        for path in (ROOT / "robots", ROOT, self.outputs):
            with self.subTest(path=path), self.assertRaises(ValueError):
                run_tournament(self.config(robots_dir=path), battle_executor=self.executor())
        link = self.robots / "linked.robot"
        link.symlink_to(self.robots / "A")
        with self.assertRaises(ValueError):
            run_tournament(self.config(), battle_executor=self.executor())
        link.unlink()
        directory_link = self.robots / "linked-directory"
        directory_link.symlink_to(self.outputs, target_is_directory=True)
        with self.assertRaises(ValueError):
            run_tournament(self.config(), battle_executor=self.executor())

    def test_robot_and_configuration_limits_are_checked_before_battles(self):
        self.source("A")
        self.source("B")
        configurations = [dict(seeds_per_pair=0), dict(seeds_per_pair=21), dict(workers=0),
                          dict(workers=33), dict(ticks=0), dict(ticks=1000001),
                          dict(seed=-1), dict(seed=2**32), dict(rounds=-1)]
        for overrides in configurations:
            calls = []
            with self.subTest(config=overrides), self.assertRaises(ValueError):
                run_tournament(self.config(**overrides), battle_executor=self.executor(log=calls))
            self.assertFalse(calls)
        for index in range(511):
            self.source(f"extra-{index}")
        calls = []
        with self.assertRaises(ValueError):
            run_tournament(self.config(), battle_executor=self.executor(log=calls))
        self.assertFalse(calls)

    def test_projected_battle_budget_is_rejected_before_preflight(self):
        for index in range(73):
            self.source(f"robot-{index:03}")
        calls = []
        # 73*72/2 pairings, 20 seeds, and two seats = 105,120 games.
        with self.assertRaises(ValueError):
            run_tournament(self.config(seeds_per_pair=20, ticks=1),
                           battle_executor=self.executor(log=calls))
        self.assertFalse(calls)

    def cli(self, *options):
        return subprocess.run([sys.executable, str(RUNNER), "--robots-dir", str(self.robots),
                               "--binary", str(BINARY), *map(str, options)],
                              cwd=self.outputs, capture_output=True, text=True, timeout=120)

    def test_native_cli_round_robin_json_and_summary(self):
        self.source("idle")
        self.source("self shooter", SELF_SHOOTER)
        output, summary = self.outputs / "results.json", self.outputs / "summary.md"
        result = self.cli("--ticks", 100, "--seeds-per-pair", 1, "--workers", 2,
                          "--format", "round-robin", "--output", output, "--summary", summary)
        self.assertEqual(result.returncode, 0, result.stderr)
        report = json.loads(output.read_text())
        self.assertEqual(report["status"], "completed")
        self.assertEqual(report["battle_count"], 2)
        self.assertEqual(report["champions"], ["idle"])
        self.assertEqual(report["winner"], "idle")
        self.assertTrue(summary.read_text().strip())
        self.assertIn("idle", summary.read_text())

    def test_invalid_rerun_replaces_stale_winner_and_summary(self):
        idle = self.source("idle")
        self.source("self shooter", SELF_SHOOTER)
        output, summary = self.outputs / "results.json", self.outputs / "summary.md"
        common = ("--ticks", 100, "--seeds-per-pair", 1, "--format", "round-robin",
                  "--output", output, "--summary", summary)
        cases = ("invalid-seed", "invalid-directory", "budget", "decode")
        for case in cases:
            with self.subTest(case=case):
                valid = self.cli(*common)
                self.assertEqual(valid.returncode, 0, valid.stderr)
                self.assertEqual(json.loads(output.read_text())["winner"], "idle")
                self.assertIn("**Winner:**", summary.read_text())
                extra_files = []
                if case == "invalid-seed":
                    invalid_options = ("--seed", -1)
                elif case == "invalid-directory":
                    invalid_options = ("--robots-dir", self.outputs)
                elif case == "budget":
                    extra_files = [self.source(f"extra-{index}") for index in range(3)]
                    invalid_options = ("--ticks", 1000000, "--seeds-per-pair", 20)
                else:
                    idle.write_bytes(b"; invalid UTF-8 \xff\r")
                    invalid_options = ("--encoding", "utf-8")
                try:
                    invalid = self.cli(*common, *invalid_options)
                    self.assertEqual(invalid.returncode, 2, invalid.stderr)
                    failed = json.loads(output.read_text())
                    self.assertEqual(failed["status"], "failed")
                    self.assertEqual(failed["champions"], [])
                    self.assertIsNone(failed["winner"])
                    self.assertNotIn("**Winner:**", summary.read_text())
                    self.assertIn("No winner was declared", summary.read_text())
                finally:
                    idle.write_bytes(IDLE.encode("utf-8"))
                    for path in extra_files:
                        path.unlink()

    def test_native_cli_malformed_robot_writes_failed_report(self):
        self.source("idle")
        self.source("broken", "allocate\r")
        output = self.outputs / "failed.json"
        result = self.cli("--ticks", 1, "--seeds-per-pair", 1, "--output", output)
        self.assertEqual(result.returncode, 2, result.stderr)
        report = json.loads(output.read_text())
        self.assertEqual(report["status"], "failed")
        self.assertEqual(report["battle_count"], 0)
        self.assertEqual(report["champions"], [])
        self.assertIsNone(report["winner"])


def main():
    global BINARY
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary", type=Path, default=BINARY)
    args, remaining = parser.parse_known_args()
    BINARY = args.binary.resolve()
    unittest.main(argv=[sys.argv[0], *remaining], verbosity=2)


if __name__ == "__main__":
    main()
