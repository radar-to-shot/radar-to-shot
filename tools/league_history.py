"""Stable author/robot identities and durable, replaceable weekly snapshots.

Current ratings remain fresh weekly fits. Historical league points sum each
week's percentile standing, including midranks for ties. They are deliberately
separate from Elo-style ratings and reward sustained participation.
"""
from __future__ import annotations

from collections import defaultdict
from copy import deepcopy
from datetime import date
from fractions import Fraction
import json
import math
from pathlib import Path
import re

from battle_runner import write_result

SCHEMA_VERSION = 1
SNAPSHOT_KIND = "robotwar-weekly-history"
MAX_SNAPSHOT_BYTES = 10 * 1024 * 1024
MAX_ENTRANTS = 512


def _week(value):
    if not isinstance(value, str) or not re.fullmatch(r"\d{4}-W\d{2}", value):
        raise ValueError("History week must be an ISO week such as 2026-W46")
    date.fromisocalendar(int(value[:4]), int(value[-2:]), 1)
    return value


def _text(value, label):
    if (not isinstance(value, str) or not value or len(value) > 4096
            or any(ord(character) < 32 or ord(character) == 127 for character in value)):
        raise ValueError(f"History {label} must be a nonempty single-line string")
    return value


def _number(value, label, *, integer=False, minimum=None, maximum=None):
    try:
        finite = math.isfinite(value)
    except (TypeError, OverflowError):
        finite = False
    if type(value) not in ((int,) if integer else (int, float)) or not finite:
        raise ValueError(f"History {label} must be a finite {'integer' if integer else 'number'}")
    if minimum is not None and value < minimum or maximum is not None and value > maximum:
        raise ValueError(f"History {label} is outside its valid range")
    return value


def _rank(rows, identity, score="rating"):
    rows = sorted(rows, key=lambda row: (-row[score], row[identity]))
    previous, rank = None, 0
    for position, row in enumerate(rows, 1):
        if row[score] != previous:
            rank = position
        row["rank"], previous = rank, row[score]
    return rows


def _robot_row(row, participant=None):
    participant = participant or {}
    raw_id = _text(row.get("id"), "robot path")
    author_id = row.get("author_id")
    if author_id is not None:
        _text(author_id, "author ID")
    games = _number(row.get("games", 0), "games", integer=True, minimum=0)
    wins = _number(row.get("wins", 0), "wins", integer=True, minimum=0, maximum=games)
    draws = _number(row.get("draws", 0), "draws", integer=True, minimum=0, maximum=games - wins)
    losses = _number(row.get("losses", games - wins - draws), "losses", integer=True,
                     minimum=0, maximum=games)
    if wins + draws + losses != games:
        raise ValueError("History robot W/D/L counters must account for every game")
    result = {
        "id": raw_id,
        "robot_id": _text(row.get("robot_id", "legacy:" + raw_id), "robot ID"),
        "robot_name": _text(row.get("robot_name", Path(raw_id).name), "robot name"),
        "author_id": author_id,
        "author": _text(row.get("author", "Unattributed"), "author name"),
        "version": _text(row.get("version", "unversioned"), "robot version"),
        "rating": round(_number(row.get("rating"), "rating"), 1),
        "rank": _number(row.get("rank"), "rank", integer=True, minimum=1),
        "games": games, "wins": wins, "draws": draws, "losses": losses,
        "win_rate": wins / games if games else 0.0,
    }
    source_hash = row.get("source_sha256", participant.get("source_sha256"))
    if source_hash is not None:
        if not isinstance(source_hash, str) or not re.fullmatch(r"[a-f0-9]{64}", source_hash):
            raise ValueError("History source_sha256 must be a SHA-256 digest")
        result["source_sha256"] = source_hash
    for field, lower, upper in (("survival_rate", 0, 1), ("average_place", 1, 5)):
        if row.get(field) is not None:
            result[field] = _number(row[field], field, minimum=lower, maximum=upper)
    return result


def _check_ranked(rows, identity, *, score="rating"):
    if not isinstance(rows, list) or len(rows) > MAX_ENTRANTS:
        raise ValueError("History standings must contain at most 512 rows")
    ids = [row[identity] for row in rows]
    if len(ids) != len(set(ids)):
        raise ValueError(f"Duplicate history {identity}")
    expected = {row[identity]: row["rank"] for row in _rank(deepcopy(rows), identity, score)}
    if any(row["rank"] != expected[row[identity]] for row in rows):
        raise ValueError("History ranks do not agree with displayed ratings and shared ties")


def author_standings(robots):
    """Rank authors by their best overall robot, not their submission count."""
    groups = defaultdict(list)
    for row in robots:
        if row["author_id"] is not None:
            groups[row["author_id"]].append(row)
    result = []
    for author_id, entries in groups.items():
        best = min(entries, key=lambda row: (-row["rating"], row["robot_id"]))
        totals = {field: sum(row[field] for row in entries)
                  for field in ("games", "wins", "draws", "losses")}
        result.append({"author_id": author_id, "author": best["author"],
                       "rating": best["rating"], "robots": len(entries), **totals,
                       "win_rate": totals["wins"] / totals["games"] if totals["games"] else 0.0,
                       "best_robot_id": best["robot_id"], "best_robot_name": best["robot_name"],
                       "best_robot_version": best["version"]})
    return _rank(result, "author_id")


