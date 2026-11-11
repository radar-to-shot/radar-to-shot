#!/usr/bin/env python3
"""Regenerate golden observations using only original 68k execution.

Run tests/validate_golden.py separately to compare the native implementation.
The fixed fuzz corpus is replayed by input, independent of the native build.
"""
import json
from pathlib import Path
import subprocess
import sys
from oracle import OriginalMachine, ROOT

GENERATORS = [
    'generate_compiler_vectors.py', 'generate_parser_vectors.py',
    'generate_vm_vectors.py', 'generate_world_vectors.py',
    'generate_movement_vectors.py', 'generate_world_io_vectors.py',
    'generate_shell_vectors.py', 'generate_battle_vectors.py',
    'generate_rom_vectors.py', 'generate_rng_vectors.py', 'generate_sine_table.py',
    'generate_placement_vectors.py',
]

def main():
    for name in GENERATORS:
        script=ROOT/'tools'/name
        if not script.is_file():
            raise RuntimeError(f'Missing generator: {script}')
        subprocess.run([sys.executable,str(script)],check=True,cwd=ROOT)
    path=ROOT/'tests/golden/compiler_fuzz.json'
    corpus=json.loads(path.read_text())
    machine=OriginalMachine()
    try:
        for case in corpus['vectors']:
            case['expected']=machine.compile(**case['input'])
        generation=corpus['provenance'].get('generator_sha256')
        corpus['provenance']=machine.provenance()
        if generation:corpus['provenance']['generator_sha256']=generation
    finally:
        machine.close()
    path.write_text(json.dumps(corpus,indent=2)+'\n')
    print(f"Recaptured {len(corpus['vectors'])} fixed compiler fuzz inputs",flush=True)

if __name__=='__main__':main()
