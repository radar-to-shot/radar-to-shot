#!/usr/bin/env python3
"""Rank every robot in fresh 2-, 3-, 4-, and 5-way weekly leagues."""
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
from weekly_league import main

if __name__ == "__main__":
    raise SystemExit(main())
