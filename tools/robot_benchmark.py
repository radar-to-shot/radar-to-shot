#!/usr/bin/env python3
"""Benchmark one robot on reproducible, seat-balanced battles against a frozen field.

Example: python tools/robot_benchmark.py --candidate robots/parallax.rw \
    --seed-list 1 --output build/parallax-benchmark.json
"""
from __future__ import annotations

import argparse
from concurrent.futures import ThreadPoolExecutor
import hashlib
import itertools
import json
import math
import os
from pathlib import Path
import random
import selectors
import subprocess
import sys
import tempfile
import time

from battle_runner import ROOT, read_robot, seed_value, write_result
from robot_metadata import extract_metadata
from weekly_league import game_record, statistics

CANDIDATE = "candidate"
MAX_ROBOTS = 512
MAX_BATTLES = 100_000
MAX_TICKS_TOTAL = 200_000_000


class NativeSession:
    """Keep one engine alive; bound writes, reads, and process cleanup."""

    def __init__(self, binary: Path, timeout=30):
        self.timeout = timeout
        self.stderr = tempfile.TemporaryFile()
        try:
            self.process = subprocess.Popen([str(binary.resolve()), "jsonl"],
                                            stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                                            stderr=self.stderr, bufsize=0)
        except Exception:
            self.stderr.close()
            raise
        os.set_blocking(self.process.stdin.fileno(), False)
        os.set_blocking(self.process.stdout.fileno(), False)
        self.buffer = bytearray()

    def request(self, request):
        pending = memoryview((json.dumps(request, ensure_ascii=True) + "\n").encode())
        deadline = time.monotonic() + self.timeout
        with selectors.DefaultSelector() as selector:
            selector.register(self.process.stdin, selectors.EVENT_WRITE)
            selector.register(self.process.stdout, selectors.EVENT_READ)
            while True:
                if not pending and b"\n" in self.buffer:
                    line, _, self.buffer = self.buffer.partition(b"\n")
                    try:
                        result = json.loads(line)
                    except ValueError:
                        raise RuntimeError("Benchmark engine returned invalid JSON") from None
                    if not isinstance(result, dict):
                        raise RuntimeError("Benchmark engine returned a non-object result")
                    if "exception" in result:
                        raise RuntimeError(f"Benchmark engine rejected the request: {result['exception']}")
                    return result
                remaining = deadline - time.monotonic()
                if remaining <= 0:
                    raise TimeoutError("Benchmark engine request exceeded its time limit")
                for key, _ in selector.select(remaining):
                    try:
                        if key.fileobj is self.process.stdin:
                            pending = pending[os.write(key.fd, pending):]
                            if not pending:
                                selector.unregister(self.process.stdin)
                        else:
                            chunk = os.read(key.fd, 65536)
                            if not chunk:
                                raise RuntimeError("Benchmark engine ended before returning a result")
                            self.buffer.extend(chunk)
                            if len(self.buffer) > 16 * 1024 * 1024:
                                raise RuntimeError("Benchmark engine response exceeded 16 MiB")
                    except (BrokenPipeError, ConnectionResetError):
                        raise RuntimeError("Benchmark engine connection closed unexpectedly") from None

    def __enter__(self):
        return self

    def __exit__(self, *exc):
        if self.process.poll() is None:
            self.process.terminate()
        try:
            self.process.wait(timeout=2)
        except subprocess.TimeoutExpired:
            self.process.kill()
            self.process.wait()
        self.process.stdin.close()
        self.process.stdout.close()
        self.stderr.close()


def seed_list(value: str) -> list[int]:
    """Accept comma-separated integers, a JSON array, or a JSON-array file."""
    if value.lstrip().startswith("["):
        values = json.loads(value)
    elif "," not in value and Path(value).is_file():
        values = json.loads(Path(value).read_text())
    else:
        values = value.split(",")
    if not isinstance(values, list) or not 1 <= len(values) <= 256:
        raise ValueError("seed-list must contain between 1 and 256 explicit seeds")
    if any(isinstance(item, bool) or not isinstance(item, (int, str)) for item in values):
        raise ValueError("Seeds must be integers")
    seeds = [seed_value(str(item)) for item in values]
    if len(seeds) != len(set(seeds)):
        raise ValueError("seed-list must not contain duplicate seeds")
    return seeds


