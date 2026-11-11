#!/usr/bin/env python3
"""Integrity checks against the actual bundled HFS application, no mock data."""
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest

import machfs
import macresources

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location("extract_original", ROOT / "tools/extract_original.py")
EXTRACT = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(EXTRACT)


class ExtractionTests(unittest.TestCase):
    def test_reextract_matches_every_committed_byte(self):
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)
            manifest = EXTRACT.extract(ROOT / "images/Robot Warriors.dsk", out)
            self.assertEqual(manifest["source_image_sha256"],
                             "7dd47f5c4cf12f08f03ea28a5acdc17c15e1bcc32297e480b9d06e4ac82c78f1")
            self.assertEqual(len(manifest["resources"]), 99)
            self.assertEqual(manifest["forks"]["rsrc"]["sha256"],
                             "d486bc719b82a5ca5bcf3e406f40d6d06fc9d15e3bbf1009dc8d152b4293a0ae")
            self.assertEqual(manifest, json.loads((ROOT / "reverse/original/manifest.json").read_text()))
            for path in out.rglob("*"):
                if path.is_file():
                    relative = path.relative_to(out)
                    with self.subTest(file=str(relative)):
                        self.assertEqual(path.read_bytes(), (ROOT / "reverse/original" / relative).read_bytes())

    def test_ci_image_contains_identical_resources(self):
        manifests = []
        forks = []
        for image in ("Robot Warriors.dsk", "Robot Warriors CI.dsk"):
            volume = machfs.Volume()
            volume.read((ROOT / "images" / image).read_bytes())
            app = volume
            for part in EXTRACT.APP_PATH:
                app = app[part]
            forks.append(bytes(app.rsrc))
            manifests.append({(r.type, r.id): (r.name, r.attribs, bytes(r.data))
                              for r in macresources.parse_file(app.rsrc)})
        self.assertEqual(manifests[0], manifests[1])
        differences = [i for i, (a, b) in enumerate(zip(*forks)) if a != b]
        self.assertEqual(len(forks[0]), len(forks[1]))
        self.assertEqual(len(differences), 20)
        self.assertTrue(all(16 <= i < 256 for i in differences))

    def test_globals_init_has_expected_pascal_string_and_extent(self):
        resources = ROOT / "reverse/original/resources"
        globals_data = EXTRACT.expand_globals((resources / "DATA_0.bin").read_bytes(),
                                             (resources / "ZERO_0.bin").read_bytes(), 0x43ac)
        self.assertEqual(globals_data, bytes(90) + b"\x0cPrinter Dump\x00" + bytes(17220))
        self.assertEqual(globals_data, (ROOT / "reverse/original/a5_initial.bin").read_bytes())


if __name__ == "__main__":
    unittest.main()
