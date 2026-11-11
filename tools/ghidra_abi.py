#!/usr/bin/env python3
"""Recognize conservative Pascal epilogues and explicit result-slot writes.

This annotates the analysis database only; it never changes original CODE bytes.
"""
import json
import re
from pathlib import Path
repo = Path(__file__).resolve().parents[1]
info = json.loads((repo/'reverse/disassembly/map.json').read_text())
rows = []
for segment in info['segments']:
    sid = segment['id']
    starts = sorted(set(segment['link_candidates']) | {x['resource_offset'] for x in info['jump_table'] if x['segment'] == sid})
    text = (repo/f'reverse/disassembly/CODE_{sid}.asm').read_text()
    instructions = []
    for line in text.splitlines():
        match = re.match(r'([0-9a-f]+): [0-9a-f]+\s+(\S+)\s*(.*)', line)
        if match:
            instructions.append((int(match[1], 16), match[2], match[3].split(';')[0].strip()))
    for start, end in zip(starts, starts[1:] + [segment['bytes']]):
        body = [x for x in instructions if start <= x[0] < end]
        for i, instruction in enumerate(body):
            purge = None
            if instruction[1:] == ('rts', '') and i >= 2 and body[i-2][1:] == ('unlk', 'a6') and body[i-1][1:] == ('move.l', '(a7)+, (a7)'):
                purge = 4
            elif instruction[1:] == ('rts', '') and i >= 1 and body[i-1][1:] == ('unlk', 'a6'):
                purge = 0
            elif instruction[1:] == ('jmp', '(a0)') and i >= 3:
                epilogue = body[i-3:i]
                if epilogue[0][1:] != ('unlk', 'a6') or epilogue[1][1:] != ('movea.l', '(a7)+, a0'):
                    continue
                operation = epilogue[2]
                match = re.fullmatch(r'#\$([0-9a-f]+), a7', operation[2]) if operation[1] == 'addq.w' else re.fullmatch(r'\$([0-9a-f]+)\(a7\), a7', operation[2]) if operation[1] == 'lea.l' else None
                if match:
                    purge = int(match[1], 16)
            if purge is None:
                continue
            result_size = 0
            for _, mnemonic, operands in body:
                if mnemonic.startswith(('move.', 'clr.')) and operands.split(', ')[-1] == f'${purge+8:x}(a6)':
                    result_size = max(result_size, {'b':1,'w':2,'l':4}.get(mnemonic[-1],0))
            rows.append((sid, start, instruction[0], purge, purge+4, result_size))
out = repo/'reverse/decompiled/pascal-abi.tsv'
out.parent.mkdir(parents=True, exist_ok=True)
with out.open('w') as stream:
    stream.write('segment\tfunction_offset\treturn_jump_offset\targument_bytes\tresult_stack_offset\tresult_bytes\n')
    for row in rows:
        stream.write('\t'.join(map(str,row))+'\n')
print(f'Recognized {len(rows)} Pascal epilogues; {sum(x[-1]>0 for x in rows)} explicit stack results')
