#!/usr/bin/env python3
"""Submission identity parsing, legacy compatibility, and real compiler checks."""
from __future__ import annotations

import argparse
import json
from pathlib import Path
import subprocess
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
BINARY = ROOT / "build/robotwar"
sys.path.insert(0, str(ROOT / "tools"))
from robot_metadata import extract_metadata

HEADER = """; @author: Ada Example
; @author-id: ada-example
; @name: Compass Scout
; @robot-id: compass-scout
; @version: 1.0.0
"""
IDLE = "loop\ngoto loop\n"


def compile_source(source: str) -> dict:
    encoded = source.replace("\r\n", "\n").replace("\r", "\n").replace("\n", "\r").encode("mac_roman")
    result = subprocess.run([str(BINARY), "jsonl"],
                            input=json.dumps({"kind": "compile", "source_hex": encoded.hex()}) + "\n",
                            capture_output=True, text=True, check=True)
    return json.loads(result.stdout)


class MetadataTests(unittest.TestCase):
    def test_explicit_identity_fields_and_namespace(self):
        self.assertEqual(extract_metadata(HEADER + IDLE, "some/path.bot"), {
            "author": "Ada Example", "author_id": "ada-example", "robot_name": "Compass Scout",
            "robot_id": "ada-example/compass-scout", "version": "1.0.0", "metadata_source": "header",
        })

    def test_explicit_ids_survive_file_display_name_and_version_changes(self):
        first = extract_metadata(HEADER + IDLE, "before/one.bot")
        renamed = HEADER.replace("Ada Example", "Ada E.").replace("Compass Scout", "Scout II").replace("1.0.0", "2.0.0")
        second = extract_metadata(renamed + IDLE, "after/two.bot")
        self.assertEqual(first["author_id"], second["author_id"])
        self.assertEqual(first["robot_id"], second["robot_id"])
        self.assertNotEqual(first["author"], second["author"])
        self.assertNotEqual(first["robot_name"], second["robot_name"])
        self.assertNotEqual(first["version"], second["version"])

    def test_different_authors_can_use_same_robot_slug(self):
        first = extract_metadata(HEADER + IDLE, "one.bot")
        second = extract_metadata(HEADER.replace("@author-id: ada-example", "@author-id: grace-example") + IDLE,
                                  "two.bot")
        self.assertNotEqual(first["robot_id"], second["robot_id"])

    def test_optional_ids_derive_from_names_and_explicit_case_is_normalized(self):
        source = "; @author: Chloé Example\n; @name: Éclaireur\n; @version: 1.2.0-beta+1\n" + IDLE
        result = extract_metadata(source, "one.robot")
        self.assertEqual(result["robot_id"], "chloe-example/eclaireur")
        self.assertEqual(result["author"], "Chloé Example")
        source = HEADER.replace("ada-example", "ADA-Example").replace("compass-scout", "Compass-Scout")
        self.assertEqual(extract_metadata(source + IDLE, "one.bot")["robot_id"], "ada-example/compass-scout")

    def test_missing_header_preserves_unattributed_legacy_identity(self):
        result = extract_metadata("; Author: This is an ordinary comment\n" + IDLE, "examples/Seeker")
        self.assertEqual(result, {"author": "Unattributed", "author_id": None, "robot_name": "Seeker",
                                  "robot_id": "legacy:examples/Seeker", "version": "unversioned",
                                  "metadata_source": "legacy"})
        self.assertEqual(extract_metadata(IDLE, "old/Robot.bot")["robot_name"], "Robot")
        self.assertEqual(extract_metadata(IDLE, "old/Robot.v1")["robot_name"], "Robot.v1")
        for path in (ROOT / "robots/examples").iterdir():
            result = extract_metadata(path.read_text(), path.relative_to(ROOT / "robots").as_posix())
            self.assertIsNone(result["author_id"])

    def test_leading_comments_blank_lines_bom_and_original_line_endings(self):
        source = "\ufeff; Ordinary explanatory comment\r\n\r\n" + HEADER.replace("\n", "\r") + IDLE
        result = extract_metadata(source, "one.bot")
        self.assertEqual(result["robot_id"], "ada-example/compass-scout")

    def test_incomplete_duplicate_unknown_malformed_and_misplaced_fields_fail(self):
        invalid = (
            "; @author: Ada\n" + IDLE,
            "; @author-id: ada\n" + IDLE,
            HEADER + "; @Author: Another author\n" + IDLE,
            HEADER + "; @verison: 3\n" + IDLE,
            HEADER.replace("@name:", "@name ") + IDLE,
            IDLE + HEADER,
            HEADER.replace("@author: Ada Example", "@author:") + IDLE,
        )
        for source in invalid:
            with self.subTest(source=source), self.assertRaises(ValueError):
                extract_metadata(source, "one.bot")

    def test_invalid_ids_version_lengths_and_control_characters_fail(self):
        substitutions = (
            ("ada-example", "../other"),
            ("ada-example", "two--hyphens"),
            ("ada-example", "a" * 49),
            ("compass-scout", "author/robot"),
            ("1.0.0", "version 1"),
            ("1.0.0", "a" * 33),
            ("Ada Example", "a" * 65),
            ("Ada Example", "Ada\tExample"),
            ("Compass Scout", "Scout\u202eevil"),
        )
        for old, new in substitutions:
            with self.subTest(value=new), self.assertRaises(ValueError):
                extract_metadata(HEADER.replace(old, new) + IDLE, "one.bot")

    def test_model_metadata_matches_original_attribution_comments(self):
        for path in (ROOT / "robots/model_bench_20261111").glob("*.bot"):
            source = path.read_text()
            result = extract_metadata(source, path.relative_to(ROOT / "robots").as_posix())
            self.assertIn("; Generated by " + result["author"] + " on ", source)
            self.assertEqual(result["metadata_source"], "header")
            self.assertEqual(result["version"], "3" if path.name == "haiku55.bot" else "unversioned")


class CompilerTests(unittest.TestCase):
    def test_template_compiles_as_the_documented_starter(self):
        source = (ROOT / "templates/robot.bot").read_text()
        metadata = extract_metadata(source, "example/robot.bot")
        self.assertEqual(metadata["version"], "1.0.0")
        result = compile_source(source)
        self.assertEqual(result["error"], "")
        self.assertEqual(result["code_count"], 49)
        self.assertEqual(result["attributes"], [1, 2, 1, 1, 0, 0, 1])

    def test_model_headers_do_not_change_compiled_instructions(self):
        for path in (ROOT / "robots/model_bench_20261111").glob("*.bot"):
            source = path.read_text()
            without_header = "\n".join(line for line in source.splitlines() if not line.startswith("; @")) + "\n"
            actual, baseline = compile_source(source), compile_source(without_header)
            with self.subTest(robot=path.name):
                self.assertEqual(actual["error"], "")
                for field in ("code_count", "code_hex", "attributes"):
                    self.assertEqual(actual[field], baseline[field])


def main():
    global BINARY
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary", type=Path, default=BINARY)
    args, remainder = parser.parse_known_args()
    BINARY = args.binary.resolve()
    unittest.main(argv=[__file__, *remainder], verbosity=2)


if __name__ == "__main__":
    main()
