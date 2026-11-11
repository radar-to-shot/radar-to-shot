#!/usr/bin/env python3
"""Capture radar-angle boundary observations directly from the IIci ROM.

Host trigonometry chooses nearby input points only; every expected angle is
computed by the original ROM PtToAngle/FixRatio/FixMul/AngleFromSlope routines.
"""
import argparse
import json
import math
from pathlib import Path

from oracle import ROOT
from platform_rom import RomMachine


def points():
    result={(0,0),(0,-1),(0,1),(-1,0),(1,0)}
    for angle in range(90):
        for fraction in (-0.55,-0.45,0.45,0.55):
            radians=math.radians(angle+fraction)
            x=round(300*math.sin(radians));y=round(-300*math.cos(radians))
            result.add((x,y))
            if angle%15==0:
                result.update([(x,-y),(-x,y),(-x,-y)])
    for x in [-32768,-32767,-381,-1,0,1,381,32767]:
        for y in [-32768,-1,0,1,32767]:
            result.add((x,y))
    return sorted(result)


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out',type=Path,default=ROOT/'tests/golden/rom_angles.json')
    args=parser.parse_args()
    machine=RomMachine()
    vectors=[]
    try:
        for x,y in points():
            angle=machine.pt_to_angle(x,y,rect=(-5,-5,6,6))
            vectors.append({'id':f'rom-angle-{x}-{y}','kind':'world_angle',
                'input':{'x':x,'y':y},'expected':{'angle':angle},
                'oracle':{'region':'Mac_IIci.ROM','offset':'0x3cf90','trap':'0xa8c3',
                          'rect':[-5,-5,6,6]}})
        output={'format_version':1,'provenance':machine.provenance(),'vectors':vectors}
    finally:
        machine.close()
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(output,indent=2)+'\n')
    print(f'Captured {len(vectors)} original-ROM PtToAngle vectors')


if __name__=='__main__':
    main()
