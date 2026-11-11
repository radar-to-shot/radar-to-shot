# Robot Warriors language reference

Robot Warriors programs are small text programs for the 1991 game by Steven Miller and Dean Ouchida. They are not JavaScript, BASIC, C, or a modern scripting language. This reference describes the recovered Robot Warriors 1.0.1 executable and the compatible headless engine used by this project.

Start with the complete program below, compile it, and test it against several opponents and seeds. The original [Robot Warriors manual](original-manual.pdf) remains available as an additional reference. The [agent brief](agent-brief.txt) packages the essential instructions as plain text for a coding agent.

[TOC]

## Quick start: a complete robot

Save this as a plain text file, for example `Compass Scout`. Its seven attributes cost six points in total. It moves, turns away from walls, scans, and fires when the gun is ready. It is a readable baseline, not a claim of competitive strength.

```text
; Compass Scout: a small, readable starting point.
CPU_SPEED 1
ENGINE_SIZE 1
FIRE_RATE 2
RADAR_RANGE 1
ARMOR 1

ALLOCATE target

90 TO DIRECTION
40 TO SPEED

patrol
    IF X < 20 THEN 90 TO DIRECTION
    IF X > 360 THEN 270 TO DIRECTION
    IF Y < 20 THEN 180 TO DIRECTION
    IF Y > 290 THEN 0 TO DIRECTION

    IF SPEED = 0 THEN
        DIRECTION + 90 TO DIRECTION
        40 TO SPEED
    END

    AIM + 2 TO AIM
    AIM TO RADAR
    RADAR TO target
    IF target > 20 THEN
        IF SHOT = 0 THEN target TO SHOT
    END
GOTO patrol
```

This exact source compiles to 49 instructions, including the compiler's final RESET. The attribute array in compiler output is `[1,2,1,1,0,0,1]`: CPU, fire rate, engine, radar range, fuel capacity, cloaking, armor.

In the browser, paste the source into an editor or upload its text file, compile it, select two to five robots, choose a seed and tick limit, and run a battle. Inspect the result before changing the program. Keep the same opponents, order, seed, and tick limit when comparing a change.

## Source format and names

- Keywords, register names, labels, variables, and named constants are case-insensitive: `Aim`, `AIM`, and `aim` mean the same thing.
- Identifiers begin with an ASCII letter and continue with ASCII letters, digits, or underscores. Only the first **15 characters** are significant. Choose distinct short names. An initial underscore is not allowed.
- A label is an identifier on its own line. Do not add a colon. Forward references to labels are supported.
- A semicolon starts a comment through the end of that line. It does not separate statements.
- Spaces and tabs are whitespace. Indentation is for readability; it does not define blocks.
- Use one statement per line, except for the documented single-line IF form. End the file with a newline.
- Original files use Mac Roman bytes and carriage-return (CR) line endings. The native compiler also accepts LF and CRLF. The text-file battle runners accept UTF-8 by default, normalize line endings to CR, and require that the text can be represented in Mac Roman. Their `--encoding mac-roman` option reads original files directly. Plain ASCII code is the most portable choice.
- Source files must fit within 32,767 normalized bytes when using the original compiler/file runners.

All names in the register, attribute, operator, and statement tables are reserved. So are the built-in constants `XMAX`, `YMAX`, and `SHOT_SPEED`. There are no strings, arrays with square-bracket syntax, functions with argument lists, or general-purpose I/O statements.

## Grammar at a glance

This grammar shows the intended programming forms; the compatibility notes later describe executable quirks that should not be used as ordinary language features.

```text
identifier       = letter { letter | digit | "_" }
number           = [ "+" | "-" ] decimal_digits
operand          = number | register | variable | constant | label
                 | "&" variable | variable "^"
expression       = operand { arithmetic_operator operand }
condition        = expression comparison_operator operand
assignment       = expression "TO" destination { "TO" destination }
destination      = writable_register | variable | variable "^"

"ALLOCATE" identifier [ positive_count ]
"DEFINE" identifier number
attribute number
identifier                         ; label, on its own line
assignment
"GOTO" label_or_computed_target
"GOSUB" label_or_computed_target
"RETURN"
"RESET"
"ENDINT"
"TRACE"
"IF" condition "THEN" simple_statement
"IF" condition "THEN" newline statements [ "ELSE" newline statements ] "END"
"WHILE" condition "DO" newline statements "END"
"REPEAT" newline statements "UNTIL" condition
```

