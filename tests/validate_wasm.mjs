#!/usr/bin/env node
/**
 * Replay original-code golden observations through the actual C++ WASM module.
 *
 * node tests/validate_wasm.mjs --module build/site/wasm/robotwar.js
 *     [--golden tests/golden/file.json ...] [--native build/robotwar]
 *
 * Node >= 20, standard library only. Expected outputs are never generated or
 * rewritten. --native adds complete-state comparisons for 2–5 robot battles.
 */
import { createHash } from 'node:crypto';
import { readFile, readdir } from 'node:fs/promises';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath, pathToFileURL } from 'node:url';

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const USAGE = 'Usage: node tests/validate_wasm.mjs --module PATH [--golden PATH ...] [--native PATH]';

function argumentsFor(argv) {
  const options = { module: null, native: null, golden: [] };
  for (let index = 0; index < argv.length; index += 1) {
    const argument = argv[index];
    if (argument === '--help' || argument === '-h') {
      return null;
    }
    if (argument === '--golden') {
      const start = index + 1;
      while (index + 1 < argv.length && !argv[index + 1].startsWith('--')) {
        options.golden.push(path.resolve(argv[++index]));
      }
      if (index + 1 === start) throw new Error('--golden needs at least one file');
    } else if (argument === '--module' || argument === '--native') {
      if (index + 1 >= argv.length || argv[index + 1].startsWith('--')) {
        throw new Error(`${argument} needs a file path`);
      }
      const key = argument.slice(2);
      if (options[key] !== null) throw new Error(`${argument} was supplied more than once`);
      options[key] = path.resolve(argv[++index]);
    } else {
      throw new Error(`Unknown argument: ${argument}`);
    }
  }
  if (!options.module) throw new Error('--module is required');
  return options;
}

function object(value) {
  return value !== null && typeof value === 'object' && !Array.isArray(value);
}

/** Return the first structural difference; JSON object key order is irrelevant. */
function firstDifference(expected, actual, location = '$') {
  if (expected === actual) return null;
  if (Array.isArray(expected) && Array.isArray(actual)) {
    if (expected.length !== actual.length) {
      return { path: `${location}.length`, expected: expected.length, actual: actual.length };
    }
    for (let index = 0; index < expected.length; index += 1) {
      const difference = firstDifference(expected[index], actual[index], `${location}[${index}]`);
      if (difference) return difference;
    }
    return null;
  }
  if (object(expected) && object(actual)) {
    for (const key of [...new Set([...Object.keys(expected), ...Object.keys(actual)])].sort()) {
      const next = `${location}[${JSON.stringify(key)}]`;
      if (!Object.hasOwn(expected, key)) return { path: next, expected_missing: true, actual: actual[key] };
      if (!Object.hasOwn(actual, key)) return { path: next, expected: expected[key], actual_missing: true };
      const difference = firstDifference(expected[key], actual[key], next);
      if (difference) return difference;
    }
    return null;
  }
  return { path: location, expected, actual };
}

const sha256 = bytes => createHash('sha256').update(bytes).digest('hex');

async function loadGoldens(paths) {
  const codeHashes = Object.fromEntries(await Promise.all(
    Array.from({ length: 6 }, async (_, index) => [
      String(index), sha256(await readFile(path.join(ROOT, `reverse/original/resources/CODE_${index}.bin`))),
    ]),
  ));
  const romHash = sha256(await readFile(path.join(ROOT, 'images/Mac_IIci.ROM')));
  const ids = new Set();
  const cases = [];
  for (const filename of paths) {
    const document = JSON.parse(await readFile(filename, 'utf8'));
    if (!object(document) || firstDifference(codeHashes, document.provenance?.code_sha256)) {
      throw new Error(`${filename}: missing or mismatched original CODE provenance`);
    }
    for (const [region, digest] of Object.entries(document.provenance.extra_code_sha256 ?? {})) {
      if (region !== 'Mac_IIci.ROM' || digest !== romHash) {
        throw new Error(`${filename}: missing or mismatched original ROM provenance`);
      }
    }
    const batch = document.vectors ?? document.cases;
    if (!Array.isArray(batch)) throw new Error(`${filename}: missing golden vector array`);
    for (const vector of batch) {
      if (!object(vector) || typeof vector.id !== 'string' || typeof vector.kind !== 'string'
          || !object(vector.input) || !Object.hasOwn(vector, 'expected')) {
        throw new Error(`${filename}: malformed golden vector`);
      }
      if (ids.has(vector.id)) throw new Error(`${filename}: duplicate vector ID ${vector.id}`);
      ids.add(vector.id);
      cases.push(vector);
    }
  }
  if (!cases.length) throw new Error('No golden vectors found; refusing a vacuous pass');
  return cases;
}

