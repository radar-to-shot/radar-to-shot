#!/usr/bin/env python3
"""Inventory supplied ROM and compressed System numerical packages reproducibly."""
import hashlib,json
from pathlib import Path
import machfs,macresources
from macresources.greggybits import unpack
from oracle import ROOT
from platform_sane import PACKS
from platform_rom import decode_traps

def main():
    rom=(ROOT/'images/Mac_IIci.ROM').read_bytes();vol=machfs.Volume()
    vol.read((ROOT/'images/Robot Warriors.dsk').read_bytes())
    system=vol['System Folder']['System'];packages=[]
    for resource in macresources.parse_file(system.rsrc):
        if resource.type==b'PACK' and resource.id in (4,5):
            data=unpack(resource.data)
            packages.append({'id':resource.id,'compressed_bytes':len(resource.data),'unpacked_bytes':len(data),'compressed_sha256':hashlib.sha256(resource.data).hexdigest(),'unpacked_sha256':hashlib.sha256(data).hexdigest(),'entry_offset':0,'fpu_required':True})
    traps=decode_traps(rom)
    report={
        'rom_sha256':hashlib.sha256(rom).hexdigest(),
        'rom_bytes':len(rom),
        'rom_packages':{str(n):{'offset':hex(off),'bytes':size,'sha256':hashlib.sha256(rom[off:off+size]).hexdigest()} for n,(off,size) in PACKS.items()},
        'rom_toolbox_entries':{name:{'trap':hex(trap),'offset':hex(traps['toolbox'][trap&0x3ff])} for name,trap in [('PtToAngle',0xa8c3),('FixRatio',0xa869),('FixMul',0xa868),('AngleFromSlope',0xa8c4)]},
        'system_path':'System Folder/System','system_resource_sha256':hashlib.sha256(system.rsrc).hexdigest(),
        'system_packages':packages,
        'observations':['System PACK4 and PACK5 require FPU instructions; neither entry provides a pure68000 path.','System PACK4 dynamically replaces suitable caller instruction sequences for acceleration.','ROM package entrypoints avoid that System self-patching path; the numerical oracle explicitly selects this ROM baseline.'],
    }
    path=ROOT/'reverse/platform_inventory.json';path.write_text(json.dumps(report,indent=2)+'\n');print(path)
if __name__=='__main__':main()
