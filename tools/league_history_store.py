"""Read and publish durable weekly snapshots on an isolated Git data branch.

No checkout, worktree, user index, force push, or default-branch commit is used.
Publication checks the exact base used to build the leaderboard, so concurrent
history changes cannot silently produce stale standings or overwrite new weeks.
"""
from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile

from league_history import load_snapshots, make_snapshot, validate_snapshot

BRANCH = "league-history"
MARKER = ".history-source.json"
README = ("# Robot Warriors league history\n\n"
          "Published weekly snapshots. Ratings are recomputed each week; historical league "
          "points are derived from these records. See docs/WEEKLY_LEAGUE.md on the default "
          "branch. Do not edit this branch while a weekly publication is running.\n")


def git(repo, *arguments, data=None, env=None, check=True):
    result = subprocess.run(["git", "-C", str(repo), *arguments], input=data,
                            capture_output=True, env=env, timeout=60)
    if check and result.returncode:
        # Do not echo credential-bearing remote diagnostics or command arguments.
        raise RuntimeError(f"Git {arguments[0]} failed (exit {result.returncode}); inspect repository access or branch protection")
    return result


def remote_revision(repo):
    result = git(repo, "ls-remote", "--exit-code", "--heads", "origin", f"refs/heads/{BRANCH}", check=False)
    if result.returncode == 2:
        return None
    if result.returncode:
        raise RuntimeError("Cannot read the history branch; refusing to treat a fetch failure as empty history")
    advertised = result.stdout.decode("ascii").strip().split("\t")
    if len(advertised) != 2 or advertised[1] != f"refs/heads/{BRANCH}" or not re.fullmatch(r"[a-f0-9]{40,64}", advertised[0]):
        raise RuntimeError("Unexpected history branch response")
    git(repo, "fetch", "--no-tags", "origin", f"refs/heads/{BRANCH}")
    revision = git(repo, "rev-parse", "FETCH_HEAD").stdout.decode().strip()
    if revision != advertised[0]:
        raise RuntimeError("History changed while fetching; rerun the league")
    return revision


def load_history(repo: Path, output: Path) -> str | None:
    if output.is_symlink():
        raise ValueError("History output must not be a symlink")
    output = output.resolve()
    old_revision = None
    if output.exists():
        if not output.is_dir() or not (output / MARKER).is_file():
            raise ValueError("History output already exists without its history marker")
        allowed = {"weeks", MARKER}
        if any(path.name not in allowed or path.is_symlink() for path in output.iterdir()):
            raise ValueError("History output contains unexpected files")
        if (output / "weeks").exists():
            load_snapshots(output)
            for path in (output / "weeks").iterdir():
                if not re.fullmatch(r"\d{4}-W\d{2}\.json", path.name):
                    raise ValueError("History output contains unrelated files")
        old_revision = json.loads((output / MARKER).read_text()).get("revision")
    revision = remote_revision(repo)
    if old_revision is not None and revision is None:
        raise RuntimeError("Published history branch disappeared; restore it before running the league")
    output.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix=".history-load-", dir=output.parent) as temporary:
        temporary = Path(temporary)
        staging = temporary / "candidate"
        (staging / "weeks").mkdir(parents=True)
        if revision:
            tree = git(repo, "ls-tree", "-r", "-z", revision).stdout
            for entry in tree.split(b"\0"):
                if not entry:
                    continue
                metadata, raw_path = entry.split(b"\t", 1)
                mode, kind, blob = metadata.decode("ascii").split()
                path = raw_path.decode("utf-8")
                if mode != "100644" or kind != "blob" or not (
                        path == "README.md" or re.fullmatch(r"weeks/\d{4}-W\d{2}\.json", path)):
                    raise ValueError("History branch contains unexpected paths or nonregular files")
                if path != "README.md":
                    size = int(git(repo, "cat-file", "-s", blob).stdout)
                    if size > 10 * 1024 * 1024:
                        raise ValueError("Historical week exceeds the snapshot size limit")
                    (staging / path).write_bytes(git(repo, "cat-file", "blob", blob).stdout)
        snapshots = load_snapshots(staging)
        if revision and not snapshots:
            raise ValueError("Published history branch contains no weekly snapshots")
        (staging / MARKER).write_text(json.dumps({"branch": BRANCH, "revision": revision}) + "\n", encoding="utf-8")
        backup = temporary / "previous"
        if output.exists():
            output.rename(backup)
        try:
            staging.rename(output)
        except OSError:
            if backup.exists():
                backup.rename(output)
            raise
    return revision


