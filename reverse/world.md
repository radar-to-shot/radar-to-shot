# World model recovery and compatibility boundary

The native model is `include/robotwar/world.hpp` / `src/world.cpp`. The original
routines are in extracted `CODE_3.bin`; offsets below include its four-byte
resource header. `reverse/decompiled/CODE_3.c` contains independent Ghidra
pseudocode. This document records the manually recovered semantics used by C++.

| Original offset | Recovered role | Native entry |
|---|---|---|
| `0004` | signed word sign | internal sign helper |
| `0030`, `009a` | table sine and cosine | `World::sine`, `World::cosine` (captured original lookup table) |
| `00ba` | piecewise integer distance approximation | `World::approximate_distance` |
| `01e0` | damage accumulation / percent / visual flash counter | `World::add_damage` |
| `023e` | radial explosion damage | `World::explode` |
| `0324` | component acceleration and fuel consumption | `World::accelerate_and_burn` |
| `051c`, `05b0`, `06ca` | collision direction, time, and wall tests | `World::move_robots` |
| `06a2` | collision stop | internal stop helper |
| `0880` | iterative movement/collision resolution | `World::move_robots` |
| `0e08`, `39a0` | spawn initialization and distinct-region selection | `World::random_placements` / `World::add_robot` |
| `1036` | aiming radar | `World::scan` |
| `135c` | device register write dispatch | `World::write_register` |
| `1af0` | CPU time slice, reload, desired velocity update | VM plus `begin_tick` / `end_cpu_slice` |
| `2cb8` | projectile flight, bounds clipping, explosion, destruction | `World::update_shells` |

## State and API boundary

A complete original robot allocation contains a program/CPU subrecord at `+011c`.
The offsets below are relative to the complete allocation:

| Offset | Field |
|---|---|
| `2072` .. `2096` | nineteen signed 16-bit registers |
| `2272`, `2274` | actual X/Y velocity, 100 units per m/s |
| `2276`, `2278` | requested X/Y velocity |
| `227a`, `227c` | signed /1000 position integration remainders |
| `227e` | armor damage capacity |
| `2282` | radar range |
| `2284`, `2286` | accumulated damage and flash counter |
| `2288` | radar result; separate from raw register 16 (last angle) |
| `228a`, `228b` | shell active and explosion flags |
| `228e`, `2290` | shell target Y/X |
| `2292`, `2294` | shell total duration and elapsed ticks |
| `2296`, `2298` | shell delta X/Y |
| `229a`, `229c` | shell origin Y/X |
| `229e`, `22a0` | last visible shell Y/X |
| `22a4` | QuickDraw rectangle, top/left/bottom/right |
| `22b4`, `22b6` | one-based battle slot and collision flag |
| `22b8`, `22ba`, `22bc` | elimination-order counters and battle wins (JSON `score`) |
| `22c0`, `22c8`, `22cc`, `22d0` | damage to others, self damage, collision damage, exhausted count |
| `22d8` | already reported fuel exhaustion |

There are at most five robots. Attribute order is CPU, fire rate, engine, radar,
fuel capacity, cloaking, armor. Callers may supply explicit coordinates or use
`World::random_placements` with the ROM-compatible `mac::QuickDrawRandom` stream.
The same stream continues into CPU random-register reads, preserving consumption
order. The placement routine executes the recovered five-region policy below.

`begin_tick` updates reload and proximity counts before CPU execution.
`end_cpu_slice` commits a robot's changed speed/direction after its instructions.
`update_physics` updates the world after all CPU slices. A tick is one tenth of a
battlefield second. `Simulation` supplies this ordering. `World::tick` also permits
physical simulation without a CPU, with commands queued through register writes.

For competitive battles with two or more robots, `Simulation` awards one win to
the last survivor after the complete movement and shell/destruction pass. The
original `22bc` counter records wins, not points for each opponent eliminated.
Two deaths in one tick can leave no winner. The file runners stop at this point;
the lower-level fixed-tick API can keep advancing, but awards the win only once.
Single-robot routine fixtures do not constitute a competitive win.

The model has no renderer, window handles, clock dependency, or GUI event loop.
`WorldSnapshot` returns value copies and `WorldEvent` callbacks report firing,
explosion, collision, destruction, and fuel exhaustion. GUI code can observe these
without participating in the simulation. Robot state is accessible for explicit
setup, save-state loading, and differential tests.

