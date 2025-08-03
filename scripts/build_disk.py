#!/usr/bin/env python3

"""
Building a minimal System 7.0.1 disk image including the Robot Warriors
application and all robots under the robot/ directory.

Requirements:
    pip install machfs

Usage:
    python scripts/build_disk.py \
        --template "images/Robot Warriors.dsk" \
        --robots-dir robots \
        --out build/robot.dsk
"""

import argparse
import os
import re
import sys
import machfs
from pathlib import Path

MAX_HFS_NAME = 31  # HFS filename limit (bytes)
DEFAULT_TARGET_PATH = ["Desktop Folder", "Robot Warriors", "robots"]
DEFAULT_SIZE = 1024*1024*8

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

def ensure_folder(vol: machfs.Volume, path_components):
    """
    Make sure a folder path exists inside the volume; return the folder dict.
    """
    cur = vol
    for comp in path_components:
        name = sanitize_hfs_name(comp)
        entry = cur.get(name)
        if entry is None:
            new_folder = machfs.Folder()
            cur[name] = new_folder
            cur = new_folder
        else:
            if not isinstance(entry, machfs.Folder):
                raise RuntimeError(f"Path component '{name}' exists and is not a folder")
            cur = entry
    return cur

def add_file(vol: machfs.Volume, folder, file_path: Path):
    """
    Add a single host file into the given HFS folder, setting Type/Creator.
    """
    hfs_name = sanitize_hfs_name(file_path.name)
    f = machfs.File()
    # Data fork only (Robot Warriors read plain TEXT)
    with open(file_path, "rb") as fp:
        f.data = fp.read()
    f.rsrc = b""
    f.type = b"TEXT"
    f.creator = b"RWar"
    folder[hfs_name] = f

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--template", default="images/Robot Warriors.dsk",
                    help="Path to the template HFS disk image")
    ap.add_argument("--robots-dir", default="robots",
                    help="Directory containing robots (recursive)")
    ap.add_argument("--out", default="build/robot.dsk",
                    help="Output disk image path")
    ap.add_argument("--target", default="/".join(DEFAULT_TARGET_PATH),
                    help="Target path inside volume (use '/' between components)")
    ap.add_argument("--image-size", default=DEFAULT_SIZE,
                    help="Disk image size")
    args = ap.parse_args()

    tpl = Path(args.template)
    robots_dir = Path(args.robots_dir)
    out_path = Path(args.out)
    target_components = [p for p in args.target.split("/") if p]
    image_size = int(args.image_size)

    if not tpl.is_file():
        print(f"Template image not found: {tpl}", file=sys.stderr)
        return 2
    if not robots_dir.is_dir():
        print(f"Robots directory not found: {robots_dir}", file=sys.stderr)
        return 2

    # Load template volume
    vol = machfs.Volume()
    vol.name='Macintosh HD'
    with open(tpl, "rb") as f:
        vol.read(f.read())

    base_folder = ensure_folder(vol, target_components)

    # Walk robots/ recursively, mirroring subfolders under target
    count = 0
    for host_path in robots_dir.rglob("*"):
        if host_path.is_dir():
            # Mirror directory
            rel = host_path.relative_to(robots_dir)
            if rel.parts:
                ensure_folder(vol, target_components + list(rel.parts))
            continue
        if host_path.is_file():
            rel = host_path.relative_to(robots_dir)
            # Ensure the subfolder path exists
            folder = base_folder
            if rel.parts[:-1]:
                folder = ensure_folder(vol, target_components + list(rel.parts[:-1]))
            add_file(vol, folder, host_path)
            count += 1

    out_path.parent.mkdir(parents=True, exist_ok=True)
    with open(out_path, "wb") as f:
        f.write(vol.write(size=image_size, align=2048, desktopdb=True, bootable=True))

    print(f"Injected {count} file(s) into '{'/'.join(target_components)}'")
    print(f"Wrote: {out_path}")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
