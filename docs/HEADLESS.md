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
The Mac UI, text editor, menus, sound and file dialogs are not reimplemented.
Presentation hooks are retained for a later GUI.
