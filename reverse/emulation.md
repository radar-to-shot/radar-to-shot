# Original-code emulation oracle

`tools/oracle.py` loads the extracted Robot Warriors 1.0.1 `CODE` resources into
Musashi through `machine68k==0.5.1`. It executes original Motorola 68000
instructions. It does **not** substitute native parser, compiler, virtual CPU,
motion, collision, radar, or weapon implementations when generating expected
outputs. The C++ executable is only used by the separate validation runner.

This is routine-level application emulation, not a booted Macintosh System 7
session. The supplied Mac ROM and operating-system image are not executed by the
oracle. Macintosh platform services are explicit harness dependencies below.

## Loader and calling convention

* CODE1..5 are loaded at `0x100000 + segment * 0x10000`, retaining their four-byte
  resource headers. Thus resource offset `0x24dc` in CODE5 executes at `0x1524dc`.
* A5 is `0x800000`. The original CODE0 jump table supplies segment/offset pairs;
  the loader installs absolute JMP entries at the corresponding A5 offsets.
  Application CODE bytes themselves are unchanged.
* Below-A5 storage is initialized from the extracted compressed DATA/ZERO
  resources. The four editor-control constants written by CODE2 startup at
  `02f4..0306` are installed: CR=13, backspace=8, TAB=9, enter=3. This matters:
  omitting the TAB initializer incorrectly makes valid tab whitespace illegal.
* Calls use the recovered Pascal stack convention: return address, arguments in
  stack order, then caller-reserved result storage. A return sentinel stops the
  emulator and verifies the callee removed the expected argument bytes.
* General registers, globals and fixture buffers are reset between independent
  cases. Integrated cases deliberately retain state between ticks.
* Execution outside the extracted CODE ranges and relocated jump table fails.
  Unknown A-line traps fail. A bounded cycle budget prevents hangs.
* At capture completion, `provenance()` compares **guest memory** for every CODE
  segment against the extracted file bytes. SHA-256 values, instruction counts,
  visited segments, and encountered platform traps are stored in the corpus.

The startup sine-table loop is executed from original CODE2 `0088..0108` when
needed. An instruction hook stops at the end of that loop before GUI-dependent
startup continues. No instruction bytes are patched for this checkpoint.

## Platform services and confidence boundaries

The final numerical and geometry captures execute the **supplied Mac IIci ROM**
through `tools/platform_sane.py`, including PACK4/5/7 and the original QuickDraw
trap routines. The ROM SHA-256 and executed package offsets are recorded. The
original application, ROM packages, startup sine loop, and Pascal helper code all
execute unchanged. No host `sin`, `sqrt`, `atan`, or rectangle calculation supplies
the expected output in these captures.

| Service | Authoritative capture behavior |
|---|---|
| SANE FP68K / Elems68K | Original ROM PACK4/5, extended80 arithmetic through Musashi/SoftFloat |
| QuickDraw `PtToAngle` | Original ROM integer angle routine |
| `OffsetRect`, `SectRect`, `EqualRect`, `PtInRect` | Original ROM integer geometry |
| Pack7 `NumToString` | CPU-only compiler captures use the explicit decimal-format shim; platform verification crosschecks against original ROM PACK7 |
| QuickDraw `PenSize` | Consume presentation-only arguments; no rendering is performed |
| QuickDraw `Random` in VM fixtures | Return explicit `random_words` fixture inputs; tests establish game range processing, not a Macintosh RNG sequence |

The host-math implementation in `tools/world_platform.py` was used during initial
analysis. It remains an explicit diagnostic fallback and base for the presentation
stub; final ROM captures override all numerical and integer-geometry handlers.
The final platform provenance distinguishes every external service actually used.

The upstream emulator had defects that would invalidate numerical goldens: missing
FREM quotient bits made the original sine routine choose the wrong quadrant;
missing SoftFloat-to-FPSR exception propagation made the original Pascal rounding
helper truncate. The isolated, reproducible patch additionally preserves the
extended range of FINT/FINTRZ and prevents FCMP from reporting arithmetic exceptions
from its internal comparison subtraction. The patch is validated separately from
the game with **598 exact-rational remainder/quotient cases and 139 FPU
status/rounding cases**. It does not patch the application or ROM.

This validates the original IIci ROM baseline, **not a booted System 7 replacement
package set** or every possible 68881 instruction/exception. Known emulator limits
include nonextended FPCR precision modes and signaling-NaN exception classification;
`tests/test_fpu_status.py --audit` records those limits. The ROM bridge records
FPCR writes and rejects unsupported precision or enabled exception traps. All
captured numerical routines use the validated extended-precision, masked-exception
path. Guest executable bytes are checked for accidental mutation after capture.

## Reproduce and validate

Create a Python virtual environment and install `tools/requirements-reverse.txt`,
then build the isolated corrected emulator and select it explicitly:

```sh
python tools/build_patched_emulator.py
export PYTHONPATH="$PWD/work/machine68k-patched"
python tests/test_fpu_remainder.py
python tests/test_fpu_status.py
python tools/platform_sane.py
```

The installer checks a pinned source archive SHA-256, applies the reviewed patch,
builds in a separate virtual environment, installs to a separate module directory,
and runs both CPU-level suites. It never replaces the invoking environment's
packages. Then run the generators from the repository root:

```sh
python tools/generate_parser_vectors.py
python tools/generate_compiler_vectors.py
python tools/generate_vm_vectors.py
python tools/generate_world_vectors.py
python tools/generate_movement_vectors.py
python tools/generate_world_io_vectors.py
python tools/generate_shell_vectors.py
python tools/generate_battle_vectors.py
```

Generator output is stored under `tests/golden/`. These commands
must remain separate from routine C++ tests: ordinary tests consume committed
expected outputs and never regenerate them.

```sh
python tests/validate_golden.py --binary build/robotwar
```

The integrated battle generator compiles source using CODE5, initializes CPU
state with CODE3, executes the original CPU with per-tick budgets and cycle debt,
and advances the original motion/collision and shell-flight/blast routines. Fixed robot placement is
an explicit fixture input. It covers interrupts, register aliases, coordinate
conversion, radar, resets, repeated shots, moving targets, and multiple CPUs over
successive ticks; it does not
silently replace these actions with native-engine output.
