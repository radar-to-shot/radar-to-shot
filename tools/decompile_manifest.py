#!/usr/bin/env python3
"""Record hashes/counts for the genuine Ghidra decompilation artifacts."""
import hashlib
import json
from pathlib import Path
repo = Path(__file__).resolve().parents[1]
out = repo/'reverse/decompiled'
def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()
rows = [line.split('\t') for line in (out/'index.tsv').read_text().splitlines()[1:]]
metadata = {
    'tool': 'Ghidra 11.3.2',
    'language': '68000:BE:32:RobotWarriors (MC68020 plus opaque classic Mac A-line)',
    'address_convention': 'CODE n at n*0x10000; A5=0x100000; offsets include 4-byte segment header',
    'candidate_functions': len(rows),
    'emitted_functions': sum(row[3]=='decompiled' for row in rows),
    'fatal_decompile_failures': sum(row[3]!='decompiled' for row in rows),
    'warning': 'Successful emission does not establish correct or complete decompilation. Read README.md and warnings retained in C pseudocode.',
    'inputs': {f'CODE_{i}.bin': digest(repo/f'reverse/original/resources/CODE_{i}.bin') for i in range(6)},
    'outputs': {p.name:digest(p) for p in sorted(out.glob('CODE_*.c'))},
    'abi_annotations': len((out/'pascal-abi.tsv').read_text().splitlines())-1,
}
(out/'manifest.json').write_text(json.dumps(metadata, indent=2)+'\n')
print(json.dumps({key: metadata[key] for key in ('candidate_functions','emitted_functions','fatal_decompile_failures','abi_annotations')}))
