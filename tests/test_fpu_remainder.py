#!/usr/bin/env python3
"""Independent 68881 FREM/FMOD tests: exact rational results and FPSR quotient.

These are ISA-level mathematical checks, not Robot Warriors golden vectors.
They fail on upstream machine68k0.5.1 and verify the explicitly supplied patch.
"""
from fractions import Fraction
import random
import machine68k

def packed(value):
    value=Fraction(value)
    if not value:return bytes(12)
    sign=0x8000 if value<0 else 0
    numerator=abs(value.numerator); denominator=value.denominator
    if denominator & (denominator-1):raise ValueError('test input must be dyadic')
    shift=-(denominator.bit_length()-1)
    while numerator%2==0:numerator//=2;shift+=1
    bits=numerator.bit_length()
    if bits>64:raise ValueError('test input exceeds extended precision')
    exponent=bits-1+shift+16383
    significand=numerator<<(64-bits)
    return (sign|exponent).to_bytes(2,'big')+bytes(2)+significand.to_bytes(8,'big')

def unpacked(data):
    high=int.from_bytes(data[:2],'big');sig=int.from_bytes(data[4:12],'big')
    exponent=(high&0x7fff)-16383-63
    value=Fraction(sig)*(Fraction(2)**exponent)
    return -value if high&0x8000 else value

def expected(a,b,nearest):
    ratio=abs(Fraction(a)/Fraction(b)); q=ratio.numerator//ratio.denominator
    if nearest:
        tail=ratio-q
        if tail>Fraction(1,2) or (tail==Fraction(1,2) and q&1):q+=1
    sign=(a<0)!=(b<0)
    return Fraction(a)-(-q if sign else q)*Fraction(b),(0x80 if sign else 0)|(q&127)

def main():
    pairs=[(a,b) for a in [-7,-5,-3,-1,0,1,3,5,7,127,128,129,255,256,257]
           for b in [-3,-2,-1,1,2,3]]
    pairs += [(2**60+3,2),(2**63-1,1),(2**63-1,2),(2**63-1,2**62+1),
              ((2**63-1)*2**200,2**180), (Fraction(3,2),1),
              (Fraction(1,2),1),(Fraction(1,4),1),(1,Fraction(3,2))]
    rng=random.Random(68881)
    pairs += [(rng.randrange(-2**62,2**62),rng.choice([-1,1])*rng.randrange(1,2**62)) for _ in range(200)]
    m=machine68k.Machine(machine68k.CPUType.M68030,64)
    stop=m.create_execute_end('done')
    tid=m.traps.alloc(lambda _op,_pc:stop)
    m.mem.w16(0x800,0xa000|tid)
    count=0
    try:
        for nearest in [False,True]:
            # FMOVE.X(A0),FP0; FMOD/FREM.X(A1),FP0; FMOVE FPSR,D0;
            # FMOVE.X FP0,(A2); RTS. Input/output are 12-byte 68881 memory format.
            code=bytes.fromhex('f2104800f21148'+('25' if nearest else '21')+'f200a800f21268004e75')
            m.mem.w_block(0x1000,code)
            for a,b in pairs:
                m.mem.w_block(0x2000,packed(a));m.mem.w_block(0x2100,packed(b))
                m.cpu.w_sr(0x2700);m.cpu.w_sp(0xf000);m.mem.w32(0xf000,0x800)
                for reg,address in [(machine68k.Register.A0,0x2000),(machine68k.Register.A1,0x2100),(machine68k.Register.A2,0x2200)]:m.cpu.w_reg(reg,address)
                m.cpu.w_pc(0x1000);out=m.execute(10000)
                if out.result is not stop:raise AssertionError(f'CPU did not return, PC={m.cpu.r_pc():x}')
                result=unpacked(bytes(m.mem.r_block(0x2200,12)))
                quotient=(m.cpu.r_reg(machine68k.Register.D0)>>16)&255
                want,wantq=expected(a,b,nearest)
                if (result,quotient)!=(want,wantq):
                    raise AssertionError(f'{"FREM" if nearest else "FMOD"}({a},{b}): {(result,quotient)} != {(want,wantq)}')
                count+=1
        print(f'68881 remainder result/FPSR quotient: {count} exact rational cases passed')
    finally:m.cleanup()
if __name__=='__main__':main()
