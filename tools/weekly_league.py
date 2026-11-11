"""Run a fresh weekly league across all robot directories and battle sizes."""
from __future__ import annotations

import argparse
from concurrent.futures import ThreadPoolExecutor
from datetime import date, datetime, timezone
import hashlib
import html
import json
import os
from pathlib import Path
import re
import subprocess
import sys

from battle_runner import ROOT, read_robot, run_native, write_result
from league_ratings import fit_ratings, ranked, schedule, seed_for

MAX_ROBOTS = 512
MAX_BATTLES = 100_000
MAX_TICKS_TOTAL = 200_000_000


def week_value(value: str) -> str:
    if not re.fullmatch(r"\d{4}-W\d{2}", value):
        raise ValueError("week must be an ISO week such as 2026-W46")
    date.fromisocalendar(int(value[:4]), int(value[-2:]), 1)
    return value


def discover(directory: Path, encoding: str) -> list[dict]:
    root, directory = (ROOT / "robots").resolve(), Path(directory).absolute()
    if not directory.resolve().is_relative_to(root) or not directory.is_dir():
        raise ValueError("robots-dir must be robots/ or one of its subdirectories")
    for parent in [directory, *directory.parents]:
        if parent.is_symlink():
            raise ValueError("Symbolic links are not supported in the robot directory")
        if parent == root:
            break
    directory = directory.resolve()
    paths = []
    def walk_error(error):
        raise error
    for current, directories, files in os.walk(directory, followlinks=False, onerror=walk_error):
        directories[:] = sorted(name for name in directories if not name.startswith("."))
        for name in directories + sorted(name for name in files if not name.startswith(".")):
            path = Path(current) / name
            if path.is_symlink():
                raise ValueError(f"Symbolic link in robot directory: {path.name}")
            if name in files:
                if not path.is_file():
                    raise ValueError("Robot input is not a regular file")
                paths.append(path)
                if len(paths) > MAX_ROBOTS:
                    raise ValueError(f"At most {MAX_ROBOTS} robots are supported")
    entrants = []
    for path in sorted(paths):
        entry = {"id": path.relative_to(root).as_posix(),
                 "source_sha256": hashlib.sha256(path.read_bytes()).hexdigest()}
        try:
            entry["robot"] = {**read_robot(path, encoding), "name": entry["id"]}
            entry["normalized_source_sha256"] = hashlib.sha256(
                bytes.fromhex(entry["robot"]["source_hex"])).hexdigest()
        except ValueError as error:
            entry["error"] = str(error)
        entrants.append(entry)
    return entrants


def game_record(state: dict, order: list[str], seed: int, ticks: int) -> dict:
    """Rank survival, tying eliminations within a tick and all final survivors."""
    robots = state["robots"]
    if [robot["name"] for robot in robots] != order:
        raise RuntimeError("Native engine returned different participants")
    alive = sum(robot["active"] for robot in robots)
    if state["alive"] != alive or not 1 <= state["tick"] <= ticks:
        raise RuntimeError("Native engine returned inconsistent battle state")
    if alive > 1 and state["tick"] != ticks:
        raise RuntimeError("Native engine stopped before the tick limit")
    deaths = {}
    for event in state["events"]:
        if event["kind"] == 3:  # WorldEvent::Kind::Destroyed; zero-based world tick.
            index, tick = event["robot"], event["tick"]
            if index in deaths or not 0 <= index < len(order) or not 0 <= tick < state["tick"]:
                raise RuntimeError("Invalid or repeated destruction event")
            deaths[index] = tick
    if set(deaths) != {i for i, robot in enumerate(robots) if not robot["active"]}:
        raise RuntimeError("Destruction events do not account for every eliminated robot")
    survival = [state["tick"] if robot["active"] else deaths[i] for i, robot in enumerate(robots)]
    ranks = [1 + sum(other > value for other in survival) for value in survival]
    winner = next((robot["name"] for robot in robots if robot["active"]), None) if alive == 1 else None
    return {"order": order, "seed": seed, "tick": state["tick"], "ranks": ranks,
            "death_ticks": [deaths.get(i) for i in range(len(order))], "winner": winner,
            "termination": "last_survivor" if winner else "tick_limit" if alive else "mutual_destruction",
            "rng_seed": state["rng_seed"],
            "state_sha256": hashlib.sha256(json.dumps(state, sort_keys=True, separators=(",", ":")).encode()).hexdigest()}


