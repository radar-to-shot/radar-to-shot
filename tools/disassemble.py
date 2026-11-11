#!/usr/bin/env python3
"""Produce reproducible 68000 listings and an A5 jump-table map.

The complete linear listings intentionally retain all resource bytes, including
embedded strings and switch tables. They are disassembly evidence, NOT an
automatic claim that every line is executable. LINK and call targets are
candidates for analysis, not recovered source symbols.
"""
import argparse
import json
from pathlib import Path
import re
import struct

from capstone import Cs, CS_ARCH_M68K, CS_MODE_BIG_ENDIAN, CS_MODE_M68K_000

ROOT = Path(__file__).resolve().parents[1]


def disassemble(resource_dir, output):
    output.mkdir(parents=True, exist_ok=True)
    table = (resource_dir / "CODE_0.bin").read_bytes()
    above_a5, below_a5, table_size, table_offset = struct.unpack(">IIII", table[:16])
    assert len(table) == table_size + 16 and table_size % 8 == 0
    jumps = []
    for offset in range(16, len(table), 8):
        code_offset, push_opcode, segment, trap = struct.unpack(">HHHH", table[offset:offset+8])
        assert push_opcode == 0x3f3c and trap == 0xa9f0
        jumps.append({
            "a5_entry_offset": table_offset + offset - 16,
            "a5_call_offset": table_offset + offset - 16 + 2,
            "segment": segment,
            "resource_offset": code_offset + 4,
        })
    jump_map = {j["a5_call_offset"]: j for j in jumps}
    manifest = {
        "address_convention": "All CODE offsets include the four-byte segment header.",
        "globals_bytes_below_a5": below_a5,
        "globals_bytes_above_a5": above_a5,
        "jump_table_offset": table_offset,
        "jump_table": jumps,
        "segments": [],
    }
    decoder = Cs(CS_ARCH_M68K, CS_MODE_BIG_ENDIAN | CS_MODE_M68K_000)
    decoder.skipdata = True
    for source in sorted(resource_dir.glob("CODE_*.bin")):
        segment = int(source.stem.split("_")[1])
        if segment == 0:
            continue
        code = source.read_bytes()
        lines = [
            f"; CODE {segment}, {len(code)} bytes, resource-relative hexadecimal offsets.",
            "; Linear sweep: embedded data may decode as instructions. Verify control flow.",
        ]
        link_candidates = [i for i in range(4, len(code)-3, 2) if code[i:i+2] == b"\x4e\x56"]
        for instruction in decoder.disasm(code[4:], 4):
            suffix = ""
            match = re.fullmatch(r"\$([0-9a-f]+)\(a5\)", instruction.op_str)
            if instruction.mnemonic in ("jsr", "jmp") and match:
                call = jump_map.get(int(match[1], 16))
                if call:
                    suffix = f" ; CODE {call['segment']} resource+0x{call['resource_offset']:04x}"
            lines.append(f"{instruction.address:04x}: {instruction.bytes.hex():<24} "
                         f"{instruction.mnemonic:<10} {instruction.op_str}{suffix}")
        (output / f"CODE_{segment}.asm").write_text("\n".join(lines) + "\n")
        strings = [{"offset": m.start(), "ascii": m.group().decode("ascii")}
                   for m in re.finditer(rb"[ -~]{5,}", code)]
        manifest["segments"].append({
            "id": segment, "bytes": len(code),
            "link_candidates": link_candidates, "ascii_runs": strings,
        })
    (output / "map.json").write_text(json.dumps(manifest, indent=2) + "\n")
    return manifest


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--resources", type=Path, default=ROOT / "reverse/original/resources")
    parser.add_argument("--out", type=Path, default=ROOT / "reverse/disassembly")
    args = parser.parse_args()
    result = disassemble(args.resources, args.out)
    print(f"Disassembled {len(result['segments'])} code segments and mapped "
          f"{len(result['jump_table'])} A5 entries")


if __name__ == "__main__":
    main()
