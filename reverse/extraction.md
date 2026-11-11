# Original application and extraction provenance

The source is `https://github.com/radar-to-shot/radar-to-shot` at commit
`3cd67f6bdbd61a6c519c5ba4a7382599d7f8b9f6`. The original application is the HFS file
`Desktop Folder/Robot Warriors/Robot Warriors 1.0.1` in `images/Robot Warriors.dsk`.
Its Finder type is `APPL` and creator is `RWar`. It has an empty data fork; all
application code and assets are in its 108,655-byte resource fork.

| Artifact | SHA-256 |
| --- | --- |
| `Robot Warriors.dsk` | `7dd47f5c4cf12f08f03ea28a5acdc17c15e1bcc32297e480b9d06e4ac82c78f1` |
| `Robot Warriors CI.dsk` | `538491c4f6cb01b5aa1f908d16feaacf0924be98c2279c6ffe2f20fefafdcc2c` |
| Original application resource fork | `d486bc719b82a5ca5bcf3e406f40d6d06fc9d15e3bbf1009dc8d152b4293a0ae` |
| CI application resource fork | `90e75135ae05d2d866a42c19c298238e244ffebf58997f4781c9d302f94fec3c` |
| Application data fork, both images | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` |

The two resource forks differ at exactly 20 byte offsets in the reserved
resource-fork preamble, between offsets 74 and 117. **Every one of the 99
resources has identical type, ID, name, attributes and payload in both images.**
This includes all six `CODE` resources. The CI image does not contain a distinct
compiler or game engine.

`tools/extract_original.py` reads the HFS filesystem with `machfs`, saves the
application forks without modification, and parses the resource map using
`macresources`. `original/manifest.json` records the size, resource metadata and
SHA-256 of every payload. Resource filenames strip trailing spaces in four-byte
types and spell `#` as `hash`; the original four-byte type is retained in the
manifest. Resource IDs remain signed. Extraction does not disassemble or patch
the saved resource bytes.

## Address conventions

| Resource | Bytes | Interpretation |
| --- | ---: | --- |
| `CODE` 0 | 632 | A5-world sizes and 77-entry segment jump table |
| `CODE` 1 | 2,620 | THINK Pascal runtime helpers |
| `CODE` 2 | 1,566 | Application helper code |
| `CODE` 3 | 20,656 | Virtual CPU, geometry and battle code |
| `CODE` 4 | 21,546 | Application, editor and Mac Toolbox code |
| `CODE` 5 | 16,098 | Compiler/parser and additional helpers |

All disassembly and recovered-code addresses in this project are **offsets
within the saved `CODE` resource**, including its four-byte segment header.
The first executable byte of segments 1–5 is at offset 4. The header consists
of a big-endian 16-bit jump-table relative offset and a 16-bit entry count.

`CODE` 0 contains four big-endian 32-bit values: 648 bytes above A5, 17,324 bytes
below A5, a 616-byte jump table, and jump-table location A5+32. Each original
eight-byte entry is `target-offset, 0x3f3c, segment-number, 0xa9f0`. The
target-offset is relative to the executable payload, so add 4 for the resource
offset. Loaded callers use `JSR (A5 + entry-offset + 2)`.
`disassembly/map.json` records this complete mapping and candidate `LINK A6`
function boundaries; the `.asm` listings annotate matching A5 calls.

The full listings use a Capstone linear sweep and include embedded strings and
switch tables that may decode as instructions. They are evidence for manual
control-flow analysis, not recovered source symbols. The application contains
no identified MacsBug function names. Names assigned during reverse engineering
are descriptive and should not be treated as original identifiers.

## Initial global data

The THINK Pascal initialization routine at `CODE` 1 offsets `0x011c–0x012e`
expands `DATA` 0 and `ZERO` 0. Each DATA word is copied. A zero word also consumes
the next ZERO word, which specifies the number of *additional* zero words to
write. `DREL` 0 is empty, so there are no global pointer relocations. The
17,324-byte result, saved as the derived `original/a5_initial.bin`, loads at
A5−`0x43ac`. It contains 90 zero bytes, the Pascal string `Printer Dump` with
one alignment byte (14 bytes total), and 17,220 trailing zero bytes. Runtime
initializers still populate tables and other state later.

## Attribution and licensing evidence

The disk's `Desktop Folder/Robot Warriors/Read Me` says:

> Robot Warriors 1.0.1
> ©1991 by Steven Miller & Dean Ouchida
> Robot Warriors was written in Symantec THINK Pascal
> Portions of the code are © Symantec
> Shareware $15.

The `vers` 1 resource repeats the title and authors. The about-dialog resource
shows `Version 1.0.1` and the literal date `9/11/91`; no locale interpretation is
assumed. The supplied repository commit contains the application disk images,
ROM, manual, sample robot programs, and automation scripts, but no original
Pascal source and no repository license file. The existence of the public
repository is not evidence that the original game or ROM was relicensed.

## Reproduction and integrity checks

```sh
python3 -m pip install -r tools/requirements-reverse.txt
python3 tools/extract_original.py
python3 tools/disassemble.py
python3 tests/test_extraction.py
```

The tests re-extract into a temporary directory and compare every artifact byte
and manifest field against the saved outputs, check the independent pinned disk
and resource-fork hashes, verify resource equality between both disk images, and
check the complete expanded global-data extent and contents.
