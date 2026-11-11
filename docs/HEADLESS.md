# Robot Warriors 1.0.1 headless compatibility implementation

This repository now contains a C++20 library and command-line application,
extracted original application resources, 68k disassembly and Ghidra decompiled
C, and independently captured executable test vectors. The original source
repository is pinned in `reverse/original/manifest.json`.

The compatibility reference is the executable, including its integer arithmetic
and language quirks. The manual helps explain the program but is not used as a
substitute for observed behavior. Original copyright and attribution are recorded
in [extraction.md](../reverse/extraction.md). Generated decompiler output is an
analysis aid, not recovered original source or compilable replacement source.

## Build and run

The native build needs CMake 3.20+, a C++20 compiler, and Python 3 for the test
runner. The C++ library depends only on the standard library. The JSON header
used by the CLI is vendored, with its license in `third_party/nlohmann`.

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --parallel
ctest --test-dir build --output-on-failure
build/robotwar compile robots/examples/Seeker
build/robotwar battle robots/examples/Seeker 'robots/examples/Circle Shooter' --ticks 1000 --seed 1
```

## Battle scripts: native and original 68k

These matching runners take **2–5 robot source text files** in execution order
and output a single JSON document. They stop after a complete tick leaves at most
one survivor, or after `--ticks` ticks (default 1,000). Each tick represents 0.1
seconds of simulated time; execution does not wait for real time.

```sh
python3 scripts/run_headless_battle.py \
  robots/examples/Seeker 'robots/examples/Circle Shooter' \
  --seed 1 --ticks 1000 --output native.json

# One-time original-code emulator setup; requires Python 3.12+, a C compiler,
# Python development headers, and the patch utility.
python3 -m venv .venv
.venv/bin/python tools/build_patched_emulator.py

PYTHONPATH="$PWD/work/machine68k-patched" .venv/bin/python scripts/run_68k_battle.py \
  robots/examples/Seeker 'robots/examples/Circle Shooter' \
  --seed 1 --ticks 1000 --output original.json
```

Omit `--output` to write JSON to stdout; diagnostics go to stderr and failures
exit with status 2. The destination's parent directory must exist. The native
runner uses `build/robotwar` relative to the repository by default; `--binary`
selects another build. Both scripts work from other working directories when
given suitable paths. Input files are UTF-8 (with optional BOM); use
`--encoding mac-roman` for original Mac files. Both runners convert CR, LF and
CRLF line endings to original CR and pass identical Mac Roman bytes to their
respective parsers. Unrepresentable characters and sources longer than 32,767
bytes are rejected.

Both engines share the original seeded QuickDraw placement and random-number
stream. `--seed` accepts decimal or `0x` hexadecimal unsigned 32-bit values.
Seeds 0, 2147483647 and 4294967294 cannot place multiple robots in distinct
regions and are rejected. The tick limit must be between 0 and 1,000,000; zero
returns the initialized battlefield without executing a tick. Emulation is
substantially slower than native execution.

Results use `schema_version: 1` and include:

| Field | Meaning |
| --- | --- |
| `engine` | `headless` or `68k`; the only expected difference for identical inputs |
| `seed`, `rng_seed` | Input seed and final shared placement/CPU random seed |
| `tick_limit`, `tick` | Requested maximum and number of completed ticks |
| `termination` | `last_survivor`, `mutual_destruction`, or `tick_limit` |
| `winner` | Zero-based input index of the sole survivor, otherwise `null` |
| `alive` | Number of surviving robots |
| `robots` | Final CPU/world snapshots, in input order; `name` is the file basename |
| `events` | Empty; these runners do not collect presentation events |

Each robot includes its active flag, 19 registers, PC, accumulator, 201 memory
words, stack pointer, cycle debt, error-reset count, velocity, raw damage, shell
activity and `score` (the original win counter). Duplicate basenames are allowed;
use input indices for identity. A tick-limit result has no declared winner.

The emulated runner executes the original compiler, VM, initialization, movement,
projectile and battle-completion routines plus the supplied IIci ROM. It omits
the Mac desktop and presentation, including the GUI's 50-tick victory countdown.
The runners use the explicit tick limit and survivor rule above; they do not
apply the GUI's separate 300-tick damage-free cutoff.
At time zero, an original CPU call with zero budget refreshes `NUM_ROBOTS`
without executing virtual instructions, advancing a tick, or consuming random
numbers. It requires the explicitly selected patched
emulator above and checks its numerical backend before running; it does not
fall back to native game logic. See [emulation.md](../reverse/emulation.md) for
the platform boundary.

Run the script contract tests and full-state comparisons with:

```sh
python3 tests/test_battle_runners.py --binary build/robotwar
PYTHONPATH="$PWD/work/machine68k-patched" .venv/bin/python \
  tests/test_battle_runners.py --binary build/robotwar --emulator
