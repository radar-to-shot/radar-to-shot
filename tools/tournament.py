"""Tournament execution, input validation, replay evidence, and report output."""

from __future__ import annotations

import argparse
from concurrent.futures import ThreadPoolExecutor
from dataclasses import dataclass
import hashlib
import html
import json
import os
from pathlib import Path
import sys

from battle_runner import ROOT, read_robot, run_native, write_result
from tournament_format import TournamentFormat

MAX_ROBOTS = 512
MAX_BATTLES = 100_000
MAX_TOTAL_TICKS = 200_000_000
BATTLE_TIMEOUT = 30


@dataclass(frozen=True)
class TournamentConfig:
    robots_dir: Path
    binary: Path = ROOT / "build/robotwar"
    format: str = "auto"
    rounds: int = 0
    seeds_per_pair: int = 3
    seed: int = 1
    ticks: int = 2000
    workers: int = 2
    encoding: str = "utf-8"


class TournamentError(RuntimeError):
    """Execution failed; report contains evidence but never a partial champion."""

    def __init__(self, message: str, report: dict):
        super().__init__(message)
        self.report = report


def _bounded(value, name, low, high):
    if isinstance(value, bool) or not isinstance(value, int) or not low <= value <= high:
        raise ValueError(f"{name} must be an integer between {low} and {high}")


def _validate(config: TournamentConfig) -> None:
    _bounded(config.seed, "seed", 0, 0xFFFFFFFF)
    _bounded(config.rounds, "rounds", 0, MAX_ROBOTS - 1)
    _bounded(config.seeds_per_pair, "seeds_per_pair", 1, 20)
    _bounded(config.ticks, "ticks", 1, 1_000_000)
    _bounded(config.workers, "workers", 1, 32)
    if config.encoding not in ("utf-8", "mac-roman"):
        raise ValueError("encoding must be utf-8 or mac-roman")
    if not Path(config.binary).is_file():
        raise ValueError(f"Native binary not found: {config.binary}; build it or use --binary")


def discover_robots(directory: Path, encoding: str = "utf-8") -> list[dict]:
    """Read every nonhidden regular file recursively, retaining relative identity."""
    robot_root = (ROOT / "robots").resolve()
    directory = Path(directory)
    resolved = directory.resolve()
    if resolved == robot_root or not resolved.is_relative_to(robot_root):
        raise ValueError("robots-dir must be a subdirectory below the repository's robots/")
    if not directory.is_dir():
        raise ValueError(f"Robot directory does not exist: {directory}")
    # Refuse even in-tree symlinks: the entrant manifest should describe actual
    # files, not silently duplicate or omit robots via directory aliases.
    for part in [directory, *directory.parents]:
        if part.is_symlink():
            raise ValueError(f"Symbolic links are not supported: {part}")
        if part.resolve() == robot_root:
            break
    paths = []
    for current, directories, files in os.walk(resolved, followlinks=False):
        directories[:] = sorted(name for name in directories if not name.startswith("."))
        names = directories + sorted(name for name in files if not name.startswith("."))
        for name in names:
            path = Path(current) / name
            if path.is_symlink():
                raise ValueError(f"Symbolic links are not supported: {path}")
            if name in files:
                if not path.is_file():
                    raise ValueError(f"Robot input is not a regular file: {path}")
                paths.append(path)
                if len(paths) > MAX_ROBOTS:
                    raise ValueError(f"A tournament supports at most {MAX_ROBOTS} robots")
    if len(paths) < 2:
        raise ValueError("A tournament needs at least two robot files")
    entrants = []
    for path in sorted(paths):
        robot = read_robot(path, encoding)
        robot["name"] = path.relative_to(resolved).as_posix()
        entrants.append({
            "id": robot["name"],
            "path": path.relative_to(robot_root).as_posix(),
            "source_sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
            "normalized_source_sha256": hashlib.sha256(bytes.fromhex(robot["source_hex"])).hexdigest(),
            "robot": robot,
        })
    return entrants