def _snapshot(report):
    if report.get("status") != "completed" or not report.get("overall"):
        raise ValueError("Only a completed, nonempty league can enter history")
    participants = {entry["id"]: entry for entry in report.get("participants", [])}
    robots = [_robot_row(row, participants.get(row["id"])) for row in report["overall"]]
    _check_ranked(robots, "robot_id")
    paths = [row["id"] for row in robots]
    if len(paths) != len(set(paths)):
        raise ValueError("Duplicate robot source path in weekly history")
    by_path = {row["id"]: row for row in robots}
    modes = {}
    for mode, data in sorted(report.get("modes", {}).items()):
        if mode not in ("2", "3", "4", "5"):
            raise ValueError("Unknown battle size in weekly history")
        rows = []
        for row in data["standings"]:
            if row["id"] not in by_path:
                raise ValueError("Mode standings contain a robot absent from the overall standings")
            rows.append({"robot_id": by_path[row["id"]]["robot_id"],
                         "rating": round(_number(row["rating"], "mode rating"), 1),
                         "rank": _number(row["rank"], "mode rank", integer=True, minimum=1)})
        _check_ranked(rows, "robot_id")
        if {row["robot_id"] for row in rows} != {row["robot_id"] for row in robots}:
            raise ValueError("Each historical battle size must account for every ranked robot")
        modes[mode] = sorted(rows, key=lambda row: (row["rank"], row["robot_id"]))
    snapshot = {"schema_version": SCHEMA_VERSION, "kind": SNAPSHOT_KIND,
                "week": _week(report.get("week")),
                "revision": _text(report.get("revision"), "source revision"),
                "robots": sorted(robots, key=lambda row: (row["rank"], row["robot_id"])),
                "authors": author_standings(robots), "modes": modes}
    return snapshot


def make_snapshot(report: dict) -> dict:
    """Build the canonical compact record for a completed leaderboard report."""
    return _snapshot(report)


def _validate_snapshot(value, expected_week):
    if (not isinstance(value, dict) or type(value.get("schema_version")) is not int
            or value.get("schema_version") != SCHEMA_VERSION or value.get("kind") != SNAPSHOT_KIND):
        raise ValueError("Unsupported weekly history snapshot schema")
    if _week(value.get("week")) != expected_week:
        raise ValueError("History snapshot week does not match its filename")
    robots = value.get("robots")
    if not isinstance(robots, list) or not robots:
        raise ValueError("History snapshot needs ranked robots")
    required = {"id", "robot_id", "robot_name", "author", "author_id", "version",
                "rating", "rank", "games", "wins", "draws", "losses", "win_rate"}
    if any(not isinstance(row, dict) or not required <= row.keys() for row in robots):
        raise ValueError("History snapshot is missing robot identity or statistics")
    modes = value.get("modes")
    if not isinstance(modes, dict):
        raise ValueError("History snapshot needs a battle-size map")
    paths = {row["robot_id"]: row["id"] for row in robots}
    report_modes = {}
    for mode, rows in modes.items():
        if not isinstance(rows, list):
            raise ValueError("History mode standings must be a list")
        expanded = []
        for row in rows:
            if not isinstance(row, dict) or row.get("robot_id") not in paths:
                raise ValueError("History mode contains an unknown robot")
            expanded.append({**row, "id": paths[row["robot_id"]]})
        report_modes[mode] = {"standings": expanded}
    reconstructed = _snapshot({"status": "completed", "week": value["week"],
                               "revision": value.get("revision"), "overall": robots,
                               "modes": report_modes})
    if value.get("authors") != reconstructed["authors"]:
        raise ValueError("History author standings do not agree with robot standings")
    for original, normalized in zip(robots, [_robot_row(row) for row in robots]):
        if original["win_rate"] != normalized["win_rate"]:
            raise ValueError("History win rate does not agree with game counts")
    return reconstructed


def validate_snapshot(value: dict, expected_week: str | None = None) -> dict:
    """Validate an archive record, returning its normalized serializable form."""
    if not isinstance(value, dict):
        raise ValueError("Weekly history snapshot must be an object")
    try:
        return _validate_snapshot(value, _week(expected_week or value.get("week")))
    except (KeyError, TypeError, OverflowError) as error:
        raise ValueError(f"Malformed weekly history snapshot: {error}") from error


def _unique_object(pairs):
    value = {}
    for key, item in pairs:
        if key in value:
            raise ValueError(f"Duplicate JSON key in history: {key}")
        value[key] = item
    return value


