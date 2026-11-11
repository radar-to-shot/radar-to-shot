#!/usr/bin/env python3
"""Capture complete file-runner battles from original application and ROM code.

Expected states come only from tools/battle_68k.py. No native executable is
invoked. Each case receives a fresh machine and records original instruction
counts; the capture verifies unchanged guest application and ROM bytes.
"""
from __future__ import annotations

import hashlib
import json
from pathlib import Path

from battle_68k import run_battle
from oracle import ROOT

IDLE = 'loop\rgoto loop\r'
SELF_SHOOTER = 'FIRE_RATE 4\rloop\r0 to shot\rgoto loop\r'
RANDOM = 'allocate sample\r1000 to random\rloop\rrandom to sample\rgoto loop\r'


def robot(name, source):
    return {'name': name, 'source_hex': source.encode('mac_roman').hex()}


def cases():
    for count, seed in ((2, 0xffffffff), (3, 42), (5, 0x80000001)):
        yield f'initial_{count}_{seed:08x}', {
            'robots': [robot(f'idle {i}', IDLE) for i in range(count)],
            'ticks': 0, 'seed': seed,
        }
    yield 'random_reads', {
        'robots': [robot('random one', RANDOM), robot('random two', RANDOM)],
        'ticks': 4, 'seed': 0x80000001,
    }
    yield 'macroman_source', {
        'robots': [robot('café', '; café\r' + RANDOM), robot('idle', IDLE)],
        'ticks': 2, 'seed': 19,
    }
    yield 'first_death_three', {
        'robots': [robot('self shooter', SELF_SHOOTER), robot('idle one', IDLE),
                   robot('idle two', IDLE)],
        'ticks': 100, 'seed': 42,
    }
    yield 'last_survivor_two', {
        'robots': [robot('self shooter', SELF_SHOOTER), robot('winner', IDLE)],
        'ticks': 100, 'seed': 1,
    }
    yield 'mutual_destruction', {
        'robots': [robot('self shooter one', SELF_SHOOTER),
                   robot('self shooter two', SELF_SHOOTER)],
        'ticks': 100, 'seed': 1,
    }
    yield 'last_survivor_five', {
        'robots': [robot(f'self shooter {i}', SELF_SHOOTER) for i in range(4)]
                  + [robot('winner', IDLE)],
        'ticks': 100, 'seed': 1,
    }
    yield 'fixed_ticks_after_victory', {
        'robots': [robot('self shooter', SELF_SHOOTER), robot('winner', IDLE)],
        'ticks': 100, 'seed': 1, 'stop_when_finished': False,
    }
    yield 'explicit_positions_win', {
        'robots': [dict(robot('self shooter', SELF_SHOOTER), x=60, y=70),
                   dict(robot('winner', IDLE), x=300, y=200)],
        'ticks': 100, 'seed': 0,
    }
    yield 'seeker_circle_shooter_complete', {
        'robots': [{'name': name, 'source_hex': (ROOT / 'robots/examples' / name).read_bytes().hex()}
                   for name in ('Seeker', 'Circle Shooter')],
        'ticks': 1000, 'seed': 1,
    }


def main():
    vectors = []
    aggregate = None
    platforms = []
    for name, request in cases():
        request.setdefault('stop_when_finished', True)
        request['include_rng_seed'] = True
        evidence = {}
        expected = run_battle(request, provenance=evidence)
        execution = evidence.pop('execution')
        platforms.append(evidence.pop('platform'))
        if aggregate is None:
            aggregate = dict(execution)
            aggregate['instructions'] = 0
            for key in ('segment_instructions', 'extra_code_instructions', 'host_service_calls'):
                aggregate[key] = {}
            aggregate['macintosh_traps'] = []
            aggregate['toolbox_shims'] = {}
        for key in ('engine', 'emulator_build', 'code_sha256', 'extra_code_sha256'):
            assert aggregate[key] == execution[key], f'Capture backend changed: {key}'
        aggregate['instructions'] += execution['instructions']
        for key in ('segment_instructions', 'extra_code_instructions', 'host_service_calls'):
            for item, count in execution[key].items():
                aggregate[key][item] = aggregate[key].get(item, 0) + count
        aggregate['macintosh_traps'] = sorted(set(aggregate['macintosh_traps']) | set(execution['macintosh_traps']))
        aggregate['toolbox_shims'].update(execution['toolbox_shims'])
        evidence['instructions'] = execution['instructions']
        evidence['segment_instructions'] = execution['segment_instructions']
        evidence['rom_instructions'] = execution['extra_code_instructions']['Mac_IIci.ROM']
        vectors.append({'id': 'battle_runner_' + name, 'kind': 'battle',
                        'input': request, 'expected': expected, 'oracle': evidence})
        print(f'Captured {name}: tick={expected["tick"]}, alive={expected["alive"]}, '
              f'scores={[r["score"] for r in expected["robots"]]}', flush=True)
    platform = dict(platforms[0])
    platform['observed_fpcr_writes'] = sorted({value for p in platforms for value in p['observed_fpcr_writes']})
    for key in ('calls', 'executed_fpu_operations'):
        platform[key] = {}
        for observation in platforms:
            for name, count in observation[key].items():
                platform[key][name] = platform[key].get(name, 0) + count
    aggregate['platform'] = platform
    aggregate['capture_count'] = len(vectors)
    aggregate['capture_isolation'] = 'Fresh original machine and deterministic initialization per case'
    aggregate['generator_sha256'] = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    aggregate['battle_engine_sha256'] = hashlib.sha256((ROOT / 'tools/battle_68k.py').read_bytes()).hexdigest()
    path = ROOT / 'tests/golden/battle_runner.json'
    path.write_text(json.dumps({'provenance': aggregate, 'vectors': vectors}, indent=2) + '\n')
    print(f'Wrote {len(vectors)} original battle-runner vectors to {path}')


if __name__ == '__main__':
    main()
