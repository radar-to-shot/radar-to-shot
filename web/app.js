const $ = id => document.getElementById(id);
const STORAGE_KEY = 'robot-warriors-lab.workspace.v1';
const MAX_SOURCE_BYTES = 32767;
const MAX_REQUEST_BYTES = 512 * 1024;
const MAX_ROBOTS = 20;
const COLORS = ['#126658', '#c36143', '#5874a0', '#917249', '#8b6899'];
const SVG_NS = 'http://www.w3.org/2000/svg';
const textEncoder = new TextEncoder();

class EncodingError extends Error {
  constructor(message, offset = 0) { super(message); this.name = 'EncodingError'; this.offset = offset; }
}
let romanDecoder;
try { romanDecoder = new TextDecoder('macintosh', { fatal: true }); } catch { /* ASCII remains available. */ }
const romanMap = new Map();
for (let byte = 0; byte < 256; ++byte) {
  const char = romanDecoder ? romanDecoder.decode(Uint8Array.of(byte)) : (byte < 128 ? String.fromCharCode(byte) : null);
  if (char !== null && !romanMap.has(char)) romanMap.set(char, byte);
}
function normalizeSource(source) {
  if (typeof source !== 'string') throw new TypeError('Robot source must be a string.');
  return source.replace(/\r\n|\n/g, '\r');
}
function encodeSource(source) {
  const normalized = normalizeSource(source);
  if (normalized.length > MAX_SOURCE_BYTES)
    throw new EncodingError(`Source is too long: the original compiler accepts at most ${MAX_SOURCE_BYTES.toLocaleString()} Mac Roman bytes.`, MAX_SOURCE_BYTES);
  const bytes = [];
  let offset = 0;
  for (const char of normalized) {
    const byte = romanMap.get(char);
    if (byte === undefined) {
      const code = char.codePointAt(0).toString(16).toUpperCase().padStart(4, '0');
      throw new EncodingError(`Character “${char}” (U+${code}) is not available in Mac Roman. Replace it before compiling.`, offset);
    }
    bytes.push(byte.toString(16).padStart(2, '0'));
    offset += char.length;
  }
  return bytes.join('');
}

// Public browser API. Requests are local messages, never HTTP submissions.
let worker;
let readyPromise;
let readyResolve;
let readyReject;
let workerGeneration = 0;
let nextRequest = 1;
let engineState = 'loading';
const pending = new Map();
function engineStatus(status, detail = '') {
  engineState = status;
  const dot = document.createElement('span');
  dot.className = `status-dot${status === 'ready' ? '' : ` ${status === 'error' ? 'error' : 'loading'}`}`;
  $('engine-status').replaceChildren(dot, document.createTextNode(status === 'ready' ? 'Engine ready' : status === 'error' ? 'Engine unavailable' : 'Loading engine'));
  $('retry-engine').hidden = status !== 'error';
  $('engine-error').hidden = status !== 'error';
  $('engine-error-detail').textContent = detail;
  updateControls();
}
function bootWorker() {
  const generation = ++workerGeneration;
  engineStatus('loading');
  readyPromise = new Promise((resolve, reject) => { readyResolve = resolve; readyReject = reject; });
  // The status panel reports startup failures even when nobody awaits ready().
  readyPromise.catch(() => {});
  try {
    worker = new Worker(new URL('./worker.js', import.meta.url), { type: 'module', name: 'robot-warriors-engine' });
    worker.addEventListener('message', ({ data }) => {
      if (generation !== workerGeneration) return;
      if (data.type === 'ready') { engineStatus('ready'); readyResolve(); return; }
      if (data.type === 'error') { failWorker(new Error(data.message)); return; }
      const task = pending.get(data.id);
      if (!task) return;
      pending.delete(data.id);
      if (data.error) task.reject(new Error(data.error));
      else task.resolve(data.result);
    });
    worker.addEventListener('error', event => {
      if (generation !== workerGeneration) return;
      event.preventDefault();
      failWorker(new Error(event.message || 'The WebAssembly worker could not start. Check that this browser supports WebAssembly and module workers.'));
    });
    worker.addEventListener('messageerror', () => {
      if (generation === workerGeneration) failWorker(new Error('The browser could not read an engine response.'));
    });
  } catch (error) { failWorker(error); }
}
function failWorker(error) {
  worker?.terminate();
  readyReject?.(error);
  for (const task of pending.values()) task.reject(error);
  pending.clear();
  engineStatus('error', error.message);
}
async function engineRequest(request) {
  if (!request || typeof request !== 'object' || Array.isArray(request)) throw new TypeError('An engine request must be an object.');
  const serialized = JSON.stringify(request);
  if (textEncoder.encode(serialized).length > MAX_REQUEST_BYTES) throw new Error('Request exceeds the 512 KiB browser engine limit.');
  const generation = workerGeneration;
  await readyPromise;
  if (generation !== workerGeneration) throw new DOMException('Request cancelled.', 'AbortError');
  const id = nextRequest++;
  return new Promise((resolve, reject) => {
    pending.set(id, { resolve, reject });
    try { worker.postMessage({ id, request }); }
    catch (error) { pending.delete(id); reject(error); }
  });
}
function cancelEngine() {
  const error = new DOMException('Battle cancelled.', 'AbortError');
  worker?.terminate();
  readyReject?.(error);
  for (const task of pending.values()) task.reject(error);
  pending.clear();
  bootWorker();
}
const api = Object.freeze({
  ready: () => readyPromise,
  request: engineRequest,
  compile: source => Promise.resolve().then(() => engineRequest({ kind: 'compile', source_hex: encodeSource(source) })),
  battle: ({ robots, seed = 1, ticks = 2000, ...options } = {}) => Promise.resolve().then(() => {
    if (!Array.isArray(robots) || robots.length < 2 || robots.length > 5) throw new Error('A battle needs 2–5 robots.');
    if (!Number.isInteger(seed) || seed < 0 || seed > 4294967295) throw new Error('Seed must be an integer from 0 to 4294967295.');
    if (!Number.isInteger(ticks) || ticks < 1 || ticks > 1000000) throw new Error('Maximum ticks must be an integer from 1 to 1000000.');
    return engineRequest({ ...options, kind: 'battle', seed, ticks, stop_when_finished: true, include_rng_seed: true,
      robots: robots.map(robot => ({ name: String(robot.name || 'Robot'), source_hex: encodeSource(robot.source) })) });
  }),
  cancel: () => busy === 'battle' ? cancelBattle() : cancelEngine(),
});
window.robotwar = api;

