#!/usr/bin/env python3
"""Original register/world I/O with original IIci ROM numerical services."""
import json, math, struct, random
import machine68k
from pathlib import Path
from oracle import OriginalMachine,A5,ROBOT,STACK,word,long
from platform_sane import RomNumericalPlatform
ROOT=Path(__file__).resolve().parents[1]

def setup(m,inp):
    m.reset();m.mem.clear_block(ROBOT,0x30000,0);m.mem.clear_block(0x500000,0x2000,0)
    if not hasattr(m,'observed_sine_table'):
        m.cpu.w_sp(STACK);m.cpu.w_reg(machine68k.Register.A6,0x510000);m.cpu.w_reg(machine68k.Register.D7,0)
        m.run_until(2,0x8a,0x108)
        m.observed_sine_table=bytes(m.mem.r_block(A5-0x866,362))
    else:
        m.mem.w_block(A5-0x866,m.observed_sine_table)
    attrs=inp.get('attributes',[0]*7);robots=inp.get('robots',[{'x':100,'y':100}]);m.mem.w16(A5-0x3c7e,len(robots))
    for i,robot in enumerate(robots,1):
        addr=ROBOT+(i-1)*0x4000;handle=0x500000+i*4;m.mem.w32(handle,addr);m.mem.w32(A5-0x3fd0+i*0xa6,handle);m.mem.w8(A5-0x3c8b+i,1)
        m.mem.w8(A5-0x3c85+i,1);m.mem.w16(addr+0x22b4,i)
        x,y=robot.get('x',100),robot.get('y',100);m.mem.w16(addr+0x2072,x);m.mem.w16(addr+0x2074,y);m.mem.w16(addr+0x2082,robot.get('cloak',0))
        for j,n in enumerate([y-5,x-5,y+6,x+6]):m.mem.w16(addr+0x22a4+j*2,n&65535)
        for j,value in enumerate(attrs):m.mem.w16(addr+0x11c+j*2,value)
        m.mem.w16(addr+0x2080,[1850,2500,3200][attrs[4]]);m.mem.w16(addr+0x227e,[100,115,130,145,165,200][attrs[6]])
        m.mem.w16(addr+0x2282,[200,310,500][attrs[3]]);m.mem.w16(addr+0x2084,len(robots)-1);m.mem.w16(addr+0x2288,65535)
    frame=0x501000;m.mem.w32(frame+12,ROBOT+0x11c);m.mem.w8(frame-0x13,1)
    return frame

