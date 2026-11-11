#!/usr/bin/env python3
"""Capture world vectors by executing original CODE3 under Musashi."""
import json, random, struct
from pathlib import Path
from oracle import OriginalMachine, A5, ROBOT, word, long
ROOT=Path(__file__).resolve().parents[1]

def capture():
    m=OriginalMachine(); vectors=[]
    def record(kind,inp,out): vectors.append({'id':f'{kind}_{len(vectors):04d}','kind':kind,'input':inp,'expected':out})
    try:
        pairs=[(0,0),(3,4),(4,3),(0,20),(10,10),(-10,10),(381,313),(32767,0),(500,500),(1000,0),(300,310)]
        rng=random.Random(1991)
        pairs += [(rng.randint(-381,381),rng.randint(-313,313)) for _ in range(200)]
        for x,y in pairs:
            result=struct.unpack('>h',m.call(3,0xba,word(y)+word(x),2))[0]
            record('world_distance',{'x':x,'y':y},{'distance':result})
        for armor in [100,115,130,145,165,200]:
            for old,n in [(0,0),(0,1),(0,20),(5,7),(80,20),(99,1),(100,20),(150,20)]:
                m.reset();m.mem.clear_block(ROBOT,0x3000,0);m.mem.w32(0x500000,ROBOT)
                m.mem.w16(ROBOT+0x227e,armor);m.mem.w16(ROBOT+0x2284,old)
                m.call(3,0x1e0,word(n)+long(0x500000))
                record('world_damage',{'armor':armor,'raw_damage':old,'damage':n},
                       {'raw_damage':m.mem.r16s(ROBOT+0x2284),'damage_percent':m.mem.r16s(ROBOT+0x207a),'damage_flash':m.mem.r16s(ROBOT+0x2286)})
        cases=[{'engine':e,'vx':vx,'vy':vy,'target_x':tx,'target_y':ty,'fuel':fuel,'speed':speed,'cloak':cloak}
               for e in [0,1] for vx,vy,tx,ty,fuel,speed,cloak in [
                   (0,0,1000,-1000,1850,20,0),(0,0,0,0,1850,0,0),(100,100,150,150,1850,5,0),
                   (200,200,150,150,1850,5,0),(2000,-2000,0,0,1850,0,0),(3900,-3900,5000,-5000,1850,40,0),
                   (0,0,2000,0,9,20,1),(100,300,500,500,1,9,0),(100,300,500,500,1,10,0),
                   (500,-500,0,0,0,0,0),(100,100,100,100,5,0,2)]]
        for _ in range(100):
            cases.append({'engine':rng.randrange(2),'vx':rng.randrange(-4000,4001),'vy':rng.randrange(-4000,4001),'target_x':rng.randrange(-4000,4001),'target_y':rng.randrange(-4000,4001),'fuel':rng.randrange(15),'speed':rng.randrange(41),'cloak':rng.randrange(2)})
        for inp in cases:
            m.reset();m.mem.clear_block(ROBOT,0x3000,0);m.mem.clear_block(0x500000,0x1000,0)
            m.mem.w8(A5-0x3c8b+1,1);m.mem.w32(A5-0x3fd0+0xa6,0x500000);m.mem.w32(0x500000,ROBOT)
            frame=0x500200;m.mem.w32(frame+10,0x500400)
            fields={'engine':0x120,'vx':0x2272,'vy':0x2274,'target_x':0x2276,'target_y':0x2278,'fuel':0x2080,'speed':0x207c,'cloak':0x2082}
            for name,offset in fields.items():m.mem.w16(ROBOT+offset,inp[name]&65535)
            m.call(3,0x324,long(frame))
            out={name:m.mem.r16s(ROBOT+offset) for name,offset in fields.items() if name!='engine'}
            out['exhausted']=bool(m.mem.r8(ROBOT+0x22d8));out['out_of_fuel']=m.mem.r32(ROBOT+0x22d0)
            record('world_motion',inp,out)
        output={'provenance':m.provenance(),'vectors':vectors}
        dest=ROOT/'tests/golden/world.json';dest.parent.mkdir(parents=True,exist_ok=True);dest.write_text(json.dumps(output,indent=2)+'\n')
        print(f'Captured {len(vectors)} original world vectors in {dest}')
    finally:m.close()
if __name__=='__main__':capture()
