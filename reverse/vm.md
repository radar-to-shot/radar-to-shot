# Virtual CPU recovery

The implementation in `src/vm.cpp` translates the interpreter in **CODE 3**.
Offsets below include the four-byte resource segment header. The original bytes
are retained in `reverse/original/resources/CODE_3.bin`, the assembly listing is
`reverse/disassembly/CODE_3.asm`, and Ghidra's generated C is
`reverse/decompiled/CODE_3.c`. Generated C is supporting evidence: the assembly
and execution under Musashi determine behavior, including Pascal stack returns.

| Original offset | Recovered purpose |
|---|---|
| `0d70` | Clear programmable state, preserving physical sensors |
| `0fd2`, `1020` | Reset in the running interpreter; error-reset accounting |
| `118c`, `11de`, `11f8` | Push value, push return PC, pop value |
| `124c` | Resolve an instruction operand |
| `135c` | Store accumulator, including device writes |
| `1a60` | Validate a jump target |
| `1a9c` | Enter time interrupt |
| `1af0` | Run one CPU slice |
| `1e86` | Opcode dispatch table |

## Program and machine layout

Each instruction is four bytes: unsigned opcode, unsigned operand mode, then a
big-endian signed 16-bit operand. The instruction address is an **instruction
index**, not a byte offset. All accumulator arithmetic wraps to signed 16 bits.