def load_snapshots(history_dir):
    """Load every snapshot strictly, so corrupt history is never silently reset."""
    if history_dir is None:
        return {}
    history_dir = Path(history_dir)
    if history_dir.is_symlink() or (history_dir.exists() and not history_dir.is_dir()):
        raise ValueError("History directory must be a real directory")
    directory = history_dir / "weeks"
    if directory.is_symlink() or (directory.exists() and not directory.is_dir()):
        raise ValueError("History weeks must be a real directory")
    if not directory.exists():
        return {}
    result = {}
    for path in sorted(directory.iterdir()):
        if path.name.startswith("."):
            continue
        if path.is_symlink() or not path.is_file() or path.suffix != ".json":
            raise ValueError(f"Unexpected file in weekly history: {path.name}")
        week = _week(path.stem)
        if path.stat().st_size > MAX_SNAPSHOT_BYTES:
            raise ValueError(f"Weekly history snapshot is too large: {path.name}")
        try:
            value = json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=_unique_object)
            result[week] = validate_snapshot(value, week)
        except (KeyError, TypeError, UnicodeError, ValueError) as error:
            raise ValueError(f"Invalid weekly history {path.name}: {error}") from error
    return result


def _trend(rows, previous, identity):
    prior = {row[identity]: row for row in previous}
    for row in rows:
        old = prior.get(row[identity])
        row["rank_change"] = old["rank"] - row["rank"] if old else None
        row["rating_change"] = round(row["rating"] - old["rating"], 1) if old else None
        if identity == "robot_id":
            row["previous_version"] = old.get("version") if old else None


def _points(rows, identity):
    total = len(rows)
    if total == 1:
        return {rows[0][identity]: Fraction(50)}
    counts = defaultdict(int)
    for row in rows:
        counts[row["rank"]] += 1
    result = {}
    for row in rows:
        midrank = Fraction(2 * row["rank"] + counts[row["rank"]] - 1, 2)
        result[row[identity]] = Fraction(100) * (total - midrank) / (total - 1)
    return result


def _historical(snapshots, section, identity, active):
    totals = {}
    for week, snapshot in sorted(snapshots.items()):
        rows = snapshot[section]
        points = _points(rows, identity)
        for row in rows:
            key = row[identity]
            if key not in totals:
                totals[key] = {identity: key, "points": Fraction(), "weeks": 0,
                               "weekly_wins": 0, "best_rank": row["rank"], "first_seen": week}
            entry = totals[key]
            entry["points"] += points[key]
            entry["weeks"] += 1
            entry["weekly_wins"] += int(row["rank"] == 1)
            entry["best_rank"] = min(entry["best_rank"], row["rank"])
            entry["last_seen"] = week
            entry["active"] = key in active
            for field in ("author", "author_id", "robot_name", "version"):
                if field in row:
                    entry[field] = row[field]
    for row in totals.values():
        row["points"] = round(float(row["points"]), 1)
    return _rank(list(totals.values()), identity, "points")


def enrich_history(report: dict, history_dir: Path | None = None) -> dict:
    """Mutate a current report with authors, trends, and cumulative leaders.

    Rerunning a week replaces its snapshot in memory. Later archived weeks are
    excluded from this dated report, and no archive is written by this function.
    """
    current = _snapshot(report)
    archive = load_snapshots(history_dir)
    previous_weeks = sorted(week for week in archive if week < current["week"])
    previous_week = previous_weeks[-1] if previous_weeks else None
    previous = archive[previous_week] if previous_week else {"robots": [], "authors": [], "modes": {}}
    archive[current["week"]] = current
    archive = {week: snapshot for week, snapshot in archive.items() if week <= current["week"]}
    report["authors"] = deepcopy(current["authors"])
    by_path = {row["id"]: row for row in current["robots"]}
    for row in report["overall"]:
        row.update({key: value for key, value in by_path[row["id"]].items()
                    if key in ("robot_id", "robot_name", "author", "author_id", "version")})
    _trend(report["overall"], previous["robots"], "robot_id")
    _trend(report["authors"], previous["authors"], "author_id")
    for mode, data in report.get("modes", {}).items():
        for row in data["standings"]:
            row["robot_id"] = by_path[row["id"]]["robot_id"]
        old_versions = {row["robot_id"]: row["version"] for row in previous["robots"]}
        prior_mode = [{**row, "version": old_versions.get(row["robot_id"])}
                      for row in previous["modes"].get(mode, [])]
        _trend(data["standings"], prior_mode, "robot_id")
    report["history"] = {
        "weeks": len(archive), "previous_week": previous_week, "through_week": current["week"],
        "authors": _historical(archive, "authors", "author_id",
                               {row["author_id"] for row in current["authors"]}),
        "robots": _historical(archive, "robots", "robot_id", set(by_path[row]["robot_id"] for row in by_path)),
        "points_rule": "100 × (field size − tied midrank) / (field size − 1); singleton = 50",
    }
    return report


def write_snapshot(report: dict, destination: Path) -> None:
    """Atomically write one report's snapshot to the supplied JSON file path."""
    snapshot = _snapshot(report)
    destination = Path(destination)
    if destination.suffix != ".json" or destination.is_symlink():
        raise ValueError("History snapshot destination must be a JSON file, not a symlink")
    for parent in destination.parents:
        if parent.is_symlink():
            raise ValueError("History snapshot directory must not contain symlinks")
    destination.parent.mkdir(parents=True, exist_ok=True)
    write_result(snapshot, destination)
