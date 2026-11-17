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
from robot_metadata import extract_metadata

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
        entry.update(extract_metadata("", entry["id"]))
        try:
            source = path.read_bytes().decode("utf-8-sig" if encoding == "utf-8" else "mac_roman")
            entry.update(extract_metadata(source, entry["id"]))
            entry["robot"] = {**read_robot(path, encoding), "name": entry["id"]}
            entry["normalized_source_sha256"] = hashlib.sha256(
                bytes.fromhex(entry["robot"]["source_hex"])).hexdigest()
        except ValueError as error:
            entry["error"] = str(error)
        entrants.append(entry)
    return entrants


def validate_identities(entrants):
    """Exclude ambiguous identities rather than arbitrarily choosing a version."""
    robots, authors = {}, {}
    for entry in entrants:
        if "error" not in entry:
            robots.setdefault(entry["robot_id"], []).append(entry)
            if entry["author_id"] is not None:
                authors.setdefault(entry["author_id"], []).append(entry)
    for identity, entries in robots.items():
        if len(entries) > 1:
            for entry in entries:
                entry["error"] = f"Multiple active files for robot identity {identity}; keep one version"
    for identity, entries in authors.items():
        if len({entry["author"] for entry in entries}) > 1:
            for entry in entries:
                entry["error"] = f"Conflicting author names for {identity}; use one display name this week"


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
            "survived": [robot["active"] for robot in robots],
            "final_damage": [robot.get("registers", [None] * 19)[4] for robot in robots],
            "cpu_resets": [robot.get("error_resets", 0) for robot in robots],
            "termination": "last_survivor" if winner else "tick_limit" if alive else "mutual_destruction",
            "rng_seed": state["rng_seed"],
            "state_sha256": hashlib.sha256(json.dumps(state, sort_keys=True, separators=(",", ":")).encode()).hexdigest()}


