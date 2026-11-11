#!/usr/bin/env python3
"""Capture compiler outputs by executing the original application in Musashi.

This command intentionally overwrites only its selected oracle corpus. No native
implementation participates in computing expected results.
"""
import argparse
import json
from pathlib import Path

from oracle import OriginalMachine, ROOT


def inputs():
    cases = []
    def add(name, source, debug=False):
        cases.append((name, {"source": source, "debug": debug}))
    for source in ["", "x", "\r", "\r\r", "  \r", ";comment\r", "1 to x\r", "1 to x",
                   "1 to x\r\r", "1 to x ;comment\r", "\t1\tto\tx\r", "1 TO X\r"]:
        add(f"basic-{len(cases):03d}", source)
    for path in sorted((ROOT / "robots/examples").iterdir()):
        if path.is_file():
            source = path.read_bytes().decode("mac_roman").replace("\r\n", "\r").replace("\n", "\r")
            for debug in (False, True):
                add("example-" + path.name.lower().replace(" ", "-") + ("-debug" if debug else ""), source, debug)
    for n in [0, 1, 32767, 32768, 65535, -1, -32767, -32768]:
        add("constant-" + str(n), f"{n} to x\r")
    for expr in ["+1", "- 1", "+ 1", "1 + 2 * 3", "1 * 2 + 3", "10 mod 3", "1 and 2 or 4 xor 8",
                 "xmax", "ymax", "shot_speed", "1 + -2", "1 - -2", "1 / 0", "1 +", "(1+2)"]:
        add(f"expression-{len(cases):03d}", expr + " to x\r")
    for register in ["x", "y", "aim", "shot", "damage", "speed", "direction", "fuel", "cloak", "num_robots",
                     "time_int_mask", "time_int_xfer", "x_conv", "y_conv", "angle_conv", "dist_conv", "radar", "random", "stack"]:
        add("register-" + register, f"{register} to x\r1 to {register}\r")
    for source in ["allocate a\r1 to a\ra to x\r", "allocate a 0\r", "allocate a -1\r", "allocate a 200\r",
                   "allocate a 201\r", "allocate a 199\rallocate b\r", "allocate a -2\rallocate b\r&b to x\r",
                   "define n 7\rn to x\r", "define n -7\rn to x\r", "define n 32768\r", "define n x\r",
                   "allocate a\rallocate a\r", "define n 1\rdefine n 2\r", "allocate x\r", "define x 1\r",
                   "allocate a\r&a to x\ra^ to y\r1 to a^\r", "&x to y\r", "&missing to x\r",
                   "goto later\r1 to x\rlater\rreturn\r", "gosub sub\rgoto done\rsub\rreturn\rdone\r",
                   "missing to x\r", "goto missing\r", "label\rlabel\r", "label\rlabel^ to x\r",
                   "label\r1 to label\r", "define n 3\r1 to n\r", "1 to x to y to aim\r",
                   "allocate abcdefghijklmnoA\r1 to abcdefghijklmnoB\r", "allocate abcdefghijklmnoA\rallocate abcdefghijklmnoB\r"]:
        add(f"symbols-{len(cases):03d}", source)
    for name, limit in [("cpu_speed", 2), ("fire_rate", 4), ("engine_size", 1), ("radar_range", 2),
                        ("fuel_capacity", 2), ("cloaking", 1), ("armor", 5)]:
        for value in [-1, 0, limit, limit+1]:
            add(f"attribute-{name}-{value}", f"{name} {value}\r")
    add("attribute-budget-six", "armor 5\rcloaking 1\r")
    add("attribute-budget-seven", "armor 5\rcloaking 1\rcpu_speed 1\r")
    add("attribute-overwrite", "armor 5\rarmor 1\r")
    for op in ["=", "<>", "<", ">", "<=", ">="]:
        for action in ["goto done", "gosub done", "return", "endint", "reset", "trace", "1 to x"]:
            add(f"inline-{len(cases):03d}", f"if x {op} 3 then {action}\rdone\r")
    for source in ["if x = 1 then\r1 to y\rend\r", "if x = 1 then\r1 to y\relse\r2 to y\rend\r",
                   "while x < 4 do\rx + 1 to x\rend\r", "repeat\rx + 1 to x\runtil x > 4\r",
                   "if x = 1 then\rwhile y < 4 do\ry + 1 to y\rend\relse\rrepeat\ry - 1 to y\runtil y = 0\rend\r",
                   "if x = 1 then\r", "else\r", "end\r", "until x = 0\r", "repeat\rend\r",
                   "if x = 1\r", "while x = 1\r", "if x then 1 to y\r", "if x = 1 then allocate a\r",
                   "if x = 1 then define n 2\r", "trace\r", "return\r", "endint\r", "reset\r",
                   "X\r", "x = 10\r", "1\r", "1 to\r", "to x\r", "1 to 2\r", "1 to x y\r",
                   "@\r", "_name\r", "1 to x\r@\r", "1 to x\r2 +\r", "goto\r", "allocate\r", "define\r"]:
        add(f"grammar-{len(cases):03d}", source)
    for n in [14, 15, 16]:
        add(f"nesting-{n}", "if x = 1 then\r"*n + "1 to y\r" + "end\r"*n)
    for n in [198, 199, 200, 201]:
        add(f"symbol-count-{n}", "".join(f"allocate var{i}\r" for i in range(n)))
    for n in [1989, 1990, 1991, 1992]:
        add(f"instruction-count-{n}", "reset\r" * n)
    add("debug-statements", "allocate a\r1 to a\rtrace\rif a = 1 then 2 to x\rreset\r", True)
    # Targeted regressions found during independent review: terminal numeric
    # scanning, forward-symbol declaration updates, and malformed block nesting.
    for prefix in ["define n ", "allocate a ", "cpu_speed ", "goto "]:
        for number in ["0", "12", "32767", "-12"]:
            add(f"terminal-number-{len(cases):03d}", prefix + number)
    for source in ["label", "goto label\rlabel", "allocate a\ra", "define k 1\rk",
                   "goto a\rallocate b\rallocate a\r1 to a\r1 to b\r",
                   "goto a\rdefine b 2\rdefine a 1\ra to x\rb to y\r",
                   "a to x\rallocate b\rallocate a\r1 to b\r",
                   "allocate a\rallocate b\rallocate a\r",
                   "allocate a\rallocate b\rallocate a\r1 to a to b\r",
                   "define a 1\rdefine b 2\rdefine a 3\r",
                   "define a 1\rdefine b 2\rdefine a 3\ra to x\rb to y\r",
                   "goto 1\r", "gosub 1\r", "define a aim\ra to x\r1 to a\r",
                   "define a xmax\ra to x\r", "if x = 1 then @\r", "if x = 1 then 1 to\r",
                   "if x = 1 then to y\r", "if x = 1 then +\r",
                   "if x = 1 then\relse\relse\rend\r",
                   "while x = 1 do\relse\rend\r",
                   "repeat\rwhile x = 1 do\runtil x = 0\rend\r",
                   "if x = 1 then\runtil x = 0\rend\r",
                   "repeat\relse\runtil x = 0\r"]:
        add(f"review-regression-{len(cases):03d}", source)
    return cases


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--out", type=Path, default=ROOT / "tests/golden/compiler.json")
    args = parser.parse_args()
    machine = OriginalMachine()
    vectors = []
    try:
        for name, inp in inputs():
            expected = machine.compile(inp["source"], inp["debug"])
            vectors.append({"id": "compiler-" + name, "kind": "compile", "input": inp,
                            "expected": expected, "oracle": {"segment": 5, "offset": "0x24dc"}})
        corpus = {"provenance": machine.provenance(), "vectors": vectors}
    finally:
        machine.close()
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(corpus, indent=2, ensure_ascii=True) + "\n")
    print(f"Captured {len(vectors)} compiler vectors from original 68k execution: {args.out}")
    print(json.dumps(corpus["provenance"]))


if __name__ == "__main__":
    main()
