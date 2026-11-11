#!/usr/bin/env python3
"""Capture lexer tokens from the unmodified CODE5 scanner under Musashi."""
import json
from pathlib import Path
from oracle import OriginalMachine

def main():
    machine=OriginalMachine();vectors=[]
    cases=[('angle_conv\r',0,False),('TIME_int_XFER\r',0,False),('a12345678901234567890\r',0,False),('123\r',0,False),('123',0,False),('-123\r',0,False),('+123\r',0,False),('-123',0,False),('-a\r',0,False),('- 2\r',0,False),('-2\r',0,True),('32768\r',0,False),('0\r',0,False),('\r',0,False),('; comment',0,False),('a\r',0,False),('xmax\r',0,False),('shot_speed\r',0,False),('  aim\r',2,False)]
    words='X Y AIM SHOT DAMAGE SPEED DIRECTION FUEL CLOAK NUM_ROBOTS TIME_INT_MASK TIME_INT_XFER X_CONV Y_CONV ANGLE_CONV DIST_CONV RADAR RANDOM STACK CPU_SPEED FIRE_RATE ENGINE_SIZE RADAR_RANGE FUEL_CAPACITY CLOAKING ARMOR IF THEN ELSE WHILE DO REPEAT UNTIL END GOTO GOSUB RETURN ENDINT TO DEFINE ALLOCATE TRACE RESET AND OR XOR MOD'.split()
    cases += [(word+'\r',0,False) for word in words]
    cases += [(word+'\r',0,True) for word in ['+','-','*','/','<','>','<=','>=','<>','=','&','^']]
    for index,(source,offset,has_operand) in enumerate(cases):
        expected=machine.scan_token(source,offset,has_operand)
        vectors.append({'id':f'parser-{index:03}', 'kind':'parse', 'input':{'source':source,'offset':offset,'has_operand':has_operand}, 'expected':expected,'oracle':{'segment':5,'offset':'1718'}})
    out=Path(__file__).resolve().parents[1]/'tests/golden/parser.json';out.parent.mkdir(parents=True,exist_ok=True)
    out.write_text(json.dumps({'provenance':machine.provenance(),'vectors':vectors},indent=2)+'\n')
    machine.close();print(f'Captured {len(vectors)} parser vectors -> {out}')
if __name__=='__main__':main()