A unary sign must touch a decimal literal, as in `-12`. It is allowed at the beginning of an expression and for a literal comparison operand, not before a variable or after an arithmetic operator. Use `0 - value` to negate a value. For example, `1 + -2 TO n` is invalid; `1 - 2 TO n` is valid.

## Variables, constants, and assignment

`ALLOCATE` reserves zero-initialized variable memory. The optional count reserves consecutive words; the name refers to the first word. Use positive counts and no more than 200 allocated words. Variables are reset to zero at the beginning of a battle and whenever the CPU resets.

```text
ALLOCATE counter
ALLOCATE samples 10
ALLOCATE pointer
DEFINE safe_distance 24

0 TO counter
counter + 1 TO counter
safe_distance TO AIM
0 TO SPEED TO CLOAK
```

A chain of `TO` destinations stores the same accumulator value into each destination. Device side effects do not replace that value. For example, `AIM TO RADAR TO target` stores the **angle** in `target`; it does not store the radar result. Use two statements to read the result:

```text
AIM TO RADAR
RADAR TO target
```

The safe, ordinary form of `DEFINE` assigns a numeric literal. It cannot compute an expression or refer to a user-defined constant. Built-in numeric constants also work; register aliases are an executable extension described below.

| Built-in constant | Value | Meaning |
| --- | ---: | --- |
| `XMAX` | 381 | Right battlefield boundary, not the maximum safe robot-center X |
| `YMAX` | 313 | Bottom battlefield boundary, not the maximum safe robot-center Y |
| `SHOT_SPEED` | **18** | Actual compiled constant: distance per 0.1-second tick; the manual describes 180 metres/second |

## Arithmetic and comparisons

All arithmetic operates on signed 16-bit words. Values wrap modulo 65,536 after operations: `32767 + 1` becomes `-32768`. Decimal literal magnitudes may not exceed 32767, so the literal `-32768` is rejected even though that value can result from arithmetic.

| Operator | Operation |
| --- | --- |
| `+`, `-`, `*`, `/` | Addition, subtraction, multiplication, signed integer division |
| `MOD` | Signed remainder |
| `AND`, `OR`, `XOR` | Bitwise operations, not short-circuit Boolean operators |

There is **no precedence** and no parentheses. `2 + 3 * 4` means `(2 + 3) * 4` and produces 20. Use temporary variables when another evaluation order is required. Integer division truncates toward zero; ordinary remainder has the dividend's sign.

Comparisons are `=`, `<>`, `<`, `>`, `<=`, and `>=`. A condition permits an expression on the left and a **single operand** on the right. `IF X + 10 > edge THEN ...` is valid; `IF X > edge - 10 THEN ...` needs a temporary variable or a rewritten left-hand expression. Combine conditions with nested IF blocks; there is no Boolean-expression `AND` syntax.

Observed arithmetic corner cases:

- Division by zero returns 32767 for a positive accumulator, and -32767 for zero or a negative accumulator.
- `MOD 0` returns zero.
- The runtime value `-32768 / -1` remains -32768 after wrapping.
- The runtime value `-32768 MOD -1` produces -1 because of the original 68000 division-overflow behavior.

Avoid accidental overflow, division by zero, and negative random ranges in a normal robot. They are deterministic compatibility behavior, not useful substitutes for explicit bounds checks.

## Labels, calls, and control flow

Use `GOTO label` for an unconditional branch. A variable, register, named constant, or indirect variable can supply a computed instruction address. Direct numeric literals in GOTO or GOSUB are rejected; use labels rather than hard-coded addresses. Program addresses are zero-based instruction indices, not source-line numbers or byte offsets.