def statistics(ids, games):
    """Whole-battle counts and actual survival/placement statistics, per robot."""
    stats = {name: {"games": 0, "wins": 0, "draws": 0, "losses": 0, "survivals": 0,
                    "place_sum": 0.0, "survival_ticks": 0, "damage_sum": 0,
                    "damage_samples": 0, "cpu_resets": 0} for name in ids}
    for game in games:
        for index, name in enumerate(game["order"]):
            row = stats[name]
            row["games"] += 1
            row["wins"] += game["winner"] == name
            row["draws"] += game["winner"] is None
            row["losses"] += game["winner"] is not None and game["winner"] != name
            alive = game["death_ticks"][index] is None
            row["survivals"] += alive
            rank = game["ranks"][index]
            row["place_sum"] += rank + (game["ranks"].count(rank) - 1) / 2
            row["survival_ticks"] += game["tick"] if alive else game["death_ticks"][index] + 1
            damage = game["final_damage"][index]
            if damage is not None:
                row["damage_sum"] += damage
                row["damage_samples"] += 1
            row["cpu_resets"] += game["cpu_resets"][index]
    for name, row in stats.items():
        games = row["games"]
        stats[name] = {key: row[key] for key in ("games", "wins", "draws", "losses", "cpu_resets")}
        stats[name].update({"win_rate": round(row["wins"] / games, 4),
                            "survival_rate": round(row["survivals"] / games, 4),
                            "average_place": round(row["place_sum"] / games, 2),
                            "average_survival_ticks": round(row["survival_ticks"] / games, 1),
                            "average_final_damage": round(row["damage_sum"] / row["damage_samples"], 1)
                            if row["damage_samples"] else None})
    return stats


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
               executor=None, progress=None, history_dir=None) -> dict:
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
    validate_identities(entrants)
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
    report = {"schema_version": 2, "status": "completed", "week": week,
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
    if history_dir is not None and (Path(history_dir) / ".history-source.json").is_file():
        source = json.loads((Path(history_dir) / ".history-source.json").read_text())
        if source.get("branch") != "league-history" or (source.get("revision") is not None
                and not re.fullmatch(r"[a-f0-9]{40,64}", source["revision"])):
            raise ValueError("Invalid history source marker")
        report["history_base_revision"] = source["revision"]
    metadata = {entry["id"]: {key: entry[key] for key in
                ("robot_name", "robot_id", "author", "author_id", "version", "metadata_source")}
                for entry in entrants if entry["id"] in robots}
    all_games = []
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
            extra = statistics(robots, games)
            for row in rows:
                row.update(metadata[row["id"]])
                row.update(extra[row["id"]])
            all_games.extend(games)
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
    extra = statistics(robots, all_games)
    for row in report["overall"]:
        row.update(metadata[row["id"]])
        row.update(extra[row["id"]])
    from league_history import enrich_history
    enrich_history(report, history_dir)
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
        lines += [f"## {title}", "", "| Rank | Robot | Author | Version | Rating | Δ rank | Games | W–D–L | Win % | Survive % | Avg place | Provisional |",
                  "| ---: | --- | --- | --- | ---: | ---: | ---: | --- | ---: | ---: | ---: | --- |"]
        for row in rows:
            change = row.get("rank_change")
            lines.append(f"| {row['rank']} | {cell(row.get('robot_name', row['id']))} | "
                         f"{cell(row.get('author', 'Unattributed'))} | {cell(row.get('version', 'unversioned'))} | "
                         f"{row['rating']:.1f} | {change if change is not None else '—'} | {row['games']} | "
                         f"{row['wins']}–{row['draws']}–{row['losses']} | {100 * row['win_rate']:.1f} | "
                         f"{100 * row['survival_rate']:.1f} | {row['average_place']:.2f} | "
                         f"{'yes' if row['provisional'] else ''} |")
        lines.append("")
    lines += ["## Leading authors this week", "", "Author rating is their best robot's overall rating; "
              "submitting more robots does not add ratings together.", "",
              "| Rank | Author | Rating | Robots | Games | Wins |", "| ---: | --- | ---: | ---: | ---: | ---: |"]
    for row in report.get("authors", []):
        lines.append(f"| {row['rank']} | {cell(row['author'])} | {row['rating']:.1f} | "
                     f"{row['robots']} | {row['games']} | {row['wins']} |")
    if not report.get("authors"):
        lines.append("No attributed authors in this field.")
    for kind, label, name in (("authors", "Authors", "author"), ("robots", "Robots", "robot_name")):
        lines += ["", f"## Historical leaders — {label}", "",
                  "| Rank | Name | League points | Weeks | Weekly leads | Best rank | Last seen |",
                  "| ---: | --- | ---: | ---: | ---: | ---: | --- |"]
        for row in report.get("history", {}).get(kind, []):
            lines.append(f"| {row['rank']} | {cell(row[name])} | {row['points']:.1f} | {row['weeks']} | "
                         f"{row['weekly_wins']} | {row['best_rank']} | {cell(row['last_seen'])} |")
    lines += ["", "Historical points sum each week's midrank percentile (0–100). "
              "Repeated runs replace that week. Ratings remain fresh; points reward sustained participation.", ""]
    showcase = report.get("showcase", {})
    if showcase.get("status") == "completed":
        lines += ["## Top-five showcase", "", "A separate exhibition of the five-way top five; "
                  "its outcome does not change league ratings.", "",
                  f"Seed: {showcase['seed']}. Final tick: {showcase['tick']}. "
                  f"GIF: `{showcase['gif_file']}`. Replay: `{showcase['replay_file']}`.", ""]
    elif showcase:
        lines += ["Showcase skipped: " + cell(showcase.get("reason", "Insufficient entrants")), ""]
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
    parser.add_argument("--history-dir", type=Path, help="Archived weeks from the league-history branch")
    parser.add_argument("--media", action="store_true", help="Render Discord table PNGs and the top-five GIF")
    args = parser.parse_args(argv)
    output = args.output_dir.resolve()
    try:
        if output == ROOT or ROOT.is_relative_to(output) or output.is_relative_to(ROOT / "robots"):
            raise ValueError("Reports must not overwrite source directories")
        output.mkdir(parents=True, exist_ok=True)
        # Invalidate stale success before preflight/execution, including interruption.
        for name in ("results.json", "leaderboard.json", "leaderboard.md", "history-week.json",
                     "showcase.gif", "showcase.json", "leaderboard-current.png",
                     "leaderboard-formats.png", "leaderboard-history.png", "discord-preview.json"):
            (output / name).unlink(missing_ok=True)
        try:
            report = run_league(directory=args.robots_dir, binary=args.binary, week=args.week,
                                ticks=args.ticks, rounds=args.rounds, seeds=args.seeds,
                                workers=args.workers, encoding=args.encoding, history_dir=args.history_dir,
                                progress=lambda message: print(message, file=sys.stderr))
            if args.media:
                from league_showcase import generate_showcase
                from league_tables import render_tables
                report["showcase"] = generate_showcase(report, output, args.binary)
                report["table_images"] = render_tables(report, output)
            from league_history import write_snapshot
            write_snapshot(report, output / "history-week.json")
        except Exception as error:
            for name in ("history-week.json", "showcase.gif", "showcase.json", "leaderboard-current.png",
                         "leaderboard-formats.png", "leaderboard-history.png", "discord-preview.json"):
                (output / name).unlink(missing_ok=True)
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