def publish_history(repo: Path, report_dir: Path) -> str:
    report = json.loads((report_dir / "leaderboard.json").read_text())
    if report.get("status") != "completed" or "history_base_revision" not in report:
        raise ValueError("Publication needs a completed report built from the history branch")
    snapshot_path = report_dir / "history-week.json"
    if snapshot_path.stat().st_size > 10 * 1024 * 1024:
        raise ValueError("Weekly snapshot exceeds size limit")
    snapshot = validate_snapshot(json.loads(snapshot_path.read_text()), report["week"])
    if snapshot != make_snapshot(report):
        raise ValueError("History snapshot does not match the completed leaderboard")
    base = report["history_base_revision"]
    if base is not None and (not isinstance(base, str) or not re.fullmatch(r"[a-f0-9]{40}(?:[a-f0-9]{24})?", base)):
        raise ValueError("History publication base must be a commit ID or null")
    parent = remote_revision(repo)
    retry = parent != base
    if retry:
        # A successful remote push can lose its acknowledgement, or the job can
        # fail after pushing. Only our exact single update may be acknowledged
        # on retry; a subsequent publication must still invalidate this report.
        if parent is None:
            raise RuntimeError("History advanced after this league was built; rerun before publishing")
        headers = git(repo, "cat-file", "commit", parent).stdout.split(b"\n\n", 1)[0].splitlines()
        parents = [line[7:].decode("ascii") for line in headers if line.startswith(b"parent ")]
        if parents != ([base] if base is not None else []):
            raise RuntimeError("History advanced after this league was built; rerun before publishing")
    # Validate existing archive too; never preserve an unreviewed malformed tree.
    with tempfile.TemporaryDirectory(prefix="robotwar-history-") as temporary:
        temporary = Path(temporary)
        actual = load_history(repo, temporary / "archive")
        if actual != parent:
            raise RuntimeError("History changed while preparing publication; rerun the league")
        env = {**os.environ, "GIT_INDEX_FILE": str(temporary / "index"),
               "GIT_AUTHOR_NAME": "github-actions[bot]", "GIT_COMMITTER_NAME": "github-actions[bot]",
               "GIT_AUTHOR_EMAIL": "41898282+github-actions[bot]@users.noreply.github.com",
               "GIT_COMMITTER_EMAIL": "41898282+github-actions[bot]@users.noreply.github.com"}
        # Reconstruct from the report's original base, not the current tip. This
        # makes the retry test cover every archived week and README as well as
        # this week's snapshot, so unrelated changes cannot be accepted.
        git(repo, "read-tree", base if base else "--empty", env=env)
        contents = json.dumps(snapshot, indent=2, ensure_ascii=True).encode() + b"\n"
        files = {f"weeks/{snapshot['week']}.json": contents}
        if base is None:
            files["README.md"] = README.encode()
        for path, content in files.items():
            blob = git(repo, "hash-object", "-w", "--stdin", data=content).stdout.decode().strip()
            git(repo, "update-index", "--add", "--cacheinfo", f"100644,{blob},{path}", env=env)
        tree = git(repo, "write-tree", env=env).stdout.decode().strip()
        if retry:
            if tree != git(repo, "rev-parse", f"{parent}^{{tree}}").stdout.decode().strip():
                raise RuntimeError("History advanced after this league was built; rerun before publishing")
            return parent
        if parent and tree == git(repo, "rev-parse", f"{parent}^{{tree}}").stdout.decode().strip():
            return parent
        arguments = ["commit-tree", tree, "-m", f"Record Robot Warriors league {snapshot['week']}"]
        if parent:
            arguments += ["-p", parent]
        revision = git(repo, *arguments, env=env).stdout.decode().strip()
        # A normal non-force push rejects any update that raced this parent.
        git(repo, "push", "origin", f"{revision}:refs/heads/{BRANCH}")
        return revision


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("operation", choices=("load", "publish"))
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    parser.add_argument("--directory", type=Path, required=True,
                        help="Archive destination for load; completed report directory for publish")
    args = parser.parse_args(argv)
    try:
        if args.operation == "load":
            revision = load_history(args.repo, args.directory)
            print(f"History loaded: {revision or 'first published week'}")
        else:
            print(f"History published: {publish_history(args.repo, args.directory)}")
    except (OSError, ValueError, RuntimeError, subprocess.SubprocessError) as error:
        print(f"{parser.prog}: {error}", file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