`GOSUB label` pushes a return address. `RETURN` pops it. A standalone RETURN without a matching call underflows the stack and resets the CPU. Falling off the end of the program executes an automatically appended RESET, so a long-running robot should end its main path with a deliberate loop.

```text
ALLOCATE count

again
    GOSUB increment
GOTO again

increment
    count + 1 TO count
RETURN
```

The single-line IF form can perform an assignment, GOTO, GOSUB, RETURN, RESET, or ENDINT. Do not nest another IF on the same line. TRACE is also accepted by the executable, but has a removal quirk described later.

```text
IF RADAR > 20 THEN RADAR TO SHOT
IF SHOT = 0 THEN GOSUB fire_when_safe
```

Block IF, WHILE, and REPEAT forms can be nested to a maximum depth of 15. `END` closes IF or WHILE; it does not terminate the robot. REPEAT is closed by UNTIL, whose true condition exits the loop.

```text
IF SHOT = 0 THEN
    IF RADAR > 20 THEN
        RADAR TO SHOT
    END
ELSE
    AIM + 2 TO AIM
END

WHILE RADAR < 0 DO
    AIM + 2 TO AIM
    AIM TO RADAR
END

REPEAT
    AIM + 2 TO AIM
    AIM TO RADAR
UNTIL RADAR > 0
```

Busy loops consume CPU cycles but do not advance a robot's physical position until the world tick is updated. A loop waiting for a physical event may therefore run across many ticks.

## Registers: all 19 devices

Angles are degrees clockwise from up: 0 up, 90 right, 180 down, 270 left. Positions and shot distances are integer metres in the battlefield coordinate system; Y increases downward. The register IDs below match raw JSON snapshot array indices.

| ID | Register | Read | Write and important behavior |
| ---: | --- | --- | --- |
| 0 | `X` | Current robot-center X | Read-only; ordinary writes are ignored |
| 1 | `Y` | Current robot-center Y | Read-only; ordinary writes are ignored |
| 2 | `AIM` | Current gun angle | Set gun angle; independent of travel direction and radar scan angle |
| 3 | `SHOT` | Reload countdown in ticks; zero means ready | Fire the written distance along AIM if ready; otherwise ignore the write |
| 4 | `DAMAGE` | Damage percent, 0–100 | Read-only; at 100 the robot is destroyed |
| 5 | `SPEED` | Commanded speed, not instantaneous velocity | Clamp to 0–20 or 0–40 m/s according to ENGINE_SIZE; requires fuel |
| 6 | `DIRECTION` | Commanded travel angle | Set travel direction; does not aim the gun |
| 7 | `FUEL` | Remaining fuel units | Read-only; no refuelling instruction |
| 8 | `CLOAK` | Stored cloak command, zero off/nonzero on | Requires CLOAKING 1 and fuel; nonzero hides the robot from aiming radar |
| 9 | `NUM_ROBOTS` | Number of other surviving robots | Read-only; counts cloaked opponents and excludes this robot |
| 10 | `TIME_INT_MASK` | Interrupt-enable command | Zero disables time interrupts; nonzero enables them |
| 11 | `TIME_INT_XFER` | Interrupt routine's instruction address | Store a label address before enabling interrupts |
| 12 | `X_CONV` | Conversion X component | Store X without triggering conversion |
| 13 | `Y_CONV` | Conversion Y component | Store Y **and trigger rectangular-to-polar conversion**, setting ANGLE_CONV and DIST_CONV |
| 14 | `ANGLE_CONV` | Conversion angle | Store angle without triggering conversion; unlike AIM, it is not normalized on write |
| 15 | `DIST_CONV` | Conversion distance | Store distance **and trigger polar-to-rectangular conversion**, setting X_CONV and Y_CONV |
| 16 | `RADAR` | Most recent detected distance, or -1 if no target | Scan at the written angle immediately; does not change AIM |
| 17 | `RANDOM` | A new pseudo-random number on each read | Set an **exclusive** range N; for positive N, reads produce 0 through N-1. Writing does not set the RNG seed |
| 18 | `STACK` | Pop and return the top stack value | Push the written value. This is not a stack-depth sensor |

