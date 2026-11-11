#!/usr/bin/env python3
"""Extract the unmodified Robot Warriors application from the supplied HFS image.

Install tools/requirements-reverse.txt. Resource bytes are copied verbatim;
CODE offsets throughout this project are resource-relative, including the
four-byte non-executable segment header.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct

import machfs
import macresources

ROOT = Path(__file__).resolve().parents[1]
APP_PATH = ["Desktop Folder", "Robot Warriors", "Robot Warriors 1.0.1"]
SOURCE_REVISION = "3cd67f6bdbd61a6c519c5ba4a7382599d7f8b9f6"


def sha256(data):
    return hashlib.sha256(data).hexdigest()


def expand_globals(data, zero, expected_size):
    """THINK Pascal initialization, recovered from CODE 1:0x011c–0x012e."""
    result = bytearray()
    counts = iter(struct.iter_unpack(">H", zero))
    for (word,) in struct.iter_unpack(">H", data):
        result.extend(struct.pack(">H", word))
        if word == 0:
            result.extend(bytes(2 * next(counts)[0]))
    if len(result) != expected_size:
        raise ValueError(f"Expanded DATA has {len(result)} bytes, expected {expected_size}")
    if next(counts, None) is not None:
        raise ValueError("Unused ZERO entries")
    return bytes(result)


def extract(image, output):
    disk = image.read_bytes()
    volume = machfs.Volume()
    volume.read(disk)
    app = volume
    for component in APP_PATH:
        app = app[component]
    output.mkdir(parents=True, exist_ok=True)
    resource_dir = output / "resources"
    resource_dir.mkdir(exist_ok=True)
    forks = {}
    for name, data in [("data", app.data), ("rsrc", app.rsrc)]:
        filename = APP_PATH[-1] + "." + name
        (output / filename).write_bytes(data)
        forks[name] = {"file": filename, "bytes": len(data), "sha256": sha256(data)}
    manifest = {
        "format_version": 1,
        "source_repository": "https://github.com/radar-to-shot/radar-to-shot",
        "source_revision": SOURCE_REVISION,
        "source_image": image.name,
        "source_image_sha256": sha256(disk),
        "hfs_path": APP_PATH,
        "file_type": app.type.decode("macroman"),
        "creator": app.creator.decode("macroman"),
        "forks": forks,
        "resources": [],
    }
    resources = list(macresources.parse_file(app.rsrc))
    for resource in resources:
        typename = resource.type.decode("macroman")
        filename = typename.strip().replace("#", "hash") + f"_{resource.id}.bin"
        (resource_dir / filename).write_bytes(resource.data)
        entry = {
            "type": typename,
            "id": resource.id,
            "name": resource.name,
            "attributes": resource.attribs,
            "file": "resources/" + filename,
            "bytes": len(resource.data),
            "sha256": sha256(resource.data),
        }
        if resource.type == b"CODE" and resource.id:
            table_offset, table_entries = struct.unpack(">HH", resource.data[:4])
            entry["segment_header"] = {
                "jump_table_relative_offset": table_offset,
                "jump_table_entries": table_entries,
                "code_start": 4,
            }
        manifest["resources"].append(entry)
    by_key = {(r.type, r.id): r.data for r in resources}
    globals_size = struct.unpack_from(">I", by_key[(b"CODE", 0)], 4)[0]
    if by_key[(b"DREL", 0)]:
        raise ValueError("This extractor's globals expansion assumes an empty DREL resource")
    globals_data = expand_globals(by_key[(b"DATA", 0)], by_key[(b"ZERO", 0)], globals_size)
    (output / "a5_initial.bin").write_bytes(globals_data)
    manifest["derived_globals"] = {
        "file": "a5_initial.bin", "bytes": len(globals_data),
        "sha256": sha256(globals_data), "load_at": "A5 - 0x43ac",
        "method": "CODE 1:0x011c–0x012e DATA/ZERO expansion; DREL is empty",
    }
    (output / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    return manifest


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--image", type=Path, default=ROOT / "images/Robot Warriors.dsk")
    parser.add_argument("--out", type=Path, default=ROOT / "reverse/original")
    args = parser.parse_args()
    manifest = extract(args.image, args.out)
    print(f"Extracted {len(manifest['resources'])} resources; resource fork "
          f"SHA-256 {manifest['forks']['rsrc']['sha256']}")


if __name__ == "__main__":
    main()