def make_schedule(opponent_ids, seeds, sizes=(2, 3, 4, 5), groups_per_size=16):
    """Use every duel and uniformly sampled opponent groups, rotating every seat.

    Candidate source/name never enters this function. Keeping opponent IDs and
    configuration fixed therefore gives exactly paired runs of different candidates.
    Multiplayer groups are sampled without replacement independently for each seed.
    """
    ids = sorted(opponent_ids)
    if not ids or len(ids) != len(set(ids)) or CANDIDATE in ids:
        raise ValueError("Opponent IDs must be nonempty, unique, and distinct from candidate")
    if type(groups_per_size) is not int or not 1 <= groups_per_size <= 256:
        raise ValueError("groups-per-size must be between 1 and 256")
    if not 1 <= len(seeds) <= 256 or len(seeds) != len(set(seeds)):
        raise ValueError("Between 1 and 256 distinct seeds are required")
    if any(type(seed) is not int for seed in seeds):
        raise ValueError("Seeds must be integers")
    for seed in seeds:
        seed_value(str(seed))
    sizes = sorted(set(sizes))
    if not sizes or any(type(size) is not int or not 2 <= size <= 5 for size in sizes):
        raise ValueError("Battle sizes must be between 2 and 5")
    games = []
    for size in sizes:
        if size > len(ids) + 1:
            continue
        total = math.comb(len(ids), size - 1)
        count = total if size == 2 else min(total, groups_per_size)
        if len(games) + count * size * len(seeds) > MAX_BATTLES:
            raise ValueError(f"Schedule exceeds {MAX_BATTLES} battles")
        for seed in seeds:
            if count == total:
                groups = list(itertools.combinations(ids, size - 1))
            else:
                key = json.dumps(["robot-benchmark-v1", ids, size, seed], separators=(",", ":"))
                rng = random.Random(int(hashlib.sha256(key.encode()).hexdigest(), 16))
                selected = set()
                while len(selected) < count:
                    selected.add(tuple(sorted(rng.sample(ids, size - 1))))
                groups = sorted(selected)
            for group in groups:
                participants = [CANDIDATE, *group]
                for rotation in range(size):
                    games.append({"size": size, "seed": seed,
                                  "order": participants[rotation:] + participants[:rotation]})
    if not games:
        raise ValueError("No requested battle size fits the opponent field")
    return games


def summarize(games):
    """Whole-battle wins require a sole survivor; placement ties score half."""
    if not games:
        return None
    ids = sorted({name for game in games for name in game["order"]})
    result = statistics(ids, games)[CANDIDATE]
    pairwise = 0.0
    for game in games:
        index = game["order"].index(CANDIDATE)
        rank = game["ranks"][index]
        pairwise += sum((other > rank) + 0.5 * (other == rank)
                        for i, other in enumerate(game["ranks"]) if i != index) / (len(game["order"]) - 1)
    result["pairwise_survival_score"] = round(pairwise / len(games), 6)
    result["survivals"] = sum(game["survived"][game["order"].index(CANDIDATE)] for game in games)
    return result


def entrant(path, identifier, encoding):
    raw = path.read_bytes()
    source = raw.decode("utf-8-sig" if encoding == "utf-8" else "mac_roman")
    robot = {**read_robot(path, encoding), "name": identifier}
    return {"id": identifier, "path": str(path.resolve()),
            **extract_metadata(source, path.name),
            "source_sha256": hashlib.sha256(raw).hexdigest(),
            "normalized_source_sha256": hashlib.sha256(bytes.fromhex(robot["source_hex"])).hexdigest(),
            "robot": robot}