Read-only register writes are generally accepted by the compiler and ignored by the device. They are not a way to move, heal, or refuel a robot. There are no `VX` or `VY` source-language registers; estimate motion from sampled positions if needed.

AIM, DIRECTION, and RADAR writes normalize angles. A legacy edge case maps negative exact multiples of 360 to **360**, rather than zero. Prefer keeping working angles in 0–359 with nonnegative arithmetic.

Raw JSON registers are stored device words, not the result of executing every read operation. In particular, raw `registers[16]` is the last scan angle, `registers[17]` is the configured random range, and raw `registers[18]` is not the top of the stack. The source-language reads have the special semantics above; use CPU memory or explicit observations to inspect sampled values.

## Robot attributes and the six-point budget

Declare hardware with `ATTRIBUTE points`. Unspecified attributes are zero. Each value must be within its individual limit, and the sum of all seven values must be at most **6**. An attribute name is not a numeric constant you can use in expressions.

| Attribute | Legal points | Result by point value |
| --- | --- | --- |
| `CPU_SPEED` | 0–2 | 0: 1,000 cycles/s; 1: 2,000; 2: 4,000 |
| `FIRE_RATE` | 0–4 | Reload delays 28, **20**, 15, 11, 7 ticks: 2.8, **2.0**, 1.5, 1.1, 0.7 seconds |
| `ENGINE_SIZE` | 0–1 | 0: maximum commanded speed 20 m/s; 1: 40 m/s; component acceleration doubles |
| `RADAR_RANGE` | 0–2 | 200, 310, or 500 metres; detection uses a strict range comparison |
| `FUEL_CAPACITY` | 0–2 | Start with 1,850, 2,500, or 3,200 fuel units |
| `CLOAKING` | 0–1 | 0: unavailable; 1: CLOAK can hide the robot from aiming radar |
| `ARMOR` | 0–5 | Raw damage capacity 100, 115, 130, 145, 165, or 200 |

The original manual's `CPU_SPEED` example says 0–3 in one place; the executable allows **0–2**. It also gives FIRE_RATE 1 as 2.1 seconds; the observed executable delay is **2.0 seconds**. A gun may still wait longer if its existing shell has not completed its flight.

## Time, CPU costs, interrupts, and reset

One world tick is **0.1 simulated seconds**. A tick refreshes reload/population state, runs the robots' CPU slices in input order, then updates the physical world. Fuel is charged during the movement stage, before shells and explosions are processed. It is not tied to wall-clock time.

A robot receives 100, 200, or 400 instruction cycles per tick according to CPU_SPEED. Most emitted instructions cost one cycle. A source line usually compiles into several instructions: `count + 1 TO count` uses LOAD, ADD, and STORE.

| Operation | Cost of the device STORE instruction |
| --- | ---: |
| Ordinary store | 1 cycle |
| Successful shot | 11 cycles: ordinary 1 plus 10 extra |
| Radar scan | 41 cycles: ordinary 1 plus 40 extra |
| Either coordinate conversion | 51 cycles: ordinary 1 plus 50 extra |
| Ignored shot while reloading | 1 cycle |
| TRACE when emitted | 0 cycles |

A long operation can exceed the current slice budget; its surplus is deducted from the next tick's budget. Time-interrupt entry costs one cycle. Writing SHOT, RADAR, or a conversion trigger has its cost even if you intended the destination to be ordinary storage.

Time interrupts occur at most once at the beginning of each tick while TIME_INT_MASK is nonzero and no interrupt is already active. Set TIME_INT_XFER to a label. The interrupt saves the current PC on the stack and the accumulator in reserved stack slot zero. ENDINT restores both and permits another interrupt; RETURN alone does not clear the interrupt-active state.

```text
ALLOCATE clock

timer TO TIME_INT_XFER
1 TO TIME_INT_MASK
main
    GOTO main

timer
    clock + 1 TO clock
ENDINT
```

The stack has 30 physical words, with slot zero reserved for interrupt state and the ordinary stack pointer starting at one. There are therefore **29 ordinary push slots** shared by GOSUB, manual STACK writes, and interrupt return addresses. Balance calls and pushes. Pop underflow, push overflow, invalid jumps, and invalid indirect addresses reset the CPU.

