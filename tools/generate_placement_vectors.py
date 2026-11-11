#!/usr/bin/env python3
"""Capture original region rejection and placement with actual ROM Random.

CODE3:39a0..39c0 is the original GUI caller's region selection block; CODE3:0e08
is its full robot initialization routine. Checkpoints omit only the surrounding
GUI setup/drawing, with controlled valid frames and original application bytes.
"""
import json
import machine68k
from oracle import OriginalMachine, A5, ROBOT, STACK, ROOT, word, long
from platform_sane import RomNumericalPlatform


def capture_case(m, seed, count):
    m.reset()
    m.mem.clear_block(ROBOT, 0x3000, 0)
    m.mem.clear_block(0x500000, 0x30000, 0)
    m.mem.w32(A5, 0x500000)
    m.mem.w32(0x500000 - 0x7e, seed)
    frame = 0x510000
    robots = []
    for _ in range(count):
        m.cpu.w_sp(STACK)
        m.cpu.w_reg(machine68k.Register.A6, frame)
        # Give the checkpoint's following GUI instruction a valid frame too.
        m.cpu.w_reg(machine68k.Register.A4, 0x520000)
        m.run_until(3, 0x39a0, 0x39c0)
        region = m.cpu.r32_reg(machine68k.Register.D6) & 65535
        m.call(3, 0x0e08, word(region) + long(ROBOT + 0x11c) + word(1))
        robots.append({'x': m.mem.r16s(ROBOT + 0x2072),
                       'y': m.mem.r16s(ROBOT + 0x2074), 'region': region})
    return {'robots': robots, 'seed': m.mem.r32(0x500000 - 0x7e)}


def main():
    m = OriginalMachine(cpu_type=machine68k.CPUType.M68030)
    platform = RomNumericalPlatform(m)
    # Dispatch the original QuickDraw routine with its normal Pascal trap ABI.
    m.toolbox_handlers[0xa861] = platform.rom_trap
    cases = [(0, 0), (0, 1), (0x7fffffff, 1)]
    for seed in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 42, 12345, 65536,
                 1991, 68000, 958682087, 0x7ffffffe, 0xffffffff]:
        for count in [1, 2, 5]:
            cases.append((seed, count))
    vectors = [{'id': f'placement_{seed:08x}_{count}',
                'kind': 'world_placement', 'input': {'seed': seed, 'count': count},
                'expected': capture_case(m, seed, count)} for seed, count in cases]
    provenance = m.provenance()
    provenance['platform'] = platform.provenance()
    provenance['selection'] = 'Original CODE3:39a0..39c0 checkpoint inside GUI caller; used-region bytes persist'
    provenance['initialization'] = 'Original complete CODE3:0e08, including original ROM QuickDraw Random'
    provenance['random_rom_offset'] = hex(platform.rom_traps['toolbox'][0x61])
    provenance['degenerate_seed'] = 'Seed0 (or0x7fffffff) count>1 would loop forever in original, excluded from oracle'
    path = ROOT / 'tests/golden/placement.json'
    path.write_text(json.dumps({'provenance': provenance, 'vectors': vectors}, indent=2) + '\n')
    print(f'Captured {len(vectors)} original placement vectors')
    m.close()


if __name__ == '__main__':
    main()
