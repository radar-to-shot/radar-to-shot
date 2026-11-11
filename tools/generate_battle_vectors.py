#!/usr/bin/env python3
"""Integrated source->original compiler->original CPU->original movement captures.

Deterministic placements replace only the application's random placement policy.
These cases do not read RANDOM. Original routines are composed in
battle-loop order, with CPU budgets and cycle-debt carried between 100ms steps.
"""
import json
from oracle import OriginalMachine, A5, ROBOT, STACK, ROOT, word, long
from platform_sane import RomNumericalPlatform
import machine68k
from generate_movement_vectors import setup_robots
import machine68k

def initialize_trig(m):
    m.cpu.w_sp(STACK)
    m.cpu.w_reg(machine68k.Register.A6,0x500f00)
    m.cpu.w_reg(machine68k.Register.D7,0)
    m.run_until(2,0x88,0x108)

def capture_case(m,inp):
    compiled=[m.compile(item['source']) for item in inp['robots']]
    for program in compiled:
        if program['error']:raise ValueError(program['error'])
    setup_robots(m,inp['robots'])
    initialize_trig(m)
    for i,(item,program) in enumerate(zip(inp['robots'],compiled)):
        base=ROBOT+0x3000*i
        attrs=program['attributes']
        for j,value in enumerate(attrs):m.mem.w16(base+0x11c+2*j,value)
        m.mem.w_block(base+0x12c,bytes.fromhex(program['code_hex']))
        m.mem.w16(base+0x2070,program['code_count'])
        m.mem.w16(base+0x2080,[1850,2500,3200][attrs[4]])
        m.mem.w16(base+0x227e,[100,115,130,145,165,200][attrs[6]])
        m.mem.w16(base+0x2282,[200,310,500][attrs[3]])
        m.call(3,0xd70,long(base+0x11c))
        m.mem.w8(A5-0x3c85+i+1,1)
        m.mem.w16(base+0x22b4,i+1)
    for _ in range(inp['ticks']):
        for i,program in enumerate(compiled):
            base=ROBOT+0x3000*i
            budget=(100<<program['attributes'][0])-m.mem.r16s(base+0x222c)
            m.call(3,0x1af0,word(0x100)+word(budget)+long(base+0x11c),2)
        m.call(3,0x880,word(0)+long(0x500800))
        m.call(3,0x2cb8,long(0x502000)+word(0)+word(0x100))
    robots=[]
    for i,item in enumerate(inp['robots']):
        b=ROBOT+0x3000*i
        robots.append({'name':item.get('name','robot'),'active':bool(m.mem.r8(A5-0x3c8b+i+1)),
                       'registers':[m.mem.r16s(b+0x2072+2*j) for j in range(19)],
                       'pc':m.mem.r16s(b+0x222a),'accumulator':m.mem.r16s(b+0x2230),
                       'memory':[m.mem.r16s(b+0x2098+2*j) for j in range(201)],
                       'stack_pointer':m.mem.r16s(b+0x222e),'cycle_debt':m.mem.r16s(b+0x222c),
                       'error_resets':m.mem.r32s(b+0x22d4),
                       'velocity':[m.mem.r16s(b+0x2272),m.mem.r16s(b+0x2274)],
                       'score':m.mem.r32s(b+0x22bc),'raw_damage':m.mem.r16s(b+0x2284),
                       'shell_active':bool(m.mem.r8(b+0x228a))})
    return {'tick':inp['ticks'],'alive':sum(r['active'] for r in robots),'robots':robots,'events':[]}

def cases():
    counter='allocate counter\rstart\rcounter + 1 to counter\rgoto start\r'
    idle='loop\rgoto loop\r'
    for ticks in [1,2,5,20,100]:
        yield f'counter_{ticks}',{'robots':[{'name':'counter','source':counter,'x':60,'y':70}],'ticks':ticks}
    for engine,cpu,angle,speed in [(0,0,90,20),(1,0,45,40),(0,1,270,20),(0,2,180,20)]:
        source=f'ENGINE_SIZE {engine}\rCPU_SPEED {cpu}\r{angle} to direction\r{speed} to speed\rloop\rgoto loop\r'
        for ticks in [1,5,20,100]:
            yield f'mover_{engine}_{cpu}_{angle}_{ticks}',{'robots':[{'name':'mover','source':source,'x':180,'y':150}],'ticks':ticks}
    for ticks in [1,2,5,10]:
        yield f'head_on_{ticks}',{'robots':[{'name':'east','source':'90 to direction\r20 to speed\rloop\rgoto loop\r','x':100,'y':100},
                                            {'name':'west','source':'270 to direction\r20 to speed\rloop\rgoto loop\r','x':120,'y':100}],'ticks':ticks}
    programs={
        'interrupt':'allocate counter\rhandler to time_int_xfer\r1 to time_int_mask\rloop\rgoto loop\rhandler\rcounter + 1 to counter\rendint\r',
        'rect_to_polar':'3 to x_conv\r-4 to y_conv\rloop\rgoto loop\r',
        'polar_to_rect':'90 to angle_conv\r10 to dist_conv\rloop\rgoto loop\r',
        'cooldown_alias':'allocate pad -16\rallocate cooldown\r10 to cooldown\rloop\rgoto loop\r',
        'source_reset':'allocate n\rstart\rn + 1 to n\rif n > 10 then reset\rgoto start\r',
        'radar_alias':'allocate pad -3\rallocate radar_angle\rallocate result\r90 to radar\rradar to result\rradar_angle to aim\rloop\rgoto loop\r',
    }
    for name,source in programs.items():
        for ticks in [1,3,12]:
            robots=[{'name':name,'source':source,'x':100,'y':100}]
            if name=='radar_alias':robots.append({'name':'target','source':idle,'x':200,'y':100})
            yield f'glue_{name}_{ticks}',{'robots':robots,'ticks':ticks}
    for ticks in [1,2,3,5,10,25,50]:
        yield f'shell_{ticks}',{'robots':[{'name':'shooter','source':'loop\r90 to aim\r50 to shot\rgoto loop\r','x':100,'y':100},
                                         {'name':'target','source':idle,'x':150,'y':100}],'ticks':ticks}
    for ticks in [3,10,25]:
        yield f'moving_shell_target_{ticks}',{'robots':[{'name':'shooter','source':'loop\r90 to aim\r50 to shot\rgoto loop\r','x':100,'y':100},
                                                       {'name':'target','source':'180 to direction\r20 to speed\rloop\rgoto loop\r','x':150,'y':100}],'ticks':ticks}
    yield 'five_independent_cpus',{'robots':[{'name':str(i),'source':counter if i%2==0 else idle,'x':40+i*70,'y':150} for i in range(5)],'ticks':10}

def main():
    m=OriginalMachine(cpu_type=machine68k.CPUType.M68030);platform=RomNumericalPlatform(m);vectors=[]
    for name,inp in cases():
        vectors.append({'id':'battle_'+name,'kind':'battle','input':inp,'expected':capture_case(m,inp),
                        'oracle':{'routines':['CODE5:24dc','CODE2:0088..0108','CODE3:0d70','CODE3:1af0','CODE3:0880','CODE3:2cb8']}})
    provenance=m.provenance();provenance['platform']=platform.provenance()
    path=ROOT/'tests/golden/battle.json';path.write_text(json.dumps({'provenance':provenance,'vectors':vectors},indent=2)+'\n')
    print(f'Captured {len(vectors)} integrated original-code battle vectors to {path}')
    m.close()
if __name__=='__main__':main()
