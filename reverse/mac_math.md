# Original Macintosh ROM geometry

The repository's `images/Mac_IIci.ROM` has SHA-256
`0419966cfd7445680c0dd6ca78e8b1f4bc212e75caf56f4a5f523afa576ad3f2`.
`tools/platform_rom.py` decodes its original compressed trap map and can execute
the ROM's `PtToAngle` directly under Musashi, with no host trigonometry shim.

## Trap-map recovery

The ROM's big-endian long at offset `0x22` points to the table at `0x514e0`.
The initializer at offsets `0x9a96–0x9ae4` expands 1,024 Toolbox entries followed
by 256 operating-system entries, terminating at file offset `0x51d6e`.

Entries encode signed, word-scaled relative offsets. A high-bit-set byte uses
its low seven bits directly; low bits zero select the unimplemented-trap routine
at `0x9ae6`, and low bits 127 introduce an absolute four-byte ROM offset. Other
entries use a two-byte value. Doubling that value as a signed 16-bit word gives
the delta from the previous routine. A zero delta terminates the stream.

The relevant original routine offsets are:

| Toolbox trap | Routine | ROM offset |
| --- | --- | --- |
| `A868` | FixMul | `0x1c312` |
| `A869` | FixRatio | `0x1c490` |
| `A861` | Random | `0x2eb20` |
| `A8A6` | EqualRect | `0x2c630` |
| `A8A8` | OffsetRect | `0x2c670` |
| `A8AA` | SectRect | `0x2c6b0` |
| `A8AD` | PtInRect | `0x2c7d0` |
| `A8C3` | PtToAngle | `0x3cf90` |
| `A8C4` | AngleFromSlope | `0x3ce20` |

The latter geometry routines use 68020 addressing forms and `RTD`, so this
platform harness selects Musashi's 68020 mode. Application `CODE` bytes remain
unchanged. The ROM is loaded at a guest address and its three `PtToAngle`
dependency pointers are installed at low RAM `0xfa0`, `0xfa4`, and `0x1110`.
The full low-RAM Toolbox table is deliberately not installed over the harness's
return sentinel at `0x1000`.

## Exact radar bearing

The application's radar routine invokes `PtToAngle` at `CODE` 3:`0x1096`, using
the robot's square rectangle. The native helper
`robotwar::mac::point_to_angle(x,y)` therefore implements the square-rectangle
case. Coordinates are relative to its integer center, with positive Y pointing
downward. It is used for radar; SANE vector conversions are a separate operation.

For a square, the rectangle aspect ratio is exactly fixed-point 1.0. The original
ROM obtains a signed 16.16 slope using `FixRatio(x,y)`. `AngleFromSlope` takes
its magnitude, subtracts **500 fixed-point units**, and searches the original
91-entry integer tangent table. It then selects the appropriate quadrant.
Zero horizontal displacement is handled separately. Signed division overflow
and 32-bit wraparound are preserved explicitly in the C++ helper.

The tangent table's fractional words reside at ROM `0x3cecc + 2*angle`; high
parts above angle 63 reside at `0x3ce71 + angle`. These exact integer values are
included in `src/mac_math.cpp`. Using rounded `atan2` changes some bearings by a
degree and can therefore change radar detection near its angular boundary.

`tools/generate_rom_vectors.py` captures expected angles from actual ROM
instructions. Its 226 cases include neighboring angle thresholds, quadrant
boundaries, zero coordinates, and signed 16-bit extremes. All 226 match the
native helper; 84 differ from the earlier rounded-host-`atan2` approximation.
Host trigonometry is used only to choose some test inputs, never to calculate
expected results. Every vector includes its original routine offset and the
corpus records executed-ROM hashes and instruction counts.

```sh
python tools/platform_rom.py --map work/rom-traps.json
python tools/generate_rom_vectors.py
python tests/validate_golden.py --binary build/robotwar --golden tests/golden/rom_angles.json
```

## Exact QuickDraw random source

The original `Random` routine at ROM `0x2eb20` is self-contained. It obtains the
QuickDraw globals pointer from `(A5)` and reads its 32-bit `RandSeed` at offset
`-0x7e`. Its wordwise multiply/fold sequence is equivalent, for every unsigned
32-bit initial bit pattern, to:

```text
seed = (uint64(seed) * 16807) % 2147483647
word = signed_low_16_bits(seed)
if word == -32768: word = 0
```

The full seed is stored before the output-word special case. In particular,
seed 958682087 becomes 32768 while returning zero. Initial seeds zero and
2147483647 produce zero forever; standard library generators that normalize a
zero seed to one do not reproduce this behavior.

`robotwar::mac::QuickDrawRandom` supplies this stateful algorithm through the
existing `Simulation::RandomWordSource` interface. Supplying a seed makes the
headless run deterministic; it does not claim to recover the unpredictable seed
from a historical Macintosh session. Injected word sources remain supported for
virtual-CPU tests.

`tools/generate_rng_vectors.py` captures 16 consecutive original-ROM draws for
each of 12 selected initial seeds, including all the cases above, signed-boundary
bit patterns, and `0xffffffff`. Each of the 192 observations preserves both the
returned signed word and the updated full seed. The native JSON operation
`world_random` accepts `seed` and `count` and returns the final seed plus this
sequence of observations.
