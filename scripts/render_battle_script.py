#!/usr/bin/env python3
"""
Render the battle driver script from a jinja template.

Input JSON schema (e.g. battles.json):
{
  "battles": [
    { "robots": ["examples/Chicken", "examples/Seeker"], "num_battles": 5 },
    { "robots": ["examples/Wall Crawler", "examples/Run Away"], "num_battles": 10 }
  ]
}
"""

from __future__ import annotations
import argparse
import json
import pathlib
import re
import sys
import hashlib
import json
from jinja2 import Environment, FileSystemLoader, select_autoescape

MAX_HFS_NAME = 31  # HFS filename limit (bytes)

def mac_basename(mac_path: str) -> str:
    return mac_path.split(":")[-1]

def sanitize_hfs_name(name: str) -> str:
    """
    HFS disallows ':' in names and is limited to 31 chars.
    We also replace '/' defensively and trim whitespace/control chars.
    """
    # Replace path separators and colon (HFS)
    clean = re.sub(r"[:/\\]", "·", name)
    # Strip control chars
    clean = re.sub(r"[\x00-\x1F\x7F]", "", clean).strip()
    # Enforce length
    if len(clean) > MAX_HFS_NAME:
        root, dot, ext = clean.rpartition(".")
        if dot and len(ext) <= 6 and len(root) > 0:
            # keep short-ish extension
            keep = MAX_HFS_NAME - (1 + len(ext))
            clean = (root[:keep] if keep > 0 else root[:MAX_HFS_NAME]) + "." + ext
        else:
            clean = clean[:MAX_HFS_NAME]
    return clean or "untitled"

def make_jobs(battles: list[dict], dest_dir: str, robots_dir: str) -> list[dict]:
    jobs = []
    for b in battles:
        robots = b.get("robots") or []
        assert len(robots) >= 2 and len(robots) <= 5, "Between two and five robots required for a battle"
        num_battles = int(b.get("num_battles") or 1)
        last_robot_name = mac_basename(sanitize_hfs_name(robots[-1].split("/")[-1]))
        label = hashlib.sha256(json.dumps(b).encode("ascii")).hexdigest()[:8]
        open_cmds = "\n".join([f'Open "{":".join([robots_dir] + [sanitize_hfs_name(n) for n in r.split("/")])}"' for r in robots])
        jobs.append({
            "robots": robots,
            "num_battles": num_battles,
            "last_robot_name": last_robot_name,
            "label": label,
            "open_cmds": open_cmds,
            "dest_dir": dest_dir,
        })
    return jobs

def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--battles-json", required=True, help="JSON with {'battles':[{'robots':[A,B],'num_battles':N},...]}")
    ap.add_argument("--dest-dir", default="Macintosh HD:Desktop Folder:Robot Warriors", help='Mac path to save results, e.g. "Macintosh HD:Desktop Folder:Robot Warriors"')
    ap.add_argument("--robots-dir", default="Macintosh HD:Desktop Folder:Robot Warriors:robots", help='Root directory for robots')
    ap.add_argument("--template", default="templates/battles_quick.template", help="Template path")
    ap.add_argument("--out", default="-", help="Output file (default stdout)")
    args = ap.parse_args(argv)

    battles_obj = json.loads(pathlib.Path(args.battles_json).read_text(encoding="utf-8"))
    battles = battles_obj.get("battles", [])
    jobs = make_jobs(battles, args.dest_dir, args.robots_dir)

    tpl_path = pathlib.Path(args.template).resolve()
    env = Environment(
        loader=FileSystemLoader(str(tpl_path.parent)),
        autoescape=select_autoescape(enabled_extensions=())
    )
    tpl = env.get_template(tpl_path.name)

    rendered = tpl.render(battles=jobs, dest_dir=args.dest_dir)

    if args.out in ("-", ""):
        sys.stdout.write(rendered)
    else:
        pathlib.Path(args.out).write_text(rendered, encoding="ascii")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
