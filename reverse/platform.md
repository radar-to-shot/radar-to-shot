# Original Macintosh numerical platform

The numerical oracle executes the supplied Mac IIci ROM's SANE packages and QuickDraw routines. It no longer substitutes Python `sin`, `cos`, `atan2`, or rectangle geometry for the captured world behavior. `tools/platform_sane.py` routes the application's Macintosh traps to original ROM instructions under Musashi. The application CODE resources and the entire loaded ROM are checked for byte-for-byte integrity after execution.

This is an explicitly selected **Mac IIci ROM baseline**. It is routine-level execution, not a claim that a complete System 7 desktop has been booted. The supplied System file also contains replacement SANE packages; these are inventoried but are not the numerical oracle's selected implementation.

## Original code recovered

`tools/platform_inventory.py` reproduces `platform_inventory.json` directly from the supplied disk image and ROM. The ROM SHA-256 is `0419966cfd7445680c0dd6ca78e8b1f4bc212e75caf56f4a5f523afa576ad3f2`.

| Original resource or routine | ROM offset | Bytes | Use |
| --- | --- | --- | --- |
| PACK 4 | `0x70ac0` | 4,352 | SANE basic arithmetic, conversions, environment and exceptions |
| PACK 5 | `0x71be0` | 4,304 | SANE elementary functions, including sine, cosine, and arctangent |
| PACK 7 | `0x79de0` | 1,392 | Original decimal number formatting |
| PtToAngle | `0x3cf90` | Entry point | Radar bearing |
| OffsetRect | `0x2c670` | Entry point | Integer movement geometry |
| SectRect | `0x2c6b0` | Entry point | Integer collision geometry |
| EqualRect | `0x2c630` | Entry point | Rectangle comparisons |
| PtInRect | `0x2c7d0` | Entry point | Point containment |

`reverse/mac_math.md` documents the ROM trap-table decoder and the recovered integer bearing algorithm. The numerical bridge loads the unmodified ROM at guest address `0x700000`, installs three required QuickDraw dependency pointers, and dispatches original package calls by supplying their normal return-PC stack slot. No numerical game routine is intercepted or replaced.

The System resource fork's compressed PACK 4 and PACK 5 decompress with the existing `macresources.greggybits` implementation to 15,414 and 5,024 bytes. Their entry paths execute FPU instructions. System PACK 4 additionally rewrites suitable caller instruction sequences for acceleration. The selected ROM package path avoids this System optimization and keeps application code unchanged. These observations and resource hashes are recorded in the inventory.

## Emulator corrections and independent checks

Unmodified `machine68k` 0.5.1 could execute the packages but did not provide a trustworthy floating-point oracle. Two observable failures exposed missing CPU behavior:

- FREM computed its remainder but did not supply the FPSR quotient field. Original ROM sine of 1 incorrectly became negative cosine of 1 because the original polynomial code selected the wrong quadrant.
- SoftFloat exception flags were not propagated into FPSR. The application's original Pascal rounding helper therefore treated 1.5 as exact and returned 1 instead of 2.

The isolated, reproducible emulator patch corrects FREM/FMOD quotient and remainder semantics, maps SoftFloat status/accrued flags, preserves extended range for FINT/FINTRZ, and avoids leaking arithmetic comparison flags into FCMP. It changes CPU instruction emulation, not the application or ROM, and does not contain game golden values.

`tests/test_fpu_remainder.py` checks 598 cases against exact rational arithmetic. `tests/test_fpu_status.py` checks 139 independent conversion, rounding, status, and accrued-exception cases against the Motorola instruction definitions. These tests do not obtain their expected values from the native game implementation. The backend additionally runs the original ROM sine/cosine/arctangent routines and the original application rounding helper as startup sanity checks; these checks reject both known broken backend versions before any world corpus is generated.

The numerical bridge rejects FPCR requests for single/double arithmetic precision or enabled floating-point exception traps. It records observed FPCR writes in provenance. It also rejects FSIN, FCOS, and FSINCOS instructions, which this Musashi version would otherwise implement using host binary64 transcendental functions. The captured path uses the original ROM polynomial algorithms with extended80 basic arithmetic instead.

The supported oracle scope is the exercised **finite, extended-precision, nontrapping** path. The optional ISA audit still identifies ignored FPCR single/double arithmetic precision and incorrect signaling-NaN current-exception classification; arbitrary exception-enabled behavior is not established. The bridge's FPCR guard prevents the first two modes and enabled traps from silently entering these captures. This is not a claim of exhaustive 68881 hardware equivalence or hardware cycle timing.

## Reproduce and inspect evidence

```sh
python tools/build_patched_emulator.py
PYTHONPATH=work/machine68k-patched python tools/platform_sane.py
PYTHONPATH=work/machine68k-patched python tools/platform_capture.py
```

Use the same Python environment as `tools/requirements-reverse.txt`. The build script installs a patched module into an isolated directory; it does not replace the ordinary emulator package. `tools/patches/machine68k-0.5.1-frem-quotient.patch` contains the reviewed CPU corrections, and the build script checks the source archive hash and runs both required ISA suites.

`platform_samples.json` records 21 raw original-ROM SANE outputs, the original application's startup sine table, and a crosscheck of all 251 current compiler vectors using actual ROM PACK 7 decimal formatting. An independent crosscheck also reproduced all 129 movement/collision outputs using original ROM rectangle routines, after which the movement corpus was regenerated with that ROM provenance.

Each ROM-backed corpus records application/ROM hashes, emulator source archive hash, patch hash, loaded emulator module hash, original instruction counts, traps, FPU operations, and observed FPCR writes. Host conversion of an extended80 result to a Python float is used only for broad startup assertions and never supplies expected game outputs. `PenSize` remains an explicit presentation-only no-op; GUI state and drawing are outside the headless numerical comparison.
