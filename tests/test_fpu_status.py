#!/usr/bin/env python3
"""Independent 68881 FPSR, FPCR rounding and integer-rounding conformance checks.

Expectations come from exact rational arithmetic and Motorola's 1987
MC68881/MC68882 User's Manual, sections 2.2.2, 2.3.3-4, 6.1.10 and the
FINT/FINTRZ/FCMP instruction specifications, not Robot Warriors outputs.
https://www.arithmazium.org/classroom/lib/Motorola_MC68881_MC68882_Floating_Point_Coprocessor_1987.pdf

--audit additionally checks precision-control and NaN behavior outside the
ROM bridge's validated finite, extended-precision subset. Failures in that mode
must be documented; they must not be relabeled as golden game behavior.
"""
from fractions import Fraction
import argparse
import machine68k
from test_fpu_remainder import packed, unpacked

INEX=0x0208
INVALID=0x2080
DIVZERO=0x0410
OVERFLOW=0x1248
UNDERFLOW=0x0a28


def integer_round(value, mode):
    value=Fraction(value)
    lower=value.numerator//value.denominator
    if mode==1: return int(value)
    if mode==2: return lower
    if mode==3: return -((-value.numerator)//value.denominator)
    remainder=value-lower
    return lower+int(remainder>Fraction(1,2) or (remainder==Fraction(1,2) and lower&1))


class Probe:
    def __init__(self):
        self.machine=machine68k.Machine(machine68k.CPUType.M68030,64)
        self.stop=self.machine.create_execute_end('done')
        trap=self.machine.traps.alloc(lambda _op,_pc:self.stop)
        self.machine.mem.w16(0x800,0xa000|trap)
        self.count=0
        self.failures=[]

    def run(self, op, a, b=0, *, control=0, initial_status=0, store=None):
        m=self.machine
        # FMOVE D3,FPCR; FMOVE D4,FPSR; FMOVE.X (A0),FP0.
        code=bytes.fromhex('f2039000f2048800f2104800')
        code+=bytes.fromhex(op)
        if store is not None:
            code+=bytes.fromhex('f212')+int(store).to_bytes(2,'big')
        # Capture FPSR before the result-only extended store changes EXC.
        code+=bytes.fromhex('f200a800f21268004e75')
        m.mem.w_block(0x1000,code)
        m.mem.w_block(0x2000,a if isinstance(a,bytes) else packed(a))
        m.mem.w_block(0x2100,b if isinstance(b,bytes) else packed(b))
        m.cpu.w_sr(0x2700);m.cpu.w_sp(0xf000);m.mem.w32(0xf000,0x800)
        for reg,value in [(machine68k.Register.A0,0x2000),(machine68k.Register.A1,0x2100),
                          (machine68k.Register.A2,0x2200),(machine68k.Register.D3,control),
                          (machine68k.Register.D4,initial_status)]:m.cpu.w_reg(reg,value)
        m.cpu.w_pc(0x1000)
        result=m.execute(10000)
        if result.result is not self.stop:raise AssertionError(f'CPU did not return: PC={m.cpu.r_pc():x}')
        return bytes(m.mem.r_block(0x2200,12)),m.cpu.r_reg(machine68k.Register.D0)

    def expect(self,name,op,a,b=0,*,value=None,status=0,control=0,initial_status=0,store=None,sign_zero=None,raw=None):
        self.count+=1
        data,fpsr=self.run(op,a,b,control=control,initial_status=initial_status,store=store)
        errors=[]
        if value is not None and unpacked(data)!=value:errors.append(f'value {unpacked(data)} != {value}')
        if raw is not None and data!=raw:errors.append(f'raw {data.hex()} != {raw.hex()}')
        if sign_zero is not None and (int.from_bytes(data[:2],'big')>>15)!=sign_zero:errors.append('zero sign not preserved')
        if fpsr&0xffff != status:errors.append(f'EXC/AEXC {fpsr&0xffff:04x} != {status:04x}')
        if fpsr&0x00ff0000 != initial_status&0x00ff0000:errors.append('quotient byte changed')
        if errors:self.failures.append(name+': '+', '.join(errors))

    def close(self):self.machine.cleanup()


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--audit',action='store_true')
    args=parser.parse_args()
    probe=Probe()
    try:
        # Four hardware modes are nearest-even, zero, -infinity, +infinity.
        values=[Fraction(n,4) for n in [-15,-10,-6,-2,-1,0,1,2,6,10,15]]
        values += [Fraction(2**41+1,2),-Fraction(2**41+1,2),2**63,-2**63]
        for truncate,opcode in [(False,'f2000001'),(True,'f2000003')]:
            for mode in range(4):
                for value in values:
                    want=integer_round(value,1 if truncate else mode)
                    probe.expect(f'{"FINTRZ" if truncate else "FINT"}({value}), mode {mode}',
                                 opcode,value,value=want,status=INEX if value!=want else 0,
                                 control=mode<<4,sign_zero=int(value<0) if want==0 else None)
        for sign in [0,1]:
            infinity=(0x7fff|(sign<<15)).to_bytes(2,'big')+bytes(2)+(1<<63).to_bytes(8,'big')
            for opcode in ['f2000001','f2000003']:
                probe.expect('integer rounding infinity',opcode,infinity,raw=infinity)
        probe.expect('FDIV exact','f2114820',6,3,value=2)
        probe.expect('FDIV inexact','f2114820',1,3,status=INEX)
        probe.expect('FDIV zero','f2114820',1,0,status=DIVZERO)
        probe.expect('FDIV invalid','f2114820',0,0,status=INVALID)
        probe.expect('FSQRT invalid','f2000004',-1,status=INVALID)
        # The incoming current-exception byte must clear, while accrued exceptions
        # and the unrelated quotient byte survive an exact operation.
        probe.expect('clear current / retain accrued','f2114822',1,1,value=2,
                     initial_status=0x00abff80,status=0x80)
        probe.expect('accrue more flags','f2114820',1,0,
                     initial_status=0x00ab0008,status=DIVZERO|0x08)
        # Integer and narrower real stores must propagate conversion exceptions.
        probe.expect('FMOVE.L inexact conversion','',Fraction(3,2),store=0x6000,status=INEX)
        probe.expect('FMOVE.S overflow','',2**128,store=0x6400,status=OVERFLOW)
        probe.expect('FMOVE.S tiny inexact','',Fraction(1,2**150),store=0x6400,status=UNDERFLOW)
        probe.expect('FINTRZ restores round-up', 'f2000003f2114822',Fraction(3,2),Fraction(1,2**64),
                     value=1+Fraction(1,2**63),status=INEX,control=0x30)
        probe.expect('FINTRZ restores round-down', 'f2000003f2114822',-Fraction(3,2),-Fraction(1,2**64),
                     value=-1-Fraction(1,2**63),status=INEX,control=0x20)
        probe.expect('exact instruction retains accrued inexact','f2114820f2114800',1,3,value=3,status=0x08)
        probe.expect('control-register move preserves current status','f2114820f2039000',1,3,status=INEX)
        # An exact comparison is not subtraction for exception-status purposes.
        probe.expect('FCMP wide exponent difference','f2114838',2**100,1,value=2**100,status=0)
        if args.audit:
            # Precision-control affects arithmetic/register destinations, including
            # significand precision and exponent range; memory formats ignore PREC.
            for control,small,want in [(0x40,Fraction(1,2**30),1),
                                       (0x80,Fraction(1,2**60),1),
                                       (0x00,Fraction(1,2**60),1+Fraction(1,2**60))]:
                probe.expect('FPCR precision result','f2114822',1,small,value=want,
                             status=INEX if want==1 else 0,control=control)
            # A signaling NaN has its own current-status bit, not OPERR.
            snan=bytes.fromhex('7fff0000a000000000000000')
            qnan=bytes.fromhex('7fff0000e000000000000000')
            probe.expect('FINT signaling NaN','f2000001',snan,status=0x4080,raw=qnan)
        for failure in probe.failures:print('FAIL:',failure)
        print(f'68881 FPSR/rounding: {probe.count-len(probe.failures)}/{probe.count} cases passed')
        return int(bool(probe.failures))
    finally:probe.close()

if __name__=='__main__':raise SystemExit(main())
