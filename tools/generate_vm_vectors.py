#!/usr/bin/env python3
"""Capture independent VM golden outputs by executing original CODE3:1af0."""
import argparse
import json
from pathlib import Path
import random
from oracle import OriginalMachine, ROOT

def inputs():
    values = [-32768,-32767,-2,-1,0,1,2,32766,32767]
    for op in range(1, 16):
        for a in values:
            for b in values:
                yield f'op{op}_{a}_{b}', {'program':[[op,2,b],[0,2,0],[0,2,0]], 'accumulator':a}
    for op in [0,16,17,18,19,20,21,22,23,255]:
        for mode in [1,2,4,5]:
            yield f'control{op}_mode{mode}', {'program':[[op,mode,0],[0,2,0]],'accumulator':7,
                                             'memory':{'0':1,'1':9},'stack':[123,1,9],'sp':2}
    for n in [0,1,29,30]:
        for op in [1,16]:
            yield f'stack{op}_sp{n}', {'program':[[op,1,18],[0,2,0]],'accumulator':123,'sp':n,'stack':[9]*30}
    for tick in [False,True]:
        yield f'interrupt_{tick}', {'program':[[1,2,55],[20,2,0],[0,0,0]],'budget':2,
                                    'registers':[0]*10+[1,1]+[0]*7,'accumulator':123,'tick':tick}
    for index in [-1,0,1,199,200,201,32767]:
        for op in [1,16]:
            yield f'memory_{op}_{index}', {'program':[[op,4,index],[0,0,0]],'accumulator':77,
                                           'memory':{'0':13,'199':19,'200':20},'watch_memory':[0,199,200]}
    for target in [-1,0,1,2,3,32767]:
        for op in [17,18]:
            yield f'branch_{op}_{target}', {'program':[[op,2,target],[0,0,0]],'accumulator':17}
    for count in [0,1,2,5]:
        yield f'num_robots_{count}', {'program':[[1,1,9]],'num_robots':count}
    for budget in [0,-1,1,2,3]:
        yield f'budget_{budget}', {'program':[[2,2,1]]*8,'budget':budget,'surplus':7}
    for reg in range(19):
        if reg in [13,15]:  # FP conversions are in world-platform captures.
            continue
        for value in [-32768,-720,-360,-1,0,1,360,361,32767]:
            regs=[0]*19
            regs[7]=100
            yield f'device_write_{reg}_{value}', {'program':[[16,1,reg],[0,0,0]],
                                                   'accumulator':value,'registers':regs}
    for limit in [0,1,-1,32767,-32768]:
        for sample in [-32768,-1,0,1,32767]:
            regs=[0]*19
            regs[17]=limit
            yield f'random_{limit}_{sample}', {'program':[[1,1,17]],'registers':regs,
                                                'random_words':[sample]}
    yield 'raw_radar_alias', {'program':[[16,4,248],[1,1,16],[0,0,0]],
                              'accumulator':77,'budget':2}
    yield 'reset_saved_pc_alias', {'program':[[1,4,201],[0,0,0],[22,0,0]],
                                   'pc':2,'budget':2,'accumulator':123}
    rng = random.Random(19910911)
    for case in range(50):
        program=[]
        for _ in range(30):
            op=rng.choice(list(range(1,10))+[16])
            if op == 16:
                program.append([op,4,rng.randrange(10)])
            else:
                program.append([op,2,rng.choice(values)])
        yield f'seeded_program_{case}', {'program':program,'budget':len(program),
                                         'accumulator':rng.choice(values),'watch_memory':list(range(10))}

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--output',type=Path,default=ROOT/'tests/golden/vm.json')
    args=ap.parse_args()
    m=OriginalMachine()
    vectors=[]
    for name, inp in inputs():
        vectors.append({'id':'vm_'+name,'kind':'vm','input':inp,'expected':m.vm(inp),
                        'oracle':{'segment':3,'offset':'0x1af0'}})
    document={'description':'Robot Warriors virtual CPU: original 68k execution, arithmetic boundaries, all opcodes, control, stack, memory, deterministic sequences.',
              'provenance':m.provenance(),'vectors':vectors}
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(document,indent=2)+'\n')
    print(f'Captured {len(vectors)} original VM vectors to {args.output}')
    m.close()
if __name__=='__main__':main()