async function loadWasm(filename) {
  const wasmFile = filename.replace(/\.(?:m?js)$/u, '.wasm');
  if (wasmFile === filename) throw new Error('--module must name a .js or .mjs factory');
  const wasmBinary = new Uint8Array(await readFile(wasmFile));
  const { default: factory } = await import(pathToFileURL(filename).href);
  if (typeof factory !== 'function') throw new Error('WASM module must export its factory as default');
  const diagnostic = (...messages) => process.stderr.write(`[wasm] ${messages.join(' ')}\n`);
  const module = await factory({
    // Supplying bytes avoids fetch(file://...) in Node, while retaining the
    // exact generated ES module and WebAssembly binary used by the browser.
    wasmBinary,
    locateFile: name => pathToFileURL(path.join(path.dirname(filename), name)).href,
    print: diagnostic,
    printErr: diagnostic,
  });
  if (typeof module.cwrap !== 'function') throw new Error('WASM module does not expose cwrap');
  const invoke = module.cwrap('robotwar_request', 'string', ['string']);
  return request => {
    const response = invoke(typeof request === 'string' ? request : JSON.stringify(request));
    if (typeof response !== 'string') throw new Error('robotwar_request did not return a string');
    try {
      return JSON.parse(response);
    } catch (error) {
      throw new Error(`robotwar_request returned invalid JSON: ${response.slice(0, 300)}`, { cause: error });
    }
  };
}

function checker() {
  const groups = {};
  const failures = [];
  return {
    groups,
    failures,
    check(group, id, work) {
      groups[group] ??= { checks: 0, passed: 0, failed: 0 };
      groups[group].checks += 1;
      try {
        const difference = work();
        if (difference) throw Object.assign(new Error('Output mismatch'), { difference });
        groups[group].passed += 1;
      } catch (error) {
        groups[group].failed += 1;
        const failure = { group, id, error: error.message ?? String(error) };
        if (error.difference) failure.difference = error.difference;
        failures.push(failure);
        // Bound diagnostics when a broken build fails thousands of fixtures.
        if (failures.length <= 20) process.stdout.write(`${JSON.stringify(failure)}\n`);
      }
    },
  };
}

function requireException(actual) {
  if (!object(actual) || typeof actual.exception !== 'string' || !actual.exception.length) {
    throw new Error(`Expected a recoverable exception response; got ${JSON.stringify(actual)}`);
  }
}

function protocolChecks(invoke, checks, vectors) {
  // Use a committed success observation for recovery checks rather than
  // computing an expected output with another implementation.
  const valid = vectors.find(vector => vector.kind === 'compile' && !vector.expected.error);
  if (!valid) throw new Error('Protocol recovery checks require a successful compile golden');
  const validRequest = { ...valid.input, kind: 'compile' };
  const idleHex = Buffer.from('loop\rgoto loop\r', 'ascii').toString('hex');
  const badSource = Buffer.from('allocate\r', 'ascii').toString('hex');
  const badBattle = {
    kind: 'battle', ticks: 1,
    robots: [{ name: 'bad', source_hex: badSource, x: 60, y: 60 },
      { name: 'idle', source_hex: idleHex, x: 300, y: 200 }],
  };
  const invalid = [
    ['malformed_json', '{"kind":'],
    ['missing_kind', {}],
    ['unknown_kind', { kind: 'unknown-wasm-validation-operation' }],
    ['invalid_hex_digit', { kind: 'compile', source_hex: 'zz' }],
    ['odd_hex_length', { kind: 'compile', source_hex: '0' }],
    ['both_source_encodings', { kind: 'compile', source: '', source_hex: '' }],
    ['wrong_source_type', { kind: 'compile', source_hex: null }],
    ['empty_battle', { kind: 'battle', robots: [], ticks: 1 }],
    ['battle_compile_error', badBattle],
  ];
  for (const [name, request] of invalid) {
    checks.check('protocol', name, () => requireException(invoke(request)));
    checks.check('protocol', `${name}_recovery`, () => firstDifference(valid.expected, invoke(validRequest)));
  }
  checks.check('protocol', 'compiler_error_is_a_result', () => {
    const actual = invoke({ kind: 'compile', source_hex: badSource });
    if (!object(actual) || Object.hasOwn(actual, 'exception') || typeof actual.error !== 'string'
        || !actual.error.length || !Number.isInteger(actual.error_position)) {
      throw new Error(`Expected compiler diagnostics, got ${JSON.stringify(actual)}`);
    }
  });
  checks.check('protocol', 'compiler_error_recovery', () => firstDifference(valid.expected, invoke(validRequest)));
  if (typeof valid.input.source === 'string' && /^[\x00-\x7f]*$/u.test(valid.input.source)) {
    const { source, ...rest } = validRequest;
    checks.check('protocol', 'source_hex_compile', () => firstDifference(
      valid.expected, invoke({ ...rest, source_hex: Buffer.from(source, 'ascii').toString('hex') }),
    ));
  }
  checks.check('protocol', 'macroman_comment_hex', () => {
    const prefix = Buffer.from([0x3b, 0x20, 0x63, 0x61, 0x66, 0x8e, 0x0d]).toString('hex');
    const actual = invoke({ kind: 'compile', source_hex: prefix + idleHex });
    if (!object(actual) || actual.error !== '' || Object.hasOwn(actual, 'exception')) {
      throw new Error(`Mac Roman comment failed to compile: ${JSON.stringify(actual)}`);
    }
  });
}

