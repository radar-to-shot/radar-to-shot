#!/usr/bin/env python3
"""Execute extracted Robot Warriors 1.0.1 instructions with Musashi.

This is a routine-level classic-Mac harness, not a reimplementation of the game.
The original application CODE bytes and their Pascal runtime are executed intact.
The segment loader, input memory, return sentinel and explicitly recorded
Macintosh platform-service shims are supplied here. Game routines are never
replaced. Unknown OS traps and execution outside original code fail closed.
"""
from __future__ import annotations
import hashlib
import json
from pathlib import Path
import struct
import machine68k

ROOT = Path(__file__).resolve().parents[1]
RESOURCE_DIR = ROOT / 'reverse/original/resources'
A5 = 0x800000
STACK = 0xf00000
SENTINEL = 0x1000
ROBOT = 0x400000

def word(n: int) -> bytes:
    return struct.pack('>H', n & 0xffff)

def long(n: int) -> bytes:
    return struct.pack('>I', n & 0xffffffff)

class _Checkpoint(Exception):
    pass

class OriginalMachine:
    """One Musashi instance at a time; all guest addresses are big endian."""
    def __init__(self, cpu_type=machine68k.CPUType.M68000):
        self.host_service_calls = {}
        self.extra_regions = {}
        self.extra_instructions = {}
        self.toolbox_handlers = {}
        self._stop_pc = None
        self.machine = machine68k.Machine(cpu_type, 16384)
        self.cpu = self.machine.cpu
        self.mem = self.machine.mem
        self.code = {n: (RESOURCE_DIR / f'CODE_{n}.bin').read_bytes() for n in range(6)}
        self.bases = {n: 0x100000 + n * 0x10000 for n in range(1, 6)}
        for n, base in self.bases.items():
            self.mem.w_block(base, self.code[n])
        _, _, table_len, table_offset = struct.unpack('>4I', self.code[0][:16])
        self.jump_range = (A5 + table_offset, A5 + table_offset + table_len)
        for i in range(0, table_len, 8):
            entry = self.code[0][16+i:24+i]
            offset, push, segment, trap = struct.unpack('>4H', entry)
            if push != 0x3f3c or trap != 0xa9f0:
                raise ValueError(f'Invalid CODE0 entry {i}: {entry.hex()}')
            target = self.bases[segment] + offset + 4
            self.mem.w_block(A5 + table_offset + i, word(segment) + word(0x4ef9) + long(target))
        self.stop = self.machine.create_execute_end('Pascal routine returned')
        self.stop_trap = self.machine.traps.alloc(lambda _opcode, _pc: self.stop)
        for _ in range(1, 0x1000):
            self.machine.traps.alloc(self._trap)
        self.mem.w16(SENTINEL, 0xa000 | self.stop_trap)
        self.cpu.w_sr(0x2700)
        self.cpu.w_reg(machine68k.Register.A5, A5)
        self.cpu.set_instr_hook_callback(self._instruction)
        self.instructions = 0
        self.segment_instructions = {}
        self.executed_traps = []
        self.last_pc = 0
        self.reset()

    def add_code_region(self, name, base, data):
        """Load additional *original* ROM/package code with integrity accounting."""
        if name in self.extra_regions:
            raise ValueError(f'Duplicate code region {name}')
        data = bytes(data)
        for other_base, other_data in self.extra_regions.values():
            if base < other_base + len(other_data) and other_base < base + len(data):
                raise ValueError('Overlapping extra code regions')
        self.mem.w_block(base, data)
        self.extra_regions[name] = (base, data)

    def reset(self):
        """Reset guest globals/registers; preserve original code and relocated jump table."""
        initial = ROOT / 'reverse/original/a5_initial.bin'
        if initial.exists():
            data = initial.read_bytes()
            self.mem.w_block(A5-len(data), data)
        else:
            self.mem.clear_block(A5-0x43ac, 0x43ac, 0)
        # CODE2:02f4..0306 runtime text-editor control characters.
        for off, value in [(0x4246, 13), (0x4244, 8), (0x4242, 9), (0x4240, 3)]:
            self.mem.w16(A5-off, value)
        self.cpu.w_sr(0x2700)
        for reg in range(16):
            self.cpu.w_reg(reg, 0)
        self.cpu.w_reg(machine68k.Register.A5, A5)

    def _instruction(self, pc):
        if pc == self._stop_pc:
            raise _Checkpoint()
        self.last_pc = pc
        self.instructions += 1
        if pc == SENTINEL:
            return
        if self.jump_range[0] <= pc < self.jump_range[1]:
            return
        for n, base in self.bases.items():
            if base + 4 <= pc < base + len(self.code[n]):
                self.segment_instructions[n] = self.segment_instructions.get(n, 0) + 1
                opcode = self.mem.r16(pc)
                if opcode >> 12 == 0xa:
                    self.executed_traps.append(f'{opcode:04x}@CODE{n}:{pc-base:04x}')
                    if opcode not in (0xa9ee,) and opcode not in self.toolbox_handlers:
                        raise RuntimeError(f'Unimplemented Macintosh trap {opcode:04x} at CODE{n}:{pc-base:04x}')
                return
        for name, (base, data) in self.extra_regions.items():
            if base <= pc < base + len(data):
                self.extra_instructions[name] = self.extra_instructions.get(name, 0) + 1
                opcode = self.mem.r16(pc)
                if opcode >> 12 == 0xa:
                    self.executed_traps.append(f'{opcode:04x}@{name}:{pc-base:06x}')
                    if opcode not in (0xa9ee,) and opcode not in self.toolbox_handlers:
                        raise RuntimeError(f'Unimplemented trap {opcode:04x} at {name}:{pc-base:06x}')
                return
        raise RuntimeError(f'Guest executed outside original code: PC={pc:08x}')

    def _trap(self, opcode, pc):
        if opcode in self.toolbox_handlers:
            return self.toolbox_handlers[opcode](opcode, pc)
        if opcode == 0xa9ee:  # Pack7 selector 0: NumToString.
            self.host_service_calls['a9ee'] = self.host_service_calls.get('a9ee', 0) + 1
            sp = self.cpu.r_sp()
            selector = self.mem.r16(sp)
            if selector != 0:
                raise RuntimeError(f'Unsupported Pack7 selector {selector}')
            self.cpu.w_sp(sp + 2)
            value = self.cpu.r32s_reg(machine68k.Register.D0)
            dst = self.cpu.r32_reg(machine68k.Register.A0)
            self.mem.w_bstr(dst, str(value))
            return
        raise RuntimeError(f'Unimplemented Macintosh trap {opcode:04x} at {pc:08x}')

    def run_until(self, segment, offset, stop_offset, max_cycles=100_000_000):
        """Execute an original basic-block range; caller supplies registers/frame.

        The stop is an emulator instruction hook, not a patch or replacement of
        guest instructions. Used for startup table initialization inside the
        otherwise GUI-dependent application startup routine.
        """
        self._stop_pc = self.bases[segment] + stop_offset
        self.cpu.w_pc(self.bases[segment] + offset)
        try:
            self.machine.execute(max_cycles)
        except _Checkpoint:
            return
        else:
            raise RuntimeError(f'Stop PC not reached: {self.cpu.r_pc():08x}')
        finally:
            self._stop_pc = None

    def call(self, segment: int, offset: int, args: bytes = b'', result_bytes: int = 0,
             max_cycles: int = 100_000_000) -> bytes:
        self.mem.clear_block(STACK - 0x10000, 0x10100, 0)
        self.mem.w_block(STACK, long(SENTINEL) + args + bytes(result_bytes))
        self.cpu.w_sr(0x2700)
        self.cpu.w_sp(STACK)
        self.cpu.w_reg(machine68k.Register.A5, A5)
        self.cpu.w_reg(machine68k.Register.A6, 0)
        self.cpu.w_pc(self.bases[segment] + offset)
        outcome = self.machine.execute(max_cycles)
        if outcome.result is not self.stop:
            raise RuntimeError(f'Instruction budget exhausted at {self.cpu.r_pc():08x}')
        expected_sp = STACK + 4 + len(args)
        if self.cpu.r_sp() != expected_sp:
            raise RuntimeError(f'Pascal stack mismatch: {self.cpu.r_sp():08x} != {expected_sp:08x}')
        return bytes(self.mem.r_block(expected_sp, result_bytes))

    def provenance(self):
        # Hashes attest the bytes actually executed, not merely their disk source.
        for n, base in self.bases.items():
            loaded = bytes(self.mem.r_block(base, len(self.code[n])))
            if loaded != self.code[n]:
                raise RuntimeError(f'Original CODE{n} guest bytes were modified')
        extra_hashes = {}
        for name, (base, data) in self.extra_regions.items():
            if bytes(self.mem.r_block(base, len(data))) != data:
                raise RuntimeError(f'Original {name} guest bytes were modified')
            extra_hashes[name] = hashlib.sha256(data).hexdigest()
        build_record = Path(machine68k.__file__).parent / 'robotwar-emulator-build.json'
        emulator_build = json.loads(build_record.read_text()) if build_record.exists() else None
        return {
            'engine': 'machine68k 0.5.1 / Musashi, ' + self.cpu.get_cpu_name(),
            'emulator_build': emulator_build,
            'extra_code_sha256': extra_hashes,
            'extra_code_instructions': self.extra_instructions,
            'mode': 'routine-level original-code execution',
            'guest_code_integrity': 'CODE1..5 guest bytes equal extracted resource bytes',
            'code_sha256': {str(n): hashlib.sha256(self.code[n]).hexdigest() for n in range(6)},
            'instructions': self.instructions,
            'segment_instructions': self.segment_instructions,
            'macintosh_traps': sorted(set(self.executed_traps)),
            'toolbox_shims': {opcode: description for opcode, description in {
                'a9ee': 'Pack7 selector0 (popped word): signed D0 -> decimal Pascal string at A0',
                'a861': 'Explicit input random_words; validates game postprocessing, not Macintosh RNG algorithm'
            }.items() if opcode in self.host_service_calls},
            'host_service_calls': self.host_service_calls,
        }

    def close(self):
        self.machine.cleanup()

    def compile(self, source: str, debug: bool = False):
        self.reset()
        raw = source.encode('mac_roman')
        if len(raw) > 32767:
            raise ValueError('Original compiler input is a signed 16-bit length')
        source_addr, handle, error, count, attrs, code, errorpos = (0x300000, 0x310000, 0x310010,
                                                                0x310120, 0x310130, 0x320000, 0x310140)
        self.mem.clear_block(0x300000, 0x30000, 0)
        self.mem.w_block(source_addr, raw)
        self.mem.w32(handle, source_addr)
        for i, limit in enumerate([2, 4, 1, 2, 2, 1, 5]):
            self.mem.w16(A5 - 0x114 + i*2, limit)
        args = word(0x100 if debug else 0) + long(errorpos) + long(count) + long(attrs) + long(code) + word(255) + long(error) + word(len(raw)) + long(handle)
        self.call(5, 0x24dc, args)
        n = self.mem.r16(count)
        return {
            'error': self.mem.r_bstr(error),
            'error_position': self.mem.r16(errorpos),
            'attributes': [self.mem.r16(attrs+i*2) for i in range(7)],
            'code_count': n,
            'code_hex': bytes(self.mem.r_block(code, n*4)).hex(),
        }

    def scan_token(self, source: str, offset: int = 0, has_operand: bool = False):
        self.reset()
        raw = source.encode('mac_roman')
        self.mem.clear_block(0x300000, 0x30000, 0)
        frame, src, handle, error = 0x310400, 0x300000, 0x310000, 0x310010
        self.mem.w_block(src, raw)
        self.mem.w32(handle, src)
        self.mem.w32(frame+0x22, handle)
        self.mem.w16(frame+0x20, len(raw))
        self.mem.w32(frame+0x1c, error)
        self.mem.w16(frame+0x1a, 255)
        self.mem.w16(frame-0x9e, offset)
        self.mem.w8(frame-0x7b, int(has_operand))
        self.call(5, 0x1718, long(frame))
        return {'kind': self.mem.r8(frame-0x7c),
                'operation': self.mem.r8(frame-0x7d),
                'value': self.mem.r16s(frame-0x90),
                'symbol': self.mem.r_bstr(frame-0x8e),
                'attribute': self.mem.r8(frame-0xa5),
                'next_offset': self.mem.r16s(frame-0x9e),
                'error': self.mem.r_bstr(error)}

    def vm(self, inp):
        self.reset()
        self.toolbox_handlers.pop(0xa861, None)
        if 'random_words' in inp:
            samples = iter(inp['random_words'])
            def random_input(_opcode, _pc):
                try:
                    sample = next(samples)
                except StopIteration:
                    raise RuntimeError('Recorded QuickDraw Random input exhausted') from None
                # QuickDraw Random has no arguments; caller reserved a word result.
                self.host_service_calls['a861'] = self.host_service_calls.get('a861', 0) + 1
                self.mem.w16(self.cpu.r_sp(), sample & 0xffff)
            self.toolbox_handlers[0xa861] = random_input
        self.mem.clear_block(ROBOT, 0x3000, 0)
        self.mem.w16(A5 - 0x3c7e, inp.get('num_robots', 1))
        self.mem.w8(A5 - 0x3fd2, 0)
        program = inp['program']
        for i, instruction in enumerate(program):
            op, mode, operand = instruction
            self.mem.w_block(ROBOT + 0x10 + 4*i, bytes([op, mode]) + word(operand))
        self.mem.w16(ROBOT + 0x1f54, len(program))
        for i, value in enumerate(inp.get('registers', [])):
            self.mem.w16(ROBOT + 0x1f56 + 2*i, value & 0xffff)
        for i, value in inp.get('memory', {}).items():
            self.mem.w16(ROBOT + 0x1f7c + 2*int(i), value & 0xffff)
        for i, value in enumerate(inp.get('stack', [])):
            self.mem.w16(ROBOT + 0x2118 + 2*i, value & 0xffff)
        for name, offset, default in [('pc',0x210e,0), ('surplus',0x2110,0),
                                       ('sp',0x2112,1), ('accumulator',0x2114,0)]:
            self.mem.w16(ROBOT + offset, inp.get(name, default) & 0xffff)
        self.mem.w8(ROBOT + 0x2116, int(inp.get('interrupt', False)))
        args = word(0x100 if inp.get('tick', False) else 0) + word(inp.get('budget', 1)) + long(ROBOT)
        result = self.call(3, 0x1af0, args, 2)
        watched_memory = inp.get('watch_memory', list(inp.get('memory', {}).keys()))
        return {
            'pc': self.mem.r16s(ROBOT + 0x210e),
            'accumulator': self.mem.r16s(ROBOT + 0x2114),
            'sp': self.mem.r16s(ROBOT + 0x2112),
            'surplus': self.mem.r16s(ROBOT + 0x2110),
            'registers': [self.mem.r16s(ROBOT + 0x1f56 + i*2) for i in range(19)],
            'memory': {str(i):self.mem.r16s(ROBOT + 0x1f7c + int(i)*2) for i in watched_memory},
            'stack': [self.mem.r16s(ROBOT + 0x2118 + i*2) for i in range(30)],
            'interrupt': bool(self.mem.r8(ROBOT + 0x2116)),
            'result': bool(result[0]),
        }

if __name__ == '__main__':
    m = OriginalMachine()
    print('sign(-5)=', struct.unpack('>h', m.call(3, 4, word(-5), 2))[0])
    print('distance(3,4)=', struct.unpack('>h', m.call(3, 0xba, word(4)+word(3), 2))[0])
    for source in ['', 'x = 10\r', 'VARIABLE a\ra = 1\r']:
        print(repr(source), m.compile(source))
    print(m.provenance())