def battle_seed(seed: int, round_number: int, block: int) -> int:
    """Stable across Python versions, participant names, and worker scheduling."""
    raw = f"robotwar-tournament-v1:{seed}:{round_number}:{block}".encode("ascii")
    # Every result is a nonzero QuickDraw seed below its modulus.
    return 1 + int.from_bytes(hashlib.sha256(raw).digest()[:8], "big") % 0x7FFFFFFE


def _game_record(state: dict, order: list[str], seed: int, ticks: int) -> dict:
    robots = state["robots"]
    if len(robots) != 2 or [robot["name"] for robot in robots] != order:
        raise RuntimeError("Native engine returned different participants")
    survivors = [i for i, robot in enumerate(robots) if robot["active"]]
    if state["alive"] != len(survivors) or not 0 <= state["tick"] <= ticks:
        raise RuntimeError("Native engine returned an inconsistent battle result")
    if len(survivors) == 2 and state["tick"] != ticks:
        raise RuntimeError("Native engine stopped before the tournament tick limit")
    winner = order[survivors[0]] if len(survivors) == 1 else None
    reason = "last_survivor" if winner else "mutual_destruction" if not survivors else "tick_limit"
    fields = ("name", "active", "registers", "velocity", "score", "raw_damage",
              "shell_active", "pc", "error_resets")
    return {
        "order": order,
        "seed": seed,
        "tick": state["tick"],
        "termination": reason,
        "winner": winner,
        "rng_seed": state["rng_seed"],
        "robots": [{key: robot[key] for key in fields if key in robot} for robot in robots],
        "state_sha256": hashlib.sha256(
            json.dumps(state, sort_keys=True, separators=(",", ":"), ensure_ascii=True).encode()
        ).hexdigest(),
    }


def _play_pair(pair, round_number, robots, config, executor):
    a, b = pair
    games = []
    wins = {a: 0, b: 0}
    draws = 0
    for block in range(config.seeds_per_pair):
        seed = battle_seed(config.seed, round_number, block)
        for order in ([a, b], [b, a]):
            request = {
                "robots": [robots[name] for name in order],
                "ticks": config.ticks,
                "seed": seed,
                "stop_when_finished": True,
                "include_rng_seed": True,
            }
            try:
                state = executor(request, config.binary)
                game = _game_record(state, order, seed, config.ticks)
            except Exception as error:
                raise RuntimeError(
                    f"Round {round_number}, {a!r} vs {b!r}, seed {seed}, "
                    f"order {order!r}: {error}"
                ) from error
            games.append(game)
            if game["winner"] is None:
                draws += 1
            else:
                wins[game["winner"]] += 1
    return {
        "round": round_number,
        "robots": [a, b],
        "points_twice": [2 * wins[a] + draws, 2 * wins[b] + draws],
        "wins": [wins[a], wins[b]],
        "draws": draws,
        "games": games,
    }