function expectEqual(expected, actual, location = '$') {
  const difference = firstDifference(expected, actual, location);
  if (difference) throw Object.assign(new Error('Output mismatch'), { difference });
}

function sessionState(snapshot) {
  const { done, view, ...state } = snapshot;
  return state;
}

function validateView(snapshot) {
  if (!object(snapshot) || typeof snapshot.done !== 'boolean' || !object(snapshot.view)) {
    throw new Error(`Expected a session snapshot with done/view: ${JSON.stringify(snapshot)}`);
  }
  const { view } = snapshot;
  expectEqual(381, view.width, '$.view.width');
  expectEqual(313, view.height, '$.view.height');
  if (!Array.isArray(view.robots) || !Array.isArray(view.events) || !Array.isArray(snapshot.robots)) {
    throw new Error('Session view and state must contain robot/event arrays');
  }
  expectEqual(snapshot.robots.length, view.robots.length, '$.view.robots.length');
  snapshot.robots.forEach((robot, index) => {
    const shown = view.robots[index];
    const registers = robot.registers;
    const expected = {
      name: robot.name, x: registers[0], y: registers[1], aim: registers[2],
      damage: registers[4], speed: registers[5], direction: registers[6], fuel: registers[7],
      cloak: Boolean(registers[8]), active: robot.active,
    };
    for (const [key, value] of Object.entries(expected)) {
      expectEqual(value, shown[key], `$.view.robots[${index}].${key}`);
    }
    if (!object(shown.shell)) throw new Error(`Robot ${index} is missing its shell view`);
    expectEqual(robot.shell_active, shown.shell.active, `$.view.robots[${index}].shell.active`);
    for (const key of ['x', 'y', 'origin_x', 'origin_y', 'delta_x', 'delta_y', 'duration', 'elapsed']) {
      if (!Number.isInteger(shown.shell[key])) {
        throw new Error(`Robot ${index} shell.${key} is not an integer`);
      }
    }
  });
}

function advanceSession(invoke, request, pattern, expected) {
  let state = invoke({ ...request, kind: 'battle_start' });
  validateView(state);
  expectEqual(0, state.tick, '$.start.tick');
  const events = [...state.view.events];
  let chunks = 0;
  while (!state.done) {
    if (chunks > request.ticks + 1) throw new Error('Incremental battle stopped making progress');
    const amount = pattern[chunks % pattern.length];
    const before = state.tick;
    state = invoke({ kind: 'battle_step', ticks: amount });
    validateView(state);
    expectEqual(Math.min(before + amount, expected.tick), state.tick, '$.step.tick');
    events.push(...state.view.events);
    chunks += 1;
  }
  expectEqual(expected, sessionState(state), '$.final');
  if (request.events) expectEqual(expected.events, events, '$.concatenated_view_events');
  // Completed sessions remain readable, without advancing time or replaying
  // animation events from the previous chunk.
  const after = invoke({ kind: 'battle_step', ticks: 1 });
  validateView(after);
  expectEqual(true, after.done, '$.completed.done');
  expectEqual(expected, sessionState(after), '$.completed.state');
  expectEqual([], after.view.events, '$.completed.view.events');
  return state;
}