def capture():
    m=OriginalMachine(cpu_type=machine68k.CPUType.M68030);platform=RomNumericalPlatform(m);vectors=[]
    cases=[]
    for reg in [0,1,2,4,5,6,7,8,9,10,11,12,14]:
        for value in [-32768,-720,-360,-1,0,1,19,20,39,40,359,360,32767]:cases.append({'attributes':[0,0,1,0,0,1,0],'writes':[[reg,value]]})
    for x,y in [(0,0),(3,4),(-3,4),(3,-4),(-3,-4),(0,12),(0,-12),(12,0),(-12,0),(100,200),(-300,310)]:cases.append({'writes':[[12,x],[13,y]]})
    # Original signed32 square-sum overflow and adjacent finite boundaries.
    for x in [-32768,-32767,0,32767]:
        for y in [-32768,-32767,0,32767]:cases.append({'writes':[[12,x],[13,y]]})
    for angle in [-720,-361,-360,-90,-1,0,1,30,45,90,180,270,359,360,1000]:
        for distance in [-10,0,1,15,100,500]:cases.append({'writes':[[14,angle],[15,distance]]})
    for angle in [-360,-90,0,30,45,90,180,270,359,360]:
        for distance in [-100,0,1,18,100,500,32767]:cases.append({'attributes':[0,4,0,0,0,0,0],'writes':[[2,angle],[3,distance],[3,20]]})
    for dx,dy in [(0,-100),(0,-200),(100,0),(0,100),(-100,0),(10,-100),(0,-199),(0,-310),(0,-309)]:
        for angle in [0,1,2,5,30,90,180,270,359]:
            # Positions used here need only be valid signed16; tests of sensor range
            # deliberately include targets outside a default battlefield.
            cases.append({'attributes':[0,0,0,1,0,0,0],'robots':[{'x':100,'y':310},{'x':100+dx,'y':310+dy}],'writes':[[16,angle]]})
    for level in [0,1,2]:
        for distance in [0,199,200,201,309,310,311,499,500,501]:
            cases.append({'attributes':[0,0,0,level,0,0,0],'robots':[{'x':100,'y':100},{'x':100+distance,'y':100}],'writes':[[16,90]]})
    for robots in [
        [{'x':100,'y':100},{'x':100,'y':50,'cloak':1}],
        [{'x':100,'y':100},{'x':100,'y':50,'cloak':1},{'x':100,'y':40}],
        [{'x':100,'y':100},{'x':100,'y':50},{'x':100,'y':40}],
        [{'x':100,'y':100},{'x':99,'y':50},{'x':101,'y':50}],
        [{'x':100,'y':100},{'x':100,'y':100}],
    ]:
        for angle in [0,90,180,270]:cases.append({'robots':robots,'writes':[[16,angle]]})
    radar_rng=random.Random(68000)
    for _ in range(100):
        dx,dy=radar_rng.randint(-100,100),radar_rng.randint(-150,100)
        if dx==0 and dy==0:continue
        angle=round(math.degrees(math.atan2(dx,-dy)))%360
        distance=math.hypot(dx,dy)
        cone=int(310/max(1,distance))+1
        for delta in [-cone-1,-cone,-cone+1,cone-1,cone,cone+1]:
            cases.append({'attributes':[0,0,0,2,0,0,0],'robots':[{'x':150,'y':180},{'x':150+dx,'y':180+dy}],'writes':[[16,(angle+delta)%360]]})
    rng=random.Random(1991)
    for _ in range(250):
        cases.append({'writes':[[12,rng.randint(-2000,2000)],[13,rng.randint(-2000,2000)]]})
        cases.append({'writes':[[14,rng.randint(-32768,32767)],[15,rng.randint(-32768,32767)]]})
        cases.append({'writes':[[2,rng.randint(-32768,32767)],[3,rng.randint(-32768,32767)]]})
    for inp in cases:
        frame=setup(m,inp);costs=[]
        for reg,value in inp['writes']:
            before=m.mem.r16s(frame-0x18);m.mem.w16(frame-0x12,reg);m.mem.w16(frame-0x1c,value&65535);m.call(3,0x135c,long(frame));costs.append(m.mem.r16s(frame-0x18)-before)
        out={'registers':[m.mem.r16s(ROBOT+0x2072+i*2) for i in range(19)],'radar_result':m.mem.r16s(ROBOT+0x2288),'costs':costs,
             'shell':{'active':bool(m.mem.r8(ROBOT+0x228a)),'origin_x':m.mem.r16s(ROBOT+0x229c),'origin_y':m.mem.r16s(ROBOT+0x229a),'delta_x':m.mem.r16s(ROBOT+0x2296),'delta_y':m.mem.r16s(ROBOT+0x2298),'duration':m.mem.r16s(ROBOT+0x2292),'elapsed':m.mem.r16s(ROBOT+0x2294),'x':m.mem.r16s(ROBOT+0x22a0),'y':m.mem.r16s(ROBOT+0x229e)}}
        vectors.append({'id':f'world_io_{len(vectors):04d}','kind':'world_io','input':inp,'expected':out})
    provenance=m.provenance();provenance['platform']=platform.provenance();provenance['sine_table']='Original CODE2:008a..0108 executed with original IIci ROM SANE; observed table reused after resets'
    dest=ROOT/'tests/golden/world_io.json';dest.write_text(json.dumps({'provenance':provenance,'vectors':vectors},indent=2)+'\n');print('Captured',len(vectors),'I/O vectors');m.close()
if __name__=='__main__':capture()
