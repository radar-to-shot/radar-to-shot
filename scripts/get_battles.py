#!/usr/bin/env python3
"""
Get all pairings of robots in the specified directory, excluding any which
are present in the optionally provided results JSON.

Inputs
  --robots-dir     directory to scan for robot files (default: robots)
  --results-json   existing results.json (optional)
                   Schema: {"results":[{"robots":["A","B"], ...}, ...]}
  --num-battles    number of battles per pairing (default: 10)
  --out            output JSON path (default: stdout)

Output
  {"battles":[{"robots":["A","B"],"num_battles":N}, ...]}
"""

from __future__ import annotations
import argparse, itertools, json, pathlib, sys
from typing import List, Tuple, Set

Pair = Tuple[str, str]

def pair_key(a: str, b: str) -> Pair:
    return (a, b) if a <= b else (b, a)

def list_robots(robots_dir: pathlib.Path) -> List[str]:
    # Every file under robots_dir is a robot; IDs are POSIX paths relative to robots_dir
    robots: List[str] = []
    for p in robots_dir.rglob("*"):
        if p.is_file():
            robots.append(p.relative_to(robots_dir).as_posix())
    robots.sort()
    return robots

def load_existing_pairs(path: pathlib.Path | None) -> Set[Pair]:
    if not path or not path.exists():
        return set()
    try:
        data = json.loads(path.read_text(encoding="utf-8")) or {}
    except Exception as e:
        raise SystemExit(f"Failed to parse {path}: {e}")
    results = data.get("results", []) if isinstance(data, dict) else []
    seen: Set[Pair] = set()
    for item in results:
        if isinstance(item, dict):
            r = item.get("robots")
            if isinstance(r, list) and len(r) == 2 and r[0] != r[1]:
                a, b = str(r[0]), str(r[1])
                seen.add(pair_key(a, b))
    return seen

def main(argv: List[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description="Generate missing robot pairings (JSON).")
    ap.add_argument("--robots-dir", default="robots")
    ap.add_argument("--results-json", default=None)
    ap.add_argument("--num-battles", type=int, default=3)
    ap.add_argument("--out", default="-")
    args = ap.parse_args(argv)

    robots_dir = pathlib.Path(args.robots_dir)
    if not robots_dir.is_dir():
        print(f"robots dir not found: {robots_dir}", file=sys.stderr)
        return 2

    robots = list_robots(robots_dir)
    existing = load_existing_pairs(pathlib.Path(args.results_json) if args.results_json else None)

    all_pairs = [pair_key(a, b) for a, b in itertools.combinations(robots, 2)]
    missing = [p for p in all_pairs if p not in existing]
    out_obj = {"battles": [{"robots": [a, b], "num_battles": args.num_battles} for a, b in missing]}

    text = json.dumps(out_obj, ensure_ascii=False, indent=2)
    if args.out in ("-", ""):
        sys.stdout.write(text + "\n")
    else:
        pathlib.Path(args.out).write_text(text + "\n", encoding="utf-8")

    print(f"# robots={len(robots)} total_pairs={len(all_pairs)} existing={len(existing)} missing={len(missing)}")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
