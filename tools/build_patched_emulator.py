#!/usr/bin/env python3
"""Build the documented machine68k0.5.1 FPU corrections in an isolated target.

No packages in the invoking Python environment are replaced. Select the result
explicitly with PYTHONPATH as printed at completion. Requires a C compiler,
Python3.11+ with development headers, and the patch utility.
"""
import argparse
import hashlib
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tarfile
import urllib.request

ROOT=Path(__file__).resolve().parents[1]
URL='https://files.pythonhosted.org/packages/82/2a/dc00b3aceb392ba48ce0c28aba0b4c6dae2868689d4e4a62ba72c2e9db95/machine68k-0.5.1.tar.gz'
SHA256='ab8292add8d169aa4f81173e018216269023c77d009a7e6bbf1e603e85ef0b32'

def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--work',type=Path,default=ROOT/'work/emulator-build')
    ap.add_argument('--target',type=Path,default=ROOT/'work/machine68k-patched')
    args=ap.parse_args();work=args.work.resolve();target=args.target.resolve();work.mkdir(parents=True,exist_ok=True)
    archive=work/'machine68k-0.5.1.tar.gz'
    if not archive.exists():
        with urllib.request.urlopen(URL) as response:archive.write_bytes(response.read())
    if hashlib.sha256(archive.read_bytes()).hexdigest()!=SHA256:raise RuntimeError('Source archive SHA256 mismatch')
    source=work/'machine68k-0.5.1'
    patch=ROOT/'tools/patches/machine68k-0.5.1-frem-quotient.patch'
    if not source.exists():
        with tarfile.open(archive) as tar:tar.extractall(work,filter='data')
        subprocess.run(['patch','-p1','--input',str(patch)],cwd=source,check=True)
    else:
        # Idempotent reuse accepts only a tree with the exact patch applied.
        subprocess.run(['patch','-p1','--reverse','--dry-run','--input',str(patch)],cwd=source,check=True)
    env=os.environ.copy();env['CC']=env.get('CC') or shutil.which('cc') or 'gcc';env['CXX']=env.get('CXX') or shutil.which('c++') or 'g++'
    build_env=work/'build-venv'
    if not build_env.exists():subprocess.run([sys.executable,'-m','venv',str(build_env)],check=True)
    python=build_env/'bin/python'
    subprocess.run([str(python),'-m','pip','install','setuptools==80.9.0','setuptools-scm==9.2.2','packaging==25.0','Cython==3.2.2','wheel==0.45.1'],check=True,env=env)
    wheels=work/'wheels';wheels.mkdir(exist_ok=True)
    subprocess.run([str(python),'-m','pip','wheel','--no-build-isolation','--no-deps',str(source),'-w',str(wheels)],check=True,env=env)
    wheel=next(wheels.glob('machine68k-0.5.1-*.whl'))
    subprocess.run([str(python),'-m','pip','install','--no-deps','--upgrade','--target',str(target),str(wheel)],check=True,env=env)
    env['PYTHONPATH']=str(target)
    subprocess.run([sys.executable,str(ROOT/'tests/test_fpu_remainder.py')],check=True,env=env)
    subprocess.run([sys.executable,str(ROOT/'tests/test_fpu_status.py')],check=True,env=env)
    import json
    (target/'robotwar-emulator-build.json').write_text(json.dumps({
        'package':'machine68k==0.5.1','source_sha256':SHA256,
        'patch_sha256':hashlib.sha256(patch.read_bytes()).hexdigest(),
        'verification':['598 FREM/FMOD rational cases','139 FPU status/rounding cases']},indent=2)+'\n')
    print('Use the patched emulator explicitly:')
    print(f'PYTHONPATH={target} {sys.executable} tools/platform_sane.py')
if __name__=='__main__':main()