```

Native script tests also run through CTest. CI runs them in both optimized and
sanitizer builds, and separately builds the patched emulator to compare results
from both engines, including seeded random reads and battles ending in deaths.

## Browser workbench and GitHub Pages

[Robot Warriors Lab](https://radar-to-shot.github.io/radar-to-shot/) compiles and
runs the same C++20 parser, compiler, CPU and world model in WebAssembly. Upload
UTF-8 or Mac Roman robot text files, choose any of the five standard samples,
edit source, and select 2–5 participants. Compiler diagnostics point back into
the editor. Workspace edits are saved in this browser's local storage; source
and battle requests are never uploaded to a server. Download source to keep an
independent copy.

**Watch battle** enables an original-style monochrome view of the live world,
including robots, gun/direction markers, shells, explosions, damage indicators
and destroyed robots. Its 1×/4×/16× settings change presentation pacing, not
physics. The worker advances the engine in bounded batches, so the page stays
responsive and Cancel can terminate a run. Disable Watch battle for fast tests.
Rendering uses new SVG presentation code; original Mac drawing routines are not
emulated. Watched results include `done` and a `view` payload in addition to the
same state returned by fast battles.

The complete [language reference](../web/docs/language.md) is rendered into the
page's HTML, including syntax, all 19 registers, the six-point hardware budget,
interrupts, memory, timing, world behavior, executable quirks, and a verified
starter. The [agent brief](../web/docs/agent-brief.txt) is both inline and available
as a plain text download. Agents can read these without executing JavaScript.
The page also provides the original manual PDF.

For browser automation or console-based experiments:

```javascript
await window.robotwar.ready();
const source = 'loop\ngoto loop\n';
const compiled = await window.robotwar.compile(source);
if (compiled.error) throw new Error(compiled.error);
const result = await window.robotwar.battle({
  robots: [{name: 'First', source}, {name: 'Second', source}],
  seed: 1,
  ticks: 1000
});
console.log(result.tick, result.alive, result.robots);
```

`compile()` and `battle()` normalize text and return the native JSON result;
compiler diagnostics remain `{error, error_position, ...}`, while protocol or
execution failures reject the promise. The public `battle()` always uses fast
execution. `cancel()` cancels pending work and starts a fresh worker; await
`ready()` before continuing. `request(object)` exposes the shared native JSON
protocol, including `source_hex` for exact Mac Roman bytes. A worker owns at most
one incremental session: `battle_start` uses ordinary battle parameters;
`battle_step` advances 1–100 ticks; `battle_stop` releases it. Start/step return
`done` plus `view` with robot/shell coordinates and current-batch events. Failed
starts clear any previous session. These session operations also work through
the native JSONL CLI, making browser presentation independently testable.

### Build and test the site

Use Emscripten **4.0.15**, CMake 3.20+, Python 3.12+, and Node 22+. The Emscripten
SDK bundles a suitable Node runtime. Install development dependencies in a local
environment; generated artifacts stay in ignored build directories.

```sh
git clone --depth 1 --branch 4.0.15 https://github.com/emscripten-core/emsdk.git work/emsdk
work/emsdk/emsdk install 4.0.15
work/emsdk/emsdk activate 4.0.15
. work/emsdk/emsdk_env.sh
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -r tools/requirements-web.txt
emcmake cmake -S . -B build-wasm -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF
cmake --build build-wasm --parallel
python tools/build_site.py --wasm-dir build-wasm --output build/site
node tests/validate_wasm.mjs --module build/site/wasm/robotwar.js
python -m playwright install chromium
python tests/test_browser.py --site-dir build/site
python -m http.server 8000 --directory build/site
```

Open `http://localhost:8000/`; module workers require HTTP(S), not `file://`.
On Linux, Playwright may also need its documented browser system dependencies
(`python -m playwright install --with-deps chromium`). To use an existing local
Chromium installation, pass `--browser /path/to/chromium` to the browser tests.
The site uses relative asset paths and works at a repository Pages URL without
custom response headers, remote JavaScript dependencies, or a backend service.