| Robot-record offset | Contents |
|---|---|
| `0010` | Instruction array |
| `1f54` | Maximum accepted jump index (compiler instruction count) |
| `1f56` | 19 signed words of device-register storage |
| `1f7c` | 201 signed words of variable memory, indices 0 through 200 |
| `210e`, `2110` | Saved PC and previous slice cycle surplus |
| `2112`, `2114` | Stack pointer and saved accumulator |
| `2116` | Interrupt-active byte |
| `2118` | 30-word stack; slot 0 holds interrupt-saved accumulator |
| `216c` | Radar result (separate from register 16's stored angle) |

Operand mode 1 reads a register, mode 4 directly reads variable memory, and mode
5 reads the variable whose index is in the selected variable. Other modes read
the literal operand; the compiler uses 2 for constants and 3 for labels.
Indirect target indices outside 0..200 cause a CPU reset. Direct indexing in
the executable is unchecked and wraps its indexed offset to 16 bits. Thus
`memory[-1]` and `memory[32767]` alias register storage 18, while `memory[201]`
aliases the saved PC in the robot record. These observed aliases are reproduced
without using out-of-bounds C++ indexing. Known CPU-record aliases are supported;
other attempts to access unmodeled application memory produce an explicit
`out_of_range` exception. This is a deliberate safety divergence, also reachable
from source because the original compiler accepts negative ALLOCATE counts.
Memory outside the modeled record is not portable application behavior.

The live PC and accumulator are locals during a slice. Reading the corresponding
record aliases sees their values at slice entry; writes to them are overwritten
when the slice returns. Target validation permits an index equal to the stored
instruction count. The native interpreter supplies the zero-filled remainder
of the original instruction buffer through index 2000 and guards accesses beyond
that buffer.

## Opcode semantics

All instructions increment PC before executing. Unless listed otherwise, each
costs one cycle. A failed conditional skips exactly the following instruction;
the compiler builds source-level conditionals from this mechanism and jumps.

| Opcode | Operation |
|---:|---|
| 0 | No operation |
| 1 | Load operand into accumulator |
| 2, 3, 4 | Add, subtract, multiply |
| 5, 6 | Signed divide, signed remainder |
| 7, 8, 9 | Bitwise AND, OR, XOR |
| 10, 11, 12 | Conditional equal, greater, less |
| 13, 14, 15 | Conditional greater-or-equal, less-or-equal, not-equal |
| 16 | Store accumulator |
| 17, 18 | GOSUB (push incremented PC), GOTO |
| 19, 20 | RETURN, ENDINT (also restore accumulator and permit interrupts) |
| 21 | TRACE; costs zero cycles, optionally breaks execution |
| 22 | RESET |
| 23..255 | Ignored, consuming one cycle |

Division by zero yields 32767 for a positive accumulator and **-32767 for zero
or a negative accumulator**. Remainder by zero yields zero. `-32768 / -1`
leaves -32768; `-32768 mod -1` produces **-1**. The latter is an observable
68000 `DIVS` overflow: the dividend remains unchanged and `SWAP` selects its
sign-extended high word. Native code preserves this result rather than using
C++ remainder for that case.

The stack pointer starts at 1, leaving slot 0 reserved. Push at pointer 30 causes
a reset; pop at pointer 1 or lower causes a reset and returns zero. A raw fixture
with pointer 0 can push into slot 0, matching the executable. A time interrupt
pushes the current PC, saves the accumulator in slot 0, sets the interrupt flag,
and costs one cycle before the slice starts executing instructions. Interrupts
are suppressed until ENDINT. The mask and transfer registers are 10 and 11.

RESET clears variable memory and programmable registers, but retains register
storage 0, 1, 3, 4, 7 and 9 (position, reload countdown, damage, fuel, population).
It sets the radar result to -1, resets PC, accumulator, stack pointer and
interrupt state, and clears stack slot 0. Other stack slots are retained. The
error-reset statistic has the executable's unusual comparison against the
already-incremented PC for explicit RESET.

The slice starts its consumed-cycle counter at zero. The caller must subtract
the previous slice's surplus from the next budget; the slice itself does not.
World operations add 10, 40 or 50 cycles to the normal instruction cost.
TRACE consumes zero cycles whether enabled or disabled. For host safety, native
slice budgets above 32000 and device extra costs outside 0..50 are rejected.
Normal game budgets are much smaller.

## Device and presentation boundaries

`RegisterBus` separates CPU behavior from the world. Its read/write calls expose
physical devices; begin/end-slice calls support clock updates and velocity
commit; reset preserves the original physical-state distinction. The raw-write
hook preserves direct-memory register aliases without invoking device controls.
The JSON fixture adapter connects these operations to `World`.

Registers 17 and 18 are handled by the CPU as RANDOM and STACK. RANDOM takes an
injected signed 16-bit QuickDraw random sample. The original computes signed
16-bit absolute value and then signed remainder by the stored range: the range
is exclusive, unlike the manual's inclusive wording. A zero range returns zero
without requesting a sample. The abstract bus deliberately does not invent an
implementation of Macintosh Toolbox Random; a host must supply one.

Instruction observer callbacks include the address, original instruction,
before/after accumulator, next PC, and cycle consumption. They support future
single stepping, source highlighting, tracing, or GUI debugger views without a
window-system dependency. `CpuState` can be copied for deterministic snapshots.

## Validation evidence

`tests/golden/vm.json` is generated by running the original CODE 3 entry point at
`1af0` under Musashi through `tools/oracle.py`; native results never generate the
expected values. Initial validation covered 1350 vectors, including all pairs of
nine signed boundary values for each arithmetic/comparison opcode, branches,
subroutines, interrupts, stack limits, resets and variable-address aliases. All
1350 matched the native JSON adapter after the direct-address aliases were
implemented. A further independent sweep of 153 device-write vectors matched
for all non-SANE-trigger registers with nine signed values each, covering shot
costs/reload, speed clamps, read-only writes, radar misses, and the original
negative-multiple-of-360 angle quirk. Those 153 cases are now in the committed
corpus, together with 25 RANDOM range/sample combinations and two targeted
radar/saved-PC alias regressions, for **1530 passing VM vectors**. RANDOM cases inject explicit signed Toolbox samples and execute the
original game instructions that process them; they do not validate the Toolbox
generator. The corpus may grow; its current count is reported by
`tests/validate_golden.py`.

These are routine-level executable observations, not a claim that arbitrary
whole-game battles, Toolbox random sequences, or unmodeled application-memory
accesses have been proven equivalent.

A further seeded exploratory differential run executed 700 short multi-instruction
programs with randomized initial PC, accumulator, memory and stack; all matched.
Those exploratory cases supplement the committed golden corpus.