RESET clears variables, accumulator, program counter, interrupt state, and programmable controls. It restarts at the first instruction. It preserves position, current reload state, damage, fuel, and opponent population; it does not repair the robot or replenish fuel. Actual movement decelerates after command controls are cleared. The compiler appends a RESET at the end, and terminal fall-through also contributes to the error-reset statistic. Use a deliberate main loop and inspect reset counts during testing.

TRACE is omitted in normal compilation. Debug compilation can retain it for an instruction observer/debugger, but normal battle execution does not pause. Do not use TRACE to implement logic or timing, especially in a single-line IF: removing TRACE can leave a comparison that skips a subsequent instruction.

## Arrays, pointers, and address values

ALLOCATE with a count creates contiguous words, but there is no `array[index]` syntax. `&name` obtains the variable's memory index. `pointer^` reads or writes the word whose index is held in pointer.

```text
ALLOCATE cells 4
ALLOCATE pointer

&cells TO pointer
7 TO pointer^
pointer^ + 1 TO pointer^
pointer + 1 TO pointer
9 TO pointer^
```

Labels themselves are instruction-address constants and can be assigned without `&`:

```text
ALLOCATE next_action

work TO next_action
GOSUB next_action
forever
    GOTO forever
work
RETURN
```

Keep variable-memory addresses and program addresses separate. Indirect memory accepts indices 0–200 in the recovered VM; ordinary positive allocations should stay within the documented 200-word allocation budget. The extra word at index 200 is an observed runtime detail, not an invitation to read beyond your allocated array.

The original accepts negative ALLOCATE counts and contains unchecked direct-memory aliases. The port reproduces known CPU-record aliases and rejects access to unmodeled memory. Do not rely on these aliases, undeclared addresses, zero/negative allocation counts, or compiler bookkeeping bugs in a submitted robot.

## Coordinate conversion

For rectangular-to-polar conversion, write X first and Y last. Y_CONV is the trigger. Coordinates use the same downward-positive Y system as the battlefield.

```text
30 TO X_CONV
-40 TO Y_CONV
ANGLE_CONV TO AIM
DIST_CONV TO SHOT
```

For polar-to-rectangular conversion, write the angle first and distance last. **DIST_CONV is the trigger in the executable**, despite the manual describing ANGLE_CONV as the trigger.

```text
90 TO ANGLE_CONV
50 TO DIST_CONV
; X_CONV is now 50; Y_CONV is 0.
```

Results are integer words, rounded using the recovered Macintosh convention; halfway values round away from zero. They can wrap at signed-word limits. Keep tactical coordinates within normal battlefield distances rather than extreme signed values.

## World model: movement, fuel, radar, and weapons

The arena extends from `(0,0)` to `(381,313)`. A robot's center normally remains within X 5–376 and Y 5–308 because of its body size. Keep a margin when planning turns; a SPEED write changes the target speed, not the instantaneous velocity.

Acceleration and deceleration occur per velocity component, in steps of 2 m/s per tick at ENGINE_SIZE 0 or 4 m/s per tick at level 1. The recovered implementation can oscillate around component targets between acceleration steps. Collisions stop actual and requested movement, set SPEED to zero, and cause damage roughly proportional to the colliding speeds. Steering early is safer than waiting for the center to reach a boundary.

Movement fuel is charged from **commanded** speed, including during acceleration: each tick burns `abs(SPEED) / 10`, with integer truncation, plus 8 if cloaked. Consequently, commanded speeds 1–9 consume no movement fuel in the executable. Cloaking costs 80 units per simulated second. Fuel exhaustion clears speed, target movement, and cloak; actual velocity then decelerates. The gun and CPU do not require fuel.

RADAR scans instantly at the written angle. It ignores self, destroyed robots, and cloaked robots. Detection uses an approximate distance and a cone roughly `±(310 / distance + 1)` degrees wide, capped below 33 degrees; it selects the nearest eligible target within a strict `< RADAR_RANGE` bound. The returned range is rounded Euclidean distance. A miss returns -1. For distant targets, a small angular scan increment is necessary; a fast wide sweep can miss them. RADAR does not identify the target or provide its velocity.

