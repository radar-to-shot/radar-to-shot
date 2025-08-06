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
DEFAULT_BATTLE_SCRIPT_PATH = ["Desktop Folder", "Robot Warriors"]
DEFAULT_TARGET_PATH = ["Desktop Folder", "Robot Warriors", "robots"]
DEFAULT_SIZE = 1024*1024*12

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
    return hfs_name

def add_battle_script(vol: machfs.Volume, dest_path_components, robots):
    folder = ensure_folder(vol, dest_path_components)
    dest_path_components = [vol.name] + [sanitize_hfs_name(component) for component in dest_path_components]
    f = machfs.File()
    f.data = (b"""\
Quit "Robot Warriors 1.0.1" quiet continue
Quit "GraphicConverter 68k" quiet continue
Wait 2 seconds
%(open_cmds)s
WaitWindow dialog
Key return
WaitWindow "%(last_robot_name)s"
Menu "Battle" "Start Battle..."
WaitWindow dialog
Type "1"
Key return
WaitText "Exit Battlefield"
CopyScreen 0 24 380 290
ClipFile write 'PICT' "%(dest_path)s:Battle Results"
Key return
Quit "Robot Warriors 1.0.1"
Wait 2 seconds
Open 'GKON' "%(dest_path)s:Battle Results"
WaitApp "GraphicConverter 68k"
WaitWindow "Battle Results"
Menu "File" "Save as" partial
WaitWindow dialog
Drag 380 60 to 0 35 relative window slow
Key return
Quit "GraphicConverter 68k"
Session shutdown
""" % {
    b"open_cmds": "".join(f'Open "{":".join([vol.name] + robot_path)}"\n' for robot_path in robots).encode("ascii"),
    b"last_robot_name": robots[-1][-1].encode("ascii"),
    b"dest_path": ":".join(dest_path_components).encode("ascii"),
}).replace(b"\n", b"\r")
    f.rsrc = b""
    f.type = b"TEXT"
    f.creator = b"ttxt"
    folder["Battle Script"] = f

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
    ap.add_argument("--write-battle-script", default=False, action="store_true",
                    help="Enables output of a battle script to trigger battles between all supplied robots")
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
    robots = []
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
            current_dest_folder = target_components
            if rel.parts[:-1]:
                current_dest_folder = target_components + list(rel.parts[:-1])
                folder = ensure_folder(vol, current_dest_folder)
            hfs_fname = add_file(vol, folder, host_path)
            robots.append(current_dest_folder + [hfs_fname, ])

    if robots and args.write_battle_script:
        ensure_folder(vol, DEFAULT_BATTLE_SCRIPT_PATH)
        add_battle_script(vol, DEFAULT_BATTLE_SCRIPT_PATH, robots)

    out_path.parent.mkdir(parents=True, exist_ok=True)
    with open(out_path, "wb") as f:
        f.write(vol.write(size=image_size, align=2048, desktopdb=False, bootable=True))

    print(f"Injected {len(robots)} robot file(s) into '{'/'.join(target_components)}'")
    print(f"Wrote: {out_path}")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