async function sessionChecks(invoke, checks) {
  const vectors = await loadGoldens([
    path.join(ROOT, 'tests/golden/battle.json'),
    path.join(ROOT, 'tests/golden/battle_runner.json'),
  ]);
  const selected = new Set([
    'battle_runner_initial_2_ffffffff', 'battle_runner_random_reads',
    'battle_runner_last_survivor_two', 'battle_runner_mutual_destruction',
    'battle_runner_last_survivor_five', 'battle_runner_fixed_ticks_after_victory',
    'battle_runner_seeker_circle_shooter_complete', 'battle_glue_interrupt_12', 'battle_shell_50',
  ]);
  const chosen = vectors.filter(vector => selected.has(vector.id));
  if (chosen.length !== selected.size) throw new Error('Missing required session battle observations');
  for (const vector of chosen) {
    for (const pattern of [[1], [7, 2, 100, 3], [100]]) {
      checks.check('sessions', `${vector.id}_chunks_${pattern.join('_')}`, () => {
        const normal = invoke({ ...vector.input, kind: 'battle' });
        expectEqual(vector.expected, normal, '$.normal');
        advanceSession(invoke, vector.input, pattern, normal);
      });
    }
  }
  const shotVector = vectors.find(vector => vector.id === 'battle_shell_50');
  if (!shotVector) throw new Error('Session event validation requires the shell battle observation');
  const shotRequest = { ...shotVector.input, events: true, include_rng_seed: true };
  checks.check('sessions', 'events_cumulative_and_per_chunk', () => {
    const normal = invoke({ ...shotRequest, kind: 'battle' });
    if (!Array.isArray(normal.events) || !normal.events.some(event => event.kind === 0)
        || !normal.events.some(event => event.kind === 1)) {
      throw new Error('Shot fixture must contain both launch and explosion events');
    }
    advanceSession(invoke, shotRequest, [1, 2, 7, 11], normal);
  });
  checks.check('sessions', 'shell_view_moves_from_original_launch_coordinates', () => {
    invoke({ ...shotRequest, kind: 'battle_start' });
    const first = invoke({ kind: 'battle_step', ticks: 1 });
    validateView(first);
    const shell = first.view.robots[0].shell;
    expectEqual({ x: 100, y: 100 }, { x: shell.origin_x, y: shell.origin_y }, '$.launch');
    if (!shell.active || shell.x <= shell.origin_x || shell.y !== shell.origin_y) {
      throw new Error('An eastbound live shell must appear east of its launch point');
    }
    const second = invoke({ kind: 'battle_step', ticks: 1 });
    validateView(second);
    const nextShell = second.view.robots[0].shell;
    if (!nextShell.active || nextShell.x <= shell.x || nextShell.y !== shell.y) {
      throw new Error('The next live shell frame must advance east without a vertical jump');
    }
  });
  checks.check('sessions', 'stop_is_idempotent_and_disables_step', () => {
    expectEqual({ stopped: true }, invoke({ kind: 'battle_stop' }));
    expectEqual({ stopped: true }, invoke({ kind: 'battle_stop' }));
    requireException(invoke({ kind: 'battle_step', ticks: 1 }));
  });
  checks.check('sessions', 'failed_start_clears_previous_battle', () => {
    const active = invoke({ ...shotRequest, kind: 'battle_start' });
    validateView(active);
    expectEqual(false, active.done);
    requireException(invoke({ kind: 'battle_start', robots: [], ticks: 10 }));
    requireException(invoke({ kind: 'battle_step', ticks: 1 }));
    const recovered = invoke({ ...shotRequest, kind: 'battle_start' });
    validateView(recovered);
    expectEqual(0, recovered.tick);
    expectEqual(false, recovered.done);
  });
  checks.check('sessions', 'step_bounds_fail_without_advancing_and_recover', () => {
    invoke({ ...shotRequest, kind: 'battle_start' });
    for (const ticks of [0, 101, -1, 1.5, '1', true]) {
      requireException(invoke({ kind: 'battle_step', ticks }));
    }
    const next = invoke({ kind: 'battle_step', ticks: 1 });
    validateView(next);
    expectEqual(1, next.tick);
  });
  checks.check('sessions', 'new_start_replaces_old_state', () => {
    invoke({ ...shotRequest, kind: 'battle_start' });
    invoke({ kind: 'battle_step', ticks: 2 });
    const zero = vectors.find(vector => vector.id === 'battle_runner_initial_2_ffffffff');
    const replacement = invoke({ ...zero.input, kind: 'battle_start' });
    validateView(replacement);
    expectEqual(true, replacement.done);
    expectEqual(zero.expected, sessionState(replacement));
    expectEqual({ stopped: true }, invoke({ kind: 'battle_stop' }));
  });
}

