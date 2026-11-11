#!/usr/bin/env python3
"""Check or format project-owned C++ with the repository's pinned LLVM style."""
import argparse
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
STYLE_FILE = ROOT / ".clang-format"
FORMAT_VERSION = "20.1.8"
CPP_SUFFIXES = {".c", ".cc", ".cpp", ".cxx", ".h", ".hh", ".hpp", ".hxx", ".inc"}
# These are reference artifacts and an upstream dependency, not project source.
EXCLUDED_PREFIXES = ("reverse/decompiled/", "third_party/")


def formatter(override=None):
    if not STYLE_FILE.is_file():
        raise RuntimeError(f"Missing C++ formatting configuration: {STYLE_FILE}")
    adjacent = Path(sys.executable).with_name("clang-format")
    executable = override or (str(adjacent) if adjacent.is_file() else shutil.which("clang-format"))
    if not executable:
        raise RuntimeError("Install the formatter: python -m pip install -r tools/requirements-format.txt")
    version = subprocess.check_output([executable, "--version"], text=True)
    if not re.search(r"\bversion " + re.escape(FORMAT_VERSION) + r"\b", version):
        raise RuntimeError(f"Expected clang-format {FORMAT_VERSION}; found {version.strip()}")
    return executable


def source_files():
    # NUL delimiters preserve filenames containing spaces. Include new, unignored
    # files so local checks catch code before it is added to the index, too.
    names = subprocess.check_output(
        ["git", "ls-files", "-z", "--cached", "--others", "--exclude-standard"], cwd=ROOT
    )
    files = sorted({
        os.fsdecode(name) for name in names.split(b"\0") if name
    })
    files = [name for name in files
             if Path(name).suffix.lower() in CPP_SUFFIXES
             and not name.startswith(EXCLUDED_PREFIXES)
             and (ROOT / name).is_file()]
    if not files:
        raise RuntimeError("No project C++ files found; refusing an empty formatting check")
    return files


def format_text(source, filename, executable=None):
    """Canonical formatting for generated C++ using the same version/config as CI."""
    command = [formatter(executable), f"--style=file:{STYLE_FILE}",
               f"--assume-filename={filename}"]
    return subprocess.run(command, input=source, text=True, capture_output=True,
                          check=True, cwd=ROOT).stdout


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--check", action="store_true", help="Check without changing files (default)")
    mode.add_argument("--write", action="store_true", help="Format files in place")
    parser.add_argument("--clang-format", help="Path to the pinned clang-format executable")
    args = parser.parse_args()
    files = source_files()
    command = [formatter(args.clang_format), f"--style=file:{STYLE_FILE}"]
    command += ["-i"] if args.write else ["--dry-run", "--Werror"]
    result = subprocess.run(command + files, cwd=ROOT)
    if result.returncode == 0:
        print(f"{'Formatted' if args.write else 'Checked'} {len(files)} C++ files with clang-format {FORMAT_VERSION}")
    return result.returncode


if __name__ == "__main__":
    try:
        sys.exit(main())
    except (RuntimeError, OSError, subprocess.CalledProcessError) as error:
        print(error, file=sys.stderr)
        sys.exit(1)