The WASM test replays all 7,014 original-code golden vectors, tests recoverable
errors and incremental session behavior, and can additionally compare full
native battles with `--native build/robotwar`. Browser tests run at a repository
URL prefix and exercise uploads, sample selection, compilation, fast/live parity,
cancellation, exports, mobile layout and static documentation. Screenshots are
written under `build/browser/`. The generated `build-manifest.json` records
revision, toolchain version and static asset hashes. WASM memory is capped at
256 MiB and browser requests at 512 KiB; rendering needs no SharedArrayBuffer or
cross-origin isolation.

### Publishing

`.github/workflows/pages.yml` builds and tests the site for relevant pushes and
pull requests. PRs get a downloadable `web-preview` artifact and never deploy.
Successful pushes to the default branch publish through GitHub Pages. A manual
**WebAssembly site** run can publish its selected ref only when **deploy** is
explicitly checked; this supports intentional publication of a tested ref.
The workflow must first exist on the default branch for GitHub to accept manual
dispatches; initial publication of this new workflow follows its merge.
Deployment uses the `github-pages` environment and remains subject to its branch
and approval policies. Only the deployment job receives Pages/OIDC permissions.

The repository's Pages source must be configured as **GitHub Actions**. Once
configured, no hosting credentials or external service are required. Build logs,
WASM validation and browser screenshots are retained as workflow artifacts.

## Tournaments

For weekly ratings across the entire `robots/` tree, including 3-, 4- and 5-way
battles and Discord publication, see [the weekly league](WEEKLY_LEAGUE.md).
It recomputes Bradley–Terry ratings on an Elo scale from the current scripts;
the tournament below instead ranks head-to-head results using exact points.

The **Robot tournament** GitHub Actions workflow runs all robot source files in
a selected subdirectory of `robots/`. In **Actions → Robot tournament → Run
workflow**, set `robots_subdir` to, for example, `examples` or `my-team`. Paths
are relative to `robots/`; nested directories are supported. Automatic push and
pull-request runs use `examples` when robot examples, engine code, scripts,
tests, or the workflow change.

The workflow builds the native C++ engine in Release mode, runs CTest, and then
executes the tournament. It publishes standings in the job summary and uploads
`results.json`, `summary.md`, and diagnostic logs as a
`tournament-<run-id>-<attempt>` artifact retained for 30 days. The native engine
is used for tournament throughput; its original-code compatibility tests remain
in the separate headless workflow.

Run the same tournament locally after building the engine:

```sh
python3 scripts/run_tournament.py --robots-dir robots/examples \
  --seed 1 --ticks 2000 --seeds-per-pair 3 --workers 2 \
  --output build/tournament/results.json \
  --summary build/tournament/summary.md
```

Every regular, nonhidden file below the selected directory is treated as a robot
source, including files without an extension. Relative paths identify entrants,
so equal basenames in different nested directories remain distinct. Symbolic
links are rejected. UTF-8 is the default; `--encoding mac-roman` supports original
Mac text files. Both use the battle runners' line-ending normalization. All
entrants must compile before any scored battle starts; invalid robots are not
silently excluded or assigned forfeits. Reports must be outside `robots/`.

### Tournament structure and fairness

