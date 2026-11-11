#!/usr/bin/env python3
"""Statistical rules, fair schedules, native multiplayer results, and delivery."""
from __future__ import annotations

import argparse
from collections import Counter, defaultdict
import io
import itertools
import json
import math
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from urllib.error import HTTPError, URLError

ROOT = Path(__file__).resolve().parents[1]
BINARY = ROOT / "build/robotwar"
sys.path.insert(0, str(ROOT / "tools"))
from battle_runner import run_native
from discord_leaderboard import payload, send, webhook_url
from league_ratings import fit_ratings, schedule, seed_for
from weekly_league import compact, discover, game_record, run_league, summary, week_value

IDLE = "loop\ngoto loop\n"
SELF_SHOOTER = "FIRE_RATE 4\nloop\n0 to shot\ngoto loop\n"
WEBHOOK = "https://discord.com/api/webhooks/123456/PRIVATE_TOKEN"
RUN_URL = "https://github.com/radar-to-shot/radar-to-shot/actions/runs/123"


def game(order, ranks, seed=1, winner=None):
    return {"order": order, "ranks": ranks, "seed": seed, "winner": winner}


class ScheduleTests(unittest.TestCase):
    def test_exhaustive_small_fields_balance_all_slots_and_cover_every_group(self):
        for count in range(2, 11):
            ids = [str(i) for i in range(count)]
            for size in range(2, min(5, count) + 1):
                if math.comb(count, size) > 128:
                    continue
                plan = schedule(ids, size, "2026-W46")
                self.assertEqual(plan["method"], "exhaustive")
                self.assertEqual({tuple(group) for group in plan["groups"]},
                                 set(itertools.combinations(sorted(ids), size)))
                self.assert_balanced(plan, ids)

    def assert_balanced(self, plan, ids):
        counts, slots, graph = Counter(), Counter(), defaultdict(set)
        size = plan["size"]
        for group in plan["groups"]:
            self.assertEqual(len(set(group)), size)
            for name in group:
                graph[name].update(set(group) - {name})
            for seat in range(size):
                order = group[seat:] + group[:seat]
                counts.update(order)
                slots.update((name, position) for position, name in enumerate(order))
        self.assertEqual(set(counts), set(ids))
        self.assertEqual(len(set(counts.values())), 1)
        self.assertEqual(len(set(slots.values())), 1)
        self.assertEqual(next(iter(counts.values())) * plan["seed_blocks"], plan["games_per_robot"])
        self.assertGreaterEqual(plan["games_per_robot"], 32)
        reached, pending = set(), [ids[0]]
        while pending:
            name = pending.pop()
            if name not in reached:
                reached.add(name)
                pending.extend(graph[name] - reached)
        self.assertEqual(reached, set(ids))

    def test_large_sampled_fields_balance_games_seats_and_connected_opponents(self):
        for count in (17, 63, 512):
            ids = [f"robot-{i}" for i in range(count)]
            total = 0
            for size in range(2, 6):
                plan = schedule(ids, size, "2026-W46")
                self.assertEqual(plan["method"], "balanced-circles")
                self.assertEqual(len(plan["groups"]), count * 4)
                total += plan["battle_count"]
                self.assert_balanced(plan, ids)
            self.assertLessEqual(total, 100_000)
            self.assertLessEqual(total * 2000, 200_000_000)

    def test_schedule_and_seeds_are_reproducible_but_vary_by_week_and_round(self):
        ids = [str(i) for i in range(20)]
        self.assertEqual(schedule(ids, 5, "2026-W46"), schedule(ids[::-1], 5, "2026-W46"))
        self.assertNotEqual(schedule(ids, 5, "2026-W46"), schedule(ids, 5, "2026-W47"))
        values = [seed_for(week, size, block, phase) for week in ("2026-W46", "2026-W47")
                  for size in range(2, 6) for block in range(4) for phase in range(4)]
        self.assertEqual(len(values), len(set(values)))
        self.assertTrue(all(0 < value < 0x7FFFFFFF for value in values))

    def test_iso_week_validation_including_year_boundary(self):
        self.assertEqual(week_value("2020-W53"), "2020-W53")
        for value in ("2021-W53", "2026-W00", "2026-W54", "2026-W1", "$(touch x)"):
            with self.assertRaises(ValueError):
                week_value(value)


