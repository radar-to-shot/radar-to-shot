#!/usr/bin/env python3
"""Capture original-ROM numerical samples and verify compiler decimal formatting."""
import argparse
import hashlib
import json
import machine68k
from oracle import OriginalMachine,ROOT,A5,STACK
from platform_sane import RomNumericalPlatform

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output',default=ROOT/'reverse/platform_samples.json',type=__import__('pathlib').Path)
    args=parser.parse_args()
    machine=OriginalMachine(cpu_type=machine68k.CPUType.M68030)
    try:
        platform=RomNumericalPlatform(machine)
        samples=[]
        for selector,name in [(0x18,'sin'),(0x1a,'cos'),(0x1e,'atan')]:
            for value in [-32768,-2,-1,0,1,2,32767]:
                machine.mem.w16(0x690000,value&65535)
                platform.call_package(4,0x200e,0x690100,0x690000)
                observed=platform.call_package(5,selector,0x690100)
                samples.append({'operation':name,'input_integer':value,'expected_extended80_hex':observed.hex()})
        compiler=json.loads((ROOT/'tests/golden/compiler.json').read_text())
        compiled=0
        for vector in compiler['vectors']:
            inp=vector['input'];observed=machine.compile(inp['source'],inp.get('debug',False))
            if observed!=vector['expected']:
                raise AssertionError(f'Original ROM NumToString/compiler mismatch: {vector.get("id",compiled)}')
            compiled+=1
        # Execute the original application's startup sine-table loop with ROM SANE.
        machine.reset();machine.cpu.w_sp(STACK)
        machine.cpu.w_reg(machine68k.Register.A6,0x510000)
        machine.cpu.w_reg(machine68k.Register.D7,0)
        machine.run_until(2,0x8a,0x108)
        sine=bytes(machine.mem.r_block(A5-0x866,362))
        result={
            'status':'original ROM execution completed; compiler outputs match committed oracle corpus',
            'compiler_vectors_checked':compiled,
            'sane_samples':samples,
            'original_startup_sine_table':{'code_segment':2,'entry':'0x008a','stop':'0x0108','bytes':362,'sha256':hashlib.sha256(sine).hexdigest(),'hex':sine.hex()},
            'platform':platform.provenance(),
            'execution':machine.provenance(),
        }
        args.output.parent.mkdir(parents=True,exist_ok=True)
        args.output.write_text(json.dumps(result,indent=2)+'\n')
        print(f'Captured {len(samples)} original ROM SANE samples and verified {compiled} compiler vectors -> {args.output}')
    finally:machine.close()
if __name__=='__main__':main()
