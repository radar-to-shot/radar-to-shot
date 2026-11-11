# 68k decompilation

These files are **actual Ghidra 11.3.2 decompiler output** from the extracted Robot Warriors 1.0.1 CODE resources, not handwritten reconstructions or assembly renamed as C. The five `.c` files contain 244 candidate functions (including runtime and GUI code). `index.tsv` maps each one back to its CODE resource and byte offset. The original four-byte CODE header is included in offsets.

The output is an analysis aid, not compilable source or a claim that every function has been correctly recovered. Ghidra inferred names and types. Warnings, unresolved control flow, opaque traps, and stack variables are retained. The portable implementation lives under `include/robotwar` and `src`; emulator comparisons, rather than decompiler output alone, establish its tested behavior.

## Reproduce

Requirements: Java **JDK** 21 (a JRE is insufficient), Python 3, and a writable unpacked [Ghidra 11.3.2](https://github.com/NationalSecurityAgency/ghidra/releases/tag/Ghidra_11.3.2_build). Run extraction/disassembly first, then from the repository root:

```sh
export JAVA_HOME=/path/to/jdk-21
export GHIDRA_HOME=/path/to/ghidra_11.3.2_PUBLIC
./tools/decompile.sh work/ghidra-project
```

The script adds a `robotwar` language to the local Ghidra distribution. It includes Ghidra's standard Motorola 68020 specification, adds opaque A-line trap operations (with ExitToShell marked terminal), and derives a compiler specification with 16-bit `int` and two-byte stack parameter alignment. Existing stock Ghidra language files are not edited. Settings and analysis projects go under the selected work directory.

The reference run used Temurin JDK 21.0.13+9. Distribution archive SHA-256:

- Ghidra 11.3.2 (`ghidra_11.3.2_PUBLIC_20250415.zip`): `99d45035bdcc3d6627e7b1232b7b379905a9fad76c772c920602e2b5d8b2dac2`
- Temurin 21.0.13+9 Linux x64 (`OpenJDK21U-jdk_x64_linux_hotspot_21.0.13_9.tar.gz`): `d7f5d5cf865a2902b70ff549b97586a7d3f234e016f041ab447ea740c7d66d1c`

## Analysis model and limitations

- CODE resource `n` loads at synthetic address `n * 0x10000`. A5 is fixed at synthetic address `0x100000`. These are analysis addresses, not addresses asserted for a running Mac.
- All original CODE bytes remain unchanged. Loaded A5 jump-table stubs are constructed in a separate block and point at the original segment entry offsets. A5 globals are initially zero in the analysis database; this does not claim the application starts with all globals zero after initialization.
- `__mac_toolbox(0xAxxx)` means an **opaque** original Macintosh A-line instruction. Its real stack/register/memory side effects are not modeled by the decompiler. `ExitToShell` (`0xA9F4`) is explicitly terminal, and the runtime exit routine CODE1+0x007c is marked nonreturning. This keeps flow visible instead of silently truncating every Toolbox call. Emulation has its own explicit trap handling.
- `tools/ghidra_abi.py` recognizes 168 conservative Pascal epilogues and explicit caller-stack result writes. The resulting `pascal-abi.tsv` drives Ghidra return-flow, stack-purge, and result-storage annotations without patching instructions. Input parameter recovery is incomplete. `in_stack_*`, unknown-calling-convention warnings, and some incorrect inferred return types remain.
- `int` in these C-like listings is **16-bit**, `long` is 32-bit. They must not be compiled as native C with its host type sizes. Overflow and signed division require inspection of the 68k instructions.
- Function starts are A5 jump targets, aligned LINK A6 candidates, and Ghidra's discovered call targets. Positive-frame LINK candidates are rejected: CODE5+0x2236 is the embedded text `DIST_CONV`, not a function. Other embedded data can still produce false candidates; the index counts candidates, not verified original source functions.
- All 244 candidates emitted decompiler text in the reference run (zero fatal decompilation failures). This is not a completeness score: some listings still contain `halt_baddata`, unresolved indirect control flow, overlapping variables, or partial decoding. The final reference run reports no p-code decoding warnings; semantic recovery remains incomplete for the reasons above.

`manifest.json` records input/output hashes and counts. `analysis.log` preserves the headless run's diagnostic output.
