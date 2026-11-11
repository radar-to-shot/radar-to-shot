# Explicit emulator repair

`machine68k-0.5.1-frem-quotient.patch` applies to the unmodified PyPI source archive:

- Version: `machine68k==0.5.1`
- Source SHA-256: `ab8292add8d169aa4f81173e018216269023c77d009a7e6bbf1e603e85ef0b32`
- Patched file: `src/musashi/m68kfpu.c`

Run `python tools/build_patched_emulator.py` from the repository root. The script
builds in `work/emulator-build`, installs to `work/machine68k-patched`, and prints
how to select that directory explicitly with `PYTHONPATH`. The invoking Python
environment is not modified. A build manifest records source and patch hashes.

The changes are emulator ISA corrections, not Robot Warriors special cases:

1. Compute the FREM/FMOD quotient's sign and low seven magnitude bits exactly from
   extended significands and write FPSR[23:16]. FREM uses nearest-even quotient;
   FMOD uses truncation. No host binary64 arithmetic narrows the calculation.
2. Bridge per-operation SoftFloat flags into current FPSR exception status and
   sticky accrued flags. Arithmetic and format conversion clear current status;
   control-register moves retain their architectural behavior. Accrued underflow
   requires both underflow and inexact; overflow accrues inexact as specified by
   the Motorola 68881/68882 manual, section 6.1.10.
3. Use extended-precision integral rounding for FINT/FINTRZ instead of conversion
   through signed 32-bit integers. FINTRZ temporarily selects round-to-zero and
   restores the caller's rounding mode.
4. Suppress overflow/underflow/inexact from the subtraction used internally to
   compute FCMP condition codes; comparisons do not generate those exceptions.

`tests/test_fpu_remainder.py` checks 598 cases against Python exact rational
arithmetic. `tests/test_fpu_status.py` independently checks 139 rounding, exception,
sticky-status, control-transfer, and comparison cases. These tests never invoke
Robot Warriors or use its observed outputs. The optional `--audit` reports known
upstream limitations outside the captured ROM execution path; this patch is not a
claim of complete 68881 emulation.

The source package retains its upstream GPL-2.0-or-later license and notices. The
patch is distributed with the project so reproduction does not depend on a hidden
local modification of an installed emulator.