def play_group(group, plan, week, robots, binary, ticks, executor, phase=0):
    games = []
    for block in range(plan["seed_blocks"]):
        seed = seed_for(week, plan["size"], block, phase)
        for seat in range(len(group)):
            order = group[seat:] + group[:seat]
            state = executor({"robots": [robots[name] for name in order], "ticks": ticks,
                              "seed": seed, "stop_when_finished": True,
                              "include_rng_seed": True, "events": True}, binary)
            games.append(game_record(state, order, seed, ticks))
    return games


def run_league(*, directory=ROOT / "robots", binary=ROOT / "build/robotwar", week=None,
               ticks=2000, rounds=4, seeds=2, workers=2, encoding="utf-8",
               executor=None, progress=None) -> dict:
    week = week_value(week or datetime.now(timezone.utc).strftime("%G-W%V"))
    for value, name, upper in ((ticks, "ticks", 1_000_000), (rounds, "rounds", 32),
                               (seeds, "seeds", 20), (workers, "workers", 32)):
        if type(value) is not int or not 1 <= value <= upper:
            raise ValueError(f"{name} must be an integer from 1 to {upper}")
    binary = Path(binary)
    if not binary.is_file():
        raise ValueError("Native binary is missing; build it first or use --binary")
    if encoding not in ("utf-8", "mac-roman"):
        raise ValueError("Unsupported source encoding")
    executor = executor or (lambda request, path: run_native(request, path, timeout=30))
    entrants = discover(directory, encoding)
    robots = {}
    for entry in entrants:
        if "error" not in entry:
            try:
                executor({"robots": [{**entry["robot"], "x": 50, "y": 50}], "ticks": 0,
                          "seed": 1, "include_rng_seed": True}, binary)
                robots[entry["id"]] = entry["robot"]
            except ValueError as error:
                entry["error"] = str(error)
        if progress and "error" in entry:
            progress(f"Unranked: {entry['id']}: {entry['error']}")
    if len(robots) < 2:
        raise ValueError("At least two robots must compile before a league can be ranked")
    plans = [schedule(list(robots), size, week, rounds=rounds, seeds=seeds)
             for size in range(2, min(5, len(robots)) + 1)]
    projected = sum(plan["battle_count"] for plan in plans)
    if projected > MAX_BATTLES or projected * ticks > MAX_TICKS_TOTAL:
        raise ValueError(f"Projected {projected} battles / {projected * ticks} ticks exceed the "
                         f"{MAX_BATTLES}-battle / {MAX_TICKS_TOTAL}-tick budget")
    report = {"schema_version": 1, "status": "completed", "week": week,
              "config": {"ticks": ticks, "rounds": rounds, "seeds": seeds, "encoding": encoding,
                         "robots_dir": str(Path(directory).resolve().relative_to(ROOT)),
                         "minimum_games": 32, "exhaustive_group_limit": 128,
                         "rating_prior_draws": 2, "battle_timeout_seconds": 30},
              "revision": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
              "engine_sha256": hashlib.sha256(binary.read_bytes()).hexdigest(),
              "participants": [{key: value for key, value in entry.items() if key != "robot"}
                               for entry in entrants],
              "battle_count": projected, "modes": {}, "overall": [],
              "unavailable_modes": [size for size in range(2, 6) if size > len(robots)]}
    with ThreadPoolExecutor(max_workers=workers) as pool:
        for plan in plans:
            if progress:
                progress(f"{plan['size']}-way: {plan['method']}, {plan['battle_count']} battles, "
                         f"{plan['games_per_robot']} games per robot")
            futures = [pool.submit(play_group, group, plan, week, robots, binary, ticks, executor,
                                   index // len(robots) if plan["method"] == "balanced-circles" else 0)
                       for index, group in enumerate(plan["groups"])]
            try:
                games = [game for future in futures for game in future.result()]
            except Exception:
                for future in futures:
                    future.cancel()
                raise
            rows = fit_ratings(list(robots), games)
            report["modes"][str(plan["size"])] = {**plan, "standings": rows, "games": games}
    by_robot = {name: [] for name in robots}
    for mode in report["modes"].values():
        for row in mode["standings"]:
            by_robot[row["id"]].append(row)
    report["overall"] = ranked([
        {"id": name, "rating": round(sum(row["rating"] for row in rows) / len(rows), 1),
         "games": sum(row["games"] for row in rows),
         "provisional": any(row["provisional"] for row in rows), "modes": len(rows)}
        for name, rows in by_robot.items()])
    return report


def cell(value) -> str:
    text = html.escape(str(value)).replace("|", "&#124;").replace("\n", " ").replace("\r", " ")
    return re.sub(r"([\\`*_\[\]()!])", r"\\\1", text)


def summary(report: dict) -> str:
    lines = [f"# Robot Warriors weekly leaderboard — {report.get('week', 'unknown week')}", ""]
    if report["status"] != "completed":
        return "\n".join(lines + ["**Failed — no rankings published.**", "", cell(report["error"]), ""])
    lines += [f"Fresh ratings from commit `{report['revision']}`. "
              f"{report['battle_count']:,} battles; {report['config']['ticks']:,} ticks maximum per battle.", "",
              "Overall is the equal-weight mean of the available mode ratings. "
              "Scores measure relative survival performance in this week's field; "
              "they are estimates, not an absolute strength or a championship guarantee.", ""]
    tables = [("Overall", report["overall"])] + [
        (f"{size}-robot battles", mode["standings"]) for size, mode in report["modes"].items()]
    for title, rows in tables:
        lines += [f"## {title}", "", "| Rank | Robot | Rating | Games | Provisional |",
                  "| ---: | --- | ---: | ---: | --- |"]
        for row in rows:
            lines.append(f"| {row['rank']} | {cell(row['id'])} | {row['rating']:.1f} | "
                         f"{row['games']} | {'yes' if row['provisional'] else ''} |")
        lines.append("")
    if report["unavailable_modes"]:
        lines += ["Unavailable (not enough valid robots): " +
                  ", ".join(f"{size}-way" for size in report["unavailable_modes"]), ""]
    excluded = [entry for entry in report["participants"] if "error" in entry]
    if excluded:
        lines += ["## Unranked scripts", "", "| Robot | Compilation/input error |", "| --- | --- |"]
        lines.extend(f"| {cell(entry['id'])} | {cell(entry['error'])} |" for entry in excluded)
        lines.append("")
    lines += ["Later elimination ranks above earlier elimination; same-tick eliminations tie. "
              "All survivors at the tick cap tie. Damage and fuel do not break ties. "
              "A k-robot battle contributes pairwise weight 1/(k−1), with two virtual "
              "draws against a fixed 1500 reference regularizing each fresh fit. "
              "Provisional means fewer than 32 games or fewer than min(5, field size−1) opponents.", ""]
    return "\n".join(lines)


def compact(report: dict) -> dict:
    return {**report, "modes": {size: {key: value for key, value in mode.items()
                                       if key not in ("games", "groups")}
                               for size, mode in report.get("modes", {}).items()}}


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--robots-dir", type=Path, default=ROOT / "robots")
    parser.add_argument("--binary", type=Path, default=ROOT / "build/robotwar")
    parser.add_argument("--week", help="ISO week; defaults to the current UTC week")
    parser.add_argument("--ticks", type=int, default=2000)
    parser.add_argument("--rounds", type=int, default=4, help="Balanced circle rounds for sampled modes")
    parser.add_argument("--seeds", type=int, default=2, help="Minimum independent seed blocks per mode")
    parser.add_argument("--workers", type=int, default=2)
    parser.add_argument("--encoding", choices=("utf-8", "mac-roman"), default="utf-8")
    parser.add_argument("--output-dir", type=Path, default=ROOT / "build/weekly")
    args = parser.parse_args(argv)
    output = args.output_dir.resolve()
    try:
        if output == ROOT or ROOT.is_relative_to(output) or output.is_relative_to(ROOT / "robots"):
            raise ValueError("Reports must not overwrite source directories")
        output.mkdir(parents=True, exist_ok=True)
        # Invalidate stale success before preflight/execution, including interruption.
        for name in ("results.json", "leaderboard.json", "leaderboard.md"):
            (output / name).unlink(missing_ok=True)
        try:
            report = run_league(directory=args.robots_dir, binary=args.binary, week=args.week,
                                ticks=args.ticks, rounds=args.rounds, seeds=args.seeds,
                                workers=args.workers, encoding=args.encoding,
                                progress=lambda message: print(message, file=sys.stderr))
        except Exception as error:
            report = {"schema_version": 1, "status": "failed", "week": args.week,
                      "error": str(error), "overall": [], "modes": {}}
        write_result(report, output / "results.json")
        write_result(compact(report), output / "leaderboard.json")
        (output / "leaderboard.md").write_text(summary(report), encoding="utf-8")
        if report["status"] != "completed":
            print(report["error"], file=sys.stderr)
            return 2
        return 0
    except (OSError, ValueError) as error:
        print(f"{parser.prog}: {error}", file=sys.stderr)
        return 2
