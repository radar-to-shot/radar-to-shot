#!/usr/bin/env python3

"""
Build a System 7.0.1 disk image including the Robot Warriors app and robots.

Requirements:
    pip install machfs

Usage:
    python scripts/build_disk.py \
        --template "images/Robot Warriors.dsk" \
        --robots-dir robots \
        --out build/robot.dsk \
        [--battle-script build/battle_script.txt]
"""

import argparse
import re
import sys
from pathlib import Path
import machfs

MAX_HFS_NAME = 31  # HFS filename limit (bytes)
DEFAULT_BATTLE_SCRIPT_PATH = ["Desktop Folder", "Robot Warriors"]
DEFAULT_TARGET_PATH = ["Desktop Folder", "Robot Warriors", "robots"]
DEFAULT_SIZE = 1024 * 1024 * 12


def sanitize_hfs_name(name: str) -> str:
    """
    HFS disallows ':' in names and is limited to 31 chars.
    Also replace '/' defensively and trim whitespace/control chars.
    """
    clean = re.sub(r"[:/\\]", "·", name)                 # path/colon → middot
    clean = re.sub(r"[\x00-\x1F\x7F]", "", clean).strip()  # strip control chars
    if len(clean) > MAX_HFS_NAME:
        root, dot, ext = clean.rpartition(".")
        if dot and len(ext) <= 6 and len(root) > 0:
            keep = MAX_HFS_NAME - (1 + len(ext))
            clean = (root[:keep] if keep > 0 else root[:MAX_HFS_NAME]) + "." + ext
        else:
            clean = clean[:MAX_HFS_NAME]
    return clean or "untitled"


def ensure_folder(vol: machfs.Volume, path_components):
    """Ensure a folder path exists inside the volume; return the folder dict."""
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
    """Add a single host file into the given HFS folder, setting Type/Creator."""
    hfs_name = sanitize_hfs_name(file_path.name)
    f = machfs.File()
    with open(file_path, "r") as fp:
        f.data = fp.read().replace('\n', '\r').encode('ascii')
    f.rsrc = b""
    f.type = b"TEXT"
    f.creator = b"RWar"
    folder[hfs_name] = f
    return hfs_name


def write_battle_script(vol: machfs.Volume, dest_path_components, data_bytes: bytes):
    """Create/overwrite 'Battle Script' at the given path with provided bytes."""
    folder = ensure_folder(vol, dest_path_components)
    f = machfs.File()
    f.data = data_bytes
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
    ap.add_argument("--image-size", type=int, default=DEFAULT_SIZE,
                    help="Disk image size (bytes)")
    ap.add_argument("--battle-script", default=None,
                    help="Path to a text file to embed as 'Battle Script' "
                         "(will be converted to CR line endings and ASCII)")
    args = ap.parse_args()

    tpl = Path(args.template)
    robots_dir = Path(args.robots_dir)
    out_path = Path(args.out)
    target_components = [p for p in args.target.split("/") if p]
    image_size = args.image_size

    if not tpl.is_file():
        print(f"Template image not found: {tpl}", file=sys.stderr)
        return 2
    if not robots_dir.is_dir():
        print(f"Robots directory not found: {robots_dir}", file=sys.stderr)
        return 2

    # Load template volume
    vol = machfs.Volume()
    vol.name = "Macintosh HD"
    with open(tpl, "rb") as f:
        vol.read(f.read())

    base_folder = ensure_folder(vol, target_components)

    # Walk robots/ recursively, mirroring subfolders under target
    robots_count = 0
    for host_path in robots_dir.rglob("*"):
        if host_path.is_dir():
            rel = host_path.relative_to(robots_dir)
            if rel.parts:
                ensure_folder(vol, target_components + list(rel.parts))
            continue
        if host_path.is_file():
            rel = host_path.relative_to(robots_dir)
            folder = base_folder
            current_dest_folder = target_components
            if rel.parts[:-1]:
                current_dest_folder = target_components + list(rel.parts[:-1])
                folder = ensure_folder(vol, current_dest_folder)
            add_file(vol, folder, host_path)
            robots_count += 1

    if args.battle_script:
        try:
            text = Path(args.battle_script).read_text(encoding="ascii")
        except UnicodeDecodeError as e:
            print(f"Battle script must be ASCII text: {e}", file=sys.stderr)
            return 2
    else:
        text = ""

    # Convert LF to CR per classic Mac
    data_bytes = text.replace("\n", "\r").encode("ascii")

    # Always place a Battle Script (empty if not provided)
    ensure_folder(vol, DEFAULT_BATTLE_SCRIPT_PATH)
    write_battle_script(vol, DEFAULT_BATTLE_SCRIPT_PATH, data_bytes)

    out_path.parent.mkdir(parents=True, exist_ok=True)
    with open(out_path, "wb") as f:
        f.write(vol.write(size=image_size, align=2048, desktopdb=False, bootable=True))

    print(f"Injected {robots_count} robot file(s) into '{'/'.join(target_components)}'")
    print(f"Embedded Battle Script ({len(data_bytes)} bytes)")
    print(f"Wrote: {out_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
