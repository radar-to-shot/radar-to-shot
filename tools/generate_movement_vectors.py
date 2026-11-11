#!/usr/bin/env python3
"""Original CODE3:0880 motion, wall and robot collision captures.

Integer QuickDraw geometry traps execute from the supplied original Mac IIci ROM. No game motion,
collision resolution, damage or fuel computation is duplicated by this oracle.
"""
import json
from pathlib import Path
import random
from oracle import OriginalMachine, A5, ROBOT, word, long, ROOT
from platform_sane import RomNumericalPlatform
import machine68k

FIELDS={'x':0x2072,'y':0x2074,'vx':0x2272,'vy':0x2274,'target_x':0x2276,'target_y':0x2278,
        'remainder_x':0x227a,'remainder_y':0x227c,'fuel':0x2080,'speed':0x207c,'cloak':0x2082,
        'raw_damage':0x2284,'damage_percent':0x207a,'damage_flash':0x2286}
DEFAULTS={'x':100,'y':100,'fuel':1850}

def setup_robots(m,robots):
    m.reset()
    m.mem.clear_block(ROBOT,0x20000,0)
    m.mem.clear_block(0x500000,0x10000,0)
    m.mem.w32(A5-0x41da,0x600000)
    for i,v in enumerate([0,0,314,382]):m.mem.w16(0x600010+2*i,v)
    m.mem.w16(A5-0x3c7e,len(robots))
    for i,inp in enumerate(robots):
        base=ROBOT+i*0x3000; handle=0x500000+i*4
        m.mem.w8(A5-0x3c8b+i+1,1)
        m.mem.w32(A5-0x3fd0+(i+1)*0xa6,handle)
        m.mem.w32(handle,base)
        for name,off in FIELDS.items():m.mem.w16(base+off,inp.get(name,DEFAULTS.get(name,0))&65535)
        m.mem.w16(base+0x120,inp.get('engine',0))
        m.mem.w16(base+0x227e,inp.get('armor',100))
        x,y=inp.get('x',100),inp.get('y',100)
        for j,v in enumerate([y-5,x-5,y+6,x+6]):m.mem.w16(base+0x22a4+2*j,v&65535)

def state(m,count):
    out=[]
    for i in range(count):
        base=ROBOT+i*0x3000
        r={name:m.mem.r16s(base+off) for name,off in FIELDS.items()}
        r.update(collision_damage=m.mem.r32s(base+0x22cc),collided=bool(m.mem.r8(base+0x22b6)),
                 exhausted=bool(m.mem.r8(base+0x22d8)),out_of_fuel=m.mem.r32s(base+0x22d0))
        out.append(r)
    return {'robots':out}

def capture_case(m,inp):
    setup_robots(m,inp['robots'])
    for _ in range(inp.get('ticks',1)):
        m.call(3,0x880,word(0)+long(0x500800))
    return state(m,len(inp['robots']))

def cases():
    yield 'stationary', {'robots':[{}]}
    for engine in [0,1]:
        for ticks in [1,2,3,5,10,25]:
            yield f'acceleration_{engine}_{ticks}', {'robots':[{'engine':engine,'target_x':2000,'target_y':-1000,'speed':20}], 'ticks':ticks}
    for x,y,vx,vy in [(5,100,-2000,0),(376,100,2000,0),(100,5,0,-2000),(100,308,0,2000),
                      (5,5,-2000,-2000),(376,308,2000,2000),(6,100,-2000,0),(375,100,2000,0),
                      (100,6,0,-2000),(100,307,0,2000)]:
        yield f'wall_{x}_{y}_{vx}_{vy}', {'robots':[{'x':x,'y':y,'vx':vx,'vy':vy,'target_x':vx,'target_y':vy,'speed':20}]}
    for gap in [10,11,12,13,14,15,16,20]:
        for direction in [-1,0,1]:
            yield f'pair_{gap}_{direction}', {'robots':[
                {'x':100,'y':100,'vx':2000,'target_x':2000,'speed':20},
                {'x':100+gap,'y':100,'vx':direction*2000,'target_x':direction*2000,'speed':20}]}
    yield 'three_robot_collision', {'robots':[{'x':100,'y':100,'vx':2000,'target_x':2000,'speed':20},
                                            {'x':112,'y':100},
                                            {'x':124,'y':100,'vx':-2000,'target_x':-2000,'speed':20}]}
    yield 'five_robots', {'robots':[{'x':25+i*70,'y':150,'target_x':2000,'speed':20} for i in range(5)],'ticks':20}
    rng=random.Random(68200880)
    for i in range(80):
        r={'x':rng.randrange(5,377),'y':rng.randrange(5,309),'engine':rng.randrange(2),
           'vx':rng.randrange(-4000,4001),'vy':rng.randrange(-4000,4001),
           'target_x':rng.randrange(-4000,4001),'target_y':rng.randrange(-4000,4001),
           'remainder_x':rng.randrange(-999,1000),'remainder_y':rng.randrange(-999,1000),
           'speed':rng.randrange(41),'fuel':rng.randrange(20),'cloak':rng.randrange(2)}
        yield f'seeded_{i}', {'robots':[r],'ticks':rng.randrange(1,8)}

def main():
    m=OriginalMachine(cpu_type=machine68k.CPUType.M68030);platform=RomNumericalPlatform(m)
    vectors=[]
    for name,inp in cases():
        vectors.append({'id':'movement_'+name,'kind':'world_movement','input':inp,
                        'expected':capture_case(m,inp),'oracle':{'segment':3,'offset':'0x0880'}})
    provenance=m.provenance();provenance['platform']=platform.provenance()
    path=ROOT/'tests/golden/movement.json';path.write_text(json.dumps({'provenance':provenance,'vectors':vectors},indent=2)+'\n')
    print(f'Captured {len(vectors)} original movement/collision vectors to {path}')
    m.close()
if __name__=='__main__':main()
