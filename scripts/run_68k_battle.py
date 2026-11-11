#!/usr/bin/env python3
"""Run robot text files through the original application code and IIci ROM."""

from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
from battle_runner import main


if __name__ == "__main__":
    raise SystemExit(main("68k"))