## Details that differ from a literal reading of the manual

- FIRE_RATE 1 reloads in **20**, not 21, ticks. Other levels are 28, 15, 11, 7.
- Every successful gun write adds 10 extra cycles to the ordinary instruction's
  one cycle; radar adds 40 and either coordinate conversion adds 50.
- Angles are signed words. Negative exact multiples of 360 normalize to **360**,
  while positive multiples normalize to zero.
- The sine table has scale 1600. Its original initialization uses the stored
  radians-per-degree constant **0.017453293**, not exact pi/180. Coordinate
  conversion also uses this constant and **57.29578** for degrees per radian.
  The original Pascal rounding wrapper rounds halves away from zero.
- Acceleration operates on each velocity component independently: 200 or 400
  internal units. It clamps to the engine's component maximum, but **does not
  clamp to the requested velocity**. A request between two acceleration steps
  can therefore oscillate between those steps.
- Fuel consumption is `abs(commanded_speed) / 10`, truncated each tick, plus 8
  if cloaked. Commanded speeds 1 through 9 consume no movement fuel.
- Fuel exhaustion clears command speed, requested velocity, and cloak once.
  Actual velocity decelerates on subsequent updates.
- A speed/direction change becomes component requests using the original two
  integer divisions, not a single floating-point vector multiplication:
  `target_x = word((sin(direction)/4)*speed)/4`, similarly negative cosine for Y.
- Many arithmetic paths explicitly truncate intermediate products to signed
  16 bits before division. The port preserves these truncations.
- Radar first uses an approximate distance for range and cone selection, with
  a strict `< range` test. It then returns the rounded Euclidean distance of
  the selected target. It ignores cloaked robots. The raw RADAR register stores
  the angle; reads return the separate result (initially -1).
- Writing Y_CONV triggers rectangular-to-polar conversion; writing DIST_CONV
  triggers polar-to-rectangular conversion. X_CONV and ANGLE_CONV only store.
- At X_CONV=Y_CONV=-32768, the original signed 32-bit sum of squares overflows
  before SANE sqrt. The invalid result converts to long `0x80000000`, whose low
  word is zero; DIST_CONV therefore becomes zero. Adjacent finite extremes are
  separately captured, and the port preserves this isolated corner.
- The shot duration is `abs(distance)/18 + 1`; negative distances are accepted
  and reverse the shot. The reload value is the greater of duration and the
  fire-rate delay. A shot is ignored while reload is nonzero.
- Explosion radius uses rounded Euclidean distance, with a Manhattan-distance
  early rejection at 24. Rounded distances below 6 receive 20 damage; distances
  6 through 15 receive `16-distance` damage. Armor scales the reported percent.
- When a shell explodes, its elapsed counter and last visible position retain
  their **pre-explosion** values. The explosion event carries the impact point.
- Collision resolution repeatedly selects the earliest collision, updates the
  participants, stops their actual/requested movement, and computes remaining
  motion again. Position remainders advance again during these repeated passes.
  The first and second participants use different rounding biases (550/499).

## Original random placement

Each active robot, in slot order, draws `abs(Random()) % 5 + 1`, repeating until
the region has not been used in that battle. It then consumes two more words for
its X/Y offsets before selecting the next robot's region. Region origins are
`(7,7)`, `(7,160)`, `(136,7)`, `(260,7)`, and `(260,160)`. X adds
`abs(Random()) % 108`; Y adds `% 280` for region 3 and `% 130` otherwise.

The QuickDraw stream is independently validated against the original ROM and
never returns -32768. Placement rejects injected sources that violate that
contract. A zero seed remains zero: the original can select region 1 once, then
loops forever attempting a second robot. The native API throws after 65,536
unsuccessful region attempts as an explicit host termination guard. Golden
vectors cover the terminating original behavior, including distinct-region
rejection for two and five robots and the final consumed random seed.

## Oracle vectors and verification

Expected outputs are captured from executed original instructions, not generated
by the C++ implementation:

