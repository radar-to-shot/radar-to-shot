#!/usr/bin/env python3
"""Execute original IIci ROM SANE and PtToAngle instead of host numerical math.

The original ROM PACK4/5 implement the SANE API. Their 68881 basic arithmetic
runs through Musashi's extended80 SoftFloat core. This requires the documented
FREM quotient, exception, and extended-integer-rounding corrections:
unpatched machine68k 0.5.1 fails the startup selftests.
This is a declared ROM baseline, not a claim that the System 7 replacement PACKs
have been booted or that every 68881 behavior has been exhaustively verified.
"""
from __future__ import annotations
import hashlib
import machine68k
from oracle import ROOT, STACK, SENTINEL, word, long
from platform_rom import install_rom
from world_platform import WorldPlatform

ROM_BASE = 0x700000
PACKS = {4: (0x70ac0, 0x1100), 5: (0x71be0, 0x10d0), 7: (0x79de0, 0x570)}

class RomNumericalPlatform(WorldPlatform):
    """Original ROM numerical routines, integer geometry, and NumToString."""
    def __init__(self, machine, validate=True):
        if machine.cpu.get_cpu_type() not in (machine68k.CPUType.M68030, machine68k.CPUType.M68040):
            raise ValueError('ROM SANE needs Musashi M68030/M68040 for emulated FPU instructions')
        super().__init__(machine)
        self.rom_traps = install_rom(machine, ROM_BASE)
        self.rom = (ROOT/'images/Mac_IIci.ROM').read_bytes()
        for package, (offset, size) in PACKS.items():
            expected = b'PACK' + word(package)
            if self.rom[offset+4:offset+10] != expected:
                raise ValueError(f'Unexpected ROM PACK{package} header')
        for trap in (0xa9eb, 0xa9ec, 0xa9ee, 0xa8c3, 0xa8a8, 0xa8aa, 0xa8a6, 0xa8ad):
            machine.toolbox_handlers[trap] = self.rom_trap
        self.fpu_operations = {}
        self.fpcr_values = set()
        self._upstream_instruction_hook = machine._instruction
        machine.cpu.set_instr_hook_callback(self._trace_instruction)
        if validate:
            self.check_backend()

    def _trace_instruction(self, pc):
        self._upstream_instruction_hook(pc)
        if not ROM_BASE <= pc < ROM_BASE+len(self.rom):
            return
        opcode=self.m.mem.r16(pc)
        if opcode & 0xffc0 != 0xf200:
            return
        extension=self.m.mem.r16(pc+2)
        if extension & 0xfc00 == 0x5c00:
            key='FMOVECR'
        elif extension >> 13 in (0,2):
            operation=extension & 0x7f
            # These Musashi paths internally call host binary64 transcendental
            # functions. The supplied ROM polynomial routines must not use them.
            if operation in (0x0e,0x1d,*range(0x30,0x38)):
                raise RuntimeError(f'ROM oracle reached host-transcendental FPU opcode {operation:02x} at {pc:08x}')
            key=f'ALU_{operation:02x}'
        else:
            key=f'FPU_class_{extension>>13}'
            if extension >> 13 == 4 and (extension >> 10) & 4:
                ea=opcode & 0x3f
                if ea<8:
                    value=self.m.cpu.r32_reg(ea)
                elif ea==0x3c:
                    value=self.m.mem.r32(pc+4)
                else:
                    raise RuntimeError(f'Unverified FPCR write addressing mode at {pc:08x}')
                self.fpcr_values.add(value)
                if value & 0xffc0:
                    raise RuntimeError(f'ROM oracle requested unverified FPCR precision or enabled exceptions: {value:08x}')
        self.fpu_operations[key]=self.fpu_operations.get(key,0)+1

    def rom_trap(self, opcode, pc):
        self.calls[f'{opcode:04x}'] = self.calls.get(f'{opcode:04x}',0)+1
        package = {0xa9eb:4, 0xa9ec:5, 0xa9ee:7}.get(opcode)
        offset = PACKS[package][0] if package else self.rom_traps['toolbox'][opcode & 0x3ff]
        # machine68k's A-line callback has already advanced PC past the trap.
        # The actual Macintosh package ABI has that return PC above its args.
        cpu, mem = self.m.cpu, self.m.mem
        sp = cpu.r_sp()-4
        mem.w32(sp, cpu.r_pc())
        cpu.w_sp(sp)
        cpu.w_pc(ROM_BASE+offset)

    def call_package(self, package, selector, dst, src=None):
        args = word(selector)+long(dst)+(long(src) if src is not None else b'')
        self.m.mem.clear_block(STACK-0x10000, 0x10100, 0)
        self.m.mem.w_block(STACK, long(SENTINEL)+args)
        self.m.cpu.w_sp(STACK)
        self.m.cpu.w_pc(ROM_BASE+PACKS[package][0])
        outcome = self.m.machine.execute(10_000_000)
        if outcome.result is not self.m.stop or self.m.cpu.r_sp() != STACK+4+len(args):
            raise RuntimeError('Original SANE package failed or returned an unbalanced stack')
        return bytes(self.m.mem.r_block(dst,10))

    def check_backend(self):
        """Reject known broken FREM quadrant behavior before capturing goldens.

        Bounds are mathematical sanity checks, not captured compatibility values.
        No host transcendental function supplies a guest numerical result.
        """
        src, dst = 0x690000, 0x690100
        for selector, bounds in [(0x18,(0.84,0.85)), (0x1a,(0.54,0.55)), (0x1e,(0.78,0.79))]:
            self.m.mem.w16(src,1)
            self.call_package(4,0x200e,dst,src)
            self.call_package(5,selector,dst)
            # Converting for the selftest assertion is observation only; capture
            # results continue to come from the guest's original machine code.
            value = self.ext(dst)
            if not bounds[0] < value < bounds[1]:
                raise RuntimeError(f'ROM SANE backend selftest failed for selector {selector:04x}: {value}; install documented Musashi FREM quotient correction')
        # The application's original Pascal rounding helper tests the SANE
        # inexact flag before adding an exact single-precision 0.5. This catches
        # missing SoftFloat->FPSR exception propagation independently of goldens.
        for hexadecimal, expected in [('3fffc000000000000000',2),('bfffc000000000000000',-2)]:
            self.m.mem.w_block(src,bytes.fromhex(hexadecimal))
            result=self.m.call(1,0x020a,long(src),4)
            value=int.from_bytes(result,'big',signed=True)
            if value!=expected:
                raise RuntimeError(f'Original rounding-helper selftest failed: expected {expected}, got {value}; check emulator FPSR inexact propagation')
        self.m.reset()

    def provenance(self):
        return {
            'toolbox':'original supplied Mac IIci ROM numerical and integer QuickDraw routines',
            'rom_sha256':hashlib.sha256(self.rom).hexdigest(),
            'rom_base':hex(ROM_BASE),
            'original_rom_packages':{str(n):{'offset':hex(off),'size':size,'sha256':hashlib.sha256(self.rom[off:off+size]).hexdigest()} for n,(off,size) in PACKS.items()},
            'original_rom_traps':{name:hex(self.rom_traps['toolbox'][trap&0x3ff]) for name,trap in [('PtToAngle',0xa8c3),('OffsetRect',0xa8a8),('SectRect',0xa8aa),('EqualRect',0xa8a6),('PtInRect',0xa8ad)]},
            'host_integer_geometry':[],
            'host_binary64_math':[],
            'rendering_noop':['PenSize'],
            'fpu':'Musashi extended80 SoftFloat; requires documented quotient and exception corrections',
            'emulator_source_archive_sha256':'ab8292add8d169aa4f81173e018216269023c77d009a7e6bbf1e603e85ef0b32',
            'emulator_patch_sha256':hashlib.sha256((ROOT/'tools/patches/machine68k-0.5.1-frem-quotient.patch').read_bytes()).hexdigest(),
            'emulator_binary_sha256':hashlib.sha256(__import__('pathlib').Path(machine68k.__file__).read_bytes()).hexdigest(),
            'executed_fpu_operations':self.fpu_operations,
            'observed_fpcr_writes':[hex(value) for value in sorted(self.fpcr_values)],
            'fpcr_guard':'rejects nonextended precision and enabled exception traps',
            'host_transcendental_fpu_instructions':'rejected by instruction hook; original ROM polynomial algorithms execute',
            'scope':'IIci ROM baseline; System 7 replacement packages and boot path are not used',
            'calls':self.calls,
        }

if __name__=='__main__':
    import json
    from oracle import OriginalMachine
    m=OriginalMachine(cpu_type=machine68k.CPUType.M68030)
    try:
        platform=RomNumericalPlatform(m)
        print(json.dumps({'status':'ROM SANE sanity checks passed','platform':platform.provenance(),'execution':m.provenance()},indent=2))
    finally:
        m.close()
