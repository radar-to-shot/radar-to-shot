# Parser and compiler reconstruction

The native implementation is `src/compiler.cpp`; its public API is
`include/robotwar/compiler.hpp`. `Program` carries original four-byte instructions,
seven attributes, allocated-memory count, and a per-instruction source span for a
future editor/debugger. The core has no GUI, filesystem, emulator or JSON dependency.

## Original entry points and calling convention

All offsets below are relative to the beginning of the extracted CODE resource,
including its four-byte segment header. CODE 5 contains the application compiler.
The routines use a Pascal calling convention: arguments are stacked in reverse
memory order; callees remove their argument bytes. CODE 0 supplies the A5 jump table;
`tools/oracle.py` maps those stubs to their original segment routines.

| CODE 5 offset | Recovered operation |
|---|---|
| `0e3e` | Uppercase ASCII character |
| `0e72` | Resolve symbol references in emitted instructions |
| `10e8` | Find/add symbol or define a program label |
| `1296` | Set most recently allocated symbol's type and value |
| `12e6` | Find symbol value for address-of |
| `137a` | Emit address-of as an immediate constant |
| `13ba` | Skip spaces and startup-configured tab character |
| `1426` | Detect remaining line whitespace/comment |
| `1486` | Read decimal constant, reject magnitude greater than 32767 |
| `15aa` | Read uppercase identifier, retain first 15 characters |
| `1718` | Scan one context-sensitive token |
| `2288` | Push conditional-control record |
| `231c` | Push control record and emit unresolved GOTO |
| `235a` | Pop conditional-control record |
| `23dc` | Finish line, fill source-line map, patch inline branch |
| `24dc` | Compile source into original bytecode |
| `3d44` | GUI/editor compile wrapper; not needed by headless oracle |

The compiler's A6 frame arguments are:

| A6 displacement | Meaning |
|---|---|
| `+08` | Debug flag byte in a two-byte stack slot |
| `+0a` | Output error-position pointer |
| `+0e` | Output instruction-count pointer |
| `+12` | Output seven-word attribute array |
| `+16` | Output bytecode buffer |
| `+1a` | Maximum error-string length, 255 |
| `+1c` | Output Pascal error-string buffer |
| `+20` | Signed 16-bit source byte length |
| `+22` | Source Handle (pointer to pointer), not source pointer |

Attribute order is CPU_SPEED, FIRE_RATE, ENGINE_SIZE, RADAR_RANGE,
FUEL_CAPACITY, CLOAKING, ARMOR. The GUI wrapper writes limits
`[2,4,1,2,2,1,5]` to A5-relative words starting at `-0114` before compiling.
Application startup CODE 2:`0300` initializes the alternate whitespace character
at A5`-4242` to 9; a zero-initialized harness without that startup value incorrectly
rejects tabs. The harness supplies the actual startup values.

The direct scanner accepts a synthetic compiler frame pointer. It reads cursor
`frame-009e` and operand-present flag `frame-007b`, and returns token category at
`frame-007c`, opcode at `frame-007d`, numeric payload at `frame-0090`, Pascal
identifier at `frame-008e`, and attribute number at `frame-00a5`. Its signs are
context-sensitive: `-12` is a literal when no operand has been seen, and subtraction
when an operand has been seen. The API therefore explicitly accepts `has_operand`;
it does not pretend the original scanner was context-free.

## Emission rules recovered from the binary

Instructions are `[opcode:u8, mode:u8, operand:s16 big endian]`. Modes are
1 register, 2 immediate constant, 3 label/immediate program address, 4 variable,
5 indirect variable. The symbol resolver replaces provisional symbol indices with
resolved modes/operands. Address-of uses mode 2 immediately. Program addresses are
zero based, despite the manual's illustrative listing starting at instruction 1.

Expressions are emitted strictly left to right, with one LOAD then one arithmetic
instruction per operator. An assignment adds STORE instructions for each TO.
Comparisons occupy opcodes 10 through 15, with inverse opcode `25-opcode`.
An IF followed by GOTO, GOSUB, RETURN, ENDINT, RESET or TRACE uses the comparison
without an extra branch. An assignment after THEN inverts the comparison and adds
an explicit GOTO over the assignment. Block IF and WHILE similarly invert the
comparison and patch a forward branch. REPEAT/UNTIL emits the inverted test and a
backward branch. Every successful compilation appends RESET `[22,0,0]`.

TRACE disappears when debug compilation is disabled. This includes the surprising
case of inline IF/THEN TRACE: removing TRACE leaves its comparison in the output.
Symbols retain only the first 15 uppercase ASCII characters. Symbol capacity and
instruction-length checks are recovered from the actual comparisons, rather than
rounded to the manual's advertised capacities.

## Compatibility observations

These behaviors are independently captured by original-code oracle vectors:

- `SHOT_SPEED` compiles to constant **18**, not the manual's 180 metres/second.
- A signed constant cannot have magnitude 32768, so `-32768` is rejected too.
- Negative and zero ALLOCATE counts are accepted by the original. Allocation
  accounting uses signed 16-bit arithmetic.
- Repeating an ALLOCATE or DEFINE name does not necessarily raise a duplicate
  declaration error. The original setter updates the most recently inserted symbol,
  even if the repeated declaration names an earlier symbol. Program-label
  redefinition does raise an error.
- `DEFINE n X` is accepted and creates a register alias, preserving operand mode 1.
  A built-in constant such as XMAX creates mode 2. Direct numeric GOTO/GOSUB
  operands are rejected, even though a user-defined constant can resolve to mode 2.
- `&missing` creates a provisional symbol before reading its zero-initialized
  value, so it can compile as immediate zero without an undefined-symbol error.
- The scanner's numeric loop can omit the final digit when the source ends
  immediately after a multi-digit number. The full compiler then scans that
  last digit as a separate token, usually producing an error. Both APIs preserve
  this observation. A bare identifier at EOF without newline/comment is parsed
  as an operand, rather than a program-label declaration.
- Error output includes partially emitted instructions and attribute values;
  invalid negative attributes appear as unsigned 16-bit words in the oracle JSON.
- Successful compilation's error-position output is still populated with the last
  byte offset. Empty input reports 65535, the original 16-bit underflow sentinel.

The native compiler accepts LF and CRLF line endings as an explicitly documented
portability extension. Original-code parity tests use classic Mac CR text. The
scanner API consumes bytes exactly and does not apply that extension.

## Reproduction and validation

`tools/generate_parser_vectors.py` invokes the original scanner. The independently
written `tools/generate_compiler_vectors.py` invokes the full original compiler;
it includes all five repository robots, with and without debug emission. Golden
files include source inputs, full bytecode, exact errors and positions, attributes,
original segment/offset, binary hashes, emulator identity and instruction counts.
`tests/validate_golden.py` supplies those inputs to the native JSONL CLI and compares
all returned fields; native output is never used to generate expected values.

The oracle executes the original Pascal string helpers. Its sole compiler-path
Toolbox substitution is Pack7 NumToString, an OS conversion service used to format
numeric error messages. It is recorded in oracle provenance. No parser or compiler
application routine is replaced by a host implementation.
