#!/usr/bin/env python3
"""Compare the native JSONL interface against committed original-code outputs.

This runner never computes or updates expected outputs. Use tools/oracle.py
explicitly to regenerate observations from the original 68k executable.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]


def run(binary, paths):
    cases = []
    ids = set()
    code_hashes={str(i):hashlib.sha256((ROOT / f'reverse/original/resources/CODE_{i}.bin').read_bytes()).hexdigest()
                 for i in range(6)}
    rom_hash=hashlib.sha256((ROOT / 'images/Mac_IIci.ROM').read_bytes()).hexdigest()
    for path in paths:
        document = json.loads(path.read_text())
        if not isinstance(document,dict) or document.get('provenance',{}).get('code_sha256') != code_hashes:
            raise RuntimeError(f'{path}: missing or mismatched original CODE provenance')
        for region,digest in document['provenance'].get('extra_code_sha256',{}).items():
            if region!='Mac_IIci.ROM' or digest!=rom_hash:
                raise RuntimeError(f'{path}: missing or mismatched original ROM provenance')
        batch = document if isinstance(document, list) else document.get('vectors', document.get('cases', []))
        for case in batch:
            if not all(key in case for key in ('id','kind','input','expected')):
                raise RuntimeError(f'{path}: malformed golden vector')
            if case['id'] in ids:
                raise RuntimeError(f'{path}: duplicate vector ID {case["id"]}')
            ids.add(case['id'])
        cases.extend(batch)
    if not cases:
        raise RuntimeError('No golden vectors found; refusing a vacuous pass')
    commands = [dict(case['input'], kind=case['kind']) for case in cases]
    proc = subprocess.run([str(binary), 'jsonl'], input=''.join(json.dumps(cmd) + '\n' for cmd in commands),
                          text=True, capture_output=True, timeout=120)
    if proc.returncode:
        raise RuntimeError(f'Native process failed ({proc.returncode}): {proc.stderr}')
    lines = proc.stdout.splitlines()
    if len(lines) != len(cases):
        raise RuntimeError(f'Expected {len(cases)} responses, got {len(lines)}: {proc.stderr}')
    failures = []
    counts = {}
    for case, line in zip(cases, lines):
        actual = json.loads(line)
        counts[case['kind']] = counts.get(case['kind'], 0) + 1
        if actual != case['expected']:
            failures.append({'id': case['id'], 'kind': case['kind'], 'expected': case['expected'], 'actual': actual})
    for failure in failures:
        print(json.dumps(failure, sort_keys=True))
    print(json.dumps({'vectors': len(cases), 'passed': len(cases)-len(failures),
                      'failed': len(failures), 'by_kind': counts}, sort_keys=True))
    return int(bool(failures))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', type=Path, required=True)
    parser.add_argument('--golden', nargs='*', type=Path)
    args = parser.parse_args()
    return run(args.binary.resolve(), args.golden or sorted((ROOT / 'tests/golden').glob('*.json')))


if __name__ == '__main__':
    sys.exit(main())
