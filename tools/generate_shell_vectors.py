#!/usr/bin/env python3
"""Capture original shell flight and explosion routines with declared OS shims."""
import json
import machine68k
from pathlib import Path
from oracle import OriginalMachine,A5,ROBOT,word,long
from platform_sane import RomNumericalPlatform
from generate_world_io_vectors import setup
ROOT=Path(__file__).resolve().parents[1]

def capture():
    m=OriginalMachine(cpu_type=machine68k.CPUType.M68030);p=RomNumericalPlatform(m);vectors=[]
    cases=[]
    for angle in [0,30,45,90,135,180,225,270,315,359]:
        for distance in [-100,0,1,18,100,500]:
            for ticks in [1,2,7,30]:cases.append({'writes':[[2,angle],[3,distance]],'ticks':ticks})
    for dx,dy in [(0,0),(1,0),(5,0),(6,0),(10,0),(15,0),(16,0),(5,5),(10,10),(15,15)]:
        cases.append({'robots':[{'x':100,'y':100},{'x':100+dx,'y':50+dy}],'writes':[[2,0],[3,50]],'ticks':3})
    for inp in cases:
        frame=setup(m,inp);m.mem.w32(A5-0x41da,0x600000);m.mem.w8(A5-0x6e4,0)
        for j,v in enumerate([0,0,314,382]):m.mem.w16(0x600010+j*2,v)
        for reg,value in inp['writes']:
            m.mem.w16(frame-0x12,reg);m.mem.w16(frame-0x1c,value&65535);m.call(3,0x135c,long(frame))
        for _ in range(inp['ticks']):m.call(3,0x2cb8,long(0x502000)+word(0)+word(0x100))
        out=[]
        for i in range(len(inp.get('robots',[{}]))):
            addr=ROBOT+i*0x4000
            out.append({'raw_damage':m.mem.r16s(addr+0x2284),'damage_percent':m.mem.r16s(addr+0x207a),'damage_flash':m.mem.r16s(addr+0x2286),'damage_to_self':m.mem.r32(addr+0x22c8),'damage_to_others':m.mem.r32(addr+0x22c0),'shell_active':bool(m.mem.r8(addr+0x228a)),'shell_elapsed':m.mem.r16s(addr+0x2294),'shell_x':m.mem.r16s(addr+0x22a0),'shell_y':m.mem.r16s(addr+0x229e)})
        vectors.append({'id':f'world_shells_{len(vectors):04d}','kind':'world_shells','input':inp,'expected':{'robots':out}})
    provenance=m.provenance();provenance['platform']=p.provenance()
    dest=ROOT/'tests/golden/shells.json';dest.write_text(json.dumps({'provenance':provenance,'vectors':vectors},indent=2)+'\n');print('Captured',len(vectors),'shell vectors');m.close()
if __name__=='__main__':capture()