let robots = [];
let selectedId = null;
let samples = [];
let busy = null;
let lastResult = null;
let lastBattleSeed = 1;
let toastTimer;
let saveTimer;
let elapsedTimer;
let runToken = 0;
let liveTick = 0;
let battleStatusLocked = false;
let lastUndo = null;
let storageFailed = false;
const currentRobot = () => robots.find(robot => robot.id === selectedId);
const participants = () => robots.filter(robot => robot.active);
const uid = () => globalThis.crypto?.randomUUID?.() || `r-${Date.now()}-${Math.random().toString(36).slice(2)}`;
function uniqueName(name) {
  const base = String(name || 'Untitled robot').trim().slice(0, 56) || 'Untitled robot';
  if (!robots.some(robot => robot.name === base)) return base;
  let number = 2;
  while (robots.some(robot => robot.name === `${base} (${number})`)) ++number;
  return `${base} (${number})`;
}
function persistWorkspace() {
  clearTimeout(saveTimer);
  saveTimer = null;
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify({ version: 1, selectedId,
      robots: robots.map(({ id, name, source, active, samplePath }) => ({ id, name, source, active, samplePath })),
      seed: $('seed-input').value, ticks: $('ticks-input').value }));
  } catch {
    if (!storageFailed) { storageFailed = true; toast('Browser saving is unavailable. Download your source to keep a copy.'); }
    document.querySelector('.roster-footnote').textContent = 'Download source to keep your edits.';
  }
}
function saveWorkspace() {
  clearTimeout(saveTimer);
  saveTimer = setTimeout(persistWorkspace, 250);
}
function restoreWorkspace() {
  try {
    const saved = JSON.parse(localStorage.getItem(STORAGE_KEY) || 'null');
    if (!saved || saved.version !== 1 || !Array.isArray(saved.robots)) return false;
    let activeCount = 0;
    robots = saved.robots.slice(0, MAX_ROBOTS).filter(robot => typeof robot.source === 'string' && typeof robot.name === 'string').map(robot => ({
      id: typeof robot.id === 'string' ? robot.id : uid(), name: robot.name.slice(0, 64), source: robot.source,
      samplePath: typeof robot.samplePath === 'string' ? robot.samplePath : null,
      active: Boolean(robot.active) && activeCount++ < 5, version: 0, compiled: null,
    }));
    selectedId = robots.some(robot => robot.id === saved.selectedId) ? saved.selectedId : robots[0]?.id;
    if (saved.seed !== undefined) $('seed-input').value = String(saved.seed);
    if (saved.ticks !== undefined) $('ticks-input').value = String(saved.ticks);
    return true;
  } catch { return false; }
}
function toast(message, undo = null) {
  clearTimeout(toastTimer);
  $('toast-message').textContent = message;
  lastUndo = undo;
  $('toast-action').hidden = !undo;
  $('toast-action').disabled = Boolean(busy);
  $('toast').hidden = false;
  toastTimer = setTimeout(() => { $('toast').hidden = true; }, undo ? 12000 : 7500);
}
function appError(message) { $('app-error').textContent = message; $('app-error').hidden = !message; }
function clearError() { appError(''); }
function updateControls() {
  // Called during worker startup as well as after workspace changes.
  const selected = typeof robots !== 'undefined' ? currentRobot() : null;
  const count = typeof robots !== 'undefined' ? participants().length : 0;
  const running = typeof busy !== 'undefined' && busy === 'battle';
  const occupied = typeof busy !== 'undefined' && Boolean(busy);
  $('workbench').setAttribute('aria-busy', String(occupied));
  $('participant-count').textContent = `${count} / 5 active`;
  $('compile-button').disabled = !selected || occupied || engineState !== 'ready';
  $('run-button').disabled = count < 2 || count > 5 || occupied || engineState !== 'ready';
  $('cancel-button').hidden = !running;
  $('run-button').hidden = running;
  $('seed-input').disabled = occupied;
  $('ticks-input').disabled = occupied;
  $('watch-battle').disabled = occupied;
  $('battle-speed').disabled = !$('watch-battle').checked;
  $('source-editor').disabled = !selected || occupied;
  $('robot-name').disabled = !selected || occupied;
  $('download-source-button').disabled = !selected;
  $('reset-sample-button').disabled = occupied;
  $('reset-sample-button').hidden = !selected?.samplePath;
  $('new-robot-button').disabled = occupied;
  $('upload-button').disabled = occupied;
  $('upload-input').disabled = occupied;
  $('upload-encoding').disabled = occupied;
  $('sample-select').disabled = occupied;
  $('add-sample-button').disabled = occupied || !$('sample-select').value;
  $('toast-action').disabled = occupied;
  for (const checkbox of document.querySelectorAll('.participant-checkbox')) checkbox.disabled = occupied;
  for (const button of document.querySelectorAll('.robot-remove')) button.disabled = occupied;
  if (!occupied && !lastResult && !battleStatusLocked) $('battle-status').textContent = count >= 2 ? `${count} robots ready to enter. Sources are checked before each battle.` : 'Select 2–5 participants to begin.';
}
function renderRoster() {
  const list = $('robot-list');
  list.replaceChildren();
  for (const robot of robots) {
    const row = document.createElement('div');
    row.className = `robot-card${robot.id === selectedId ? ' selected' : ''}`;
    row.dataset.robotId = robot.id;
    const checkbox = document.createElement('input');
    checkbox.type = 'checkbox'; checkbox.checked = robot.active; checkbox.className = 'participant-checkbox';
    checkbox.setAttribute('aria-label', `Include ${robot.name} in battle`);
    checkbox.addEventListener('change', () => {
      if (busy) { checkbox.checked = robot.active; return; }
      if (checkbox.checked && participants().length >= 5) {
        checkbox.checked = false;
        appError('A battle can have at most five robots. Deselect one before adding another participant.');
        return;
      }
      clearError(); robot.active = checkbox.checked; updateControls(); saveWorkspace();
    });
    const select = document.createElement('button');
    select.type = 'button'; select.className = 'robot-select'; select.setAttribute('aria-pressed', String(robot.id === selectedId));
    const title = document.createElement('span'); title.className = 'robot-title'; title.textContent = robot.name;
    const detail = document.createElement('span');
    const status = robot.compiled ? (robot.compiled.error ? 'error' : 'ready') : '';
    detail.className = `robot-detail ${status}`;
    detail.textContent = robot.compiled ? (robot.compiled.error ? 'Compile error' : `${robot.compiled.code_count} instructions · compiled`) : (robot.samplePath ? 'Classic sample · uncompiled' : 'Your source · uncompiled');
    select.append(title, detail); select.addEventListener('click', () => selectRobot(robot.id));
    const remove = document.createElement('button');
    remove.type = 'button'; remove.className = 'robot-remove'; remove.textContent = '×';
    remove.setAttribute('aria-label', `Remove ${robot.name}`);
    remove.addEventListener('click', () => removeRobot(robot.id));
    row.append(checkbox, select, remove); list.append(row);
  }
  $('empty-roster').hidden = Boolean(robots.length);
  updateControls();
}
function sourceLocation(source, offset) {
  const normalized = normalizeSource(source);
  const cursor = Math.max(0, Math.min(Number.isFinite(offset) && offset !== 65535 ? offset : 0, normalized.length));
  const prefix = normalized.slice(0, cursor);
  const line = prefix.split('\r').length;
  return { line, column: cursor - prefix.lastIndexOf('\r'), offset: cursor };
}
function focusLine(line) {
  const editor = $('source-editor');
  const text = editor.value;
  let start = 0;
  for (let n = 1; n < line; ++n) {
    const next = text.indexOf('\n', start);
    if (next < 0) break;
    start = next + 1;
  }
  const end = text.indexOf('\n', start);
  editor.focus(); editor.setSelectionRange(start, end < 0 ? text.length : end);
  editor.scrollTop = Math.max(0, (line - 3) * parseFloat(getComputedStyle(editor).lineHeight));
  $('line-numbers').scrollTop = editor.scrollTop;
}
function feedback(robot) {
  const panel = $('compile-feedback');
  panel.className = 'compile-feedback';
  const icon = panel.querySelector('.feedback-icon');
  const text = $('compile-status');
  panel.querySelector('.error-jump')?.remove();
  $('source-state').className = 'source-state';
  if (!robot) { icon.textContent = '○'; text.textContent = 'Add a robot to begin.'; $('source-state').textContent = 'No program selected'; return; }
  if (!robot.compiled) { icon.textContent = '○'; text.textContent = 'Compile to check this source. A battle compiles every selected robot first.'; $('source-state').textContent = 'Not compiled'; return; }
  if (robot.compiled.error) {
    const position = Number(robot.compiled.error_position) || 0;
    const location = sourceLocation(robot.source, position);
    panel.classList.add('error'); icon.textContent = '!';
    text.textContent = `${robot.compiled.error} (near line ${location.line}, column ${location.column}; byte ${position})`;
    const jump = document.createElement('button'); jump.className = 'error-jump'; jump.textContent = 'Go to line';
    jump.addEventListener('click', () => focusLine(location.line)); panel.append(jump);
    $('source-state').textContent = 'Compile error'; $('source-state').classList.add('error');
  } else {
    panel.classList.add('success'); icon.textContent = '✓';
    text.textContent = `Compiled successfully · ${robot.compiled.code_count} instructions. Ready to enter the battlefield.`;
    $('source-state').textContent = 'Compiled'; $('source-state').classList.add('ready');
  }
}
function updateSourceSummary() {
  const text = $('source-editor').value;
  const lines = text ? text.split('\n').length : 0;
  $('line-numbers').textContent = Array.from({ length: Math.max(lines, 1) }, (_, n) => n + 1).join('\n');
  $('source-summary').textContent = `${lines.toLocaleString()} ${lines === 1 ? 'line' : 'lines'} · ${normalizeSource(text).length.toLocaleString()} characters`;
}
function selectRobot(id) {
  selectedId = robots.some(robot => robot.id === id) ? id : robots[0]?.id || null;
  const robot = currentRobot();
  $('source-editor').value = robot ? robot.source.replace(/\r\n|\r/g, '\n') : '';
  $('robot-name').value = robot?.name || '';
  $('source-editor').scrollTop = 0; $('line-numbers').scrollTop = 0;
  updateSourceSummary(); feedback(robot); renderRoster(); saveWorkspace();
}
function addRobot(name, source, samplePath = null, active = true) {
  if (robots.length >= MAX_ROBOTS) throw new Error(`The workbench holds up to ${MAX_ROBOTS} robots. Remove one before adding another.`);
  const robot = { id: uid(), name: uniqueName(name), source: source.replace(/\r\n|\r/g, '\n'), samplePath,
    active: active && participants().length < 5, version: 0, compiled: null };
  robots.push(robot); selectRobot(robot.id); return robot;
}
function removeRobot(id) {
  if (busy) return;
  const index = robots.findIndex(robot => robot.id === id);
  if (index < 0) return;
  const [removed] = robots.splice(index, 1);
  const selected = selectedId === id ? robots[Math.min(index, robots.length - 1)]?.id : selectedId;
  selectRobot(selected); clearError();
  toast(`Removed ${removed.name}.`, () => {
    if (robots.length >= MAX_ROBOTS) { appError('Remove a robot before restoring this one.'); return; }
    removed.active = removed.active && participants().length < 5;
    robots.splice(Math.min(index, robots.length), 0, removed); selectRobot(removed.id);
  });
}
async function sampleSource(sample) {
  if (sample.source !== undefined) return sample.source;
  const response = await fetch(new URL(sample.path, import.meta.url));
  if (!response.ok) throw new Error(`Could not load sample ${sample.name}.`);
  sample.source = await response.text();
  return sample.source;
}
async function addSample() {
  if (busy) return;
  clearError();
  const sample = samples.find(sample => sample.path === $('sample-select').value);
  if (!sample) return;
  busy = 'workspace'; updateControls();
  try { addRobot(sample.name, await sampleSource(sample), sample.path); }
  catch (error) { appError(error.message); }
  finally { busy = null; updateControls(); }
}
async function restoreSample() {
  const robot = currentRobot();
  if (!robot?.samplePath || busy) return;
  const sample = samples.find(sample => sample.path === robot.samplePath);
  if (!sample) { appError('This sample is no longer in the example library. Download your source to keep it.'); return; }
  busy = 'workspace'; updateControls();
  try {
    const oldSource = robot.source;
    robot.source = (await sampleSource(sample)).replace(/\r\n|\r/g, '\n');
    robot.compiled = null; ++robot.version; selectRobot(robot.id);
    toast(`Restored the original ${sample.name} source.`, () => { robot.source = oldSource; robot.compiled = null; ++robot.version; selectRobot(robot.id); });
  } catch (error) { appError(error.message); }
  finally { busy = null; updateControls(); }
}
async function uploadFiles(files) {
  if (busy || !files.length) { $('upload-input').value = ''; return; }
  clearError();
  const encoding = $('upload-encoding').value;
  const failures = []; let added = 0;
  busy = 'workspace'; updateControls();
  try {
    for (const file of files) {
      try {
        if (robots.length >= MAX_ROBOTS) throw new Error(`The workbench holds at most ${MAX_ROBOTS} robots.`);
        if (file.size > 512 * 1024) throw new Error('File is too large; upload a source text file under 512 KiB.');
        const bytes = new Uint8Array(await file.arrayBuffer());
        let source;
        try { source = new TextDecoder(encoding, { fatal: true }).decode(bytes); }
        catch { throw new Error(encoding === 'utf-8' ? 'Not valid UTF-8 text. For an original Mac file, select Mac Roman under File encoding and try again.' : 'This browser cannot decode Mac Roman files.'); }
        if (source.includes('\0')) throw new Error('This file contains binary data; upload the robot’s text source.');
        addRobot(file.name.replace(/\.(txt|robot|rw)$/i, ''), source); ++added;
      } catch (error) { failures.push(`${file.name}: ${error.message}`); }
    }
    if (failures.length) appError(failures.join(' '));
    if (added) toast(`Added ${added} ${added === 1 ? 'robot' : 'robots'}. ${participants().length} selected for battle.`);
  } finally {
    $('upload-input').value = '';
    busy = null; updateControls();
  }
}
function downloadBlob(data, type, name) {
  const url = URL.createObjectURL(new Blob([data], { type }));
  const link = document.createElement('a'); link.href = url; link.download = name;
  document.body.append(link); link.click(); link.remove();
  setTimeout(() => URL.revokeObjectURL(url), 1000);
}
function safeFilename(name) { return name.replace(/[<>:"/\\|?*\u0000-\u001f]/g, '-').slice(0, 80) || 'robot'; }
async function compileRobot(robot, source = robot.source) {
  const version = robot.version;
  let result;
  try { result = await api.compile(source); }
  catch (error) {
    if (error instanceof EncodingError) result = { error: error.message, error_position: error.offset };
    else throw error;
  }
  if (robot.version === version && robot.source === source) robot.compiled = result;
  renderRoster();
  if (selectedId === robot.id) feedback(robot);
  return result;
}
async function compileSelected() {
  const robot = currentRobot();
  if (!robot || busy) return;
  clearError(); busy = 'compile'; updateControls();
  $('compile-status').textContent = `Compiling ${robot.name}…`;
  try { await compileRobot(robot); }
  catch (error) { if (error.name !== 'AbortError') appError(error.message); }
  finally { busy = null; updateControls(); }
}
function readInteger(id, label, min, max) {
  const raw = $(id).value;
  const value = Number(raw);
  if (!/^\d+$/.test(raw) || !Number.isSafeInteger(value) || value < min || value > max)
    throw new Error(`${label} must be a whole number from ${min.toLocaleString()} to ${max.toLocaleString()}.`);
  return value;
}
function stopElapsed() { clearInterval(elapsedTimer); elapsedTimer = null; }
function clearBattleResult() {
  lastResult = null; liveTick = 0;
  battleStatusLocked = true;
  $('download-result-button').disabled = true;
  $('result-content').hidden = true; $('result-empty').hidden = false;
  $('empty-result-title').textContent = 'Check the battle settings.';
  $('empty-result-copy').textContent = 'No simulation has started. The report will appear when the next battle ends.';
  $('arena-robots').replaceChildren(); $('arena-empty').removeAttribute('hidden'); $('arena-legend').hidden = true;
  $('arena').closest('.arena-panel').classList.remove('live');
  $('arena-title').textContent = 'Battlefield';
  $('arena-caption').textContent = 'NOT STARTED';
  $('arena').setAttribute('aria-label', 'Battle has not started.');
  $('arena-note').textContent = 'Choose valid battle settings to start the next simulation.';
  $('battle-status').setAttribute('aria-live', 'polite');
  $('battle-status').textContent = 'Battle not started: check the settings above.';
}
async function runBattle() {
  if (busy) return;
  clearError(); clearBattleResult();
  const selected = participants();
  if (selected.length < 2 || selected.length > 5) { appError('Select 2–5 robots to enter the battle.'); return; }
  let seed, ticks;
  try { seed = readInteger('seed-input', 'Random seed', 0, 4294967295); ticks = readInteger('ticks-input', 'Maximum ticks', 1, 1000000); }
  catch (error) { appError(error.message); return; }
  const token = ++runToken;
  const sources = selected.map(robot => ({ robot, source: robot.source, name: robot.name }));
  busy = 'battle'; updateControls(); saveWorkspace();
  const start = performance.now();
  $('empty-result-title').textContent = 'The experiment is running.';
  $('empty-result-copy').textContent = 'Programs are checked first. The report will appear when the battle ends.';
  $('arena-caption').textContent = 'CHECKING PROGRAMS';
  $('arena').setAttribute('aria-label', 'Battle has not started. Programs are being checked.');
  $('arena-note').textContent = 'The engine is checking the selected source programs.';
  try {
    $('battle-status').textContent = `Checking ${selected.length} programs…`;
    for (const { robot, source } of sources) {
      const result = await compileRobot(robot, source);
      if (token !== runToken) return;
      if (result.error) {
        selectRobot(robot.id);
        appError(`${robot.name} could not compile. Fix the diagnostic in the editor, then run the battle again.`);
        $('battle-status').textContent = 'Battle stopped before starting: a program needs attention.';
        $('empty-result-title').textContent = 'Check the source first.';
        $('empty-result-copy').textContent = 'The battle did not start. Fix the compiler diagnostic, then try again.';
        $('arena-caption').textContent = 'NOT STARTED';
        $('arena-note').textContent = 'No simulation ran. The compiler diagnostic is shown beside the source.';
        return;
      }
    }
    let result;
    if ($('watch-battle').checked) {
      result = await api.request({ kind: 'battle_start', seed, ticks, stop_when_finished: true, include_rng_seed: true,
        robots: sources.map(({ name, source }) => ({ name, source_hex: encodeSource(source) })) });
      if (token !== runToken) return;
      renderArena(result, true);
      $('battle-status').setAttribute('aria-live', 'off');
      while (!result.done) {
        await new Promise(resolve => setTimeout(resolve, 100));
        if (token !== runToken) return;
        const chunk = Number($('battle-speed').value);
        result = await api.request({ kind: 'battle_step', ticks: chunk });
        if (token !== runToken) return;
        liveTick = Number(result.tick);
        renderArena(result, !result.done);
        $('battle-status').textContent = `Live · tick ${liveTick.toLocaleString()} of ${ticks.toLocaleString()} · ${result.alive} surviving · ${chunk}× speed`;
      }
    } else {
      $('arena-caption').textContent = 'RUNNING · FAST MODE';
      $('arena-note').textContent = 'The simulation runs in the background. Its final state will appear here.';
      const updateTime = () => { $('battle-status').textContent = `Running up to ${ticks.toLocaleString()} ticks · ${((performance.now() - start) / 1000).toFixed(1)} s elapsed`; };
      updateTime(); elapsedTimer = setInterval(updateTime, 500);
      result = await api.battle({ robots: sources.map(({ name, source }) => ({ name, source })), seed, ticks });
    }
    if (token !== runToken) return;
    stopElapsed(); lastResult = result; lastBattleSeed = seed;
    renderResult(result, seed, performance.now() - start, ticks);
    $('battle-status').setAttribute('aria-live', 'polite');
    $('battle-status').textContent = `Finished after ${Number(result.tick).toLocaleString()} ticks. The report shows the final state.`;
  } catch (error) {
    if (token === runToken && error.name !== 'AbortError') {
      $('battle-status').setAttribute('aria-live', 'polite');
      appError(error.message); $('battle-status').textContent = 'The battle could not finish. Check the message above and try again.';
      $('empty-result-title').textContent = 'No completed result.';
      $('empty-result-copy').textContent = 'The engine reported a problem. Check the message above; your source is preserved.';
      $('arena-caption').textContent = 'STOPPED · NO RESULT';
      $('arena').closest('.arena-panel').classList.remove('live');
      $('arena-note').textContent = 'The engine stopped before returning a completed result.';
    }
  } finally {
    if (token === runToken) { stopElapsed(); busy = null; updateControls(); }
  }
}
function cancelBattle() {
  if (busy !== 'battle') return;
  ++runToken; stopElapsed(); busy = null;
  cancelEngine(); updateControls();
  $('battle-status').setAttribute('aria-live', 'polite');
  $('battle-status').textContent = 'Battle cancelled. Your source is preserved.';
  $('arena-caption').textContent = `CANCELLED · TICK ${liveTick.toLocaleString()}`;
  $('arena-title').textContent = 'Cancelled battlefield';
  $('arena').closest('.arena-panel').classList.remove('live');
  $('arena-note').textContent = 'The simulation was cancelled. This is the last observed state, not a completed result.';
  $('result-content').hidden = true; $('result-empty').hidden = false;
  $('empty-result-title').textContent = 'Battle cancelled.';
  $('empty-result-copy').textContent = 'No winner was declared. Your programs are preserved; run again whenever you are ready.';
  toast('Battle cancelled. You can run it again when the engine is ready.');
}
function svgElement(name, attributes = {}) {
  const element = document.createElementNS(SVG_NS, name);
  for (const [key, value] of Object.entries(attributes)) element.setAttribute(key, String(value));
  return element;
}
function renderArena(result, live = false) {
  const group = $('arena-robots'); group.replaceChildren(); $('arena-empty').setAttribute('hidden', '');
  $('arena').closest('.arena-panel').classList.toggle('live', live);
  $('arena-title').textContent = live ? 'Live battlefield' : 'Final battlefield';
  const view = result.view?.robots || result.robots.map(robot => ({
    name: robot.name, x: robot.registers[0], y: robot.registers[1], aim: robot.registers[2], direction: robot.registers[6],
    active: robot.active, cloak: Boolean(robot.registers[8]), damage: robot.registers[4],
  }));
  const labels = [];
  $('arena-legend').replaceChildren(); $('arena-legend').hidden = false;
  view.forEach((robot, index) => {
    const rawX = robot.x, rawY = robot.y;
    const x = Math.max(5.5, Math.min(375.5, Number(rawX)));
    const y = Math.max(5.5, Math.min(307.5, Number(rawY)));
    const g = svgElement('g', { 'data-arena-robot': index });
    const title = svgElement('title'); title.textContent = `${index + 1}. ${robot.name}: ${robot.active ? 'surviving' : 'destroyed'}, position ${rawX}, ${rawY}, damage ${robot.damage}%.`; g.append(title);
    const ink = '#161c16';
    if (robot.active) {
      // Original-Mac-inspired monochrome outlines. Positions and headings come
      // directly from native snapshots; no fabricated/interpolated simulation.
      const angle = Number(robot.aim || 0) * Math.PI / 180;
      const direction = Number(robot.direction || 0) * Math.PI / 180;
      const body = index % 3 === 0
        ? svgElement('rect', { x: x - 5, y: y - 5, width: 10, height: 10, rx: 1 })
        : index % 3 === 1
          ? svgElement('polygon', { points: `${x},${y - 6} ${x + 6},${y} ${x},${y + 6} ${x - 6},${y}` })
          : svgElement('circle', { cx: x, cy: y, r: 5.5 });
      body.setAttribute('fill', 'white'); body.setAttribute('stroke', ink); body.setAttribute('stroke-width', '1.2');
      if (robot.cloak) { body.setAttribute('stroke-dasharray', '1.5 1.5'); g.setAttribute('opacity', '.5'); }
      g.append(body);
      g.append(svgElement('line', { x1: x + Math.sin(direction) * 6, y1: y - Math.cos(direction) * 6, x2: x + Math.sin(direction) * 9, y2: y - Math.cos(direction) * 9, stroke: ink, 'stroke-width': 2, 'data-direction': robot.direction }));
      g.append(svgElement('line', { x1: x, y1: y, x2: x + Math.sin(angle) * 10, y2: y - Math.cos(angle) * 10, stroke: ink, 'stroke-width': 1.2, 'data-aim': robot.aim }));
      g.append(svgElement('circle', { cx: x, cy: y, r: 1.2, fill: ink }));
      const damage = Math.max(0, Math.min(100, Number(robot.damage) || 0));
      const damageY = y > 299 ? y - 11 : y + 9;
      g.append(svgElement('rect', { x: x - 5, y: damageY, width: 10, height: 2, fill: 'white', stroke: ink, 'stroke-width': .5, 'data-damage': robot.damage }));
      if (damage) g.append(svgElement('rect', { x: x - 5, y: damageY, width: damage / 10, height: 2, fill: ink }));
    } else {
      g.append(svgElement('path', { d: `M${x - 3},${y - 3}l6,6m0,-6l-6,6`, fill: 'none', stroke: '#737973', 'stroke-width': 1 }));
    }
    const label = svgElement('text', { x: x + (x > 354 ? -11 : 10), y: y + (y < 18 ? 16 : -9), fill: ink, 'font-family': 'ui-monospace,monospace', 'font-size': 9, 'font-weight': 700, 'text-anchor': x > 354 ? 'end' : 'start' });
    label.textContent = index + 1; g.append(label); group.append(g);
    if (robot.shell?.active) {
      const shell = svgElement('circle', { cx: robot.shell.x, cy: robot.shell.y, r: 1.7, fill: ink, 'data-shell': index });
      const shellTitle = svgElement('title'); shellTitle.textContent = `${robot.name}'s shell`; shell.append(shellTitle); group.append(shell);
    }
    const legend = document.createElement('span');
    const number = document.createElement('b'); number.textContent = index + 1;
    legend.append(number, document.createTextNode(robot.name)); $('arena-legend').append(legend);
    labels.push(`${index + 1}: ${robot.name} at ${rawX}, ${rawY}, ${robot.active ? 'surviving' : 'destroyed'}`);
  });
  for (const event of result.view?.events || []) {
    if (event.kind !== 1) continue;
    const ring = svgElement('g', { 'data-explosion': event.tick });
    ring.append(svgElement('circle', { cx: event.x, cy: event.y, r: 8, fill: 'none', stroke: '#151a15', 'stroke-width': 1, 'stroke-dasharray': '2 2' }));
    ring.append(svgElement('circle', { cx: event.x, cy: event.y, r: 4, fill: 'none', stroke: '#151a15', 'stroke-width': .8 }));
    group.append(ring);
  }
  $('arena').setAttribute('aria-label', `${live ? 'Live' : 'Final'} battlefield after ${result.tick} ticks. ${labels.join('; ')}.`);
  $('arena-caption').textContent = `${live ? 'LIVE · ' : ''}${Number(result.tick).toLocaleString()} TICKS${live ? '' : ' · FINAL STATE'}`;
  $('arena-note').textContent = live
    ? 'Live engine snapshots. Long lines show aim, short ticks show heading, and bars show damage. Dotted outlines mark cloaked robots; black dots are shells.'
    : 'The final observed state. Long lines show aim, short ticks show heading, and bars show damage. Numbers match the report; × marks a destroyed robot.';
}

function renderResult(result, seed, elapsed, requestedTicks) {
  if (!Array.isArray(result.robots)) throw new Error('The engine returned a battle result without robot states.');
  const survivors = result.robots.filter(robot => robot.active);
  $('result-empty').hidden = true; $('result-content').hidden = false;
  $('outcome-title').textContent = survivors.length === 1 ? `${survivors[0].name} wins.` : survivors.length === 0 ? 'No robot survived.' : 'The tick limit is reached.';
  $('result-summary').textContent = `${Number(result.tick).toLocaleString()} ticks · ${(Number(result.tick) / 10).toFixed(1)} simulated seconds · seed ${seed}`;
  const tbody = $('results-body'); tbody.replaceChildren();
  result.robots.forEach((robot, index) => {
    const row = document.createElement('tr');
    const name = document.createElement('td');
    const key = document.createElement('span'); key.className = 'robot-key'; key.style.setProperty('--robot-color', COLORS[index % COLORS.length]); key.textContent = index + 1;
    name.append(key, document.createTextNode(robot.name)); row.append(name);
    const state = document.createElement('td'); const label = document.createElement('span'); label.className = `state-label${robot.active ? '' : ' destroyed'}`; label.textContent = robot.active ? 'Surviving' : 'Destroyed'; state.append(label); row.append(state);
    for (const value of [`${robot.registers[4]}%`, Number(robot.registers[7]).toLocaleString(), `${robot.registers[0]}, ${robot.registers[1]}`, robot.error_resets ?? 0]) {
      const cell = document.createElement('td'); cell.textContent = value; row.append(cell);
    }
    tbody.append(row);
  });
  $('result-note').textContent = `${survivors.length} of ${result.robots.length} robots surviving. ${(elapsed / 1000).toFixed(2)} s elapsed in this browser.${result.rng_seed !== undefined ? ` Final RNG state: ${result.rng_seed}.` : ''} CPU resets indicate a program restart, including reaching the end of its source.`;
  $('download-result-button').disabled = false;
  renderArena(result);
}
async function copyBrief() {
  const text = $('agent-brief').textContent.trim();
  try {
    if (navigator.clipboard?.writeText) await navigator.clipboard.writeText(text);
    else {
      const area = document.createElement('textarea'); area.value = text; area.style.position = 'fixed'; area.style.opacity = '0'; document.body.append(area); area.select();
      const success = document.execCommand('copy'); area.remove();
      if (!success) throw new Error('Copy is unavailable.');
    }
    $('brief-status').textContent = 'Agent brief copied.';
  } catch { $('brief-status').textContent = 'Clipboard access was unavailable. Download the text file or select the brief to copy it.'; }
}

$('source-editor').addEventListener('input', () => {
  const robot = currentRobot(); if (!robot) return;
  robot.source = $('source-editor').value; robot.compiled = null; ++robot.version;
  updateSourceSummary(); feedback(robot); renderRoster(); saveWorkspace();
});
$('source-editor').addEventListener('scroll', () => { $('line-numbers').scrollTop = $('source-editor').scrollTop; });
$('source-editor').addEventListener('keydown', event => {
  // Keep Tab available for keyboard navigation. Ctrl/Cmd+Enter checks the source.
  if ((event.ctrlKey || event.metaKey) && event.key === 'Enter') { event.preventDefault(); compileSelected(); }
});
$('robot-name').addEventListener('input', () => {
  const robot = currentRobot(); if (!robot) return;
  robot.name = $('robot-name').value || 'Untitled robot'; renderRoster(); saveWorkspace();
});
$('robot-name').addEventListener('blur', () => { const robot = currentRobot(); if (robot) { robot.name = robot.name.trim() || 'Untitled robot'; $('robot-name').value = robot.name; renderRoster(); saveWorkspace(); } });
$('new-robot-button').addEventListener('click', () => { if (busy) return; clearError(); try { addRobot('New robot', '; Your robot starts here.\n\nstart\n    0 to speed\n    goto start\n'); $('source-editor').focus(); } catch (error) { appError(error.message); } });
$('sample-select').addEventListener('change', updateControls);
$('add-sample-button').addEventListener('click', addSample);
$('reset-sample-button').addEventListener('click', restoreSample);
$('upload-button').addEventListener('click', () => $('upload-input').click());
$('upload-input').addEventListener('change', event => uploadFiles([...event.target.files]));
$('compile-button').addEventListener('click', compileSelected);
$('run-button').addEventListener('click', runBattle);
$('cancel-button').addEventListener('click', cancelBattle);
$('retry-engine').addEventListener('click', () => { clearError(); cancelEngine(); });
$('seed-input').addEventListener('change', saveWorkspace);
$('ticks-input').addEventListener('change', saveWorkspace);
$('watch-battle').addEventListener('change', updateControls);
$('download-source-button').addEventListener('click', () => { const robot = currentRobot(); if (robot) downloadBlob(robot.source.replace(/\r\n|\r/g, '\n'), 'text/plain;charset=utf-8', `${safeFilename(robot.name)}.robot`); });
$('download-result-button').addEventListener('click', () => { if (lastResult) downloadBlob(JSON.stringify(lastResult, null, 2) + '\n', 'application/json', `robot-warriors-seed-${lastBattleSeed}.json`); });
$('copy-brief-button').addEventListener('click', copyBrief);
$('toast-dismiss').addEventListener('click', () => { $('toast').hidden = true; clearTimeout(toastTimer); });
$('toast-action').addEventListener('click', () => { if (busy) return; const action = lastUndo; lastUndo = null; $('toast').hidden = true; clearTimeout(toastTimer); action?.(); });
window.addEventListener('pagehide', persistWorkspace);
document.addEventListener('visibilitychange', () => { if (document.visibilityState === 'hidden') persistWorkspace(); });

const restored = restoreWorkspace();
selectRobot(selectedId);
bootWorker();
(async () => {
  try {
    const response = await fetch(new URL('./samples/manifest.json', import.meta.url));
    if (!response.ok) throw new Error('Example library could not be loaded. You can still upload a source file or start a new robot.');
    const manifest = await response.json();
    if (!Array.isArray(manifest)) throw new Error('The example library has an unexpected format.');
    samples = manifest.filter(sample => typeof sample.name === 'string' && typeof sample.path === 'string');
    $('sample-select').replaceChildren();
    for (const sample of samples) { const option = document.createElement('option'); option.value = sample.path; option.textContent = sample.name; $('sample-select').append(option); }
    if (!samples.length) { const option = document.createElement('option'); option.value = ''; option.textContent = 'No examples available'; $('sample-select').append(option); }
    if (!restored && !robots.length && samples.length) {
      const initial = samples.slice(0, 2);
      const sources = await Promise.all(initial.map(sampleSource));
      if (!robots.length) {
        initial.forEach((sample, index) => addRobot(sample.name, sources[index], sample.path));
        selectRobot(robots[0]?.id);
      }
    }
    updateControls();
  } catch (error) {
    $('sample-select').replaceChildren(); const option = document.createElement('option'); option.value = ''; option.textContent = 'Examples unavailable'; $('sample-select').append(option);
    updateControls(); appError(error.message);
  }
})();