This determines the **head-to-head all-round winner** against the field. Robot
Warriors can have nontransitive matchups, so the format avoids knockout
elimination and keeps every entrant competing. Multiplayer free-for-all strength
is a different objective and is not inferred from this ranking.

| Field | Automatic format | Pairings |
| --- | --- | --- |
| 2–16 robots | Full round robin | Every unordered pair exactly once |
| 17–512 robots | Swiss | `min(N − 1, 2 × ceil(log₂ N) + 1)` rounds, `floor(N/2)` pairs per round |

`--format round-robin` can force exhaustive play for a larger field within the
work budget. `--format swiss --rounds R` chooses an explicit Swiss round count
from 1 through `N − 1`; zero selects the automatic count. Round robin always
requires `--rounds 0`. Odd-sized Swiss fields require at least two rounds so
every entrant actually plays; a one-round bye would otherwise leave one robot
unassessed. There is no qualifying cutoff or knockout final: the
standings use every round. Swiss battle count grows as `N log N`, while small
fields get exhaustive opponent coverage.

Each pairing is a series of **six battles by default**: three seed blocks, each
played in both robot orders. Reversing order with the same seed swaps starting
positions and CPU execution priority. All pairings in a round use the same seed
blocks. The tournament seed deterministically derives both scheduling priority
and valid QuickDraw seeds; worker count does not affect the schedule or results.
`--seeds-per-pair` changes the number of blocks, not the two-order balancing.

Wins earn 1 point, losses 0, and draws ½ per battle. A tick-limit result with both
robots alive and mutual destruction are draws; remaining damage or fuel does
not invent a winner. The configured tick limit defaults to 2,000, using the
headless battle termination rules documented above. All game points count,
rather than reducing a six-game series to one win/loss result.

Swiss pairings prefer nearby scores and unused opponents. An exact general-graph
maximum matching minimizes repeated opponents for the selected bye assignment;
any unavoidable repeats are recorded in the schedule. Score proximity is a
local preference, not a promise of a globally minimal score gap. For odd fields,
the robot with the fewest prior byes, then the lowest score, receives the bye;
seeded priority resolves an otherwise equal choice. A Swiss bye awards half a
series's available points but creates no wins, draws, games, or artificial
opponent. Round-robin rest rounds award no points; every robot still plays every
other robot equally.

Standings compare the following in order:

1. Total game points, including neutral Swiss bye credit.
2. Average final point total of actual opponents, counting each played series.
3. Average of `opponent final points × fraction of series points earned` over
   those series.

Byes are excluded from both opponent metrics. All entrants have the same number
of scheduled rounds, so scaling opponent totals by the round maximum would not
change their ordering. Metrics use exact rational arithmetic, with fractions
included in JSON. Equal metrics produce shared ranks and **joint winners**;
names, random priority, and row ordering never break a competitive tie. Swiss
samples opponents rather than proving superiority against every robot. More
rounds or exhaustive round robin can increase coverage.

### Replay, failures, and scale

Results include the entrant paths and raw/normalized source hashes, native binary
hash, configuration, every pairing and bye, seeds, robot order, win/draw reasons,
compact final CPU/world state, and hashes of complete battle snapshots. A game
can be replayed with `scripts/run_headless_battle.py` using its recorded order,
seed and tick limit; tournament names are paths relative to the chosen directory.
`state_sha256` hashes the raw native JSONL result with sorted keys, compact JSON
separators and ASCII escaping; exact hash replay must retain those relative
robot names, rather than the standalone file runner's basenames and envelope.
The tournament JSON uses `schema_version: 1`, `champions` for all joint winners,
and `winner` only when there is exactly one champion. Identical inputs and binary
produce identical result JSON, including when worker count changes.

At 512 entrants the default 19-round Swiss tournament requires **29,184 battles**,
compared with 784,896 for a six-game full round robin. The runner prints projected
work before preflight and limits a run to 512 robots, 100,000 battles, and
200,000,000 possible simulated ticks. Seed blocks are limited to 1–20, workers
to 1–32, and per-battle ticks to 1–1,000,000. Each native process has a 30-second
timeout; the CI job has a 60-minute limit. These bounds fail explicitly instead
of silently truncating a tournament.