async function nativeBattleChecks(binary, invoke, checks) {
  const names = ['Seeker', 'Circle Shooter', 'Wall Crawler', 'Run Away', 'Chicken'];
  const robots = await Promise.all(names.map(async name => ({
    name, source_hex: (await readFile(path.join(ROOT, 'robots/examples', name))).toString('hex'),
  })));
  const requests = [2, 3, 4, 5].map(count => ({
    kind: 'battle', robots: robots.slice(0, count), seed: count === 2 ? 1 : 42,
    ticks: 1000, stop_when_finished: true, include_rng_seed: true,
  }));
  const processResult = spawnSync(binary, ['jsonl'], {
    input: requests.map(request => JSON.stringify(request)).join('\n') + '\n',
    encoding: 'utf8', timeout: 120_000, maxBuffer: 64 * 1024 * 1024,
  });
  if (processResult.error) throw processResult.error;
  if (processResult.status !== 0) {
    throw new Error(`Native comparison process failed (${processResult.status}): ${processResult.stderr}`);
  }
  const lines = processResult.stdout.trimEnd().split('\n');
  if (lines.length !== requests.length) throw new Error('Native comparison returned an unexpected result count');
  requests.forEach((request, index) => {
    checks.check('native_battles', `${request.robots.length}_robots_1000_ticks`, () => {
      const expected = JSON.parse(lines[index]);
      if (!object(expected) || Object.hasOwn(expected, 'exception') || !Array.isArray(expected.robots)) {
        throw new Error(`Native battle failed: ${lines[index]}`);
      }
      return firstDifference(expected, invoke(request));
    });
  });
}

async function main() {
  if (Number(process.versions.node.split('.')[0]) < 20) throw new Error('Node.js 20 or newer is required');
  const options = argumentsFor(process.argv.slice(2));
  if (options === null) {
    process.stdout.write(`${USAGE}\n`);
    return 0;
  }
  if (!options.golden.length) {
    const directory = path.join(ROOT, 'tests/golden');
    options.golden = (await readdir(directory)).filter(name => name.endsWith('.json')).sort()
      .map(name => path.join(directory, name));
  }
  const vectors = await loadGoldens(options.golden);
  const invoke = await loadWasm(options.module);
  const checks = checker();
  const counts = {};
  for (const vector of vectors) {
    counts[vector.kind] = (counts[vector.kind] ?? 0) + 1;
    checks.check('golden', vector.id, () => firstDifference(
      vector.expected, invoke({ ...vector.input, kind: vector.kind }),
    ));
  }
  // Explicit --golden selections may legitimately contain only world/VM cases.
  const protocolVectors = vectors.some(vector => vector.kind === 'compile' && !vector.expected.error)
    ? vectors : await loadGoldens([path.join(ROOT, 'tests/golden/compiler.json')]);
  protocolChecks(invoke, checks, protocolVectors);
  await sessionChecks(invoke, checks);
  if (options.native) await nativeBattleChecks(options.native, invoke, checks);
  process.stdout.write(`${JSON.stringify({
    vectors: vectors.length,
    passed: checks.groups.golden.passed,
    failed: checks.groups.golden.failed,
    by_kind: counts,
    protocol: checks.groups.protocol,
    sessions: checks.groups.sessions,
    native_battles: checks.groups.native_battles ?? { checks: 0, passed: 0, failed: 0 },
    diagnostics_omitted: Math.max(0, checks.failures.length - 20),
    success: checks.failures.length === 0,
  })}\n`);
  return checks.failures.length ? 1 : 0;
}

try {
  process.exitCode = await main();
} catch (error) {
  process.stderr.write(`validate_wasm: ${error.stack ?? error}\n`);
  process.exitCode = 2;
}
