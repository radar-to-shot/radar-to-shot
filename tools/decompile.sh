#!/usr/bin/env bash
set -euo pipefail
# Set GHIDRA_HOME to an unpacked Ghidra 11.3.2 distribution; requires Java 21.
: "${GHIDRA_HOME:?Set GHIDRA_HOME to the Ghidra distribution directory}"
repo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
project_dir=${1:-"$repo_dir/work/ghidra-project"}
mkdir -p "$project_dir/user" "$repo_dir/reverse/decompiled"
# Keep Ghidra preferences and caches beside its disposable analysis project.
export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS:-} -Duser.home=$project_dir/user"
language_dir="$GHIDRA_HOME/Ghidra/Processors/68000/data/languages"
cp "$repo_dir/tools/ghidra/robotwar.slaspec" "$repo_dir/tools/ghidra/robotwar.ldefs" "$language_dir/"
# Use the stock compiler specification with classic Pascal 16-bit int/alignment.
python3 - "$language_dir" <<'PYCODE'
import pathlib, sys
p=pathlib.Path(sys.argv[1])
s=(p/'68000.cspec').read_text().replace('<integer_size value="4" />','<integer_size value="2" />').replace('maxsize="500" align="4"','maxsize="500" align="2"')
(p/'robotwar.cspec').write_text(s)
PYCODE
"$GHIDRA_HOME/support/sleigh" "$language_dir/robotwar.slaspec"
python3 "$repo_dir/tools/ghidra_abi.py"
"$GHIDRA_HOME/support/analyzeHeadless" "$project_dir" RobotWarriors \
  -import "$repo_dir/reverse/original/resources/CODE_1.bin" \
  -loader BinaryLoader -loader-baseAddr 0x10000 \
  -processor 68000:BE:32:RobotWarriors -cspec default \
  -scriptPath "$repo_dir/tools/ghidra" \
  -preScript PrepareRobotWarriors.java "$repo_dir/reverse/original/resources" "$repo_dir/reverse/disassembly/map.json" \
  -postScript RecoverPascal.java "$repo_dir/reverse/decompiled/pascal-abi.tsv" \
  -postScript ExportRobotWarriors.java "$repo_dir/reverse/decompiled" \
  -analysisTimeoutPerFile 600 -overwrite

python3 "$repo_dir/tools/decompile_manifest.py"
