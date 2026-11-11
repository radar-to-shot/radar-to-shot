#!/usr/bin/env python3
"""Decode the bundled IIci ROM trap map and execute its original PtToAngle.

The compressed map decoder follows ROM offsets 0x9a96–0x9ae4. The ROM payload
is never patched. PtToAngle and its FixRatio/FixMul/AngleFromSlope dependencies
execute directly under the same Musashi core, configured for the 68020 opcodes
used by this 68030 Macintosh ROM.
"""
import argparse
import hashlib
import json
from pathlib import Path
import struct

import machine68k

from oracle import OriginalMachine, ROOT, SENTINEL, STACK, A5, long, word

ROM_PATH = ROOT / "images/Mac_IIci.ROM"
ROM_BASE = 0x600000


def decode_traps(rom):
    cursor = struct.unpack_from(">I", rom, 0x22)[0]
    start = cursor
    current = 0
    offsets = []
    while True:
        item = rom[cursor]
        cursor += 1
        if item & 0x80:
            item &= 0x7f
            if item == 0:
                offsets.append(0x9ae6)  # ROM's unimplemented-trap handler (A4).
                continue
            if item == 0x7f:
                current = struct.unpack_from(">I", rom, cursor)[0]
                cursor += 4
                offsets.append(current)
                continue
        else:
            item = item * 256 + rom[cursor]
            cursor += 1
        delta = (item * 2) & 0xffff
        if delta == 0:
            break
        current += delta if delta < 0x8000 else delta - 0x10000
        offsets.append(current)
    if len(offsets) != 1280 or any(x < 0 or x >= len(rom) for x in offsets):
        raise ValueError("ROM trap table is not the expected IIci 1024 Toolbox + 256 OS layout")
    return {"table_offset": start, "table_end": cursor,
            "toolbox": offsets[:1024], "os": offsets[1024:]}


def install_rom(machine, base=ROM_BASE):
    rom = ROM_PATH.read_bytes()
    table = decode_traps(rom)
    machine.add_code_region("Mac_IIci.ROM", base, rom)
    # Install only the actual dependencies. Installing all 1024 Toolbox vectors
    # would overwrite the routine harness's return sentinel at low RAM 0x1000.
    for trap in (0xa868, 0xa869, 0xa8c4):
        index = trap & 0x3ff
        machine.mem.w32(0xe00 + index * 4, base + table["toolbox"][index])
    return table


class RomMachine(OriginalMachine):
    def __init__(self):
        super().__init__(cpu_type=machine68k.CPUType.M68020)
        self.rom_traps = install_rom(self)

    def pt_to_angle(self, x, y, rect=(0, 0, 100, 100)):
        """Original PtToAngle(rect, Point(v=y,h=x), &angle), no host math."""
        self.reset()
        rect_address, result_address = 0x300000, 0x300010
        self.mem.w_block(rect_address, b"".join(word(v) for v in rect))
        self.mem.w16(result_address, 0)
        args = long(result_address) + word(y) + word(x) + long(rect_address)
        self.mem.clear_block(STACK-0x10000, 0x10100, 0)
        self.mem.w_block(STACK, long(SENTINEL) + args)
        self.cpu.w_sp(STACK)
        self.cpu.w_pc(ROM_BASE + self.rom_traps["toolbox"][0xc3])
        outcome = self.machine.execute(1_000_000)
        if outcome.result is not self.stop or self.cpu.r_sp() != STACK+16:
            raise RuntimeError("Original PtToAngle failed to return with its Pascal stack balanced")
        return self.mem.r16s(result_address)

    def random_sequence(self, seed, count):
        """Original QuickDraw Random: preserve each observed seed and result."""
        self.reset()
        globals_address=0x500000
        self.mem.w32(A5,globals_address)
        self.mem.w32(globals_address-0x7e,seed & 0xffffffff)
        samples=[]
        for _ in range(count):
            self.mem.w_block(STACK,long(SENTINEL)+bytes(2))
            self.cpu.w_sp(STACK)
            self.cpu.w_pc(ROM_BASE+self.rom_traps['toolbox'][0x61])
            outcome=self.machine.execute(10000)
            if outcome.result is not self.stop or self.cpu.r_sp()!=STACK+4:
                raise RuntimeError('Original Random failed to return with its Pascal stack balanced')
            samples.append({'seed':self.mem.r32(globals_address-0x7e),
                            'word':self.mem.r16s(STACK+4)})
        return {'seed':self.mem.r32(globals_address-0x7e),'samples':samples}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--map", type=Path, help="Save the decoded ROM map and ROM SHA-256")
    args = parser.parse_args()
    rom = ROM_PATH.read_bytes()
    decoded = decode_traps(rom)
    if args.map:
        args.map.parent.mkdir(parents=True, exist_ok=True)
        args.map.write_text(json.dumps({"rom_sha256": hashlib.sha256(rom).hexdigest(), **decoded}, indent=2)+"\n")
    machine = RomMachine()
    try:
        points = [(50, 40), (60, 40), (60, 50), (60, 60), (50, 60), (40, 60), (40, 50), (40, 40), (50, 50)]
        print(json.dumps({"pt_to_angle": [{"x": x, "y": y, "angle": machine.pt_to_angle(x,y)} for x,y in points],
                          "provenance": machine.provenance()}, indent=2))
    finally:
        machine.close()


if __name__ == "__main__":
    main()