A shot is aimed at a fixed ground point when fired; it does not home in on a moving target or collide with bodies during its flight. There is unlimited ammunition, but only one shell can be in progress per robot. The duration is `abs(distance) / 18 + 1` ticks. The reload countdown is at least the configured reload delay and at least the flight duration. Negative shot distances reverse the trajectory; ordinary robots should use positive distances.

Explosions damage any nearby robot, including the shooter. Rounded distances below 6 metres receive 20 raw damage; distances 6–15 receive `16 - distance`; distances 16 and greater receive none. Armor converts raw damage to the displayed damage percentage. Out-of-arena trajectories are handled by the world's clipping rules. Avoid shooting at close radar contacts unless self-damage is intentional.

Cloaking affects aiming radar only: NUM_ROBOTS still counts the cloaked opponent. Turning the cloak off preserves fuel but does not erase shots already in flight.

## Randomness and reproducible battles

For a positive range N, `N TO RANDOM` configures reads in `[0,N)`, not the inclusive range stated in the manual. Each read advances the shared QuickDraw-compatible random stream; writing the range does not reseed it. A range of zero returns zero without consuming a sample.

```text
360 TO RANDOM
RANDOM TO DIRECTION
```

Initial placement consumes that same stream before robot execution, using five distinct start regions. Robot order and every subsequent RANDOM read affect stream consumption. To reproduce a battle, preserve the exact normalized sources, their order, initial seed, tick cap, and engine version.

The file runners accept unsigned 32-bit decimal or hexadecimal seeds and reject 0, 2147483647, and 4294967294 because those seeds cannot place multiple robots in distinct regions. Seed 1 is a useful initial test. Tournament seeds are master seeds from which valid per-battle seeds are derived, so a tournament master seed of zero is allowed.

## Compiler errors, runtime failures, and limits

Typical compiler errors include an undeclared symbol, duplicate label, missing TO/THEN/DO/END/UNTIL, illegal token or parentheses, a literal magnitude above 32767, too much memory, nesting beyond 15, and excessive attribute spending. Compiler output includes a message, a byte offset, and any partially generated code. Do not run a result whose error field is nonempty.

The language's symbol table permits 199 user symbols in this implementation of the original check. The usual line-boundary limit permits at most 1,990 emitted user instructions before the automatic RESET; keep comfortably below it. These are machine instructions, not source lines. Source size and memory limits are separate.

At runtime, stack underflow/overflow, invalid program targets, and indirect memory outside 0–200 trigger a CPU reset. Repeated resets can make a robot appear active while accomplishing little. The JSON `error_resets` count is a useful diagnostic, although terminal fall-through also counts. The native host explicitly rejects access to unmodeled application memory instead of reproducing arbitrary Macintosh memory access.

Avoid these observed compiler quirks in ordinary code:

- Repeating an ALLOCATE or DEFINE can overwrite metadata for the most recently inserted symbol rather than the symbol you named. Declare each name once.
- `DEFINE alias AIM` creates a register alias. This works, but a descriptive variable plus an explicit register assignment is usually clearer.
- `&missing` can compile as zero because the original inserts a provisional symbol before resolving its address. Declare variables before taking their addresses.
- A multi-digit number at the exact end of a file can leave its last digit to be scanned separately. A bare label at EOF can be parsed as an expression. Always include a final newline.
- The successful compiler still populates its error-position output with the final source offset. Check the error string, not whether the position is zero.

## Testing in the browser and from a checkout

A minimum browser test is: paste or upload a robot, compile successfully, run it with two to five selected robots using a stated seed and tick cap, inspect termination and final state, and export the source and result. Repeat with changed seeds and reversed input order. Test both one-on-one and larger battles; a robot strong against one opponent may lose to another strategy or in a crowded arena.