| File | Cases | Original-code coverage |
|---|---:|---|
| `tests/golden/world.json` | 381 | distance, armor damage, acceleration/fuel |
| `tests/golden/movement.json` | 129 | multi-tick integration, walls, robot collisions |
| `tests/golden/world_io.json` | 1837 | registers, conversions including signed overflow, radar, projectile setup/refire |
| `tests/golden/shells.json` | 250 | shell travel, boundary clipping, explosion radius |
| `tests/golden/trig.json` | 1447 | signed angle normalization and original sine/cosine lookup |
| `tests/golden/rom_angles.json` | 226 | actual IIci ROM integer radar bearing, including thresholds |
| `tests/golden/rom_random.json` | 12 | actual IIci ROM QuickDraw Random sequences, 192 observed words |
| `tests/golden/placement.json` | 57 | original distinct-region selection and complete placement routine |
| `tests/golden/battle_runner.json` | 12 | seeded complete battles, CPU random reads, deaths, one-time wins and ties |

Generation scripts are `tools/generate_world_vectors.py`,
`tools/generate_movement_vectors.py`, `tools/generate_world_io_vectors.py`, and
`tools/generate_shell_vectors.py`, `tools/generate_sine_table.py`, and
`tools/generate_rom_vectors.py`, `tools/generate_rng_vectors.py`, and
`tools/generate_placement_vectors.py`. All use `tools/oracle.py` and record hashes of
the original CODE resources, engine version, instruction counts, and traps. The
trigonometric initialization in the I/O and shell suites executes original
`CODE2:008a..0108` with actual IIci ROM SANE, without modifying its bytes.
`src/sine_table.inc` contains the 181 captured words, including the half-turn
endpoint. Native sine/cosine lookups therefore have no host transcendental math
dependency. Integrated compiler/CPU/world
vectors are captured separately by `tools/generate_battle_vectors.py`.

`src/world_json.hpp` translates JSON inputs into native state and serializes the
results for the common validator. No JSON or test dependency enters the public
world library. All above world cases passed byte-value comparisons after capture;
CTest also exercises the integrated headless library.

## Platform fidelity and remaining boundary

Musashi executes the original application's 68k code, with a reconstructed
segment loader and A5 globals. This is routine-level emulation; it is **not a
booted Macintosh**. Pure distance/damage/fuel cases require no Mac Toolbox calls.
The final movement, I/O, shell, trigonometric, and integrated capture tools route
functional Toolbox calls to the supplied **original Macintosh IIci ROM**:
OffsetRect, SectRect, EqualRect, PtInRect, PtToAngle, SANE PACK4/5, and relevant
Pascal runtime services execute their original instructions. Only PenSize is a
presentation no-op, with rendering disabled. No host sine, cosine, atan, sqrt, or
angle computation supplies guest golden results. Capture metadata identifies
the ROM and emulator source/patch/binary hashes, packages, instructions and traps.

The native radar bearing is a translation of the ROM's integer tangent-table
algorithm (`mac_math.cpp`), including its fixed-point threshold bias. It is not a
rounded atan2 approximation. Native sine/cosine values are the captured original
startup table. Coordinate conversion and radial damage still use standard C++
math for their floating operations, followed by recovered original rounding and
signed word conversion; their outputs match the original ROM on the captured
cases. This is strong differential evidence, not an exhaustive proof for every
possible signed input or every exceptional floating-point condition.

The bundled machine68k/Musashi baseline required documented emulator corrections
for FREM/FMOD quotient status and propagation of SoftFloat exception flags into
FPSR. These are CPU emulation fixes, not patches to the application's or ROM's
code. The backend selftest checks both transcendental quadrants and the original
Pascal rounding wrapper before permitting capture; independent CPU tests cover
the corrections. A missing inexact-status flag was caught because it incorrectly
made the original rounding wrapper truncate, producing sin(90)=1599. Those
provisional captures were discarded and regenerated with the corrected backend.
See `tools/platform_sane.py` and the emulator patch/test documentation for the
precise backend scope.

The declared reference platform is the supplied IIci ROM. System 7 replacement
packages and the complete Macintosh boot path are outside this claim. Original
random placement is captured by executing the region-selection block inside the
GUI initializer and then its complete robot initialization routine. Surrounding
GUI setup and drawing are omitted; the original application and ROM bytes are
unchanged. Native callers retain explicit placement and injectable random-word
interfaces for reproducible experiments and future presentation code.
