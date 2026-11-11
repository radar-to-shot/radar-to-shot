"""Shared text-file interface for native and original-code battle runners."""

from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
MAX_TICKS = 1_000_000


def seed_value(text: str) -> int:
    try:
        value = int(text, 16 if text.lower().startswith("0x") else 10)
    except ValueError as error:
        raise argparse.ArgumentTypeError("seed must be a decimal or hexadecimal integer") from error
    if not 0 <= value <= 0xFFFFFFFF:
        raise argparse.ArgumentTypeError("seed must be between 0 and 0xffffffff")
    # These seeds collapse to zero, so the original distinct-region search
    # cannot place a second robot. Reject them before entering guest code.
    if value % 0x7FFFFFFF == 0:
        raise argparse.ArgumentTypeError("seed cannot select distinct starting regions")
    return value


def tick_value(text: str) -> int:
    try:
        value = int(text)
    except ValueError as error:
        raise argparse.ArgumentTypeError("ticks must be an integer") from error
    if not 0 <= value <= MAX_TICKS:
        raise argparse.ArgumentTypeError(f"ticks must be between 0 and {MAX_TICKS}")
    return value


def read_robot(path: Path, encoding: str) -> dict:
    try:
        source = path.read_bytes().decode("utf-8-sig" if encoding == "utf-8" else "mac_roman")
        source = source.replace("\r\n", "\n").replace("\r", "\n").replace("\n", "\r")
        encoded = source.encode("mac_roman")
    except UnicodeError as error:
        raise ValueError(
            f"{path}: cannot read {encoding} source as original Mac Roman: {error}"
        ) from error
    if len(encoded) > 32767:
        raise ValueError(f"{path}: source exceeds the original 32767-byte limit")
    # Hex transports the original bytes without JSON's UTF-8 conversion changing
    # non-ASCII characters before the C++ parser receives them.
    return {"name": path.name, "source_hex": encoded.hex()}


def run_native(request: dict, binary: Path, *, timeout: float | None = None) -> dict:
    if not binary.is_file():
        raise ValueError(f"Native binary not found: {binary}; build it with cmake or use --binary")
    process = subprocess.run(
        [str(binary.resolve()), "jsonl"],
        input=json.dumps({"kind": "battle", **request}) + "\n",
        text=True,
        capture_output=True,
        check=False,
        timeout=timeout,
    )
    if process.returncode:
        raise RuntimeError(f"Native battle failed ({process.returncode}): {process.stderr.strip()}")
    try:
        result = json.loads(process.stdout)
    except ValueError as error:
        raise RuntimeError("Native binary did not return a JSON battle result") from error
    if "exception" in result:
        raise ValueError(result["exception"])
    if "rng_seed" not in result:
        raise RuntimeError("Native binary lacks the battle runner protocol; rebuild it with cmake")
    return result


def battle_result(state: dict, engine: str, seed: int, ticks: int) -> dict:
    survivors = [index for index, robot in enumerate(state["robots"]) if robot["active"]]
    if len(survivors) == 1:
        termination = "last_survivor"
    elif not survivors:
        termination = "mutual_destruction"
    else:
        termination = "tick_limit"
    return {
        "schema_version": 1,
        "engine": engine,
        "seed": seed,
        "tick_limit": ticks,
        "termination": termination,
        "winner": survivors[0] if len(survivors) == 1 else None,
        **state,
    }


def write_result(result: dict, output: Path | None) -> None:
    text = json.dumps(result, indent=2, ensure_ascii=True) + "\n"
    if output is None:
        sys.stdout.write(text)
        return
    temporary = None
    try:
        with tempfile.NamedTemporaryFile(
            mode="w", encoding="utf-8", dir=output.parent, prefix=f".{output.name}.", delete=False
        ) as stream:
            temporary = Path(stream.name)
            stream.write(text)
        os.replace(temporary, output)
    finally:
        if temporary is not None:
            temporary.unlink(missing_ok=True)


def main(engine: str, argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description=f"Run 2–5 robot text files using {engine} and write battle results as JSON."
    )
    parser.add_argument("robots", nargs="+", type=Path, help="Robot source files, in execution order")
    parser.add_argument(
        "--ticks", type=tick_value, default=1000,
        help="Maximum 0.1-second ticks (default: 1000)",
    )
    parser.add_argument("--seed", type=seed_value, default=1, help="QuickDraw random seed (default: 1)")
    parser.add_argument(
        "--encoding", choices=("utf-8", "mac-roman"), default="utf-8",
        help="Input file encoding (default: utf-8)",
    )
    parser.add_argument("--output", type=Path, help="Write JSON to this file instead of stdout")
    if engine == "headless":
        parser.add_argument(
            "--binary", type=Path, default=ROOT / "build/robotwar",
            help="Path to the compiled native CLI",
        )
    args = parser.parse_args(argv)
    if not 2 <= len(args.robots) <= 5:
        parser.error("A battle requires 2–5 input robot files")
    try:
        if args.output and args.output.resolve() in {path.resolve() for path in args.robots}:
            raise ValueError("The output path must not overwrite an input robot")
        request = {
            "robots": [read_robot(path, args.encoding) for path in args.robots],
            "ticks": args.ticks,
            "seed": args.seed,
            "stop_when_finished": True,
            "include_rng_seed": True,
        }
        if engine == "headless":
            state = run_native(request, args.binary)
        else:
            # Native execution and argument validation need no emulation packages.
            try:
                from battle_68k import run_battle
            except ImportError as error:
                raise RuntimeError(
                    "68k dependencies unavailable; run tools/build_patched_emulator.py and "
                    "set PYTHONPATH to its target (see docs/HEADLESS.md)"
                ) from error
            state = run_battle(request)
        write_result(battle_result(state, engine, args.seed, args.ticks), args.output)
    except (OSError, ValueError, RuntimeError) as error:
        print(f"{parser.prog}: {error}", file=sys.stderr)
        return 2
    return 0