class RatingTests(unittest.TestCase):
    def test_512_robot_one_sided_population_converges_in_all_four_modes(self):
        # Multiplicative Bradley–Terry fitting converges too slowly on this
        # separated population. Keep the actual maximum field as a regression.
        ids = [f"robot-{i:03}" for i in range(512)]
        total = 0
        for size in range(2, 6):
            plan = schedule(ids, size, "2026-W46")
            games = []
            for group_index, group in enumerate(plan["groups"]):
                for block in range(plan["seed_blocks"]):
                    for seat in range(size):
                        order = group[seat:] + group[:seat]
                        ranks = [sorted(order).index(name) + 1 for name in order]
                        games.append(game(order, ranks, group_index * 100 + block, min(order)))
            rows = fit_ratings(ids, games)
            self.assertEqual(len(rows), 512)
            self.assertEqual({row["games"] for row in rows}, {plan["games_per_robot"]})
            self.assertTrue(all(math.isfinite(row["rating"]) for row in rows))
            total += len(games)
        self.assertEqual(total, 57_344)

    def test_two_player_fit_matches_independent_likelihood_root(self):
        games = [game(["a", "b"], [1, 2] if i < 8 else [2, 1], i,
                      "a" if i < 8 else "b") for i in range(10)]
        rows = fit_ratings(["a", "b"], games)
        # Symmetry gives strength_b=1/strength_a. Independently solve the
        # likelihood derivative including the two virtual reference draws.
        low, high = 1.0, 100.0
        for _ in range(100):
            strength = (low + high) / 2
            derivative = 9 - 10 * strength ** 2 / (1 + strength ** 2) - 2 * strength / (1 + strength)
            if derivative > 0:
                low = strength
            else:
                high = strength
        expected = 1500 + 400 * math.log10((low + high) / 2)
        self.assertAlmostEqual(rows[0]["rating"], expected, delta=0.051)
        self.assertAlmostEqual(rows[1]["rating"], 3000 - expected, delta=0.051)
        self.assertEqual(rows[0]["wins"], 8)
        self.assertEqual(rows[0]["losses"], 2)
        self.assertEqual(rows, fit_ratings(["b", "a"], list(reversed(games))))

    def test_all_draws_share_1500_and_do_not_invent_a_winner(self):
        ids = list("abcde")
        rows = fit_ratings(ids, [game(ids, [1] * 5, i) for i in range(32)])
        self.assertEqual({row["rating"] for row in rows}, {1500})
        self.assertEqual({row["rank"] for row in rows}, {1})
        self.assertEqual({row["draws"] for row in rows}, {32})
        self.assertTrue(all(not row["provisional"] for row in rows))

    def test_multiplayer_evidence_is_normalized_and_never_losers_remain_finite(self):
        ids = list("abcde")
        rows = fit_ratings(ids, [game(ids, [1, 2, 2, 2, 2], i, "a") for i in range(40)])
        by_name = {row["id"]: row for row in rows}
        self.assertEqual(len({by_name[name]["rating"] for name in "bcde"}), 1)
        self.assertTrue(all(math.isfinite(row["rating"]) for row in rows))
        a, b = [10 ** ((by_name[name]["rating"] - 1500) / 400) for name in "ab"]
        # Winner has 40 units of actual evidence, not 160. Derivative residual
        # tolerance allows only the final displayed 0.1 Elo rounding.
        self.assertAlmostEqual(41 - 40 * a / (a + b) - 2 * a / (1 + a), 0, delta=0.003)
        self.assertAlmostEqual(1 - 10 * b / (a + b) - 2 * b / (1 + b), 0, delta=0.003)

    def test_survival_order_ties_and_missing_deaths(self):
        order = list("abcde")
        state = {"robots": [{"name": name, "active": i >= 3} for i, name in enumerate(order)],
                 "alive": 2, "tick": 100, "rng_seed": 1,
                 "events": [{"kind": 3, "robot": i, "tick": tick} for i, tick in enumerate((3, 6, 6))]}
        record = game_record(state, order, 1, 100)
        self.assertEqual(record["ranks"], [5, 3, 3, 1, 1])
        self.assertIsNone(record["winner"])
        self.assertEqual(record["death_ticks"], [3, 6, 6, None, None])
        state["events"].pop()
        with self.assertRaisesRegex(RuntimeError, "every eliminated"):
            game_record(state, order, 1, 100)


class LeagueTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix=".weekly-test-", dir=ROOT / "robots")
        self.directory = Path(self.temp.name)
        for name in ("a", "b", "c", "d", "e"):
            (self.directory / name).write_text(IDLE)

    def tearDown(self):
        self.temp.cleanup()

    def test_native_league_all_modes_and_parallel_reports_match(self):
        (self.directory / "a").write_text(SELF_SHOOTER)
        (self.directory / "broken").write_text("ALLOCATE\n")
        first = run_league(directory=self.directory, binary=BINARY, week="2026-W46", ticks=40, workers=1)
        second = run_league(directory=self.directory, binary=BINARY, week="2026-W46", ticks=40, workers=4)
        self.assertEqual(first, second)
        self.assertEqual(set(first["modes"]), {"2", "3", "4", "5"})
        self.assertEqual(len(first["overall"]), 5)
        self.assertEqual(sum("error" in entry for entry in first["participants"]), 1)
        for mode in first["modes"].values():
            self.assertEqual({row["games"] for row in mode["standings"]}, {mode["games_per_robot"]})
            for result in mode["games"]:
                for index, name in enumerate(result["order"]):
                    if name.endswith("/a"):
                        self.assertIsNotNone(result["death_ticks"][index])
                        self.assertEqual(result["ranks"][index], len(result["order"]))
        for row in first["overall"]:
            expected = [next(value["rating"] for value in mode["standings"] if value["id"] == row["id"])
                        for mode in first["modes"].values()]
            self.assertEqual(row["rating"], round(sum(expected) / 4, 1))
        small = compact(first)
        self.assertTrue(all("games" not in mode and "groups" not in mode for mode in small["modes"].values()))
        self.assertIn("Unranked scripts", summary(first))

    def test_two_entrants_leave_larger_modes_unrated(self):
        for name in "cde":
            (self.directory / name).unlink()
        report = run_league(directory=self.directory, binary=BINARY, week="2026-W46", ticks=1)
        self.assertEqual(report["unavailable_modes"], [3, 4, 5])
        self.assertEqual({row["rating"] for row in report["overall"]}, {1500})

    def test_hidden_files_are_ignored_and_symlinks_rejected(self):
        (self.directory / ".hidden").write_text("not a robot")
        nested = self.directory / "nested"
        nested.mkdir()
        (nested / "a").write_text(IDLE)
        self.assertEqual(len(discover(self.directory, "utf-8")), 6)
        self.assertEqual(discover(nested / "..", "utf-8"), discover(self.directory, "utf-8"))
        (self.directory / "link").symlink_to(self.directory / "a")
        with self.assertRaises(ValueError):
            discover(self.directory, "utf-8")

    def test_failed_rerun_clears_previous_success_and_refuses_robot_output(self):
        with tempfile.TemporaryDirectory() as output:
            for name in ("results.json", "leaderboard.json", "leaderboard.md"):
                Path(output, name).write_text("OLD WINNER")
            command = [sys.executable, str(ROOT / "scripts/run_weekly_league.py"),
                       "--binary", str(BINARY), "--robots-dir", str(self.directory), "--ticks", "0"]
            result = subprocess.run(command + ["--output-dir", output], capture_output=True, text=True)
            self.assertEqual(result.returncode, 2)
            self.assertEqual(json.loads(Path(output, "leaderboard.json").read_text())["status"], "failed")
            self.assertNotIn("OLD WINNER", Path(output, "leaderboard.md").read_text())
            result = subprocess.run(command + ["--output-dir", str(self.directory)], capture_output=True)
            self.assertEqual(result.returncode, 2)
            self.assertEqual((self.directory / "a").read_text(), IDLE)

    def test_work_budget_and_unexpected_engine_failures_abort(self):
        with self.assertRaisesRegex(ValueError, "budget"):
            run_league(directory=self.directory, binary=BINARY, ticks=1_000_000, seeds=20)
        def failed(request, binary):
            raise RuntimeError("engine unavailable")
        with self.assertRaisesRegex(RuntimeError, "engine unavailable"):
            run_league(directory=self.directory, binary=BINARY, executor=failed)


