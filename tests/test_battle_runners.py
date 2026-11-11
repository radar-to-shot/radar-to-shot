#!/usr/bin/env python3
"""Exercise the standalone text-file battle runners.

Only Python's standard library and an already-built native executable are needed
for the default suite. Run with the reverse-engineering Python environment and
--emulator to compare complete results against the original 68k application:

    python tests/test_battle_runners.py --binary build/robotwar
    python tests/test_battle_runners.py --binary build/robotwar --emulator
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
NATIVE_RUNNER = ROOT / "scripts/run_headless_battle.py"
EMULATOR_RUNNER = ROOT / "scripts/run_68k_battle.py"
EXAMPLES = ROOT / "robots/examples"
IDLE = "loop\rgoto loop\r"
SELF_SHOOTER = "FIRE_RATE 4\rloop\r0 to shot\rgoto loop\r"
RANDOM_ROBOT = "allocate sample\r1000 to random\rloop\rrandom to sample\rgoto loop\r"

BINARY = ROOT / "build/robotwar"
EMULATOR = False


class BattleRunnerTests(unittest.TestCase):
    """Check the public scripts through subprocesses, including their exit status."""

    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory(prefix="robotwar-runners-")
        self.directory = Path(self.temporary.name)
        self.addCleanup(self.temporary.cleanup)

    def source(self, name: str, text: str, encoding: str = "utf-8") -> Path:
        path = self.directory / name
        path.write_bytes(text.encode(encoding))
        return path

    def invoke(self, paths=(), *options, engine="headless", cwd=None, timeout=120):
        runner = NATIVE_RUNNER if engine == "headless" else EMULATOR_RUNNER
        command = [sys.executable, str(runner)]
        if engine == "headless":
            command += ["--binary", str(BINARY)]
        command += [str(path) for path in paths]
        command += [str(option) for option in options]
        return subprocess.run(
            command,
            cwd=cwd or self.directory,
            text=True,
            encoding="utf-8",
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            timeout=timeout,
            check=False,
        )

    def success(self, paths, *options, engine="headless", **kwargs):
        result = self.invoke(paths, *options, engine=engine, **kwargs)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stderr, "", result.stderr)
        try:
            output = json.loads(result.stdout)
        except json.JSONDecodeError:
            self.fail(f"Runner did not produce a single JSON document: {result.stdout!r}")
        self.assertEqual(output["schema_version"], 1)
        self.assertEqual(output["engine"], engine)
        self.assertEqual(len(output["robots"]), len(paths))
        self.assertEqual([robot["name"] for robot in output["robots"]], [Path(p).name for p in paths])
        self.assertEqual(output["alive"], sum(bool(robot["active"]) for robot in output["robots"]))
        self.assertIsInstance(output["rng_seed"], int)
        self.assertGreaterEqual(output["rng_seed"], 0)
        self.assertLess(output["rng_seed"], 2**32)
        for robot in output["robots"]:
            self.assertEqual(len(robot["registers"]), 19)
            self.assertIn("memory", robot)
            self.assertIn("pc", robot)
            self.assertIn("stack_pointer", robot)
            self.assertIn("cycle_debt", robot)
            self.assertIn("error_resets", robot)
            self.assertIn("raw_damage", robot)
            self.assertIn("shell_active", robot)
        return output

    def failure(self, paths, *options, engine="headless"):
        result = self.invoke(paths, *options, engine=engine)
        self.assertEqual(result.returncode, 2, result.stderr)
        self.assertEqual(result.stdout, "", "A failed run must not emit success-shaped JSON")
        self.assertTrue(result.stderr.strip(), "A failed run must explain its error on stderr")
        return result

    def examples(self, count):
        return [EXAMPLES / name for name in
                ["Circle Shooter", "Wall Crawler", "Run Away", "Chicken", "Seeker"][:count]]

    def test_two_to_five_real_examples(self):
        # Running from a temporary directory also verifies imports and resource paths
        # do not depend on launching the scripts from the repository root.
        for count in (2, 3, 4, 5):
            with self.subTest(robot_count=count):
                output = self.success(self.examples(count), "--ticks", 3, "--seed", "0x12345")
                self.assertEqual(output["seed"], 0x12345)
                self.assertEqual(output["tick_limit"], 3)
                self.assertEqual(output["tick"], 3)
                self.assertEqual(output["termination"], "tick_limit")
                self.assertIsNone(output["winner"])

    def test_zero_ticks_retains_initialized_state(self):
        paths = [self.source("first", IDLE), self.source("second", IDLE)]
        output = self.success(paths, "--ticks", 0)
        self.assertEqual(output["seed"], 1)
        self.assertEqual(output["tick"], 0)
        self.assertEqual(output["tick_limit"], 0)
        self.assertEqual(output["alive"], 2)
        self.assertEqual(output["termination"], "tick_limit")
        self.assertIsNone(output["winner"])
        self.assertTrue(all(robot["pc"] == 0 for robot in output["robots"]))

    def test_default_limit_and_seed(self):
        paths = [self.source("first", IDLE), self.source("second", IDLE)]
        output = self.success(paths)
        self.assertEqual(output["tick_limit"], 1000)
        self.assertEqual(output["tick"], 1000)
        self.assertEqual(output["seed"], 1)
        self.assertEqual(output["termination"], "tick_limit")

    def test_seeded_random_state_is_repeatable(self):
        paths = [self.source("random one", RANDOM_ROBOT), self.source("random two", RANDOM_ROBOT)]
        first = self.success(paths, "--ticks", 4, "--seed", "0x80000001")
        repeated = self.success(paths, "--ticks", 4, "--seed", "2147483649")
        self.assertEqual(first, repeated)
        initial = self.success(paths, "--ticks", 0, "--seed", "2147483649")
        self.assertNotEqual(first["rng_seed"], initial["rng_seed"])
        another = self.success(paths, "--ticks", 4, "--seed", "123")
        self.assertNotEqual(first["robots"], another["robots"])

    def test_last_survivor_stops_early(self):
        paths = [self.source("self shooter", SELF_SHOOTER), self.source("survivor", IDLE)]
        output = self.success(paths, "--ticks", 100)
        self.assertGreater(output["tick"], 0)
        self.assertLess(output["tick"], 100)
        self.assertEqual(output["alive"], 1)
        self.assertEqual(output["termination"], "last_survivor")
        self.assertEqual(output["winner"], 1)
        self.assertFalse(output["robots"][0]["active"])
        self.assertTrue(output["robots"][1]["active"])

    def test_mutual_destruction_finishes_the_whole_tick(self):
        paths = [self.source("self shooter one", SELF_SHOOTER),
                 self.source("self shooter two", SELF_SHOOTER)]
        output = self.success(paths, "--ticks", 100)
        self.assertGreater(output["tick"], 0)
        self.assertLess(output["tick"], 100)
        self.assertEqual(output["alive"], 0)
        self.assertEqual(output["termination"], "mutual_destruction")
        self.assertIsNone(output["winner"])
        self.assertFalse(any(robot["active"] for robot in output["robots"]))

    def test_line_endings_and_encodings_are_normalized(self):
        # Rewrite the same filenames to keep identity and seed fixed across runs.
        text = "; café: a MacRoman comment\r" + RANDOM_ROBOT
        paths = [self.source("café.robot", text), self.source("idle", IDLE)]
        baseline = self.success(paths, "--ticks", 2)
        for ending in ("\n", "\r\n"):
            with self.subTest(line_ending=repr(ending)):
                paths[0].write_bytes(text.replace("\r", ending).encode("utf-8"))
                self.assertEqual(self.success(paths, "--ticks", 2), baseline)
        paths[0].write_bytes(text.encode("mac_roman"))
        self.assertEqual(self.success(paths, "--ticks", 2, "--encoding", "mac-roman"), baseline)

    def test_json_file_output(self):
        paths = self.examples(2)
        destination = self.directory / "battle results.json"
        reference = self.success(paths, "--ticks", 2, "--seed", "19")
        result = self.invoke(paths, "--ticks", 2, "--seed", "19", "--output", destination)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stdout, "")
        self.assertEqual(json.loads(destination.read_text(encoding="utf-8")), reference)

    def test_output_does_not_overwrite_source_or_appear_on_failure(self):
        idle = self.source("idle", IDLE)
        other = self.source("other", IDLE)
        original = idle.read_bytes()
        self.failure([idle, other], "--ticks", 0, "--output", idle)
        self.assertEqual(idle.read_bytes(), original)
        malformed = self.source("malformed", "allocate\r")
        destination = self.directory / "should-not-exist.json"
        self.failure([idle, malformed], "--ticks", 0, "--output", destination)
        self.assertFalse(destination.exists())

    def test_invalid_robot_counts(self):
        valid = self.source("idle", IDLE)
        for count in (0, 1, 6):
            with self.subTest(count=count):
                self.failure([valid] * count, "--ticks", 0)

    def test_invalid_seed_and_tick_arguments(self):
        paths = [self.source("first", IDLE), self.source("second", IDLE)]
        for seed in ("-1", "4294967296", "0", "2147483647", "4294967294", "banana", "0x"):
            with self.subTest(seed=seed):
                self.failure(paths, "--ticks", 0, "--seed", seed)
        for ticks in ("-1", "1000001", "no", "1.5"):
            with self.subTest(ticks=ticks):
                self.failure(paths, "--ticks", ticks)
        # The inclusive uint32 maximum is valid and is not a degenerate seed.
        self.assertEqual(self.success(paths, "--ticks", 0, "--seed", "4294967295")["seed"], 4294967295)

    def test_missing_file_binary_and_malformed_source(self):
        idle = self.source("idle", IDLE)
        self.failure([idle, self.directory / "missing.robot"], "--ticks", 0)
        bad = self.source("malformed.robot", "allocate\r")
        self.failure([idle, bad], "--ticks", 0)
        self.failure([idle, idle], "--ticks", 0, "--binary", self.directory / "missing-binary")

    def test_invalid_encoding_and_unrepresentable_source(self):
        idle = self.source("idle", IDLE)
        emoji = self.source("emoji.robot", "; 🚀\r" + IDLE)
        self.failure([idle, emoji], "--ticks", 0)
        malformed_utf8 = self.directory / "bad-utf8.robot"
        malformed_utf8.write_bytes(b";\xff\rloop\rgoto loop\r")
        self.failure([idle, malformed_utf8], "--ticks", 0)
        self.failure([idle, idle], "--ticks", 0, "--encoding", "latin-1")

    def test_original_68k_matches_complete_native_results(self):
        if not EMULATOR:
            self.skipTest("Enable original-code comparisons with --emulator")
        random_paths = [self.source("random one", RANDOM_ROBOT),
                        self.source("random two", RANDOM_ROBOT)]
        death_paths = [self.source("self shooter", SELF_SHOOTER), self.source("idle", IDLE)]
        mutual_paths = [self.source("mutual one", SELF_SHOOTER), self.source("mutual two", SELF_SHOOTER)]
        macroman_paths = [self.source("macroman", "; café\r" + RANDOM_ROBOT, "mac_roman"),
                          self.source("macroman idle", IDLE, "mac_roman")]
        cases = [(self.examples(count), 3, "0x12345", (), 120) for count in (2, 3, 4, 5)]
        cases += [(random_paths, 4, "0x80000001", (), 120), (death_paths, 100, "1", (), 120),
                  (mutual_paths, 100, "1", (), 120), (random_paths, 0, "1", (), 120),
                  (macroman_paths, 2, "1", ("--encoding", "mac-roman"), 120),
                  ([EXAMPLES / "Seeker", EXAMPLES / "Circle Shooter"], 1000, "1", (), 300)]
        for paths, ticks, seed, options, timeout in cases:
            with self.subTest(robots=[path.name for path in paths], ticks=ticks, seed=seed):
                native = self.success(paths, "--ticks", ticks, "--seed", seed, *options, timeout=timeout)
                original = self.success(paths, "--ticks", ticks, "--seed", seed, *options,
                                        engine="68k", timeout=timeout)
                native.pop("engine")
                original.pop("engine")
                self.assertEqual(original, native)

    def test_emulator_failure_and_file_output_contract(self):
        if not EMULATOR:
            self.skipTest("Enable original-code comparisons with --emulator")
        idle = self.source("idle", IDLE)
        self.failure([idle], "--ticks", 0, engine="68k")
        self.failure([idle, idle], "--ticks", 0, "--seed", 0, engine="68k")
        self.failure([idle, self.source("malformed", "allocate\r")], "--ticks", 0, engine="68k")
        destination = self.directory / "emulated.json"
        result = self.invoke([idle, idle], "--ticks", 0, "--output", destination, engine="68k")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(result.stdout, "")
        self.assertEqual(json.loads(destination.read_text(encoding="utf-8"))["engine"], "68k")


def main():
    global BINARY, EMULATOR
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary", type=Path, default=BINARY)
    parser.add_argument("--emulator", action="store_true", help="Also execute original 68k differential tests")
    args, remaining = parser.parse_known_args()
    BINARY = args.binary.resolve()
    EMULATOR = args.emulator
    unittest.main(argv=[sys.argv[0], *remaining], verbosity=2)


if __name__ == "__main__":
    main()
