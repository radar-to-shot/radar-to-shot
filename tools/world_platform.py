"""Explicit host implementations of Macintosh platform traps, never game routines.

QuickDraw rectangle operations use integer geometry. PtToAngle and SANE use host
binary64 math, not the original ROM; captures using these carry that limitation.
"""
import math
import struct

class WorldPlatform:
    def __init__(self,m):
        self.m=m; self.env=0;self.exceptions=0;self.calls={}
        for opcode in [0xa8a8,0xa8aa,0xa8a6,0xa8ad,0xa8c3,0xa89b,0xa9eb,0xa9ec]:
            m.toolbox_handlers[opcode]=self.trap
    def ext(self,address):
        b=bytes(self.m.mem.r_block(address,10)); exponent=int.from_bytes(b[:2],'big'); mantissa=int.from_bytes(b[2:],'big')
        if not mantissa:return 0.0
        return (-1 if exponent&32768 else 1)*math.ldexp(mantissa/2**63,(exponent&32767)-16383)
    def put_ext(self,address,value):
        if value==0:b=bytes(10)
        else:
            f,e=math.frexp(abs(value));exponent=e-1+16383;mantissa=int(f*2**64)
            b=((32768 if value<0 else 0)|exponent).to_bytes(2,'big')+mantissa.to_bytes(8,'big')
        self.m.mem.w_block(address,b)
    def trap(self,op,pc):
        self.calls[f'{op:04x}']=self.calls.get(f'{op:04x}',0)+1
        mem=self.m.mem;cpu=self.m.cpu;sp=cpu.r_sp()
        def rect(p):return [mem.r16s(p+2*i) for i in range(4)]
        def putrect(p,v):
            for i,n in enumerate(v):mem.w16(p+2*i,n&65535)
        if op==0xa8a8:
            dy,dx,p=mem.r16s(sp),mem.r16s(sp+2),mem.r32(sp+4);r=rect(p);putrect(p,[r[0]+dy,r[1]+dx,r[2]+dy,r[3]+dx]);cpu.w_sp(sp+8)
        elif op==0xa8aa:
            dst,p2,p1=mem.r32(sp),mem.r32(sp+4),mem.r32(sp+8);a,b=rect(p1),rect(p2);r=[max(a[0],b[0]),max(a[1],b[1]),min(a[2],b[2]),min(a[3],b[3])];hit=r[0]<r[2] and r[1]<r[3];putrect(dst,r if hit else [0]*4);mem.w8(sp+12,int(hit));cpu.w_sp(sp+12)
        elif op==0xa8a6:
            mem.w8(sp+8,int(rect(mem.r32(sp))==rect(mem.r32(sp+4))));cpu.w_sp(sp+8)
        elif op==0xa8ad:
            r=rect(mem.r32(sp));y,x=mem.r16s(sp+4),mem.r16s(sp+6);mem.w8(sp+8,int(r[0]<=y<r[2] and r[1]<=x<r[3]));cpu.w_sp(sp+8)
        elif op==0xa8c3:
            dst=mem.r32(sp);y,x=mem.r16s(sp+4),mem.r16s(sp+6);r=rect(mem.r32(sp+8));cx=(r[1]+r[3])/2;cy=(r[0]+r[2])/2
            # QuickDraw Rect center uses integer midpoint, including odd11px robots.
            cx=int(cx);cy=int(cy);angle=math.degrees(math.atan2(x-cx,cy-y));angle=int(math.floor(angle+0.5))%360
            mem.w16(dst,angle);cpu.w_sp(sp+12)
        elif op==0xa89b:cpu.w_sp(sp+4) # PenSize changes presentation only.
        elif op==0xa9ec:
            selector=mem.r16(sp);dst=mem.r32(sp+2);x=self.ext(dst)
            funcs={24:math.sin,26:math.cos,30:math.atan}
            if selector not in funcs:raise RuntimeError(f'Unsupported SANE transcendental {selector:04x}')
            self.put_ext(dst,funcs[selector](x));cpu.w_sp(sp+6)
        elif op==0xa9eb:
            selector=mem.r16(sp);command=selector&255;dtype=selector&0xff00;dst=mem.r32(sp+2)
            def source(p):
                if dtype==0x2000:return mem.r16s(p)
                if dtype==0x2800:return mem.r32s(p)
                if dtype==0x1000:return struct.unpack('>f',bytes(mem.r_block(p,4)))[0]
                if dtype==0:return self.ext(p)
                raise RuntimeError(f'Unsupported SANE dtype {dtype:04x}')
            if command==0x17:mem.w16(dst,self.env);cpu.w_sp(sp+6)
            elif command==1:self.env=mem.r16(dst);self.exceptions=0;cpu.w_sp(sp+6)
            elif command==0x19:self.env=mem.r16(dst);cpu.w_sp(sp+6)
            elif command==0x1b:mem.w8(dst,int(bool(self.exceptions & mem.r16(dst))));cpu.w_sp(sp+6)
            elif command==0x0d:self.put_ext(dst,-self.ext(dst));cpu.w_sp(sp+6)
            elif command==0x12:self.put_ext(dst,math.sqrt(self.ext(dst)));cpu.w_sp(sp+6)
            elif command==0x10:
                value=self.ext(mem.r32(sp+6));integer=int(value);self.exceptions|=4 if integer!=value else 0
                if dtype!=0x2800:raise RuntimeError(f'Unsupported SANE conversion {selector:04x}')
                mem.w32(dst,integer&0xffffffff);cpu.w_sp(sp+10)
            else:
                x=source(mem.r32(sp+6))
                if command==0x0e:self.put_ext(dst,x)
                elif command==0:self.put_ext(dst,self.ext(dst)+x)
                elif command==4:self.put_ext(dst,self.ext(dst)*x)
                elif command==6:self.put_ext(dst,self.ext(dst)/x)
                else:raise RuntimeError(f'Unsupported SANE selector {selector:04x}')
                cpu.w_sp(sp+10)
    def provenance(self):
        return {'toolbox':'host platform shims, not Mac ROM','integer_geometry':['OffsetRect','SectRect','EqualRect','PtInRect'],'host_binary64_math':['PtToAngle','SANE FP68K','SANE Elems68K'],'rendering_noop':['PenSize'],'calls':self.calls}