Compilation or runtime failure returns exit status 2 and writes a report marked
`failed`, with no winner or final standings. Completed series are retained for
diagnosis; a partially executed series never contributes points. Once output
paths have been validated, source/configuration failures replace old reports
with failed reports, preventing stale winners. Argument parsing and invalid
output paths fail before reports can be written. CI also retains
logs if validation fails or the job is interrupted. `tests/test_tournament.py`
checks pairing optimality against exhaustive small cases, 512-robot scheduling,
scoring, byes, seed/order balance, reproducibility, failure handling and real
native execution; it also runs through CTest.

## Lower-level JSON interface

The `battle` command returns a JSON snapshot after the requested number of
0.1-second battlefield ticks. Its seeded QuickDraw random generator and five
starting-region placement policy are validated against original ROM and
application code, including random-word consumption. A maximum of five robots
is supported. The JSON interface also accepts explicit initial coordinates for
every robot; omit all coordinates to use original random placement. The library
lets a caller supply positions and its own signed 16-bit random samples.

A degenerate random source that cannot select enough distinct regions fails
after 65,536 attempts rather than hanging the host; the original can loop
indefinitely in that situation. Seed zero with multiple randomly placed robots
is one example. Explicit placement remains available with that seed.

`robotwar jsonl` accepts one JSON request per line and returns one JSON result.
Its operations include `parse`, `compile`, `vm`, the `world_*` fixture operations,
and `battle`. The committed golden files are complete examples of the fixture
protocol. A custom battle request looks like:

```json
{"kind":"battle","ticks":100,"seed":1,"events":true,"robots":[{"name":"stationary","x":50,"y":50,"source":"loop\rgoto loop\r"}]}
```

For battles, `stop_when_finished: true` stops when at most one robot remains;
`include_rng_seed: true` includes the final random seed. Both default to false
for fixture compatibility. Each robot accepts either a JSON `source` string or
`source_hex` containing the original source bytes as hexadecimal, but not both.
The file runners use `source_hex` to preserve Mac Roman bytes through JSON.

`compile` returns original instruction bytes as hexadecimal, the attribute
record, diagnostic text and original error cursor. CR is the original source
line ending; LF and CRLF are accepted by the native compiler as a documented
portability extension. The low-level scanner exposes original byte-oriented
behavior. Original source uses Mac Roman; the fixture corpus uses ASCII source
except where byte-character handling is explicitly tested.

## C++ formatting

Project C++ follows LLVM style with two-space indentation and a 100-column
limit, configured in `.clang-format`. Use the pinned clang-format 20.1.8 so local
formatting and CI produce the same result:

```sh
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -r tools/requirements-format.txt
python tools/format_cpp.py --check
python tools/format_cpp.py --write
```

The check covers tracked and new unignored C/C++ sources, headers, and `.inc`
files, including the generated sine table. Its generator uses the same formatter.
Hash-attested decompiler output under `reverse/decompiled/` and the upstream
`third_party/` dependency retain their original formatting. The C++ formatting
workflow runs the check on every push and pull request and fails on drift.

## Library and GUI extension points

- `compile()` produces `Program`, bytecode, source locations and diagnostics.
- `scan_token()` exposes the original context-dependent scanner. The caller
  supplies its byte cursor and whether an operand has already been parsed.
- `VirtualCpu::run()` operates on a copyable `CpuState`. `RegisterBus` injects
  physical devices and random samples. Instruction observers expose before/after
  state, instruction addresses and cycle costs.
- `World` owns fixed-point robot state, movement, collision, sensors, projectiles,
  damage and scoring. Its event sink reports shots, explosions, collisions,
  destruction and fuel exhaustion. Its state and snapshot types contain no GUI
  objects.
- `Simulation` joins compiled programs, CPUs and the world. `step()` advances one
  battlefield tick; `snapshot()` returns copies suitable for a renderer or
  inspector. A GUI can own the event loop, pause between steps and attach trace
  and world-event callbacks. CPU instruction stepping is also available through
  `VirtualCpu::run()` with a one-cycle budget.

