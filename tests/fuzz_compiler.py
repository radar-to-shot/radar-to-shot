#!/usr/bin/env python3
"""Seeded independent differential compiler checks against emulated original code.

Expected results come only from tools/oracle.py. Failures are saved outside the
golden corpus with complete source and both outputs; this command cannot update
committed golden files. Requires the optional oracle dependencies.
"""
import argparse
import hashlib
import json
from pathlib import Path
import random
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from oracle import OriginalMachine


def corpus(count, seed, valid_only=False):
    rng = random.Random(seed)
    registers = ["x", "y", "aim", "shot", "damage", "speed", "direction", "fuel", "cloak",
                 "num_robots", "time_int_mask", "time_int_xfer", "x_conv", "y_conv", "angle_conv",
                 "dist_conv", "radar", "random", "stack"]
    operators = ["+", "-", "*", "/", "mod", "and", "or", "xor"]
    comparisons = ["=", "<>", "<", ">", "<=", ">="]
    for index in range(count):
        variables = [f"v{i}" for i in range(rng.randrange(1, 5))]
        operands = registers + variables + ["k", "xmax", "ymax", "shot_speed", "0", "1", "32767", "endlabel"]
        def expression():
            value = rng.choice(operands + [str(rng.randrange(-32767, 32768))])
            for _ in range(rng.randrange(3)):
                value += " " + rng.choice(operators) + " " + rng.choice(operands)
            return value
        def assignment():
            return expression() + " to " + " to ".join(rng.choices(registers + variables, k=rng.randrange(1, 4)))
        def condition():
            return expression() + " " + rng.choice(comparisons) + " " + rng.choice(operands)
        lines = ["define k " + str(rng.randrange(-32767, 32768))]
        lines.extend("allocate " + variable + (" " + str(rng.randrange(0, 8)) if rng.random()<.3 else "")
                     for variable in variables)
        lines.append("startlabel")
        for _ in range(rng.randrange(1, 13)):
            choice = rng.randrange(8)
            if choice <= 2:
                lines.append(assignment())
            elif choice == 3:
                action = rng.choice([assignment(), "goto endlabel", "gosub endlabel", "return", "endint", "reset", "trace"])
                lines.append("if " + condition() + " then " + action)
            elif choice == 4:
                lines.extend(["if " + condition() + " then", assignment(), "else", assignment(), "end"])
            elif choice == 5:
                lines.extend(["while " + condition() + " do", assignment(), "end"])
            elif choice == 6:
                lines.extend(["repeat", assignment(), "until " + condition()])
            else:
                lines.append(rng.choice(["return", "reset", "endint", "trace", "goto startlabel", "gosub endlabel"]))
        lines.extend(["endlabel", "return"])
        mutation = "none"
        if not valid_only and rng.random() < .3:
            mutation = rng.choice(["bad-character", "undefined", "huge-number", "bad-declaration", "bad-condition", "unclosed", "bad-attribute"])
            at = rng.randrange(len(lines))
            if mutation == "bad-character": lines.insert(at, rng.choice(["@", "#", "(", "_"]))
            elif mutation == "undefined": lines.insert(at, "neverdefined to x")
            elif mutation == "huge-number": lines.insert(at, "32768 to y")
            elif mutation == "bad-declaration": lines.insert(at, "allocate x")
            elif mutation == "bad-condition": lines.insert(at, "if x then 1 to y")
            elif mutation == "unclosed": lines.append("if x = 1 then")
            elif mutation == "bad-attribute": lines.insert(at, "armor 6")
        if rng.random() < .5:
            lines = [line.upper() if rng.random()<.3 else line for line in lines]
        if rng.random() < .25:
            lines = [line.replace(" ", "\t") for line in lines]
        if rng.random() < .3:
            lines = [line + " ; random annotation" if rng.random()<.3 else line for line in lines]
        source = "\r".join(lines) + ("\r" if rng.random()<.85 else "")
        yield {"id": f"seed-{seed}-case-{index:04d}", "mutation": mutation,
               "input": {"source": source, "debug": rng.random() < .2}}


def run(binary, count, seed, failures_path, valid_only):
    cases = list(corpus(count, seed, valid_only))
    machine = OriginalMachine()
    try:
        for case in cases:
            case["expected"] = machine.compile(**case["input"])
        provenance = machine.provenance()
    finally:
        machine.close()
    provenance["generator_sha256"] = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    corpus_path = failures_path.with_name(failures_path.stem + "-corpus.json")
    corpus_path.parent.mkdir(parents=True, exist_ok=True)
    corpus_path.write_text(json.dumps({"seed": seed, "provenance": provenance,
        "vectors": [{"id": case["id"], "kind": "compile", "mutation": case["mutation"],
                     "input": case["input"], "expected": case["expected"]} for case in cases]}, indent=2) + "\n")
    commands = "".join(json.dumps(dict(case["input"], kind="compile")) + "\n" for case in cases)
    process = subprocess.run([str(binary), "jsonl"], input=commands, text=True,
                             capture_output=True, timeout=120)
    if process.returncode:
        raise RuntimeError(f"Native process exited {process.returncode}: {process.stderr}")
    responses = process.stdout.splitlines()
    if len(responses) != len(cases):
        raise RuntimeError(f"Expected {len(cases)} responses, got {len(responses)}")
    failures = []
    for case, response in zip(cases, responses):
        actual = json.loads(response)
        if actual != case["expected"]:
            case["actual"] = actual
            case["differing_fields"] = sorted(k for k in case["expected"] if actual.get(k) != case["expected"][k])
            failures.append(case)
    report = {"seed": seed, "count": count, "passed": count-len(failures),
              "failed": len(failures), "provenance": provenance, "failures": failures}
    failures_path.parent.mkdir(parents=True, exist_ok=True)
    failures_path.write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps({k: report[k] for k in ["seed", "count", "passed", "failed"]}))
    for case in failures[:8]:
        print(case["id"], case["mutation"], ",".join(case["differing_fields"]))
    print(f"Full differential report: {failures_path}")
    print(f"Replayable original observations: {corpus_path}")
    return int(bool(failures))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--binary", type=Path, default=ROOT / "build/robotwar")
    parser.add_argument("--count", type=int, default=750)
    parser.add_argument("--seed", type=int, default=19910911)
    parser.add_argument("--failures", type=Path, default=ROOT.parent / "compiler-fuzz-failures.json")
    parser.add_argument("--valid-only", action="store_true")
    args = parser.parse_args()
    if args.count < 1:
        parser.error("--count must be positive")
    return run(args.binary.resolve(), args.count, args.seed, args.failures, args.valid_only)


if __name__ == "__main__":
    sys.exit(main())
