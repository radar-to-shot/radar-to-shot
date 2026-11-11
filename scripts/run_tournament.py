#!/usr/bin/env python3
"""Run a reproducible head-to-head Robot Warriors tournament."""

from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
from tournament import main


if __name__ == "__main__":
    raise SystemExit(main())