class FakeOpener:
    def __init__(self, responses):
        self.responses, self.requests = list(responses), []

    def open(self, request, timeout):
        self.requests.append(request)
        response = self.responses.pop(0)
        if isinstance(response, Exception):
            raise response
        return io.BytesIO(json.dumps(response).encode())


class DiscordTests(unittest.TestCase):
    def report(self):
        rows = [{"id": "@everyone\n```<evil>" + "x" * 500, "rank": i + 1,
                 "rating": 1500, "games": 32, "provisional": False} for i in range(512)]
        return {"status": "completed", "week": "2026-W46", "overall": rows,
                "modes": {str(size): {"standings": rows} for size in range(2, 6)},
                "battle_count": 1000, "participants": [], "unavailable_modes": []}

    def test_message_limits_and_mentions_for_large_hostile_names(self):
        result = payload(self.report(), RUN_URL)
        self.assertEqual(result["allowed_mentions"], {"parse": []})
        self.assertEqual(len(result["embeds"]), 5)
        total = sum(len(entry["title"]) + len(entry["description"]) for entry in result["embeds"])
        self.assertLess(total, 6000)
        for entry in result["embeds"]:
            self.assertEqual(entry["description"].count("```"), 2)
            self.assertNotIn("@everyone", entry["description"])
        with self.assertRaises(ValueError):
            payload({"status": "failed"}, RUN_URL)

    def test_webhook_destination_validation_and_thread_support(self):
        self.assertEqual(webhook_url(WEBHOOK), WEBHOOK + "?wait=true")
        self.assertIn("thread_id=99", webhook_url(WEBHOOK + "?thread_id=99"))
        for value in (WEBHOOK.replace("https:", "http:"), WEBHOOK.replace("discord.com", "evil.test"),
                      WEBHOOK.replace("discord.com", "discord.com@evil.test"), WEBHOOK + "?redirect=evil"):
            with self.assertRaises(ValueError) as raised:
                webhook_url(value)
            self.assertNotIn("PRIVATE_TOKEN", str(raised.exception))

    def test_429_retries_then_confirms_message_and_attachments(self):
        limited = HTTPError(WEBHOOK, 429, "limited", {}, io.BytesIO(b'{"retry_after":0.01}'))
        opener, pauses = FakeOpener([limited, {"id": "456"}]), []
        result = send(WEBHOOK, payload(self.report(), RUN_URL), [b"{}", b"# standings"],
                      opener=opener, sleep=pauses.append)
        self.assertEqual(result, "456")
        self.assertEqual(len(opener.requests), 2)
        self.assertEqual(len(pauses), 1)
        self.assertIn(b'filename="leaderboard.md"', opener.requests[0].data)
        self.assertNotIn(b"PRIVATE_TOKEN", opener.requests[0].data)

    def test_uncertain_failures_do_not_retry_or_expose_secret(self):
        for failure in (HTTPError(WEBHOOK, 503, WEBHOOK, {}, io.BytesIO(b"")), URLError(WEBHOOK)):
            opener = FakeOpener([failure])
            with self.assertRaises(RuntimeError) as raised:
                send(WEBHOOK, {}, [b"{}", b""], opener=opener)
            self.assertNotIn("PRIVATE_TOKEN", str(raised.exception))
            self.assertEqual(len(opener.requests), 1)


def main():
    global BINARY
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary", type=Path, default=BINARY)
    args, remainder = parser.parse_known_args()
    BINARY = args.binary.resolve()
    unittest.main(argv=[__file__, *remainder], verbosity=2)


if __name__ == "__main__":
    main()
