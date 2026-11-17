#!/usr/bin/env python3
"""Exercise publication against real temporary Git remotes, without GitHub writes."""
from __future__ import annotations

from copy import deepcopy
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
import league_history_store as store
from league_history import enrich_history, load_snapshots, write_snapshot


def command(*args, cwd=None):
    return subprocess.check_output(["git", *args], cwd=cwd, stderr=subprocess.DEVNULL).decode().strip()


class HistoryStoreTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.root = Path(self.temp.name)
        self.remote, self.repo = self.root / "remote.git", self.root / "checkout"
        command("init", "--bare", "--initial-branch=master", str(self.remote))
        command("clone", str(self.remote), str(self.repo))
        command("config", "user.name", "Test Author", cwd=self.repo)
        command("config", "user.email", "test@example.invalid", cwd=self.repo)
        (self.repo / "source.txt").write_text("preserved source\n")
        command("add", "source.txt", cwd=self.repo)
        command("commit", "-m", "Initial source", cwd=self.repo)
        command("push", "origin", "master", cwd=self.repo)
        self.source_revision = command("rev-parse", "HEAD", cwd=self.repo)
        self.output = self.root / "output"
        self.output.mkdir()

    def tearDown(self):
        self.temp.cleanup()

    def report(self, week, base=None):
        rows = []
        for i, name in enumerate(("Ada", "Grace")):
            rows.append({"id": name + ".bot", "robot_id": name.lower() + "/robot",
                         "robot_name": name + " Scout", "author_id": name.lower(), "author": name,
                         "version": "1.0.0", "rank": i + 1, "rating": 1600 - 100 * i,
                         "games": 32, "wins": 16 - i, "draws": 8, "losses": 8 + i})
        return {"schema_version": 2, "status": "completed", "week": week,
                "revision": self.source_revision, "history_base_revision": base,
                "overall": rows, "participants": [], "modes": {"2": {"standings": deepcopy(rows)}}}

    def stage(self, report):
        enrich_history(report)
        (self.output / "leaderboard.json").write_text(json.dumps(report))
        write_snapshot(report, self.output / "history-week.json")

    def test_initial_publication_creates_only_data_branch_and_leaves_index_alone(self):
        archive = self.root / "archive"
        self.assertIsNone(store.load_history(self.repo, archive))
        self.assertEqual(load_snapshots(archive), {})
        (self.repo / "staged.txt").write_text("user staged content\n")
        command("add", "staged.txt", cwd=self.repo)
        index = command("ls-files", "--stage", cwd=self.repo)
        self.stage(self.report("2026-W47"))
        revision = store.publish_history(self.repo, self.output)
        self.assertEqual(store.remote_revision(self.repo), revision)
        self.assertEqual(command("rev-parse", "HEAD", cwd=self.repo), self.source_revision)
        self.assertEqual(command("ls-files", "--stage", cwd=self.repo), index)
        self.assertEqual(command("rev-parse", "master", cwd=self.remote), self.source_revision)
        self.assertEqual(set(command("ls-tree", "-r", "--name-only", revision, cwd=self.repo).splitlines()),
                         {"README.md", "weeks/2026-W47.json"})
        self.assertEqual(store.load_history(self.repo, archive), revision)
        self.assertEqual(set(load_snapshots(archive)), {"2026-W47"})

    def test_later_weeks_preserve_history_and_identical_rerun_is_noop(self):
        self.stage(self.report("2026-W47"))
        first = store.publish_history(self.repo, self.output)
        self.stage(self.report("2026-W48", first))
        second = store.publish_history(self.repo, self.output)
        self.assertNotEqual(first, second)
        self.stage(self.report("2026-W48", second))
        self.assertEqual(store.publish_history(self.repo, self.output), second)
        archive = self.root / "archive"
        store.load_history(self.repo, archive)
        self.assertEqual(set(load_snapshots(archive)), {"2026-W47", "2026-W48"})

    def test_same_artifact_retry_is_noop_after_initial_and_later_publication(self):
        self.stage(self.report("2026-W47"))
        first = store.publish_history(self.repo, self.output)
        # The successful job's exact artifact still names a null original base.
        self.assertEqual(store.publish_history(self.repo, self.output), first)
        self.stage(self.report("2026-W48", first))
        second = store.publish_history(self.repo, self.output)
        self.assertEqual(store.publish_history(self.repo, self.output), second)
        self.assertEqual(store.remote_revision(self.repo), second)
        self.assertEqual(command("rev-list", "--count", second, cwd=self.repo), "2")
        self.assertEqual(command("rev-parse", "HEAD", cwd=self.repo), self.source_revision)

    def test_lost_push_acknowledgement_can_retry_the_same_artifact(self):
        self.stage(self.report("2026-W47"))
        original = store.git
        pushed = []
        def lost_acknowledgement(repo, *arguments, **kwargs):
            result = original(repo, *arguments, **kwargs)
            if arguments[0] == "push":
                pushed.append(arguments[-1].split(":")[0])
                raise RuntimeError("Connection lost after the remote accepted the push")
            return result
        with patch.object(store, "git", side_effect=lost_acknowledgement), self.assertRaises(RuntimeError):
            store.publish_history(self.repo, self.output)
        self.assertEqual(len(pushed), 1)
        self.assertEqual(store.publish_history(self.repo, self.output), pushed[0])
        self.assertEqual(store.remote_revision(self.repo), pushed[0])

    def test_same_artifact_retry_rejects_a_subsequent_identical_tree_commit(self):
        self.stage(self.report("2026-W47"))
        first = store.publish_history(self.repo, self.output)
        self.stage(self.report("2026-W48", first))
        second = store.publish_history(self.repo, self.output)
        tree = command("rev-parse", second + "^{tree}", cwd=self.repo)
        unrelated = command("commit-tree", tree, "-p", second, "-m", "Subsequent publication", cwd=self.repo)
        command("push", "origin", unrelated + ":refs/heads/league-history", cwd=self.repo)
        with self.assertRaisesRegex(RuntimeError, "advanced"):
            store.publish_history(self.repo, self.output)
        self.assertEqual(store.remote_revision(self.repo), unrelated)

    def test_retry_requires_entire_canonical_tree_not_just_this_weeks_snapshot(self):
        self.stage(self.report("2026-W47"))
        first = store.publish_history(self.repo, self.output)
        self.stage(self.report("2026-W48", first))
        env = {**os.environ, "GIT_INDEX_FILE": str(self.root / "competing-index")}
        store.git(self.repo, "read-tree", first, env=env)
        # The tip is one child of the correct base and contains the exact new
        # week, but also changes README. It must not qualify as an applied retry.
        contents = {"weeks/2026-W48.json": (self.output / "history-week.json").read_bytes(),
                    "README.md": b"Unrelated archive change\n"}
        for path, content in contents.items():
            blob = store.git(self.repo, "hash-object", "-w", "--stdin", data=content).stdout.decode().strip()
            store.git(self.repo, "update-index", "--add", "--cacheinfo", f"100644,{blob},{path}", env=env)
        tree = store.git(self.repo, "write-tree", env=env).stdout.decode().strip()
        competing = command("commit-tree", tree, "-p", first, "-m", "Competing archive update", cwd=self.repo)
        command("push", "origin", competing + ":refs/heads/league-history", cwd=self.repo)
        with self.assertRaisesRegex(RuntimeError, "advanced"):
            store.publish_history(self.repo, self.output)
        self.assertEqual(store.remote_revision(self.repo), competing)

    def test_publication_rejects_invalid_base_values(self):
        for base in (True, 123, [], "refs/heads/master", "-u", "a" * 41):
            with self.subTest(base=base):
                self.stage(self.report("2026-W47", base))
                with self.assertRaisesRegex(ValueError, "base must be"):
                    store.publish_history(self.repo, self.output)

    def test_rerunning_a_week_replaces_it_without_duplicate_history(self):
        report = self.report("2026-W47")
        self.stage(report)
        first = store.publish_history(self.repo, self.output)
        report["history_base_revision"] = first
        report["overall"][0]["version"] = "1.1.0"
        self.stage(report)
        second = store.publish_history(self.repo, self.output)
        self.assertNotEqual(first, second)
        archive = self.root / "archive"
        store.load_history(self.repo, archive)
        weeks = load_snapshots(archive)
        self.assertEqual(len(weeks), 1)
        self.assertEqual(weeks["2026-W47"]["robots"][0]["version"], "1.1.0")

    def test_stale_base_and_mismatched_snapshot_are_rejected(self):
        self.stage(self.report("2026-W47"))
        first = store.publish_history(self.repo, self.output)
        self.stage(self.report("2026-W48", None))
        with self.assertRaisesRegex(RuntimeError, "advanced"):
            store.publish_history(self.repo, self.output)
        report = self.report("2026-W48", first)
        self.stage(report)
        report["overall"][0]["version"] = "tampered"
        (self.output / "leaderboard.json").write_text(json.dumps(report))
        with self.assertRaisesRegex(ValueError, "does not match"):
            store.publish_history(self.repo, self.output)
        self.assertEqual(store.remote_revision(self.repo), first)

    def test_unreachable_remote_and_unexpected_branch_are_not_empty_history(self):
        command("remote", "set-url", "origin", str(self.root / "absent.git"), cwd=self.repo)
        with self.assertRaisesRegex(RuntimeError, "refusing"):
            store.load_history(self.repo, self.root / "failed")
        command("remote", "set-url", "origin", str(self.remote), cwd=self.repo)
        command("push", "origin", "HEAD:refs/heads/league-history", cwd=self.repo)
        with self.assertRaisesRegex(ValueError, "unexpected"):
            store.load_history(self.repo, self.root / "wrong-branch")

    def test_destination_with_unrelated_files_is_never_replaced(self):
        directory = self.root / "user-files"
        directory.mkdir()
        protected = directory / "important.txt"
        protected.write_text("keep this")
        with self.assertRaises(ValueError):
            store.load_history(self.repo, directory)
        self.assertEqual(protected.read_text(), "keep this")

    def test_fetch_failure_and_corrupt_remote_preserve_previous_archive(self):
        self.stage(self.report("2026-W47"))
        revision = store.publish_history(self.repo, self.output)
        archive = self.root / "archive"
        store.load_history(self.repo, archive)
        original = (archive / "weeks/2026-W47.json").read_bytes()
        marker = (archive / store.MARKER).read_bytes()
        command("remote", "set-url", "origin", str(self.root / "absent.git"), cwd=self.repo)
        with self.assertRaises(RuntimeError):
            store.load_history(self.repo, archive)
        self.assertEqual((archive / "weeks/2026-W47.json").read_bytes(), original)
        self.assertEqual((archive / store.MARKER).read_bytes(), marker)
        command("remote", "set-url", "origin", str(self.remote), cwd=self.repo)
        # An existing data branch with no week records must not reset history.
        tree = command("mktree", cwd=self.repo)
        broken = command("commit-tree", tree, "-p", revision, "-m", "Empty broken archive", cwd=self.repo)
        command("push", "origin", broken + ":refs/heads/league-history", cwd=self.repo)
        with self.assertRaisesRegex(ValueError, "no weekly"):
            store.load_history(self.repo, archive)
        self.assertEqual((archive / "weeks/2026-W47.json").read_bytes(), original)

    def test_hidden_notes_in_cached_history_are_not_deleted(self):
        archive = self.root / "archive"
        store.load_history(self.repo, archive)
        notes = archive / "weeks/.notes"
        notes.write_text("my notes")
        with self.assertRaisesRegex(ValueError, "unrelated"):
            store.load_history(self.repo, archive)
        self.assertEqual(notes.read_text(), "my notes")

    def test_push_race_is_rejected_without_force_or_history_loss(self):
        self.stage(self.report("2026-W47"))
        first = store.publish_history(self.repo, self.output)
        self.stage(self.report("2026-W48", first))
        original = store.git
        raced = []
        def competing(repo, *arguments, **kwargs):
            if arguments[0] == "push":
                tree = command("rev-parse", first + "^{tree}", cwd=self.repo)
                other = command("commit-tree", tree, "-p", first, "-m", "Competing history", cwd=self.repo)
                command("push", "origin", other + ":refs/heads/league-history", cwd=self.repo)
                raced.append(other)
            return original(repo, *arguments, **kwargs)
        with patch.object(store, "git", side_effect=competing), self.assertRaises(RuntimeError):
            store.publish_history(self.repo, self.output)
        self.assertEqual(store.remote_revision(self.repo), raced[0])


if __name__ == "__main__":
    unittest.main(verbosity=2)