def opponents(directory, candidate, encoding):
    directory = directory.resolve()
    if not directory.is_dir():
        raise ValueError("opponents-dir must be a directory")
    entries = []
    def walk_error(error):
        raise error
    for current, directories, files in os.walk(directory, followlinks=False, onerror=walk_error):
        directories[:] = sorted(name for name in directories if not name.startswith("."))
        for name in directories + sorted(name for name in files if not name.startswith(".")):
            path = Path(current) / name
            if path.is_symlink():
                raise ValueError(f"Symbolic link in opponent directory: {path}")
            if name in files and path.resolve() != candidate.resolve():
                if not path.is_file():
                    raise ValueError(f"Opponent is not a regular file: {path}")
                identifier = "opponent:" + path.relative_to(directory).as_posix()
                entries.append(entrant(path, identifier, encoding))
                if len(entries) > MAX_ROBOTS:
                    raise ValueError(f"At most {MAX_ROBOTS} opponents are supported")
    return sorted(entries, key=lambda entry: entry["id"])


def run_benchmark(*, candidate, opponents_dir=ROOT / "robots", seeds=(1,),
                  sizes=(2, 3, 4, 5), groups_per_size=16, ticks=2000, workers=2,
                  binary=ROOT / "build/robotwar", encoding="utf-8", timeout=30,
                  max_seconds=1800):
    candidate, binary = Path(candidate), Path(binary)
    seeds, sizes = tuple(seeds), tuple(sizes)
    for value, name, limit in ((ticks, "ticks", 1_000_000), (workers, "workers", 8)):
        if type(value) is not int or not 1 <= value <= limit:
            raise ValueError(f"{name} must be an integer from 1 to {limit}")
    if not 0 < timeout <= 300 or not 0 < max_seconds <= 86400:
        raise ValueError("timeout must be 0..300 seconds and max-seconds 0..86400 seconds")
    if encoding not in ("utf-8", "mac-roman"):
        raise ValueError("Unsupported source encoding")
    entries = [entrant(candidate, CANDIDATE, encoding),
               *opponents(Path(opponents_dir), candidate, encoding)]
    plan = make_schedule([entry["id"] for entry in entries[1:]], seeds, sizes, groups_per_size)
    if len(plan) * ticks > MAX_TICKS_TOTAL:
        raise ValueError(f"Schedule exceeds {MAX_TICKS_TOTAL} total ticks")
    robots = {entry["id"]: entry["robot"] for entry in entries}
    deadline = time.monotonic() + max_seconds

    def bounded_request(session, request):
        remaining = deadline - time.monotonic()
        if remaining <= 0:
            raise TimeoutError("Benchmark exceeded its overall time limit")
        session.timeout = min(timeout, remaining)
        return session.request({"kind": "battle", **request, "include_rng_seed": True})

    # Reject invalid programs before running any scored matches. Preflight never
    # executes robot instructions or chooses random starting positions.
    with NativeSession(binary, timeout) as session:
        for entry in entries:
            try:
                bounded_request(session, {"robots": [{**entry["robot"], "x": 50, "y": 50}],
                                          "ticks": 0, "seed": seeds[0]})
            except RuntimeError as error:
                raise RuntimeError(f"{entry['id']}: {error}") from error

    def run_chunk(chunk):
        results = []
        with NativeSession(binary, timeout) as session:
            for index, match in chunk:
                state = bounded_request(session, {"robots": [robots[name] for name in match["order"]],
                                                  "ticks": ticks, "seed": match["seed"],
                                                  "stop_when_finished": True, "events": True})
                try:
                    record = game_record(state, match["order"], match["seed"], ticks)
                except (KeyError, TypeError, IndexError) as error:
                    # An object can be valid JSON without satisfying the battle
                    # protocol. Route those failures through the same atomic
                    # failure-report path as explicit engine rejections.
                    raise RuntimeError(f"Native engine returned malformed battle state: {error}") from error
                results.append((index, {"size": match["size"], **record}))
        return results

    indexed = list(enumerate(plan))
    workers = min(workers, len(plan))
    with ThreadPoolExecutor(max_workers=workers) as pool:
        chunks = pool.map(run_chunk, [indexed[i::workers] for i in range(workers)])
        games = [game for _, game in sorted(item for chunk in chunks for item in chunk)]
    modes = {str(size): summarize([game for game in games if game["size"] == size])
             for size in sorted(set(sizes))}
    duels = {entry["id"]: summarize([game for game in games if game["size"] == 2 and
                                    entry["id"] in game["order"]]) for entry in entries[1:]}
    return {"schema_version": 1, "status": "completed",
            "config": {"seeds": list(seeds), "sizes": sorted(set(sizes)), "ticks": ticks,
                       "groups_per_size": groups_per_size, "workers": workers,
                       "encoding": encoding, "battle_timeout_seconds": timeout,
                       "overall_timeout_seconds": max_seconds,
                       "opponents_dir": str(Path(opponents_dir).resolve())},
            "schedule_sha256": hashlib.sha256(json.dumps(plan, sort_keys=True,
                                                         separators=(",", ":")).encode()).hexdigest(),
            "engine": {"path": str(binary.resolve()), "sha256": hashlib.sha256(binary.read_bytes()).hexdigest()},
            "entrants": [{key: value for key, value in entry.items() if key != "robot"} for entry in entries],
            "scoring": {"wins": "candidate is the sole survivor",
                        "draws": "battle has no sole survivor, including mutual destruction",
                        "losses": "another robot is the sole survivor",
                        "pairwise_survival_score": "mean fraction of opponents outlived; ties count half",
                        "average_place": "mean survival rank with tied places averaged",
                        "comparison": "compare candidates using identical schedule and opponent source hashes"},
            "overall": summarize(games), "modes": modes, "duels": duels, "games": games}


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--candidate", type=Path, required=True)
    parser.add_argument("--opponents-dir", type=Path, default=ROOT / "robots")
    parser.add_argument("--seed-list", required=True, help="comma-separated seeds, JSON array, or JSON-array file")
    parser.add_argument("--sizes", default="2,3,4,5")
    parser.add_argument("--groups-per-size", type=int, default=16, help="opponent groups per seed and multiplayer size")
    parser.add_argument("--ticks", type=int, default=2000)
    parser.add_argument("--workers", type=int, default=2)
    parser.add_argument("--binary", type=Path, default=ROOT / "build/robotwar")
    parser.add_argument("--encoding", choices=("utf-8", "mac-roman"), default="utf-8")
    parser.add_argument("--timeout", type=float, default=30)
    parser.add_argument("--max-seconds", type=float, default=1800)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args(argv)
    output_validated = False
    try:
        if args.output.resolve() in (args.candidate.resolve(), args.binary.resolve()) or args.output.resolve().is_relative_to(args.opponents_dir.resolve()):
            raise ValueError("output must not overwrite the candidate, engine, or opponent directory")
        output_validated = True
        result = run_benchmark(candidate=args.candidate, opponents_dir=args.opponents_dir,
                               seeds=seed_list(args.seed_list), sizes=[int(size) for size in args.sizes.split(",")],
                               groups_per_size=args.groups_per_size, ticks=args.ticks, workers=args.workers,
                               binary=args.binary, encoding=args.encoding, timeout=args.timeout,
                               max_seconds=args.max_seconds)
        args.output.parent.mkdir(parents=True, exist_ok=True)
        write_result(result, args.output)
    except (ValueError, OSError, RuntimeError, TimeoutError, argparse.ArgumentTypeError) as error:
        print(f"robot benchmark: {error}", file=sys.stderr)
        if output_validated:
            try:
                args.output.parent.mkdir(parents=True, exist_ok=True)
                write_result({"schema_version": 1, "status": "failed", "error": str(error)}, args.output)
            except OSError as write_error:
                print(f"robot benchmark: cannot write failure report: {write_error}", file=sys.stderr)
        return 1
    print(json.dumps({"output": str(args.output), "modes": result["modes"]}))
    return 0


if __name__ == "__main__":
    sys.exit(main())