The optional **Watch battle** view draws a monochrome arena inspired by the original game. Playback speed changes presentation, not simulated physics. Disable it to run a fast battle. Both modes use the same compatibility engine; the drawing is not an emulation of the original Macintosh graphics routines.

For browser automation, the page exposes a real JavaScript API. This is the host interface for submitting Robot Warriors text, not the language used inside a robot:

```javascript
await window.robotwar.ready();
const source = "loop\ngoto loop\n";
const compiled = await window.robotwar.compile(source);
if (compiled.error) throw new Error(compiled.error);
const result = await window.robotwar.battle({
  robots: [
    { name: "idle-a", source },
    { name: "idle-b", source }
  ],
  seed: 1,
  ticks: 10
});
console.log(result.tick, result.alive, result.rng_seed, result.robots);
```

`compile` returns the native compiler object, including `error`, `error_position`, `code_count`, `code_hex`, and `attributes`. The zero-based byte cursor may follow the offending token; successful compilation also reports a final cursor. `battle` returns the native complete state and runs without animation. Sources are normalized to CR and encoded as Mac Roman. Failed host operations reject their promises. `window.robotwar.cancel()` cancels work by restarting the worker; await `ready()` again before submitting new work.

Advanced clients can send native JSON objects through `window.robotwar.request(request)`. For incremental inspection, `kind: "battle_start"` initializes a battle with the same robot/seed/tick parameters, `kind: "battle_step"` with `ticks` from 1 to 100 advances it, and `kind: "battle_stop"` releases it. Start and step responses include state plus `done` and `view`. Use one active incremental battle at a time, and record the same sources, order, seed and total tick cap as for a fast run.

From a checkout, build and validate the native engine:

```sh
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --parallel
ctest --test-dir build --output-on-failure
build/robotwar compile 'robots/my-team/Compass Scout'
```

Run source files and save JSON:

```sh
python3 scripts/run_headless_battle.py \
  'robots/my-team/Compass Scout' robots/examples/Seeker \
  --seed 1 --ticks 1000 --output battle.json
```

The destination directory must already exist. `--ticks` is a cap in 0.1-second units. The runner stops after a complete tick leaves at most one survivor, or at the cap. A tick-limit result is a draw, not a win for the robot with more remaining health. `winner` is a zero-based input index or null; `termination` is `last_survivor`, `mutual_destruction`, or `tick_limit`. `score` is the original win counter, not damage inflicted.

The native JSONL interface also accepts one JSON request per line. For a tiny deterministic two-robot test:

```json
{"kind":"battle","robots":[{"name":"idle-a","source":"loop\rgoto loop\r"},{"name":"idle-b","source":"loop\rgoto loop\r"}],"seed":1,"ticks":10,"stop_when_finished":true,"include_rng_seed":true}
```

Pipe that single line to `build/robotwar jsonl`. The `compile` request form is `{"kind":"compile","source":"..."}`. File runners additionally normalize text and validate source encodings; use them for ordinary files.

For a tournament over a team directory:

```sh
python3 scripts/run_tournament.py --robots-dir robots/my-team \
  --format auto --seed 1 --seeds-per-pair 3 --ticks 2000 \
  --output build/tournament/results.json --summary build/tournament/summary.md
```

Every pairing is played in both orders with the same seeds. Small fields use round-robin; larger fields use Swiss. Exact ranking ties produce joint winners. Tournament performance is a measured result for its opponents and settings, not proof of universal superiority.

## Evidence and compatibility scope

The reference was checked against the original manual, extracted CODE resources, disassembly/decompilation, native implementation, and golden outputs produced by executing the original 68k application routines with the supplied Macintosh IIci ROM. The repository documents the reconstruction in `reverse/compiler.md`, `reverse/vm.md`, `reverse/world.md`, and `reverse/platform.md`, and the runners in `docs/HEADLESS.md`.

The browser runs the native compatibility engine; it is not a booted Macintosh desktop. Original-code emulation is a separate validation path. Matching captured vectors and complete recorded battles gives strong compatibility evidence, not a proof covering every possible program or exceptional machine state. The preserved quirks above are part of that executable-based reference; the recommended coding forms avoid relying on malformed-program behavior.
