#!/usr/bin/env python3
"""Capture original IIci QuickDraw Random words and seed transitions."""
import argparse
import json
from pathlib import Path

from oracle import ROOT
from platform_rom import RomMachine


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out',type=Path,default=ROOT/'tests/golden/rom_random.json')
    args=parser.parse_args()
    # Algebra chooses an input hitting the original ROM's output suppression
    # branch; the observed seed and returned word still come only from emulation.
    suppress_seed=(pow(16807,-1,2147483647)*32768)%2147483647
    seeds=[0,1,2,12345,65535,65536,2147483646,2147483647,
           2147483648,4294901760,4294967295,suppress_seed]
    machine=RomMachine()
    vectors=[]
    try:
        for seed in seeds:
            vectors.append({'id':f'rom-random-seed-{seed}','kind':'world_random',
                'input':{'seed':seed,'count':16},'expected':machine.random_sequence(seed,16),
                'oracle':{'region':'Mac_IIci.ROM','offset':'0x2eb20','trap':'0xa861',
                          'seed_location':'long at (*A5)-0x7e'}})
        output={'format_version':1,'provenance':machine.provenance(),'vectors':vectors}
    finally:
        machine.close()
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(output,indent=2)+'\n')
    print(f'Captured {len(vectors)} original-ROM Random sequences, 192 seed/word observations')


if __name__=='__main__':
    main()