def run_tournament(config: TournamentConfig, *, battle_executor=None, progress=None) -> dict:
    """Run complete rounds; injected executors use run_native(request, binary)'s ABI."""
    _validate(config)
    entrants = discover_robots(config.robots_dir, config.encoding)
    games_per_pair = 2 * config.seeds_per_pair
    schedule = TournamentFormat(
        [entry["id"] for entry in entrants], config.seed, games_per_pair,
        format=config.format, rounds=config.rounds,
    )
    # Full round-robin has N*(N-1)/2 pairings, including odd-sized fields.
    pairings = (len(entrants) * (len(entrants) - 1) // 2 if schedule.format == "round-robin"
                else (len(entrants) // 2) * schedule.rounds)
    projected = pairings * games_per_pair
    if projected > MAX_BATTLES or projected * config.ticks > MAX_TOTAL_TICKS:
        raise ValueError(
            f"Projected work ({projected} battles, {projected * config.ticks} ticks) exceeds "
            f"the {MAX_BATTLES}-battle / {MAX_TOTAL_TICKS}-tick budget; reduce rounds, seeds or ticks"
        )
    report = {
        "schema_version": 1,
        "status": "running",
        "format": schedule.format,
        "config": {
            "robots_dir": str(Path(config.robots_dir).resolve().relative_to(ROOT)),
            "seed": config.seed, "ticks": config.ticks, "rounds": schedule.rounds,
            "seeds_per_pair": config.seeds_per_pair, "encoding": config.encoding,
            "battle_timeout_seconds": BATTLE_TIMEOUT,
        },
        "engine": {"name": "headless", "binary_sha256": hashlib.sha256(Path(config.binary).read_bytes()).hexdigest()},
        "participants": [{key: value for key, value in entry.items() if key != "robot"}
                         for entry in entrants],
        "projected_battles": projected,
        "battle_count": 0,
        "rounds": [], "matches": [], "standings": [], "champions": [], "winner": None,
    }
    robots = {entry["id"]: entry["robot"] for entry in entrants}
    executor = battle_executor or (lambda request, binary: run_native(request, binary, timeout=BATTLE_TIMEOUT))
    try:
        if progress:
            progress(f"{len(entrants)} robots; {schedule.format}; {schedule.rounds} rounds; "
                     f"{projected} battles; at most {projected * config.ticks} simulated ticks")
        # Compile every entrant before any scored game. A single-robot, explicit
        # position, zero-tick request exercises the original-byte compiler API.
        for name, robot in robots.items():
            try:
                executor({"robots": [{**robot, "x": 50, "y": 50}], "ticks": 0,
                          "seed": 1, "include_rng_seed": True}, config.binary)
            except Exception as error:
                raise RuntimeError(f"Robot {name!r} failed preflight compilation: {error}") from error
        with ThreadPoolExecutor(max_workers=config.workers) as pool:
            while (round_plan := schedule.next_round()) is not None:
                number = round_plan["number"]
                if progress:
                    progress(f"Round {number}/{schedule.rounds}: {len(round_plan['pairs'])} pairings")
                round_report = {**round_plan, "completed": False}
                report["rounds"].append(round_report)
                futures = [pool.submit(_play_pair, pair, number, robots, config, executor)
                           for pair in round_plan["pairs"]]
                # Collect in schedule order, so worker count cannot change reports
                # or Swiss pairing decisions. Pairings within a round are independent.
                try:
                    for future in futures:
                        match = future.result()
                        a, b = match["robots"]
                        schedule.record_pair(a, b, *match["points_twice"], *match["wins"], match["draws"])
                        report["matches"].append(match)
                        report["battle_count"] += len(match["games"])
                except Exception:
                    for future in futures:
                        future.cancel()
                    raise
                schedule.finish_round()
                round_report["completed"] = True
        report["standings"] = schedule.standings()
        report["champions"] = schedule.champions()
        report["winner"] = report["champions"][0] if len(report["champions"]) == 1 else None
        report["status"] = "completed"
        return report
    except Exception as error:
        report["status"] = "failed"
        report["error"] = str(error)
        # Incomplete rounds and partial results must never declare a champion.
        raise TournamentError(str(error), report) from error


def _cell(text) -> str:
    return html.escape(str(text)).replace("|", "&#124;").replace("\n", " ").replace("\r", " ")


def summary_markdown(report: dict) -> str:
    lines = ["# Robot Warriors head-to-head tournament", "",
             f"Status: **{report['status']}**. Format: **{report['format']}**. "
             f"Robots: {len(report['participants'])}. Battles: "
             f"{report['battle_count']}/{report['projected_battles']}.", ""]
    if report["status"] != "completed":
        lines += ["No winner was declared.", "", _cell(report.get("error", "Incomplete tournament"))]
        return "\n".join(lines) + "\n"
    label = "Winner" if len(report["champions"]) == 1 else "Joint winners"
    lines += [f"**{label}:** " + ", ".join(_cell(name) for name in report["champions"]), "",
              "| Rank | Robot | Points | W–D–L | Games | Byes | Opponent average | Weighted opponent average |",
              "| ---: | --- | ---: | --- | ---: | ---: | ---: | ---: |"]
    for entry in report["standings"]:
        lines.append(
            f"| {entry['rank']} | {_cell(entry['id'])} | {entry['points']:g} | "
            f"{entry['wins']}–{entry['draws']}–{entry['losses']} | {entry['played_games']} | "
            f"{entry['byes']} | {entry['opponent_average']:.4f} | "
            f"{entry['weighted_opponent_average']:.4f} |"
        )
    repeats = sum(round_plan.get("minimum_repeats", 0) for round_plan in report["rounds"])
    lines += ["", "Each pairing uses the same seeds in both robot orders. Wins earn 1 point; "
              "draws earn ½. A Swiss bye earns half a series, without recording a win. "
              "Exact ties after opponent-strength tiebreaks share the rank.", "",
              f"Repeated Swiss pairings: {repeats}. Seed: {report['config']['seed']}. "
              f"Tick limit: {report['config']['ticks']}.", "",
              "Results JSON contains source hashes, the complete schedule, seeds, draw reasons, "
              "compact final states, and full-state hashes for replay. This ranks head-to-head "
              "performance; multiplayer free-for-all performance can differ."]
    return "\n".join(lines) + "\n"


def _seed(text: str) -> int:
    try:
        return int(text, 16 if text.lower().startswith("0x") else 10)
    except ValueError as error:
        raise argparse.ArgumentTypeError("seed must be a decimal or hexadecimal integer") from error


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--robots-dir", type=Path, required=True)
    parser.add_argument("--binary", type=Path, default=ROOT / "build/robotwar")
    parser.add_argument("--format", choices=("auto", "round-robin", "swiss"), default="auto")
    parser.add_argument("--rounds", type=int, default=0, help="Swiss rounds; 0 selects the automatic count")
    parser.add_argument("--seeds-per-pair", type=int, default=3)
    parser.add_argument("--seed", type=_seed, default=1)
    parser.add_argument("--ticks", type=int, default=2000)
    parser.add_argument("--workers", type=int, default=2)
    parser.add_argument("--encoding", choices=("utf-8", "mac-roman"), default="utf-8")
    parser.add_argument("--output", type=Path, default=ROOT / "build/tournament/results.json")
    parser.add_argument("--summary", type=Path)
    args = parser.parse_args(argv)
    try:
        destinations = [args.output] + ([args.summary] if args.summary else [])
        if len({path.resolve() for path in destinations}) != len(destinations):
            raise ValueError("JSON output and summary must use different paths")
        for path in destinations:
            if path.resolve().is_relative_to((ROOT / "robots").resolve()):
                raise ValueError("Tournament reports must be outside robots/ to preserve source files")
        config = TournamentConfig(**{key: value for key, value in vars(args).items()
                                     if key not in ("output", "summary")})
        status = 0
        try:
            result = run_tournament(config, progress=lambda message: print(message, file=sys.stderr))
        except TournamentError as error:
            result = error.report
            print(error, file=sys.stderr)
            status = 2
        except (OSError, ValueError, RuntimeError) as error:
            # Once destinations are validated, replace stale success reports even
            # if source discovery or configuration fails before a schedule exists.
            result = {
                "schema_version": 1, "status": "failed", "format": config.format,
                "config": {"robots_dir": str(config.robots_dir), "seed": config.seed,
                           "ticks": config.ticks, "rounds": config.rounds,
                           "seeds_per_pair": config.seeds_per_pair, "encoding": config.encoding},
                "participants": [], "projected_battles": 0, "battle_count": 0,
                "rounds": [], "matches": [], "standings": [], "champions": [],
                "winner": None, "error": str(error),
            }
            print(f"{parser.prog}: {error}", file=sys.stderr)
            status = 2
        for path in destinations:
            path.parent.mkdir(parents=True, exist_ok=True)
        write_result(result, args.output)
        if args.summary:
            args.summary.write_text(summary_markdown(result), encoding="utf-8")
        return status
    except (OSError, ValueError, RuntimeError) as error:
        print(f"{parser.prog}: {error}", file=sys.stderr)
        return 2