The core performs no windowing, sleeps, wall-clock reads or filesystem access.
The host is responsible for synchronizing access if it uses multiple threads.
The JSON command layer is separate from the library. Malformed addresses outside
modeled original records raise explicit errors instead of accessing host memory.

## Extract, disassemble, decompile and recapture

Use Python 3.12+, a C compiler, development headers, and the `patch` utility
for emulator regeneration. Use a local Python environment:

```sh
python3 -m venv .venv
. .venv/bin/activate
pip install -r tools/requirements-reverse.txt
python tools/extract_original.py
python tools/disassemble.py
python tests/test_extraction.py
python tools/build_patched_emulator.py
export PYTHONPATH="$PWD/work/machine68k-patched"
python tests/test_fpu_remainder.py
python tests/test_fpu_status.py
python tools/recapture_all.py
```

Golden regeneration uses an isolated, explicitly selected emulator build. Its
pinned patch fixes 68881 remainder quotient bits and floating-point status
propagation needed by the original ROM SANE packages. Independent instruction
tests run during installation. The invoking Python environment is not replaced.
See [emulation.md](../reverse/emulation.md) for the exact platform boundary.
Ghidra decompilation is a separate optional development operation; see
`reverse/decompiled/README.md` and `tools/decompile.sh`. The native build and
normal golden tests do not require Ghidra, an emulator, a ROM boot or Python
emulation dependencies.

`tools/oracle.py` loads the original CODE resources and A5 jump table into a
Musashi 68000 emulator. It executes the original application routines and Pascal
runtime with controlled inputs and records their outputs. It is a routine-level
execution environment, not a booted System 7 desktop. Unsupported Toolbox calls
and instruction-budget exhaustion fail the capture. Explicit platform shims are
listed in oracle provenance; they must be considered when interpreting results.

`tests/validate_golden.py` compares complete C++ output objects against committed
observations. It never derives or rewrites expected outputs. Generator scripts
are the only route to recapture observations. Corpus provenance records CODE
hashes, emulator identity, instruction counts and platform calls. Seeded
compiler fuzzing is available through `tests/fuzz_compiler.py`.

For memory and undefined-behavior checks:

```sh
cmake -S . -B build-sanitize -DROBOTWAR_SANITIZERS=ON -DCMAKE_BUILD_TYPE=Debug
cmake --build build-sanitize --parallel
ctest --test-dir build-sanitize --output-on-failure
```

## Evidence and compatibility limits

The component analyses describe recovered entry points, layouts, quirks and
coverage: [compiler/parser](../reverse/compiler.md), [virtual CPU](../reverse/vm.md),
and [world](../reverse/world.md). The [machine-readable validation report](../reverse/validation.json) records
7,014 passing golden vectors, reproducible original captures, optimized and sanitizer
builds, extraction checks, and 737 independent emulator instruction checks. The
12 battle-runner fixtures were captured twice with identical bytes; the original
7,002 fixtures retain their previously verified clean recapture. Golden tests establish agreement for their
inputs; they are not a proof over every robot program or battlefield state.

World captures execute the supplied IIci ROM geometry and SANE package routines
alongside the original application. The numerical path uses extended-precision
SoftFloat operations; host transcendental routines are excluded. Direct ROM
observations also validate the native integer radar-angle calculation and the
original sine lookup table. Compiler decimal formatting is separately checked
against the original ROM. Rendering-only PenSize is a no-op, and random samples
and random seeds or explicit initial positions are controlled inputs.

This is the supplied IIci ROM baseline, not a booted System 7 environment or a
claim of exhaustive 68881 hardware equivalence. System 7 replacement packages and
GUI startup behavior are outside that claim. The supplied QuickDraw random
generator and region-placement policy are independently validated against
original code, including zero and signed-word boundary behavior.
The original Mac UI, text editor, menus, sound and file dialogs are not
reimplemented. The browser workbench uses the presentation hooks to provide
its own editor and live battlefield view.
