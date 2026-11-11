; CODE 5, 16098 bytes, resource-relative hexadecimal offsets.
; Linear sweep: embedded data may decode as instructions. Verify control flow.
0004: 4e560000                 link.w     a6, #$0
0008: 302e0008                 move.w     $8(a6), d0
000c: 60000062                 bra.w      $70
0010: 3d7c0064000a             move.w     #$64, $a(a6)
0016: 60000082                 bra.w      $9a
001a: 3d7c004b000a             move.w     #$4b, $a(a6)
0020: 60000078                 bra.w      $9a
0024: 3d7c0032000a             move.w     #$32, $a(a6)
002a: 6000006e                 bra.w      $9a
002e: 3d7c0028000a             move.w     #$28, $a(a6)
0034: 60000064                 bra.w      $9a
0038: 3d7c001e000a             move.w     #$1e, $a(a6)
003e: 605a                     bra.b      $9a
0040: 3d7c0014000a             move.w     #$14, $a(a6)
0046: 6052                     bra.b      $9a
0048: 3d7c0011000a             move.w     #$11, $a(a6)
004e: 604a                     bra.b      $9a
0050: 3d7c000e000a             move.w     #$e, $a(a6)
0056: 6042                     bra.b      $9a
0058: 3d7c000a000a             move.w     #$a, $a(a6)
005e: 603a                     bra.b      $9a
0060: 3d7c0005000a             move.w     #$5, $a(a6)
0066: 6032                     bra.b      $9a
0068: 3d7c0001000a             move.w     #$1, $a(a6)
006e: 602a                     bra.b      $9a
0070: 0c40000b                 cmpi.w     #$b, d0
0074: 6420                     bcc.b      $96
0076: d040                     add.w      d0, d0
0078: 303b0006                 move.w     $80(pc, d0.w), d0
007c: 4efb0002                 jmp        $80(pc, d0.w)
0080: ff90                     dc.w       $ff90
0082: ff9a                     dc.w       $ff9a
0084: ffa4                     dc.w       $ffa4
0086: ffae                     dc.w       $ffae
0088: ffb8                     dc.w       $ffb8
008a: ffc0                     dc.w       $ffc0
008c: ffc8                     dc.w       $ffc8
008e: ffd0                     dc.w       $ffd0
0090: ffd8                     dc.w       $ffd8
0092: ffe0                     dc.w       $ffe0
0094: ffe8                     dc.w       $ffe8
0096: 426e000a                 clr.w      $a(a6)
009a: 4e5e                     unlk       a6
009c: 205f                     movea.l    (a7)+, a0
009e: 544f                     addq.w     #$2, a7
00a0: 4ed0                     jmp        (a0)
00a2: 4e56ffe8                 link.w     a6, #$ffe8
00a6: 48e70038                 movem.l    a2-a4, -(a7)
00aa: 286e0018                 movea.l    $18(a6), a4
00ae: 266e0010                 movea.l    $10(a6), a3
00b2: 246e0014                 movea.l    $14(a6), a2
00b6: 206e000c                 movea.l    $c(a6), a0
00ba: 43eeffe8                 lea.l      -$18(a6), a1
00be: 22d8                     move.l     (a0)+, (a1)+
00c0: 22d8                     move.l     (a0)+, (a1)+
00c2: 302effe8                 move.w     -$18(a6), d0
00c6: 906e0008                 sub.w      $8(a6), d0
00ca: 4a40                     tst.w      d0
00cc: 6d10                     blt.b      $de
00ce: 38bc0001                 move.w     #$1, (a4)
00d2: 302effe8                 move.w     -$18(a6), d0
00d6: 906e0008                 sub.w      $8(a6), d0
00da: 3680                     move.w     d0, (a3)
00dc: 6020                     bra.b      $fe
00de: 302e0008                 move.w     $8(a6), d0
00e2: 906effec                 sub.w      -$14(a6), d0
00e6: 4a40                     tst.w      d0
00e8: 6d10                     blt.b      $fa
00ea: 38bc0002                 move.w     #$2, (a4)
00ee: 302e0008                 move.w     $8(a6), d0
00f2: 906effec                 sub.w      -$14(a6), d0
00f6: 3680                     move.w     d0, (a3)
00f8: 6004                     bra.b      $fe
00fa: 4254                     clr.w      (a4)
00fc: 4253                     clr.w      (a3)
00fe: 302effea                 move.w     -$16(a6), d0
0102: 906e000a                 sub.w      $a(a6), d0
0106: 4a40                     tst.w      d0
0108: 6d12                     blt.b      $11c
010a: 3014                     move.w     (a4), d0
010c: 5640                     addq.w     #$3, d0
010e: 3880                     move.w     d0, (a4)
0110: 302effea                 move.w     -$16(a6), d0
0114: 906e000a                 sub.w      $a(a6), d0
0118: 3480                     move.w     d0, (a2)
011a: 6020                     bra.b      $13c
011c: 302e000a                 move.w     $a(a6), d0
0120: 906effee                 sub.w      -$12(a6), d0
0124: 4a40                     tst.w      d0
0126: 6d12                     blt.b      $13a
0128: 3014                     move.w     (a4), d0
012a: 5c40                     addq.w     #$6, d0
012c: 3880                     move.w     d0, (a4)
012e: 302e000a                 move.w     $a(a6), d0
0132: 906effee                 sub.w      -$12(a6), d0
0136: 3480                     move.w     d0, (a2)
0138: 6002                     bra.b      $13c
013a: 4252                     clr.w      (a2)
013c: 4cdf1c00                 movem.l    (a7)+, a2-a4
0140: 4e5e                     unlk       a6
0142: 205f                     movea.l    (a7)+, a0
0144: 4fef0014                 lea.l      $14(a7), a7
0148: 4ed0                     jmp        (a0)
014a: 4e56ffda                 link.w     a6, #$ffda
014e: 206e000c                 movea.l    $c(a6), a0
0152: 43eeffe8                 lea.l      -$18(a6), a1
0156: 22d8                     move.l     (a0)+, (a1)+
0158: 22d8                     move.l     (a0)+, (a1)+
015a: 486effe6                 pea.l      -$1a(a6)
015e: 486effe4                 pea.l      -$1c(a6)
0162: 486effe2                 pea.l      -$1e(a6)
0166: 486effe8                 pea.l      -$18(a6)
016a: 2f2e0008                 move.l     $8(a6), -(a7)
016e: 4ebaff32                 jsr        $a2(pc)
0172: 4a6effe6                 tst.w      -$1a(a6)
0176: 6618                     bne.b      $190
0178: 554f                     subq.w     #$2, a7
017a: a861                     dc.w       $a861
017c: 301f                     move.w     (a7)+, d0
017e: 6a02                     bpl.b      $182
0180: 4440                     neg.w      d0
0182: 48c0                     ext.l      d0
0184: 81fc0008                 divs.w     #$8, d0
0188: 4840                     swap       d0
018a: 5240                     addq.w     #$1, d0
018c: 3d40ffe6                 move.w     d0, -$1a(a6)
0190: 302effe6                 move.w     -$1a(a6), d0
0194: 60000132                 bra.w      $2c8
0198: 486effe8                 pea.l      -$18(a6)
019c: 4267                     clr.w      -(a7)
019e: 554f                     subq.w     #$2, a7
01a0: 3f2effe2                 move.w     -$1e(a6), -(a7)
01a4: 4ebafe5e                 jsr        $4(pc)
01a8: a8a8                     dc.w       $a8a8
01aa: 6000013e                 bra.w      $2ea
01ae: 486effe8                 pea.l      -$18(a6)
01b2: 4267                     clr.w      -(a7)
01b4: 554f                     subq.w     #$2, a7
01b6: 3f2effe2                 move.w     -$1e(a6), -(a7)
01ba: 4ebafe48                 jsr        $4(pc)
01be: 301f                     move.w     (a7)+, d0
01c0: 4440                     neg.w      d0
01c2: 3f00                     move.w     d0, -(a7)
01c4: a8a8                     dc.w       $a8a8
01c6: 60000122                 bra.w      $2ea
01ca: 486effe8                 pea.l      -$18(a6)
01ce: 554f                     subq.w     #$2, a7
01d0: 3f2effe4                 move.w     -$1c(a6), -(a7)
01d4: 4ebafe2e                 jsr        $4(pc)
01d8: 4267                     clr.w      -(a7)
01da: a8a8                     dc.w       $a8a8
01dc: 6000010c                 bra.w      $2ea
01e0: 486effe8                 pea.l      -$18(a6)
01e4: 554f                     subq.w     #$2, a7
01e6: 3f2effe4                 move.w     -$1c(a6), -(a7)
01ea: 4ebafe18                 jsr        $4(pc)
01ee: 301f                     move.w     (a7)+, d0
01f0: 48c0                     ext.l      d0
01f2: 81fc0002                 divs.w     #$2, d0
01f6: 3f00                     move.w     d0, -(a7)
01f8: 554f                     subq.w     #$2, a7
01fa: 3f2effe2                 move.w     -$1e(a6), -(a7)
01fe: 4ebafe04                 jsr        $4(pc)
0202: 301f                     move.w     (a7)+, d0
0204: 48c0                     ext.l      d0
0206: 81fc0002                 divs.w     #$2, d0
020a: 3f00                     move.w     d0, -(a7)
020c: a8a8                     dc.w       $a8a8
020e: 600000da                 bra.w      $2ea
0212: 486effe8                 pea.l      -$18(a6)
0216: 554f                     subq.w     #$2, a7
0218: 3f2effe4                 move.w     -$1c(a6), -(a7)
021c: 4ebafde6                 jsr        $4(pc)
0220: 301f                     move.w     (a7)+, d0
0222: 48c0                     ext.l      d0
0224: 81fc0002                 divs.w     #$2, d0
0228: 3f00                     move.w     d0, -(a7)
022a: 554f                     subq.w     #$2, a7
022c: 3f2effe2                 move.w     -$1e(a6), -(a7)
0230: 4ebafdd2                 jsr        $4(pc)
0234: 301f                     move.w     (a7)+, d0
0236: 48c0                     ext.l      d0
0238: 81fc0002                 divs.w     #$2, d0
023c: 4440                     neg.w      d0
023e: 3f00                     move.w     d0, -(a7)
0240: a8a8                     dc.w       $a8a8
0242: 600000a6                 bra.w      $2ea
0246: 486effe8                 pea.l      -$18(a6)
024a: 554f                     subq.w     #$2, a7
024c: 3f2effe4                 move.w     -$1c(a6), -(a7)
0250: 4ebafdb2                 jsr        $4(pc)
0254: 301f                     move.w     (a7)+, d0
0256: 4440                     neg.w      d0
0258: 3f00                     move.w     d0, -(a7)
025a: 4267                     clr.w      -(a7)
025c: a8a8                     dc.w       $a8a8
025e: 6000008a                 bra.w      $2ea
0262: 486effe8                 pea.l      -$18(a6)
0266: 554f                     subq.w     #$2, a7
0268: 3f2effe4                 move.w     -$1c(a6), -(a7)
026c: 4ebafd96                 jsr        $4(pc)
0270: 301f                     move.w     (a7)+, d0
0272: 48c0                     ext.l      d0
0274: 81fc0002                 divs.w     #$2, d0
0278: 4440                     neg.w      d0
027a: 3f00                     move.w     d0, -(a7)
027c: 554f                     subq.w     #$2, a7
027e: 3f2effe2                 move.w     -$1e(a6), -(a7)
0282: 4ebafd80                 jsr        $4(pc)
0286: 301f                     move.w     (a7)+, d0
0288: 48c0                     ext.l      d0
028a: 81fc0002                 divs.w     #$2, d0
028e: 3f00                     move.w     d0, -(a7)
0290: a8a8                     dc.w       $a8a8
0292: 6056                     bra.b      $2ea
0294: 486effe8                 pea.l      -$18(a6)
0298: 554f                     subq.w     #$2, a7
029a: 3f2effe4                 move.w     -$1c(a6), -(a7)
029e: 4ebafd64                 jsr        $4(pc)
02a2: 301f                     move.w     (a7)+, d0
02a4: 48c0                     ext.l      d0
02a6: 81fc0002                 divs.w     #$2, d0
02aa: 4440                     neg.w      d0
02ac: 3f00                     move.w     d0, -(a7)
02ae: 554f                     subq.w     #$2, a7
02b0: 3f2effe2                 move.w     -$1e(a6), -(a7)
02b4: 4ebafd4e                 jsr        $4(pc)
02b8: 301f                     move.w     (a7)+, d0
02ba: 48c0                     ext.l      d0
02bc: 81fc0002                 divs.w     #$2, d0
02c0: 4440                     neg.w      d0
02c2: 3f00                     move.w     d0, -(a7)
02c4: a8a8                     dc.w       $a8a8
02c6: 6022                     bra.b      $2ea
02c8: 5340                     subq.w     #$1, d0
02ca: 0c400008                 cmpi.w     #$8, d0
02ce: 641a                     bcc.b      $2ea
02d0: d040                     add.w      d0, d0
02d2: 303b0006                 move.w     $2da(pc, d0.w), d0
02d6: 4efb0002                 jmp        $2da(pc, d0.w)
02da: febe                     dc.w       $febe
02dc: fed4                     dc.w       $fed4
02de: fef0                     dc.w       $fef0
02e0: ff06                     dc.w       $ff06
02e2: ff38                     dc.w       $ff38
02e4: ff6c                     dc.w       $ff6c
02e6: ff88                     dc.w       $ff88
02e8: ffba                     dc.w       $ffba
02ea: 4a6effea                 tst.w      -$16(a6)
02ee: 6e18                     bgt.b      $308
02f0: 486effe8                 pea.l      -$18(a6)
02f4: 3f3c0001                 move.w     #$1, -(a7)
02f8: 3f2effe8                 move.w     -$18(a6), -(a7)
02fc: 3f3c0047                 move.w     #$47, -(a7)
0300: 3f2effec                 move.w     -$14(a6), -(a7)
0304: a8a7                     dc.w       $a8a7
0306: 601e                     bra.b      $326
0308: 0c6e01afffee             cmpi.w     #$1af, -$12(a6)
030e: 6d16                     blt.b      $326
0310: 486effe8                 pea.l      -$18(a6)
0314: 3f3c0168                 move.w     #$168, -(a7)
0318: 3f2effe8                 move.w     -$18(a6), -(a7)
031c: 3f3c01ae                 move.w     #$1ae, -(a7)
0320: 3f2effec                 move.w     -$14(a6), -(a7)
0324: a8a7                     dc.w       $a8a7
0326: 4a6effe8                 tst.w      -$18(a6)
032a: 6e18                     bgt.b      $344
032c: 486effe8                 pea.l      -$18(a6)
0330: 3f2effea                 move.w     -$16(a6), -(a7)
0334: 3f3c0001                 move.w     #$1, -(a7)
0338: 3f2effee                 move.w     -$12(a6), -(a7)
033c: 3f3c001f                 move.w     #$1f, -(a7)
0340: a8a7                     dc.w       $a8a7
0342: 601e                     bra.b      $362
0344: 0c6e00fbffec             cmpi.w     #$fb, -$14(a6)
034a: 6d16                     blt.b      $362
034c: 486effe8                 pea.l      -$18(a6)
0350: 3f2effea                 move.w     -$16(a6), -(a7)
0354: 3f3c00dc                 move.w     #$dc, -(a7)
0358: 3f2effee                 move.w     -$12(a6), -(a7)
035c: 3f3c00fa                 move.w     #$fa, -(a7)
0360: a8a7                     dc.w       $a8a7
0362: 206e0010                 movea.l    $10(a6), a0
0366: 43eeffe8                 lea.l      -$18(a6), a1
036a: 20d9                     move.l     (a1)+, (a0)+
036c: 20d9                     move.l     (a1)+, (a0)+
036e: 4e5e                     unlk       a6
0370: 205f                     movea.l    (a7)+, a0
0372: 504f                     addq.w     #$8, a7
0374: 4ed0                     jmp        (a0)
0376: 4e56fef2                 link.w     a6, #$fef2
037a: 48e70118                 movem.l    d7/a3-a4, -(a7)
037e: 4207                     clr.b      d7
0380: a850                     dc.w       $a850
0382: 6004                     bra.b      $388
0384: 4ead0042                 jsr        $42(a5) ; CODE 4 resource+0x00e4
0388: 554f                     subq.w     #$2, a7
038a: 3f3c0040                 move.w     #$40, -(a7)
038e: 486dbdca                 pea.l      -$4236(a5)
0392: a970                     dc.w       $a970
0394: 4a1f                     tst.b      (a7)+
0396: 66ec                     bne.b      $384
0398: 486effec                 pea.l      -$14(a6)
039c: a874                     dc.w       $a874
039e: 594f                     subq.w     #$4, a7
03a0: 3f3c0080                 move.w     #$80, -(a7)
03a4: 486eff3e                 pea.l      -$c2(a6)
03a8: 70ff                     moveq      #$ff, d0
03aa: 2f00                     move.l     d0, -(a7)
03ac: a97c                     dc.w       $a97c
03ae: 265f                     movea.l    (a7)+, a3
03b0: 2f0b                     move.l     a3, -(a7)
03b2: a873                     dc.w       $a873
03b4: 594f                     subq.w     #$4, a7
03b6: 3f3c0080                 move.w     #$80, -(a7)
03ba: a9bc                     dc.w       $a9bc
03bc: 285f                     movea.l    (a7)+, a4
03be: 486eff1e                 pea.l      -$e2(a6)
03c2: 3f3c0001                 move.w     #$1, -(a7)
03c6: 3f3c0001                 move.w     #$1, -(a7)
03ca: 3f3c0047                 move.w     #$47, -(a7)
03ce: 3f3c001f                 move.w     #$1f, -(a7)
03d2: a8a7                     dc.w       $a8a7
03d4: 486eff2e                 pea.l      -$d2(a6)
03d8: 3f3c004b                 move.w     #$4b, -(a7)
03dc: 3f3c00af                 move.w     #$af, -(a7)
03e0: 3f3c0091                 move.w     #$91, -(a7)
03e4: 3f3c00cd                 move.w     #$cd, -(a7)
03e8: a8a7                     dc.w       $a8a7
03ea: 41eeff2e                 lea.l      -$d2(a6), a0
03ee: 43eeff26                 lea.l      -$da(a6), a1
03f2: 22d8                     move.l     (a0)+, (a1)+
03f4: 22d8                     move.l     (a0)+, (a1)+
03f6: 2f0b                     move.l     a3, -(a7)
03f8: a981                     dc.w       $a981
03fa: 594f                     subq.w     #$4, a7
03fc: 2f3c00000230             move.l     #$230, -(a7)
0402: 4ead0152                 jsr        $152(a5) ; CODE 1 resource+0x0530
0406: 2d5fff08                 move.l     (a7)+, -$f8(a6)
040a: 3d7c000eff0c             move.w     #$e, -$f4(a6)
0410: 486eff0e                 pea.l      -$f2(a6)
0414: 4267                     clr.w      -(a7)
0416: 4267                     clr.w      -(a7)
0418: 3f3c0047                 move.w     #$47, -(a7)
041c: 3f3c001f                 move.w     #$1f, -(a7)
0420: a8a7                     dc.w       $a8a7
0422: 206dffca                 movea.l    -$36(a5), a0
0426: 48680002                 pea.l      $2(a0)
042a: 486eff08                 pea.l      -$f8(a6)
042e: 486eff2e                 pea.l      -$d2(a6)
0432: 486eff1e                 pea.l      -$e2(a6)
0436: 4267                     clr.w      -(a7)
0438: 42a7                     clr.l      -(a7)
043a: a8ec                     dc.w       $a8ec
043c: 2f0c                     move.l     a4, -(a7)
043e: 205f                     movea.l    (a7)+, a0
0440: a029                     dc.w       $a029
0442: 2f0c                     move.l     a4, -(a7)
0444: 486eff2e                 pea.l      -$d2(a6)
0448: a8f6                     dc.w       $a8f6
044a: a9b4                     dc.w       $a9b4
044c: 486eff36                 pea.l      -$ca(a6)
0450: a972                     dc.w       $a972
0452: 41eeff2e                 lea.l      -$d2(a6), a0
0456: 43eeff16                 lea.l      -$ea(a6), a1
045a: 22d8                     move.l     (a0)+, (a1)+
045c: 22d8                     move.l     (a0)+, (a1)+
045e: 486eff16                 pea.l      -$ea(a6)
0462: 3f3cfff6                 move.w     #$fff6, -(a7)
0466: 3f3cfff6                 move.w     #$fff6, -(a7)
046a: a8a9                     dc.w       $a8a9
046c: 554f                     subq.w     #$2, a7
046e: 2f2eff36                 move.l     -$ca(a6), -(a7)
0472: 486eff16                 pea.l      -$ea(a6)
0476: a8ad                     dc.w       $a8ad
0478: 4a1f                     tst.b      (a7)+
047a: 67000080                 beq.w      $4fc
047e: 486efef2                 pea.l      -$10e(a6)
0482: 486eff2e                 pea.l      -$d2(a6)
0486: 2f2eff36                 move.l     -$ca(a6), -(a7)
048a: 4ebafcbe                 jsr        $14a(pc)
048e: 584f                     addq.w     #$4, a7
0490: 41eefef2                 lea.l      -$10e(a6), a0
0494: 43eeff2e                 lea.l      -$d2(a6), a1
0498: 22d8                     move.l     (a0)+, (a1)+
049a: 22d8                     move.l     (a0)+, (a1)+
049c: 554f                     subq.w     #$2, a7
049e: 486eff2e                 pea.l      -$d2(a6)
04a2: 486eff26                 pea.l      -$da(a6)
04a6: a8a6                     dc.w       $a8a6
04a8: 101f                     move.b     (a7)+, d0
04aa: 5300                     subq.b     #$1, d0
04ac: 674e                     beq.b      $4fc
04ae: 486eff08                 pea.l      -$f8(a6)
04b2: 206dffca                 movea.l    -$36(a5), a0
04b6: 48680002                 pea.l      $2(a0)
04ba: 486eff1e                 pea.l      -$e2(a6)
04be: 486eff26                 pea.l      -$da(a6)
04c2: 4267                     clr.w      -(a7)
04c4: 42a7                     clr.l      -(a7)
04c6: a8ec                     dc.w       $a8ec
04c8: 206dffca                 movea.l    -$36(a5), a0
04cc: 48680002                 pea.l      $2(a0)
04d0: 486eff08                 pea.l      -$f8(a6)
04d4: 486eff2e                 pea.l      -$d2(a6)
04d8: 486eff1e                 pea.l      -$e2(a6)
04dc: 4267                     clr.w      -(a7)
04de: 42a7                     clr.l      -(a7)
04e0: a8ec                     dc.w       $a8ec
04e2: 2f0c                     move.l     a4, -(a7)
04e4: 486eff2e                 pea.l      -$d2(a6)
04e8: a8f6                     dc.w       $a8f6
04ea: 41eeff2e                 lea.l      -$d2(a6), a0
04ee: 43eeff26                 lea.l      -$da(a6), a1
04f2: 22d8                     move.l     (a0)+, (a1)+
04f4: 22d8                     move.l     (a0)+, (a1)+
04f6: 2d6eff36ff3a             move.l     -$ca(a6), -$c6(a6)
04fc: 554f                     subq.w     #$2, a7
04fe: 3f3c0008                 move.w     #$8, -(a7)
0502: 486dbdca                 pea.l      -$4236(a5)
0506: a970                     dc.w       $a970
0508: 4a1f                     tst.b      (a7)+
050a: 6712                     beq.b      $51e
050c: 202dbdcc                 move.l     -$4234(a5), d0
0510: 0280000000ff             andi.l     #$ff, d0
0516: 720d                     moveq      #$d, d1
0518: b081                     cmp.l      d1, d0
051a: 6602                     bne.b      $51e
051c: 7e01                     moveq      #$1, d7
051e: 554f                     subq.w     #$2, a7
0520: a974                     dc.w       $a974
0522: 4a1f                     tst.b      (a7)+
0524: 6712                     beq.b      $538
0526: 554f                     subq.w     #$2, a7
0528: 2f2eff36                 move.l     -$ca(a6), -(a7)
052c: 486eff2e                 pea.l      -$d2(a6)
0530: a8ad                     dc.w       $a8ad
0532: 4a1f                     tst.b      (a7)+
0534: 6702                     beq.b      $538
0536: 7e01                     moveq      #$1, d7
0538: 4a07                     tst.b      d7
053a: 6700ff0e                 beq.w      $44a
053e: 486eff2e                 pea.l      -$d2(a6)
0542: 3f3c000a                 move.w     #$a, -(a7)
0546: 3f3c000a                 move.w     #$a, -(a7)
054a: a8b3                     dc.w       $a8b3
054c: 3f3c003e                 move.w     #$3e, -(a7)
0550: 4267                     clr.w      -(a7)
0552: 201f                     move.l     (a7)+, d0
0554: a032                     dc.w       $a032
0556: 2f2eff08                 move.l     -$f8(a6), -(a7)
055a: 205f                     movea.l    (a7)+, a0
055c: a01f                     dc.w       $a01f
055e: 2f0c                     move.l     a4, -(a7)
0560: 205f                     movea.l    (a7)+, a0
0562: a02a                     dc.w       $a02a
0564: 2f0b                     move.l     a3, -(a7)
0566: a982                     dc.w       $a982
0568: 2f2effec                 move.l     -$14(a6), -(a7)
056c: a873                     dc.w       $a873
056e: 4cdf1880                 movem.l    (a7)+, d7/a3-a4
0572: 4e5e                     unlk       a6
0574: 4e75                     rts        
0576: 6004                     bra.b      $57c
0578: 4ead0042                 jsr        $42(a5) ; CODE 4 resource+0x00e4
057c: 554f                     subq.w     #$2, a7
057e: 3f3c0040                 move.w     #$40, -(a7)
0582: 486dbdca                 pea.l      -$4236(a5)
0586: a970                     dc.w       $a970
0588: 4a1f                     tst.b      (a7)+
058a: 66ec                     bne.b      $578
058c: 486dfe3a                 pea.l      -$1c6(a5)
0590: a874                     dc.w       $a874
0592: 594f                     subq.w     #$4, a7
0594: 3f3c0089                 move.w     #$89, -(a7)
0598: 486dfe42                 pea.l      -$1be(a5)
059c: 70ff                     moveq      #$ff, d0
059e: 2f00                     move.l     d0, -(a7)
05a0: a97c                     dc.w       $a97c
05a2: 2b5ffe3e                 move.l     (a7)+, -$1c2(a5)
05a6: 2f2dfe3e                 move.l     -$1c2(a5), -(a7)
05aa: a873                     dc.w       $a873
05ac: 2f2dfe3e                 move.l     -$1c2(a5), -(a7)
05b0: a981                     dc.w       $a981
05b2: 4e75                     rts        
05b4: 2f2dfe3e                 move.l     -$1c2(a5), -(a7)
05b8: a982                     dc.w       $a982
05ba: 2f2dfe3a                 move.l     -$1c6(a5), -(a7)
05be: a873                     dc.w       $a873
05c0: 4e75                     rts        
05c2: 4e56ffec                 link.w     a6, #$ffec
05c6: 48e70308                 movem.l    d6-d7/a4, -(a7)
05ca: 302dfdf4                 move.w     -$20c(a5), d0
05ce: b06dfe00                 cmp.w      -$200(a5), d0
05d2: 6d50                     blt.b      $624
05d4: 3f2dfdf8                 move.w     -$208(a5), -(a7)
05d8: 302dfe04                 move.w     -$1fc(a5), d0
05dc: c1edfdf6                 muls.w     -$20a(a5), d0
05e0: d06dfdfa                 add.w      -$206(a5), d0
05e4: 3f00                     move.w     d0, -(a7)
05e6: a893                     dc.w       $a893
05e8: 2f2dfbdc                 move.l     -$424(a5), -(a7)
05ec: 205f                     movea.l    (a7)+, a0
05ee: a029                     dc.w       $a029
05f0: 206dfbdc                 movea.l    -$424(a5), a0
05f4: 2850                     movea.l    (a0), a4
05f6: 3e2dfbe0                 move.w     -$420(a5), d7
05fa: de47                     add.w      d7, d7
05fc: 3e347060                 move.w     $60(a4, d7.w), d7
0600: 3c2dfbe0                 move.w     -$420(a5), d6
0604: 5246                     addq.w     #$1, d6
0606: dc46                     add.w      d6, d6
0608: 30346060                 move.w     $60(a4, d6.w), d0
060c: 9047                     sub.w      d7, d0
060e: 3c00                     move.w     d0, d6
0610: 206c003e                 movea.l    $3e(a4), a0
0614: 2f10                     move.l     (a0), -(a7)
0616: 3f07                     move.w     d7, -(a7)
0618: 3f06                     move.w     d6, -(a7)
061a: a885                     dc.w       $a885
061c: 2f2dfbdc                 move.l     -$424(a5), -(a7)
0620: 205f                     movea.l    (a7)+, a0
0622: a02a                     dc.w       $a02a
0624: 302dfe04                 move.w     -$1fc(a5), d0
0628: 5240                     addq.w     #$1, d0
062a: 3b40fe04                 move.w     d0, -$1fc(a5)
062e: 302dfbe0                 move.w     -$420(a5), d0
0632: 5240                     addq.w     #$1, d0
0634: 3b40fbe0                 move.w     d0, -$420(a5)
0638: 4cdf10c0                 movem.l    (a7)+, d6-d7/a4
063c: 4e5e                     unlk       a6
063e: 4e75                     rts        
0640: 4e56fdee                 link.w     a6, #$fdee
0644: 2f07                     move.l     d7, -(a7)
0646: 426dfe04                 clr.w      -$1fc(a5)
064a: 3e2dfdf6                 move.w     -$20a(a5), d7
064e: de47                     add.w      d7, d7
0650: 302dfdfa                 move.w     -$206(a5), d0
0654: 9047                     sub.w      d7, d0
0656: 3e00                     move.w     d0, d7
0658: be6dfdf6                 cmp.w      -$20a(a5), d7
065c: 6c04                     bge.b      $662
065e: 3e2dfdfa                 move.w     -$206(a5), d7
0662: 3f2dfdf8                 move.w     -$208(a5), -(a7)
0666: 3f07                     move.w     d7, -(a7)
0668: a893                     dc.w       $a893
066a: 1d7c0001feec             move.b     #$1, -$114(a6)
0670: 7000                     moveq      #$0, d0
0672: 102efeec                 move.b     -$114(a6), d0
0676: 3f00                     move.w     d0, -(a7)
0678: a888                     dc.w       $a888
067a: 486dfadc                 pea.l      -$524(a5)
067e: a884                     dc.w       $a884
0680: 486efdee                 pea.l      -$212(a6)
0684: 486dfbea                 pea.l      -$416(a5)
0688: 487a00d0                 pea.l      $75a(pc)
068c: 486dfcea                 pea.l      -$316(a5)
0690: 3f3c0003                 move.w     #$3, -(a7)
0694: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
0698: 584f                     addq.w     #$4, a7
069a: 3f3c00ff                 move.w     #$ff, -(a7)
069e: 486efdee                 pea.l      -$212(a6)
06a2: 486efeee                 pea.l      -$112(a6)
06a6: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
06aa: 302dfdfe                 move.w     -$202(a5), d0
06ae: 906dfdf8                 sub.w      -$208(a5), d0
06b2: 2f00                     move.l     d0, -(a7)
06b4: 554f                     subq.w     #$2, a7
06b6: 486efeee                 pea.l      -$112(a6)
06ba: a88c                     dc.w       $a88c
06bc: 321f                     move.w     (a7)+, d1
06be: 201f                     move.l     (a7)+, d0
06c0: 9041                     sub.w      d1, d0
06c2: 48c0                     ext.l      d0
06c4: 81fc0002                 divs.w     #$2, d0
06c8: d06dfdf8                 add.w      -$208(a5), d0
06cc: 3f00                     move.w     d0, -(a7)
06ce: 3f07                     move.w     d7, -(a7)
06d0: a893                     dc.w       $a893
06d2: 486efeee                 pea.l      -$112(a6)
06d6: a884                     dc.w       $a884
06d8: 302dfdf4                 move.w     -$20c(a5), d0
06dc: 5240                     addq.w     #$1, d0
06de: 48c0                     ext.l      d0
06e0: 2f00                     move.l     d0, -(a7)
06e2: 486efeee                 pea.l      -$112(a6)
06e6: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
06ea: 486efdee                 pea.l      -$212(a6)
06ee: 487a0062                 pea.l      $752(pc)
06f2: 486efeee                 pea.l      -$112(a6)
06f6: 487a0054                 pea.l      $74c(pc)
06fa: 3f3c0003                 move.w     #$3, -(a7)
06fe: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
0702: 584f                     addq.w     #$4, a7
0704: 3f3c00ff                 move.w     #$ff, -(a7)
0708: 486efdee                 pea.l      -$212(a6)
070c: 486efeee                 pea.l      -$112(a6)
0710: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
0714: 554f                     subq.w     #$2, a7
0716: 486efeee                 pea.l      -$112(a6)
071a: a88c                     dc.w       $a88c
071c: 302dfdfe                 move.w     -$202(a5), d0
0720: 905f                     sub.w      (a7)+, d0
0722: 3f00                     move.w     d0, -(a7)
0724: 3f07                     move.w     d7, -(a7)
0726: a893                     dc.w       $a893
0728: 486efeee                 pea.l      -$112(a6)
072c: a884                     dc.w       $a884
072e: 422efeec                 clr.b      -$114(a6)
0732: 7000                     moveq      #$0, d0
0734: 102efeec                 move.b     -$114(a6), d0
0738: 3f00                     move.w     d0, -(a7)
073a: a888                     dc.w       $a888
073c: 302dfe04                 move.w     -$1fc(a5), d0
0740: 5440                     addq.w     #$2, d0
0742: 3b40fe04                 move.w     d0, -$1fc(a5)
0746: 2e1f                     move.l     (a7)+, d7
0748: 4e5e                     unlk       a6
074a: 4e75                     rts        
074c: 04202020                 subi.b     #$20, -(a0)
0750: 2016                     move.l     (a6), d0
0752: 0750                     bchg.b     d3, (a0)
0754: 6167                     bsr.b      $7bd
0756: 6520                     bcs.b      $778
0758: 2320                     move.l     -(a0), -(a1)
075a: 04202020                 subi.b     #$20, -(a0)
075e: 2012                     move.l     (a2), d0
0760: 4e56faf0                 link.w     a6, #$faf0
0764: 206e0008                 movea.l    $8(a6), a0
0768: 43eefef0                 lea.l      -$110(a6), a1
076c: 703f                     moveq      #$3f, d0
076e: 22d8                     move.l     (a0)+, (a1)+
0770: 51c8fffc                 dbra       d0, $76e
0774: 102dfe0a                 move.b     -$1f6(a5), d0
0778: 5300                     subq.b     #$1, d0
077a: 2f00                     move.l     d0, -(a7)
077c: 554f                     subq.w     #$2, a7
077e: 2f3cba000000             move.l     #$ba000000, -(a7)
0784: a8fd                     dc.w       $a8fd
0786: 321f                     move.w     (a7)+, d1
0788: 201f                     move.l     (a7)+, d0
078a: 4a41                     tst.w      d1
078c: 56c1                     sne.b      d1
078e: 8001                     or.b       d1, d0
0790: 670000b0                 beq.w      $842
0794: 4aadfe0c                 tst.l      -$1f4(a5)
0798: 671c                     beq.b      $7b6
079a: 2f2dfe0c                 move.l     -$1f4(a5), -(a7)
079e: 2f3c1800040c             move.l     #$1800040c, -(a7)
07a4: a8fd                     dc.w       $a8fd
07a6: 2f2dfe0c                 move.l     -$1f4(a5), -(a7)
07aa: 2f3c08000484             move.l     #$8000484, -(a7)
07b0: a8fd                     dc.w       $a8fd
07b2: 42adfe0c                 clr.l      -$1f4(a5)
07b6: 554f                     subq.w     #$2, a7
07b8: 2f3cba000000             move.l     #$ba000000, -(a7)
07be: a8fd                     dc.w       $a8fd
07c0: 4a5f                     tst.w      (a7)+
07c2: 56c0                     sne.b      d0
07c4: 122dfe0a                 move.b     -$1f6(a5), d1
07c8: 5301                     subq.b     #$1, d1
07ca: 8001                     or.b       d1, d0
07cc: 6768                     beq.b      $836
07ce: 2f2dfe36                 move.l     -$1ca(a5), -(a7)
07d2: a873                     dc.w       $a873
07d4: 554f                     subq.w     #$2, a7
07d6: 2f3cba000000             move.l     #$ba000000, -(a7)
07dc: a8fd                     dc.w       $a8fd
07de: 301f                     move.w     (a7)+, d0
07e0: 48c0                     ext.l      d0
07e2: 2f00                     move.l     d0, -(a7)
07e4: 486efdf0                 pea.l      -$210(a6)
07e8: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
07ec: 486efcf0                 pea.l      -$310(a6)
07f0: 486efbf0                 pea.l      -$410(a6)
07f4: 486efaf0                 pea.l      -$510(a6)
07f8: 487a005a                 pea.l      $854(pc)
07fc: 486efdf0                 pea.l      -$210(a6)
0800: 3f3c0002                 move.w     #$2, -(a7)
0804: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
0808: 584f                     addq.w     #$4, a7
080a: 486efaf0                 pea.l      -$510(a6)
080e: 487a003e                 pea.l      $84e(pc)
0812: 3f3c0002                 move.w     #$2, -(a7)
0816: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
081a: 584f                     addq.w     #$4, a7
081c: 486efbf0                 pea.l      -$410(a6)
0820: 486efef0                 pea.l      -$110(a6)
0824: 3f3c0002                 move.w     #$2, -(a7)
0828: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
082c: 584f                     addq.w     #$4, a7
082e: 486efcf0                 pea.l      -$310(a6)
0832: 4ead005a                 jsr        $5a(a5) ; CODE 4 resource+0x0ae6
0836: 422e000c                 clr.b      $c(a6)
083a: 1b7c0001fdea             move.b     #$1, -$216(a5)
0840: 6006                     bra.b      $848
0842: 1d7c0001000c             move.b     #$1, $c(a6)
0848: 4e5e                     unlk       a6
084a: 2e9f                     move.l     (a7)+, (a7)
084c: 4e75                     rts        
084e: 042e2e2e2016             subi.b     #$2e, $2016(a6)
0854: 13457272                 move.b     d5, $7272(a1)
0858: 6f72                     ble.b      $8cc
085a: 20696e20                 movea.l    $6e20(a1), a0
085e: 5072696e7469             addq.w     #$8, ([$7469, a2])
0864: 6e67                     bgt.b      $8cd
0866: 2023                     move.l     -(a3), d0
0868: 4e56ffee                 link.w     a6, #$ffee
086c: 2f07                     move.l     d7, -(a7)
086e: 426dfbe0                 clr.w      -$420(a5)
0872: 426dfdf4                 clr.w      -$20c(a5)
0876: 426dfe04                 clr.w      -$1fc(a5)
087a: 4207                     clr.b      d7
087c: 2f2dfe0c                 move.l     -$1f4(a5), -(a7)
0880: 42a7                     clr.l      -(a7)
0882: 2f3c10000808             move.l     #$10000808, -(a7)
0888: a8fd                     dc.w       $a8fd
088a: 554f                     subq.w     #$2, a7
088c: 487a00b8                 pea.l      $946(pc)
0890: 4ebafece                 jsr        $760(pc)
0894: 4a1f                     tst.b      (a7)+
0896: 67000088                 beq.w      $920
089a: 302dfdf4                 move.w     -$20c(a5), d0
089e: b06dfe00                 cmp.w      -$200(a5), d0
08a2: 6d62                     blt.b      $906
08a4: 4ebafd9a                 jsr        $640(pc)
08a8: 605c                     bra.b      $906
08aa: 302dfe04                 move.w     -$1fc(a5), d0
08ae: b06dfe08                 cmp.w      -$1f8(a5), d0
08b2: 6d48                     blt.b      $8fc
08b4: 302dfdf4                 move.w     -$20c(a5), d0
08b8: 5240                     addq.w     #$1, d0
08ba: 3b40fdf4                 move.w     d0, -$20c(a5)
08be: 302dfdf4                 move.w     -$20c(a5), d0
08c2: b06dfe02                 cmp.w      -$1fe(a5), d0
08c6: 6f04                     ble.b      $8cc
08c8: 7e01                     moveq      #$1, d7
08ca: 6030                     bra.b      $8fc
08cc: 2f2dfe0c                 move.l     -$1f4(a5), -(a7)
08d0: 2f3c1800040c             move.l     #$1800040c, -(a7)
08d6: a8fd                     dc.w       $a8fd
08d8: 2f2dfe0c                 move.l     -$1f4(a5), -(a7)
08dc: 42a7                     clr.l      -(a7)
08de: 2f3c10000808             move.l     #$10000808, -(a7)
08e4: a8fd                     dc.w       $a8fd
08e6: 554f                     subq.w     #$2, a7
08e8: 487a0048                 pea.l      $932(pc)
08ec: 4ebafe72                 jsr        $760(pc)
08f0: 4a1f                     tst.b      (a7)+
08f2: 6706                     beq.b      $8fa
08f4: 4ebafd4a                 jsr        $640(pc)
08f8: 6002                     bra.b      $8fc
08fa: 7e01                     moveq      #$1, d7
08fc: 1007                     move.b     d7, d0
08fe: 5300                     subq.b     #$1, d0
0900: 6704                     beq.b      $906
0902: 4ebafcbe                 jsr        $5c2(pc)
0906: 102dfdea                 move.b     -$216(a5), d0
090a: 5300                     subq.b     #$1, d0
090c: 1207                     move.b     d7, d1
090e: 5301                     subq.b     #$1, d1
0910: c001                     and.b      d1, d0
0912: 322dfbe0                 move.w     -$420(a5), d1
0916: b26dfbe2                 cmp.w      -$41e(a5), d1
091a: 5dc1                     slt.b      d1
091c: c001                     and.b      d1, d0
091e: 668a                     bne.b      $8aa
0920: 2f2dfe0c                 move.l     -$1f4(a5), -(a7)
0924: 2f3c1800040c             move.l     #$1800040c, -(a7)
092a: a8fd                     dc.w       $a8fd
092c: 2e1f                     move.l     (a7)+, d7
092e: 4e5e                     unlk       a6
0930: 4e75                     rts        
0932: 1220                     move.b     -(a0), d1
0934: 4361                     .byte      0x43, 0x61
0936: 6e6e                     bgt.b      $9a6
0938: 6f74                     ble.b      $9ae
093a: 204f                     movea.l    a7, a0
093c: 7065                     moveq      #$65, d0
093e: 6e20                     bgt.b      $960
0940: 5061                     addq.w     #$8, -(a1)
0942: 6765                     beq.b      $9a9
0944: 2016                     move.l     (a6), d0
0946: 1143616e                 move.b     d3, $616e(a0)
094a: 6e6f                     bgt.b      $9bb
094c: 7420                     moveq      #$20, d2
094e: 4f70                     .byte      0x4f, 0x70
0950: 656e                     bcs.b      $9c0
0952: 2050                     movea.l    (a0), a0
0954: 6167                     bsr.b      $9bd
0956: 6520                     bcs.b      $978
0958: 4e56feba                 link.w     a6, #$feba
095c: 48e70308                 movem.l    d6-d7/a4, -(a7)
0960: 2c2e000a                 move.l     $a(a6), d6
0964: 4aadf924                 tst.l      -$6dc(a5)
0968: 6604                     bne.b      $96e
096a: 4eba03e0                 jsr        $d4c(pc)
096e: 554f                     subq.w     #$2, a7
0970: 2f3cba000000             move.l     #$ba000000, -(a7)
0976: a8fd                     dc.w       $a8fd
0978: 4a5f                     tst.w      (a7)+
097a: 660002d4                 bne.w      $c50
097e: 2b6df924fe2a             move.l     -$6dc(a5), -$1d6(a5)
0984: 4207                     clr.b      d7
0986: 2f3cc8000000             move.l     #$c8000000, -(a7)
098c: a8fd                     dc.w       $a8fd
098e: 554f                     subq.w     #$2, a7
0990: 2f3cba000000             move.l     #$ba000000, -(a7)
0996: a8fd                     dc.w       $a8fd
0998: 4a5f                     tst.w      (a7)+
099a: 6706                     beq.b      $9a2
099c: 422dfe0a                 clr.b      -$1f6(a5)
09a0: 6006                     bra.b      $9a8
09a2: 1b7c0001fe0a             move.b     #$1, -$1f6(a5)
09a8: 554f                     subq.w     #$2, a7
09aa: 487a02e8                 pea.l      $c94(pc)
09ae: 4ebafdb0                 jsr        $760(pc)
09b2: 4a1f                     tst.b      (a7)+
09b4: 67000288                 beq.w      $c3e
09b8: 554f                     subq.w     #$2, a7
09ba: 2f2dfe2a                 move.l     -$1d6(a5), -(a7)
09be: 2f3c52040498             move.l     #$52040498, -(a7)
09c4: a8fd                     dc.w       $a8fd
09c6: 1b5ffe0b                 move.b     (a7)+, -$1f5(a5)
09ca: 422dfdea                 clr.b      -$216(a5)
09ce: 486dfe36                 pea.l      -$1ca(a5)
09d2: a874                     dc.w       $a874
09d4: 486effec                 pea.l      -$14(a6)
09d8: 4ead016a                 jsr        $16a(a5) ; CODE 1 resource+0x0552
09dc: 2f2effec                 move.l     -$14(a6), -(a7)
09e0: 1f3c0001                 move.b     #$1, -(a7)
09e4: 486dfbea                 pea.l      -$416(a5)
09e8: 4267                     clr.w      -(a7)
09ea: a9ed                     dc.w       $a9ed
09ec: 2f2effec                 move.l     -$14(a6), -(a7)
09f0: 4227                     clr.b      -(a7)
09f2: 486dfcea                 pea.l      -$316(a5)
09f6: 3f3c0002                 move.w     #$2, -(a7)
09fa: a9ed                     dc.w       $a9ed
09fc: 3b7c0032fe08             move.w     #$32, -$1f8(a5)
0a02: 3b7c000afdf8             move.w     #$a, -$208(a5)
0a08: a850                     dc.w       $a850
0a0a: 2046                     movea.l    d6, a0
0a0c: 2050                     movea.l    (a0), a0
0a0e: 3f3c00ff                 move.w     #$ff, -(a7)
0a12: 48680014                 pea.l      $14(a0)
0a16: 486dfadc                 pea.l      -$524(a5)
0a1a: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
0a1e: 2046                     movea.l    d6, a0
0a20: 2050                     movea.l    (a0), a0
0a22: 2b680002fbdc             move.l     $2(a0), -$424(a5)
0a28: 2f2dfbdc                 move.l     -$424(a5), -(a7)
0a2c: 205f                     movea.l    (a7)+, a0
0a2e: a029                     dc.w       $a029
0a30: 206dfbdc                 movea.l    -$424(a5), a0
0a34: 2850                     movea.l    (a0), a4
0a36: 486c004c                 pea.l      $4c(a4)
0a3a: 486efebc                 pea.l      -$144(a6)
0a3e: 3f3c0001                 move.w     #$1, -(a7)
0a42: 4ead012a                 jsr        $12a(a5) ; CODE 1 resource+0x0356
0a46: 1b6efedbfbe6             move.b     -$125(a6), -$41a(a5)
0a4c: 3b6c004afbe4             move.w     $4a(a4), -$41c(a5)
0a52: 3b6c0050fbe8             move.w     $50(a4), -$418(a5)
0a58: 2f2dfbdc                 move.l     -$424(a5), -(a7)
0a5c: 205f                     movea.l    (a7)+, a0
0a5e: a02a                     dc.w       $a02a
0a60: 554f                     subq.w     #$2, a7
0a62: 2f2dfbdc                 move.l     -$424(a5), -(a7)
0a66: 4ead0052                 jsr        $52(a5) ; CODE 4 resource+0x037e
0a6a: 3b5ffbe2                 move.w     (a7)+, -$41e(a5)
0a6e: 4a2e0008                 tst.b      $8(a6)
0a72: 6716                     beq.b      $a8a
0a74: 554f                     subq.w     #$2, a7
0a76: 2f2dfe2a                 move.l     -$1d6(a5), -(a7)
0a7a: 2f3c32040488             move.l     #$32040488, -(a7)
0a80: a8fd                     dc.w       $a8fd
0a82: 101f                     move.b     (a7)+, d0
0a84: 5300                     subq.b     #$1, d0
0a86: 6702                     beq.b      $a8a
0a88: 7e01                     moveq      #$1, d7
0a8a: 1007                     move.b     d7, d0
0a8c: 5300                     subq.b     #$1, d0
0a8e: 670001ae                 beq.w      $c3e
0a92: 206dfe2a                 movea.l    -$1d6(a5), a0
0a96: 2050                     movea.l    (a0), a0
0a98: 10280044                 move.b     $44(a0), d0
0a9c: 4880                     ext.w      d0
0a9e: 6646                     bne.b      $ae6
0aa0: 206dfe2a                 movea.l    -$1d6(a5), a0
0aa4: 2050                     movea.l    (a0), a0
0aa6: 3b680042fe06             move.w     $42(a0), -$1fa(a5)
0aac: 206dfe2a                 movea.l    -$1d6(a5), a0
0ab0: 2050                     movea.l    (a0), a0
0ab2: 3028003e                 move.w     $3e(a0), d0
0ab6: 5340                     subq.w     #$1, d0
0ab8: 3b40fe00                 move.w     d0, -$200(a5)
0abc: 206dfe2a                 movea.l    -$1d6(a5), a0
0ac0: 2050                     movea.l    (a0), a0
0ac2: 30280040                 move.w     $40(a0), d0
0ac6: 5340                     subq.w     #$1, d0
0ac8: 3b40fe02                 move.w     d0, -$1fe(a5)
0acc: 206dfe2a                 movea.l    -$1d6(a5), a0
0ad0: 2050                     movea.l    (a0), a0
0ad2: 317c0001003e             move.w     #$1, $3e(a0)
0ad8: 206dfe2a                 movea.l    -$1d6(a5), a0
0adc: 2050                     movea.l    (a0), a0
0ade: 317c270f0040             move.w     #$270f, $40(a0)
0ae4: 6010                     bra.b      $af6
0ae6: 426dfe00                 clr.w      -$200(a5)
0aea: 3b7c270ffe02             move.w     #$270f, -$1fe(a5)
0af0: 3b7c0001fe06             move.w     #$1, -$1fa(a5)
0af6: 594f                     subq.w     #$4, a7
0af8: 2f2dfe2a                 move.l     -$1d6(a5), -(a7)
0afc: 42a7                     clr.l      -(a7)
0afe: 42a7                     clr.l      -(a7)
0b00: 2f3c04000c00             move.l     #$4000c00, -(a7)
0b06: a8fd                     dc.w       $a8fd
0b08: 2b5ffe0c                 move.l     (a7)+, -$1f4(a5)
0b0c: 4aadfe0c                 tst.l      -$1f4(a5)
0b10: 6700012c                 beq.w      $c3e
0b14: 554f                     subq.w     #$2, a7
0b16: 487a0162                 pea.l      $c7a(pc)
0b1a: 4ebafc44                 jsr        $760(pc)
0b1e: 4a1f                     tst.b      (a7)+
0b20: 6700011c                 beq.w      $c3e
0b24: a89e                     dc.w       $a89e
0b26: 486dfbe6                 pea.l      -$41a(a5)
0b2a: 486efebc                 pea.l      -$144(a6)
0b2e: 3f3c0001                 move.w     #$1, -(a7)
0b32: 4ead012a                 jsr        $12a(a5) ; CODE 1 resource+0x0356
0b36: 1d6efedbfeba             move.b     -$125(a6), -$146(a6)
0b3c: 7000                     moveq      #$0, d0
0b3e: 102efeba                 move.b     -$146(a6), d0
0b42: 3f00                     move.w     d0, -(a7)
0b44: a888                     dc.w       $a888
0b46: 3f2dfbe4                 move.w     -$41c(a5), -(a7)
0b4a: a887                     dc.w       $a887
0b4c: 3f2dfbe8                 move.w     -$418(a5), -(a7)
0b50: a88a                     dc.w       $a88a
0b52: 486dfdec                 pea.l      -$214(a5)
0b56: a88b                     dc.w       $a88b
0b58: 302dfdec                 move.w     -$214(a5), d0
0b5c: d06dfdee                 add.w      -$212(a5), d0
0b60: 3b40fdf6                 move.w     d0, -$20a(a5)
0b64: 3b7c000afdf8             move.w     #$a, -$208(a5)
0b6a: 3b6dfdf6fdfa             move.w     -$20a(a5), -$206(a5)
0b70: 3b6dfdf6fdfc             move.w     -$20a(a5), -$204(a5)
0b76: 206dfe2a                 movea.l    -$1d6(a5), a0
0b7a: 2050                     movea.l    (a0), a0
0b7c: 3b680016fdfe             move.w     $16(a0), -$202(a5)
0b82: 206dfe2a                 movea.l    -$1d6(a5), a0
0b86: 2050                     movea.l    (a0), a0
0b88: 30280014                 move.w     $14(a0), d0
0b8c: 906dfdfa                 sub.w      -$206(a5), d0
0b90: 3b40fe08                 move.w     d0, -$1f8(a5)
0b94: 302dfdfa                 move.w     -$206(a5), d0
0b98: d06dfdfc                 add.w      -$204(a5), d0
0b9c: 322dfe08                 move.w     -$1f8(a5), d1
0ba0: 9240                     sub.w      d0, d1
0ba2: 3b41fe08                 move.w     d1, -$1f8(a5)
0ba6: 302dfe08                 move.w     -$1f8(a5), d0
0baa: 48c0                     ext.l      d0
0bac: 81edfdf6                 divs.w     -$20a(a5), d0
0bb0: 3b40fe08                 move.w     d0, -$1f8(a5)
0bb4: 206dbdc6                 movea.l    -$423a(a5), a0
0bb8: 2f10                     move.l     (a0), -(a7)
0bba: a851                     dc.w       $a851
0bbc: 4ebaf9b8                 jsr        $576(pc)
0bc0: 2f2dfe0c                 move.l     -$1f4(a5), -(a7)
0bc4: a873                     dc.w       $a873
0bc6: 600e                     bra.b      $bd6
0bc8: 4ebafc9e                 jsr        $868(pc)
0bcc: 302dfe06                 move.w     -$1fa(a5), d0
0bd0: 5340                     subq.w     #$1, d0
0bd2: 3b40fe06                 move.w     d0, -$1fa(a5)
0bd6: 102dfdea                 move.b     -$216(a5), d0
0bda: 5300                     subq.b     #$1, d0
0bdc: 4a6dfe06                 tst.w      -$1fa(a5)
0be0: 5ec1                     sgt.b      d1
0be2: c001                     and.b      d1, d0
0be4: 66e2                     bne.b      $bc8
0be6: 2f2dfe0c                 move.l     -$1f4(a5), -(a7)
0bea: 2f3c08000484             move.l     #$8000484, -(a7)
0bf0: a8fd                     dc.w       $a8fd
0bf2: 42adfe0c                 clr.l      -$1f4(a5)
0bf6: 2f2dfe36                 move.l     -$1ca(a5), -(a7)
0bfa: a873                     dc.w       $a873
0bfc: 554f                     subq.w     #$2, a7
0bfe: 487a005c                 pea.l      $c5c(pc)
0c02: 4ebafb5c                 jsr        $760(pc)
0c06: 1b5ffe0b                 move.b     (a7)+, -$1f5(a5)
0c0a: 102dfdea                 move.b     -$216(a5), d0
0c0e: 5300                     subq.b     #$1, d0
0c10: 206dfe2a                 movea.l    -$1d6(a5), a0
0c14: 2050                     movea.l    (a0), a0
0c16: 12280044                 move.b     $44(a0), d1
0c1a: 4881                     ext.w      d1
0c1c: 56c1                     sne.b      d1
0c1e: c001                     and.b      d1, d0
0c20: 6716                     beq.b      $c38
0c22: 2f2dfe2a                 move.l     -$1d6(a5), -(a7)
0c26: 42a7                     clr.l      -(a7)
0c28: 42a7                     clr.l      -(a7)
0c2a: 42a7                     clr.l      -(a7)
0c2c: 486dfe10                 pea.l      -$1f0(a5)
0c30: 2f3c60051480             move.l     #$60051480, -(a7)
0c36: a8fd                     dc.w       $a8fd
0c38: a850                     dc.w       $a850
0c3a: 4ebaf978                 jsr        $5b4(pc)
0c3e: 4267                     clr.w      -(a7)
0c40: 2f3cc0000200             move.l     #$c0000200, -(a7)
0c46: a8fd                     dc.w       $a8fd
0c48: 2f3cd0000000             move.l     #$d0000000, -(a7)
0c4e: a8fd                     dc.w       $a8fd
0c50: 4cdf10c0                 movem.l    (a7)+, d6-d7/a4
0c54: 4e5e                     unlk       a6
0c56: 205f                     movea.l    (a7)+, a0
0c58: 5c4f                     addq.w     #$6, a7
0c5a: 4ed0                     jmp        (a0)
0c5c: 1c45                     .byte      0x1c, 0x45
0c5e: 7272                     moveq      #$72, d1
0c60: 6f72                     ble.b      $cd4
0c62: 2043                     movea.l    d3, a0
0c64: 6c6f                     bge.b      $cd5
0c66: 7369                     .byte      0x73, 0x69
0c68: 6e67                     bgt.b      $cd1
0c6a: 2050                     movea.l    (a0), a0
0c6c: 7269                     moveq      #$69, d1
0c6e: 6e74                     bgt.b      $ce4
0c70: 2044                     movea.l    d4, a0
0c72: 6f63                     ble.b      $cd7
0c74: 756d                     .byte      0x75, 0x6d
0c76: 656e                     bcs.b      $ce6
0c78: 7416                     moveq      #$16, d2
0c7a: 1943616e                 move.b     d3, $616e(a4)
0c7e: 6e6f                     bgt.b      $cef
0c80: 7420                     moveq      #$20, d2
0c82: 436f                     .byte      0x43, 0x6f
0c84: 6d70                     blt.b      $cf6
0c86: 6c65                     bge.b      $ced
0c88: 7465                     moveq      #$65, d2
0c8a: 2050                     movea.l    (a0), a0
0c8c: 724f                     moveq      #$4f, d1
0c8e: 7065                     moveq      #$65, d0
0c90: 6e44                     bgt.b      $cd6
0c92: 6f63                     ble.b      $cf7
0c94: 1a43                     .byte      0x1a, 0x43
0c96: 616e                     bsr.b      $d06
0c98: 6e6f                     bgt.b      $d09
0c9a: 7420                     moveq      #$20, d2
0c9c: 4f70                     .byte      0x4f, 0x70
0c9e: 656e                     bcs.b      $d0e
0ca0: 2050                     movea.l    (a0), a0
0ca2: 7269                     moveq      #$69, d1
0ca4: 6e74                     bgt.b      $d1a
0ca6: 6572                     bcs.b      $d1a
0ca8: 2044                     movea.l    d4, a0
0caa: 7269                     moveq      #$69, d1
0cac: 7665                     moveq      #$65, d3
0cae: 7216                     moveq      #$16, d1
0cb0: 4e56ffee                 link.w     a6, #$ffee
0cb4: 4aadf924                 tst.l      -$6dc(a5)
0cb8: 6604                     bne.b      $cbe
0cba: 4eba0090                 jsr        $d4c(pc)
0cbe: 554f                     subq.w     #$2, a7
0cc0: 2f3cba000000             move.l     #$ba000000, -(a7)
0cc6: a8fd                     dc.w       $a8fd
0cc8: 4a5f                     tst.w      (a7)+
0cca: 6660                     bne.b      $d2c
0ccc: 2b6df924fe2a             move.l     -$6dc(a5), -$1d6(a5)
0cd2: 2f3cc8000000             move.l     #$c8000000, -(a7)
0cd8: a8fd                     dc.w       $a8fd
0cda: 554f                     subq.w     #$2, a7
0cdc: 2f2dfe2a                 move.l     -$1d6(a5), -(a7)
0ce0: 2f3c52040498             move.l     #$52040498, -(a7)
0ce6: a8fd                     dc.w       $a8fd
0ce8: 1b5ffe0b                 move.b     (a7)+, -$1f5(a5)
0cec: 1b7c0001fe0a             move.b     #$1, -$1f6(a5)
0cf2: 486dfe36                 pea.l      -$1ca(a5)
0cf6: a874                     dc.w       $a874
0cf8: a850                     dc.w       $a850
0cfa: 554f                     subq.w     #$2, a7
0cfc: 487a0032                 pea.l      $d30(pc)
0d00: 4ebafa5e                 jsr        $760(pc)
0d04: 4a1f                     tst.b      (a7)+
0d06: 6712                     beq.b      $d1a
0d08: 554f                     subq.w     #$2, a7
0d0a: 2f2dfe2a                 move.l     -$1d6(a5), -(a7)
0d0e: 2f3c2a040484             move.l     #$2a040484, -(a7)
0d14: a8fd                     dc.w       $a8fd
0d16: 1d5fffef                 move.b     (a7)+, -$11(a6)
0d1a: 4267                     clr.w      -(a7)
0d1c: 2f3cc0000200             move.l     #$c0000200, -(a7)
0d22: a8fd                     dc.w       $a8fd
0d24: 2f3cd0000000             move.l     #$d0000000, -(a7)
0d2a: a8fd                     dc.w       $a8fd
0d2c: 4e5e                     unlk       a6
0d2e: 4e75                     rts        
0d30: 1a43                     .byte      0x1a, 0x43
0d32: 616e                     bsr.b      $da2
0d34: 6e6f                     bgt.b      $da5
0d36: 7420                     moveq      #$20, d2
0d38: 4f70                     .byte      0x4f, 0x70
0d3a: 656e                     bcs.b      $daa
0d3c: 2050                     movea.l    (a0), a0
0d3e: 7269                     moveq      #$69, d1
0d40: 6e74                     bgt.b      $db6
0d42: 6572                     bcs.b      $db6
0d44: 2044                     movea.l    d4, a0
0d46: 7269                     moveq      #$69, d1
0d48: 7665                     moveq      #$65, d3
0d4a: 7216                     moveq      #$16, d1
0d4c: 4267                     clr.w      -(a7)
0d4e: 2f3cc0000200             move.l     #$c0000200, -(a7)
0d54: a8fd                     dc.w       $a8fd
0d56: 42adf924                 clr.l      -$6dc(a5)
0d5a: 42adfe0c                 clr.l      -$1f4(a5)
0d5e: 2f3cc8000000             move.l     #$c8000000, -(a7)
0d64: a8fd                     dc.w       $a8fd
0d66: 554f                     subq.w     #$2, a7
0d68: 2f3cba000000             move.l     #$ba000000, -(a7)
0d6e: a8fd                     dc.w       $a8fd
0d70: 4a5f                     tst.w      (a7)+
0d72: 670a                     beq.b      $d7e
0d74: 487a0070                 pea.l      $de6(pc)
0d78: 4ead005a                 jsr        $5a(a5) ; CODE 4 resource+0x0ae6
0d7c: 6038                     bra.b      $db6
0d7e: 594f                     subq.w     #$4, a7
0d80: 7078                     moveq      #$78, d0
0d82: 2f00                     move.l     d0, -(a7)
0d84: 4ead015a                 jsr        $15a(a5) ; CODE 1 resource+0x053a
0d88: 2b5ff924                 move.l     (a7)+, -$6dc(a5)
0d8c: 2b6df924fe2a             move.l     -$6dc(a5), -$1d6(a5)
0d92: 4aadf924                 tst.l      -$6dc(a5)
0d96: 660a                     bne.b      $da2
0d98: 487a001e                 pea.l      $db8(pc)
0d9c: 4ead005a                 jsr        $5a(a5) ; CODE 4 resource+0x0ae6
0da0: 600c                     bra.b      $dae
0da2: 2f2dfe2a                 move.l     -$1d6(a5), -(a7)
0da6: 2f3c20040480             move.l     #$20040480, -(a7)
0dac: a8fd                     dc.w       $a8fd
0dae: 2f3cd0000000             move.l     #$d0000000, -(a7)
0db4: a8fd                     dc.w       $a8fd
0db6: 4e75                     rts        
0db8: 2d4e6f74                 move.l     a6, $6f74(a6)
0dbc: 2065                     movea.l    -(a5), a0
0dbe: 6e6f                     bgt.b      $e2f
0dc0: 7567                     .byte      0x75, 0x67
0dc2: 6820                     bvc.b      $de4
0dc4: 6d65                     blt.b      $e2b
0dc6: 6d6f                     blt.b      $e37
0dc8: 7279                     moveq      #$79, d1
0dca: 20746f206f70             movea.l    $6f70(a4, d6.l * 8), a0
0dd0: 656e                     bcs.b      $e40
0dd2: 20746865                 movea.l    $65(a4, d6.l), a0
0dd6: 20707269                 movea.l    $69(a0, d7.w), a0
0dda: 6e74                     bgt.b      $e50
0ddc: 6572                     bcs.b      $e50
0dde: 2064                     movea.l    -(a4), a0
0de0: 7269                     moveq      #$69, d1
0de2: 7665                     moveq      #$65, d3
0de4: 722e                     moveq      #$2e, d1
0de6: 4655                     not.w      (a5)
0de8: 6e61                     bgt.b      $e4b
0dea: 626c                     bhi.b      $e58
0dec: 6520                     bcs.b      $e0e
0dee: 746f                     moveq      #$6f, d2
0df0: 206f7065                 movea.l    $7065(a7), a0
0df4: 6e20                     bgt.b      $e16
0df6: 7468                     moveq      #$68, d2
0df8: 6520                     bcs.b      $e1a
0dfa: 7072                     moveq      #$72, d0
0dfc: 696e                     bvs.b      $e6c
0dfe: 7465                     moveq      #$65, d2
0e00: 7220                     moveq      #$20, d1
0e02: 6472                     bcc.b      $e76
0e04: 6976                     bvs.b      $e7c
0e06: 6572                     bcs.b      $e7a
0e08: 2e20                     move.l     -(a0), d7
0e0a: 2057                     movea.l    (a7), a0
0e0c: 696c                     bvs.b      $e7a
0e0e: 6c20                     bge.b      $e30
0e10: 6e6f                     bgt.b      $e81
0e12: 7420                     moveq      #$20, d2
0e14: 6265                     bhi.b      $e7b
0e16: 2061                     movea.l    -(a1), a0
0e18: 626c                     bhi.b      $e86
0e1a: 6520                     bcs.b      $e3c
0e1c: 746f                     moveq      #$6f, d2
0e1e: 20707269                 movea.l    $69(a0, d7.w), a0
0e22: 6e74                     bgt.b      $e98
0e24: 20726f626f74732e         movea.l    ([$6f74, a2], $732e), a0
0e2c: 2016                     move.l     (a6), d0
0e2e: 4aadf924                 tst.l      -$6dc(a5)
0e32: 6708                     beq.b      $e3c
0e34: 2f2df924                 move.l     -$6dc(a5), -(a7)
0e38: 205f                     movea.l    (a7)+, a0
0e3a: a023                     dc.w       $a023
0e3c: 4e75                     rts        
0e3e: 4e560000                 link.w     a6, #$0
0e42: 2f07                     move.l     d7, -(a7)
0e44: 3e2e000c                 move.w     $c(a6), d7
0e48: 0c470061                 cmpi.w     #$61, d7
0e4c: 5cc0                     sge.b      d0
0e4e: 0c47007a                 cmpi.w     #$7a, d7
0e52: 5fc1                     sle.b      d1
0e54: c001                     and.b      d1, d0
0e56: 670c                     beq.b      $e64
0e58: 3007                     move.w     d7, d0
0e5a: 0640ffe0                 addi.w     #$ffe0, d0
0e5e: 3d40000e                 move.w     d0, $e(a6)
0e62: 6004                     bra.b      $e68
0e64: 3d47000e                 move.w     d7, $e(a6)
0e68: 2e1f                     move.l     (a7)+, d7
0e6a: 4e5e                     unlk       a6
0e6c: 205f                     movea.l    (a7)+, a0
0e6e: 5c4f                     addq.w     #$6, a7
0e70: 4ed0                     jmp        (a0)
0e72: 4e56feea                 link.w     a6, #$feea
0e76: 48e70708                 movem.l    d5-d7/a4, -(a7)
0e7a: 286e0008                 movea.l    $8(a6), a4
0e7e: 4247                     clr.w      d7
0e80: 600001a8                 bra.w      $102a
0e84: 206c0016                 movea.l    $16(a4), a0
0e88: 3007                     move.w     d7, d0
0e8a: e540                     asl.w      #$2, d0
0e8c: 0c3000030001             cmpi.b     #$3, $1(a0, d0.w)
0e92: 57c0                     seq.b      d0
0e94: 206c0016                 movea.l    $16(a4), a0
0e98: 3207                     move.w     d7, d1
0e9a: e541                     asl.w      #$2, d1
0e9c: 0c3000051001             cmpi.b     #$5, $1(a0, d1.w)
0ea2: 57c1                     seq.b      d1
0ea4: 8001                     or.b       d1, d0
0ea6: 67000180                 beq.w      $1028
0eaa: 206c0016                 movea.l    $16(a4), a0
0eae: 3c07                     move.w     d7, d6
0eb0: e546                     asl.w      #$2, d6
0eb2: 3c306002                 move.w     $2(a0, d6.w), d6
0eb6: 3006                     move.w     d6, d0
0eb8: c1fc0018                 muls.w     #$18, d0
0ebc: 0640d534                 addi.w     #$d534, d0
0ec0: 4a350000                 tst.b      (a5, d0.w)
0ec4: 67000120                 beq.w      $fe6
0ec8: 3006                     move.w     d6, d0
0eca: c1fc0018                 muls.w     #$18, d0
0ece: 206c0016                 movea.l    $16(a4), a0
0ed2: 3207                     move.w     d7, d1
0ed4: e541                     asl.w      #$2, d1
0ed6: 0640d532                 addi.w     #$d532, d0
0eda: 31b500001002             move.w     (a5, d0.w), $2(a0, d1.w)
0ee0: 3a06                     move.w     d6, d5
0ee2: cbfc0018                 muls.w     #$18, d5
0ee6: 41edd530                 lea.l      -$2ad0(a5), a0
0eea: 1a305000                 move.b     (a0, d5.w), d5
0eee: 206c0016                 movea.l    $16(a4), a0
0ef2: 3007                     move.w     d7, d0
0ef4: e540                     asl.w      #$2, d0
0ef6: 0c3000050001             cmpi.b     #$5, $1(a0, d0.w)
0efc: 6618                     bne.b      $f16
0efe: 0c050003                 cmpi.b     #$3, d5
0f02: 661e                     bne.b      $f22
0f04: 41ec001a                 lea.l      $1a(a4), a0
0f08: 3f18                     move.w     (a0)+, -(a7)
0f0a: 487a01b4                 pea.l      $10c0(pc)
0f0e: 2f10                     move.l     (a0), -(a7)
0f10: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
0f14: 600c                     bra.b      $f22
0f16: 206c0016                 movea.l    $16(a4), a0
0f1a: 3007                     move.w     d7, d0
0f1c: e540                     asl.w      #$2, d0
0f1e: 11850001                 move.b     d5, $1(a0, d0.w)
0f22: 206c0016                 movea.l    $16(a4), a0
0f26: 3007                     move.w     d7, d0
0f28: e540                     asl.w      #$2, d0
0f2a: 0c3000100000             cmpi.b     #$10, (a0, d0.w)
0f30: 57c0                     seq.b      d0
0f32: 0c050002                 cmpi.b     #$2, d5
0f36: 57c1                     seq.b      d1
0f38: 0c050003                 cmpi.b     #$3, d5
0f3c: 57c2                     seq.b      d2
0f3e: 8202                     or.b       d2, d1
0f40: c001                     and.b      d1, d0
0f42: 670000e4                 beq.w      $1028
0f46: 3007                     move.w     d7, d0
0f48: 48c0                     ext.l      d0
0f4a: 2f00                     move.l     d0, -(a7)
0f4c: 486cfe5a                 pea.l      -$1a6(a4)
0f50: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
0f54: 206c000e                 movea.l    $e(a4), a0
0f58: 3010                     move.w     (a0), d0
0f5a: 48c0                     ext.l      d0
0f5c: 2f00                     move.l     d0, -(a7)
0f5e: 486cfd5a                 pea.l      -$2a6(a4)
0f62: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
0f66: 486efeea                 pea.l      -$116(a6)
0f6a: 487a013c                 pea.l      $10a8(pc)
0f6e: 486cfe5a                 pea.l      -$1a6(a4)
0f72: 487a012a                 pea.l      $109e(pc)
0f76: 486cfd5a                 pea.l      -$2a6(a4)
0f7a: 487a0120                 pea.l      $109c(pc)
0f7e: 3f3c0005                 move.w     #$5, -(a7)
0f82: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
0f86: 584f                     addq.w     #$4, a7
0f88: 41ec001a                 lea.l      $1a(a4), a0
0f8c: 3f18                     move.w     (a0)+, -(a7)
0f8e: 486efeea                 pea.l      -$116(a6)
0f92: 2f10                     move.l     (a0), -(a7)
0f94: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
0f98: 486efeea                 pea.l      -$116(a6)
0f9c: 206c001c                 movea.l    $1c(a4), a0
0fa0: 2f08                     move.l     a0, -(a7)
0fa2: 487a00ea                 pea.l      $108e(pc)
0fa6: 3006                     move.w     d6, d0
0fa8: c1fc0018                 muls.w     #$18, d0
0fac: 0640d520                 addi.w     #$d520, d0
0fb0: 48750000                 pea.l      (a5, d0.w)
0fb4: 487a00ac                 pea.l      $1062(pc)
0fb8: 3f3c0004                 move.w     #$4, -(a7)
0fbc: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
0fc0: 584f                     addq.w     #$4, a7
0fc2: 41ec001a                 lea.l      $1a(a4), a0
0fc6: 3f18                     move.w     (a0)+, -(a7)
0fc8: 486efeea                 pea.l      -$116(a6)
0fcc: 2f10                     move.l     (a0), -(a7)
0fce: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
0fd2: 3006                     move.w     d6, d0
0fd4: c1fc0018                 muls.w     #$18, d0
0fd8: 206c000a                 movea.l    $a(a4), a0
0fdc: 0640d536                 addi.w     #$d536, d0
0fe0: 30b50000                 move.w     (a5, d0.w), (a0)
0fe4: 6042                     bra.b      $1028
0fe6: 486efeea                 pea.l      -$116(a6)
0fea: 487a0062                 pea.l      $104e(pc)
0fee: 3006                     move.w     d6, d0
0ff0: c1fc0018                 muls.w     #$18, d0
0ff4: 0640d520                 addi.w     #$d520, d0
0ff8: 48750000                 pea.l      (a5, d0.w)
0ffc: 3f3c0002                 move.w     #$2, -(a7)
1000: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
1004: 584f                     addq.w     #$4, a7
1006: 41ec001a                 lea.l      $1a(a4), a0
100a: 3f18                     move.w     (a0)+, -(a7)
100c: 486efeea                 pea.l      -$116(a6)
1010: 2f10                     move.l     (a0), -(a7)
1012: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
1016: 3006                     move.w     d6, d0
1018: c1fc0018                 muls.w     #$18, d0
101c: 206c000a                 movea.l    $a(a4), a0
1020: 0640d536                 addi.w     #$d536, d0
1024: 30b50000                 move.w     (a5, d0.w), (a0)
1028: 5247                     addq.w     #$1, d7
102a: 206c000e                 movea.l    $e(a4), a0
102e: be50                     cmp.w      (a0), d7
1030: 5dc0                     slt.b      d0
1032: 206c001c                 movea.l    $1c(a4), a0
1036: 7200                     moveq      #$0, d1
1038: 1210                     move.b     (a0), d1
103a: 4a41                     tst.w      d1
103c: 57c1                     seq.b      d1
103e: c001                     and.b      d1, d0
1040: 6600fe42                 bne.w      $e84
1044: 4cdf10e0                 movem.l    (a7)+, d5-d7/a4
1048: 4e5e                     unlk       a6
104a: 2e9f                     move.l     (a7)+, (a7)
104c: 4e75                     rts        
104e: 1255                     .byte      0x12, 0x55
1050: 6e64                     bgt.b      $10b6
1052: 6566                     bcs.b      $10ba
1054: 696e                     bvs.b      $10c4
1056: 6564                     bcs.b      $10bc
1058: 2053                     movea.l    (a3), a0
105a: 796d                     .byte      0x79, 0x6d
105c: 626f                     bhi.b      $10cd
105e: 6c3a                     bge.b      $109a
1060: 2012                     move.l     (a2), d0
1062: 2a20                     move.l     -(a0), d5
1064: 6973                     bvs.b      $10d9
1066: 207573656420             movea.l    ([$6420, a5]), a0
106c: 6173                     bsr.b      $10e1
106e: 2061                     movea.l    -(a1), a0
1070: 207265676973             movea.l    ([$6973, a2]), a0
1076: 7465                     moveq      #$65, d2
1078: 7220                     moveq      #$20, d1
107a: 6f72                     ble.b      $10ee
107c: 206d656d                 movea.l    $656d(a5), a0
1080: 6f72                     ble.b      $10f4
1082: 7920                     .byte      0x79, 0x20
1084: 6c6f                     bge.b      $10f5
1086: 6361                     bls.b      $10e9
1088: 7469                     moveq      #$69, d2
108a: 6f6e                     ble.b      $10fa
108c: 2e16                     move.l     (a6), d7
108e: 0c207468                 cmpi.b     #$68, -(a0)
1092: 6520                     bcs.b      $10b4
1094: 7379                     .byte      0x73, 0x79
1096: 6d62                     blt.b      $10fa
1098: 6f6c                     ble.b      $1106
109a: 2012                     move.l     (a2), d0
109c: 012c0820                 btst.l     d0, $820(a4)
10a0: 6f75                     ble.b      $1117
10a2: 7420                     moveq      #$20, d2
10a4: 6f66                     ble.b      $110c
10a6: 2012                     move.l     (a2), d0
10a8: 17417420                 move.b     d1, $7420(a3)
10ac: 6d61                     blt.b      $110f
10ae: 6368                     bls.b      $1118
10b0: 696e                     bvs.b      $1120
10b2: 6520                     bcs.b      $10d4
10b4: 696e                     bvs.b      $1124
10b6: 7374                     .byte      0x73, 0x74
10b8: 7275                     moveq      #$75, d1
10ba: 6374                     bls.b      $1130
10bc: 696f                     bvs.b      $112d
10be: 6e20                     bgt.b      $10e0
10c0: 27412070                 move.l     d1, $2070(a3)
10c4: 726f                     moveq      #$6f, d1
10c6: 6772                     beq.b      $113a
10c8: 616d                     bsr.b      $1137
10ca: 206c6162                 movea.l    $6162(a4), a0
10ce: 656c                     bcs.b      $113c
10d0: 2063                     movea.l    -(a3), a0
10d2: 616e                     bsr.b      $1142
10d4: 6e6f                     bgt.b      $1145
10d6: 7420                     moveq      #$20, d2
10d8: 6265                     bhi.b      $113f
10da: 2064                     movea.l    -(a4), a0
10dc: 6572                     bcs.b      $1150
10de: 6566                     bcs.b      $1146
10e0: 6572                     bcs.b      $1154
10e2: 656e                     bcs.b      $1152
10e4: 6365                     bls.b      $114b
10e6: 6420                     bcc.b      $1108
10e8: 4e56feea                 link.w     a6, #$feea
10ec: 48e70308                 movem.l    d6-d7/a4, -(a7)
10f0: 286e0008                 movea.l    $8(a6), a4
10f4: 4247                     clr.w      d7
10f6: 4206                     clr.b      d6
10f8: 601e                     bra.b      $1118
10fa: 3007                     move.w     d7, d0
10fc: c1fc0018                 muls.w     #$18, d0
1100: 486cff72                 pea.l      -$8e(a4)
1104: 0640d520                 addi.w     #$d520, d0
1108: 48750000                 pea.l      (a5, d0.w)
110c: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1110: 6604                     bne.b      $1116
1112: 7c01                     moveq      #$1, d6
1114: 6002                     bra.b      $1118
1116: 5247                     addq.w     #$1, d7
1118: be6cff64                 cmp.w      -$9c(a4), d7
111c: 5dc0                     slt.b      d0
111e: 1206                     move.b     d6, d1
1120: 5301                     subq.b     #$1, d1
1122: c001                     and.b      d1, d0
1124: 66d4                     bne.b      $10fa
1126: 1946ff6a                 move.b     d6, -$96(a4)
112a: 4a2e000c                 tst.b      $c(a6)
112e: 670000c6                 beq.w      $11f6
1132: 3007                     move.w     d7, d0
1134: c1fc0018                 muls.w     #$18, d0
1138: 0640d530                 addi.w     #$d530, d0
113c: 1bbc00030000             move.b     #$3, (a5, d0.w)
1142: 4a06                     tst.b      d6
1144: 6756                     beq.b      $119c
1146: 3007                     move.w     d7, d0
1148: c1fc0018                 muls.w     #$18, d0
114c: 0640d534                 addi.w     #$d534, d0
1150: 4a350000                 tst.b      (a5, d0.w)
1154: 6732                     beq.b      $1188
1156: 486efeea                 pea.l      -$116(a6)
115a: 487a0120                 pea.l      $127c(pc)
115e: 3007                     move.w     d7, d0
1160: c1fc0018                 muls.w     #$18, d0
1164: 0640d520                 addi.w     #$d520, d0
1168: 48750000                 pea.l      (a5, d0.w)
116c: 3f3c0002                 move.w     #$2, -(a7)
1170: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
1174: 584f                     addq.w     #$4, a7
1176: 41ec001a                 lea.l      $1a(a4), a0
117a: 3f18                     move.w     (a0)+, -(a7)
117c: 486efeea                 pea.l      -$116(a6)
1180: 2f10                     move.l     (a0), -(a7)
1182: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
1186: 604a                     bra.b      $11d2
1188: 206c000e                 movea.l    $e(a4), a0
118c: 3007                     move.w     d7, d0
118e: c1fc0018                 muls.w     #$18, d0
1192: 0640d532                 addi.w     #$d532, d0
1196: 3b900000                 move.w     (a0), (a5, d0.w)
119a: 6036                     bra.b      $11d2
119c: 3007                     move.w     d7, d0
119e: c1fc0018                 muls.w     #$18, d0
11a2: 3f3c000f                 move.w     #$f, -(a7)
11a6: 486cff72                 pea.l      -$8e(a4)
11aa: 0640d520                 addi.w     #$d520, d0
11ae: 48750000                 pea.l      (a5, d0.w)
11b2: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
11b6: 206c000e                 movea.l    $e(a4), a0
11ba: 3007                     move.w     d7, d0
11bc: c1fc0018                 muls.w     #$18, d0
11c0: 0640d532                 addi.w     #$d532, d0
11c4: 3b900000                 move.w     (a0), (a5, d0.w)
11c8: 302cff64                 move.w     -$9c(a4), d0
11cc: 5240                     addq.w     #$1, d0
11ce: 3940ff64                 move.w     d0, -$9c(a4)
11d2: 206c000e                 movea.l    $e(a4), a0
11d6: 3007                     move.w     d7, d0
11d8: c1fc0018                 muls.w     #$18, d0
11dc: 0640d536                 addi.w     #$d536, d0
11e0: 3b900000                 move.w     (a0), (a5, d0.w)
11e4: 3007                     move.w     d7, d0
11e6: c1fc0018                 muls.w     #$18, d0
11ea: 0640d534                 addi.w     #$d534, d0
11ee: 1bbc00010000             move.b     #$1, (a5, d0.w)
11f4: 6048                     bra.b      $123e
11f6: 1006                     move.b     d6, d0
11f8: 5300                     subq.b     #$1, d0
11fa: 6742                     beq.b      $123e
11fc: 3007                     move.w     d7, d0
11fe: c1fc0018                 muls.w     #$18, d0
1202: 3f3c000f                 move.w     #$f, -(a7)
1206: 486cff72                 pea.l      -$8e(a4)
120a: 0640d520                 addi.w     #$d520, d0
120e: 48750000                 pea.l      (a5, d0.w)
1212: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
1216: 3007                     move.w     d7, d0
1218: c1fc0018                 muls.w     #$18, d0
121c: 0640d534                 addi.w     #$d534, d0
1220: 42350000                 clr.b      (a5, d0.w)
1224: 3007                     move.w     d7, d0
1226: c1fc0018                 muls.w     #$18, d0
122a: 0640d536                 addi.w     #$d536, d0
122e: 3bacff620000             move.w     -$9e(a4), (a5, d0.w)
1234: 302cff64                 move.w     -$9c(a4), d0
1238: 5240                     addq.w     #$1, d0
123a: 3940ff64                 move.w     d0, -$9c(a4)
123e: 0c6c00c8ff64             cmpi.w     #$c8, -$9c(a4)
1244: 6d10                     blt.b      $1256
1246: 41ec001a                 lea.l      $1a(a4), a0
124a: 3f18                     move.w     (a0)+, -(a7)
124c: 487a0018                 pea.l      $1266(pc)
1250: 2f10                     move.l     (a0), -(a7)
1252: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
1256: 3d47000e                 move.w     d7, $e(a6)
125a: 4cdf10c0                 movem.l    (a7)+, d6-d7/a4
125e: 4e5e                     unlk       a6
1260: 205f                     movea.l    (a7)+, a0
1262: 5c4f                     addq.w     #$6, a7
1264: 4ed0                     jmp        (a0)
1266: 1553796d                 move.b     (a3), $796d(a2)
126a: 626f                     bhi.b      $12db
126c: 6c20                     bge.b      $128e
126e: 7461                     moveq      #$61, d2
1270: 626c                     bhi.b      $12de
1272: 6520                     bcs.b      $1294
1274: 6f76                     ble.b      $12ec
1276: 6572                     bcs.b      $12ea
1278: 666c                     bne.b      $12e6
127a: 6f77                     ble.b      $12f3
127c: 1853                     .byte      0x18, 0x53
127e: 796d                     .byte      0x79, 0x6d
1280: 626f                     bhi.b      $12f1
1282: 6c20                     bge.b      $12a4
1284: 616c                     bsr.b      $12f2
1286: 7265                     moveq      #$65, d1
1288: 6164                     bsr.b      $12ee
128a: 7920                     .byte      0x79, 0x20
128c: 6465                     bcc.b      $12f3
128e: 6669                     bne.b      $12f9
1290: 6e65                     bgt.b      $12f7
1292: 643a                     bcc.b      $12ce
1294: 2012                     move.l     (a2), d0
1296: 4e560000                 link.w     a6, #$0
129a: 2f0c                     move.l     a4, -(a7)
129c: 286e0008                 movea.l    $8(a6), a4
12a0: 302cff64                 move.w     -$9c(a4), d0
12a4: 5340                     subq.w     #$1, d0
12a6: c1fc0018                 muls.w     #$18, d0
12aa: 0640d530                 addi.w     #$d530, d0
12ae: 1bae000e0000             move.b     $e(a6), (a5, d0.w)
12b4: 302cff64                 move.w     -$9c(a4), d0
12b8: 5340                     subq.w     #$1, d0
12ba: c1fc0018                 muls.w     #$18, d0
12be: 0640d532                 addi.w     #$d532, d0
12c2: 3bae000c0000             move.w     $c(a6), (a5, d0.w)
12c8: 302cff64                 move.w     -$9c(a4), d0
12cc: 5340                     subq.w     #$1, d0
12ce: c1fc0018                 muls.w     #$18, d0
12d2: 0640d534                 addi.w     #$d534, d0
12d6: 1bbc00010000             move.b     #$1, (a5, d0.w)
12dc: 285f                     movea.l    (a7)+, a4
12de: 4e5e                     unlk       a6
12e0: 205f                     movea.l    (a7)+, a0
12e2: 504f                     addq.w     #$8, a7
12e4: 4ed0                     jmp        (a0)
12e6: 4e56ffea                 link.w     a6, #$ffea
12ea: 48e70308                 movem.l    d6-d7/a4, -(a7)
12ee: 286e0008                 movea.l    $8(a6), a4
12f2: 4247                     clr.w      d7
12f4: 4206                     clr.b      d6
12f6: 601e                     bra.b      $1316
12f8: 3007                     move.w     d7, d0
12fa: c1fc0018                 muls.w     #$18, d0
12fe: 486cff72                 pea.l      -$8e(a4)
1302: 0640d520                 addi.w     #$d520, d0
1306: 48750000                 pea.l      (a5, d0.w)
130a: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
130e: 6604                     bne.b      $1314
1310: 7c01                     moveq      #$1, d6
1312: 6002                     bra.b      $1316
1314: 5247                     addq.w     #$1, d7
1316: be6cff64                 cmp.w      -$9c(a4), d7
131a: 5dc0                     slt.b      d0
131c: 1206                     move.b     d6, d1
131e: 5301                     subq.b     #$1, d1
1320: c001                     and.b      d1, d0
1322: 66d4                     bne.b      $12f8
1324: 4a06                     tst.b      d6
1326: 6712                     beq.b      $133a
1328: 3007                     move.w     d7, d0
132a: c1fc0018                 muls.w     #$18, d0
132e: 0640d532                 addi.w     #$d532, d0
1332: 3d750000000c             move.w     (a5, d0.w), $c(a6)
1338: 6010                     bra.b      $134a
133a: 41ec001a                 lea.l      $1a(a4), a0
133e: 3f18                     move.w     (a0)+, -(a7)
1340: 487a0012                 pea.l      $1354(pc)
1344: 2f10                     move.l     (a0), -(a7)
1346: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
134a: 4cdf10c0                 movem.l    (a7)+, d6-d7/a4
134e: 4e5e                     unlk       a6
1350: 2e9f                     move.l     (a7)+, (a7)
1352: 4e75                     rts        
1354: 25546869                 move.l     (a4), $6869(a2)
1358: 7320                     .byte      0x73, 0x20
135a: 6c61                     bge.b      $13bd
135c: 6265                     bhi.b      $13c3
135e: 6c20                     bge.b      $1380
1360: 6861                     bvc.b      $13c3
1362: 736e                     .byte      0x73, 0x6e
1364: 277420626565             move.l     $62(a4, d2.w), $6565(a3)
136a: 6e20                     bgt.b      $138c
136c: 616c                     bsr.b      $13da
136e: 6c6f                     bge.b      $13df
1370: 6361                     bls.b      $13d3
1372: 7465                     moveq      #$65, d2
1374: 6420                     bcc.b      $1396
1376: 7965                     .byte      0x79, 0x65
1378: 742e                     moveq      #$2e, d2
137a: 4e560000                 link.w     a6, #$0
137e: 2f0c                     move.l     a4, -(a7)
1380: 286e0008                 movea.l    $8(a6), a4
1384: 422cff69                 clr.b      -$97(a4)
1388: 206c0016                 movea.l    $16(a4), a0
138c: 226c000e                 movea.l    $e(a4), a1
1390: 3011                     move.w     (a1), d0
1392: e540                     asl.w      #$2, d0
1394: 11bc00020001             move.b     #$2, $1(a0, d0.w)
139a: 554f                     subq.w     #$2, a7
139c: 2f0c                     move.l     a4, -(a7)
139e: 4ebaff46                 jsr        $12e6(pc)
13a2: 206c0016                 movea.l    $16(a4), a0
13a6: 226c000e                 movea.l    $e(a4), a1
13aa: 3011                     move.w     (a1), d0
13ac: e540                     asl.w      #$2, d0
13ae: 319f0002                 move.w     (a7)+, $2(a0, d0.w)
13b2: 285f                     movea.l    (a7)+, a4
13b4: 4e5e                     unlk       a6
13b6: 2e9f                     move.l     (a7)+, (a7)
13b8: 4e75                     rts        
13ba: 4e56ffee                 link.w     a6, #$ffee
13be: 48e70108                 movem.l    d7/a4, -(a7)
13c2: 286e0008                 movea.l    $8(a6), a4
13c6: 3e2cff62                 move.w     -$9e(a4), d7
13ca: 600a                     bra.b      $13d6
13cc: 302cff62                 move.w     -$9e(a4), d0
13d0: 5240                     addq.w     #$1, d0
13d2: 3940ff62                 move.w     d0, -$9e(a4)
13d6: 206c0022                 movea.l    $22(a4), a0
13da: 2050                     movea.l    (a0), a0
13dc: 302cff62                 move.w     -$9e(a4), d0
13e0: 7200                     moveq      #$0, d1
13e2: 12300000                 move.b     (a0, d0.w), d1
13e6: 0c410020                 cmpi.w     #$20, d1
13ea: 57c0                     seq.b      d0
13ec: 206c0022                 movea.l    $22(a4), a0
13f0: 2050                     movea.l    (a0), a0
13f2: 322cff62                 move.w     -$9e(a4), d1
13f6: 7400                     moveq      #$0, d2
13f8: 14301000                 move.b     (a0, d1.w), d2
13fc: b46dbdbe                 cmp.w      -$4242(a5), d2
1400: 57c1                     seq.b      d1
1402: 8001                     or.b       d1, d0
1404: 322cff62                 move.w     -$9e(a4), d1
1408: b26c0020                 cmp.w      $20(a4), d1
140c: 5dc1                     slt.b      d1
140e: c001                     and.b      d1, d0
1410: 66ba                     bne.b      $13cc
1412: 302cff62                 move.w     -$9e(a4), d0
1416: 9047                     sub.w      d7, d0
1418: 3d40000c                 move.w     d0, $c(a6)
141c: 4cdf1080                 movem.l    (a7)+, d7/a4
1420: 4e5e                     unlk       a6
1422: 2e9f                     move.l     (a7)+, (a7)
1424: 4e75                     rts        
1426: 4e56ffea                 link.w     a6, #$ffea
142a: 48e70f08                 movem.l    d4-d7/a4, -(a7)
142e: 286e0008                 movea.l    $8(a6), a4
1432: 3a2cff62                 move.w     -$9e(a4), d5
1436: 4206                     clr.b      d6
1438: 6038                     bra.b      $1472
143a: 206c0022                 movea.l    $22(a4), a0
143e: 2050                     movea.l    (a0), a0
1440: 7e00                     moveq      #$0, d7
1442: 1e305000                 move.b     (a0, d5.w), d7
1446: 0c47000d                 cmpi.w     #$d, d7
144a: 57c0                     seq.b      d0
144c: 0c47003b                 cmpi.w     #$3b, d7
1450: 57c1                     seq.b      d1
1452: 8001                     or.b       d1, d0
1454: 6706                     beq.b      $145c
1456: 7c01                     moveq      #$1, d6
1458: 7801                     moveq      #$1, d4
145a: 6014                     bra.b      $1470
145c: 0c470020                 cmpi.w     #$20, d7
1460: 56c0                     sne.b      d0
1462: be6dbdbe                 cmp.w      -$4242(a5), d7
1466: 56c1                     sne.b      d1
1468: c001                     and.b      d1, d0
146a: 6704                     beq.b      $1470
146c: 7c01                     moveq      #$1, d6
146e: 4204                     clr.b      d4
1470: 5245                     addq.w     #$1, d5
1472: 1006                     move.b     d6, d0
1474: 5300                     subq.b     #$1, d0
1476: 66c2                     bne.b      $143a
1478: 1d44000c                 move.b     d4, $c(a6)
147c: 4cdf10f0                 movem.l    (a7)+, d4-d7/a4
1480: 4e5e                     unlk       a6
1482: 2e9f                     move.l     (a7)+, (a7)
1484: 4e75                     rts        
1486: 4e560000                 link.w     a6, #$0
148a: 48e70018                 movem.l    a3-a4, -(a7)
148e: 286e0008                 movea.l    $8(a6), a4
1492: 286c0008                 movea.l    $8(a4), a4
1496: 266e0008                 movea.l    $8(a6), a3
149a: 0c6b0030ffee             cmpi.w     #$30, -$12(a3)
14a0: 5cc0                     sge.b      d0
14a2: 0c6b0039ffee             cmpi.w     #$39, -$12(a3)
14a8: 5fc1                     sle.b      d1
14aa: c001                     and.b      d1, d0
14ac: 670000b2                 beq.w      $1560
14b0: 1d7c0001000c             move.b     #$1, $c(a6)
14b6: 197c0012ff84             move.b     #$12, -$7c(a4)
14bc: 42abffe8                 clr.l      -$18(a3)
14c0: 302bffee                 move.w     -$12(a3), d0
14c4: 0640ffd0                 addi.w     #$ffd0, d0
14c8: 2f2bffe8                 move.l     -$18(a3), -(a7)
14cc: 720a                     moveq      #$a, d1
14ce: 2f01                     move.l     d1, -(a7)
14d0: 4ead0122                 jsr        $122(a5) ; CODE 1 resource+0x0316
14d4: 48c0                     ext.l      d0
14d6: d09f                     add.l      (a7)+, d0
14d8: 2740ffe8                 move.l     d0, -$18(a3)
14dc: 554f                     subq.w     #$2, a7
14de: 206c0022                 movea.l    $22(a4), a0
14e2: 2050                     movea.l    (a0), a0
14e4: 302cff62                 move.w     -$9e(a4), d0
14e8: 7200                     moveq      #$0, d1
14ea: 12300000                 move.b     (a0, d0.w), d1
14ee: 3f01                     move.w     d1, -(a7)
14f0: 2f0c                     move.l     a4, -(a7)
14f2: 4ebaf94a                 jsr        $e3e(pc)
14f6: 375fffee                 move.w     (a7)+, -$12(a3)
14fa: 302cff62                 move.w     -$9e(a4), d0
14fe: 5240                     addq.w     #$1, d0
1500: 3940ff62                 move.w     d0, -$9e(a4)
1504: 0cab00007fffffe8         cmpi.l     #$7fff, -$18(a3)
150c: 6f10                     ble.b      $151e
150e: 41ec001a                 lea.l      $1a(a4), a0
1512: 3f18                     move.w     (a0)+, -(a7)
1514: 487a0058                 pea.l      $156e(pc)
1518: 2f10                     move.l     (a0), -(a7)
151a: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
151e: 0c6b0030ffee             cmpi.w     #$30, -$12(a3)
1524: 5dc0                     slt.b      d0
1526: 0c6b0039ffee             cmpi.w     #$39, -$12(a3)
152c: 5ec1                     sgt.b      d1
152e: 8001                     or.b       d1, d0
1530: 206c001c                 movea.l    $1c(a4), a0
1534: 7200                     moveq      #$0, d1
1536: 1210                     move.b     (a0), d1
1538: 4a41                     tst.w      d1
153a: 5ec1                     sgt.b      d1
153c: 8001                     or.b       d1, d0
153e: 322cff62                 move.w     -$9e(a4), d1
1542: b26c0020                 cmp.w      $20(a4), d1
1546: 5cc1                     sge.b      d1
1548: 8001                     or.b       d1, d0
154a: 6700ff74                 beq.w      $14c0
154e: 302cff62                 move.w     -$9e(a4), d0
1552: 5340                     subq.w     #$1, d0
1554: 3940ff62                 move.w     d0, -$9e(a4)
1558: 396bffeaff70             move.w     -$16(a3), -$90(a4)
155e: 6004                     bra.b      $1564
1560: 422e000c                 clr.b      $c(a6)
1564: 4cdf1800                 movem.l    (a7)+, a3-a4
1568: 4e5e                     unlk       a6
156a: 2e9f                     move.l     (a7)+, (a7)
156c: 4e75                     rts        
156e: 3a43                     movea.w    d3, a5
1570: 6f6e                     ble.b      $15e0
1572: 7374                     .byte      0x73, 0x74
1574: 616e                     bsr.b      $15e4
1576: 7420                     moveq      #$20, d2
1578: 746f                     moveq      #$6f, d2
157a: 6f20                     ble.b      $159c
157c: 6c61                     bge.b      $15df
157e: 7267                     moveq      #$67, d1
1580: 652e                     bcs.b      $15b0
1582: 2020                     move.l     -(a0), d0
1584: 33323736372069732074     move.w     ([$37206973, a2], d3.w * 8, $2074), -(a1)
158e: 6865                     bvc.b      $15f5
1590: 206c6172                 movea.l    $6172(a4), a0
1594: 6765                     beq.b      $15fb
1596: 7374                     .byte      0x73, 0x74
1598: 2063                     movea.l    -(a3), a0
159a: 6f6e                     ble.b      $160a
159c: 7374                     .byte      0x73, 0x74
159e: 616e                     bsr.b      $160e
15a0: 7420                     moveq      #$20, d2
15a2: 616c                     bsr.b      $1610
15a4: 6c6f                     bge.b      $1615
15a6: 7765                     .byte      0x77, 0x65
15a8: 6498                     bcc.b      $1542
15aa: 4e56fcee                 link.w     a6, #$fcee
15ae: 48e71108                 movem.l    d3/d7/a4, -(a7)
15b2: 286e0008                 movea.l    $8(a6), a4
15b6: 286c0008                 movea.l    $8(a4), a4
15ba: 303c0100                 move.w     #$100, d0
15be: 102e000d                 move.b     $d(a6), d0
15c2: 3d40fef0                 move.w     d0, -$110(a6)
15c6: 3d7c013ffdf0             move.w     #$13f, -$210(a6)
15cc: 206c0022                 movea.l    $22(a4), a0
15d0: 2050                     movea.l    (a0), a0
15d2: 3e2cff62                 move.w     -$9e(a4), d7
15d6: 7000                     moveq      #$0, d0
15d8: 10307000                 move.b     (a0, d7.w), d0
15dc: 3e00                     move.w     d0, d7
15de: 0c470061                 cmpi.w     #$61, d7
15e2: 5cc0                     sge.b      d0
15e4: 0c47007a                 cmpi.w     #$7a, d7
15e8: 5fc1                     sle.b      d1
15ea: c001                     and.b      d1, d0
15ec: 670000d6                 beq.w      $16c4
15f0: 0647ffe0                 addi.w     #$ffe0, d7
15f4: 600000ce                 bra.w      $16c4
15f8: 1d47fdf1                 move.b     d7, -$20f(a6)
15fc: 486efcee                 pea.l      -$312(a6)
1600: 486efef0                 pea.l      -$110(a6)
1604: 486efdf0                 pea.l      -$210(a6)
1608: 3f3c0002                 move.w     #$2, -(a7)
160c: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
1610: 584f                     addq.w     #$4, a7
1612: 3f3c00ff                 move.w     #$ff, -(a7)
1616: 486efcee                 pea.l      -$312(a6)
161a: 486efef0                 pea.l      -$110(a6)
161e: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
1622: 302cff62                 move.w     -$9e(a4), d0
1626: 5240                     addq.w     #$1, d0
1628: 3940ff62                 move.w     d0, -$9e(a4)
162c: 206c0022                 movea.l    $22(a4), a0
1630: 2050                     movea.l    (a0), a0
1632: 3e2cff62                 move.w     -$9e(a4), d7
1636: 7000                     moveq      #$0, d0
1638: 10307000                 move.b     (a0, d7.w), d0
163c: 3e00                     move.w     d0, d7
163e: 0c470061                 cmpi.w     #$61, d7
1642: 5cc0                     sge.b      d0
1644: 0c47007a                 cmpi.w     #$7a, d7
1648: 5fc1                     sle.b      d1
164a: c001                     and.b      d1, d0
164c: 6704                     beq.b      $1652
164e: 0647ffe0                 addi.w     #$ffe0, d7
1652: 7000                     moveq      #$0, d0
1654: 102efef0                 move.b     -$110(a6), d0
1658: 0c40000f                 cmpi.w     #$f, d0
165c: 6d66                     blt.b      $16c4
165e: 6030                     bra.b      $1690
1660: 302cff62                 move.w     -$9e(a4), d0
1664: 5240                     addq.w     #$1, d0
1666: 3940ff62                 move.w     d0, -$9e(a4)
166a: 302cff62                 move.w     -$9e(a4), d0
166e: b06c0020                 cmp.w      $20(a4), d0
1672: 6e1c                     bgt.b      $1690
1674: 554f                     subq.w     #$2, a7
1676: 206c0022                 movea.l    $22(a4), a0
167a: 2050                     movea.l    (a0), a0
167c: 3e2cff62                 move.w     -$9e(a4), d7
1680: 7000                     moveq      #$0, d0
1682: 10307000                 move.b     (a0, d7.w), d0
1686: 3f00                     move.w     d0, -(a7)
1688: 2f0c                     move.l     a4, -(a7)
168a: 4ebaf7b2                 jsr        $e3e(pc)
168e: 3e1f                     move.w     (a7)+, d7
1690: 302cff62                 move.w     -$9e(a4), d0
1694: b06c0020                 cmp.w      $20(a4), d0
1698: 5dc0                     slt.b      d0
169a: 0c47005f                 cmpi.w     #$5f, d7
169e: 57c1                     seq.b      d1
16a0: 0c470041                 cmpi.w     #$41, d7
16a4: 5cc2                     sge.b      d2
16a6: 0c47005a                 cmpi.w     #$5a, d7
16aa: 5fc3                     sle.b      d3
16ac: c403                     and.b      d3, d2
16ae: 8202                     or.b       d2, d1
16b0: 0c470030                 cmpi.w     #$30, d7
16b4: 5cc2                     sge.b      d2
16b6: 0c470039                 cmpi.w     #$39, d7
16ba: 5fc3                     sle.b      d3
16bc: c403                     and.b      d3, d2
16be: 8202                     or.b       d2, d1
16c0: c001                     and.b      d1, d0
16c2: 669c                     bne.b      $1660
16c4: 302cff62                 move.w     -$9e(a4), d0
16c8: b06c0020                 cmp.w      $20(a4), d0
16cc: 5dc0                     slt.b      d0
16ce: 0c47005f                 cmpi.w     #$5f, d7
16d2: 57c1                     seq.b      d1
16d4: 0c470041                 cmpi.w     #$41, d7
16d8: 5cc2                     sge.b      d2
16da: 0c47005a                 cmpi.w     #$5a, d7
16de: 5fc3                     sle.b      d3
16e0: c403                     and.b      d3, d2
16e2: 8202                     or.b       d2, d1
16e4: 0c470030                 cmpi.w     #$30, d7
16e8: 5cc2                     sge.b      d2
16ea: 0c470039                 cmpi.w     #$39, d7
16ee: 5fc3                     sle.b      d3
16f0: c403                     and.b      d3, d2
16f2: 8202                     or.b       d2, d1
16f4: c001                     and.b      d1, d0
16f6: 6600ff00                 bne.w      $15f8
16fa: 206e000e                 movea.l    $e(a6), a0
16fe: 3f3c00ff                 move.w     #$ff, -(a7)
1702: 486efef0                 pea.l      -$110(a6)
1706: 2f08                     move.l     a0, -(a7)
1708: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
170c: 4cdf1088                 movem.l    (a7)+, d3/d7/a4
1710: 4e5e                     unlk       a6
1712: 205f                     movea.l    (a7)+, a0
1714: 5c4f                     addq.w     #$6, a7
1716: 4ed0                     jmp        (a0)
1718: 4e56fee8                 link.w     a6, #$fee8
171c: 48e70108                 movem.l    d7/a4, -(a7)
1720: 286e0008                 movea.l    $8(a6), a4
1724: 554f                     subq.w     #$2, a7
1726: 206c0022                 movea.l    $22(a4), a0
172a: 2050                     movea.l    (a0), a0
172c: 302cff62                 move.w     -$9e(a4), d0
1730: 7200                     moveq      #$0, d1
1732: 12300000                 move.b     (a0, d0.w), d1
1736: 3f01                     move.w     d1, -(a7)
1738: 2f0c                     move.l     a4, -(a7)
173a: 4ebaf702                 jsr        $e3e(pc)
173e: 3d5fffee                 move.w     (a7)+, -$12(a6)
1742: 302cff62                 move.w     -$9e(a4), d0
1746: 5240                     addq.w     #$1, d0
1748: 3940ff62                 move.w     d0, -$9e(a4)
174c: 554f                     subq.w     #$2, a7
174e: 206c0022                 movea.l    $22(a4), a0
1752: 2050                     movea.l    (a0), a0
1754: 3e2cff62                 move.w     -$9e(a4), d7
1758: 7000                     moveq      #$0, d0
175a: 10307000                 move.b     (a0, d7.w), d0
175e: 3f00                     move.w     d0, -(a7)
1760: 2f0c                     move.l     a4, -(a7)
1762: 4ebaf6da                 jsr        $e3e(pc)
1766: 3e1f                     move.w     (a7)+, d7
1768: 0c6e0041ffee             cmpi.w     #$41, -$12(a6)
176e: 5cc0                     sge.b      d0
1770: 0c6e005affee             cmpi.w     #$5a, -$12(a6)
1776: 5fc1                     sle.b      d1
1778: c001                     and.b      d1, d0
177a: 670005ec                 beq.w      $1d68
177e: 486efee8                 pea.l      -$118(a6)
1782: 3f2effee                 move.w     -$12(a6), -(a7)
1786: 2f0e                     move.l     a6, -(a7)
1788: 4ebafe20                 jsr        $15aa(pc)
178c: 584f                     addq.w     #$4, a7
178e: 3f3c000f                 move.w     #$f, -(a7)
1792: 486efee8                 pea.l      -$118(a6)
1796: 486cff72                 pea.l      -$8e(a4)
179a: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
179e: 0c6e004effee             cmpi.w     #$4e, -$12(a6)
17a4: 6e0002da                 bgt.w      $1a80
17a8: 0c6e0046ffee             cmpi.w     #$46, -$12(a6)
17ae: 6e000246                 bgt.w      $19f6
17b2: 0c6e0043ffee             cmpi.w     #$43, -$12(a6)
17b8: 6e0000ec                 bgt.w      $18a6
17bc: 487a0abe                 pea.l      $227c(pc)
17c0: 486cff72                 pea.l      -$8e(a4)
17c4: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
17c8: 6610                     bne.b      $17da
17ca: 197c0001ff84             move.b     #$1, -$7c(a4)
17d0: 397c000eff70             move.w     #$e, -$90(a4)
17d6: 60000830                 bra.w      $2008
17da: 487a0a96                 pea.l      $2272(pc)
17de: 486cff72                 pea.l      -$8e(a4)
17e2: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
17e6: 660a                     bne.b      $17f2
17e8: 197c0016ff84             move.b     #$16, -$7c(a4)
17ee: 60000818                 bra.w      $2008
17f2: 0cac0341494dff72         cmpi.l     #$341494d, -$8e(a4)
17fa: 6610                     bne.b      $180c
17fc: 197c0001ff84             move.b     #$1, -$7c(a4)
1802: 397c0002ff70             move.w     #$2, -$90(a4)
1808: 600007fe                 bra.w      $2008
180c: 487a0a5e                 pea.l      $226c(pc)
1810: 486cff72                 pea.l      -$8e(a4)
1814: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1818: 6610                     bne.b      $182a
181a: 197c0001ff84             move.b     #$1, -$7c(a4)
1820: 397c0008ff70             move.w     #$8, -$90(a4)
1826: 600007e0                 bra.w      $2008
182a: 487a0a36                 pea.l      $2262(pc)
182e: 486cff72                 pea.l      -$8e(a4)
1832: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1836: 660e                     bne.b      $1846
1838: 197c0015ff84             move.b     #$15, -$7c(a4)
183e: 422cff5b                 clr.b      -$a5(a4)
1842: 600007c4                 bra.w      $2008
1846: 487a0a10                 pea.l      $2258(pc)
184a: 486cff72                 pea.l      -$8e(a4)
184e: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1852: 6610                     bne.b      $1864
1854: 197c0015ff84             move.b     #$15, -$7c(a4)
185a: 197c0005ff5b             move.b     #$5, -$a5(a4)
1860: 600007a6                 bra.w      $2008
1864: 487a09ec                 pea.l      $2252(pc)
1868: 486cff72                 pea.l      -$8e(a4)
186c: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1870: 6610                     bne.b      $1882
1872: 197c0015ff84             move.b     #$15, -$7c(a4)
1878: 197c0006ff5b             move.b     #$6, -$a5(a4)
187e: 60000788                 bra.w      $2008
1882: 0cac03414e44ff72         cmpi.l     #$3414e44, -$8e(a4)
188a: 6610                     bne.b      $189c
188c: 197c0002ff84             move.b     #$2, -$7c(a4)
1892: 197c0007ff83             move.b     #$7, -$7d(a4)
1898: 6000076e                 bra.w      $2008
189c: 197c0014ff84             move.b     #$14, -$7c(a4)
18a2: 60000764                 bra.w      $2008
18a6: 0cac03454e44ff72         cmpi.l     #$3454e44, -$8e(a4)
18ae: 660a                     bne.b      $18ba
18b0: 197c000bff84             move.b     #$b, -$7c(a4)
18b6: 60000750                 bra.w      $2008
18ba: 487a0990                 pea.l      $224c(pc)
18be: 486cff72                 pea.l      -$8e(a4)
18c2: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
18c6: 660a                     bne.b      $18d2
18c8: 197c0006ff84             move.b     #$6, -$7c(a4)
18ce: 60000738                 bra.w      $2008
18d2: 487a0970                 pea.l      $2244(pc)
18d6: 486cff72                 pea.l      -$8e(a4)
18da: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
18de: 660a                     bne.b      $18ea
18e0: 197c000fff84             move.b     #$f, -$7c(a4)
18e6: 60000720                 bra.w      $2008
18ea: 487a0954                 pea.l      $2240(pc)
18ee: 486cff72                 pea.l      -$8e(a4)
18f2: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
18f6: 660a                     bne.b      $1902
18f8: 197c0008ff84             move.b     #$8, -$7c(a4)
18fe: 60000708                 bra.w      $2008
1902: 487a0934                 pea.l      $2238(pc)
1906: 486cff72                 pea.l      -$8e(a4)
190a: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
190e: 660a                     bne.b      $191a
1910: 197c0013ff84             move.b     #$13, -$7c(a4)
1916: 600006f0                 bra.w      $2008
191a: 487a0912                 pea.l      $222e(pc)
191e: 486cff72                 pea.l      -$8e(a4)
1922: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1926: 6610                     bne.b      $1938
1928: 197c0001ff84             move.b     #$1, -$7c(a4)
192e: 397c000fff70             move.w     #$f, -$90(a4)
1934: 600006d2                 bra.w      $2008
1938: 487a08ec                 pea.l      $2226(pc)
193c: 486cff72                 pea.l      -$8e(a4)
1940: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1944: 6610                     bne.b      $1956
1946: 197c0001ff84             move.b     #$1, -$7c(a4)
194c: 397c0004ff70             move.w     #$4, -$90(a4)
1952: 600006b4                 bra.w      $2008
1956: 487a08c4                 pea.l      $221c(pc)
195a: 486cff72                 pea.l      -$8e(a4)
195e: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1962: 6610                     bne.b      $1974
1964: 197c0001ff84             move.b     #$1, -$7c(a4)
196a: 397c0006ff70             move.w     #$6, -$90(a4)
1970: 60000696                 bra.w      $2008
1974: 487a08a0                 pea.l      $2216(pc)
1978: 486cff72                 pea.l      -$8e(a4)
197c: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1980: 6610                     bne.b      $1992
1982: 197c0001ff84             move.b     #$1, -$7c(a4)
1988: 397c0007ff70             move.w     #$7, -$90(a4)
198e: 60000678                 bra.w      $2008
1992: 487a0878                 pea.l      $220c(pc)
1996: 486cff72                 pea.l      -$8e(a4)
199a: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
199e: 6610                     bne.b      $19b0
19a0: 197c0015ff84             move.b     #$15, -$7c(a4)
19a6: 197c0001ff5b             move.b     #$1, -$a5(a4)
19ac: 6000065a                 bra.w      $2008
19b0: 487a084e                 pea.l      $2200(pc)
19b4: 486cff72                 pea.l      -$8e(a4)
19b8: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
19bc: 6610                     bne.b      $19ce
19be: 197c0015ff84             move.b     #$15, -$7c(a4)
19c4: 197c0002ff5b             move.b     #$2, -$a5(a4)
19ca: 6000063c                 bra.w      $2008
19ce: 487a0822                 pea.l      $21f2(pc)
19d2: 486cff72                 pea.l      -$8e(a4)
19d6: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
19da: 6610                     bne.b      $19ec
19dc: 197c0015ff84             move.b     #$15, -$7c(a4)
19e2: 197c0004ff5b             move.b     #$4, -$a5(a4)
19e8: 6000061e                 bra.w      $2008
19ec: 197c0014ff84             move.b     #$14, -$7c(a4)
19f2: 60000614                 bra.w      $2008
19f6: 487a07f4                 pea.l      $21ec(pc)
19fa: 486cff72                 pea.l      -$8e(a4)
19fe: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1a02: 660a                     bne.b      $1a0e
1a04: 197c000cff84             move.b     #$c, -$7c(a4)
1a0a: 600005fc                 bra.w      $2008
1a0e: 487a07d8                 pea.l      $21e8(pc)
1a12: 486cff72                 pea.l      -$8e(a4)
1a16: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1a1a: 660a                     bne.b      $1a26
1a1c: 197c0004ff84             move.b     #$4, -$7c(a4)
1a22: 600005e4                 bra.w      $2008
1a26: 487a07ba                 pea.l      $21e2(pc)
1a2a: 486cff72                 pea.l      -$8e(a4)
1a2e: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1a32: 660a                     bne.b      $1a3e
1a34: 197c000dff84             move.b     #$d, -$7c(a4)
1a3a: 600005cc                 bra.w      $2008
1a3e: 487a0796                 pea.l      $21d6(pc)
1a42: 486cff72                 pea.l      -$8e(a4)
1a46: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1a4a: 6610                     bne.b      $1a5c
1a4c: 197c0001ff84             move.b     #$1, -$7c(a4)
1a52: 397c0009ff70             move.w     #$9, -$90(a4)
1a58: 600005ae                 bra.w      $2008
1a5c: 0cac034d4f44ff72         cmpi.l     #$34d4f44, -$8e(a4)
1a64: 6610                     bne.b      $1a76
1a66: 197c0002ff84             move.b     #$2, -$7c(a4)
1a6c: 197c0006ff83             move.b     #$6, -$7d(a4)
1a72: 60000594                 bra.w      $2008
1a76: 197c0014ff84             move.b     #$14, -$7c(a4)
1a7c: 6000058a                 bra.w      $2008
1a80: 0c6e0053ffee             cmpi.w     #$53, -$12(a6)
1a86: 6e000144                 bgt.w      $1bcc
1a8a: 487a0742                 pea.l      $21ce(pc)
1a8e: 486cff72                 pea.l      -$8e(a4)
1a92: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1a96: 660a                     bne.b      $1aa2
1a98: 197c000eff84             move.b     #$e, -$7c(a4)
1a9e: 60000568                 bra.w      $2008
1aa2: 487a0722                 pea.l      $21c6(pc)
1aa6: 486cff72                 pea.l      -$8e(a4)
1aaa: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1aae: 660a                     bne.b      $1aba
1ab0: 197c0009ff84             move.b     #$9, -$7c(a4)
1ab6: 60000550                 bra.w      $2008
1aba: 487a0704                 pea.l      $21c0(pc)
1abe: 486cff72                 pea.l      -$8e(a4)
1ac2: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1ac6: 6610                     bne.b      $1ad8
1ac8: 197c0001ff84             move.b     #$1, -$7c(a4)
1ace: 397c0003ff70             move.w     #$3, -$90(a4)
1ad4: 60000532                 bra.w      $2008
1ad8: 487a06e0                 pea.l      $21ba(pc)
1adc: 486cff72                 pea.l      -$8e(a4)
1ae0: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1ae4: 6610                     bne.b      $1af6
1ae6: 197c0001ff84             move.b     #$1, -$7c(a4)
1aec: 397c0010ff70             move.w     #$10, -$90(a4)
1af2: 60000514                 bra.w      $2008
1af6: 487a06bc                 pea.l      $21b4(pc)
1afa: 486cff72                 pea.l      -$8e(a4)
1afe: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1b02: 6610                     bne.b      $1b14
1b04: 197c0001ff84             move.b     #$1, -$7c(a4)
1b0a: 397c0005ff70             move.w     #$5, -$90(a4)
1b10: 600004f6                 bra.w      $2008
1b14: 487a0696                 pea.l      $21ac(pc)
1b18: 486cff72                 pea.l      -$8e(a4)
1b1c: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1b20: 6610                     bne.b      $1b32
1b22: 197c0001ff84             move.b     #$1, -$7c(a4)
1b28: 397c0011ff70             move.w     #$11, -$90(a4)
1b2e: 600004d8                 bra.w      $2008
1b32: 487a066c                 pea.l      $21a0(pc)
1b36: 486cff72                 pea.l      -$8e(a4)
1b3a: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1b3e: 6610                     bne.b      $1b50
1b40: 197c0012ff84             move.b     #$12, -$7c(a4)
1b46: 397c0012ff70             move.w     #$12, -$90(a4)
1b4c: 600004ba                 bra.w      $2008
1b50: 487a0648                 pea.l      $219a(pc)
1b54: 486cff72                 pea.l      -$8e(a4)
1b58: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1b5c: 6610                     bne.b      $1b6e
1b5e: 197c0001ff84             move.b     #$1, -$7c(a4)
1b64: 397c0012ff70             move.w     #$12, -$90(a4)
1b6a: 6000049c                 bra.w      $2008
1b6e: 487a061e                 pea.l      $218e(pc)
1b72: 486cff72                 pea.l      -$8e(a4)
1b76: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1b7a: 6610                     bne.b      $1b8c
1b7c: 197c0015ff84             move.b     #$15, -$7c(a4)
1b82: 197c0003ff5b             move.b     #$3, -$a5(a4)
1b88: 6000047e                 bra.w      $2008
1b8c: 487a05fc                 pea.l      $218a(pc)
1b90: 486cff72                 pea.l      -$8e(a4)
1b94: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1b98: 6610                     bne.b      $1baa
1b9a: 197c0002ff84             move.b     #$2, -$7c(a4)
1ba0: 197c0008ff83             move.b     #$8, -$7d(a4)
1ba6: 60000460                 bra.w      $2008
1baa: 487a05d8                 pea.l      $2184(pc)
1bae: 486cff72                 pea.l      -$8e(a4)
1bb2: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1bb6: 660a                     bne.b      $1bc2
1bb8: 197c001aff84             move.b     #$1a, -$7c(a4)
1bbe: 60000448                 bra.w      $2008
1bc2: 197c0014ff84             move.b     #$14, -$7c(a4)
1bc8: 6000043e                 bra.w      $2008
1bcc: 487a05b2                 pea.l      $2180(pc)
1bd0: 486cff72                 pea.l      -$8e(a4)
1bd4: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1bd8: 660a                     bne.b      $1be4
1bda: 197c0010ff84             move.b     #$10, -$7c(a4)
1be0: 60000426                 bra.w      $2008
1be4: 487a0594                 pea.l      $217a(pc)
1be8: 486cff72                 pea.l      -$8e(a4)
1bec: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1bf0: 660a                     bne.b      $1bfc
1bf2: 197c0005ff84             move.b     #$5, -$7c(a4)
1bf8: 6000040e                 bra.w      $2008
1bfc: 0c6c0158ff72             cmpi.w     #$158, -$8e(a4)
1c02: 660e                     bne.b      $1c12
1c04: 197c0001ff84             move.b     #$1, -$7c(a4)
1c0a: 426cff70                 clr.w      -$90(a4)
1c0e: 600003f8                 bra.w      $2008
1c12: 0c6c0159ff72             cmpi.w     #$159, -$8e(a4)
1c18: 6610                     bne.b      $1c2a
1c1a: 197c0001ff84             move.b     #$1, -$7c(a4)
1c20: 397c0001ff70             move.w     #$1, -$90(a4)
1c26: 600003e0                 bra.w      $2008
1c2a: 487a0548                 pea.l      $2174(pc)
1c2e: 486cff72                 pea.l      -$8e(a4)
1c32: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1c36: 660a                     bne.b      $1c42
1c38: 197c0019ff84             move.b     #$19, -$7c(a4)
1c3e: 600003c8                 bra.w      $2008
1c42: 487a0528                 pea.l      $216c(pc)
1c46: 486cff72                 pea.l      -$8e(a4)
1c4a: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1c4e: 6610                     bne.b      $1c60
1c50: 197c0001ff84             move.b     #$1, -$7c(a4)
1c56: 397c000dff70             move.w     #$d, -$90(a4)
1c5c: 600003aa                 bra.w      $2008
1c60: 487a0502                 pea.l      $2164(pc)
1c64: 486cff72                 pea.l      -$8e(a4)
1c68: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1c6c: 6610                     bne.b      $1c7e
1c6e: 197c0001ff84             move.b     #$1, -$7c(a4)
1c74: 397c000cff70             move.w     #$c, -$90(a4)
1c7a: 6000038c                 bra.w      $2008
1c7e: 487a04de                 pea.l      $215e(pc)
1c82: 486cff72                 pea.l      -$8e(a4)
1c86: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1c8a: 660a                     bne.b      $1c96
1c8c: 197c0007ff84             move.b     #$7, -$7c(a4)
1c92: 60000374                 bra.w      $2008
1c96: 487a04c0                 pea.l      $2158(pc)
1c9a: 486cff72                 pea.l      -$8e(a4)
1c9e: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1ca2: 660a                     bne.b      $1cae
1ca4: 197c000aff84             move.b     #$a, -$7c(a4)
1caa: 6000035c                 bra.w      $2008
1cae: 487a04a0                 pea.l      $2150(pc)
1cb2: 486cff72                 pea.l      -$8e(a4)
1cb6: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1cba: 6610                     bne.b      $1ccc
1cbc: 197c0001ff84             move.b     #$1, -$7c(a4)
1cc2: 397c0011ff70             move.w     #$11, -$90(a4)
1cc8: 6000033e                 bra.w      $2008
1ccc: 487a047c                 pea.l      $214a(pc)
1cd0: 486cff72                 pea.l      -$8e(a4)
1cd4: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1cd8: 6610                     bne.b      $1cea
1cda: 197c0012ff84             move.b     #$12, -$7c(a4)
1ce0: 397c017dff70             move.w     #$17d, -$90(a4)
1ce6: 60000320                 bra.w      $2008
1cea: 487a0458                 pea.l      $2144(pc)
1cee: 486cff72                 pea.l      -$8e(a4)
1cf2: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1cf6: 6610                     bne.b      $1d08
1cf8: 197c0012ff84             move.b     #$12, -$7c(a4)
1cfe: 397c0139ff70             move.w     #$139, -$90(a4)
1d04: 60000302                 bra.w      $2008
1d08: 487a042c                 pea.l      $2136(pc)
1d0c: 486cff72                 pea.l      -$8e(a4)
1d10: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1d14: 6610                     bne.b      $1d26
1d16: 197c0001ff84             move.b     #$1, -$7c(a4)
1d1c: 397c000aff70             move.w     #$a, -$90(a4)
1d22: 600002e4                 bra.w      $2008
1d26: 487a0400                 pea.l      $2128(pc)
1d2a: 486cff72                 pea.l      -$8e(a4)
1d2e: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1d32: 6610                     bne.b      $1d44
1d34: 197c0001ff84             move.b     #$1, -$7c(a4)
1d3a: 397c000bff70             move.w     #$b, -$90(a4)
1d40: 600002c6                 bra.w      $2008
1d44: 0cac03584f52ff72         cmpi.l     #$3584f52, -$8e(a4)
1d4c: 6610                     bne.b      $1d5e
1d4e: 197c0002ff84             move.b     #$2, -$7c(a4)
1d54: 197c0009ff83             move.b     #$9, -$7d(a4)
1d5a: 600002ac                 bra.w      $2008
1d5e: 197c0014ff84             move.b     #$14, -$7c(a4)
1d64: 600002a2                 bra.w      $2008
1d68: 0c6e000dffee             cmpi.w     #$d, -$12(a6)
1d6e: 6608                     bne.b      $1d78
1d70: 422cff84                 clr.b      -$7c(a4)
1d74: 60000292                 bra.w      $2008
1d78: 0c6e003bffee             cmpi.w     #$3b, -$12(a6)
1d7e: 660a                     bne.b      $1d8a
1d80: 197c0011ff84             move.b     #$11, -$7c(a4)
1d86: 60000280                 bra.w      $2008
1d8a: 554f                     subq.w     #$2, a7
1d8c: 2f0e                     move.l     a6, -(a7)
1d8e: 4ebaf6f6                 jsr        $1486(pc)
1d92: 4a1f                     tst.b      (a7)+
1d94: 66000272                 bne.w      $2008
1d98: 0c6e002bffee             cmpi.w     #$2b, -$12(a6)
1d9e: 6600008c                 bne.w      $1e2c
1da2: 4a2cff85                 tst.b      -$7b(a4)
1da6: 6674                     bne.b      $1e1c
1da8: 302cff62                 move.w     -$9e(a4), d0
1dac: b06c0020                 cmp.w      $20(a4), d0
1db0: 6c4c                     bge.b      $1dfe
1db2: 554f                     subq.w     #$2, a7
1db4: 206c0022                 movea.l    $22(a4), a0
1db8: 2050                     movea.l    (a0), a0
1dba: 302cff62                 move.w     -$9e(a4), d0
1dbe: 7200                     moveq      #$0, d1
1dc0: 12300000                 move.b     (a0, d0.w), d1
1dc4: 3f01                     move.w     d1, -(a7)
1dc6: 2f0c                     move.l     a4, -(a7)
1dc8: 4ebaf074                 jsr        $e3e(pc)
1dcc: 3d5fffee                 move.w     (a7)+, -$12(a6)
1dd0: 302cff62                 move.w     -$9e(a4), d0
1dd4: 5240                     addq.w     #$1, d0
1dd6: 3940ff62                 move.w     d0, -$9e(a4)
1dda: 554f                     subq.w     #$2, a7
1ddc: 2f0e                     move.l     a6, -(a7)
1dde: 4ebaf6a6                 jsr        $1486(pc)
1de2: 101f                     move.b     (a7)+, d0
1de4: 5300                     subq.b     #$1, d0
1de6: 67000220                 beq.w      $2008
1dea: 41ec001a                 lea.l      $1a(a4), a0
1dee: 3f18                     move.w     (a0)+, -(a7)
1df0: 487a030a                 pea.l      $20fc(pc)
1df4: 2f10                     move.l     (a0), -(a7)
1df6: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
1dfa: 6000020c                 bra.w      $2008
1dfe: 41ec001a                 lea.l      $1a(a4), a0
1e02: 3f18                     move.w     (a0)+, -(a7)
1e04: 487a02b0                 pea.l      $20b6(pc)
1e08: 2f10                     move.l     (a0), -(a7)
1e0a: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
1e0e: 302cff62                 move.w     -$9e(a4), d0
1e12: 5340                     subq.w     #$1, d0
1e14: 3940ff62                 move.w     d0, -$9e(a4)
1e18: 600001ee                 bra.w      $2008
1e1c: 197c0002ff84             move.b     #$2, -$7c(a4)
1e22: 197c0002ff83             move.b     #$2, -$7d(a4)
1e28: 600001de                 bra.w      $2008
1e2c: 0c6e002dffee             cmpi.w     #$2d, -$12(a6)
1e32: 66000098                 bne.w      $1ecc
1e36: 4a2cff85                 tst.b      -$7b(a4)
1e3a: 66000080                 bne.w      $1ebc
1e3e: 302cff62                 move.w     -$9e(a4), d0
1e42: b06c0020                 cmp.w      $20(a4), d0
1e46: 6c56                     bge.b      $1e9e
1e48: 554f                     subq.w     #$2, a7
1e4a: 206c0022                 movea.l    $22(a4), a0
1e4e: 2050                     movea.l    (a0), a0
1e50: 302cff62                 move.w     -$9e(a4), d0
1e54: 7200                     moveq      #$0, d1
1e56: 12300000                 move.b     (a0, d0.w), d1
1e5a: 3f01                     move.w     d1, -(a7)
1e5c: 2f0c                     move.l     a4, -(a7)
1e5e: 4ebaefde                 jsr        $e3e(pc)
1e62: 3d5fffee                 move.w     (a7)+, -$12(a6)
1e66: 302cff62                 move.w     -$9e(a4), d0
1e6a: 5240                     addq.w     #$1, d0
1e6c: 3940ff62                 move.w     d0, -$9e(a4)
1e70: 554f                     subq.w     #$2, a7
1e72: 2f0e                     move.l     a6, -(a7)
1e74: 4ebaf610                 jsr        $1486(pc)
1e78: 4a1f                     tst.b      (a7)+
1e7a: 670e                     beq.b      $1e8a
1e7c: 302cff70                 move.w     -$90(a4), d0
1e80: 4440                     neg.w      d0
1e82: 3940ff70                 move.w     d0, -$90(a4)
1e86: 60000180                 bra.w      $2008
1e8a: 41ec001a                 lea.l      $1a(a4), a0
1e8e: 3f18                     move.w     (a0)+, -(a7)
1e90: 487a01f8                 pea.l      $208a(pc)
1e94: 2f10                     move.l     (a0), -(a7)
1e96: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
1e9a: 6000016c                 bra.w      $2008
1e9e: 41ec001a                 lea.l      $1a(a4), a0
1ea2: 3f18                     move.w     (a0)+, -(a7)
1ea4: 487a019e                 pea.l      $2044(pc)
1ea8: 2f10                     move.l     (a0), -(a7)
1eaa: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
1eae: 302cff62                 move.w     -$9e(a4), d0
1eb2: 5340                     subq.w     #$1, d0
1eb4: 3940ff62                 move.w     d0, -$9e(a4)
1eb8: 6000014e                 bra.w      $2008
1ebc: 197c0002ff84             move.b     #$2, -$7c(a4)
1ec2: 197c0003ff83             move.b     #$3, -$7d(a4)
1ec8: 6000013e                 bra.w      $2008
1ecc: 0c6e002affee             cmpi.w     #$2a, -$12(a6)
1ed2: 6610                     bne.b      $1ee4
1ed4: 197c0002ff84             move.b     #$2, -$7c(a4)
1eda: 197c0004ff83             move.b     #$4, -$7d(a4)
1ee0: 60000126                 bra.w      $2008
1ee4: 0c6e002fffee             cmpi.w     #$2f, -$12(a6)
1eea: 6610                     bne.b      $1efc
1eec: 197c0002ff84             move.b     #$2, -$7c(a4)
1ef2: 197c0005ff83             move.b     #$5, -$7d(a4)
1ef8: 6000010e                 bra.w      $2008
1efc: 0c6e003cffee             cmpi.w     #$3c, -$12(a6)
1f02: 6658                     bne.b      $1f5c
1f04: 197c0003ff84             move.b     #$3, -$7c(a4)
1f0a: 302cff62                 move.w     -$9e(a4), d0
1f0e: b06c0020                 cmp.w      $20(a4), d0
1f12: 6c3e                     bge.b      $1f52
1f14: 0c47003d                 cmpi.w     #$3d, d7
1f18: 6614                     bne.b      $1f2e
1f1a: 302cff62                 move.w     -$9e(a4), d0
1f1e: 5240                     addq.w     #$1, d0
1f20: 3940ff62                 move.w     d0, -$9e(a4)
1f24: 197c000eff83             move.b     #$e, -$7d(a4)
1f2a: 600000dc                 bra.w      $2008
1f2e: 0c47003e                 cmpi.w     #$3e, d7
1f32: 6614                     bne.b      $1f48
1f34: 302cff62                 move.w     -$9e(a4), d0
1f38: 5240                     addq.w     #$1, d0
1f3a: 3940ff62                 move.w     d0, -$9e(a4)
1f3e: 197c000fff83             move.b     #$f, -$7d(a4)
1f44: 600000c2                 bra.w      $2008
1f48: 197c000cff83             move.b     #$c, -$7d(a4)
1f4e: 600000b8                 bra.w      $2008
1f52: 197c000cff83             move.b     #$c, -$7d(a4)
1f58: 600000ae                 bra.w      $2008
1f5c: 0c6e003effee             cmpi.w     #$3e, -$12(a6)
1f62: 6638                     bne.b      $1f9c
1f64: 197c0003ff84             move.b     #$3, -$7c(a4)
1f6a: 302cff62                 move.w     -$9e(a4), d0
1f6e: b06c0020                 cmp.w      $20(a4), d0
1f72: 5dc0                     slt.b      d0
1f74: 0c47003d                 cmpi.w     #$3d, d7
1f78: 57c1                     seq.b      d1
1f7a: c001                     and.b      d1, d0
1f7c: 6714                     beq.b      $1f92
1f7e: 302cff62                 move.w     -$9e(a4), d0
1f82: 5240                     addq.w     #$1, d0
1f84: 3940ff62                 move.w     d0, -$9e(a4)
1f88: 197c000dff83             move.b     #$d, -$7d(a4)
1f8e: 60000078                 bra.w      $2008
1f92: 197c000bff83             move.b     #$b, -$7d(a4)
1f98: 6000006e                 bra.w      $2008
1f9c: 0c6e003dffee             cmpi.w     #$3d, -$12(a6)
1fa2: 660e                     bne.b      $1fb2
1fa4: 197c0003ff84             move.b     #$3, -$7c(a4)
1faa: 197c000aff83             move.b     #$a, -$7d(a4)
1fb0: 6056                     bra.b      $2008
1fb2: 0c6e0026ffee             cmpi.w     #$26, -$12(a6)
1fb8: 6608                     bne.b      $1fc2
1fba: 197c0017ff84             move.b     #$17, -$7c(a4)
1fc0: 6046                     bra.b      $2008
1fc2: 0c6e005effee             cmpi.w     #$5e, -$12(a6)
1fc8: 6608                     bne.b      $1fd2
1fca: 197c0018ff84             move.b     #$18, -$7c(a4)
1fd0: 6036                     bra.b      $2008
1fd2: 302effee                 move.w     -$12(a6), d0
1fd6: 48c0                     ext.l      d0
1fd8: 2f00                     move.l     d0, -(a7)
1fda: 486cfe5a                 pea.l      -$1a6(a4)
1fde: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
1fe2: 486efee8                 pea.l      -$118(a6)
1fe6: 487a002a                 pea.l      $2012(pc)
1fea: 486cfe5a                 pea.l      -$1a6(a4)
1fee: 3f3c0002                 move.w     #$2, -(a7)
1ff2: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
1ff6: 584f                     addq.w     #$4, a7
1ff8: 41ec001a                 lea.l      $1a(a4), a0
1ffc: 3f18                     move.w     (a0)+, -(a7)
1ffe: 486efee8                 pea.l      -$118(a6)
2002: 2f10                     move.l     (a0), -(a7)
2004: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2008: 4cdf1080                 movem.l    (a7)+, d7/a4
200c: 4e5e                     unlk       a6
200e: 2e9f                     move.l     (a7)+, (a7)
2010: 4e75                     rts        
2012: 31556e72                 move.w     (a5), $6e72(a0)
2016: 6563                     bcs.b      $207b
2018: 6f67                     ble.b      $2081
201a: 6e69                     bgt.b      $2085
201c: 7a65                     moveq      #$65, d5
201e: 6420                     bcc.b      $2040
2020: 7379                     .byte      0x73, 0x79
2022: 6d62                     blt.b      $2086
2024: 6f6c                     ble.b      $2092
2026: 206f7220                 movea.l    $7220(a7), a0
202a: 6368                     bls.b      $2094
202c: 6172                     bsr.b      $20a0
202e: 6163                     bsr.b      $2093
2030: 7465                     moveq      #$65, d2
2032: 7220                     moveq      #$20, d1
2034: 696e                     bvs.b      $20a4
2036: 2066                     movea.l    -(a6), a0
2038: 696c                     bvs.b      $20a6
203a: 653a                     bcs.b      $2076
203c: 2020                     move.l     -(a0), d0
203e: 6368                     bls.b      $20a8
2040: 6172                     bsr.b      $20b4
2042: 2023                     move.l     -(a3), d0
2044: 4545                     .byte      0x45, 0x45
2046: 6e64                     bgt.b      $20ac
2048: 206f6620                 movea.l    $6620(a7), a0
204c: 6c69                     bge.b      $20b7
204e: 6e65                     bgt.b      $20b5
2050: 20776173206e6f7420657870 movea.l    ([$206e6f74, a7], $20657870), a0
205c: 6563                     bcs.b      $20c1
205e: 7465                     moveq      #$65, d2
2060: 6420                     bcc.b      $2082
2062: 6865                     bvc.b      $20c9
2064: 7265                     moveq      #$65, d1
2066: 2e20                     move.l     -(a0), d7
2068: 2053                     movea.l    (a3), a0
206a: 6f6d                     ble.b      $20d9
206c: 6574                     bcs.b      $20e2
206e: 6869                     bvc.b      $20d9
2070: 6e67                     bgt.b      $20d9
2072: 20697320                 movea.l    $7320(a1), a0
2076: 6d69                     blt.b      $20e1
2078: 7373                     .byte      0x73, 0x73
207a: 696e                     bvs.b      $20ea
207c: 6720                     beq.b      $209e
207e: 6f6e                     ble.b      $20ee
2080: 20746869                 movea.l    $69(a4, d6.l), a0
2084: 7320                     .byte      0x73, 0x20
2086: 6c69                     bge.b      $20f1
2088: 6e65                     bgt.b      $20ef
208a: 2b436f6e                 move.l     d3, $6f6e(a5)
208e: 7374                     .byte      0x73, 0x74
2090: 616e                     bsr.b      $2100
2092: 7420                     moveq      #$20, d2
2094: 6578                     bcs.b      $210e
2096: 7065                     moveq      #$65, d0
2098: 6374                     bls.b      $210e
209a: 6564                     bcs.b      $2100
209c: 2e20                     move.l     -(a0), d7
209e: 2045                     movea.l    d5, a0
20a0: 7870                     moveq      #$70, d4
20a2: 6563                     bcs.b      $2107
20a4: 7469                     moveq      #$69, d2
20a6: 6e67                     bgt.b      $210f
20a8: 3a20                     move.w     -(a0), d5
20aa: 202d3c63                 move.l     $3c63(a5), d0
20ae: 6f6e                     ble.b      $211e
20b0: 7374                     .byte      0x73, 0x74
20b2: 616e                     bsr.b      $2122
20b4: 743e                     moveq      #$3e, d2
20b6: 4545                     .byte      0x45, 0x45
20b8: 6e64                     bgt.b      $211e
20ba: 206f6620                 movea.l    $6620(a7), a0
20be: 6c69                     bge.b      $2129
20c0: 6e65                     bgt.b      $2127
20c2: 20776173206e6f7420657870 movea.l    ([$206e6f74, a7], $20657870), a0
20ce: 6563                     bcs.b      $2133
20d0: 7465                     moveq      #$65, d2
20d2: 6420                     bcc.b      $20f4
20d4: 6865                     bvc.b      $213b
20d6: 7265                     moveq      #$65, d1
20d8: 2e20                     move.l     -(a0), d7
20da: 2053                     movea.l    (a3), a0
20dc: 6f6d                     ble.b      $214b
20de: 6574                     bcs.b      $2154
20e0: 6869                     bvc.b      $214b
20e2: 6e67                     bgt.b      $214b
20e4: 20697320                 movea.l    $7320(a1), a0
20e8: 6d69                     blt.b      $2153
20ea: 7373                     .byte      0x73, 0x73
20ec: 696e                     bvs.b      $215c
20ee: 6720                     beq.b      $2110
20f0: 6f6e                     ble.b      $2160
20f2: 20746869                 movea.l    $69(a4, d6.l), a0
20f6: 7320                     .byte      0x73, 0x20
20f8: 6c69                     bge.b      $2163
20fa: 6e65                     bgt.b      $2161
20fc: 2b436f6e                 move.l     d3, $6f6e(a5)
2100: 7374                     .byte      0x73, 0x74
2102: 616e                     bsr.b      $2172
2104: 7420                     moveq      #$20, d2
2106: 6578                     bcs.b      $2180
2108: 7065                     moveq      #$65, d0
210a: 6374                     bls.b      $2180
210c: 6564                     bcs.b      $2172
210e: 2e20                     move.l     -(a0), d7
2110: 2045                     movea.l    d5, a0
2112: 7870                     moveq      #$70, d4
2114: 6563                     bcs.b      $2179
2116: 7469                     moveq      #$69, d2
2118: 6e67                     bgt.b      $2181
211a: 3a20                     move.w     -(a0), d5
211c: 202b3c63                 move.l     $3c63(a3), d0
2120: 6f6e                     ble.b      $2190
2122: 7374                     .byte      0x73, 0x74
2124: 616e                     bsr.b      $2194
2126: 743e                     moveq      #$3e, d2
2128: 0d54                     bchg.b     d6, (a4)
212a: 494d                     .byte      0x49, 0x4d
212c: 455f                     .byte      0x45, 0x5f
212e: 494e                     .byte      0x49, 0x4e
2130: 545f                     addq.w     #$2, (a7)+
2132: 5846                     addq.w     #$4, d6
2134: 4552                     .byte      0x45, 0x52
2136: 0d54                     bchg.b     d6, (a4)
2138: 494d                     .byte      0x49, 0x4d
213a: 455f                     .byte      0x45, 0x5f
213c: 494e                     .byte      0x49, 0x4e
213e: 545f                     addq.w     #$2, (a7)+
2140: 4d41                     .byte      0x4d, 0x41
2142: 534b                     subq.w     #$1, a3
2144: 04594d41                 subi.w     #$4d41, (a1)+
2148: 5816                     addq.b     #$4, (a6)
214a: 04584d41                 subi.w     #$4d41, (a0)+
214e: 5816                     addq.b     #$4, (a6)
2150: 0652414e                 addi.w     #$414e, (a2)
2154: 444f                     .byte      0x44, 0x4f
2156: 4d16                     dc.w       $4d16
2158: 0555                     bchg.b     d2, (a5)
215a: 4e54494c                 link.w     a4, #$494c
215e: 0557                     bchg.b     d2, (a7)
2160: 4849                     dc.w       $4849
2162: 4c45                     .byte      0x4c, 0x45
2164: 06585f43                 addi.w     #$5f43, (a0)+
2168: 4f4e                     .byte      0x4f, 0x4e
216a: 5616                     addq.b     #$3, (a6)
216c: 06595f43                 addi.w     #$5f43, (a1)+
2170: 4f4e                     .byte      0x4f, 0x4e
2172: 5616                     addq.b     #$3, (a6)
2174: 0554                     bchg.b     d2, (a4)
2176: 5241                     addq.w     #$1, d1
2178: 4345                     .byte      0x43, 0x45
217a: 04544845                 subi.w     #$4845, (a4)
217e: 4e16                     .byte      0x4e, 0x16
2180: 02544f16                 andi.w     #$4f16, (a4)
2184: 0552                     bchg.b     d2, (a2)
2186: 4553                     .byte      0x45, 0x53
2188: 4554                     .byte      0x45, 0x54
218a: 024f                     .byte      0x02, 0x4f
218c: 5216                     addq.b     #$1, (a6)
218e: 0b52                     bchg.b     d5, (a2)
2190: 4144                     .byte      0x41, 0x44
2192: 4152                     .byte      0x41, 0x52
2194: 5f52                     subq.w     #$7, (a2)
2196: 414e                     .byte      0x41, 0x4e
2198: 4745                     .byte      0x47, 0x45
219a: 0553                     bchg.b     d2, (a3)
219c: 5441                     addq.w     #$2, d1
219e: 434b                     .byte      0x43, 0x4b
21a0: 0a53484f                 eori.w     #$484f, (a3)
21a4: 545f                     addq.w     #$2, (a7)+
21a6: 5350                     subq.w     #$1, (a0)
21a8: 4545                     .byte      0x45, 0x45
21aa: 4416                     neg.b      (a6)
21ac: 0652414e                 addi.w     #$414e, (a2)
21b0: 444f                     .byte      0x44, 0x4f
21b2: 4d16                     dc.w       $4d16
21b4: 0553                     bchg.b     d2, (a3)
21b6: 5045                     addq.w     #$8, d5
21b8: 4544                     .byte      0x45, 0x44
21ba: 0552                     bchg.b     d2, (a2)
21bc: 4144                     .byte      0x41, 0x44
21be: 4152                     .byte      0x41, 0x52
21c0: 0453484f                 subi.w     #$484f, (a3)
21c4: 5416                     addq.b     #$2, (a6)
21c6: 06524550                 addi.w     #$4550, (a2)
21ca: 4541                     .byte      0x45, 0x41
21cc: 5416                     addq.b     #$2, (a6)
21ce: 06524554                 addi.w     #$4554, (a2)
21d2: 5552                     subq.w     #$2, (a2)
21d4: 4e16                     .byte      0x4e, 0x16
21d6: 0a4e                     .byte      0x0a, 0x4e
21d8: 554d                     subq.w     #$2, a5
21da: 5f52                     subq.w     #$7, (a2)
21dc: 4f42                     .byte      0x4f, 0x42
21de: 4f54                     .byte      0x4f, 0x54
21e0: 5316                     subq.b     #$1, (a6)
21e2: 0547                     bchg.b     d2, d7
21e4: 4f53                     .byte      0x4f, 0x53
21e6: 5542                     subq.w     #$2, d2
21e8: 0249                     .byte      0x02, 0x49
21ea: 4616                     not.b      (a6)
21ec: 04474f54                 subi.w     #$4f54, d7
21f0: 4f16                     dc.w       $4f16
21f2: 0d46                     bchg.b     d6, d6
21f4: 5545                     subq.w     #$2, d5
21f6: 4c5f                     .byte      0x4c, 0x5f
21f8: 4341                     .byte      0x43, 0x41
21fa: 5041                     addq.w     #$8, d1
21fc: 4349                     .byte      0x43, 0x49
21fe: 5459                     addq.w     #$2, (a1)+
2200: 0b45                     bchg.b     d5, d5
2202: 4e47                     trap       #$7
2204: 494e                     .byte      0x49, 0x4e
2206: 455f                     .byte      0x45, 0x5f
2208: 5349                     subq.w     #$1, a1
220a: 5a45                     addq.w     #$5, d5
220c: 0946                     bchg.b     d4, d6
220e: 4952                     .byte      0x49, 0x52
2210: 455f                     .byte      0x45, 0x5f
2212: 5241                     addq.w     #$1, d1
2214: 5445                     addq.w     #$2, d5
2216: 04465545                 subi.w     #$5545, d6
221a: 4c16                     .byte      0x4c, 0x16
221c: 0944                     bchg.b     d4, d4
221e: 4952                     .byte      0x49, 0x52
2220: 4543                     .byte      0x45, 0x43
2222: 5449                     addq.w     #$2, a1
2224: 4f4e                     .byte      0x4f, 0x4e
2226: 0644414d                 addi.w     #$414d, d4
222a: 4147                     .byte      0x41, 0x47
222c: 4516                     dc.w       $4516
222e: 0944                     bchg.b     d4, d4
2230: 4953                     .byte      0x49, 0x53
2232: 545f                     addq.w     #$2, (a7)+
2234: 434f                     .byte      0x43, 0x4f
2236: 4e560644                 link.w     a6, #$644
223a: 4546                     .byte      0x45, 0x46
223c: 494e                     .byte      0x49, 0x4e
223e: 4516                     dc.w       $4516
2240: 02444f16                 andi.w     #$4f16, d4
2244: 06454e44                 addi.w     #$4e44, d5
2248: 494e                     .byte      0x49, 0x4e
224a: 5416                     addq.b     #$2, (a6)
224c: 04454c53                 subi.w     #$4c53, d5
2250: 4516                     dc.w       $4516
2252: 0541                     bchg.b     d2, d1
2254: 524d                     addq.w     #$1, a5
2256: 4f52                     .byte      0x4f, 0x52
2258: 0843                     .byte      0x08, 0x43
225a: 4c4f                     .byte      0x4c, 0x4f
225c: 414b                     .byte      0x41, 0x4b
225e: 494e                     .byte      0x49, 0x4e
2260: 4716                     dc.w       $4716
2262: 0943                     bchg.b     d4, d3
2264: 5055                     addq.w     #$8, (a5)
2266: 5f53                     subq.w     #$7, (a3)
2268: 5045                     addq.w     #$8, d5
226a: 4544                     .byte      0x45, 0x44
226c: 0543                     bchg.b     d2, d3
226e: 4c4f                     .byte      0x4c, 0x4f
2270: 414b                     .byte      0x41, 0x4b
2272: 0841                     .byte      0x08, 0x41
2274: 4c4c                     .byte      0x4c, 0x4c
2276: 4f43                     .byte      0x4f, 0x43
2278: 4154                     .byte      0x41, 0x54
227a: 4516                     dc.w       $4516
227c: 0a414e47                 eori.w     #$4e47, d1
2280: 4c45                     .byte      0x4c, 0x45
2282: 5f43                     subq.w     #$7, d3
2284: 4f4e                     .byte      0x4f, 0x4e
2286: 5616                     addq.b     #$3, (a6)
2288: 4e560000                 link.w     a6, #$0
228c: 2f0c                     move.l     a4, -(a7)
228e: 286e0008                 movea.l    $8(a6), a4
2292: 0c6c000fff88             cmpi.w     #$f, -$78(a4)
2298: 6d12                     blt.b      $22ac
229a: 41ec001a                 lea.l      $1a(a4), a0
229e: 3f18                     move.w     (a0)+, -(a7)
22a0: 487a004c                 pea.l      $22ee(pc)
22a4: 2f10                     move.l     (a0), -(a7)
22a6: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
22aa: 6038                     bra.b      $22e4
22ac: 302cff88                 move.w     -$78(a4), d0
22b0: c1fc0006                 muls.w     #$6, d0
22b4: 19ae000c0090             move.b     $c(a6), -$70(a4, d0.w)
22ba: 206c000e                 movea.l    $e(a4), a0
22be: 302cff88                 move.w     -$78(a4), d0
22c2: c1fc0006                 muls.w     #$6, d0
22c6: 39900092                 move.w     (a0), -$6e(a4, d0.w)
22ca: 206c000e                 movea.l    $e(a4), a0
22ce: 302cff88                 move.w     -$78(a4), d0
22d2: c1fc0006                 muls.w     #$6, d0
22d6: 39900094                 move.w     (a0), -$6c(a4, d0.w)
22da: 302cff88                 move.w     -$78(a4), d0
22de: 5240                     addq.w     #$1, d0
22e0: 3940ff88                 move.w     d0, -$78(a4)
22e4: 285f                     movea.l    (a7)+, a4
22e6: 4e5e                     unlk       a6
22e8: 205f                     movea.l    (a7)+, a0
22ea: 5c4f                     addq.w     #$6, a7
22ec: 4ed0                     jmp        (a0)
22ee: 2c45                     movea.l    d5, a6
22f0: 7272                     moveq      #$72, d1
22f2: 6f72                     ble.b      $2366
22f4: 2e20                     move.l     -(a0), d7
22f6: 204e                     movea.l    a6, a0
22f8: 6573                     bcs.b      $236d
22fa: 7469                     moveq      #$69, d2
22fc: 6e67                     bgt.b      $2365
22fe: 206f6620                 movea.l    $6620(a7), a0
2302: 636f                     bls.b      $2373
2304: 6e64                     bgt.b      $236a
2306: 6974                     bvs.b      $237c
2308: 696f                     bvs.b      $2379
230a: 6e61                     bgt.b      $236d
230c: 6c73                     bge.b      $2381
230e: 20697320                 movea.l    $7320(a1), a0
2312: 746f                     moveq      #$6f, d2
2314: 6f20                     ble.b      $2336
2316: 6465                     bcc.b      $237d
2318: 6570                     bcs.b      $238a
231a: 2e96                     move.l     (a6), (a7)
231c: 4e560000                 link.w     a6, #$0
2320: 2f0c                     move.l     a4, -(a7)
2322: 286e0008                 movea.l    $8(a6), a4
2326: 1f2e000c                 move.b     $c(a6), -(a7)
232a: 2f0c                     move.l     a4, -(a7)
232c: 4ebaff5a                 jsr        $2288(pc)
2330: 206c0016                 movea.l    $16(a4), a0
2334: 226c000e                 movea.l    $e(a4), a1
2338: 3011                     move.w     (a1), d0
233a: e540                     asl.w      #$2, d0
233c: 11bc00120000             move.b     #$12, (a0, d0.w)
2342: 206c000e                 movea.l    $e(a4), a0
2346: 3010                     move.w     (a0), d0
2348: 5240                     addq.w     #$1, d0
234a: 206c000e                 movea.l    $e(a4), a0
234e: 3080                     move.w     d0, (a0)
2350: 285f                     movea.l    (a7)+, a4
2352: 4e5e                     unlk       a6
2354: 205f                     movea.l    (a7)+, a0
2356: 5c4f                     addq.w     #$6, a7
2358: 4ed0                     jmp        (a0)
235a: 4e560000                 link.w     a6, #$0
235e: 2f0c                     move.l     a4, -(a7)
2360: 286e0008                 movea.l    $8(a6), a4
2364: 0c6c0001ff88             cmpi.w     #$1, -$78(a4)
236a: 6c18                     bge.b      $2384
236c: 206e000c                 movea.l    $c(a6), a0
2370: 4210                     clr.b      (a0)
2372: 41ec001a                 lea.l      $1a(a4), a0
2376: 3f18                     move.w     (a0)+, -(a7)
2378: 487a0030                 pea.l      $23aa(pc)
237c: 2f10                     move.l     (a0), -(a7)
237e: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2382: 601e                     bra.b      $23a2
2384: 302cff88                 move.w     -$78(a4), d0
2388: 5340                     subq.w     #$1, d0
238a: 3940ff88                 move.w     d0, -$78(a4)
238e: 302cff88                 move.w     -$78(a4), d0
2392: c1fc0006                 muls.w     #$6, d0
2396: 206e000c                 movea.l    $c(a6), a0
239a: 43f40090                 lea.l      -$70(a4, d0.w), a1
239e: 20d9                     move.l     (a1)+, (a0)+
23a0: 30d9                     move.w     (a1)+, (a0)+
23a2: 285f                     movea.l    (a7)+, a4
23a4: 4e5e                     unlk       a6
23a6: 2e9f                     move.l     (a7)+, (a7)
23a8: 4e75                     rts        
23aa: 31457272                 move.w     d5, $7272(a0)
23ae: 6f72                     ble.b      $2422
23b0: 3a20                     move.w     -(a0), d5
23b2: 2045                     movea.l    d5, a0
23b4: 4e44                     trap       #$4
23b6: 206f7220                 movea.l    $7220(a7), a0
23ba: 454c                     .byte      0x45, 0x4c
23bc: 5345                     subq.w     #$1, d5
23be: 20737461                 movea.l    $61(a3, d7.w), a0
23c2: 7465                     moveq      #$65, d2
23c4: 6d65                     blt.b      $242b
23c6: 6e74                     bgt.b      $243c
23c8: 20776974686f7574         movea.l    $686f7574(a7, invalid.w), a0
23d0: 206d6174                 movea.l    $6174(a5), a0
23d4: 6368                     bls.b      $243e
23d6: 696e                     bvs.b      $2446
23d8: 6720                     beq.b      $23fa
23da: 4946                     .byte      0x49, 0x46
23dc: 4e56ffec                 link.w     a6, #$ffec
23e0: 48e70108                 movem.l    d7/a4, -(a7)
23e4: 286e0008                 movea.l    $8(a6), a4
23e8: 206c000e                 movea.l    $e(a4), a0
23ec: 3010                     move.w     (a0), d0
23ee: 5340                     subq.w     #$1, d0
23f0: 3d40ffec                 move.w     d0, -$14(a6)
23f4: 3e2cff5e                 move.w     -$a2(a4), d7
23f8: 6012                     bra.b      $240c
23fa: 3007                     move.w     d7, d0
23fc: d040                     add.w      d0, d0
23fe: 0640e7f8                 addi.w     #$e7f8, d0
2402: 3bacff5c0000             move.w     -$a4(a4), (a5, d0.w)
2408: 5247                     addq.w     #$1, d7
240a: 6906                     bvs.b      $2412
240c: be6effec                 cmp.w      -$14(a6), d7
2410: 6fe8                     ble.b      $23fa
2412: 206c000e                 movea.l    $e(a4), a0
2416: 3950ff5e                 move.w     (a0), -$a2(a4)
241a: 302cff5c                 move.w     -$a4(a4), d0
241e: 5240                     addq.w     #$1, d0
2420: 3940ff5c                 move.w     d0, -$a4(a4)
2424: 206c0016                 movea.l    $16(a4), a0
2428: 226c000e                 movea.l    $e(a4), a1
242c: 3011                     move.w     (a1), d0
242e: e540                     asl.w      #$2, d0
2430: 42300000                 clr.b      (a0, d0.w)
2434: 4a2cff6b                 tst.b      -$95(a4)
2438: 6722                     beq.b      $245c
243a: 206c0016                 movea.l    $16(a4), a0
243e: 302cff66                 move.w     -$9a(a4), d0
2442: e540                     asl.w      #$2, d0
2444: 11bc00020001             move.b     #$2, $1(a0, d0.w)
244a: 206c000e                 movea.l    $e(a4), a0
244e: 226c0016                 movea.l    $16(a4), a1
2452: 302cff66                 move.w     -$9a(a4), d0
2456: e540                     asl.w      #$2, d0
2458: 33900002                 move.w     (a0), $2(a1, d0.w)
245c: 422cff6b                 clr.b      -$95(a4)
2460: 422cff87                 clr.b      -$79(a4)
2464: 426cff66                 clr.w      -$9a(a4)
2468: 422cff86                 clr.b      -$7a(a4)
246c: 422cff85                 clr.b      -$7b(a4)
2470: 206c000e                 movea.l    $e(a4), a0
2474: 0c5007c6                 cmpi.w     #$7c6, (a0)
2478: 6f10                     ble.b      $248a
247a: 41ec001a                 lea.l      $1a(a4), a0
247e: 3f18                     move.w     (a0)+, -(a7)
2480: 487a0012                 pea.l      $2494(pc)
2484: 2f10                     move.l     (a0), -(a7)
2486: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
248a: 4cdf1080                 movem.l    (a7)+, d7/a4
248e: 4e5e                     unlk       a6
2490: 2e9f                     move.l     (a7)+, (a7)
2492: 4e75                     rts        
2494: 4653                     not.w      (a3)
2496: 6f72                     ble.b      $250a
2498: 7279                     moveq      #$79, d1
249a: 2c20                     move.l     -(a0), d6
249c: 20796f757220             movea.l    $6f757220.l, a0
24a2: 636f                     bls.b      $2513
24a4: 6465                     bcc.b      $250b
24a6: 20697320                 movea.l    $7320(a1), a0
24aa: 746f                     moveq      #$6f, d2
24ac: 6f20                     ble.b      $24ce
24ae: 6c6f                     bge.b      $251f
24b0: 6e67                     bgt.b      $2519
24b2: 2e20                     move.l     -(a0), d7
24b4: 2020                     move.l     -(a0), d0
24b6: 5265                     addq.w     #$1, -(a5)
24b8: 6d65                     blt.b      $251f
24ba: 6d62                     blt.b      $251e
24bc: 6572                     bcs.b      $2530
24be: 2c20                     move.l     -(a0), d6
24c0: 2062                     movea.l    -(a2), a0
24c2: 6967                     bvs.b      $252b
24c4: 6765                     beq.b      $252b
24c6: 7220                     moveq      #$20, d1
24c8: 6973                     bvs.b      $253d
24ca: 6e27                     bgt.b      $24f3
24cc: 7420                     moveq      #$20, d2
24ce: 616c                     bsr.b      $253c
24d0: 7761                     .byte      0x77, 0x61
24d2: 7973                     .byte      0x79, 0x73
24d4: 2062                     movea.l    -(a2), a0
24d6: 6574                     bcs.b      $254c
24d8: 7465                     moveq      #$65, d2
24da: 7298                     moveq      #$98, d1
24dc: 4e56fc5a                 link.w     a6, #$fc5a
24e0: 48e70708                 movem.l    d5-d7/a4, -(a7)
24e4: 286e0012                 movea.l    $12(a6), a4
24e8: 422eff5b                 clr.b      -$a5(a6)
24ec: 7000                     moveq      #$0, d0
24ee: 102eff5b                 move.b     -$a5(a6), d0
24f2: d040                     add.w      d0, d0
24f4: 42740000                 clr.w      (a4, d0.w)
24f8: 522eff5b                 addq.b     #$1, -$a5(a6)
24fc: 0c2e0006ff5b             cmpi.b     #$6, -$a5(a6)
2502: 63e8                     bls.b      $24ec
2504: 206e000a                 movea.l    $a(a6), a0
2508: 30bcffff                 move.w     #$ffff, (a0)
250c: 426eff88                 clr.w      -$78(a6)
2510: 206e000e                 movea.l    $e(a6), a0
2514: 4250                     clr.w      (a0)
2516: 426eff64                 clr.w      -$9c(a6)
251a: 426eff62                 clr.w      -$9e(a6)
251e: 4247                     clr.w      d7
2520: 41ee001a                 lea.l      $1a(a6), a0
2524: 3f18                     move.w     (a0)+, -(a7)
2526: 487a181a                 pea.l      $3d42(pc)
252a: 2f10                     move.l     (a0), -(a7)
252c: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2530: 422eff69                 clr.b      -$97(a6)
2534: 426eff5e                 clr.w      -$a2(a6)
2538: 426eff5c                 clr.w      -$a4(a6)
253c: 2f0e                     move.l     a6, -(a7)
253e: 4ebafe9c                 jsr        $23dc(pc)
2542: 426eff5c                 clr.w      -$a4(a6)
2546: 0c6e00020020             cmpi.w     #$2, $20(a6)
254c: 6c10                     bge.b      $255e
254e: 41ee001a                 lea.l      $1a(a6), a0
2552: 3f18                     move.w     (a0)+, -(a7)
2554: 487a17b4                 pea.l      $3d0a(pc)
2558: 2f10                     move.l     (a0), -(a7)
255a: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
255e: 554f                     subq.w     #$2, a7
2560: 2f0e                     move.l     a6, -(a7)
2562: 4ebaee56                 jsr        $13ba(pc)
2566: 3a1f                     move.w     (a7)+, d5
2568: 4206                     clr.b      d6
256a: 6000107e                 bra.w      $35ea
256e: 302eff62                 move.w     -$9e(a6), d0
2572: b06e0020                 cmp.w      $20(a6), d0
2576: 6d08                     blt.b      $2580
2578: 7c01                     moveq      #$1, d6
257a: 422eff84                 clr.b      -$7c(a6)
257e: 6006                     bra.b      $2586
2580: 2f0e                     move.l     a6, -(a7)
2582: 4ebaf194                 jsr        $1718(pc)
2586: 0c2e0014ff84             cmpi.b     #$14, -$7c(a6)
258c: 56c0                     sne.b      d0
258e: c02eff69                 and.b      -$97(a6), d0
2592: 6710                     beq.b      $25a4
2594: 41ee001a                 lea.l      $1a(a6), a0
2598: 3f18                     move.w     (a0)+, -(a7)
259a: 487a1744                 pea.l      $3ce0(pc)
259e: 2f10                     move.l     (a0), -(a7)
25a0: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
25a4: 206e001c                 movea.l    $1c(a6), a0
25a8: 7000                     moveq      #$0, d0
25aa: 1010                     move.b     (a0), d0
25ac: 4a40                     tst.w      d0
25ae: 66000f0e                 bne.w      $34be
25b2: 102eff84                 move.b     -$7c(a6), d0
25b6: 60000eac                 bra.w      $3464
25ba: 0c2e0001ff86             cmpi.b     #$1, -$7a(a6)
25c0: 57c0                     seq.b      d0
25c2: 0c2e0002ff86             cmpi.b     #$2, -$7a(a6)
25c8: 57c1                     seq.b      d1
25ca: 8001                     or.b       d1, d0
25cc: 4a2eff86                 tst.b      -$7a(a6)
25d0: 57c1                     seq.b      d1
25d2: 8001                     or.b       d1, d0
25d4: 0c2e000eff86             cmpi.b     #$e, -$7a(a6)
25da: 57c1                     seq.b      d1
25dc: 8001                     or.b       d1, d0
25de: 0c2e0004ff86             cmpi.b     #$4, -$7a(a6)
25e4: 57c1                     seq.b      d1
25e6: 8001                     or.b       d1, d0
25e8: 670a                     beq.b      $25f4
25ea: 2f0e                     move.l     a6, -(a7)
25ec: 4ebafdee                 jsr        $23dc(pc)
25f0: 60000ecc                 bra.w      $34be
25f4: 0c2e000aff86             cmpi.b     #$a, -$7a(a6)
25fa: 57c0                     seq.b      d0
25fc: 4a2eff85                 tst.b      -$7b(a6)
2600: 57c1                     seq.b      d1
2602: c001                     and.b      d1, d0
2604: 0c2e0001ff87             cmpi.b     #$1, -$79(a6)
260a: 57c1                     seq.b      d1
260c: c001                     and.b      d1, d0
260e: 673e                     beq.b      $264e
2610: 206e0016                 movea.l    $16(a6), a0
2614: 226e000e                 movea.l    $e(a6), a1
2618: 3011                     move.w     (a1), d0
261a: 5340                     subq.w     #$1, d0
261c: e540                     asl.w      #$2, d0
261e: 7200                     moveq      #$0, d1
2620: 12300000                 move.b     (a0, d0.w), d1
2624: 7019                     moveq      #$19, d0
2626: 9041                     sub.w      d1, d0
2628: 206e0016                 movea.l    $16(a6), a0
262c: 226e000e                 movea.l    $e(a6), a1
2630: 3211                     move.w     (a1), d1
2632: 5341                     subq.w     #$1, d1
2634: e541                     asl.w      #$2, d1
2636: 11801000                 move.b     d0, (a0, d1.w)
263a: 1f3c0001                 move.b     #$1, -(a7)
263e: 2f0e                     move.l     a6, -(a7)
2640: 4ebafcda                 jsr        $231c(pc)
2644: 2f0e                     move.l     a6, -(a7)
2646: 4ebafd94                 jsr        $23dc(pc)
264a: 60000e72                 bra.w      $34be
264e: 0c2e000bff86             cmpi.b     #$b, -$7a(a6)
2654: 57c0                     seq.b      d0
2656: 0c2e0003ff87             cmpi.b     #$3, -$79(a6)
265c: 57c1                     seq.b      d1
265e: c001                     and.b      d1, d0
2660: 6700009c                 beq.w      $26fe
2664: 486efd54                 pea.l      -$2ac(a6)
2668: 2f0e                     move.l     a6, -(a7)
266a: 4ebafcee                 jsr        $235a(pc)
266e: 584f                     addq.w     #$4, a7
2670: 41eefd54                 lea.l      -$2ac(a6), a0
2674: 43eeff8a                 lea.l      -$76(a6), a1
2678: 22d8                     move.l     (a0)+, (a1)+
267a: 32d8                     move.w     (a0)+, (a1)+
267c: 0c2e0004ff8a             cmpi.b     #$4, -$76(a6)
2682: 66000e3a                 bne.w      $34be
2686: 206e0016                 movea.l    $16(a6), a0
268a: 226e000e                 movea.l    $e(a6), a1
268e: 3011                     move.w     (a1), d0
2690: 5340                     subq.w     #$1, d0
2692: e540                     asl.w      #$2, d0
2694: 7200                     moveq      #$0, d1
2696: 12300000                 move.b     (a0, d0.w), d1
269a: 7019                     moveq      #$19, d0
269c: 9041                     sub.w      d1, d0
269e: 206e0016                 movea.l    $16(a6), a0
26a2: 226e000e                 movea.l    $e(a6), a1
26a6: 3211                     move.w     (a1), d1
26a8: 5341                     subq.w     #$1, d1
26aa: e541                     asl.w      #$2, d1
26ac: 11801000                 move.b     d0, (a0, d1.w)
26b0: 206e0016                 movea.l    $16(a6), a0
26b4: 226e000e                 movea.l    $e(a6), a1
26b8: 3011                     move.w     (a1), d0
26ba: e540                     asl.w      #$2, d0
26bc: 11bc00120000             move.b     #$12, (a0, d0.w)
26c2: 206e0016                 movea.l    $16(a6), a0
26c6: 226e000e                 movea.l    $e(a6), a1
26ca: 3011                     move.w     (a1), d0
26cc: e540                     asl.w      #$2, d0
26ce: 11bc00020001             move.b     #$2, $1(a0, d0.w)
26d4: 206e0016                 movea.l    $16(a6), a0
26d8: 226e000e                 movea.l    $e(a6), a1
26dc: 3011                     move.w     (a1), d0
26de: e540                     asl.w      #$2, d0
26e0: 31aeff8e0002             move.w     -$72(a6), $2(a0, d0.w)
26e6: 206e000e                 movea.l    $e(a6), a0
26ea: 3010                     move.w     (a0), d0
26ec: 5240                     addq.w     #$1, d0
26ee: 206e000e                 movea.l    $e(a6), a0
26f2: 3080                     move.w     d0, (a0)
26f4: 2f0e                     move.l     a6, -(a7)
26f6: 4ebafce4                 jsr        $23dc(pc)
26fa: 60000dc2                 bra.w      $34be
26fe: 41ee001a                 lea.l      $1a(a6), a0
2702: 3f18                     move.w     (a0)+, -(a7)
2704: 487a1594                 pea.l      $3c9a(pc)
2708: 2f10                     move.l     (a0), -(a7)
270a: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
270e: 302eff62                 move.w     -$9e(a6), d0
2712: 5340                     subq.w     #$1, d0
2714: 3d40ff62                 move.w     d0, -$9e(a6)
2718: 60000da4                 bra.w      $34be
271c: 4a2eff86                 tst.b      -$7a(a6)
2720: 57c0                     seq.b      d0
2722: 0c2e0008ff86             cmpi.b     #$8, -$7a(a6)
2728: 57c1                     seq.b      d1
272a: 4a2eff85                 tst.b      -$7b(a6)
272e: 57c2                     seq.b      d2
2730: c202                     and.b      d2, d1
2732: 8001                     or.b       d1, d0
2734: 675c                     beq.b      $2792
2736: 206e0016                 movea.l    $16(a6), a0
273a: 226e000e                 movea.l    $e(a6), a1
273e: 3011                     move.w     (a1), d0
2740: e540                     asl.w      #$2, d0
2742: 11bc00010000             move.b     #$1, (a0, d0.w)
2748: 206e0016                 movea.l    $16(a6), a0
274c: 226e000e                 movea.l    $e(a6), a1
2750: 3011                     move.w     (a1), d0
2752: e540                     asl.w      #$2, d0
2754: 11bc00010001             move.b     #$1, $1(a0, d0.w)
275a: 206e0016                 movea.l    $16(a6), a0
275e: 226e000e                 movea.l    $e(a6), a1
2762: 3011                     move.w     (a1), d0
2764: e540                     asl.w      #$2, d0
2766: 31aeff700002             move.w     -$90(a6), $2(a0, d0.w)
276c: 206e000e                 movea.l    $e(a6), a0
2770: 3010                     move.w     (a0), d0
2772: 5240                     addq.w     #$1, d0
2774: 206e000e                 movea.l    $e(a6), a0
2778: 3080                     move.w     d0, (a0)
277a: 1d7c0001ff85             move.b     #$1, -$7b(a6)
2780: 4a2eff86                 tst.b      -$7a(a6)
2784: 66000d38                 bne.w      $34be
2788: 1d7c0007ff86             move.b     #$7, -$7a(a6)
278e: 60000d2e                 bra.w      $34be
2792: 0c2e0008ff86             cmpi.b     #$8, -$7a(a6)
2798: 57c0                     seq.b      d0
279a: 0c2e0007ff86             cmpi.b     #$7, -$7a(a6)
27a0: 57c1                     seq.b      d1
27a2: 8001                     or.b       d1, d0
27a4: 0c2e0002ff85             cmpi.b     #$2, -$7b(a6)
27aa: 57c1                     seq.b      d1
27ac: c001                     and.b      d1, d0
27ae: 673c                     beq.b      $27ec
27b0: 206e0016                 movea.l    $16(a6), a0
27b4: 226e000e                 movea.l    $e(a6), a1
27b8: 3011                     move.w     (a1), d0
27ba: e540                     asl.w      #$2, d0
27bc: 31aeff700002             move.w     -$90(a6), $2(a0, d0.w)
27c2: 206e0016                 movea.l    $16(a6), a0
27c6: 226e000e                 movea.l    $e(a6), a1
27ca: 3011                     move.w     (a1), d0
27cc: e540                     asl.w      #$2, d0
27ce: 11bc00010001             move.b     #$1, $1(a0, d0.w)
27d4: 206e000e                 movea.l    $e(a6), a0
27d8: 3010                     move.w     (a0), d0
27da: 5240                     addq.w     #$1, d0
27dc: 206e000e                 movea.l    $e(a6), a0
27e0: 3080                     move.w     d0, (a0)
27e2: 1d7c0001ff85             move.b     #$1, -$7b(a6)
27e8: 60000cd4                 bra.w      $34be
27ec: 0c2e000cff86             cmpi.b     #$c, -$7a(a6)
27f2: 57c0                     seq.b      d0
27f4: 0c2e000dff86             cmpi.b     #$d, -$7a(a6)
27fa: 57c1                     seq.b      d1
27fc: 8001                     or.b       d1, d0
27fe: 0c2e0009ff86             cmpi.b     #$9, -$7a(a6)
2804: 57c1                     seq.b      d1
2806: 8001                     or.b       d1, d0
2808: 6768                     beq.b      $2872
280a: 206e0016                 movea.l    $16(a6), a0
280e: 226e000e                 movea.l    $e(a6), a1
2812: 3011                     move.w     (a1), d0
2814: e540                     asl.w      #$2, d0
2816: 31aeff700002             move.w     -$90(a6), $2(a0, d0.w)
281c: 206e0016                 movea.l    $16(a6), a0
2820: 226e000e                 movea.l    $e(a6), a1
2824: 3011                     move.w     (a1), d0
2826: e540                     asl.w      #$2, d0
2828: 11bc00010001             move.b     #$1, $1(a0, d0.w)
282e: 206e000e                 movea.l    $e(a6), a0
2832: 3010                     move.w     (a0), d0
2834: 5240                     addq.w     #$1, d0
2836: 206e000e                 movea.l    $e(a6), a0
283a: 3080                     move.w     d0, (a0)
283c: 0c2e0009ff86             cmpi.b     #$9, -$7a(a6)
2842: 660e                     bne.b      $2852
2844: 422eff85                 clr.b      -$7b(a6)
2848: 1d7c000bff86             move.b     #$b, -$7a(a6)
284e: 60000c6e                 bra.w      $34be
2852: 0c2e000cff86             cmpi.b     #$c, -$7a(a6)
2858: 660a                     bne.b      $2864
285a: 1d7c0001ff86             move.b     #$1, -$7a(a6)
2860: 60000c5c                 bra.w      $34be
2864: 1d7c000eff86             move.b     #$e, -$7a(a6)
286a: 422eff85                 clr.b      -$7b(a6)
286e: 60000c4e                 bra.w      $34be
2872: 0c2e000aff86             cmpi.b     #$a, -$7a(a6)
2878: 57c0                     seq.b      d0
287a: 0c2e0001ff87             cmpi.b     #$1, -$79(a6)
2880: 57c1                     seq.b      d1
2882: c001                     and.b      d1, d0
2884: 670a                     beq.b      $2890
2886: 1d7c0001ff6b             move.b     #$1, -$95(a6)
288c: 60000c30                 bra.w      $34be
2890: 0c2e0006ff86             cmpi.b     #$6, -$7a(a6)
2896: 6618                     bne.b      $28b0
2898: 1f3c0001                 move.b     #$1, -(a7)
289c: 3f2eff70                 move.w     -$90(a6), -(a7)
28a0: 2f0e                     move.l     a6, -(a7)
28a2: 4ebae9f2                 jsr        $1296(pc)
28a6: 1d7c0001ff86             move.b     #$1, -$7a(a6)
28ac: 60000c10                 bra.w      $34be
28b0: 41ee001a                 lea.l      $1a(a6), a0
28b4: 3f18                     move.w     (a0)+, -(a7)
28b6: 487a13c2                 pea.l      $3c7a(pc)
28ba: 2f10                     move.l     (a0), -(a7)
28bc: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
28c0: 60000bfc                 bra.w      $34be
28c4: 0c2e0008ff86             cmpi.b     #$8, -$7a(a6)
28ca: 57c0                     seq.b      d0
28cc: 0c2e0007ff86             cmpi.b     #$7, -$7a(a6)
28d2: 57c1                     seq.b      d1
28d4: 8001                     or.b       d1, d0
28d6: 0c2e0001ff85             cmpi.b     #$1, -$7b(a6)
28dc: 57c1                     seq.b      d1
28de: c001                     and.b      d1, d0
28e0: 671c                     beq.b      $28fe
28e2: 1d7c0002ff85             move.b     #$2, -$7b(a6)
28e8: 206e0016                 movea.l    $16(a6), a0
28ec: 226e000e                 movea.l    $e(a6), a1
28f0: 3011                     move.w     (a1), d0
28f2: e540                     asl.w      #$2, d0
28f4: 11aeff830000             move.b     -$7d(a6), (a0, d0.w)
28fa: 60000bc2                 bra.w      $34be
28fe: 41ee001a                 lea.l      $1a(a6), a0
2902: 3f18                     move.w     (a0)+, -(a7)
2904: 487a1352                 pea.l      $3c58(pc)
2908: 2f10                     move.l     (a0), -(a7)
290a: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
290e: 60000bae                 bra.w      $34be
2912: 0c2e0008ff86             cmpi.b     #$8, -$7a(a6)
2918: 57c0                     seq.b      d0
291a: 0c2e0001ff85             cmpi.b     #$1, -$7b(a6)
2920: 57c1                     seq.b      d1
2922: c001                     and.b      d1, d0
2924: 6720                     beq.b      $2946
2926: 206e0016                 movea.l    $16(a6), a0
292a: 226e000e                 movea.l    $e(a6), a1
292e: 3011                     move.w     (a1), d0
2930: e540                     asl.w      #$2, d0
2932: 11aeff830000             move.b     -$7d(a6), (a0, d0.w)
2938: 1d7c0009ff86             move.b     #$9, -$7a(a6)
293e: 422eff85                 clr.b      -$7b(a6)
2942: 60000b7a                 bra.w      $34be
2946: 41ee001a                 lea.l      $1a(a6), a0
294a: 3f18                     move.w     (a0)+, -(a7)
294c: 487a12be                 pea.l      $3c0c(pc)
2950: 2f10                     move.l     (a0), -(a7)
2952: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2956: 60000b66                 bra.w      $34be
295a: 4a2eff86                 tst.b      -$7a(a6)
295e: 6614                     bne.b      $2974
2960: 1d7c0008ff86             move.b     #$8, -$7a(a6)
2966: 1d7c0001ff87             move.b     #$1, -$79(a6)
296c: 422eff85                 clr.b      -$7b(a6)
2970: 60000b4c                 bra.w      $34be
2974: 41ee001a                 lea.l      $1a(a6), a0
2978: 3f18                     move.w     (a0)+, -(a7)
297a: 487a126c                 pea.l      $3be8(pc)
297e: 2f10                     move.l     (a0), -(a7)
2980: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2984: 60000b38                 bra.w      $34be
2988: 0c2e000bff86             cmpi.b     #$b, -$7a(a6)
298e: 57c0                     seq.b      d0
2990: 0c2e0001ff87             cmpi.b     #$1, -$79(a6)
2996: 57c1                     seq.b      d1
2998: c001                     and.b      d1, d0
299a: 670a                     beq.b      $29a6
299c: 1d7c000aff86             move.b     #$a, -$7a(a6)
29a2: 60000b1a                 bra.w      $34be
29a6: 41ee001a                 lea.l      $1a(a6), a0
29aa: 3f18                     move.w     (a0)+, -(a7)
29ac: 487a1220                 pea.l      $3bce(pc)
29b0: 2f10                     move.l     (a0), -(a7)
29b2: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
29b6: 60000b06                 bra.w      $34be
29ba: 4a2eff86                 tst.b      -$7a(a6)
29be: 666e                     bne.b      $2a2e
29c0: 486efd54                 pea.l      -$2ac(a6)
29c4: 2f0e                     move.l     a6, -(a7)
29c6: 4ebaf992                 jsr        $235a(pc)
29ca: 584f                     addq.w     #$4, a7
29cc: 41eefd54                 lea.l      -$2ac(a6), a0
29d0: 43eeff8a                 lea.l      -$76(a6), a1
29d4: 22d8                     move.l     (a0)+, (a1)+
29d6: 32d8                     move.w     (a0)+, (a1)+
29d8: 0c2e0001ff8a             cmpi.b     #$1, -$76(a6)
29de: 663a                     bne.b      $2a1a
29e0: 206e000e                 movea.l    $e(a6), a0
29e4: 3010                     move.w     (a0), d0
29e6: 5240                     addq.w     #$1, d0
29e8: 206e0016                 movea.l    $16(a6), a0
29ec: 322eff8c                 move.w     -$74(a6), d1
29f0: e541                     asl.w      #$2, d1
29f2: 31801002                 move.w     d0, $2(a0, d1.w)
29f6: 206e0016                 movea.l    $16(a6), a0
29fa: 302eff8c                 move.w     -$74(a6), d0
29fe: e540                     asl.w      #$2, d0
2a00: 11bc00020001             move.b     #$2, $1(a0, d0.w)
2a06: 1f3c0002                 move.b     #$2, -(a7)
2a0a: 2f0e                     move.l     a6, -(a7)
2a0c: 4ebaf90e                 jsr        $231c(pc)
2a10: 1d7c0001ff86             move.b     #$1, -$7a(a6)
2a16: 60000aa6                 bra.w      $34be
2a1a: 41ee001a                 lea.l      $1a(a6), a0
2a1e: 3f18                     move.w     (a0)+, -(a7)
2a20: 487a1178                 pea.l      $3b9a(pc)
2a24: 2f10                     move.l     (a0), -(a7)
2a26: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2a2a: 60000a92                 bra.w      $34be
2a2e: 41ee001a                 lea.l      $1a(a6), a0
2a32: 3f18                     move.w     (a0)+, -(a7)
2a34: 487a1144                 pea.l      $3b7a(pc)
2a38: 2f10                     move.l     (a0), -(a7)
2a3a: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2a3e: 60000a7e                 bra.w      $34be
2a42: 4a2eff86                 tst.b      -$7a(a6)
2a46: 661e                     bne.b      $2a66
2a48: 1f3c0003                 move.b     #$3, -(a7)
2a4c: 2f0e                     move.l     a6, -(a7)
2a4e: 4ebaf838                 jsr        $2288(pc)
2a52: 1d7c0008ff86             move.b     #$8, -$7a(a6)
2a58: 1d7c0002ff87             move.b     #$2, -$79(a6)
2a5e: 422eff85                 clr.b      -$7b(a6)
2a62: 60000a5a                 bra.w      $34be
2a66: 41ee001a                 lea.l      $1a(a6), a0
2a6a: 3f18                     move.w     (a0)+, -(a7)
2a6c: 487a10e6                 pea.l      $3b54(pc)
2a70: 2f10                     move.l     (a0), -(a7)
2a72: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2a76: 60000a46                 bra.w      $34be
2a7a: 0c2e000bff86             cmpi.b     #$b, -$7a(a6)
2a80: 57c0                     seq.b      d0
2a82: 0c2e0002ff87             cmpi.b     #$2, -$79(a6)
2a88: 57c1                     seq.b      d1
2a8a: c001                     and.b      d1, d0
2a8c: 6766                     beq.b      $2af4
2a8e: 1d7c0001ff86             move.b     #$1, -$7a(a6)
2a94: 206e0016                 movea.l    $16(a6), a0
2a98: 226e000e                 movea.l    $e(a6), a1
2a9c: 3011                     move.w     (a1), d0
2a9e: 5340                     subq.w     #$1, d0
2aa0: e540                     asl.w      #$2, d0
2aa2: 7200                     moveq      #$0, d1
2aa4: 12300000                 move.b     (a0, d0.w), d1
2aa8: 7019                     moveq      #$19, d0
2aaa: 9041                     sub.w      d1, d0
2aac: 206e0016                 movea.l    $16(a6), a0
2ab0: 226e000e                 movea.l    $e(a6), a1
2ab4: 3211                     move.w     (a1), d1
2ab6: 5341                     subq.w     #$1, d1
2ab8: e541                     asl.w      #$2, d1
2aba: 11801000                 move.b     d0, (a0, d1.w)
2abe: 206e000e                 movea.l    $e(a6), a0
2ac2: 302eff88                 move.w     -$78(a6), d0
2ac6: 5340                     subq.w     #$1, d0
2ac8: c1fc0006                 muls.w     #$6, d0
2acc: 3d900092                 move.w     (a0), -$6e(a6, d0.w)
2ad0: 206e0016                 movea.l    $16(a6), a0
2ad4: 226e000e                 movea.l    $e(a6), a1
2ad8: 3011                     move.w     (a1), d0
2ada: e540                     asl.w      #$2, d0
2adc: 11bc00120000             move.b     #$12, (a0, d0.w)
2ae2: 206e000e                 movea.l    $e(a6), a0
2ae6: 3010                     move.w     (a0), d0
2ae8: 5240                     addq.w     #$1, d0
2aea: 206e000e                 movea.l    $e(a6), a0
2aee: 3080                     move.w     d0, (a0)
2af0: 600009cc                 bra.w      $34be
2af4: 41ee001a                 lea.l      $1a(a6), a0
2af8: 3f18                     move.w     (a0)+, -(a7)
2afa: 487a102c                 pea.l      $3b28(pc)
2afe: 2f10                     move.l     (a0), -(a7)
2b00: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2b04: 600009b8                 bra.w      $34be
2b08: 4a2eff86                 tst.b      -$7a(a6)
2b0c: 660e                     bne.b      $2b1c
2b0e: 1f3c0004                 move.b     #$4, -(a7)
2b12: 2f0e                     move.l     a6, -(a7)
2b14: 4ebaf772                 jsr        $2288(pc)
2b18: 600009a4                 bra.w      $34be
2b1c: 41ee001a                 lea.l      $1a(a6), a0
2b20: 3f18                     move.w     (a0)+, -(a7)
2b22: 487a0fd6                 pea.l      $3afa(pc)
2b26: 2f10                     move.l     (a0), -(a7)
2b28: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2b2c: 60000990                 bra.w      $34be
2b30: 4a2eff86                 tst.b      -$7a(a6)
2b34: 6614                     bne.b      $2b4a
2b36: 1d7c0008ff86             move.b     #$8, -$7a(a6)
2b3c: 1d7c0003ff87             move.b     #$3, -$79(a6)
2b42: 422eff85                 clr.b      -$7b(a6)
2b46: 60000976                 bra.w      $34be
2b4a: 41ee001a                 lea.l      $1a(a6), a0
2b4e: 3f18                     move.w     (a0)+, -(a7)
2b50: 487a0f80                 pea.l      $3ad2(pc)
2b54: 2f10                     move.l     (a0), -(a7)
2b56: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2b5a: 60000962                 bra.w      $34be
2b5e: 4a2eff86                 tst.b      -$7a(a6)
2b62: 660000c4                 bne.w      $2c28
2b66: 486efd54                 pea.l      -$2ac(a6)
2b6a: 2f0e                     move.l     a6, -(a7)
2b6c: 4ebaf7ec                 jsr        $235a(pc)
2b70: 584f                     addq.w     #$4, a7
2b72: 41eefd54                 lea.l      -$2ac(a6), a0
2b76: 43eeff8a                 lea.l      -$76(a6), a1
2b7a: 22d8                     move.l     (a0)+, (a1)+
2b7c: 32d8                     move.w     (a0)+, (a1)+
2b7e: 0c2e0001ff8a             cmpi.b     #$1, -$76(a6)
2b84: 57c0                     seq.b      d0
2b86: 0c2e0003ff8a             cmpi.b     #$3, -$76(a6)
2b8c: 57c1                     seq.b      d1
2b8e: 8001                     or.b       d1, d0
2b90: 0c2e0002ff8a             cmpi.b     #$2, -$76(a6)
2b96: 57c1                     seq.b      d1
2b98: 8001                     or.b       d1, d0
2b9a: 6778                     beq.b      $2c14
2b9c: 0c2e0003ff8a             cmpi.b     #$3, -$76(a6)
2ba2: 6644                     bne.b      $2be8
2ba4: 206e0016                 movea.l    $16(a6), a0
2ba8: 226e000e                 movea.l    $e(a6), a1
2bac: 3011                     move.w     (a1), d0
2bae: e540                     asl.w      #$2, d0
2bb0: 11bc00120000             move.b     #$12, (a0, d0.w)
2bb6: 206e0016                 movea.l    $16(a6), a0
2bba: 226e000e                 movea.l    $e(a6), a1
2bbe: 3011                     move.w     (a1), d0
2bc0: e540                     asl.w      #$2, d0
2bc2: 11bc00020001             move.b     #$2, $1(a0, d0.w)
2bc8: 206e0016                 movea.l    $16(a6), a0
2bcc: 226e000e                 movea.l    $e(a6), a1
2bd0: 3011                     move.w     (a1), d0
2bd2: e540                     asl.w      #$2, d0
2bd4: 31aeff8e0002             move.w     -$72(a6), $2(a0, d0.w)
2bda: 206e000e                 movea.l    $e(a6), a0
2bde: 3010                     move.w     (a0), d0
2be0: 5240                     addq.w     #$1, d0
2be2: 206e000e                 movea.l    $e(a6), a0
2be6: 3080                     move.w     d0, (a0)
2be8: 206e000e                 movea.l    $e(a6), a0
2bec: 226e0016                 movea.l    $16(a6), a1
2bf0: 302eff8c                 move.w     -$74(a6), d0
2bf4: e540                     asl.w      #$2, d0
2bf6: 33900002                 move.w     (a0), $2(a1, d0.w)
2bfa: 206e0016                 movea.l    $16(a6), a0
2bfe: 302eff8c                 move.w     -$74(a6), d0
2c02: e540                     asl.w      #$2, d0
2c04: 11bc00020001             move.b     #$2, $1(a0, d0.w)
2c0a: 1d7c0001ff86             move.b     #$1, -$7a(a6)
2c10: 600008ac                 bra.w      $34be
2c14: 41ee001a                 lea.l      $1a(a6), a0
2c18: 3f18                     move.w     (a0)+, -(a7)
2c1a: 487a0e74                 pea.l      $3a90(pc)
2c1e: 2f10                     move.l     (a0), -(a7)
2c20: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2c24: 60000898                 bra.w      $34be
2c28: 41ee001a                 lea.l      $1a(a6), a0
2c2c: 3f18                     move.w     (a0)+, -(a7)
2c2e: 487a0e40                 pea.l      $3a70(pc)
2c32: 2f10                     move.l     (a0), -(a7)
2c34: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2c38: 60000884                 bra.w      $34be
2c3c: 4a2eff86                 tst.b      -$7a(a6)
2c40: 57c0                     seq.b      d0
2c42: 0c2e000aff86             cmpi.b     #$a, -$7a(a6)
2c48: 57c1                     seq.b      d1
2c4a: 8001                     or.b       d1, d0
2c4c: 671c                     beq.b      $2c6a
2c4e: 206e0016                 movea.l    $16(a6), a0
2c52: 226e000e                 movea.l    $e(a6), a1
2c56: 3011                     move.w     (a1), d0
2c58: e540                     asl.w      #$2, d0
2c5a: 11bc00120000             move.b     #$12, (a0, d0.w)
2c60: 1d7c000cff86             move.b     #$c, -$7a(a6)
2c66: 60000856                 bra.w      $34be
2c6a: 41ee001a                 lea.l      $1a(a6), a0
2c6e: 3f18                     move.w     (a0)+, -(a7)
2c70: 487a0dd6                 pea.l      $3a48(pc)
2c74: 2f10                     move.l     (a0), -(a7)
2c76: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2c7a: 60000842                 bra.w      $34be
2c7e: 4a2eff86                 tst.b      -$7a(a6)
2c82: 57c0                     seq.b      d0
2c84: 0c2e000aff86             cmpi.b     #$a, -$7a(a6)
2c8a: 57c1                     seq.b      d1
2c8c: 8001                     or.b       d1, d0
2c8e: 671c                     beq.b      $2cac
2c90: 206e0016                 movea.l    $16(a6), a0
2c94: 226e000e                 movea.l    $e(a6), a1
2c98: 3011                     move.w     (a1), d0
2c9a: e540                     asl.w      #$2, d0
2c9c: 11bc00110000             move.b     #$11, (a0, d0.w)
2ca2: 1d7c000cff86             move.b     #$c, -$7a(a6)
2ca8: 60000814                 bra.w      $34be
2cac: 41ee001a                 lea.l      $1a(a6), a0
2cb0: 3f18                     move.w     (a0)+, -(a7)
2cb2: 487a0d6c                 pea.l      $3a20(pc)
2cb6: 2f10                     move.l     (a0), -(a7)
2cb8: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2cbc: 60000800                 bra.w      $34be
2cc0: 4a2eff86                 tst.b      -$7a(a6)
2cc4: 57c0                     seq.b      d0
2cc6: 0c2e000aff86             cmpi.b     #$a, -$7a(a6)
2ccc: 57c1                     seq.b      d1
2cce: 8001                     or.b       d1, d0
2cd0: 674a                     beq.b      $2d1c
2cd2: 206e0016                 movea.l    $16(a6), a0
2cd6: 226e000e                 movea.l    $e(a6), a1
2cda: 3011                     move.w     (a1), d0
2cdc: e540                     asl.w      #$2, d0
2cde: 11bc00130000             move.b     #$13, (a0, d0.w)
2ce4: 206e0016                 movea.l    $16(a6), a0
2ce8: 226e000e                 movea.l    $e(a6), a1
2cec: 3011                     move.w     (a1), d0
2cee: e540                     asl.w      #$2, d0
2cf0: 42300001                 clr.b      $1(a0, d0.w)
2cf4: 206e0016                 movea.l    $16(a6), a0
2cf8: 226e000e                 movea.l    $e(a6), a1
2cfc: 3011                     move.w     (a1), d0
2cfe: e540                     asl.w      #$2, d0
2d00: 42700002                 clr.w      $2(a0, d0.w)
2d04: 206e000e                 movea.l    $e(a6), a0
2d08: 3010                     move.w     (a0), d0
2d0a: 5240                     addq.w     #$1, d0
2d0c: 206e000e                 movea.l    $e(a6), a0
2d10: 3080                     move.w     d0, (a0)
2d12: 1d7c0001ff86             move.b     #$1, -$7a(a6)
2d18: 600007a4                 bra.w      $34be
2d1c: 41ee001a                 lea.l      $1a(a6), a0
2d20: 3f18                     move.w     (a0)+, -(a7)
2d22: 487a0cd2                 pea.l      $39f6(pc)
2d26: 2f10                     move.l     (a0), -(a7)
2d28: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2d2c: 60000790                 bra.w      $34be
2d30: 4a2eff86                 tst.b      -$7a(a6)
2d34: 57c0                     seq.b      d0
2d36: 0c2e000aff86             cmpi.b     #$a, -$7a(a6)
2d3c: 57c1                     seq.b      d1
2d3e: 8001                     or.b       d1, d0
2d40: 674a                     beq.b      $2d8c
2d42: 206e0016                 movea.l    $16(a6), a0
2d46: 226e000e                 movea.l    $e(a6), a1
2d4a: 3011                     move.w     (a1), d0
2d4c: e540                     asl.w      #$2, d0
2d4e: 11bc00140000             move.b     #$14, (a0, d0.w)
2d54: 206e0016                 movea.l    $16(a6), a0
2d58: 226e000e                 movea.l    $e(a6), a1
2d5c: 3011                     move.w     (a1), d0
2d5e: e540                     asl.w      #$2, d0
2d60: 42300001                 clr.b      $1(a0, d0.w)
2d64: 206e0016                 movea.l    $16(a6), a0
2d68: 226e000e                 movea.l    $e(a6), a1
2d6c: 3011                     move.w     (a1), d0
2d6e: e540                     asl.w      #$2, d0
2d70: 42700002                 clr.w      $2(a0, d0.w)
2d74: 206e000e                 movea.l    $e(a6), a0
2d78: 3010                     move.w     (a0), d0
2d7a: 5240                     addq.w     #$1, d0
2d7c: 206e000e                 movea.l    $e(a6), a0
2d80: 3080                     move.w     d0, (a0)
2d82: 1d7c0001ff86             move.b     #$1, -$7a(a6)
2d88: 60000734                 bra.w      $34be
2d8c: 41ee001a                 lea.l      $1a(a6), a0
2d90: 3f18                     move.w     (a0)+, -(a7)
2d92: 487a0c38                 pea.l      $39cc(pc)
2d96: 2f10                     move.l     (a0), -(a7)
2d98: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2d9c: 60000720                 bra.w      $34be
2da0: 0c2e0007ff86             cmpi.b     #$7, -$7a(a6)
2da6: 57c0                     seq.b      d0
2da8: 0c2e0001ff85             cmpi.b     #$1, -$7b(a6)
2dae: 57c1                     seq.b      d1
2db0: c001                     and.b      d1, d0
2db2: 0c2e000eff86             cmpi.b     #$e, -$7a(a6)
2db8: 57c1                     seq.b      d1
2dba: 8001                     or.b       d1, d0
2dbc: 671c                     beq.b      $2dda
2dbe: 206e0016                 movea.l    $16(a6), a0
2dc2: 226e000e                 movea.l    $e(a6), a1
2dc6: 3011                     move.w     (a1), d0
2dc8: e540                     asl.w      #$2, d0
2dca: 11bc00100000             move.b     #$10, (a0, d0.w)
2dd0: 1d7c000dff86             move.b     #$d, -$7a(a6)
2dd6: 600006e6                 bra.w      $34be
2dda: 41ee001a                 lea.l      $1a(a6), a0
2dde: 3f18                     move.w     (a0)+, -(a7)
2de0: 487a0b9c                 pea.l      $397e(pc)
2de4: 2f10                     move.l     (a0), -(a7)
2de6: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2dea: 600006d2                 bra.w      $34be
2dee: 600a                     bra.b      $2dfa
2df0: 302eff62                 move.w     -$9e(a6), d0
2df4: 5240                     addq.w     #$1, d0
2df6: 3d40ff62                 move.w     d0, -$9e(a6)
2dfa: 206e0022                 movea.l    $22(a6), a0
2dfe: 2050                     movea.l    (a0), a0
2e00: 302eff62                 move.w     -$9e(a6), d0
2e04: 7200                     moveq      #$0, d1
2e06: 12300000                 move.b     (a0, d0.w), d1
2e0a: 0c41000d                 cmpi.w     #$d, d1
2e0e: 56c0                     sne.b      d0
2e10: 322eff62                 move.w     -$9e(a6), d1
2e14: b26e0020                 cmp.w      $20(a6), d1
2e18: 5dc1                     slt.b      d1
2e1a: c001                     and.b      d1, d0
2e1c: 66d2                     bne.b      $2df0
2e1e: 6000069e                 bra.w      $34be
2e22: 4a2eff86                 tst.b      -$7a(a6)
2e26: 57c0                     seq.b      d0
2e28: 0c2e0008ff86             cmpi.b     #$8, -$7a(a6)
2e2e: 57c1                     seq.b      d1
2e30: 4a2eff85                 tst.b      -$7b(a6)
2e34: 57c2                     seq.b      d2
2e36: c202                     and.b      d2, d1
2e38: 8001                     or.b       d1, d0
2e3a: 675c                     beq.b      $2e98
2e3c: 206e0016                 movea.l    $16(a6), a0
2e40: 226e000e                 movea.l    $e(a6), a1
2e44: 3011                     move.w     (a1), d0
2e46: e540                     asl.w      #$2, d0
2e48: 11bc00010000             move.b     #$1, (a0, d0.w)
2e4e: 206e0016                 movea.l    $16(a6), a0
2e52: 226e000e                 movea.l    $e(a6), a1
2e56: 3011                     move.w     (a1), d0
2e58: e540                     asl.w      #$2, d0
2e5a: 31aeff700002             move.w     -$90(a6), $2(a0, d0.w)
2e60: 206e0016                 movea.l    $16(a6), a0
2e64: 226e000e                 movea.l    $e(a6), a1
2e68: 3011                     move.w     (a1), d0
2e6a: e540                     asl.w      #$2, d0
2e6c: 11bc00020001             move.b     #$2, $1(a0, d0.w)
2e72: 206e000e                 movea.l    $e(a6), a0
2e76: 3010                     move.w     (a0), d0
2e78: 5240                     addq.w     #$1, d0
2e7a: 206e000e                 movea.l    $e(a6), a0
2e7e: 3080                     move.w     d0, (a0)
2e80: 1d7c0001ff85             move.b     #$1, -$7b(a6)
2e86: 4a2eff86                 tst.b      -$7a(a6)
2e8a: 66000632                 bne.w      $34be
2e8e: 1d7c0007ff86             move.b     #$7, -$7a(a6)
2e94: 60000628                 bra.w      $34be
2e98: 0c2e0009ff86             cmpi.b     #$9, -$7a(a6)
2e9e: 57c0                     seq.b      d0
2ea0: 0c2e0008ff86             cmpi.b     #$8, -$7a(a6)
2ea6: 57c1                     seq.b      d1
2ea8: 0c2e0007ff86             cmpi.b     #$7, -$7a(a6)
2eae: 57c2                     seq.b      d2
2eb0: 8202                     or.b       d2, d1
2eb2: 0c2e0002ff85             cmpi.b     #$2, -$7b(a6)
2eb8: 57c2                     seq.b      d2
2eba: c202                     and.b      d2, d1
2ebc: 8001                     or.b       d1, d0
2ebe: 6752                     beq.b      $2f12
2ec0: 206e0016                 movea.l    $16(a6), a0
2ec4: 226e000e                 movea.l    $e(a6), a1
2ec8: 3011                     move.w     (a1), d0
2eca: e540                     asl.w      #$2, d0
2ecc: 31aeff700002             move.w     -$90(a6), $2(a0, d0.w)
2ed2: 206e0016                 movea.l    $16(a6), a0
2ed6: 226e000e                 movea.l    $e(a6), a1
2eda: 3011                     move.w     (a1), d0
2edc: e540                     asl.w      #$2, d0
2ede: 11bc00020001             move.b     #$2, $1(a0, d0.w)
2ee4: 206e000e                 movea.l    $e(a6), a0
2ee8: 3010                     move.w     (a0), d0
2eea: 5240                     addq.w     #$1, d0
2eec: 206e000e                 movea.l    $e(a6), a0
2ef0: 3080                     move.w     d0, (a0)
2ef2: 0c2e0009ff86             cmpi.b     #$9, -$7a(a6)
2ef8: 660e                     bne.b      $2f08
2efa: 422eff85                 clr.b      -$7b(a6)
2efe: 1d7c000bff86             move.b     #$b, -$7a(a6)
2f04: 600005b8                 bra.w      $34be
2f08: 1d7c0001ff85             move.b     #$1, -$7b(a6)
2f0e: 600005ae                 bra.w      $34be
2f12: 0c2e000aff86             cmpi.b     #$a, -$7a(a6)
2f18: 57c0                     seq.b      d0
2f1a: 0c2e0001ff87             cmpi.b     #$1, -$79(a6)
2f20: 57c1                     seq.b      d1
2f22: c001                     and.b      d1, d0
2f24: 670a                     beq.b      $2f30
2f26: 1d7c0001ff6b             move.b     #$1, -$95(a6)
2f2c: 60000590                 bra.w      $34be
2f30: 0c2e0006ff86             cmpi.b     #$6, -$7a(a6)
2f36: 6618                     bne.b      $2f50
2f38: 1f3c0002                 move.b     #$2, -(a7)
2f3c: 3f2eff70                 move.w     -$90(a6), -(a7)
2f40: 2f0e                     move.l     a6, -(a7)
2f42: 4ebae352                 jsr        $1296(pc)
2f46: 1d7c0001ff86             move.b     #$1, -$7a(a6)
2f4c: 60000570                 bra.w      $34be
2f50: 0c2e000fff86             cmpi.b     #$f, -$7a(a6)
2f56: 66000082                 bne.w      $2fda
2f5a: 7000                     moveq      #$0, d0
2f5c: 102eff5b                 move.b     -$a5(a6), d0
2f60: d040                     add.w      d0, d0
2f62: 39aeff700000             move.w     -$90(a6), (a4, d0.w)
2f68: 1d7c0001ff86             move.b     #$1, -$7a(a6)
2f6e: 7000                     moveq      #$0, d0
2f70: 102eff5b                 move.b     -$a5(a6), d0
2f74: d040                     add.w      d0, d0
2f76: 322eff70                 move.w     -$90(a6), d1
2f7a: 0640feec                 addi.w     #$feec, d0
2f7e: b2750000                 cmp.w      (a5, d0.w), d1
2f82: 5ec0                     sgt.b      d0
2f84: 4a6eff70                 tst.w      -$90(a6)
2f88: 5dc1                     slt.b      d1
2f8a: 8001                     or.b       d1, d0
2f8c: 67000530                 beq.w      $34be
2f90: 7000                     moveq      #$0, d0
2f92: 102eff5b                 move.b     -$a5(a6), d0
2f96: d040                     add.w      d0, d0
2f98: 0640feec                 addi.w     #$feec, d0
2f9c: 30350000                 move.w     (a5, d0.w), d0
2fa0: 48c0                     ext.l      d0
2fa2: 2f00                     move.l     d0, -(a7)
2fa4: 486efe5a                 pea.l      -$1a6(a6)
2fa8: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
2fac: 486efc5a                 pea.l      -$3a6(a6)
2fb0: 487a0982                 pea.l      $3934(pc)
2fb4: 486efe5a                 pea.l      -$1a6(a6)
2fb8: 487a0978                 pea.l      $3932(pc)
2fbc: 3f3c0003                 move.w     #$3, -(a7)
2fc0: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
2fc4: 584f                     addq.w     #$4, a7
2fc6: 41ee001a                 lea.l      $1a(a6), a0
2fca: 3f18                     move.w     (a0)+, -(a7)
2fcc: 486efc5a                 pea.l      -$3a6(a6)
2fd0: 2f10                     move.l     (a0), -(a7)
2fd2: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2fd6: 600004e6                 bra.w      $34be
2fda: 0c2e0004ff86             cmpi.b     #$4, -$7a(a6)
2fe0: 6626                     bne.b      $3008
2fe2: de6eff70                 add.w      -$90(a6), d7
2fe6: 5347                     subq.w     #$1, d7
2fe8: 0c4700c8                 cmpi.w     #$c8, d7
2fec: 6f10                     ble.b      $2ffe
2fee: 41ee001a                 lea.l      $1a(a6), a0
2ff2: 3f18                     move.w     (a0)+, -(a7)
2ff4: 487a0918                 pea.l      $390e(pc)
2ff8: 2f10                     move.l     (a0), -(a7)
2ffa: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2ffe: 1d7c0001ff86             move.b     #$1, -$7a(a6)
3004: 600004b8                 bra.w      $34be
3008: 41ee001a                 lea.l      $1a(a6), a0
300c: 3f18                     move.w     (a0)+, -(a7)
300e: 487a08d2                 pea.l      $38e2(pc)
3012: 2f10                     move.l     (a0), -(a7)
3014: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
3018: 600004a4                 bra.w      $34be
301c: 4a2eff86                 tst.b      -$7a(a6)
3020: 660a                     bne.b      $302c
3022: 1d7c0005ff86             move.b     #$5, -$7a(a6)
3028: 60000494                 bra.w      $34be
302c: 41ee001a                 lea.l      $1a(a6), a0
3030: 3f18                     move.w     (a0)+, -(a7)
3032: 487a0882                 pea.l      $38b6(pc)
3036: 2f10                     move.l     (a0), -(a7)
3038: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
303c: 60000480                 bra.w      $34be
3040: 4a2eff86                 tst.b      -$7a(a6)
3044: 57c0                     seq.b      d0
3046: 2f00                     move.l     d0, -(a7)
3048: 554f                     subq.w     #$2, a7
304a: 2f0e                     move.l     a6, -(a7)
304c: 4ebae3d8                 jsr        $1426(pc)
3050: 121f                     move.b     (a7)+, d1
3052: 201f                     move.l     (a7)+, d0
3054: c001                     and.b      d1, d0
3056: 6714                     beq.b      $306c
3058: 554f                     subq.w     #$2, a7
305a: 1f3c0001                 move.b     #$1, -(a7)
305e: 2f0e                     move.l     a6, -(a7)
3060: 4ebae086                 jsr        $10e8(pc)
3064: 3d5fff70                 move.w     (a7)+, -$90(a6)
3068: 60000454                 bra.w      $34be
306c: 4a2eff86                 tst.b      -$7a(a6)
3070: 57c0                     seq.b      d0
3072: 0c2e0008ff86             cmpi.b     #$8, -$7a(a6)
3078: 57c1                     seq.b      d1
307a: 4a2eff85                 tst.b      -$7b(a6)
307e: 57c2                     seq.b      d2
3080: c202                     and.b      d2, d1
3082: 8001                     or.b       d1, d0
3084: 67000078                 beq.w      $30fe
3088: 206e0016                 movea.l    $16(a6), a0
308c: 226e000e                 movea.l    $e(a6), a1
3090: 3011                     move.w     (a1), d0
3092: e540                     asl.w      #$2, d0
3094: 11bc00010000             move.b     #$1, (a0, d0.w)
309a: 554f                     subq.w     #$2, a7
309c: 4227                     clr.b      -(a7)
309e: 2f0e                     move.l     a6, -(a7)
30a0: 4ebae046                 jsr        $10e8(pc)
30a4: 3d5fff70                 move.w     (a7)+, -$90(a6)
30a8: 4a2eff69                 tst.b      -$97(a6)
30ac: 6708                     beq.b      $30b6
30ae: 2f0e                     move.l     a6, -(a7)
30b0: 4ebae2c8                 jsr        $137a(pc)
30b4: 6024                     bra.b      $30da
30b6: 206e0016                 movea.l    $16(a6), a0
30ba: 226e000e                 movea.l    $e(a6), a1
30be: 3011                     move.w     (a1), d0
30c0: e540                     asl.w      #$2, d0
30c2: 11bc00030001             move.b     #$3, $1(a0, d0.w)
30c8: 206e0016                 movea.l    $16(a6), a0
30cc: 226e000e                 movea.l    $e(a6), a1
30d0: 3011                     move.w     (a1), d0
30d2: e540                     asl.w      #$2, d0
30d4: 31aeff700002             move.w     -$90(a6), $2(a0, d0.w)
30da: 206e000e                 movea.l    $e(a6), a0
30de: 3010                     move.w     (a0), d0
30e0: 5240                     addq.w     #$1, d0
30e2: 206e000e                 movea.l    $e(a6), a0
30e6: 3080                     move.w     d0, (a0)
30e8: 4a2eff86                 tst.b      -$7a(a6)
30ec: 6606                     bne.b      $30f4
30ee: 1d7c0007ff86             move.b     #$7, -$7a(a6)
30f4: 1d7c0001ff85             move.b     #$1, -$7b(a6)
30fa: 600003c2                 bra.w      $34be
30fe: 0c2e0009ff86             cmpi.b     #$9, -$7a(a6)
3104: 57c0                     seq.b      d0
3106: 0c2e0008ff86             cmpi.b     #$8, -$7a(a6)
310c: 57c1                     seq.b      d1
310e: 0c2e0007ff86             cmpi.b     #$7, -$7a(a6)
3114: 57c2                     seq.b      d2
3116: 8202                     or.b       d2, d1
3118: 0c2e0002ff85             cmpi.b     #$2, -$7b(a6)
311e: 57c2                     seq.b      d2
3120: c202                     and.b      d2, d1
3122: 8001                     or.b       d1, d0
3124: 676e                     beq.b      $3194
3126: 554f                     subq.w     #$2, a7
3128: 4227                     clr.b      -(a7)
312a: 2f0e                     move.l     a6, -(a7)
312c: 4ebadfba                 jsr        $10e8(pc)
3130: 3d5fff70                 move.w     (a7)+, -$90(a6)
3134: 4a2eff69                 tst.b      -$97(a6)
3138: 6708                     beq.b      $3142
313a: 2f0e                     move.l     a6, -(a7)
313c: 4ebae23c                 jsr        $137a(pc)
3140: 6024                     bra.b      $3166
3142: 206e0016                 movea.l    $16(a6), a0
3146: 226e000e                 movea.l    $e(a6), a1
314a: 3011                     move.w     (a1), d0
314c: e540                     asl.w      #$2, d0
314e: 11bc00030001             move.b     #$3, $1(a0, d0.w)
3154: 206e0016                 movea.l    $16(a6), a0
3158: 226e000e                 movea.l    $e(a6), a1
315c: 3011                     move.w     (a1), d0
315e: e540                     asl.w      #$2, d0
3160: 31aeff700002             move.w     -$90(a6), $2(a0, d0.w)
3166: 206e000e                 movea.l    $e(a6), a0
316a: 3010                     move.w     (a0), d0
316c: 5240                     addq.w     #$1, d0
316e: 206e000e                 movea.l    $e(a6), a0
3172: 3080                     move.w     d0, (a0)
3174: 0c2e0009ff86             cmpi.b     #$9, -$7a(a6)
317a: 660e                     bne.b      $318a
317c: 422eff85                 clr.b      -$7b(a6)
3180: 1d7c000bff86             move.b     #$b, -$7a(a6)
3186: 60000336                 bra.w      $34be
318a: 1d7c0001ff85             move.b     #$1, -$7b(a6)
3190: 6000032c                 bra.w      $34be
3194: 0c2e000dff86             cmpi.b     #$d, -$7a(a6)
319a: 665c                     bne.b      $31f8
319c: 554f                     subq.w     #$2, a7
319e: 4227                     clr.b      -(a7)
31a0: 2f0e                     move.l     a6, -(a7)
31a2: 4ebadf44                 jsr        $10e8(pc)
31a6: 3d5fff70                 move.w     (a7)+, -$90(a6)
31aa: 4a2eff69                 tst.b      -$97(a6)
31ae: 6708                     beq.b      $31b8
31b0: 2f0e                     move.l     a6, -(a7)
31b2: 4ebae1c6                 jsr        $137a(pc)
31b6: 6024                     bra.b      $31dc
31b8: 206e0016                 movea.l    $16(a6), a0
31bc: 226e000e                 movea.l    $e(a6), a1
31c0: 3011                     move.w     (a1), d0
31c2: e540                     asl.w      #$2, d0
31c4: 11bc00030001             move.b     #$3, $1(a0, d0.w)
31ca: 206e0016                 movea.l    $16(a6), a0
31ce: 226e000e                 movea.l    $e(a6), a1
31d2: 3011                     move.w     (a1), d0
31d4: e540                     asl.w      #$2, d0
31d6: 31aeff700002             move.w     -$90(a6), $2(a0, d0.w)
31dc: 206e000e                 movea.l    $e(a6), a0
31e0: 3010                     move.w     (a0), d0
31e2: 5240                     addq.w     #$1, d0
31e4: 206e000e                 movea.l    $e(a6), a0
31e8: 3080                     move.w     d0, (a0)
31ea: 1d7c000eff86             move.b     #$e, -$7a(a6)
31f0: 422eff85                 clr.b      -$7b(a6)
31f4: 600002c8                 bra.w      $34be
31f8: 0c2e000cff86             cmpi.b     #$c, -$7a(a6)
31fe: 664a                     bne.b      $324a
3200: 554f                     subq.w     #$2, a7
3202: 4227                     clr.b      -(a7)
3204: 2f0e                     move.l     a6, -(a7)
3206: 4ebadee0                 jsr        $10e8(pc)
320a: 3d5fff70                 move.w     (a7)+, -$90(a6)
320e: 206e0016                 movea.l    $16(a6), a0
3212: 226e000e                 movea.l    $e(a6), a1
3216: 3011                     move.w     (a1), d0
3218: e540                     asl.w      #$2, d0
321a: 11bc00030001             move.b     #$3, $1(a0, d0.w)
3220: 206e0016                 movea.l    $16(a6), a0
3224: 226e000e                 movea.l    $e(a6), a1
3228: 3011                     move.w     (a1), d0
322a: e540                     asl.w      #$2, d0
322c: 31aeff700002             move.w     -$90(a6), $2(a0, d0.w)
3232: 206e000e                 movea.l    $e(a6), a0
3236: 3010                     move.w     (a0), d0
3238: 5240                     addq.w     #$1, d0
323a: 206e000e                 movea.l    $e(a6), a0
323e: 3080                     move.w     d0, (a0)
3240: 1d7c0002ff86             move.b     #$2, -$7a(a6)
3246: 60000276                 bra.w      $34be
324a: 0c2e000aff86             cmpi.b     #$a, -$7a(a6)
3250: 57c0                     seq.b      d0
3252: 0c2e0001ff87             cmpi.b     #$1, -$79(a6)
3258: 57c1                     seq.b      d1
325a: c001                     and.b      d1, d0
325c: 670a                     beq.b      $3268
325e: 1d7c0001ff6b             move.b     #$1, -$95(a6)
3264: 60000258                 bra.w      $34be
3268: 0c2e0005ff86             cmpi.b     #$5, -$7a(a6)
326e: 6618                     bne.b      $3288
3270: 554f                     subq.w     #$2, a7
3272: 4227                     clr.b      -(a7)
3274: 2f0e                     move.l     a6, -(a7)
3276: 4ebade70                 jsr        $10e8(pc)
327a: 3d5fff70                 move.w     (a7)+, -$90(a6)
327e: 1d7c0006ff86             move.b     #$6, -$7a(a6)
3284: 60000238                 bra.w      $34be
3288: 0c2e0003ff86             cmpi.b     #$3, -$7a(a6)
328e: 6626                     bne.b      $32b6
3290: 554f                     subq.w     #$2, a7
3292: 4227                     clr.b      -(a7)
3294: 2f0e                     move.l     a6, -(a7)
3296: 4ebade50                 jsr        $10e8(pc)
329a: 3d5fff70                 move.w     (a7)+, -$90(a6)
329e: 1f3c0004                 move.b     #$4, -(a7)
32a2: 3f07                     move.w     d7, -(a7)
32a4: 2f0e                     move.l     a6, -(a7)
32a6: 4ebadfee                 jsr        $1296(pc)
32aa: 5247                     addq.w     #$1, d7
32ac: 1d7c0004ff86             move.b     #$4, -$7a(a6)
32b2: 6000020a                 bra.w      $34be
32b6: 41ee001a                 lea.l      $1a(a6), a0
32ba: 3f18                     move.w     (a0)+, -(a7)
32bc: 487a05c6                 pea.l      $3884(pc)
32c0: 2f10                     move.l     (a0), -(a7)
32c2: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
32c6: 600001f6                 bra.w      $34be
32ca: 4a2eff86                 tst.b      -$7a(a6)
32ce: 660a                     bne.b      $32da
32d0: 1d7c000fff86             move.b     #$f, -$7a(a6)
32d6: 600001e6                 bra.w      $34be
32da: 41ee001a                 lea.l      $1a(a6), a0
32de: 3f18                     move.w     (a0)+, -(a7)
32e0: 487a0558                 pea.l      $383a(pc)
32e4: 2f10                     move.l     (a0), -(a7)
32e6: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
32ea: 600001d2                 bra.w      $34be
32ee: 4a2eff86                 tst.b      -$7a(a6)
32f2: 660a                     bne.b      $32fe
32f4: 1d7c0003ff86             move.b     #$3, -$7a(a6)
32fa: 600001c2                 bra.w      $34be
32fe: 41ee001a                 lea.l      $1a(a6), a0
3302: 3f18                     move.w     (a0)+, -(a7)
3304: 487a0508                 pea.l      $380e(pc)
3308: 2f10                     move.l     (a0), -(a7)
330a: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
330e: 600001ae                 bra.w      $34be
3312: 1d7c0001ff69             move.b     #$1, -$97(a6)
3318: 600001a4                 bra.w      $34be
331c: 0c2e0002ff86             cmpi.b     #$2, -$7a(a6)
3322: 57c0                     seq.b      d0
3324: 0c2e000eff86             cmpi.b     #$e, -$7a(a6)
332a: 57c1                     seq.b      d1
332c: 8001                     or.b       d1, d0
332e: 0c2e0008ff86             cmpi.b     #$8, -$7a(a6)
3334: 57c1                     seq.b      d1
3336: 0c2e0007ff86             cmpi.b     #$7, -$7a(a6)
333c: 57c2                     seq.b      d2
333e: 8202                     or.b       d2, d1
3340: 0c2e0001ff85             cmpi.b     #$1, -$7b(a6)
3346: 57c2                     seq.b      d2
3348: c202                     and.b      d2, d1
334a: 8001                     or.b       d1, d0
334c: 6742                     beq.b      $3390
334e: 206e0016                 movea.l    $16(a6), a0
3352: 226e000e                 movea.l    $e(a6), a1
3356: 3011                     move.w     (a1), d0
3358: 5340                     subq.w     #$1, d0
335a: e540                     asl.w      #$2, d0
335c: 0c3000030001             cmpi.b     #$3, $1(a0, d0.w)
3362: 6618                     bne.b      $337c
3364: 206e0016                 movea.l    $16(a6), a0
3368: 226e000e                 movea.l    $e(a6), a1
336c: 3011                     move.w     (a1), d0
336e: 5340                     subq.w     #$1, d0
3370: e540                     asl.w      #$2, d0
3372: 11bc00050001             move.b     #$5, $1(a0, d0.w)
3378: 60000144                 bra.w      $34be
337c: 41ee001a                 lea.l      $1a(a6), a0
3380: 3f18                     move.w     (a0)+, -(a7)
3382: 487a0464                 pea.l      $37e8(pc)
3386: 2f10                     move.l     (a0), -(a7)
3388: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
338c: 60000130                 bra.w      $34be
3390: 41ee001a                 lea.l      $1a(a6), a0
3394: 3f18                     move.w     (a0)+, -(a7)
3396: 487a042a                 pea.l      $37c2(pc)
339a: 2f10                     move.l     (a0), -(a7)
339c: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
33a0: 6000011c                 bra.w      $34be
33a4: 4a2eff86                 tst.b      -$7a(a6)
33a8: 57c0                     seq.b      d0
33aa: 0c2e000aff86             cmpi.b     #$a, -$7a(a6)
33b0: 57c1                     seq.b      d1
33b2: 8001                     or.b       d1, d0
33b4: 67000108                 beq.w      $34be
33b8: 4a2e0008                 tst.b      $8(a6)
33bc: 6740                     beq.b      $33fe
33be: 206e0016                 movea.l    $16(a6), a0
33c2: 226e000e                 movea.l    $e(a6), a1
33c6: 3011                     move.w     (a1), d0
33c8: e540                     asl.w      #$2, d0
33ca: 11bc00150000             move.b     #$15, (a0, d0.w)
33d0: 206e0016                 movea.l    $16(a6), a0
33d4: 226e000e                 movea.l    $e(a6), a1
33d8: 3011                     move.w     (a1), d0
33da: e540                     asl.w      #$2, d0
33dc: 42300001                 clr.b      $1(a0, d0.w)
33e0: 206e0016                 movea.l    $16(a6), a0
33e4: 226e000e                 movea.l    $e(a6), a1
33e8: 3011                     move.w     (a1), d0
33ea: e540                     asl.w      #$2, d0
33ec: 42700002                 clr.w      $2(a0, d0.w)
33f0: 206e000e                 movea.l    $e(a6), a0
33f4: 3010                     move.w     (a0), d0
33f6: 5240                     addq.w     #$1, d0
33f8: 206e000e                 movea.l    $e(a6), a0
33fc: 3080                     move.w     d0, (a0)
33fe: 1d7c0001ff86             move.b     #$1, -$7a(a6)
3404: 600000b8                 bra.w      $34be
3408: 4a2eff86                 tst.b      -$7a(a6)
340c: 57c0                     seq.b      d0
340e: 0c2e000aff86             cmpi.b     #$a, -$7a(a6)
3414: 57c1                     seq.b      d1
3416: 8001                     or.b       d1, d0
3418: 670000a4                 beq.w      $34be
341c: 206e0016                 movea.l    $16(a6), a0
3420: 226e000e                 movea.l    $e(a6), a1
3424: 3011                     move.w     (a1), d0
3426: e540                     asl.w      #$2, d0
3428: 11bc00160000             move.b     #$16, (a0, d0.w)
342e: 206e0016                 movea.l    $16(a6), a0
3432: 226e000e                 movea.l    $e(a6), a1
3436: 3011                     move.w     (a1), d0
3438: e540                     asl.w      #$2, d0
343a: 42300001                 clr.b      $1(a0, d0.w)
343e: 206e0016                 movea.l    $16(a6), a0
3442: 226e000e                 movea.l    $e(a6), a1
3446: 3011                     move.w     (a1), d0
3448: e540                     asl.w      #$2, d0
344a: 42700002                 clr.w      $2(a0, d0.w)
344e: 206e000e                 movea.l    $e(a6), a0
3452: 3010                     move.w     (a0), d0
3454: 5240                     addq.w     #$1, d0
3456: 206e000e                 movea.l    $e(a6), a0
345a: 3080                     move.w     d0, (a0)
345c: 1d7c0001ff86             move.b     #$1, -$7a(a6)
3462: 605a                     bra.b      $34be
3464: 024000ff                 andi.w     #$ff, d0
3468: 0c40001b                 cmpi.w     #$1b, d0
346c: 6440                     bcc.b      $34ae
346e: d040                     add.w      d0, d0
3470: 303b0006                 move.w     $3478(pc, d0.w), d0
3474: 4efb0002                 jmp        $3478(pc, d0.w)
3478: f142                     dc.w       $f142
347a: f2a4                     dc.w       $f2a4
347c: f44c                     dc.w       $f44c
347e: f49a                     dc.w       $f49a
3480: f4e2                     dc.w       $f4e2
3482: f510                     dc.w       $f510
3484: f542                     dc.w       $f542
3486: f5ca                     dc.w       $f5ca
3488: f602f690f6b8             dc.w       $f602
348e: f6e6                     dc.w       $f6e6
3490: f7c4                     dc.w       $f7c4
3492: f806                     dc.w       $f806
3494: f848                     dc.w       $f848
3496: f8b8                     dc.w       $f8b8
3498: f928                     dc.w       $f928
349a: f976                     dc.w       $f976
349c: f9aa                     dc.w       $f9aa
349e: fba4                     dc.w       $fba4
34a0: fbc8                     dc.w       $fbc8
34a2: fe52                     dc.w       $fe52
34a4: fe76                     dc.w       $fe76
34a6: fe9a                     dc.w       $fe9a
34a8: fea4                     dc.w       $fea4
34aa: ff2c                     dc.w       $ff2c
34ac: ff90                     dc.w       $ff90
34ae: 41ee001a                 lea.l      $1a(a6), a0
34b2: 3f18                     move.w     (a0)+, -(a7)
34b4: 487a02e4                 pea.l      $379a(pc)
34b8: 2f10                     move.l     (a0), -(a7)
34ba: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
34be: 4a6eff66                 tst.w      -$9a(a6)
34c2: 57c0                     seq.b      d0
34c4: c02eff6b                 and.b      -$95(a6), d0
34c8: 6700010a                 beq.w      $35d4
34cc: 206e0016                 movea.l    $16(a6), a0
34d0: 226e000e                 movea.l    $e(a6), a1
34d4: 3011                     move.w     (a1), d0
34d6: 5340                     subq.w     #$1, d0
34d8: e540                     asl.w      #$2, d0
34da: 7200                     moveq      #$0, d1
34dc: 12300000                 move.b     (a0, d0.w), d1
34e0: 7019                     moveq      #$19, d0
34e2: 9041                     sub.w      d1, d0
34e4: 206e0016                 movea.l    $16(a6), a0
34e8: 226e000e                 movea.l    $e(a6), a1
34ec: 3211                     move.w     (a1), d1
34ee: 5341                     subq.w     #$1, d1
34f0: e541                     asl.w      #$2, d1
34f2: 11801000                 move.b     d0, (a0, d1.w)
34f6: 206e0016                 movea.l    $16(a6), a0
34fa: 226e000e                 movea.l    $e(a6), a1
34fe: 3011                     move.w     (a1), d0
3500: e540                     asl.w      #$2, d0
3502: 11bc00120000             move.b     #$12, (a0, d0.w)
3508: 206e000e                 movea.l    $e(a6), a0
350c: 3d50ff66                 move.w     (a0), -$9a(a6)
3510: 206e000e                 movea.l    $e(a6), a0
3514: 3010                     move.w     (a0), d0
3516: 5240                     addq.w     #$1, d0
3518: 206e000e                 movea.l    $e(a6), a0
351c: 3080                     move.w     d0, (a0)
351e: 206e0016                 movea.l    $16(a6), a0
3522: 226e000e                 movea.l    $e(a6), a1
3526: 3011                     move.w     (a1), d0
3528: e540                     asl.w      #$2, d0
352a: 11bc00010000             move.b     #$1, (a0, d0.w)
3530: 206e0016                 movea.l    $16(a6), a0
3534: 226e000e                 movea.l    $e(a6), a1
3538: 3011                     move.w     (a1), d0
353a: e540                     asl.w      #$2, d0
353c: 31aeff700002             move.w     -$90(a6), $2(a0, d0.w)
3542: 0c2e0001ff84             cmpi.b     #$1, -$7c(a6)
3548: 6614                     bne.b      $355e
354a: 206e0016                 movea.l    $16(a6), a0
354e: 226e000e                 movea.l    $e(a6), a1
3552: 3011                     move.w     (a1), d0
3554: e540                     asl.w      #$2, d0
3556: 11bc00010001             move.b     #$1, $1(a0, d0.w)
355c: 605c                     bra.b      $35ba
355e: 0c2e0012ff84             cmpi.b     #$12, -$7c(a6)
3564: 6614                     bne.b      $357a
3566: 206e0016                 movea.l    $16(a6), a0
356a: 226e000e                 movea.l    $e(a6), a1
356e: 3011                     move.w     (a1), d0
3570: e540                     asl.w      #$2, d0
3572: 11bc00020001             move.b     #$2, $1(a0, d0.w)
3578: 6040                     bra.b      $35ba
357a: 554f                     subq.w     #$2, a7
357c: 4227                     clr.b      -(a7)
357e: 2f0e                     move.l     a6, -(a7)
3580: 4ebadb66                 jsr        $10e8(pc)
3584: 3d5fff70                 move.w     (a7)+, -$90(a6)
3588: 4a2eff69                 tst.b      -$97(a6)
358c: 6708                     beq.b      $3596
358e: 2f0e                     move.l     a6, -(a7)
3590: 4ebadde8                 jsr        $137a(pc)
3594: 6024                     bra.b      $35ba
3596: 206e0016                 movea.l    $16(a6), a0
359a: 226e000e                 movea.l    $e(a6), a1
359e: 3011                     move.w     (a1), d0
35a0: e540                     asl.w      #$2, d0
35a2: 11bc00030001             move.b     #$3, $1(a0, d0.w)
35a8: 206e0016                 movea.l    $16(a6), a0
35ac: 226e000e                 movea.l    $e(a6), a1
35b0: 3011                     move.w     (a1), d0
35b2: e540                     asl.w      #$2, d0
35b4: 31aeff700002             move.w     -$90(a6), $2(a0, d0.w)
35ba: 206e000e                 movea.l    $e(a6), a0
35be: 3010                     move.w     (a0), d0
35c0: 5240                     addq.w     #$1, d0
35c2: 206e000e                 movea.l    $e(a6), a0
35c6: 3080                     move.w     d0, (a0)
35c8: 1d7c0001ff85             move.b     #$1, -$7b(a6)
35ce: 1d7c0007ff86             move.b     #$7, -$7a(a6)
35d4: 206e001c                 movea.l    $1c(a6), a0
35d8: 7000                     moveq      #$0, d0
35da: 1010                     move.b     (a0), d0
35dc: 4a40                     tst.w      d0
35de: 660a                     bne.b      $35ea
35e0: 554f                     subq.w     #$2, a7
35e2: 2f0e                     move.l     a6, -(a7)
35e4: 4ebaddd4                 jsr        $13ba(pc)
35e8: 3a1f                     move.w     (a7)+, d5
35ea: 1006                     move.b     d6, d0
35ec: 5300                     subq.b     #$1, d0
35ee: 206e001c                 movea.l    $1c(a6), a0
35f2: 7200                     moveq      #$0, d1
35f4: 1210                     move.b     (a0), d1
35f6: 4a41                     tst.w      d1
35f8: 57c1                     seq.b      d1
35fa: c001                     and.b      d1, d0
35fc: 6600ef70                 bne.w      $256e
3600: 4a2eff86                 tst.b      -$7a(a6)
3604: 6706                     beq.b      $360c
3606: 2f0e                     move.l     a6, -(a7)
3608: 4ebaedd2                 jsr        $23dc(pc)
360c: 206e001c                 movea.l    $1c(a6), a0
3610: 7000                     moveq      #$0, d0
3612: 1010                     move.b     (a0), d0
3614: 4a40                     tst.w      d0
3616: 57c0                     seq.b      d0
3618: 4a6eff88                 tst.w      -$78(a6)
361c: 5ec1                     sgt.b      d1
361e: c001                     and.b      d1, d0
3620: 6710                     beq.b      $3632
3622: 41ee001a                 lea.l      $1a(a6), a0
3626: 3f18                     move.w     (a0)+, -(a7)
3628: 487a0152                 pea.l      $377c(pc)
362c: 2f10                     move.l     (a0), -(a7)
362e: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
3632: 206e001c                 movea.l    $1c(a6), a0
3636: 7000                     moveq      #$0, d0
3638: 1010                     move.b     (a0), d0
363a: 4a40                     tst.w      d0
363c: 6672                     bne.b      $36b0
363e: 426eff70                 clr.w      -$90(a6)
3642: 422eff5b                 clr.b      -$a5(a6)
3646: 7000                     moveq      #$0, d0
3648: 102eff5b                 move.b     -$a5(a6), d0
364c: d040                     add.w      d0, d0
364e: 322eff70                 move.w     -$90(a6), d1
3652: d2740000                 add.w      (a4, d0.w), d1
3656: 3d41ff70                 move.w     d1, -$90(a6)
365a: 522eff5b                 addq.b     #$1, -$a5(a6)
365e: 0c2e0006ff5b             cmpi.b     #$6, -$a5(a6)
3664: 63e0                     bls.b      $3646
3666: 0c6e0006ff70             cmpi.w     #$6, -$90(a6)
366c: 6f42                     ble.b      $36b0
366e: 302eff70                 move.w     -$90(a6), d0
3672: 48c0                     ext.l      d0
3674: 2f00                     move.l     d0, -(a7)
3676: 486efe5a                 pea.l      -$1a6(a6)
367a: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
367e: 486efc5a                 pea.l      -$3a6(a6)
3682: 487a00e4                 pea.l      $3768(pc)
3686: 486efe5a                 pea.l      -$1a6(a6)
368a: 487a00ae                 pea.l      $373a(pc)
368e: 3f3c0003                 move.w     #$3, -(a7)
3692: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
3696: 584f                     addq.w     #$4, a7
3698: 41ee001a                 lea.l      $1a(a6), a0
369c: 3f18                     move.w     (a0)+, -(a7)
369e: 486efc5a                 pea.l      -$3a6(a6)
36a2: 2f10                     move.l     (a0), -(a7)
36a4: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
36a8: 206e000a                 movea.l    $a(a6), a0
36ac: 30bc0001                 move.w     #$1, (a0)
36b0: 206e001c                 movea.l    $1c(a6), a0
36b4: 7000                     moveq      #$0, d0
36b6: 1010                     move.b     (a0), d0
36b8: 4a40                     tst.w      d0
36ba: 6646                     bne.b      $3702
36bc: 206e0016                 movea.l    $16(a6), a0
36c0: 226e000e                 movea.l    $e(a6), a1
36c4: 3011                     move.w     (a1), d0
36c6: e540                     asl.w      #$2, d0
36c8: 11bc00160000             move.b     #$16, (a0, d0.w)
36ce: 206e0016                 movea.l    $16(a6), a0
36d2: 226e000e                 movea.l    $e(a6), a1
36d6: 3011                     move.w     (a1), d0
36d8: e540                     asl.w      #$2, d0
36da: 42300001                 clr.b      $1(a0, d0.w)
36de: 206e0016                 movea.l    $16(a6), a0
36e2: 226e000e                 movea.l    $e(a6), a1
36e6: 3011                     move.w     (a1), d0
36e8: e540                     asl.w      #$2, d0
36ea: 42700002                 clr.w      $2(a0, d0.w)
36ee: 206e000e                 movea.l    $e(a6), a0
36f2: 3010                     move.w     (a0), d0
36f4: 5240                     addq.w     #$1, d0
36f6: 206e000e                 movea.l    $e(a6), a0
36fa: 3080                     move.w     d0, (a0)
36fc: 2f0e                     move.l     a6, -(a7)
36fe: 4ebad772                 jsr        $e72(pc)
3702: 206e000a                 movea.l    $a(a6), a0
3706: 0c50ffff                 cmpi.w     #$ffff, (a0)
370a: 6608                     bne.b      $3714
370c: 206e000a                 movea.l    $a(a6), a0
3710: 30aeff62                 move.w     -$9e(a6), (a0)
3714: 206e000a                 movea.l    $a(a6), a0
3718: 3010                     move.w     (a0), d0
371a: b06e0020                 cmp.w      $20(a6), d0
371e: 6d0c                     blt.b      $372c
3720: 302e0020                 move.w     $20(a6), d0
3724: 5340                     subq.w     #$1, d0
3726: 206e000a                 movea.l    $a(a6), a0
372a: 3080                     move.w     d0, (a0)
372c: 4cdf10e0                 movem.l    (a7)+, d5-d7/a4
3730: 4e5e                     unlk       a6
3732: 205f                     movea.l    (a7)+, a0
3734: 4fef001e                 lea.l      $1e(a7), a7
3738: 4ed0                     jmp        (a0)
373a: 2d20                     move.l     -(a0), -(a6)
373c: 706f                     moveq      #$6f, d0
373e: 696e                     bvs.b      $37ae
3740: 7473                     moveq      #$73, d2
3742: 20776f727468206f6620     movea.l    ([$7468206f, a7], $6620), a0
374c: 6174                     bsr.b      $37c2
374e: 7472                     moveq      #$72, d2
3750: 6962                     bvs.b      $37b4
3752: 7574                     .byte      0x75, 0x74
3754: 6573                     bcs.b      $37c9
3756: 2e20                     move.l     -(a0), d7
3758: 2054                     movea.l    (a4), a0
375a: 6865                     bvc.b      $37c1
375c: 206c696d                 movea.l    $696d(a4), a0
3760: 6974                     bvs.b      $37d6
3762: 20697320                 movea.l    $7320(a1), a0
3766: 362e1359                 move.w     $1359(a6), d3
376a: 6f75                     ble.b      $37e1
376c: 20686176                 movea.l    $6176(a0), a0
3770: 6520                     bcs.b      $3792
3772: 616c                     bsr.b      $37e0
3774: 6c6f                     bge.b      $37e5
3776: 6361                     bls.b      $37d9
3778: 7465                     moveq      #$65, d2
377a: 6420                     bcc.b      $379c
377c: 1c45                     .byte      0x1c, 0x45
377e: 4e44                     trap       #$4
3780: 2065                     movea.l    -(a5), a0
3782: 7870                     moveq      #$70, d4
3784: 6563                     bcs.b      $37e9
3786: 7465                     moveq      #$65, d2
3788: 6420                     bcc.b      $37aa
378a: 6275                     bhi.b      $3801
378c: 7420                     moveq      #$20, d2
378e: 6e65                     bgt.b      $37f5
3790: 7665                     moveq      #$65, d3
3792: 7220                     moveq      #$20, d1
3794: 666f                     bne.b      $3805
3796: 756e                     .byte      0x75, 0x6e
3798: 6498                     bcc.b      $3732
379a: 2645                     movea.l    d5, a3
379c: 7272                     moveq      #$72, d1
379e: 6f72                     ble.b      $3812
37a0: 2e20                     move.l     -(a0), d7
37a2: 2041                     movea.l    d1, a0
37a4: 6374                     bls.b      $381a
37a6: 7561                     .byte      0x75, 0x61
37a8: 6c6c                     bge.b      $3816
37aa: 7920                     .byte      0x79, 0x20
37ac: 6120                     bsr.b      $37ce
37ae: 6275                     bhi.b      $3825
37b0: 6720                     beq.b      $37d2
37b2: 696e                     bvs.b      $3822
37b4: 2052                     movea.l    (a2), a0
37b6: 6f62                     ble.b      $381a
37b8: 6f74                     ble.b      $382e
37ba: 2057                     movea.l    (a7), a0
37bc: 6172                     bsr.b      $3830
37be: 2121                     move.l     -(a1), -(a0)
37c0: 219a2470                 move.l     (a2)+, $70(a0, d2.w)
37c4: 6f69                     ble.b      $382f
37c6: 6e74                     bgt.b      $383c
37c8: 6572                     bcs.b      $383c
37ca: 2064                     movea.l    -(a4), a0
37cc: 652d                     bcs.b      $37fb
37ce: 7265                     moveq      #$65, d1
37d0: 6665                     bne.b      $3837
37d2: 7265                     moveq      #$65, d1
37d4: 6e63                     bgt.b      $3839
37d6: 6520                     bcs.b      $37f8
37d8: 6e6f                     bgt.b      $3849
37da: 2061                     movea.l    -(a1), a0
37dc: 6c6c                     bge.b      $384a
37de: 6f77                     ble.b      $3857
37e0: 6564                     bcs.b      $3846
37e2: 20686572                 movea.l    $6572(a0), a0
37e6: 6598                     bcs.b      $3780
37e8: 25706f696e746572         move.l     ([$6e74, a0]), $6572(a2)
37f0: 2064                     movea.l    -(a4), a0
37f2: 652d                     bcs.b      $3821
37f4: 7265                     moveq      #$65, d1
37f6: 6665                     bne.b      $385d
37f8: 7265                     moveq      #$65, d1
37fa: 6e63                     bgt.b      $385f
37fc: 6520                     bcs.b      $381e
37fe: 6e6f                     bgt.b      $386f
3800: 7420                     moveq      #$20, d2
3802: 616c                     bsr.b      $3870
3804: 6c6f                     bge.b      $3875
3806: 7765                     .byte      0x77, 0x65
3808: 6420                     bcc.b      $382a
380a: 6865                     bvc.b      $3871
380c: 7265                     moveq      #$65, d1
380e: 2a41                     movea.l    d1, a5
3810: 207661726961626c6520     movea.l    ([$6961626c, a6], $6520), a0
381a: 616c                     bsr.b      $3888
381c: 6c6f                     bge.b      $388d
381e: 6361                     bls.b      $3881
3820: 7469                     moveq      #$69, d2
3822: 6f6e                     ble.b      $3892
3824: 2063                     movea.l    -(a3), a0
3826: 616e                     bsr.b      $3896
3828: 6e6f                     bgt.b      $3899
382a: 7420                     moveq      #$20, d2
382c: 6265                     bhi.b      $3893
382e: 207573656420             movea.l    ([$6420, a5]), a0
3834: 6865                     bvc.b      $389b
3836: 7265                     moveq      #$65, d1
3838: 2e9a                     move.l     (a2)+, (a7)
383a: 4941                     .byte      0x49, 0x41
383c: 6e20                     bgt.b      $385e
383e: 6174                     bsr.b      $38b4
3840: 7472                     moveq      #$72, d2
3842: 6962                     bvs.b      $38a6
3844: 7574                     .byte      0x75, 0x74
3846: 6520                     bcs.b      $3868
3848: 7661                     moveq      #$61, d3
384a: 6c75                     bge.b      $38c1
384c: 6520                     bcs.b      $386e
384e: 6361                     bls.b      $38b1
3850: 6e6e                     bgt.b      $38c0
3852: 6f74                     ble.b      $38c8
3854: 2062                     movea.l    -(a2), a0
3856: 6520                     bcs.b      $3878
3858: 7573                     .byte      0x75, 0x73
385a: 6564                     bcs.b      $38c0
385c: 20686572                 movea.l    $6572(a0), a0
3860: 652c                     bcs.b      $388e
3862: 20697420                 movea.l    $7420(a1), a0
3866: 6361                     bls.b      $38c9
3868: 6e20                     bgt.b      $388a
386a: 6f6e                     ble.b      $38da
386c: 6c79                     bge.b      $38e7
386e: 2062                     movea.l    -(a2), a0
3870: 6520                     bcs.b      $3892
3872: 7365                     .byte      0x73, 0x65
3874: 7420                     moveq      #$20, d2
3876: 746f                     moveq      #$6f, d2
3878: 2061                     movea.l    -(a1), a0
387a: 2063                     movea.l    -(a3), a0
387c: 6f6e                     ble.b      $38ec
387e: 7374                     .byte      0x73, 0x74
3880: 616e                     bsr.b      $38f0
3882: 742e                     moveq      #$2e, d2
3884: 3054                     movea.w    (a4), a0
3886: 6869                     bvc.b      $38f1
3888: 7320                     .byte      0x73, 0x20
388a: 6c6f                     bge.b      $38fb
388c: 6f6b                     ble.b      $38f9
388e: 7320                     .byte      0x73, 0x20
3890: 6c69                     bge.b      $38fb
3892: 6b65                     bmi.b      $38f9
3894: 2061                     movea.l    -(a1), a0
3896: 206c6162                 movea.l    $6162(a4), a0
389a: 656c                     bcs.b      $3908
389c: 20776869                 movea.l    $69(a7, d6.l), a0
38a0: 6368                     bls.b      $390a
38a2: 2069736e                 movea.l    $736e(a1), a0
38a6: 277420616c6c             move.l     $61(a4, d2.w), $6c6c(a3)
38ac: 6f77                     ble.b      $3925
38ae: 6564                     bcs.b      $3914
38b0: 20686572                 movea.l    $6572(a0), a0
38b4: 6598                     bcs.b      $384e
38b6: 2a41                     movea.l    d1, a5
38b8: 2063                     movea.l    -(a3), a0
38ba: 6f6e                     ble.b      $392a
38bc: 7374                     .byte      0x73, 0x74
38be: 616e                     bsr.b      $392e
38c0: 7420                     moveq      #$20, d2
38c2: 6465                     bcc.b      $3929
38c4: 636c                     bls.b      $3932
38c6: 6172                     bsr.b      $393a
38c8: 6174                     bsr.b      $393e
38ca: 696f                     bvs.b      $393b
38cc: 6e20                     bgt.b      $38ee
38ce: 6973                     bvs.b      $3943
38d0: 206e6f74                 movea.l    $6f74(a6), a0
38d4: 2061                     movea.l    -(a1), a0
38d6: 6c6c                     bge.b      $3944
38d8: 6f77                     ble.b      $3951
38da: 6564                     bcs.b      $3940
38dc: 20686572                 movea.l    $6572(a0), a0
38e0: 6598                     bcs.b      $387a
38e2: 2a41                     movea.l    d1, a5
38e4: 2063                     movea.l    -(a3), a0
38e6: 6f6e                     ble.b      $3956
38e8: 7374                     .byte      0x73, 0x74
38ea: 616e                     bsr.b      $395a
38ec: 7420                     moveq      #$20, d2
38ee: 28696520                 movea.l    $6520(a1), a4
38f2: 6e75                     bgt.b      $3969
38f4: 6d62                     blt.b      $3958
38f6: 6572                     bcs.b      $396a
38f8: 2920                     move.l     -(a0), -(a4)
38fa: 6973                     bvs.b      $396f
38fc: 206e6f74                 movea.l    $6f74(a6), a0
3900: 2061                     movea.l    -(a1), a0
3902: 6c6c                     bge.b      $3970
3904: 6f77                     ble.b      $397d
3906: 6564                     bcs.b      $396c
3908: 20686572                 movea.l    $6572(a0), a0
390c: 6598                     bcs.b      $38a6
390e: 23546f6f                 move.l     (a4), $6f6f(a1)
3912: 206d616e                 movea.l    $616e(a5), a0
3916: 7920                     .byte      0x79, 0x20
3918: 6d65                     blt.b      $397f
391a: 6d6f                     blt.b      $398b
391c: 7279                     moveq      #$79, d1
391e: 206c6f63                 movea.l    $6f63(a4), a0
3922: 6174                     bsr.b      $3998
3924: 696f                     bvs.b      $3995
3926: 6e73                     bgt.b      $399b
3928: 2061                     movea.l    -(a1), a0
392a: 6c6c                     bge.b      $3998
392c: 6f63                     ble.b      $3991
392e: 6174                     bsr.b      $39a4
3930: 6564                     bcs.b      $3996
3932: 012e4854                 btst.l     d0, $4854(a6)
3936: 6865                     bvc.b      $399d
3938: 206c696d                 movea.l    $696d(a4), a0
393c: 6974                     bvs.b      $39b2
393e: 7320                     .byte      0x73, 0x20
3940: 6f66                     ble.b      $39a8
3942: 20746869                 movea.l    $69(a4, d6.l), a0
3946: 7320                     .byte      0x73, 0x20
3948: 6174                     bsr.b      $39be
394a: 7472                     moveq      #$72, d2
394c: 6962                     bvs.b      $39b0
394e: 7574                     .byte      0x75, 0x74
3950: 6520                     bcs.b      $3972
3952: 6861                     bvc.b      $39b5
3954: 7665                     moveq      #$65, d3
3956: 2062                     movea.l    -(a2), a0
3958: 6565                     bcs.b      $39bf
395a: 6e20                     bgt.b      $397c
395c: 6578                     bcs.b      $39d6
395e: 6365                     bls.b      $39c5
3960: 6564                     bcs.b      $39c6
3962: 6564                     bcs.b      $39c8
3964: 2c20                     move.l     -(a0), d6
3966: 7468                     moveq      #$68, d2
3968: 6520                     bcs.b      $398a
396a: 6c69                     bge.b      $39d5
396c: 6d69                     blt.b      $39d7
396e: 7420                     moveq      #$20, d2
3970: 6973                     bvs.b      $39e5
3972: 2066                     movea.l    -(a6), a0
3974: 726f                     moveq      #$6f, d1
3976: 6d20                     blt.b      $3998
3978: 3020                     move.w     -(a0), d0
397a: 746f                     moveq      #$6f, d2
397c: 2012                     move.l     (a2), d0
397e: 4c54                     .byte      0x4c, 0x54
3980: 6865                     bvc.b      $39e7
3982: 2054                     movea.l    (a4), a0
3984: 4f20                     dc.w       $4f20
3986: 7374                     .byte      0x73, 0x74
3988: 6174                     bsr.b      $39fe
398a: 656d                     bcs.b      $39f9
398c: 656e                     bcs.b      $39fc
398e: 7420                     moveq      #$20, d2
3990: 6973                     bvs.b      $3a05
3992: 206e6f74                 movea.l    $6f74(a6), a0
3996: 2061                     movea.l    -(a1), a0
3998: 6c6c                     bge.b      $3a06
399a: 6f77                     ble.b      $3a13
399c: 6564                     bcs.b      $3a02
399e: 20686572                 movea.l    $6572(a0), a0
39a2: 652e                     bcs.b      $39d2
39a4: 2020                     move.l     -(a0), d0
39a6: 4f6e                     .byte      0x4f, 0x6e
39a8: 6c79                     bge.b      $3a23
39aa: 2061                     movea.l    -(a1), a0
39ac: 6c6c                     bge.b      $3a1a
39ae: 6f77                     ble.b      $3a27
39b0: 6564                     bcs.b      $3a16
39b2: 20696e20                 movea.l    $6e20(a1), a0
39b6: 6173                     bsr.b      $3a2b
39b8: 7369                     .byte      0x73, 0x69
39ba: 676e                     beq.b      $3a2a
39bc: 6d65                     blt.b      $3a23
39be: 6e74                     bgt.b      $3a34
39c0: 20737461                 movea.l    $61(a3, d7.w), a0
39c4: 7465                     moveq      #$65, d2
39c6: 6d65                     blt.b      $3a2d
39c8: 6e74                     bgt.b      $3a3e
39ca: 7398                     .byte      0x73, 0x98
39cc: 2854                     movea.l    (a4), a4
39ce: 6865                     bvc.b      $3a35
39d0: 2045                     movea.l    d5, a0
39d2: 4e44                     trap       #$4
39d4: 494e                     .byte      0x49, 0x4e
39d6: 5420                     addq.b     #$2, -(a0)
39d8: 7374                     .byte      0x73, 0x74
39da: 6174                     bsr.b      $3a50
39dc: 656d                     bcs.b      $3a4b
39de: 656e                     bcs.b      $3a4e
39e0: 7420                     moveq      #$20, d2
39e2: 6973                     bvs.b      $3a57
39e4: 206e6f74                 movea.l    $6f74(a6), a0
39e8: 2061                     movea.l    -(a1), a0
39ea: 6c6c                     bge.b      $3a58
39ec: 6f77                     ble.b      $3a65
39ee: 6564                     bcs.b      $3a54
39f0: 20686572                 movea.l    $6572(a0), a0
39f4: 659a                     bcs.b      $3990
39f6: 2854                     movea.l    (a4), a4
39f8: 6865                     bvc.b      $3a5f
39fa: 2045                     movea.l    d5, a0
39fc: 4e44                     trap       #$4
39fe: 5355                     subq.w     #$1, (a5)
3a00: 4220                     clr.b      -(a0)
3a02: 7374                     .byte      0x73, 0x74
3a04: 6174                     bsr.b      $3a7a
3a06: 656d                     bcs.b      $3a75
3a08: 656e                     bcs.b      $3a78
3a0a: 7420                     moveq      #$20, d2
3a0c: 6973                     bvs.b      $3a81
3a0e: 206e6f74                 movea.l    $6f74(a6), a0
3a12: 2061                     movea.l    -(a1), a0
3a14: 6c6c                     bge.b      $3a82
3a16: 6f77                     ble.b      $3a8f
3a18: 6564                     bcs.b      $3a7e
3a1a: 20686572                 movea.l    $6572(a0), a0
3a1e: 659a                     bcs.b      $39ba
3a20: 27546865                 move.l     (a4), $6865(a3)
3a24: 2047                     movea.l    d7, a0
3a26: 4f53                     .byte      0x4f, 0x53
3a28: 5542                     subq.w     #$2, d2
3a2a: 20737461                 movea.l    $61(a3, d7.w), a0
3a2e: 7465                     moveq      #$65, d2
3a30: 6d65                     blt.b      $3a97
3a32: 6e74                     bgt.b      $3aa8
3a34: 20697320                 movea.l    $7320(a1), a0
3a38: 6e6f                     bgt.b      $3aa9
3a3a: 7420                     moveq      #$20, d2
3a3c: 616c                     bsr.b      $3aaa
3a3e: 6c6f                     bge.b      $3aaf
3a40: 7765                     .byte      0x77, 0x65
3a42: 6420                     bcc.b      $3a64
3a44: 6865                     bvc.b      $3aab
3a46: 7265                     moveq      #$65, d1
3a48: 2654                     movea.l    (a4), a3
3a4a: 6865                     bvc.b      $3ab1
3a4c: 2047                     movea.l    d7, a0
3a4e: 4f54                     .byte      0x4f, 0x54
3a50: 4f20                     dc.w       $4f20
3a52: 7374                     .byte      0x73, 0x74
3a54: 6174                     bsr.b      $3aca
3a56: 656d                     bcs.b      $3ac5
3a58: 656e                     bcs.b      $3ac8
3a5a: 7420                     moveq      #$20, d2
3a5c: 6973                     bvs.b      $3ad1
3a5e: 206e6f74                 movea.l    $6f74(a6), a0
3a62: 2061                     movea.l    -(a1), a0
3a64: 6c6c                     bge.b      $3ad2
3a66: 6f77                     ble.b      $3adf
3a68: 6564                     bcs.b      $3ace
3a6a: 20686572                 movea.l    $6572(a0), a0
3a6e: 6598                     bcs.b      $3a08
3a70: 1e45                     .byte      0x1e, 0x45
3a72: 4e44                     trap       #$4
3a74: 20737461                 movea.l    $61(a3, d7.w), a0
3a78: 7465                     moveq      #$65, d2
3a7a: 6d65                     blt.b      $3ae1
3a7c: 6e74                     bgt.b      $3af2
3a7e: 206e6f74                 movea.l    $6f74(a6), a0
3a82: 2061                     movea.l    -(a1), a0
3a84: 6c6c                     bge.b      $3af2
3a86: 6f77                     ble.b      $3aff
3a88: 6564                     bcs.b      $3aee
3a8a: 20686572                 movea.l    $6572(a0), a0
3a8e: 6598                     bcs.b      $3a28
3a90: 4145                     .byte      0x41, 0x45
3a92: 4e44                     trap       #$4
3a94: 20737461                 movea.l    $61(a3, d7.w), a0
3a98: 7465                     moveq      #$65, d2
3a9a: 6d65                     blt.b      $3b01
3a9c: 6e74                     bgt.b      $3b12
3a9e: 206e6f74                 movea.l    $6f74(a6), a0
3aa2: 2061                     movea.l    -(a1), a0
3aa4: 6c6c                     bge.b      $3b12
3aa6: 6f77                     ble.b      $3b1f
3aa8: 6564                     bcs.b      $3b0e
3aaa: 20686572                 movea.l    $6572(a0), a0
3aae: 652e                     bcs.b      $3ade
3ab0: 2020                     move.l     -(a0), d0
3ab2: 4d69                     .byte      0x4d, 0x69
3ab4: 7373                     .byte      0x73, 0x73
3ab6: 696e                     bvs.b      $3b26
3ab8: 6720                     beq.b      $3ada
3aba: 4946                     .byte      0x49, 0x46
3abc: 2c20                     move.l     -(a0), d6
3abe: 5748                     subq.w     #$3, a0
3ac0: 494c                     .byte      0x49, 0x4c
3ac2: 452c                     dc.w       $452c
3ac4: 206f7220                 movea.l    $7220(a7), a0
3ac8: 454c                     .byte      0x45, 0x4c
3aca: 5345                     subq.w     #$1, d5
3acc: 2061                     movea.l    -(a1), a0
3ace: 626f                     bhi.b      $3b3f
3ad0: 7665                     moveq      #$65, d3
3ad2: 2641                     movea.l    d1, a3
3ad4: 6e20                     bgt.b      $3af6
3ad6: 554e                     subq.w     #$2, a6
3ad8: 5449                     addq.w     #$2, a1
3ada: 4c20                     .byte      0x4c, 0x20
3adc: 7374                     .byte      0x73, 0x74
3ade: 6174                     bsr.b      $3b54
3ae0: 656d                     bcs.b      $3b4f
3ae2: 656e                     bcs.b      $3b52
3ae4: 7420                     moveq      #$20, d2
3ae6: 6973                     bvs.b      $3b5b
3ae8: 206e6f74                 movea.l    $6f74(a6), a0
3aec: 2061                     movea.l    -(a1), a0
3aee: 6c6c                     bge.b      $3b5c
3af0: 6f77                     ble.b      $3b69
3af2: 6564                     bcs.b      $3b58
3af4: 20686572                 movea.l    $6572(a0), a0
3af8: 6598                     bcs.b      $3a92
3afa: 2d455252                 move.l     d5, $5252(a6)
3afe: 4f52                     .byte      0x4f, 0x52
3b00: 3a20                     move.w     -(a0), d5
3b02: 4120                     dc.w       $4120
3b04: 5245                     addq.w     #$1, d5
3b06: 5045                     addq.w     #$8, d5
3b08: 4154                     .byte      0x41, 0x54
3b0a: 20737461                 movea.l    $61(a3, d7.w), a0
3b0e: 746d                     moveq      #$6d, d2
3b10: 656e                     bcs.b      $3b80
3b12: 7420                     moveq      #$20, d2
3b14: 6973                     bvs.b      $3b89
3b16: 206e6f74                 movea.l    $6f74(a6), a0
3b1a: 2061                     movea.l    -(a1), a0
3b1c: 6c6c                     bge.b      $3b8a
3b1e: 6f77                     ble.b      $3b97
3b20: 6564                     bcs.b      $3b86
3b22: 20686572                 movea.l    $6572(a0), a0
3b26: 652e                     bcs.b      $3b56
3b28: 2a45                     movea.l    d5, a5
3b2a: 7272                     moveq      #$72, d1
3b2c: 6f72                     ble.b      $3ba0
3b2e: 3a20                     move.w     -(a0), d5
3b30: 4120                     dc.w       $4120
3b32: 444f                     .byte      0x44, 0x4f
3b34: 20737461                 movea.l    $61(a3, d7.w), a0
3b38: 7465                     moveq      #$65, d2
3b3a: 6d65                     blt.b      $3ba1
3b3c: 6e74                     bgt.b      $3bb2
3b3e: 20697320                 movea.l    $7320(a1), a0
3b42: 6e6f                     bgt.b      $3bb3
3b44: 7420                     moveq      #$20, d2
3b46: 616c                     bsr.b      $3bb4
3b48: 6c6f                     bge.b      $3bb9
3b4a: 7765                     .byte      0x77, 0x65
3b4c: 6420                     bcc.b      $3b6e
3b4e: 6865                     bvc.b      $3bb5
3b50: 7265                     moveq      #$65, d1
3b52: 2e98                     move.l     (a0)+, (a7)
3b54: 25412057                 move.l     d1, $2057(a2)
3b58: 4849                     dc.w       $4849
3b5a: 4c45                     .byte      0x4c, 0x45
3b5c: 20737461                 movea.l    $61(a3, d7.w), a0
3b60: 7465                     moveq      #$65, d2
3b62: 6d65                     blt.b      $3bc9
3b64: 6e74                     bgt.b      $3bda
3b66: 20697320                 movea.l    $7320(a1), a0
3b6a: 6e6f                     bgt.b      $3bdb
3b6c: 7420                     moveq      #$20, d2
3b6e: 616c                     bsr.b      $3bdc
3b70: 6c6f                     bge.b      $3be1
3b72: 7765                     .byte      0x77, 0x65
3b74: 6420                     bcc.b      $3b96
3b76: 6865                     bvc.b      $3bdd
3b78: 7265                     moveq      #$65, d1
3b7a: 1f454c53                 move.b     d5, $4c53(a7)
3b7e: 4520                     dc.w       $4520
3b80: 7374                     .byte      0x73, 0x74
3b82: 6174                     bsr.b      $3bf8
3b84: 656d                     bcs.b      $3bf3
3b86: 656e                     bcs.b      $3bf6
3b88: 7420                     moveq      #$20, d2
3b8a: 6e6f                     bgt.b      $3bfb
3b8c: 7420                     moveq      #$20, d2
3b8e: 616c                     bsr.b      $3bfc
3b90: 6c6f                     bge.b      $3c01
3b92: 7765                     .byte      0x77, 0x65
3b94: 6420                     bcc.b      $3bb6
3b96: 6865                     bvc.b      $3bfd
3b98: 7265                     moveq      #$65, d1
3b9a: 3245                     movea.w    d5, a1
3b9c: 4c53                     .byte      0x4c, 0x53
3b9e: 4520                     dc.w       $4520
3ba0: 7374                     .byte      0x73, 0x74
3ba2: 6174                     bsr.b      $3c18
3ba4: 656d                     bcs.b      $3c13
3ba6: 656e                     bcs.b      $3c16
3ba8: 7420                     moveq      #$20, d2
3baa: 6e6f                     bgt.b      $3c1b
3bac: 7420                     moveq      #$20, d2
3bae: 616c                     bsr.b      $3c1c
3bb0: 6c6f                     bge.b      $3c21
3bb2: 7765                     .byte      0x77, 0x65
3bb4: 6420                     bcc.b      $3bd6
3bb6: 6865                     bvc.b      $3c1d
3bb8: 7265                     moveq      #$65, d1
3bba: 2e20                     move.l     -(a0), d7
3bbc: 204d                     movea.l    a5, a0
3bbe: 6973                     bvs.b      $3c33
3bc0: 7369                     .byte      0x73, 0x69
3bc2: 6e67                     bgt.b      $3c2b
3bc4: 2049                     movea.l    a1, a0
3bc6: 4620                     not.b      -(a0)
3bc8: 6162                     bsr.b      $3c2c
3bca: 6f76                     ble.b      $3c42
3bcc: 659a                     bcs.b      $3b68
3bce: 1854                     .byte      0x18, 0x54
3bd0: 4845                     swap       d5
3bd2: 4e20                     .byte      0x4e, 0x20
3bd4: 6973                     bvs.b      $3c49
3bd6: 206e6f74                 movea.l    $6f74(a6), a0
3bda: 2061                     movea.l    -(a1), a0
3bdc: 6c6c                     bge.b      $3c4a
3bde: 6f77                     ble.b      $3c57
3be0: 6564                     bcs.b      $3c46
3be2: 20686572                 movea.l    $6572(a0), a0
3be6: 6598                     bcs.b      $3b80
3be8: 23416e20                 move.l     d1, $6e20(a1)
3bec: 4946                     .byte      0x49, 0x46
3bee: 20737461                 movea.l    $61(a3, d7.w), a0
3bf2: 7465                     moveq      #$65, d2
3bf4: 6d65                     blt.b      $3c5b
3bf6: 6e74                     bgt.b      $3c6c
3bf8: 20697320                 movea.l    $7320(a1), a0
3bfc: 6e6f                     bgt.b      $3c6d
3bfe: 7420                     moveq      #$20, d2
3c00: 616c                     bsr.b      $3c6e
3c02: 6c6f                     bge.b      $3c73
3c04: 7765                     .byte      0x77, 0x65
3c06: 6420                     bcc.b      $3c28
3c08: 6865                     bvc.b      $3c6f
3c0a: 7265                     moveq      #$65, d1
3c0c: 4a41                     tst.w      d1
3c0e: 2063                     movea.l    -(a3), a0
3c10: 6f6d                     ble.b      $3c7f
3c12: 7061                     moveq      #$61, d0
3c14: 7265                     moveq      #$65, d1
3c16: 20697320                 movea.l    $7320(a1), a0
3c1a: 6e6f                     bgt.b      $3c8b
3c1c: 7420                     moveq      #$20, d2
3c1e: 616c                     bsr.b      $3c8c
3c20: 6c6f                     bge.b      $3c91
3c22: 7765                     .byte      0x77, 0x65
3c24: 6420                     bcc.b      $3c46
3c26: 6865                     bvc.b      $3c8d
3c28: 7265                     moveq      #$65, d1
3c2a: 2e20                     move.l     -(a0), d7
3c2c: 2041                     movea.l    d1, a0
3c2e: 2063                     movea.l    -(a3), a0
3c30: 6f6d                     ble.b      $3c9f
3c32: 7061                     moveq      #$61, d0
3c34: 7265                     moveq      #$65, d1
3c36: 20697320                 movea.l    $7320(a1), a0
3c3a: 6f6e                     ble.b      $3caa
3c3c: 6c79                     bge.b      $3cb7
3c3e: 2061                     movea.l    -(a1), a0
3c40: 6c6c                     bge.b      $3cae
3c42: 6f77                     ble.b      $3cbb
3c44: 6564                     bcs.b      $3caa
3c46: 20696e20                 movea.l    $6e20(a1), a0
3c4a: 6966                     bvs.b      $3cb2
3c4c: 20737461                 movea.l    $61(a3, d7.w), a0
3c50: 7465                     moveq      #$65, d2
3c52: 6d65                     blt.b      $3cb9
3c54: 6e74                     bgt.b      $3cca
3c56: 7398                     .byte      0x73, 0x98
3c58: 2041                     movea.l    d1, a0
3c5a: 6e20                     bgt.b      $3c7c
3c5c: 6f70                     ble.b      $3cce
3c5e: 6572                     bcs.b      $3cd2
3c60: 6174                     bsr.b      $3cd6
3c62: 6f72                     ble.b      $3cd6
3c64: 2063                     movea.l    -(a3), a0
3c66: 616e                     bsr.b      $3cd6
3c68: 206e6f74                 movea.l    $6f74(a6), a0
3c6c: 2062                     movea.l    -(a2), a0
3c6e: 6520                     bcs.b      $3c90
3c70: 7573                     .byte      0x75, 0x73
3c72: 6564                     bcs.b      $3cd8
3c74: 20686572                 movea.l    $6572(a0), a0
3c78: 6598                     bcs.b      $3c12
3c7a: 1e41                     .byte      0x1e, 0x41
3c7c: 207265676973             movea.l    ([$6973, a2]), a0
3c82: 7465                     moveq      #$65, d2
3c84: 7220                     moveq      #$20, d1
3c86: 6973                     bvs.b      $3cfb
3c88: 206e6f74                 movea.l    $6f74(a6), a0
3c8c: 2061                     movea.l    -(a1), a0
3c8e: 6c6c                     bge.b      $3cfc
3c90: 6f77                     ble.b      $3d09
3c92: 6564                     bcs.b      $3cf8
3c94: 20686572                 movea.l    $6572(a0), a0
3c98: 6598                     bcs.b      $3c32
3c9a: 4545                     .byte      0x45, 0x45
3c9c: 6e64                     bgt.b      $3d02
3c9e: 206f6620                 movea.l    $6620(a7), a0
3ca2: 6c69                     bge.b      $3d0d
3ca4: 6e65                     bgt.b      $3d0b
3ca6: 20776173206e6f7420657870 movea.l    ([$206e6f74, a7], $20657870), a0
3cb2: 6563                     bcs.b      $3d17
3cb4: 7465                     moveq      #$65, d2
3cb6: 6420                     bcc.b      $3cd8
3cb8: 6865                     bvc.b      $3d1f
3cba: 7265                     moveq      #$65, d1
3cbc: 2e20                     move.l     -(a0), d7
3cbe: 2053                     movea.l    (a3), a0
3cc0: 6f6d                     ble.b      $3d2f
3cc2: 6574                     bcs.b      $3d38
3cc4: 6869                     bvc.b      $3d2f
3cc6: 6e67                     bgt.b      $3d2f
3cc8: 20697320                 movea.l    $7320(a1), a0
3ccc: 6d69                     blt.b      $3d37
3cce: 7373                     .byte      0x73, 0x73
3cd0: 696e                     bvs.b      $3d40
3cd2: 6720                     beq.b      $3cf4
3cd4: 6f6e                     ble.b      $3d44
3cd6: 20746869                 movea.l    $69(a4, d6.l), a0
3cda: 7320                     .byte      0x73, 0x20
3cdc: 6c69                     bge.b      $3d47
3cde: 6e65                     bgt.b      $3d45
3ce0: 2849                     movea.l    a1, a4
3ce2: 6c6c                     bge.b      $3d50
3ce4: 6567                     bcs.b      $3d4d
3ce6: 616c                     bsr.b      $3d54
3ce8: 20757365206f             movea.l    ([$206f, a5]), a0
3cee: 6620                     bne.b      $3d10
3cf0: 7468                     moveq      #$68, d2
3cf2: 6520                     bcs.b      $3d14
3cf4: 2261                     movea.l    -(a1), a1
3cf6: 6464                     bcc.b      $3d5c
3cf8: 7265                     moveq      #$65, d1
3cfa: 7373                     .byte      0x73, 0x73
3cfc: 206f6622                 movea.l    $6622(a7), a0
3d00: 206f7065                 movea.l    $7065(a7), a0
3d04: 7261                     moveq      #$61, d1
3d06: 746f                     moveq      #$6f, d2
3d08: 7298                     moveq      #$98, d1
3d0a: 3650                     movea.w    (a0), a3
3d0c: 726f                     moveq      #$6f, d1
3d0e: 6772                     beq.b      $3d82
3d10: 616d                     bsr.b      $3d7f
3d12: 20746f6f2073             movea.l    ([$2073, a4]), a0
3d18: 686f                     bvc.b      $3d89
3d1a: 7274                     moveq      #$74, d1
3d1c: 2e20                     move.l     -(a0), d7
3d1e: 2043                     movea.l    d3, a0
3d20: 276d6f6e2c20             move.l     $6f6e(a5), $2c20(a3)
3d26: 796f                     .byte      0x79, 0x6f
3d28: 7520                     .byte      0x75, 0x20
3d2a: 6361                     bls.b      $3d8d
3d2c: 6e20                     bgt.b      $3d4e
3d2e: 646f                     bcc.b      $3d9f
3d30: 2062                     movea.l    -(a2), a0
3d32: 6574                     bcs.b      $3da8
3d34: 7465                     moveq      #$65, d2
3d36: 7220                     moveq      #$20, d1
3d38: 7468                     moveq      #$68, d2
3d3a: 656e                     bcs.b      $3daa
3d3c: 20746861                 movea.l    $61(a4, d6.l), a0
3d40: 7498                     moveq      #$98, d2
3d42: 00004e56                 ori.b      #$56, d0
3d46: fde2                     dc.w       $fde2
3d48: 48e70738                 movem.l    d5-d7/a2-a4, -(a7)
3d4c: 1c2e0008                 move.b     $8(a6), d6
3d50: 1a2e000a                 move.b     $a(a6), d5
3d54: 3b7c0002feec             move.w     #$2, -$114(a5)
3d5a: 3b7c0004feee             move.w     #$4, -$112(a5)
3d60: 3b7c0001fef0             move.w     #$1, -$110(a5)
3d66: 3b7c0002fef2             move.w     #$2, -$10e(a5)
3d6c: 3b7c0002fef4             move.w     #$2, -$10c(a5)
3d72: 3b7c0001fef6             move.w     #$1, -$10a(a5)
3d78: 3b7c0005fef8             move.w     #$5, -$108(a5)
3d7e: 4a05                     tst.b      d5
3d80: 6708                     beq.b      $3d8a
3d82: 487a0150                 pea.l      $3ed4(pc)
3d86: 4ead0062                 jsr        $62(a5) ; CODE 4 resource+0x0b4a
3d8a: 206dbdc6                 movea.l    -$423a(a5), a0
3d8e: 2f10                     move.l     (a0), -(a7)
3d90: a851                     dc.w       $a851
3d92: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
3d96: 205f                     movea.l    (a7)+, a0
3d98: a029                     dc.w       $a029
3d9a: 206dc030                 movea.l    -$3fd0(a5), a0
3d9e: 2850                     movea.l    (a0), a4
3da0: 206c0002                 movea.l    $2(a4), a0
3da4: 2050                     movea.l    (a0), a0
3da6: 2f28003e                 move.l     $3e(a0), -(a7)
3daa: 205f                     movea.l    (a7)+, a0
3dac: a029                     dc.w       $a029
3dae: 1946012a                 move.b     d6, $12a(a4)
3db2: 594f                     subq.w     #$4, a7
3db4: 2f2c0002                 move.l     $2(a4), -(a7)
3db8: a9cb                     dc.w       $a9cb
3dba: 206c0002                 movea.l    $2(a4), a0
3dbe: 2050                     movea.l    (a0), a0
3dc0: 3f28003c                 move.w     $3c(a0), -(a7)
3dc4: 486efeea                 pea.l      -$116(a6)
3dc8: 3f3c00ff                 move.w     #$ff, -(a7)
3dcc: 486c012c                 pea.l      $12c(a4)
3dd0: 486c011c                 pea.l      $11c(a4)
3dd4: 486c2070                 pea.l      $2070(a4)
3dd8: 486effea                 pea.l      -$16(a6)
3ddc: 1f06                     move.b     d6, -(a7)
3dde: 4ebae6fc                 jsr        $24dc(pc)
3de2: 206dc030                 movea.l    -$3fd0(a5), a0
3de6: 2050                     movea.l    (a0), a0
3de8: 20680002                 movea.l    $2(a0), a0
3dec: 2050                     movea.l    (a0), a0
3dee: 2f28003e                 move.l     $3e(a0), -(a7)
3df2: 205f                     movea.l    (a7)+, a0
3df4: a02a                     dc.w       $a02a
3df6: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
3dfa: 205f                     movea.l    (a7)+, a0
3dfc: a02a                     dc.w       $a02a
3dfe: 7000                     moveq      #$0, d0
3e00: 102efeea                 move.b     -$116(a6), d0
3e04: 4a40                     tst.w      d0
3e06: 5ec0                     sgt.b      d0
3e08: 4400                     neg.b      d0
3e0a: 8005                     or.b       d5, d0
3e0c: 6704                     beq.b      $3e12
3e0e: 4ead006a                 jsr        $6a(a5) ; CODE 4 resource+0x0bc8
3e12: 206dc030                 movea.l    -$3fd0(a5), a0
3e16: 2050                     movea.l    (a0), a0
3e18: 3e2822b4                 move.w     $22b4(a0), d7
3e1c: 7000                     moveq      #$0, d0
3e1e: 102efeea                 move.b     -$116(a6), d0
3e22: 4a40                     tst.w      d0
3e24: 6f76                     ble.b      $3e9c
3e26: a850                     dc.w       $a850
3e28: 422e000c                 clr.b      $c(a6)
3e2c: 206dc030                 movea.l    -$3fd0(a5), a0
3e30: 2050                     movea.l    (a0), a0
3e32: 4228011a                 clr.b      $11a(a0)
3e36: 486efde2                 pea.l      -$21e(a6)
3e3a: 487a0086                 pea.l      $3ec2(pc)
3e3e: 486efeea                 pea.l      -$116(a6)
3e42: 3f3c0002                 move.w     #$2, -(a7)
3e46: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
3e4a: 584f                     addq.w     #$4, a7
3e4c: 486efde2                 pea.l      -$21e(a6)
3e50: 4ead005a                 jsr        $5a(a5) ; CODE 4 resource+0x0ae6
3e54: 302effea                 move.w     -$16(a6), d0
3e58: 48c0                     ext.l      d0
3e5a: 2f00                     move.l     d0, -(a7)
3e5c: 302effea                 move.w     -$16(a6), d0
3e60: 48c0                     ext.l      d0
3e62: 2f00                     move.l     d0, -(a7)
3e64: 206dc030                 movea.l    -$3fd0(a5), a0
3e68: 2050                     movea.l    (a0), a0
3e6a: 2f280002                 move.l     $2(a0), -(a7)
3e6e: a9d1                     dc.w       $a9d1
3e70: 594f                     subq.w     #$4, a7
3e72: a924                     dc.w       $a924
3e74: 245f                     movea.l    (a7)+, a2
3e76: 3007                     move.w     d7, d0
3e78: c1fc00a6                 muls.w     #$a6, d0
3e7c: 0640bf98                 addi.w     #$bf98, d0
3e80: 41f50000                 lea.l      (a5, d0.w), a0
3e84: 2648                     movea.l    a0, a3
3e86: b5cb                     cmpa.l     a3, a2
3e88: 6708                     beq.b      $3e92
3e8a: 2f0b                     move.l     a3, -(a7)
3e8c: a91f                     dc.w       $a91f
3e8e: 2f0b                     move.l     a3, -(a7)
3e90: a915                     dc.w       $a915
3e92: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
3e96: 4ead0092                 jsr        $92(a5) ; CODE 4 resource+0x1ac4
3e9a: 6012                     bra.b      $3eae
3e9c: 206dc030                 movea.l    -$3fd0(a5), a0
3ea0: 2050                     movea.l    (a0), a0
3ea2: 117c0001011a             move.b     #$1, $11a(a0)
3ea8: 1d7c0001000c             move.b     #$1, $c(a6)
3eae: 3f3c003e                 move.w     #$3e, -(a7)
3eb2: 4267                     clr.w      -(a7)
3eb4: 201f                     move.l     (a7)+, d0
3eb6: a032                     dc.w       $a032
3eb8: 4cdf1ce0                 movem.l    (a7)+, d5-d7/a2-a4
3ebc: 4e5e                     unlk       a6
3ebe: 2e9f                     move.l     (a7)+, (a7)
3ec0: 4e75                     rts        
3ec2: 1043                     .byte      0x10, 0x43
3ec4: 6f6d                     ble.b      $3f33
3ec6: 7069                     moveq      #$69, d0
3ec8: 6c65                     bge.b      $3f2f
3eca: 2045                     movea.l    d5, a0
3ecc: 7272                     moveq      #$72, d1
3ece: 6f72                     ble.b      $3f42
3ed0: 3a20                     move.w     -(a0), d5
3ed2: 2012                     move.l     (a2), d0
3ed4: 0c436f6d                 cmpi.w     #$6f6d, d3
3ed8: 7069                     moveq      #$69, d0
3eda: 6c69                     bge.b      $3f45
3edc: 6e67                     bgt.b      $3f45
3ede: 2e2e2e16                 move.l     $2e16(a6), d7
