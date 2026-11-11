; CODE 3, 20656 bytes, resource-relative hexadecimal offsets.
; Linear sweep: embedded data may decode as instructions. Verify control flow.
0004: 4e560000                 link.w     a6, #$0
0008: 4a6e0008                 tst.w      $8(a6)
000c: 6c08                     bge.b      $16
000e: 3d7cffff000a             move.w     #$ffff, $a(a6)
0014: 6012                     bra.b      $28
0016: 4a6e0008                 tst.w      $8(a6)
001a: 6f08                     ble.b      $24
001c: 3d7c0001000a             move.w     #$1, $a(a6)
0022: 6004                     bra.b      $28
0024: 426e000a                 clr.w      $a(a6)
0028: 4e5e                     unlk       a6
002a: 205f                     movea.l    (a7)+, a0
002c: 544f                     addq.w     #$2, a7
002e: 4ed0                     jmp        (a0)
0030: 4e560000                 link.w     a6, #$0
0034: 2f07                     move.l     d7, -(a7)
0036: 3e2e0008                 move.w     $8(a6), d7
003a: 4a47                     tst.w      d7
003c: 6c18                     bge.b      $56
003e: 48c7                     ext.l      d7
0040: 8ffc0168                 divs.w     #$168, d7
0044: 4847                     swap       d7
0046: 4a47                     tst.w      d7
0048: 6a02                     bpl.b      $4c
004a: 4447                     neg.w      d7
004c: 303c0168                 move.w     #$168, d0
0050: 9047                     sub.w      d7, d0
0052: 3e00                     move.w     d0, d7
0054: 600e                     bra.b      $64
0056: 0c470167                 cmpi.w     #$167, d7
005a: 6f08                     ble.b      $64
005c: 48c7                     ext.l      d7
005e: 8ffc0168                 divs.w     #$168, d7
0062: 4847                     swap       d7
0064: 0c4700b4                 cmpi.w     #$b4, d7
0068: 6c10                     bge.b      $7a
006a: 3007                     move.w     d7, d0
006c: d040                     add.w      d0, d0
006e: 0640f79a                 addi.w     #$f79a, d0
0072: 3d750000000a             move.w     (a5, d0.w), $a(a6)
0078: 6016                     bra.b      $90
007a: 3007                     move.w     d7, d0
007c: 0640ff4c                 addi.w     #$ff4c, d0
0080: d040                     add.w      d0, d0
0082: 0640f79a                 addi.w     #$f79a, d0
0086: 30350000                 move.w     (a5, d0.w), d0
008a: 4440                     neg.w      d0
008c: 3d40000a                 move.w     d0, $a(a6)
0090: 2e1f                     move.l     (a7)+, d7
0092: 4e5e                     unlk       a6
0094: 205f                     movea.l    (a7)+, a0
0096: 544f                     addq.w     #$2, a7
0098: 4ed0                     jmp        (a0)
009a: 4e560000                 link.w     a6, #$0
009e: 554f                     subq.w     #$2, a7
00a0: 302e0008                 move.w     $8(a6), d0
00a4: 0640005a                 addi.w     #$5a, d0
00a8: 3f00                     move.w     d0, -(a7)
00aa: 4ebaff84                 jsr        $30(pc)
00ae: 3d5f000a                 move.w     (a7)+, $a(a6)
00b2: 4e5e                     unlk       a6
00b4: 205f                     movea.l    (a7)+, a0
00b6: 544f                     addq.w     #$2, a7
00b8: 4ed0                     jmp        (a0)
00ba: 4e56ffec                 link.w     a6, #$ffec
00be: 48e70f00                 movem.l    d4-d7, -(a7)
00c2: 3a2e000a                 move.w     $a(a6), d5
00c6: 382e0008                 move.w     $8(a6), d4
00ca: 4a45                     tst.w      d5
00cc: 6a02                     bpl.b      $d0
00ce: 4445                     neg.w      d5
00d0: 4a44                     tst.w      d4
00d2: 6a02                     bpl.b      $d6
00d4: 4444                     neg.w      d4
00d6: 3c05                     move.w     d5, d6
00d8: dc44                     add.w      d4, d6
00da: ba44                     cmp.w      d4, d5
00dc: 670000e6                 beq.w      $1c4
00e0: 3e06                     move.w     d6, d7
00e2: cffc000a                 muls.w     #$a, d7
00e6: 3005                     move.w     d5, d0
00e8: 9044                     sub.w      d4, d0
00ea: 6a02                     bpl.b      $ee
00ec: 4440                     neg.w      d0
00ee: 48c7                     ext.l      d7
00f0: 8fc0                     divs.w     d0, d7
00f2: 0c470012                 cmpi.w     #$12, d7
00f6: 6c000078                 bge.w      $170
00fa: 0c47000b                 cmpi.w     #$b, d7
00fe: 6c14                     bge.b      $114
0100: 3e06                     move.w     d6, d7
0102: cffc003b                 muls.w     #$3b, d7
0106: 0647001e                 addi.w     #$1e, d7
010a: 48c7                     ext.l      d7
010c: 8ffc003c                 divs.w     #$3c, d7
0110: 600000c0                 bra.w      $1d2
0114: 0c47000c                 cmpi.w     #$c, d7
0118: 6c12                     bge.b      $12c
011a: 3e06                     move.w     d6, d7
011c: cffc000f                 muls.w     #$f, d7
0120: 5047                     addq.w     #$8, d7
0122: 48c7                     ext.l      d7
0124: 8ffc0010                 divs.w     #$10, d7
0128: 600000a8                 bra.w      $1d2
012c: 0c47000e                 cmpi.w     #$e, d7
0130: 6c14                     bge.b      $146
0132: 3e06                     move.w     d6, d7
0134: cffc0011                 muls.w     #$11, d7
0138: 06470009                 addi.w     #$9, d7
013c: 48c7                     ext.l      d7
013e: 8ffc0013                 divs.w     #$13, d7
0142: 6000008e                 bra.w      $1d2
0146: 0c470010                 cmpi.w     #$10, d7
014a: 6c14                     bge.b      $160
014c: 3e06                     move.w     d6, d7
014e: cffc0011                 muls.w     #$11, d7
0152: 0647000a                 addi.w     #$a, d7
0156: 48c7                     ext.l      d7
0158: 8ffc0014                 divs.w     #$14, d7
015c: 60000074                 bra.w      $1d2
0160: 3e06                     move.w     d6, d7
0162: cffc0009                 muls.w     #$9, d7
0166: 5c47                     addq.w     #$6, d7
0168: 48c7                     ext.l      d7
016a: 8ffc000b                 divs.w     #$b, d7
016e: 6062                     bra.b      $1d2
0170: 0c470014                 cmpi.w     #$14, d7
0174: 6c0e                     bge.b      $184
0176: 3e06                     move.w     d6, d7
0178: e747                     asl.w      #$3, d7
017a: 5a47                     addq.w     #$5, d7
017c: 48c7                     ext.l      d7
017e: 8ffc000a                 divs.w     #$a, d7
0182: 604e                     bra.b      $1d2
0184: 0c47001e                 cmpi.w     #$1e, d7
0188: 6c10                     bge.b      $19a
018a: 3e06                     move.w     d6, d7
018c: e947                     asl.w      #$4, d7
018e: 0647000a                 addi.w     #$a, d7
0192: 48c7                     ext.l      d7
0194: 8ffc0015                 divs.w     #$15, d7
0198: 6038                     bra.b      $1d2
019a: 0c470028                 cmpi.w     #$28, d7
019e: 6c12                     bge.b      $1b2
01a0: 3e06                     move.w     d6, d7
01a2: cffc0019                 muls.w     #$19, d7
01a6: 06470011                 addi.w     #$11, d7
01aa: 48c7                     ext.l      d7
01ac: 8ffc0022                 divs.w     #$22, d7
01b0: 6020                     bra.b      $1d2
01b2: 3e06                     move.w     d6, d7
01b4: cffc0012                 muls.w     #$12, d7
01b8: 0647000c                 addi.w     #$c, d7
01bc: 48c7                     ext.l      d7
01be: 8ffc0019                 divs.w     #$19, d7
01c2: 600e                     bra.b      $1d2
01c4: 3e05                     move.w     d5, d7
01c6: cffc000e                 muls.w     #$e, d7
01ca: 5a47                     addq.w     #$5, d7
01cc: 48c7                     ext.l      d7
01ce: 8ffc000a                 divs.w     #$a, d7
01d2: 3d47000c                 move.w     d7, $c(a6)
01d6: 4cdf00f0                 movem.l    (a7)+, d4-d7
01da: 4e5e                     unlk       a6
01dc: 2e9f                     move.l     (a7)+, (a7)
01de: 4e75                     rts        
01e0: 4e560000                 link.w     a6, #$0
01e4: 2f0c                     move.l     a4, -(a7)
01e6: 286e000a                 movea.l    $a(a6), a4
01ea: 4a6e0008                 tst.w      $8(a6)
01ee: 6704                     beq.b      $1f4
01f0: 426df904                 clr.w      -$6fc(a5)
01f4: 2054                     movea.l    (a4), a0
01f6: 30282284                 move.w     $2284(a0), d0
01fa: d06e0008                 add.w      $8(a6), d0
01fe: 2054                     movea.l    (a4), a0
0200: 31402284                 move.w     d0, $2284(a0)
0204: 2054                     movea.l    (a4), a0
0206: 30282284                 move.w     $2284(a0), d0
020a: c1fc0064                 muls.w     #$64, d0
020e: 2054                     movea.l    (a4), a0
0210: 48c0                     ext.l      d0
0212: 81e8227e                 divs.w     $227e(a0), d0
0216: 2054                     movea.l    (a4), a0
0218: 3140207a                 move.w     d0, $207a(a0)
021c: 2054                     movea.l    (a4), a0
021e: 302e0008                 move.w     $8(a6), d0
0222: 5240                     addq.w     #$1, d0
0224: 48c0                     ext.l      d0
0226: 81fc0002                 divs.w     #$2, d0
022a: d0682286                 add.w      $2286(a0), d0
022e: 2054                     movea.l    (a4), a0
0230: 31402286                 move.w     d0, $2286(a0)
0234: 285f                     movea.l    (a7)+, a4
0236: 4e5e                     unlk       a6
0238: 205f                     movea.l    (a7)+, a0
023a: 5c4f                     addq.w     #$6, a7
023c: 4ed0                     jmp        (a0)
023e: 4e56ffca                 link.w     a6, #$ffca
0242: 48e71f18                 movem.l    d3-d7/a3-a4, -(a7)
0246: 266e0008                 movea.l    $8(a6), a3
024a: 4244                     clr.w      d4
024c: 7c01                     moveq      #$1, d6
024e: 41edc375                 lea.l      -$3c8b(a5), a0
0252: 4a306000                 tst.b      (a0, d6.w)
0256: 670000ac                 beq.w      $304
025a: 3006                     move.w     d6, d0
025c: c1fc00a6                 muls.w     #$a6, d0
0260: 0640c030                 addi.w     #$c030, d0
0264: 28750000                 movea.l    (a5, d0.w), a4
0268: 2054                     movea.l    (a4), a0
026a: 30282072                 move.w     $2072(a0), d0
026e: 906e0010                 sub.w      $10(a6), d0
0272: 6a02                     bpl.b      $276
0274: 4440                     neg.w      d0
0276: 3d40ffe8                 move.w     d0, -$18(a6)
027a: 2054                     movea.l    (a4), a0
027c: 36282074                 move.w     $2074(a0), d3
0280: 966e000e                 sub.w      $e(a6), d3
0284: 6a02                     bpl.b      $288
0286: 4443                     neg.w      d3
0288: 302effe8                 move.w     -$18(a6), d0
028c: d043                     add.w      d3, d0
028e: 0c400018                 cmpi.w     #$18, d0
0292: 6c000070                 bge.w      $304
0296: 594f                     subq.w     #$4, a7
0298: 486effd6                 pea.l      -$2a(a6)
029c: 3a2effe8                 move.w     -$18(a6), d5
02a0: cbc5                     muls.w     d5, d5
02a2: 3003                     move.w     d3, d0
02a4: c1c0                     muls.w     d0, d0
02a6: da40                     add.w      d0, d5
02a8: 3d45ffd4                 move.w     d5, -$2c(a6)
02ac: 486effd4                 pea.l      -$2c(a6)
02b0: 486effca                 pea.l      -$36(a6)
02b4: 3f3c200e                 move.w     #$200e, -(a7)
02b8: a9eb                     dc.w       $a9eb
02ba: 486effca                 pea.l      -$36(a6)
02be: 4ead00f2                 jsr        $f2(a5) ; CODE 1 resource+0x01c0
02c2: 584f                     addq.w     #$4, a7
02c4: 486effd6                 pea.l      -$2a(a6)
02c8: 4ead0102                 jsr        $102(a5) ; CODE 1 resource+0x020a
02cc: 544f                     addq.w     #$2, a7
02ce: 3a1f                     move.w     (a7)+, d5
02d0: 0c45000f                 cmpi.w     #$f, d5
02d4: 6e2e                     bgt.b      $304
02d6: 0c450006                 cmpi.w     #$6, d5
02da: 6c04                     bge.b      $2e0
02dc: 7e14                     moveq      #$14, d7
02de: 6004                     bra.b      $2e4
02e0: 7e10                     moveq      #$10, d7
02e2: 9e45                     sub.w      d5, d7
02e4: 2f0c                     move.l     a4, -(a7)
02e6: 3f07                     move.w     d7, -(a7)
02e8: 4ebafef6                 jsr        $1e0(pc)
02ec: 2054                     movea.l    (a4), a0
02ee: 302e000c                 move.w     $c(a6), d0
02f2: b06822b4                 cmp.w      $22b4(a0), d0
02f6: 660a                     bne.b      $302
02f8: 3007                     move.w     d7, d0
02fa: 48c0                     ext.l      d0
02fc: d093                     add.l      (a3), d0
02fe: 2680                     move.l     d0, (a3)
0300: 6002                     bra.b      $304
0302: d847                     add.w      d7, d4
0304: 5246                     addq.w     #$1, d6
0306: 0c460005                 cmpi.w     #$5, d6
030a: 6f00ff42                 ble.w      $24e
030e: 3004                     move.w     d4, d0
0310: 48c0                     ext.l      d0
0312: 2d400012                 move.l     d0, $12(a6)
0316: 4cdf18f8                 movem.l    (a7)+, d3-d7/a3-a4
031a: 4e5e                     unlk       a6
031c: 205f                     movea.l    (a7)+, a0
031e: 4fef000a                 lea.l      $a(a7), a7
0322: 4ed0                     jmp        (a0)
0324: 4e56ffdc                 link.w     a6, #$ffdc
0328: 48e71f08                 movem.l    d3-d7/a4, -(a7)
032c: 286e0008                 movea.l    $8(a6), a4
0330: 206c000a                 movea.l    $a(a4), a0
0334: 4210                     clr.b      (a0)
0336: 3d7c0001ffee             move.w     #$1, -$12(a6)
033c: 302effee                 move.w     -$12(a6), d0
0340: 0640c375                 addi.w     #$c375, d0
0344: 4a350000                 tst.b      (a5, d0.w)
0348: 670001ba                 beq.w      $504
034c: 302effee                 move.w     -$12(a6), d0
0350: c1fc00a6                 muls.w     #$a6, d0
0354: 0640c030                 addi.w     #$c030, d0
0358: 29750000ffec             move.l     (a5, d0.w), -$14(a4)
035e: 206cffec                 movea.l    -$14(a4), a0
0362: 2050                     movea.l    (a0), a0
0364: 422822b6                 clr.b      $22b6(a0)
0368: 206cffec                 movea.l    -$14(a4), a0
036c: 2050                     movea.l    (a0), a0
036e: 30280120                 move.w     $120(a0), d0
0372: 6010                     bra.b      $384
0374: 3e3c07d0                 move.w     #$7d0, d7
0378: 383c00c8                 move.w     #$c8, d4
037c: 3d7c000affdc             move.w     #$a, -$24(a6)
0382: 6010                     bra.b      $394
0384: 67ee                     beq.b      $374
0386: 3e3c0fa0                 move.w     #$fa0, d7
038a: 383c0190                 move.w     #$190, d4
038e: 3d7c000affdc             move.w     #$a, -$24(a6)
0394: 206cffec                 movea.l    -$14(a4), a0
0398: 2050                     movea.l    (a0), a0
039a: 3d682276ffe8             move.w     $2276(a0), -$18(a6)
03a0: 206cffec                 movea.l    -$14(a4), a0
03a4: 2050                     movea.l    (a0), a0
03a6: 3d682278ffe6             move.w     $2278(a0), -$1a(a6)
03ac: 206cffec                 movea.l    -$14(a4), a0
03b0: 2050                     movea.l    (a0), a0
03b2: 3a282272                 move.w     $2272(a0), d5
03b6: 206cffec                 movea.l    -$14(a4), a0
03ba: 2050                     movea.l    (a0), a0
03bc: 3c282274                 move.w     $2274(a0), d6
03c0: 362effe8                 move.w     -$18(a6), d3
03c4: 9645                     sub.w      d5, d3
03c6: 4a43                     tst.w      d3
03c8: 5dc0                     slt.b      d0
03ca: 3207                     move.w     d7, d1
03cc: 4441                     neg.w      d1
03ce: ba41                     cmp.w      d1, d5
03d0: 5ec1                     sgt.b      d1
03d2: c001                     and.b      d1, d0
03d4: 6710                     beq.b      $3e6
03d6: 9a44                     sub.w      d4, d5
03d8: 3007                     move.w     d7, d0
03da: 4440                     neg.w      d0
03dc: ba40                     cmp.w      d0, d5
03de: 6c1a                     bge.b      $3fa
03e0: 3a07                     move.w     d7, d5
03e2: 4445                     neg.w      d5
03e4: 6014                     bra.b      $3fa
03e6: 4a43                     tst.w      d3
03e8: 5ec0                     sgt.b      d0
03ea: ba47                     cmp.w      d7, d5
03ec: 5dc1                     slt.b      d1
03ee: c001                     and.b      d1, d0
03f0: 6708                     beq.b      $3fa
03f2: da44                     add.w      d4, d5
03f4: ba47                     cmp.w      d7, d5
03f6: 6f02                     ble.b      $3fa
03f8: 3a07                     move.w     d7, d5
03fa: 362effe6                 move.w     -$1a(a6), d3
03fe: 9646                     sub.w      d6, d3
0400: 4a43                     tst.w      d3
0402: 5dc0                     slt.b      d0
0404: 3207                     move.w     d7, d1
0406: 4441                     neg.w      d1
0408: bc41                     cmp.w      d1, d6
040a: 5ec1                     sgt.b      d1
040c: c001                     and.b      d1, d0
040e: 6710                     beq.b      $420
0410: 9c44                     sub.w      d4, d6
0412: 3007                     move.w     d7, d0
0414: 4440                     neg.w      d0
0416: bc40                     cmp.w      d0, d6
0418: 6c1a                     bge.b      $434
041a: 3c07                     move.w     d7, d6
041c: 4446                     neg.w      d6
041e: 6014                     bra.b      $434
0420: 4a43                     tst.w      d3
0422: 5ec0                     sgt.b      d0
0424: bc47                     cmp.w      d7, d6
0426: 5dc1                     slt.b      d1
0428: c001                     and.b      d1, d0
042a: 6708                     beq.b      $434
042c: dc44                     add.w      d4, d6
042e: bc47                     cmp.w      d7, d6
0430: 6f02                     ble.b      $434
0432: 3c07                     move.w     d7, d6
0434: 206cffec                 movea.l    -$14(a4), a0
0438: 2050                     movea.l    (a0), a0
043a: 31452272                 move.w     d5, $2272(a0)
043e: 206cffec                 movea.l    -$14(a4), a0
0442: 2050                     movea.l    (a0), a0
0444: 31462274                 move.w     d6, $2274(a0)
0448: 206cffec                 movea.l    -$14(a4), a0
044c: 2050                     movea.l    (a0), a0
044e: 3d682080ffde             move.w     $2080(a0), -$22(a6)
0454: 206cffec                 movea.l    -$14(a4), a0
0458: 2050                     movea.l    (a0), a0
045a: 3028207c                 move.w     $207c(a0), d0
045e: 6a02                     bpl.b      $462
0460: 4440                     neg.w      d0
0462: 48c0                     ext.l      d0
0464: 81eeffdc                 divs.w     -$24(a6), d0
0468: 322effde                 move.w     -$22(a6), d1
046c: 9240                     sub.w      d0, d1
046e: 3941ffdc                 move.w     d1, -$24(a4)
0472: 206cffec                 movea.l    -$14(a4), a0
0476: 2050                     movea.l    (a0), a0
0478: 4a682082                 tst.w      $2082(a0)
047c: 670a                     beq.b      $488
047e: 302cffdc                 move.w     -$24(a4), d0
0482: 5140                     subq.w     #$8, d0
0484: 3940ffdc                 move.w     d0, -$24(a4)
0488: 4a6cffdc                 tst.w      -$24(a4)
048c: 6e5c                     bgt.b      $4ea
048e: 426cffdc                 clr.w      -$24(a4)
0492: 206cffec                 movea.l    -$14(a4), a0
0496: 2050                     movea.l    (a0), a0
0498: 102822d8                 move.b     $22d8(a0), d0
049c: 5300                     subq.b     #$1, d0
049e: 674a                     beq.b      $4ea
04a0: 206cffec                 movea.l    -$14(a4), a0
04a4: 2050                     movea.l    (a0), a0
04a6: 117c000122d8             move.b     #$1, $22d8(a0)
04ac: 206cffec                 movea.l    -$14(a4), a0
04b0: 2050                     movea.l    (a0), a0
04b2: 42682082                 clr.w      $2082(a0)
04b6: 206cffec                 movea.l    -$14(a4), a0
04ba: 2050                     movea.l    (a0), a0
04bc: 202822d0                 move.l     $22d0(a0), d0
04c0: 5280                     addq.l     #$1, d0
04c2: 206cffec                 movea.l    -$14(a4), a0
04c6: 2050                     movea.l    (a0), a0
04c8: 214022d0                 move.l     d0, $22d0(a0)
04cc: 206cffec                 movea.l    -$14(a4), a0
04d0: 2050                     movea.l    (a0), a0
04d2: 4268207c                 clr.w      $207c(a0)
04d6: 206cffec                 movea.l    -$14(a4), a0
04da: 2050                     movea.l    (a0), a0
04dc: 42682276                 clr.w      $2276(a0)
04e0: 206cffec                 movea.l    -$14(a4), a0
04e4: 2050                     movea.l    (a0), a0
04e6: 42682278                 clr.w      $2278(a0)
04ea: 302cffdc                 move.w     -$24(a4), d0
04ee: b06effde                 cmp.w      -$22(a6), d0
04f2: 6704                     beq.b      $4f8
04f4: 426df904                 clr.w      -$6fc(a5)
04f8: 206cffec                 movea.l    -$14(a4), a0
04fc: 2050                     movea.l    (a0), a0
04fe: 316cffdc2080             move.w     -$24(a4), $2080(a0)
0504: 526effee                 addq.w     #$1, -$12(a6)
0508: 0c6e0005ffee             cmpi.w     #$5, -$12(a6)
050e: 6f00fe2c                 ble.w      $33c
0512: 4cdf10f8                 movem.l    (a7)+, d3-d7/a4
0516: 4e5e                     unlk       a6
0518: 2e9f                     move.l     (a7)+, (a7)
051a: 4e75                     rts        
051c: 4e56ffe8                 link.w     a6, #$ffe8
0520: 48e70f08                 movem.l    d4-d7/a4, -(a7)
0524: 286e0008                 movea.l    $8(a6), a4
0528: 382cffd6                 move.w     -$2a(a4), d4
052c: 986cffd2                 sub.w      -$2e(a4), d4
0530: 3a2cffd4                 move.w     -$2c(a4), d5
0534: 9a6cffd0                 sub.w      -$30(a4), d5
0538: 206cffec                 movea.l    -$14(a4), a0
053c: 2050                     movea.l    (a0), a0
053e: 226cffe8                 movea.l    -$18(a4), a1
0542: 2251                     movea.l    (a1), a1
0544: 3c282072                 move.w     $2072(a0), d6
0548: 9c692072                 sub.w      $2072(a1), d6
054c: 206cffec                 movea.l    -$14(a4), a0
0550: 2050                     movea.l    (a0), a0
0552: 226cffe8                 movea.l    -$18(a4), a1
0556: 2251                     movea.l    (a1), a1
0558: 3e282074                 move.w     $2074(a0), d7
055c: 9e692074                 sub.w      $2074(a1), d7
0560: 1d7c0001000c             move.b     #$1, $c(a6)
0566: 4a44                     tst.w      d4
0568: 5fc0                     sle.b      d0
056a: 0c46fff5                 cmpi.w     #$fff5, d6
056e: 5fc1                     sle.b      d1
0570: c001                     and.b      d1, d0
0572: 4a44                     tst.w      d4
0574: 5cc1                     sge.b      d1
0576: 0c46000b                 cmpi.w     #$b, d6
057a: 5cc2                     sge.b      d2
057c: c202                     and.b      d2, d1
057e: 8001                     or.b       d1, d0
0580: 6704                     beq.b      $586
0582: 422e000c                 clr.b      $c(a6)
0586: 4a45                     tst.w      d5
0588: 5fc0                     sle.b      d0
058a: 0c47fff5                 cmpi.w     #$fff5, d7
058e: 5fc1                     sle.b      d1
0590: c001                     and.b      d1, d0
0592: 4a45                     tst.w      d5
0594: 5cc1                     sge.b      d1
0596: 0c47000b                 cmpi.w     #$b, d7
059a: 5cc2                     sge.b      d2
059c: c202                     and.b      d2, d1
059e: 8001                     or.b       d1, d0
05a0: 6704                     beq.b      $5a6
05a2: 422e000c                 clr.b      $c(a6)
05a6: 4cdf10f0                 movem.l    (a7)+, d4-d7/a4
05aa: 4e5e                     unlk       a6
05ac: 2e9f                     move.l     (a7)+, (a7)
05ae: 4e75                     rts        
05b0: 4e56ffe0                 link.w     a6, #$ffe0
05b4: 48e71f08                 movem.l    d3-d7/a4, -(a7)
05b8: 286e0008                 movea.l    $8(a6), a4
05bc: 382cffd2                 move.w     -$2e(a4), d4
05c0: 3a2cffd0                 move.w     -$30(a4), d5
05c4: 206cffe8                 movea.l    -$18(a4), a0
05c8: 2050                     movea.l    (a0), a0
05ca: 4a2822b6                 tst.b      $22b6(a0)
05ce: 6704                     beq.b      $5d4
05d0: 4244                     clr.w      d4
05d2: 4245                     clr.w      d5
05d4: 302cffd6                 move.w     -$2a(a4), d0
05d8: 9044                     sub.w      d4, d0
05da: 3d40ffee                 move.w     d0, -$12(a6)
05de: 302cffd4                 move.w     -$2c(a4), d0
05e2: 9045                     sub.w      d5, d0
05e4: 3d40ffec                 move.w     d0, -$14(a6)
05e8: 206cffec                 movea.l    -$14(a4), a0
05ec: 2050                     movea.l    (a0), a0
05ee: 226cffe8                 movea.l    -$18(a4), a1
05f2: 2251                     movea.l    (a1), a1
05f4: 30282072                 move.w     $2072(a0), d0
05f8: 90692072                 sub.w      $2072(a1), d0
05fc: 3d40ffea                 move.w     d0, -$16(a6)
0600: 206cffec                 movea.l    -$14(a4), a0
0604: 2050                     movea.l    (a0), a0
0606: 226cffe8                 movea.l    -$18(a4), a1
060a: 2251                     movea.l    (a1), a1
060c: 36282074                 move.w     $2074(a0), d3
0610: 96692074                 sub.w      $2074(a1), d3
0614: 302effea                 move.w     -$16(a6), d0
0618: 6a02                     bpl.b      $61c
061a: 4440                     neg.w      d0
061c: 0c40000b                 cmpi.w     #$b, d0
0620: 5dc0                     slt.b      d0
0622: 4a6effee                 tst.w      -$12(a6)
0626: 57c1                     seq.b      d1
0628: 8001                     or.b       d1, d0
062a: 6704                     beq.b      $630
062c: 4246                     clr.w      d6
062e: 601c                     bra.b      $64c
0630: 3c2effea                 move.w     -$16(a6), d6
0634: 6a02                     bpl.b      $638
0636: 4446                     neg.w      d6
0638: 0646fff5                 addi.w     #$fff5, d6
063c: cdfc03e8                 muls.w     #$3e8, d6
0640: 302effee                 move.w     -$12(a6), d0
0644: 6a02                     bpl.b      $648
0646: 4440                     neg.w      d0
0648: 48c6                     ext.l      d6
064a: 8dc0                     divs.w     d0, d6
064c: 3003                     move.w     d3, d0
064e: 6a02                     bpl.b      $652
0650: 4440                     neg.w      d0
0652: 0c40000b                 cmpi.w     #$b, d0
0656: 5dc0                     slt.b      d0
0658: 4a6effec                 tst.w      -$14(a6)
065c: 57c1                     seq.b      d1
065e: 8001                     or.b       d1, d0
0660: 6704                     beq.b      $666
0662: 4247                     clr.w      d7
0664: 601a                     bra.b      $680
0666: 3e03                     move.w     d3, d7
0668: 6a02                     bpl.b      $66c
066a: 4447                     neg.w      d7
066c: 0647fff5                 addi.w     #$fff5, d7
0670: cffc03e8                 muls.w     #$3e8, d7
0674: 302effec                 move.w     -$14(a6), d0
0678: 6a02                     bpl.b      $67c
067a: 4440                     neg.w      d0
067c: 48c7                     ext.l      d7
067e: 8fc0                     divs.w     d0, d7
0680: bc47                     cmp.w      d7, d6
0682: 6f0c                     ble.b      $690
0684: 197c0001ff8e             move.b     #$1, -$72(a4)
068a: 3d46000c                 move.w     d6, $c(a6)
068e: 6008                     bra.b      $698
0690: 422cff8e                 clr.b      -$72(a4)
0694: 3d47000c                 move.w     d7, $c(a6)
0698: 4cdf10f8                 movem.l    (a7)+, d3-d7/a4
069c: 4e5e                     unlk       a6
069e: 2e9f                     move.l     (a7)+, (a7)
06a0: 4e75                     rts        
06a2: 4e560000                 link.w     a6, #$0
06a6: 2f0c                     move.l     a4, -(a7)
06a8: 286e000c                 movea.l    $c(a6), a4
06ac: 426c1f60                 clr.w      $1f60(a4)
06b0: 426c2156                 clr.w      $2156(a4)
06b4: 426c2158                 clr.w      $2158(a4)
06b8: 426c215a                 clr.w      $215a(a4)
06bc: 426c215c                 clr.w      $215c(a4)
06c0: 285f                     movea.l    (a7)+, a4
06c2: 4e5e                     unlk       a6
06c4: 205f                     movea.l    (a7)+, a0
06c6: 504f                     addq.w     #$8, a7
06c8: 4ed0                     jmp        (a0)
06ca: 4e56ffee                 link.w     a6, #$ffee
06ce: 2f0c                     move.l     a4, -(a7)
06d0: 286e0008                 movea.l    $8(a6), a4
06d4: 554f                     subq.w     #$2, a7
06d6: 206dbe26                 movea.l    -$41da(a5), a0
06da: 48680010                 pea.l      $10(a0)
06de: 302cffde                 move.w     -$22(a4), d0
06e2: e740                     asl.w      #$3, d0
06e4: 48740092                 pea.l      -$6e(a4, d0.w)
06e8: 486cff92                 pea.l      -$6e(a4)
06ec: a8aa                     dc.w       $a8aa
06ee: 1d5fffef                 move.b     (a7)+, -$11(a6)
06f2: 554f                     subq.w     #$2, a7
06f4: 486cff92                 pea.l      -$6e(a4)
06f8: 302cffde                 move.w     -$22(a4), d0
06fc: e740                     asl.w      #$3, d0
06fe: 48740092                 pea.l      -$6e(a4, d0.w)
0702: a8a6                     dc.w       $a8a6
0704: 101f                     move.b     (a7)+, d0
0706: 5300                     subq.b     #$1, d0
0708: 6700016e                 beq.w      $878
070c: 397c7fffffd8             move.w     #$7fff, -$28(a4)
0712: 302cffde                 move.w     -$22(a4), d0
0716: e740                     asl.w      #$3, d0
0718: 4a740092                 tst.w      -$6e(a4, d0.w)
071c: 6c32                     bge.b      $750
071e: 302cffd4                 move.w     -$2c(a4), d0
0722: 6a02                     bpl.b      $726
0724: 4440                     neg.w      d0
0726: 322cffde                 move.w     -$22(a4), d1
072a: e741                     asl.w      #$3, d1
072c: 32341092                 move.w     -$6e(a4, d1.w), d1
0730: 6a02                     bpl.b      $734
0732: 4441                     neg.w      d1
0734: 9041                     sub.w      d1, d0
0736: 6a02                     bpl.b      $73a
0738: 4440                     neg.w      d0
073a: c1fc03e8                 muls.w     #$3e8, d0
073e: 322cffd4                 move.w     -$2c(a4), d1
0742: 6a02                     bpl.b      $746
0744: 4441                     neg.w      d1
0746: 48c0                     ext.l      d0
0748: 81c1                     divs.w     d1, d0
074a: 3940ffd8                 move.w     d0, -$28(a4)
074e: 604c                     bra.b      $79c
0750: 302cffde                 move.w     -$22(a4), d0
0754: e740                     asl.w      #$3, d0
0756: 206dbe26                 movea.l    -$41da(a5), a0
075a: 30340096                 move.w     -$6a(a4, d0.w), d0
075e: b0680014                 cmp.w      $14(a0), d0
0762: 6f38                     ble.b      $79c
0764: 302cffd4                 move.w     -$2c(a4), d0
0768: 6a02                     bpl.b      $76c
076a: 4440                     neg.w      d0
076c: 322cffde                 move.w     -$22(a4), d1
0770: e741                     asl.w      #$3, d1
0772: 206dbe26                 movea.l    -$41da(a5), a0
0776: 32341096                 move.w     -$6a(a4, d1.w), d1
077a: 92680014                 sub.w      $14(a0), d1
077e: 6a02                     bpl.b      $782
0780: 4441                     neg.w      d1
0782: 9041                     sub.w      d1, d0
0784: 6a02                     bpl.b      $788
0786: 4440                     neg.w      d0
0788: c1fc03e8                 muls.w     #$3e8, d0
078c: 322cffd4                 move.w     -$2c(a4), d1
0790: 6a02                     bpl.b      $794
0792: 4441                     neg.w      d1
0794: 48c0                     ext.l      d0
0796: 81c1                     divs.w     d1, d0
0798: 3940ffd8                 move.w     d0, -$28(a4)
079c: 302cffd8                 move.w     -$28(a4), d0
07a0: b06cffda                 cmp.w      -$26(a4), d0
07a4: 6c1c                     bge.b      $7c2
07a6: 396cffd8ffda             move.w     -$28(a4), -$26(a4)
07ac: 296cffecffe4             move.l     -$14(a4), -$1c(a4)
07b2: 396cffd6ffca             move.w     -$2a(a4), -$36(a4)
07b8: 396cffd4ffc6             move.w     -$2c(a4), -$3a(a4)
07be: 42acffe0                 clr.l      -$20(a4)
07c2: 397c7fffffd8             move.w     #$7fff, -$28(a4)
07c8: 302cffde                 move.w     -$22(a4), d0
07cc: e740                     asl.w      #$3, d0
07ce: 4a740094                 tst.w      -$6c(a4, d0.w)
07d2: 6c32                     bge.b      $806
07d4: 302cffd6                 move.w     -$2a(a4), d0
07d8: 6a02                     bpl.b      $7dc
07da: 4440                     neg.w      d0
07dc: 322cffde                 move.w     -$22(a4), d1
07e0: e741                     asl.w      #$3, d1
07e2: 32341094                 move.w     -$6c(a4, d1.w), d1
07e6: 6a02                     bpl.b      $7ea
07e8: 4441                     neg.w      d1
07ea: 9041                     sub.w      d1, d0
07ec: 6a02                     bpl.b      $7f0
07ee: 4440                     neg.w      d0
07f0: c1fc03e8                 muls.w     #$3e8, d0
07f4: 322cffd6                 move.w     -$2a(a4), d1
07f8: 6a02                     bpl.b      $7fc
07fa: 4441                     neg.w      d1
07fc: 48c0                     ext.l      d0
07fe: 81c1                     divs.w     d1, d0
0800: 3940ffd8                 move.w     d0, -$28(a4)
0804: 604c                     bra.b      $852
0806: 302cffde                 move.w     -$22(a4), d0
080a: e740                     asl.w      #$3, d0
080c: 206dbe26                 movea.l    -$41da(a5), a0
0810: 30340098                 move.w     -$68(a4, d0.w), d0
0814: b0680016                 cmp.w      $16(a0), d0
0818: 6f38                     ble.b      $852
081a: 302cffd6                 move.w     -$2a(a4), d0
081e: 6a02                     bpl.b      $822
0820: 4440                     neg.w      d0
0822: 322cffde                 move.w     -$22(a4), d1
0826: e741                     asl.w      #$3, d1
0828: 206dbe26                 movea.l    -$41da(a5), a0
082c: 32341098                 move.w     -$68(a4, d1.w), d1
0830: 92680016                 sub.w      $16(a0), d1
0834: 6a02                     bpl.b      $838
0836: 4441                     neg.w      d1
0838: 9041                     sub.w      d1, d0
083a: 6a02                     bpl.b      $83e
083c: 4440                     neg.w      d0
083e: c1fc03e8                 muls.w     #$3e8, d0
0842: 322cffd6                 move.w     -$2a(a4), d1
0846: 6a02                     bpl.b      $84a
0848: 4441                     neg.w      d1
084a: 48c0                     ext.l      d0
084c: 81c1                     divs.w     d1, d0
084e: 3940ffd8                 move.w     d0, -$28(a4)
0852: 302cffd8                 move.w     -$28(a4), d0
0856: b06cffda                 cmp.w      -$26(a4), d0
085a: 6c1c                     bge.b      $878
085c: 396cffd8ffda             move.w     -$28(a4), -$26(a4)
0862: 296cffecffe4             move.l     -$14(a4), -$1c(a4)
0868: 396cffd6ffca             move.w     -$2a(a4), -$36(a4)
086e: 396cffd4ffc6             move.w     -$2c(a4), -$3a(a4)
0874: 42acffe0                 clr.l      -$20(a4)
0878: 285f                     movea.l    (a7)+, a4
087a: 4e5e                     unlk       a6
087c: 2e9f                     move.l     (a7)+, (a7)
087e: 4e75                     rts        
0880: 4e56ff8e                 link.w     a6, #$ff8e
0884: 48e71f00                 movem.l    d3-d7, -(a7)
0888: 2f0e                     move.l     a6, -(a7)
088a: 4ebafa98                 jsr        $324(pc)
088e: 3d7c7fffffda             move.w     #$7fff, -$26(a6)
0894: 3d7c0001ffde             move.w     #$1, -$22(a6)
089a: 302effde                 move.w     -$22(a6), d0
089e: 0640c375                 addi.w     #$c375, d0
08a2: 4a350000                 tst.b      (a5, d0.w)
08a6: 67000220                 beq.w      $ac8
08aa: 302effde                 move.w     -$22(a6), d0
08ae: c1fc00a6                 muls.w     #$a6, d0
08b2: 0640c030                 addi.w     #$c030, d0
08b6: 2d750000ffec             move.l     (a5, d0.w), -$14(a6)
08bc: 206effec                 movea.l    -$14(a6), a0
08c0: 2050                     movea.l    (a0), a0
08c2: 102822b6                 move.b     $22b6(a0), d0
08c6: 5300                     subq.b     #$1, d0
08c8: 670001fe                 beq.w      $ac8
08cc: 206effec                 movea.l    -$14(a6), a0
08d0: 2050                     movea.l    (a0), a0
08d2: 226effec                 movea.l    -$14(a6), a1
08d6: 2251                     movea.l    (a1), a1
08d8: 3028227a                 move.w     $227a(a0), d0
08dc: d0692272                 add.w      $2272(a1), d0
08e0: 48c0                     ext.l      d0
08e2: 81fc03e8                 divs.w     #$3e8, d0
08e6: 3d40ffd6                 move.w     d0, -$2a(a6)
08ea: 206effec                 movea.l    -$14(a6), a0
08ee: 2050                     movea.l    (a0), a0
08f0: 226effec                 movea.l    -$14(a6), a1
08f4: 2251                     movea.l    (a1), a1
08f6: 3028227a                 move.w     $227a(a0), d0
08fa: d0692272                 add.w      $2272(a1), d0
08fe: 322effd6                 move.w     -$2a(a6), d1
0902: c3fc03e8                 muls.w     #$3e8, d1
0906: 9041                     sub.w      d1, d0
0908: 206effec                 movea.l    -$14(a6), a0
090c: 2050                     movea.l    (a0), a0
090e: 3140227a                 move.w     d0, $227a(a0)
0912: 206effec                 movea.l    -$14(a6), a0
0916: 2050                     movea.l    (a0), a0
0918: 226effec                 movea.l    -$14(a6), a1
091c: 2251                     movea.l    (a1), a1
091e: 3028227c                 move.w     $227c(a0), d0
0922: d0692274                 add.w      $2274(a1), d0
0926: 48c0                     ext.l      d0
0928: 81fc03e8                 divs.w     #$3e8, d0
092c: 3d40ffd4                 move.w     d0, -$2c(a6)
0930: 206effec                 movea.l    -$14(a6), a0
0934: 2050                     movea.l    (a0), a0
0936: 226effec                 movea.l    -$14(a6), a1
093a: 2251                     movea.l    (a1), a1
093c: 3028227c                 move.w     $227c(a0), d0
0940: d0692274                 add.w      $2274(a1), d0
0944: 322effd4                 move.w     -$2c(a6), d1
0948: c3fc03e8                 muls.w     #$3e8, d1
094c: 9041                     sub.w      d1, d0
094e: 206effec                 movea.l    -$14(a6), a0
0952: 2050                     movea.l    (a0), a0
0954: 3140227c                 move.w     d0, $227c(a0)
0958: 206effec                 movea.l    -$14(a6), a0
095c: 2050                     movea.l    (a0), a0
095e: 302effde                 move.w     -$22(a6), d0
0962: e740                     asl.w      #$3, d0
0964: 41e822a4                 lea.l      $22a4(a0), a0
0968: 43f60092                 lea.l      -$6e(a6, d0.w), a1
096c: 22d8                     move.l     (a0)+, (a1)+
096e: 22d8                     move.l     (a0)+, (a1)+
0970: 302effde                 move.w     -$22(a6), d0
0974: e740                     asl.w      #$3, d0
0976: 48760092                 pea.l      -$6e(a6, d0.w)
097a: 3f2effd6                 move.w     -$2a(a6), -(a7)
097e: 3f2effd4                 move.w     -$2c(a6), -(a7)
0982: a8a8                     dc.w       $a8a8
0984: 2f0e                     move.l     a6, -(a7)
0986: 4ebafd42                 jsr        $6ca(pc)
098a: 3d7c0001ffdc             move.w     #$1, -$24(a6)
0990: 302effde                 move.w     -$22(a6), d0
0994: b06effdc                 cmp.w      -$24(a6), d0
0998: 56c0                     sne.b      d0
099a: 322effdc                 move.w     -$24(a6), d1
099e: 0641c375                 addi.w     #$c375, d1
09a2: c0351000                 and.b      (a5, d1.w), d0
09a6: 67000112                 beq.w      $aba
09aa: 302effdc                 move.w     -$24(a6), d0
09ae: c1fc00a6                 muls.w     #$a6, d0
09b2: 0640c030                 addi.w     #$c030, d0
09b6: 2d750000ffe8             move.l     (a5, d0.w), -$18(a6)
09bc: 206effe8                 movea.l    -$18(a6), a0
09c0: 2050                     movea.l    (a0), a0
09c2: 226effe8                 movea.l    -$18(a6), a1
09c6: 2251                     movea.l    (a1), a1
09c8: 3028227a                 move.w     $227a(a0), d0
09cc: d0692272                 add.w      $2272(a1), d0
09d0: 48c0                     ext.l      d0
09d2: 81fc03e8                 divs.w     #$3e8, d0
09d6: 3d40ffd2                 move.w     d0, -$2e(a6)
09da: 206effe8                 movea.l    -$18(a6), a0
09de: 2050                     movea.l    (a0), a0
09e0: 226effe8                 movea.l    -$18(a6), a1
09e4: 2251                     movea.l    (a1), a1
09e6: 3028227c                 move.w     $227c(a0), d0
09ea: d0692274                 add.w      $2274(a1), d0
09ee: 48c0                     ext.l      d0
09f0: 81fc03e8                 divs.w     #$3e8, d0
09f4: 3d40ffd0                 move.w     d0, -$30(a6)
09f8: 554f                     subq.w     #$2, a7
09fa: 302effde                 move.w     -$22(a6), d0
09fe: e740                     asl.w      #$3, d0
0a00: 48760092                 pea.l      -$6e(a6, d0.w)
0a04: 206effe8                 movea.l    -$18(a6), a0
0a08: 2050                     movea.l    (a0), a0
0a0a: 486822a4                 pea.l      $22a4(a0)
0a0e: 486eff92                 pea.l      -$6e(a6)
0a12: a8aa                     dc.w       $a8aa
0a14: 1d5fff91                 move.b     (a7)+, -$6f(a6)
0a18: 422eff90                 clr.b      -$70(a6)
0a1c: 206effe8                 movea.l    -$18(a6), a0
0a20: 2050                     movea.l    (a0), a0
0a22: 102822b6                 move.b     $22b6(a0), d0
0a26: 5300                     subq.b     #$1, d0
0a28: 322effdc                 move.w     -$24(a6), d1
0a2c: b26effde                 cmp.w      -$22(a6), d1
0a30: 5dc1                     slt.b      d1
0a32: c001                     and.b      d1, d0
0a34: 6720                     beq.b      $a56
0a36: 554f                     subq.w     #$2, a7
0a38: 302effde                 move.w     -$22(a6), d0
0a3c: e740                     asl.w      #$3, d0
0a3e: 48760092                 pea.l      -$6e(a6, d0.w)
0a42: 302effdc                 move.w     -$24(a6), d0
0a46: e740                     asl.w      #$3, d0
0a48: 48760092                 pea.l      -$6e(a6, d0.w)
0a4c: 486eff92                 pea.l      -$6e(a6)
0a50: a8aa                     dc.w       $a8aa
0a52: 1d5fff90                 move.b     (a7)+, -$70(a6)
0a56: 206effe8                 movea.l    -$18(a6), a0
0a5a: 2050                     movea.l    (a0), a0
0a5c: 2f08                     move.l     a0, -(a7)
0a5e: 554f                     subq.w     #$2, a7
0a60: 2f0e                     move.l     a6, -(a7)
0a62: 4ebafab8                 jsr        $51c(pc)
0a66: 101f                     move.b     (a7)+, d0
0a68: 205f                     movea.l    (a7)+, a0
0a6a: 802822b6                 or.b       $22b6(a0), d0
0a6e: c02eff91                 and.b      -$6f(a6), d0
0a72: 802eff90                 or.b       -$70(a6), d0
0a76: 6742                     beq.b      $aba
0a78: 554f                     subq.w     #$2, a7
0a7a: 2f0e                     move.l     a6, -(a7)
0a7c: 4ebafb32                 jsr        $5b0(pc)
0a80: 3d5fffd8                 move.w     (a7)+, -$28(a6)
0a84: 302effd8                 move.w     -$28(a6), d0
0a88: b06effda                 cmp.w      -$26(a6), d0
0a8c: 6c2c                     bge.b      $aba
0a8e: 3d6effd8ffda             move.w     -$28(a6), -$26(a6)
0a94: 2d6effecffe4             move.l     -$14(a6), -$1c(a6)
0a9a: 3d6effd6ffca             move.w     -$2a(a6), -$36(a6)
0aa0: 3d6effd4ffc6             move.w     -$2c(a6), -$3a(a6)
0aa6: 2d6effe8ffe0             move.l     -$18(a6), -$20(a6)
0aac: 362effd2                 move.w     -$2e(a6), d3
0ab0: 382effd0                 move.w     -$30(a6), d4
0ab4: 1d6eff8eff8f             move.b     -$72(a6), -$71(a6)
0aba: 526effdc                 addq.w     #$1, -$24(a6)
0abe: 0c6e0005ffdc             cmpi.w     #$5, -$24(a6)
0ac4: 6f00feca                 ble.w      $990
0ac8: 526effde                 addq.w     #$1, -$22(a6)
0acc: 0c6e0005ffde             cmpi.w     #$5, -$22(a6)
0ad2: 6f00fdc6                 ble.w      $89a
0ad6: 0c6e7fffffda             cmpi.w     #$7fff, -$26(a6)
0adc: 670001f8                 beq.w      $cd6
0ae0: 206e000a                 movea.l    $a(a6), a0
0ae4: 10bc0001                 move.b     #$1, (a0)
0ae8: 3a2effca                 move.w     -$36(a6), d5
0aec: cbeeffda                 muls.w     -$26(a6), d5
0af0: 554f                     subq.w     #$2, a7
0af2: 3f2effca                 move.w     -$36(a6), -(a7)
0af6: 4ebaf50c                 jsr        $4(pc)
0afa: 301f                     move.w     (a7)+, d0
0afc: c1fc0226                 muls.w     #$226, d0
0b00: da40                     add.w      d0, d5
0b02: 48c5                     ext.l      d5
0b04: 8bfc03e8                 divs.w     #$3e8, d5
0b08: 3c2effc6                 move.w     -$3a(a6), d6
0b0c: cdeeffda                 muls.w     -$26(a6), d6
0b10: 554f                     subq.w     #$2, a7
0b12: 3f2effc6                 move.w     -$3a(a6), -(a7)
0b16: 4ebaf4ec                 jsr        $4(pc)
0b1a: 301f                     move.w     (a7)+, d0
0b1c: c1fc0226                 muls.w     #$226, d0
0b20: dc40                     add.w      d0, d6
0b22: 48c6                     ext.l      d6
0b24: 8dfc03e8                 divs.w     #$3e8, d6
0b28: 206effe4                 movea.l    -$1c(a6), a0
0b2c: 2050                     movea.l    (a0), a0
0b2e: 486822a4                 pea.l      $22a4(a0)
0b32: 3f05                     move.w     d5, -(a7)
0b34: 3f06                     move.w     d6, -(a7)
0b36: a8a8                     dc.w       $a8a8
0b38: 206effe4                 movea.l    -$1c(a6), a0
0b3c: 2050                     movea.l    (a0), a0
0b3e: 30282072                 move.w     $2072(a0), d0
0b42: d045                     add.w      d5, d0
0b44: 206effe4                 movea.l    -$1c(a6), a0
0b48: 2050                     movea.l    (a0), a0
0b4a: 31402072                 move.w     d0, $2072(a0)
0b4e: 206effe4                 movea.l    -$1c(a6), a0
0b52: 2050                     movea.l    (a0), a0
0b54: 30282074                 move.w     $2074(a0), d0
0b58: d046                     add.w      d6, d0
0b5a: 206effe4                 movea.l    -$1c(a6), a0
0b5e: 2050                     movea.l    (a0), a0
0b60: 31402074                 move.w     d0, $2074(a0)
0b64: 206effe4                 movea.l    -$1c(a6), a0
0b68: 2050                     movea.l    (a0), a0
0b6a: 117c000122b6             move.b     #$1, $22b6(a0)
0b70: 554f                     subq.w     #$2, a7
0b72: 206effe4                 movea.l    -$1c(a6), a0
0b76: 2050                     movea.l    (a0), a0
0b78: 3e282272                 move.w     $2272(a0), d7
0b7c: 48c7                     ext.l      d7
0b7e: 8ffc0064                 divs.w     #$64, d7
0b82: 3f07                     move.w     d7, -(a7)
0b84: 206effe4                 movea.l    -$1c(a6), a0
0b88: 2050                     movea.l    (a0), a0
0b8a: 30282274                 move.w     $2274(a0), d0
0b8e: 48c0                     ext.l      d0
0b90: 81fc0064                 divs.w     #$64, d0
0b94: 3f00                     move.w     d0, -(a7)
0b96: 4ebaf522                 jsr        $ba(pc)
0b9a: 301f                     move.w     (a7)+, d0
0b9c: 48c0                     ext.l      d0
0b9e: 81fc0006                 divs.w     #$6, d0
0ba2: 3e00                     move.w     d0, d7
0ba4: 4aaeffe0                 tst.l      -$20(a6)
0ba8: 670000f6                 beq.w      $ca0
0bac: 206effe0                 movea.l    -$20(a6), a0
0bb0: 2050                     movea.l    (a0), a0
0bb2: 102822b6                 move.b     $22b6(a0), d0
0bb6: 5300                     subq.b     #$1, d0
0bb8: 6774                     beq.b      $c2e
0bba: 3a03                     move.w     d3, d5
0bbc: cbeeffda                 muls.w     -$26(a6), d5
0bc0: 554f                     subq.w     #$2, a7
0bc2: 3f03                     move.w     d3, -(a7)
0bc4: 4ebaf43e                 jsr        $4(pc)
0bc8: 301f                     move.w     (a7)+, d0
0bca: c1fc01f3                 muls.w     #$1f3, d0
0bce: da40                     add.w      d0, d5
0bd0: 48c5                     ext.l      d5
0bd2: 8bfc03e8                 divs.w     #$3e8, d5
0bd6: 3c04                     move.w     d4, d6
0bd8: cdeeffda                 muls.w     -$26(a6), d6
0bdc: 554f                     subq.w     #$2, a7
0bde: 3f04                     move.w     d4, -(a7)
0be0: 4ebaf422                 jsr        $4(pc)
0be4: 301f                     move.w     (a7)+, d0
0be6: c1fc01f3                 muls.w     #$1f3, d0
0bea: dc40                     add.w      d0, d6
0bec: 48c6                     ext.l      d6
0bee: 8dfc03e8                 divs.w     #$3e8, d6
0bf2: 206effe0                 movea.l    -$20(a6), a0
0bf6: 2050                     movea.l    (a0), a0
0bf8: 486822a4                 pea.l      $22a4(a0)
0bfc: 3f05                     move.w     d5, -(a7)
0bfe: 3f06                     move.w     d6, -(a7)
0c00: a8a8                     dc.w       $a8a8
0c02: 206effe0                 movea.l    -$20(a6), a0
0c06: 2050                     movea.l    (a0), a0
0c08: 30282072                 move.w     $2072(a0), d0
0c0c: d045                     add.w      d5, d0
0c0e: 206effe0                 movea.l    -$20(a6), a0
0c12: 2050                     movea.l    (a0), a0
0c14: 31402072                 move.w     d0, $2072(a0)
0c18: 206effe0                 movea.l    -$20(a6), a0
0c1c: 2050                     movea.l    (a0), a0
0c1e: 30282074                 move.w     $2074(a0), d0
0c22: d046                     add.w      d6, d0
0c24: 206effe0                 movea.l    -$20(a6), a0
0c28: 2050                     movea.l    (a0), a0
0c2a: 31402074                 move.w     d0, $2074(a0)
0c2e: 206effe0                 movea.l    -$20(a6), a0
0c32: 2050                     movea.l    (a0), a0
0c34: 117c000122b6             move.b     #$1, $22b6(a0)
0c3a: 554f                     subq.w     #$2, a7
0c3c: 206effe0                 movea.l    -$20(a6), a0
0c40: 2050                     movea.l    (a0), a0
0c42: 30282272                 move.w     $2272(a0), d0
0c46: 48c0                     ext.l      d0
0c48: 81fc0064                 divs.w     #$64, d0
0c4c: 3f00                     move.w     d0, -(a7)
0c4e: 206effe0                 movea.l    -$20(a6), a0
0c52: 2050                     movea.l    (a0), a0
0c54: 30282274                 move.w     $2274(a0), d0
0c58: 48c0                     ext.l      d0
0c5a: 81fc0064                 divs.w     #$64, d0
0c5e: 3f00                     move.w     d0, -(a7)
0c60: 4ebaf458                 jsr        $ba(pc)
0c64: 301f                     move.w     (a7)+, d0
0c66: 48c0                     ext.l      d0
0c68: 81fc0006                 divs.w     #$6, d0
0c6c: de40                     add.w      d0, d7
0c6e: 2f2effe0                 move.l     -$20(a6), -(a7)
0c72: 3f07                     move.w     d7, -(a7)
0c74: 4ebaf56a                 jsr        $1e0(pc)
0c78: 206effe0                 movea.l    -$20(a6), a0
0c7c: 2050                     movea.l    (a0), a0
0c7e: 3007                     move.w     d7, d0
0c80: 48c0                     ext.l      d0
0c82: d0a822cc                 add.l      $22cc(a0), d0
0c86: 206effe0                 movea.l    -$20(a6), a0
0c8a: 2050                     movea.l    (a0), a0
0c8c: 214022cc                 move.l     d0, $22cc(a0)
0c90: 206effe0                 movea.l    -$20(a6), a0
0c94: 2050                     movea.l    (a0), a0
0c96: 4868011c                 pea.l      $11c(a0)
0c9a: 2f0e                     move.l     a6, -(a7)
0c9c: 4ebafa04                 jsr        $6a2(pc)
0ca0: 2f2effe4                 move.l     -$1c(a6), -(a7)
0ca4: 3f07                     move.w     d7, -(a7)
0ca6: 4ebaf538                 jsr        $1e0(pc)
0caa: 206effe4                 movea.l    -$1c(a6), a0
0cae: 2050                     movea.l    (a0), a0
0cb0: 3007                     move.w     d7, d0
0cb2: 48c0                     ext.l      d0
0cb4: d0a822cc                 add.l      $22cc(a0), d0
0cb8: 206effe4                 movea.l    -$1c(a6), a0
0cbc: 2050                     movea.l    (a0), a0
0cbe: 214022cc                 move.l     d0, $22cc(a0)
0cc2: 206effe4                 movea.l    -$1c(a6), a0
0cc6: 2050                     movea.l    (a0), a0
0cc8: 4868011c                 pea.l      $11c(a0)
0ccc: 2f0e                     move.l     a6, -(a7)
0cce: 4ebaf9d2                 jsr        $6a2(pc)
0cd2: 60000086                 bra.w      $d5a
0cd6: 3d7c0001ffde             move.w     #$1, -$22(a6)
0cdc: 302effde                 move.w     -$22(a6), d0
0ce0: 0640c375                 addi.w     #$c375, d0
0ce4: 4a350000                 tst.b      (a5, d0.w)
0ce8: 6764                     beq.b      $d4e
0cea: 302effde                 move.w     -$22(a6), d0
0cee: c1fc00a6                 muls.w     #$a6, d0
0cf2: 0640c030                 addi.w     #$c030, d0
0cf6: 2d750000ffec             move.l     (a5, d0.w), -$14(a6)
0cfc: 206effec                 movea.l    -$14(a6), a0
0d00: 2050                     movea.l    (a0), a0
0d02: 102822b6                 move.b     $22b6(a0), d0
0d06: 5300                     subq.b     #$1, d0
0d08: 6718                     beq.b      $d22
0d0a: 302effde                 move.w     -$22(a6), d0
0d0e: e740                     asl.w      #$3, d0
0d10: 206effec                 movea.l    -$14(a6), a0
0d14: 2050                     movea.l    (a0), a0
0d16: 43f60092                 lea.l      -$6e(a6, d0.w), a1
0d1a: 41e822a4                 lea.l      $22a4(a0), a0
0d1e: 20d9                     move.l     (a1)+, (a0)+
0d20: 20d9                     move.l     (a1)+, (a0)+
0d22: 206effec                 movea.l    -$14(a6), a0
0d26: 2050                     movea.l    (a0), a0
0d28: 302822a6                 move.w     $22a6(a0), d0
0d2c: 5a40                     addq.w     #$5, d0
0d2e: 206effec                 movea.l    -$14(a6), a0
0d32: 2050                     movea.l    (a0), a0
0d34: 31402072                 move.w     d0, $2072(a0)
0d38: 206effec                 movea.l    -$14(a6), a0
0d3c: 2050                     movea.l    (a0), a0
0d3e: 302822a4                 move.w     $22a4(a0), d0
0d42: 5a40                     addq.w     #$5, d0
0d44: 206effec                 movea.l    -$14(a6), a0
0d48: 2050                     movea.l    (a0), a0
0d4a: 31402074                 move.w     d0, $2074(a0)
0d4e: 526effde                 addq.w     #$1, -$22(a6)
0d52: 0c6e0005ffde             cmpi.w     #$5, -$22(a6)
0d58: 6f82                     ble.b      $cdc
0d5a: 0c6e7fffffda             cmpi.w     #$7fff, -$26(a6)
0d60: 6600fb2c                 bne.w      $88e
0d64: 4cdf00f8                 movem.l    (a7)+, d3-d7
0d68: 4e5e                     unlk       a6
0d6a: 205f                     movea.l    (a7)+, a0
0d6c: 5c4f                     addq.w     #$6, a7
0d6e: 4ed0                     jmp        (a0)
0d70: 4e56ffee                 link.w     a6, #$ffee
0d74: 48e70108                 movem.l    d7/a4, -(a7)
0d78: 286e0008                 movea.l    $8(a6), a4
0d7c: 4247                     clr.w      d7
0d7e: 4a47                     tst.w      d7
0d80: 56c0                     sne.b      d0
0d82: 0c470001                 cmpi.w     #$1, d7
0d86: 56c1                     sne.b      d1
0d88: c001                     and.b      d1, d0
0d8a: 0c470009                 cmpi.w     #$9, d7
0d8e: 56c1                     sne.b      d1
0d90: c001                     and.b      d1, d0
0d92: 0c470007                 cmpi.w     #$7, d7
0d96: 56c1                     sne.b      d1
0d98: c001                     and.b      d1, d0
0d9a: 0c470004                 cmpi.w     #$4, d7
0d9e: 56c1                     sne.b      d1
0da0: c001                     and.b      d1, d0
0da2: 0c470003                 cmpi.w     #$3, d7
0da6: 56c1                     sne.b      d1
0da8: c001                     and.b      d1, d0
0daa: 670c                     beq.b      $db8
0dac: 3007                     move.w     d7, d0
0dae: d040                     add.w      d0, d0
0db0: 06401f56                 addi.w     #$1f56, d0
0db4: 42740000                 clr.w      (a4, d0.w)
0db8: 5247                     addq.w     #$1, d7
0dba: 0c470012                 cmpi.w     #$12, d7
0dbe: 6fbe                     ble.b      $d7e
0dc0: 4247                     clr.w      d7
0dc2: 3007                     move.w     d7, d0
0dc4: d040                     add.w      d0, d0
0dc6: 06401f7c                 addi.w     #$1f7c, d0
0dca: 42740000                 clr.w      (a4, d0.w)
0dce: 5247                     addq.w     #$1, d7
0dd0: 0c4700c8                 cmpi.w     #$c8, d7
0dd4: 6fec                     ble.b      $dc2
0dd6: 397cffff216c             move.w     #$ffff, $216c(a4)
0ddc: 397c00012112             move.w     #$1, $2112(a4)
0de2: 426c210e                 clr.w      $210e(a4)
0de6: 426c2110                 clr.w      $2110(a4)
0dea: 426c2114                 clr.w      $2114(a4)
0dee: 422c2116                 clr.b      $2116(a4)
0df2: 426c2118                 clr.w      $2118(a4)
0df6: 426c215a                 clr.w      $215a(a4)
0dfa: 426c215c                 clr.w      $215c(a4)
0dfe: 4cdf1080                 movem.l    (a7)+, d7/a4
0e02: 4e5e                     unlk       a6
0e04: 2e9f                     move.l     (a7)+, (a7)
0e06: 4e75                     rts        
0e08: 4e56ffec                 link.w     a6, #$ffec
0e0c: 48e70708                 movem.l    d5-d7/a4, -(a7)
0e10: 286e000a                 movea.l    $a(a6), a4
0e14: 3a2e0008                 move.w     $8(a6), d5
0e18: 2f0c                     move.l     a4, -(a7)
0e1a: 4ebaff54                 jsr        $d70(pc)
0e1e: 3005                     move.w     d5, d0
0e20: 6028                     bra.b      $e4a
0e22: 7e07                     moveq      #$7, d7
0e24: 7c07                     moveq      #$7, d6
0e26: 6036                     bra.b      $e5e
0e28: 7e07                     moveq      #$7, d7
0e2a: 3c3c00a0                 move.w     #$a0, d6
0e2e: 602e                     bra.b      $e5e
0e30: 3e3c0088                 move.w     #$88, d7
0e34: 7c07                     moveq      #$7, d6
0e36: 6026                     bra.b      $e5e
0e38: 3e3c0104                 move.w     #$104, d7
0e3c: 7c07                     moveq      #$7, d6
0e3e: 601e                     bra.b      $e5e
0e40: 3e3c0104                 move.w     #$104, d7
0e44: 3c3c00a0                 move.w     #$a0, d6
0e48: 6014                     bra.b      $e5e
0e4a: 5340                     subq.w     #$1, d0
0e4c: 67d4                     beq.b      $e22
0e4e: 5340                     subq.w     #$1, d0
0e50: 67d6                     beq.b      $e28
0e52: 5340                     subq.w     #$1, d0
0e54: 67da                     beq.b      $e30
0e56: 5340                     subq.w     #$1, d0
0e58: 67de                     beq.b      $e38
0e5a: 5340                     subq.w     #$1, d0
0e5c: 67e2                     beq.b      $e40
0e5e: 554f                     subq.w     #$2, a7
0e60: a861                     dc.w       $a861
0e62: 301f                     move.w     (a7)+, d0
0e64: 6a02                     bpl.b      $e68
0e66: 4440                     neg.w      d0
0e68: 48c0                     ext.l      d0
0e6a: 81fc006c                 divs.w     #$6c, d0
0e6e: 4840                     swap       d0
0e70: de40                     add.w      d0, d7
0e72: 0c450003                 cmpi.w     #$3, d5
0e76: 6616                     bne.b      $e8e
0e78: 554f                     subq.w     #$2, a7
0e7a: a861                     dc.w       $a861
0e7c: 301f                     move.w     (a7)+, d0
0e7e: 6a02                     bpl.b      $e82
0e80: 4440                     neg.w      d0
0e82: 48c0                     ext.l      d0
0e84: 81fc0118                 divs.w     #$118, d0
0e88: 4840                     swap       d0
0e8a: dc40                     add.w      d0, d6
0e8c: 6014                     bra.b      $ea2
0e8e: 554f                     subq.w     #$2, a7
0e90: a861                     dc.w       $a861
0e92: 301f                     move.w     (a7)+, d0
0e94: 6a02                     bpl.b      $e98
0e96: 4440                     neg.w      d0
0e98: 48c0                     ext.l      d0
0e9a: 81fc0082                 divs.w     #$82, d0
0e9e: 4840                     swap       d0
0ea0: dc40                     add.w      d0, d6
0ea2: 39471f56                 move.w     d7, $1f56(a4)
0ea6: 39461f58                 move.w     d6, $1f58(a4)
0eaa: 426c1f5e                 clr.w      $1f5e(a4)
0eae: 426c1f5c                 clr.w      $1f5c(a4)
0eb2: 426c1f68                 clr.w      $1f68(a4)
0eb6: 3007                     move.w     d7, d0
0eb8: 5b40                     subq.w     #$5, d0
0eba: 3940218a                 move.w     d0, $218a(a4)
0ebe: 3007                     move.w     d7, d0
0ec0: 5a40                     addq.w     #$5, d0
0ec2: 5240                     addq.w     #$1, d0
0ec4: 3940218e                 move.w     d0, $218e(a4)
0ec8: 3006                     move.w     d6, d0
0eca: 5b40                     subq.w     #$5, d0
0ecc: 39402188                 move.w     d0, $2188(a4)
0ed0: 3006                     move.w     d6, d0
0ed2: 5a40                     addq.w     #$5, d0
0ed4: 5240                     addq.w     #$1, d0
0ed6: 3940218c                 move.w     d0, $218c(a4)
0eda: 41ec2188                 lea.l      $2188(a4), a0
0ede: 43ec2190                 lea.l      $2190(a4), a1
0ee2: 22d8                     move.l     (a0)+, (a1)+
0ee4: 22d8                     move.l     (a0)+, (a1)+
0ee6: 422c216e                 clr.b      $216e(a4)
0eea: 422c216f                 clr.b      $216f(a4)
0eee: 426c2168                 clr.w      $2168(a4)
0ef2: 426c216a                 clr.w      $216a(a4)
0ef6: 426c2186                 clr.w      $2186(a4)
0efa: 426c215e                 clr.w      $215e(a4)
0efe: 426c2160                 clr.w      $2160(a4)
0f02: 426c2156                 clr.w      $2156(a4)
0f06: 426c2158                 clr.w      $2158(a4)
0f0a: 4a6c0006                 tst.w      $6(a4)
0f0e: 6608                     bne.b      $f18
0f10: 397c00c82166             move.w     #$c8, $2166(a4)
0f16: 6016                     bra.b      $f2e
0f18: 0c6c00010006             cmpi.w     #$1, $6(a4)
0f1e: 6608                     bne.b      $f28
0f20: 397c01362166             move.w     #$136, $2166(a4)
0f26: 6006                     bra.b      $f2e
0f28: 397c01f42166             move.w     #$1f4, $2166(a4)
0f2e: 302c000c                 move.w     $c(a4), d0
0f32: 6028                     bra.b      $f5c
0f34: 397c00642162             move.w     #$64, $2162(a4)
0f3a: 6038                     bra.b      $f74
0f3c: 397c00732162             move.w     #$73, $2162(a4)
0f42: 6030                     bra.b      $f74
0f44: 397c00822162             move.w     #$82, $2162(a4)
0f4a: 6028                     bra.b      $f74
0f4c: 397c00912162             move.w     #$91, $2162(a4)
0f52: 6020                     bra.b      $f74
0f54: 397c00a52162             move.w     #$a5, $2162(a4)
0f5a: 6018                     bra.b      $f74
0f5c: 67d6                     beq.b      $f34
0f5e: 5340                     subq.w     #$1, d0
0f60: 67da                     beq.b      $f3c
0f62: 5340                     subq.w     #$1, d0
0f64: 67de                     beq.b      $f44
0f66: 5340                     subq.w     #$1, d0
0f68: 67e2                     beq.b      $f4c
0f6a: 5340                     subq.w     #$1, d0
0f6c: 67e6                     beq.b      $f54
0f6e: 397c00c82162             move.w     #$c8, $2162(a4)
0f74: 302c0008                 move.w     $8(a4), d0
0f78: 6010                     bra.b      $f8a
0f7a: 397c073a2164             move.w     #$73a, $2164(a4)
0f80: 6014                     bra.b      $f96
0f82: 397c09c42164             move.w     #$9c4, $2164(a4)
0f88: 600c                     bra.b      $f96
0f8a: 67ee                     beq.b      $f7a
0f8c: 5340                     subq.w     #$1, d0
0f8e: 67f2                     beq.b      $f82
0f90: 397c0c802164             move.w     #$c80, $2164(a4)
0f96: 396c21641f64             move.w     $2164(a4), $1f64(a4)
0f9c: 426c219c                 clr.w      $219c(a4)
0fa0: 422c21bc                 clr.b      $21bc(a4)
0fa4: 0c6e0001000e             cmpi.w     #$1, $e(a6)
0faa: 661a                     bne.b      $fc6
0fac: 426c219e                 clr.w      $219e(a4)
0fb0: 4247                     clr.w      d7
0fb2: 3007                     move.w     d7, d0
0fb4: e540                     asl.w      #$2, d0
0fb6: 064021a0                 addi.w     #$21a0, d0
0fba: 42b40000                 clr.l      (a4, d0.w)
0fbe: 5247                     addq.w     #$1, d7
0fc0: 0c470006                 cmpi.w     #$6, d7
0fc4: 6fec                     ble.b      $fb2
0fc6: 4cdf10e0                 movem.l    (a7)+, d5-d7/a4
0fca: 4e5e                     unlk       a6
0fcc: 205f                     movea.l    (a7)+, a0
0fce: 504f                     addq.w     #$8, a7
0fd0: 4ed0                     jmp        (a0)
0fd2: 4e560000                 link.w     a6, #$0
0fd6: 2f0c                     move.l     a4, -(a7)
0fd8: 286e0008                 movea.l    $8(a6), a4
0fdc: 206c000c                 movea.l    $c(a4), a0
0fe0: 302e000c                 move.w     $c(a6), d0
0fe4: b0681f54                 cmp.w      $1f54(a0), d0
0fe8: 6d12                     blt.b      $ffc
0fea: 206c000c                 movea.l    $c(a4), a0
0fee: 202821b8                 move.l     $21b8(a0), d0
0ff2: 5280                     addq.l     #$1, d0
0ff4: 206c000c                 movea.l    $c(a4), a0
0ff8: 214021b8                 move.l     d0, $21b8(a0)
0ffc: 206c000c                 movea.l    $c(a4), a0
1000: 2f08                     move.l     a0, -(a7)
1002: 4ebafd6c                 jsr        $d70(pc)
1006: 426cffdc                 clr.w      -$24(a4)
100a: 426cffde                 clr.w      -$22(a4)
100e: 426cffe6                 clr.w      -$1a(a4)
1012: 426cffe4                 clr.w      -$1c(a4)
1016: 285f                     movea.l    (a7)+, a4
1018: 4e5e                     unlk       a6
101a: 205f                     movea.l    (a7)+, a0
101c: 5c4f                     addq.w     #$6, a7
101e: 4ed0                     jmp        (a0)
1020: 4e560000                 link.w     a6, #$0
1024: 3f3c7fff                 move.w     #$7fff, -(a7)
1028: 2f2e0008                 move.l     $8(a6), -(a7)
102c: 4ebaffa4                 jsr        $fd2(pc)
1030: 4e5e                     unlk       a6
1032: 2e9f                     move.l     (a7)+, (a7)
1034: 4e75                     rts        
1036: 4e56ffb0                 link.w     a6, #$ffb0
103a: 48e71f38                 movem.l    d3-d7/a2-a4, -(a7)
103e: 286e000e                 movea.l    $e(a6), a4
1042: 383c03e8                 move.w     #$3e8, d4
1046: 7c01                     moveq      #$1, d6
1048: bc6c2198                 cmp.w      $2198(a4), d6
104c: 56c0                     sne.b      d0
104e: 41edc375                 lea.l      -$3c8b(a5), a0
1052: c0306000                 and.b      (a0, d6.w), d0
1056: 670000ac                 beq.w      $1104
105a: 3006                     move.w     d6, d0
105c: c1fc00a6                 muls.w     #$a6, d0
1060: 0640c030                 addi.w     #$c030, d0
1064: 26750000                 movea.l    (a5, d0.w), a3
1068: 2053                     movea.l    (a3), a0
106a: 4a682082                 tst.w      $2082(a0)
106e: 66000094                 bne.w      $1104
1072: 2053                     movea.l    (a3), a0
1074: 302822a4                 move.w     $22a4(a0), d0
1078: 5a40                     addq.w     #$5, d0
107a: 3d40ffe4                 move.w     d0, -$1c(a6)
107e: 2053                     movea.l    (a3), a0
1080: 302822a6                 move.w     $22a6(a0), d0
1084: 5a40                     addq.w     #$5, d0
1086: 3d40ffe6                 move.w     d0, -$1a(a6)
108a: 486c2188                 pea.l      $2188(a4)
108e: 2f2effe4                 move.l     -$1c(a6), -(a7)
1092: 486effe0                 pea.l      -$20(a6)
1096: a8c3                     dc.w       $a8c3
1098: 3a2e000c                 move.w     $c(a6), d5
109c: 9a6effe0                 sub.w      -$20(a6), d5
10a0: 6a02                     bpl.b      $10a4
10a2: 4445                     neg.w      d5
10a4: 0c4500b4                 cmpi.w     #$b4, d5
10a8: 6f08                     ble.b      $10b2
10aa: 303c0168                 move.w     #$168, d0
10ae: 9045                     sub.w      d5, d0
10b0: 3a00                     move.w     d0, d5
10b2: 0c450021                 cmpi.w     #$21, d5
10b6: 6c4c                     bge.b      $1104
10b8: 302c218a                 move.w     $218a(a4), d0
10bc: 5a40                     addq.w     #$5, d0
10be: 906effe6                 sub.w      -$1a(a6), d0
10c2: 3d40ffd6                 move.w     d0, -$2a(a6)
10c6: 362c2188                 move.w     $2188(a4), d3
10ca: 5a43                     addq.w     #$5, d3
10cc: 966effe4                 sub.w      -$1c(a6), d3
10d0: 554f                     subq.w     #$2, a7
10d2: 3f2effd6                 move.w     -$2a(a6), -(a7)
10d6: 3f03                     move.w     d3, -(a7)
10d8: 4ebaefe0                 jsr        $ba(pc)
10dc: 3e1f                     move.w     (a7)+, d7
10de: 4a47                     tst.w      d7
10e0: 6602                     bne.b      $10e4
10e2: 7e01                     moveq      #$1, d7
10e4: 203c00000136             move.l     #$136, d0
10ea: 81c7                     divs.w     d7, d0
10ec: 5240                     addq.w     #$1, d0
10ee: ba40                     cmp.w      d0, d5
10f0: 6e12                     bgt.b      $1104
10f2: be44                     cmp.w      d4, d7
10f4: 5dc0                     slt.b      d0
10f6: be6c2166                 cmp.w      $2166(a4), d7
10fa: 5dc1                     slt.b      d1
10fc: c001                     and.b      d1, d0
10fe: 6704                     beq.b      $1104
1100: 3807                     move.w     d7, d4
1102: 244b                     movea.l    a3, a2
1104: 5246                     addq.w     #$1, d6
1106: 0c460005                 cmpi.w     #$5, d6
110a: 6f00ff3c                 ble.w      $1048
110e: 0c4403e8                 cmpi.w     #$3e8, d4
1112: 6608                     bne.b      $111c
1114: 3d7cffff0012             move.w     #$ffff, $12(a6)
111a: 6062                     bra.b      $117e
111c: 2052                     movea.l    (a2), a0
111e: 302822a4                 move.w     $22a4(a0), d0
1122: 906c2188                 sub.w      $2188(a4), d0
1126: 48c0                     ext.l      d0
1128: 2f00                     move.l     d0, -(a7)
112a: 2f00                     move.l     d0, -(a7)
112c: 4ead0122                 jsr        $122(a5) ; CODE 1 resource+0x0316
1130: 2d5fffc8                 move.l     (a7)+, -$38(a6)
1134: 594f                     subq.w     #$4, a7
1136: 486effbe                 pea.l      -$42(a6)
113a: 2052                     movea.l    (a2), a0
113c: 302822a6                 move.w     $22a6(a0), d0
1140: 906c218a                 sub.w      $218a(a4), d0
1144: 48c0                     ext.l      d0
1146: 2f00                     move.l     d0, -(a7)
1148: 2f00                     move.l     d0, -(a7)
114a: 4ead0122                 jsr        $122(a5) ; CODE 1 resource+0x0316
114e: 201f                     move.l     (a7)+, d0
1150: d0aeffc8                 add.l      -$38(a6), d0
1154: 2d40ffba                 move.l     d0, -$46(a6)
1158: 486effba                 pea.l      -$46(a6)
115c: 486effb0                 pea.l      -$50(a6)
1160: 3f3c280e                 move.w     #$280e, -(a7)
1164: a9eb                     dc.w       $a9eb
1166: 486effb0                 pea.l      -$50(a6)
116a: 4ead00f2                 jsr        $f2(a5) ; CODE 1 resource+0x01c0
116e: 584f                     addq.w     #$4, a7
1170: 486effbe                 pea.l      -$42(a6)
1174: 4ead0102                 jsr        $102(a5) ; CODE 1 resource+0x020a
1178: 544f                     addq.w     #$2, a7
117a: 3d5f0012                 move.w     (a7)+, $12(a6)
117e: 4cdf1cf8                 movem.l    (a7)+, d3-d7/a2-a4
1182: 4e5e                     unlk       a6
1184: 205f                     movea.l    (a7)+, a0
1186: 4fef000a                 lea.l      $a(a7), a7
118a: 4ed0                     jmp        (a0)
118c: 4e560000                 link.w     a6, #$0
1190: 2f0c                     move.l     a4, -(a7)
1192: 286e0008                 movea.l    $8(a6), a4
1196: 206c000c                 movea.l    $c(a4), a0
119a: 0c68001e2112             cmpi.w     #$1e, $2112(a0)
11a0: 6d08                     blt.b      $11aa
11a2: 2f0c                     move.l     a4, -(a7)
11a4: 4ebafe7a                 jsr        $1020(pc)
11a8: 602a                     bra.b      $11d4
11aa: 206c000c                 movea.l    $c(a4), a0
11ae: 226c000c                 movea.l    $c(a4), a1
11b2: 30292112                 move.w     $2112(a1), d0
11b6: d040                     add.w      d0, d0
11b8: 06402118                 addi.w     #$2118, d0
11bc: 31ae000c0000             move.w     $c(a6), (a0, d0.w)
11c2: 206c000c                 movea.l    $c(a4), a0
11c6: 30282112                 move.w     $2112(a0), d0
11ca: 5240                     addq.w     #$1, d0
11cc: 206c000c                 movea.l    $c(a4), a0
11d0: 31402112                 move.w     d0, $2112(a0)
11d4: 285f                     movea.l    (a7)+, a4
11d6: 4e5e                     unlk       a6
11d8: 205f                     movea.l    (a7)+, a0
11da: 5c4f                     addq.w     #$6, a7
11dc: 4ed0                     jmp        (a0)
11de: 4e560000                 link.w     a6, #$0
11e2: 206e0008                 movea.l    $8(a6), a0
11e6: 3f28ffe6                 move.w     -$1a(a0), -(a7)
11ea: 2f2e0008                 move.l     $8(a6), -(a7)
11ee: 4ebaff9c                 jsr        $118c(pc)
11f2: 4e5e                     unlk       a6
11f4: 2e9f                     move.l     (a7)+, (a7)
11f6: 4e75                     rts        
11f8: 4e560000                 link.w     a6, #$0
11fc: 2f0c                     move.l     a4, -(a7)
11fe: 286e0008                 movea.l    $8(a6), a4
1202: 206c000c                 movea.l    $c(a4), a0
1206: 0c6800012112             cmpi.w     #$1, $2112(a0)
120c: 6e0c                     bgt.b      $121a
120e: 2f0c                     move.l     a4, -(a7)
1210: 4ebafe0e                 jsr        $1020(pc)
1214: 426e000c                 clr.w      $c(a6)
1218: 602a                     bra.b      $1244
121a: 206c000c                 movea.l    $c(a4), a0
121e: 30282112                 move.w     $2112(a0), d0
1222: 5340                     subq.w     #$1, d0
1224: 206c000c                 movea.l    $c(a4), a0
1228: 31402112                 move.w     d0, $2112(a0)
122c: 206c000c                 movea.l    $c(a4), a0
1230: 226c000c                 movea.l    $c(a4), a1
1234: 30292112                 move.w     $2112(a1), d0
1238: d040                     add.w      d0, d0
123a: 06402118                 addi.w     #$2118, d0
123e: 3d700000000c             move.w     (a0, d0.w), $c(a6)
1244: 285f                     movea.l    (a7)+, a4
1246: 4e5e                     unlk       a6
1248: 2e9f                     move.l     (a7)+, (a7)
124a: 4e75                     rts        
124c: 4e56ffee                 link.w     a6, #$ffee
1250: 48e70108                 movem.l    d7/a4, -(a7)
1254: 286e0008                 movea.l    $8(a6), a4
1258: 0c2c0001ffed             cmpi.b     #$1, -$13(a4)
125e: 6600008a                 bne.w      $12ea
1262: 0c6c0010ffee             cmpi.w     #$10, -$12(a4)
1268: 6c18                     bge.b      $1282
126a: 206c000c                 movea.l    $c(a4), a0
126e: 302cffee                 move.w     -$12(a4), d0
1272: d040                     add.w      d0, d0
1274: 06401f56                 addi.w     #$1f56, d0
1278: 3d700000000c             move.w     (a0, d0.w), $c(a6)
127e: 600000d2                 bra.w      $1352
1282: 0c6c0011ffee             cmpi.w     #$11, -$12(a4)
1288: 6630                     bne.b      $12ba
128a: 206c000c                 movea.l    $c(a4), a0
128e: 4a681f78                 tst.w      $1f78(a0)
1292: 6608                     bne.b      $129c
1294: 426e000c                 clr.w      $c(a6)
1298: 600000b8                 bra.w      $1352
129c: 554f                     subq.w     #$2, a7
129e: a861                     dc.w       $a861
12a0: 301f                     move.w     (a7)+, d0
12a2: 6a02                     bpl.b      $12a6
12a4: 4440                     neg.w      d0
12a6: 206c000c                 movea.l    $c(a4), a0
12aa: 48c0                     ext.l      d0
12ac: 81e81f78                 divs.w     $1f78(a0), d0
12b0: 4840                     swap       d0
12b2: 3d40000c                 move.w     d0, $c(a6)
12b6: 6000009a                 bra.w      $1352
12ba: 0c6c0010ffee             cmpi.w     #$10, -$12(a4)
12c0: 660e                     bne.b      $12d0
12c2: 206c000c                 movea.l    $c(a4), a0
12c6: 3d68216c000c             move.w     $216c(a0), $c(a6)
12cc: 60000084                 bra.w      $1352
12d0: 0c6c0012ffee             cmpi.w     #$12, -$12(a4)
12d6: 6600007a                 bne.w      $1352
12da: 554f                     subq.w     #$2, a7
12dc: 2f0c                     move.l     a4, -(a7)
12de: 4ebaff18                 jsr        $11f8(pc)
12e2: 3d5f000c                 move.w     (a7)+, $c(a6)
12e6: 6000006a                 bra.w      $1352
12ea: 0c2c0004ffed             cmpi.b     #$4, -$13(a4)
12f0: 6616                     bne.b      $1308
12f2: 206c000c                 movea.l    $c(a4), a0
12f6: 302cffee                 move.w     -$12(a4), d0
12fa: d040                     add.w      d0, d0
12fc: 06401f7c                 addi.w     #$1f7c, d0
1300: 3d700000000c             move.w     (a0, d0.w), $c(a6)
1306: 604a                     bra.b      $1352
1308: 0c2c0005ffed             cmpi.b     #$5, -$13(a4)
130e: 663c                     bne.b      $134c
1310: 206c000c                 movea.l    $c(a4), a0
1314: 3e2cffee                 move.w     -$12(a4), d7
1318: de47                     add.w      d7, d7
131a: 41e81f7c                 lea.l      $1f7c(a0), a0
131e: 3e307000                 move.w     (a0, d7.w), d7
1322: 4a47                     tst.w      d7
1324: 5dc0                     slt.b      d0
1326: 0c4700c8                 cmpi.w     #$c8, d7
132a: 5ec1                     sgt.b      d1
132c: 8001                     or.b       d1, d0
132e: 6708                     beq.b      $1338
1330: 2f0c                     move.l     a4, -(a7)
1332: 4ebafcec                 jsr        $1020(pc)
1336: 601a                     bra.b      $1352
1338: 206c000c                 movea.l    $c(a4), a0
133c: 3007                     move.w     d7, d0
133e: d040                     add.w      d0, d0
1340: 06401f7c                 addi.w     #$1f7c, d0
1344: 3d700000000c             move.w     (a0, d0.w), $c(a6)
134a: 6006                     bra.b      $1352
134c: 3d6cffee000c             move.w     -$12(a4), $c(a6)
1352: 4cdf1080                 movem.l    (a7)+, d7/a4
1356: 4e5e                     unlk       a6
1358: 2e9f                     move.l     (a7)+, (a7)
135a: 4e75                     rts        
135c: 4e56ffd2                 link.w     a6, #$ffd2
1360: 48e70708                 movem.l    d5-d7/a4, -(a7)
1364: 286e0008                 movea.l    $8(a6), a4
1368: 0c2c0004ffed             cmpi.b     #$4, -$13(a4)
136e: 6618                     bne.b      $1388
1370: 206c000c                 movea.l    $c(a4), a0
1374: 302cffee                 move.w     -$12(a4), d0
1378: d040                     add.w      d0, d0
137a: 06401f7c                 addi.w     #$1f7c, d0
137e: 31acffe40000             move.w     -$1c(a4), (a0, d0.w)
1384: 60000694                 bra.w      $1a1a
1388: 0c2c0001ffed             cmpi.b     #$1, -$13(a4)
138e: 6600063c                 bne.w      $19cc
1392: 302cffee                 move.w     -$12(a4), d0
1396: 600005fc                 bra.w      $1994
139a: 6000067e                 bra.w      $1a1a
139e: 3e2cffe4                 move.w     -$1c(a4), d7
13a2: 4a47                     tst.w      d7
13a4: 6c18                     bge.b      $13be
13a6: 48c7                     ext.l      d7
13a8: 8ffc0168                 divs.w     #$168, d7
13ac: 4847                     swap       d7
13ae: 4a47                     tst.w      d7
13b0: 6a02                     bpl.b      $13b4
13b2: 4447                     neg.w      d7
13b4: 303c0168                 move.w     #$168, d0
13b8: 9047                     sub.w      d7, d0
13ba: 3e00                     move.w     d0, d7
13bc: 600e                     bra.b      $13cc
13be: 0c470167                 cmpi.w     #$167, d7
13c2: 6f08                     ble.b      $13cc
13c4: 48c7                     ext.l      d7
13c6: 8ffc0168                 divs.w     #$168, d7
13ca: 4847                     swap       d7
13cc: 206c000c                 movea.l    $c(a4), a0
13d0: 31471f5a                 move.w     d7, $1f5a(a0)
13d4: 60000644                 bra.w      $1a1a
13d8: 206c000c                 movea.l    $c(a4), a0
13dc: 4a681f5c                 tst.w      $1f5c(a0)
13e0: 66000638                 bne.w      $1a1a
13e4: 206c000c                 movea.l    $c(a4), a0
13e8: 117c0001216e             move.b     #$1, $216e(a0)
13ee: 206c000c                 movea.l    $c(a4), a0
13f2: 4228216f                 clr.b      $216f(a0)
13f6: 554f                     subq.w     #$2, a7
13f8: 206c000c                 movea.l    $c(a4), a0
13fc: 3f281f5a                 move.w     $1f5a(a0), -(a7)
1400: 4ebaec2e                 jsr        $30(pc)
1404: 302cffe4                 move.w     -$1c(a4), d0
1408: 48c0                     ext.l      d0
140a: 321f                     move.w     (a7)+, d1
140c: 48c1                     ext.l      d1
140e: 2f01                     move.l     d1, -(a7)
1410: 2f00                     move.l     d0, -(a7)
1412: 4ead0122                 jsr        $122(a5) ; CODE 1 resource+0x0316
1416: 2f3c00000640             move.l     #$640, -(a7)
141c: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
1420: 206c000c                 movea.l    $c(a4), a0
1424: 544f                     addq.w     #$2, a7
1426: 315f217a                 move.w     (a7)+, $217a(a0)
142a: 554f                     subq.w     #$2, a7
142c: 206c000c                 movea.l    $c(a4), a0
1430: 3f281f5a                 move.w     $1f5a(a0), -(a7)
1434: 4ebaec64                 jsr        $9a(pc)
1438: 302cffe4                 move.w     -$1c(a4), d0
143c: 48c0                     ext.l      d0
143e: 321f                     move.w     (a7)+, d1
1440: 48c1                     ext.l      d1
1442: 2f01                     move.l     d1, -(a7)
1444: 2f00                     move.l     d0, -(a7)
1446: 4ead0122                 jsr        $122(a5) ; CODE 1 resource+0x0316
144a: 2f3c00000640             move.l     #$640, -(a7)
1450: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
1454: 201f                     move.l     (a7)+, d0
1456: 4480                     neg.l      d0
1458: 206c000c                 movea.l    $c(a4), a0
145c: 3140217c                 move.w     d0, $217c(a0)
1460: 206c000c                 movea.l    $c(a4), a0
1464: 226c000c                 movea.l    $c(a4), a1
1468: 3028217a                 move.w     $217a(a0), d0
146c: d0691f56                 add.w      $1f56(a1), d0
1470: 206c000c                 movea.l    $c(a4), a0
1474: 31402174                 move.w     d0, $2174(a0)
1478: 206c000c                 movea.l    $c(a4), a0
147c: 226c000c                 movea.l    $c(a4), a1
1480: 3028217c                 move.w     $217c(a0), d0
1484: d0691f58                 add.w      $1f58(a1), d0
1488: 206c000c                 movea.l    $c(a4), a0
148c: 31402172                 move.w     d0, $2172(a0)
1490: 302cffe4                 move.w     -$1c(a4), d0
1494: 6a02                     bpl.b      $1498
1496: 4440                     neg.w      d0
1498: 48c0                     ext.l      d0
149a: 81fc0012                 divs.w     #$12, d0
149e: 5240                     addq.w     #$1, d0
14a0: 206c000c                 movea.l    $c(a4), a0
14a4: 31402176                 move.w     d0, $2176(a0)
14a8: 206c000c                 movea.l    $c(a4), a0
14ac: 42682178                 clr.w      $2178(a0)
14b0: 206c000c                 movea.l    $c(a4), a0
14b4: 226c000c                 movea.l    $c(a4), a1
14b8: 33681f562180             move.w     $1f56(a0), $2180(a1)
14be: 206c000c                 movea.l    $c(a4), a0
14c2: 226c000c                 movea.l    $c(a4), a1
14c6: 33681f58217e             move.w     $1f58(a0), $217e(a1)
14cc: 302cffe8                 move.w     -$18(a4), d0
14d0: 0640000a                 addi.w     #$a, d0
14d4: 3940ffe8                 move.w     d0, -$18(a4)
14d8: 206c000c                 movea.l    $c(a4), a0
14dc: 226c000c                 movea.l    $c(a4), a1
14e0: 2368217e2182             move.l     $217e(a0), $2182(a1)
14e6: 206c000c                 movea.l    $c(a4), a0
14ea: 30280002                 move.w     $2(a0), d0
14ee: 6014                     bra.b      $1504
14f0: 7e1c                     moveq      #$1c, d7
14f2: 6022                     bra.b      $1516
14f4: 7e14                     moveq      #$14, d7
14f6: 601e                     bra.b      $1516
14f8: 7e0f                     moveq      #$f, d7
14fa: 601a                     bra.b      $1516
14fc: 7e0b                     moveq      #$b, d7
14fe: 6016                     bra.b      $1516
1500: 7e07                     moveq      #$7, d7
1502: 6012                     bra.b      $1516
1504: 67ea                     beq.b      $14f0
1506: 5340                     subq.w     #$1, d0
1508: 67ea                     beq.b      $14f4
150a: 5340                     subq.w     #$1, d0
150c: 67ea                     beq.b      $14f8
150e: 5340                     subq.w     #$1, d0
1510: 67ea                     beq.b      $14fc
1512: 5340                     subq.w     #$1, d0
1514: 67ea                     beq.b      $1500
1516: 206c000c                 movea.l    $c(a4), a0
151a: be682176                 cmp.w      $2176(a0), d7
151e: 6c08                     bge.b      $1528
1520: 206c000c                 movea.l    $c(a4), a0
1524: 3e282176                 move.w     $2176(a0), d7
1528: 206c000c                 movea.l    $c(a4), a0
152c: 31471f5c                 move.w     d7, $1f5c(a0)
1530: 600004e8                 bra.w      $1a1a
1534: 600004e4                 bra.w      $1a1a
1538: 206c000c                 movea.l    $c(a4), a0
153c: 4a681f64                 tst.w      $1f64(a0)
1540: 6f0004d8                 ble.w      $1a1a
1544: 3e2cffe4                 move.w     -$1c(a4), d7
1548: 4a47                     tst.w      d7
154a: 6c04                     bge.b      $1550
154c: 4247                     clr.w      d7
154e: 601e                     bra.b      $156e
1550: 206c000c                 movea.l    $c(a4), a0
1554: 30280004                 move.w     $4(a0), d0
1558: 600a                     bra.b      $1564
155a: 0c470014                 cmpi.w     #$14, d7
155e: 6f0e                     ble.b      $156e
1560: 7e14                     moveq      #$14, d7
1562: 600a                     bra.b      $156e
1564: 67f4                     beq.b      $155a
1566: 0c470028                 cmpi.w     #$28, d7
156a: 6f02                     ble.b      $156e
156c: 7e28                     moveq      #$28, d7
156e: 206c000c                 movea.l    $c(a4), a0
1572: 31471f60                 move.w     d7, $1f60(a0)
1576: 600004a2                 bra.w      $1a1a
157a: 3e2cffe4                 move.w     -$1c(a4), d7
157e: 4a47                     tst.w      d7
1580: 6c18                     bge.b      $159a
1582: 48c7                     ext.l      d7
1584: 8ffc0168                 divs.w     #$168, d7
1588: 4847                     swap       d7
158a: 4a47                     tst.w      d7
158c: 6a02                     bpl.b      $1590
158e: 4447                     neg.w      d7
1590: 303c0168                 move.w     #$168, d0
1594: 9047                     sub.w      d7, d0
1596: 3e00                     move.w     d0, d7
1598: 600e                     bra.b      $15a8
159a: 0c470167                 cmpi.w     #$167, d7
159e: 6f08                     ble.b      $15a8
15a0: 48c7                     ext.l      d7
15a2: 8ffc0168                 divs.w     #$168, d7
15a6: 4847                     swap       d7
15a8: 206c000c                 movea.l    $c(a4), a0
15ac: 31471f62                 move.w     d7, $1f62(a0)
15b0: 60000468                 bra.w      $1a1a
15b4: 60000464                 bra.w      $1a1a
15b8: 206c000c                 movea.l    $c(a4), a0
15bc: 4a68000a                 tst.w      $a(a0)
15c0: 5ec0                     sgt.b      d0
15c2: 206c000c                 movea.l    $c(a4), a0
15c6: 4a681f64                 tst.w      $1f64(a0)
15ca: 5ec1                     sgt.b      d1
15cc: c001                     and.b      d1, d0
15ce: 6700044a                 beq.w      $1a1a
15d2: 206c000c                 movea.l    $c(a4), a0
15d6: 316cffe41f66             move.w     -$1c(a4), $1f66(a0)
15dc: 6000043c                 bra.w      $1a1a
15e0: 60000438                 bra.w      $1a1a
15e4: 206c000c                 movea.l    $c(a4), a0
15e8: 302cffee                 move.w     -$12(a4), d0
15ec: d040                     add.w      d0, d0
15ee: 06401f56                 addi.w     #$1f56, d0
15f2: 31acffe40000             move.w     -$1c(a4), (a0, d0.w)
15f8: 60000420                 bra.w      $1a1a
15fc: 206c000c                 movea.l    $c(a4), a0
1600: 316cffe41f70             move.w     -$1c(a4), $1f70(a0)
1606: 3a2cffe4                 move.w     -$1c(a4), d5
160a: 206c000c                 movea.l    $c(a4), a0
160e: 3c281f6e                 move.w     $1f6e(a0), d6
1612: 4a46                     tst.w      d6
1614: 57c0                     seq.b      d0
1616: 4a45                     tst.w      d5
1618: 57c1                     seq.b      d1
161a: 8001                     or.b       d1, d0
161c: 673a                     beq.b      $1658
161e: 4a46                     tst.w      d6
1620: 57c0                     seq.b      d0
1622: 4a45                     tst.w      d5
1624: 57c1                     seq.b      d1
1626: c001                     and.b      d1, d0
1628: 6706                     beq.b      $1630
162a: 4247                     clr.w      d7
162c: 60000196                 bra.w      $17c4
1630: 4a46                     tst.w      d6
1632: 6612                     bne.b      $1646
1634: 4a45                     tst.w      d5
1636: 6f08                     ble.b      $1640
1638: 3e3c00b4                 move.w     #$b4, d7
163c: 60000186                 bra.w      $17c4
1640: 4247                     clr.w      d7
1642: 60000180                 bra.w      $17c4
1646: 4a46                     tst.w      d6
1648: 6f06                     ble.b      $1650
164a: 7e5a                     moveq      #$5a, d7
164c: 60000176                 bra.w      $17c4
1650: 3e3c010e                 move.w     #$10e, d7
1654: 6000016e                 bra.w      $17c4
1658: 4a45                     tst.w      d5
165a: 6f0000b8                 ble.w      $1714
165e: 4a46                     tst.w      d6
1660: 6f52                     ble.b      $16b4
1662: 594f                     subq.w     #$4, a7
1664: 486effe0                 pea.l      -$20(a6)
1668: 3d46ffde                 move.w     d6, -$22(a6)
166c: 486effde                 pea.l      -$22(a6)
1670: 3d45ffdc                 move.w     d5, -$24(a6)
1674: 486effdc                 pea.l      -$24(a6)
1678: 486effd2                 pea.l      -$2e(a6)
167c: 3f3c200e                 move.w     #$200e, -(a7)
1680: a9eb                     dc.w       $a9eb
1682: 486effd2                 pea.l      -$2e(a6)
1686: 3f3c2006                 move.w     #$2006, -(a7)
168a: a9eb                     dc.w       $a9eb
168c: 486effd2                 pea.l      -$2e(a6)
1690: 4ead00e2                 jsr        $e2(a5) ; CODE 1 resource+0x01a0
1694: 584f                     addq.w     #$4, a7
1696: 487a03be                 pea.l      $1a56(pc)
169a: 486effe0                 pea.l      -$20(a6)
169e: 3f3c0004                 move.w     #$4, -(a7)
16a2: a9eb                     dc.w       $a9eb
16a4: 486effe0                 pea.l      -$20(a6)
16a8: 4ead0102                 jsr        $102(a5) ; CODE 1 resource+0x020a
16ac: 7e5a                     moveq      #$5a, d7
16ae: de9f                     add.l      (a7)+, d7
16b0: 60000112                 bra.w      $17c4
16b4: 594f                     subq.w     #$4, a7
16b6: 486effe0                 pea.l      -$20(a6)
16ba: 3d45ffde                 move.w     d5, -$22(a6)
16be: 486effde                 pea.l      -$22(a6)
16c2: 3d46ffdc                 move.w     d6, -$24(a6)
16c6: 486effdc                 pea.l      -$24(a6)
16ca: 486effd2                 pea.l      -$2e(a6)
16ce: 3f3c200e                 move.w     #$200e, -(a7)
16d2: a9eb                     dc.w       $a9eb
16d4: 486effd2                 pea.l      -$2e(a6)
16d8: 3f3c2006                 move.w     #$2006, -(a7)
16dc: a9eb                     dc.w       $a9eb
16de: 486effd2                 pea.l      -$2e(a6)
16e2: 3f3c000d                 move.w     #$d, -(a7)
16e6: a9eb                     dc.w       $a9eb
16e8: 486effd2                 pea.l      -$2e(a6)
16ec: 4ead00e2                 jsr        $e2(a5) ; CODE 1 resource+0x01a0
16f0: 584f                     addq.w     #$4, a7
16f2: 487a0358                 pea.l      $1a4c(pc)
16f6: 486effe0                 pea.l      -$20(a6)
16fa: 3f3c0004                 move.w     #$4, -(a7)
16fe: a9eb                     dc.w       $a9eb
1700: 486effe0                 pea.l      -$20(a6)
1704: 4ead0102                 jsr        $102(a5) ; CODE 1 resource+0x020a
1708: 2e1f                     move.l     (a7)+, d7
170a: 0687000000b4             addi.l     #$b4, d7
1710: 600000b2                 bra.w      $17c4
1714: 4a46                     tst.w      d6
1716: 6f5a                     ble.b      $1772
1718: 594f                     subq.w     #$4, a7
171a: 486effe0                 pea.l      -$20(a6)
171e: 3d45ffde                 move.w     d5, -$22(a6)
1722: 486effde                 pea.l      -$22(a6)
1726: 3d46ffdc                 move.w     d6, -$24(a6)
172a: 486effdc                 pea.l      -$24(a6)
172e: 486effd2                 pea.l      -$2e(a6)
1732: 3f3c200e                 move.w     #$200e, -(a7)
1736: a9eb                     dc.w       $a9eb
1738: 486effd2                 pea.l      -$2e(a6)
173c: 3f3c2006                 move.w     #$2006, -(a7)
1740: a9eb                     dc.w       $a9eb
1742: 486effd2                 pea.l      -$2e(a6)
1746: 3f3c000d                 move.w     #$d, -(a7)
174a: a9eb                     dc.w       $a9eb
174c: 486effd2                 pea.l      -$2e(a6)
1750: 4ead00e2                 jsr        $e2(a5) ; CODE 1 resource+0x01a0
1754: 584f                     addq.w     #$4, a7
1756: 487a02ea                 pea.l      $1a42(pc)
175a: 486effe0                 pea.l      -$20(a6)
175e: 3f3c0004                 move.w     #$4, -(a7)
1762: a9eb                     dc.w       $a9eb
1764: 486effe0                 pea.l      -$20(a6)
1768: 4ead0102                 jsr        $102(a5) ; CODE 1 resource+0x020a
176c: 544f                     addq.w     #$2, a7
176e: 3e1f                     move.w     (a7)+, d7
1770: 6052                     bra.b      $17c4
1772: 594f                     subq.w     #$4, a7
1774: 486effe0                 pea.l      -$20(a6)
1778: 3d46ffde                 move.w     d6, -$22(a6)
177c: 486effde                 pea.l      -$22(a6)
1780: 3d45ffdc                 move.w     d5, -$24(a6)
1784: 486effdc                 pea.l      -$24(a6)
1788: 486effd2                 pea.l      -$2e(a6)
178c: 3f3c200e                 move.w     #$200e, -(a7)
1790: a9eb                     dc.w       $a9eb
1792: 486effd2                 pea.l      -$2e(a6)
1796: 3f3c2006                 move.w     #$2006, -(a7)
179a: a9eb                     dc.w       $a9eb
179c: 486effd2                 pea.l      -$2e(a6)
17a0: 4ead00e2                 jsr        $e2(a5) ; CODE 1 resource+0x01a0
17a4: 584f                     addq.w     #$4, a7
17a6: 487a0290                 pea.l      $1a38(pc)
17aa: 486effe0                 pea.l      -$20(a6)
17ae: 3f3c0004                 move.w     #$4, -(a7)
17b2: a9eb                     dc.w       $a9eb
17b4: 486effe0                 pea.l      -$20(a6)
17b8: 4ead0102                 jsr        $102(a5) ; CODE 1 resource+0x020a
17bc: 2e1f                     move.l     (a7)+, d7
17be: 06870000010e             addi.l     #$10e, d7
17c4: 206c000c                 movea.l    $c(a4), a0
17c8: 31471f72                 move.w     d7, $1f72(a0)
17cc: 594f                     subq.w     #$4, a7
17ce: 486effe0                 pea.l      -$20(a6)
17d2: 302cffe4                 move.w     -$1c(a4), d0
17d6: 48c0                     ext.l      d0
17d8: 322cffe4                 move.w     -$1c(a4), d1
17dc: 48c1                     ext.l      d1
17de: 2f00                     move.l     d0, -(a7)
17e0: 2f01                     move.l     d1, -(a7)
17e2: 4ead0122                 jsr        $122(a5) ; CODE 1 resource+0x0316
17e6: 3006                     move.w     d6, d0
17e8: 48c0                     ext.l      d0
17ea: 3206                     move.w     d6, d1
17ec: 48c1                     ext.l      d1
17ee: 2f00                     move.l     d0, -(a7)
17f0: 2f01                     move.l     d1, -(a7)
17f2: 4ead0122                 jsr        $122(a5) ; CODE 1 resource+0x0316
17f6: 201f                     move.l     (a7)+, d0
17f8: d09f                     add.l      (a7)+, d0
17fa: 2d40ffdc                 move.l     d0, -$24(a6)
17fe: 486effdc                 pea.l      -$24(a6)
1802: 486effd2                 pea.l      -$2e(a6)
1806: 3f3c280e                 move.w     #$280e, -(a7)
180a: a9eb                     dc.w       $a9eb
180c: 486effd2                 pea.l      -$2e(a6)
1810: 4ead00f2                 jsr        $f2(a5) ; CODE 1 resource+0x01c0
1814: 584f                     addq.w     #$4, a7
1816: 486effe0                 pea.l      -$20(a6)
181a: 4ead0102                 jsr        $102(a5) ; CODE 1 resource+0x020a
181e: 206c000c                 movea.l    $c(a4), a0
1822: 544f                     addq.w     #$2, a7
1824: 315f1f74                 move.w     (a7)+, $1f74(a0)
1828: 302cffe8                 move.w     -$18(a4), d0
182c: 06400032                 addi.w     #$32, d0
1830: 3940ffe8                 move.w     d0, -$18(a4)
1834: 600001e4                 bra.w      $1a1a
1838: 206c000c                 movea.l    $c(a4), a0
183c: 316cffe41f72             move.w     -$1c(a4), $1f72(a0)
1842: 600001d6                 bra.w      $1a1a
1846: 206c000c                 movea.l    $c(a4), a0
184a: 316cffe41f74             move.w     -$1c(a4), $1f74(a0)
1850: 594f                     subq.w     #$4, a7
1852: 486effe0                 pea.l      -$20(a6)
1856: 206c000c                 movea.l    $c(a4), a0
185a: 48681f72                 pea.l      $1f72(a0)
185e: 41fa01ce                 lea.l      $1a2e(pc), a0
1862: 43eeffd6                 lea.l      -$2a(a6), a1
1866: 4851                     pea.l      (a1)
1868: 22d8                     move.l     (a0)+, (a1)+
186a: 22d8                     move.l     (a0)+, (a1)+
186c: 32d8                     move.w     (a0)+, (a1)+
186e: 3f3c2004                 move.w     #$2004, -(a7)
1872: a9eb                     dc.w       $a9eb
1874: 486effd6                 pea.l      -$2a(a6)
1878: 4ead00da                 jsr        $da(a5) ; CODE 1 resource+0x0198
187c: 584f                     addq.w     #$4, a7
187e: 486cffe4                 pea.l      -$1c(a4)
1882: 486effe0                 pea.l      -$20(a6)
1886: 3f3c2004                 move.w     #$2004, -(a7)
188a: a9eb                     dc.w       $a9eb
188c: 486effe0                 pea.l      -$20(a6)
1890: 4ead0102                 jsr        $102(a5) ; CODE 1 resource+0x020a
1894: 206c000c                 movea.l    $c(a4), a0
1898: 544f                     addq.w     #$2, a7
189a: 315f1f6e                 move.w     (a7)+, $1f6e(a0)
189e: 594f                     subq.w     #$4, a7
18a0: 486effe0                 pea.l      -$20(a6)
18a4: 206c000c                 movea.l    $c(a4), a0
18a8: 48681f72                 pea.l      $1f72(a0)
18ac: 41fa0176                 lea.l      $1a24(pc), a0
18b0: 43eeffd6                 lea.l      -$2a(a6), a1
18b4: 4851                     pea.l      (a1)
18b6: 22d8                     move.l     (a0)+, (a1)+
18b8: 22d8                     move.l     (a0)+, (a1)+
18ba: 32d8                     move.w     (a0)+, (a1)+
18bc: 3f3c2004                 move.w     #$2004, -(a7)
18c0: a9eb                     dc.w       $a9eb
18c2: 486effd6                 pea.l      -$2a(a6)
18c6: 4ead00ea                 jsr        $ea(a5) ; CODE 1 resource+0x019c
18ca: 584f                     addq.w     #$4, a7
18cc: 486cffe4                 pea.l      -$1c(a4)
18d0: 486effe0                 pea.l      -$20(a6)
18d4: 3f3c2004                 move.w     #$2004, -(a7)
18d8: a9eb                     dc.w       $a9eb
18da: 486effe0                 pea.l      -$20(a6)
18de: 3f3c000d                 move.w     #$d, -(a7)
18e2: a9eb                     dc.w       $a9eb
18e4: 486effe0                 pea.l      -$20(a6)
18e8: 4ead0102                 jsr        $102(a5) ; CODE 1 resource+0x020a
18ec: 206c000c                 movea.l    $c(a4), a0
18f0: 544f                     addq.w     #$2, a7
18f2: 315f1f70                 move.w     (a7)+, $1f70(a0)
18f6: 302cffe8                 move.w     -$18(a4), d0
18fa: 06400032                 addi.w     #$32, d0
18fe: 3940ffe8                 move.w     d0, -$18(a4)
1902: 60000116                 bra.w      $1a1a
1906: 3e2cffe4                 move.w     -$1c(a4), d7
190a: 4a47                     tst.w      d7
190c: 6c18                     bge.b      $1926
190e: 48c7                     ext.l      d7
1910: 8ffc0168                 divs.w     #$168, d7
1914: 4847                     swap       d7
1916: 4a47                     tst.w      d7
1918: 6a02                     bpl.b      $191c
191a: 4447                     neg.w      d7
191c: 303c0168                 move.w     #$168, d0
1920: 9047                     sub.w      d7, d0
1922: 3e00                     move.w     d0, d7
1924: 600e                     bra.b      $1934
1926: 0c470167                 cmpi.w     #$167, d7
192a: 6f08                     ble.b      $1934
192c: 48c7                     ext.l      d7
192e: 8ffc0168                 divs.w     #$168, d7
1932: 4847                     swap       d7
1934: 206c000c                 movea.l    $c(a4), a0
1938: 31471f76                 move.w     d7, $1f76(a0)
193c: 554f                     subq.w     #$2, a7
193e: 206c000c                 movea.l    $c(a4), a0
1942: 2f08                     move.l     a0, -(a7)
1944: 3f07                     move.w     d7, -(a7)
1946: 2f0c                     move.l     a4, -(a7)
1948: 4ebaf6ec                 jsr        $1036(pc)
194c: 206c000c                 movea.l    $c(a4), a0
1950: 315f216c                 move.w     (a7)+, $216c(a0)
1954: 302cffe8                 move.w     -$18(a4), d0
1958: 06400028                 addi.w     #$28, d0
195c: 3940ffe8                 move.w     d0, -$18(a4)
1960: 206c000c                 movea.l    $c(a4), a0
1964: 317c00012186             move.w     #$1, $2186(a0)
196a: 600000ae                 bra.w      $1a1a
196e: 206c000c                 movea.l    $c(a4), a0
1972: 302cffee                 move.w     -$12(a4), d0
1976: d040                     add.w      d0, d0
1978: 06401f56                 addi.w     #$1f56, d0
197c: 31acffe40000             move.w     -$1c(a4), (a0, d0.w)
1982: 60000096                 bra.w      $1a1a
1986: 3f2cffe4                 move.w     -$1c(a4), -(a7)
198a: 2f0c                     move.l     a4, -(a7)
198c: 4ebaf7fe                 jsr        $118c(pc)
1990: 60000088                 bra.w      $1a1a
1994: 0c400013                 cmpi.w     #$13, d0
1998: 6430                     bcc.b      $19ca
199a: d040                     add.w      d0, d0
199c: 303b0006                 move.w     $19a4(pc, d0.w), d0
19a0: 4efb0002                 jmp        $19a4(pc, d0.w)
19a4: f9f6                     dc.w       $f9f6
19a6: f9f6                     dc.w       $f9f6
19a8: f9fa                     dc.w       $f9fa
19aa: fa34                     dc.w       $fa34
19ac: fb90                     dc.w       $fb90
19ae: fb94                     dc.w       $fb94
19b0: fbd6                     dc.w       $fbd6
19b2: fc10                     dc.w       $fc10
19b4: fc14                     dc.w       $fc14
19b6: fc3c                     dc.w       $fc3c
19b8: fc40                     dc.w       $fc40
19ba: fc40                     dc.w       $fc40
19bc: fc40                     dc.w       $fc40
19be: fc58                     dc.w       $fc58
19c0: fe94                     dc.w       $fe94
19c2: fea2                     dc.w       $fea2
19c4: ff62                     dc.w       $ff62
19c6: ffca                     dc.w       $ffca
19c8: ffe2                     dc.w       $ffe2
19ca: 604e                     bra.b      $1a1a
19cc: 0c2c0005ffed             cmpi.b     #$5, -$13(a4)
19d2: 663c                     bne.b      $1a10
19d4: 206c000c                 movea.l    $c(a4), a0
19d8: 3e2cffee                 move.w     -$12(a4), d7
19dc: de47                     add.w      d7, d7
19de: 41e81f7c                 lea.l      $1f7c(a0), a0
19e2: 3e307000                 move.w     (a0, d7.w), d7
19e6: 4a47                     tst.w      d7
19e8: 5dc0                     slt.b      d0
19ea: 0c4700c8                 cmpi.w     #$c8, d7
19ee: 5ec1                     sgt.b      d1
19f0: 8001                     or.b       d1, d0
19f2: 6708                     beq.b      $19fc
19f4: 2f0c                     move.l     a4, -(a7)
19f6: 4ebaf628                 jsr        $1020(pc)
19fa: 601e                     bra.b      $1a1a
19fc: 206c000c                 movea.l    $c(a4), a0
1a00: 3007                     move.w     d7, d0
1a02: d040                     add.w      d0, d0
1a04: 06401f7c                 addi.w     #$1f7c, d0
1a08: 31acffe40000             move.w     -$1c(a4), (a0, d0.w)
1a0e: 600a                     bra.b      $1a1a
1a10: 3f3c7fff                 move.w     #$7fff, -(a7)
1a14: 2f0c                     move.l     a4, -(a7)
1a16: 4ebaf5ba                 jsr        $fd2(pc)
1a1a: 4cdf10e0                 movem.l    (a7)+, d5-d7/a4
1a1e: 4e5e                     unlk       a6
1a20: 2e9f                     move.l     (a7)+, (a7)
1a22: 4e75                     rts        
1a24: 3ff9                     .byte      0x3f, 0xf9
1a26: 8efa3554                 divu.w     $4f7c(pc), d7
1a2a: 8f682c29                 or.w       d7, $2c29(a0)
1a2e: 3ff9                     .byte      0x3f, 0xf9
1a30: 8efa3554                 divu.w     $4f86(pc), d7
1a34: 8f682c29                 or.w       d7, $2c29(a0)
1a38: 4004                     negx.b     d4
1a3a: e52e                     lsl.b      d2, d6
1a3c: e0f3cb3e57534004e52e     asr.w      ([$57534004, a3], a4.l * 2, $e52e)
1a46: e0f3cb3e57534004e52e     asr.w      ([$57534004, a3], a4.l * 2, $e52e)
1a50: e0f3cb3e57534004e52e     asr.w      ([$57534004, a3], a4.l * 2, $e52e)
1a5a: e0f3cb3e57534e560000     asr.w      ([$57534e56, a3], a4.l * 2)
1a64: 4a6e000c                 tst.w      $c(a6)
1a68: 5dc0                     slt.b      d0
1a6a: 206e0008                 movea.l    $8(a6), a0
1a6e: 2068000c                 movea.l    $c(a0), a0
1a72: 322e000c                 move.w     $c(a6), d1
1a76: b2681f54                 cmp.w      $1f54(a0), d1
1a7a: 5ec1                     sgt.b      d1
1a7c: 8001                     or.b       d1, d0
1a7e: 670e                     beq.b      $1a8e
1a80: 2f2e0008                 move.l     $8(a6), -(a7)
1a84: 4ebaf59a                 jsr        $1020(pc)
1a88: 422e000e                 clr.b      $e(a6)
1a8c: 6006                     bra.b      $1a94
1a8e: 1d7c0001000e             move.b     #$1, $e(a6)
1a94: 4e5e                     unlk       a6
1a96: 205f                     movea.l    (a7)+, a0
1a98: 5c4f                     addq.w     #$6, a7
1a9a: 4ed0                     jmp        (a0)
1a9c: 4e560000                 link.w     a6, #$0
1aa0: 2f0c                     move.l     a4, -(a7)
1aa2: 286e0008                 movea.l    $8(a6), a4
1aa6: 554f                     subq.w     #$2, a7
1aa8: 206c000c                 movea.l    $c(a4), a0
1aac: 3f281f6c                 move.w     $1f6c(a0), -(a7)
1ab0: 2f0c                     move.l     a4, -(a7)
1ab2: 4ebaffac                 jsr        $1a60(pc)
1ab6: 4a1f                     tst.b      (a7)+
1ab8: 672e                     beq.b      $1ae8
1aba: 2f0c                     move.l     a4, -(a7)
1abc: 4ebaf720                 jsr        $11de(pc)
1ac0: 206c000c                 movea.l    $c(a4), a0
1ac4: 39681f6cffe6             move.w     $1f6c(a0), -$1a(a4)
1aca: 206c000c                 movea.l    $c(a4), a0
1ace: 316cffe42118             move.w     -$1c(a4), $2118(a0)
1ad4: 206c000c                 movea.l    $c(a4), a0
1ad8: 117c00012116             move.b     #$1, $2116(a0)
1ade: 302cffe8                 move.w     -$18(a4), d0
1ae2: 5240                     addq.w     #$1, d0
1ae4: 3940ffe8                 move.w     d0, -$18(a4)
1ae8: 285f                     movea.l    (a7)+, a4
1aea: 4e5e                     unlk       a6
1aec: 2e9f                     move.l     (a7)+, (a7)
1aee: 4e75                     rts        
1af0: 4e56ffda                 link.w     a6, #$ffda
1af4: 48e71f00                 movem.l    d3-d7, -(a7)
1af8: 3a2e000a                 move.w     $a(a6), d5
1afc: 4206                     clr.b      d6
1afe: 302dc382                 move.w     -$3c7e(a5), d0
1b02: 5340                     subq.w     #$1, d0
1b04: 206e000c                 movea.l    $c(a6), a0
1b08: 31401f68                 move.w     d0, $1f68(a0)
1b0c: 206e000c                 movea.l    $c(a6), a0
1b10: 3d68210effe6             move.w     $210e(a0), -$1a(a6)
1b16: 206e000c                 movea.l    $c(a6), a0
1b1a: 3d682114ffe4             move.w     $2114(a0), -$1c(a6)
1b20: 426effe8                 clr.w      -$18(a6)
1b24: 206e000c                 movea.l    $c(a6), a0
1b28: 3d681f60ffdc             move.w     $1f60(a0), -$24(a6)
1b2e: 206e000c                 movea.l    $c(a6), a0
1b32: 3d681f62ffde             move.w     $1f62(a0), -$22(a6)
1b38: 4a2e0008                 tst.b      $8(a6)
1b3c: 67000380                 beq.w      $1ebe
1b40: 206e000c                 movea.l    $c(a6), a0
1b44: 4a681f5c                 tst.w      $1f5c(a0)
1b48: 6f48                     ble.b      $1b92
1b4a: 206e000c                 movea.l    $c(a6), a0
1b4e: 30281f5c                 move.w     $1f5c(a0), d0
1b52: 5340                     subq.w     #$1, d0
1b54: 206e000c                 movea.l    $c(a6), a0
1b58: 31401f5c                 move.w     d0, $1f5c(a0)
1b5c: 206e000c                 movea.l    $c(a6), a0
1b60: 4a681f5c                 tst.w      $1f5c(a0)
1b64: 6e2c                     bgt.b      $1b92
1b66: 206e000c                 movea.l    $c(a6), a0
1b6a: 1028216e                 move.b     $216e(a0), d0
1b6e: 5300                     subq.b     #$1, d0
1b70: 206e000c                 movea.l    $c(a6), a0
1b74: 1228216f                 move.b     $216f(a0), d1
1b78: 5301                     subq.b     #$1, d1
1b7a: c001                     and.b      d1, d0
1b7c: 670a                     beq.b      $1b88
1b7e: 206e000c                 movea.l    $c(a6), a0
1b82: 42681f5c                 clr.w      $1f5c(a0)
1b86: 600a                     bra.b      $1b92
1b88: 206e000c                 movea.l    $c(a6), a0
1b8c: 317c00011f5c             move.w     #$1, $1f5c(a0)
1b92: 206e000c                 movea.l    $c(a6), a0
1b96: 4a681f6a                 tst.w      $1f6a(a0)
1b9a: 56c0                     sne.b      d0
1b9c: 206e000c                 movea.l    $c(a6), a0
1ba0: 12282116                 move.b     $2116(a0), d1
1ba4: 5301                     subq.b     #$1, d1
1ba6: c001                     and.b      d1, d0
1ba8: 67000314                 beq.w      $1ebe
1bac: 2f0e                     move.l     a6, -(a7)
1bae: 4ebafeec                 jsr        $1a9c(pc)
1bb2: 6000030a                 bra.w      $1ebe
1bb6: 362effe8                 move.w     -$18(a6), d3
1bba: 206e000c                 movea.l    $c(a6), a0
1bbe: 302effe6                 move.w     -$1a(a6), d0
1bc2: e540                     asl.w      #$2, d0
1bc4: 2d700010ffec             move.l     $10(a0, d0.w), -$14(a6)
1bca: 302effe6                 move.w     -$1a(a6), d0
1bce: 5240                     addq.w     #$1, d0
1bd0: 3d40ffe6                 move.w     d0, -$1a(a6)
1bd4: 102effec                 move.b     -$14(a6), d0
1bd8: 60000298                 bra.w      $1e72
1bdc: 600002d6                 bra.w      $1eb4
1be0: 554f                     subq.w     #$2, a7
1be2: 2f0e                     move.l     a6, -(a7)
1be4: 4ebaf666                 jsr        $124c(pc)
1be8: 3d5fffe4                 move.w     (a7)+, -$1c(a6)
1bec: 600002c6                 bra.w      $1eb4
1bf0: 554f                     subq.w     #$2, a7
1bf2: 2f0e                     move.l     a6, -(a7)
1bf4: 4ebaf656                 jsr        $124c(pc)
1bf8: 301f                     move.w     (a7)+, d0
1bfa: d06effe4                 add.w      -$1c(a6), d0
1bfe: 3d40ffe4                 move.w     d0, -$1c(a6)
1c02: 600002b0                 bra.w      $1eb4
1c06: 554f                     subq.w     #$2, a7
1c08: 2f0e                     move.l     a6, -(a7)
1c0a: 4ebaf640                 jsr        $124c(pc)
1c0e: 302effe4                 move.w     -$1c(a6), d0
1c12: 905f                     sub.w      (a7)+, d0
1c14: 3d40ffe4                 move.w     d0, -$1c(a6)
1c18: 6000029a                 bra.w      $1eb4
1c1c: 554f                     subq.w     #$2, a7
1c1e: 2f0e                     move.l     a6, -(a7)
1c20: 4ebaf62a                 jsr        $124c(pc)
1c24: 301f                     move.w     (a7)+, d0
1c26: c1eeffe4                 muls.w     -$1c(a6), d0
1c2a: 3d40ffe4                 move.w     d0, -$1c(a6)
1c2e: 60000284                 bra.w      $1eb4
1c32: 554f                     subq.w     #$2, a7
1c34: 2f0e                     move.l     a6, -(a7)
1c36: 4ebaf614                 jsr        $124c(pc)
1c3a: 3e1f                     move.w     (a7)+, d7
1c3c: 4a47                     tst.w      d7
1c3e: 661a                     bne.b      $1c5a
1c40: 4a6effe4                 tst.w      -$1c(a6)
1c44: 6f0a                     ble.b      $1c50
1c46: 3d7c7fffffe4             move.w     #$7fff, -$1c(a6)
1c4c: 60000266                 bra.w      $1eb4
1c50: 3d7c8001ffe4             move.w     #$8001, -$1c(a6)
1c56: 6000025c                 bra.w      $1eb4
1c5a: 302effe4                 move.w     -$1c(a6), d0
1c5e: 48c0                     ext.l      d0
1c60: 81c7                     divs.w     d7, d0
1c62: 3d40ffe4                 move.w     d0, -$1c(a6)
1c66: 6000024c                 bra.w      $1eb4
1c6a: 554f                     subq.w     #$2, a7
1c6c: 2f0e                     move.l     a6, -(a7)
1c6e: 4ebaf5dc                 jsr        $124c(pc)
1c72: 3e1f                     move.w     (a7)+, d7
1c74: 4a47                     tst.w      d7
1c76: 6608                     bne.b      $1c80
1c78: 426effe4                 clr.w      -$1c(a6)
1c7c: 60000236                 bra.w      $1eb4
1c80: 302effe4                 move.w     -$1c(a6), d0
1c84: 48c0                     ext.l      d0
1c86: 81c7                     divs.w     d7, d0
1c88: 4840                     swap       d0
1c8a: 3d40ffe4                 move.w     d0, -$1c(a6)
1c8e: 60000224                 bra.w      $1eb4
1c92: 302effe4                 move.w     -$1c(a6), d0
1c96: 48c0                     ext.l      d0
1c98: 2f00                     move.l     d0, -(a7)
1c9a: 554f                     subq.w     #$2, a7
1c9c: 2f0e                     move.l     a6, -(a7)
1c9e: 4ebaf5ac                 jsr        $124c(pc)
1ca2: 321f                     move.w     (a7)+, d1
1ca4: 201f                     move.l     (a7)+, d0
1ca6: 48c1                     ext.l      d1
1ca8: c081                     and.l      d1, d0
1caa: 3d40ffe4                 move.w     d0, -$1c(a6)
1cae: 60000204                 bra.w      $1eb4
1cb2: 302effe4                 move.w     -$1c(a6), d0
1cb6: 48c0                     ext.l      d0
1cb8: 2f00                     move.l     d0, -(a7)
1cba: 554f                     subq.w     #$2, a7
1cbc: 2f0e                     move.l     a6, -(a7)
1cbe: 4ebaf58c                 jsr        $124c(pc)
1cc2: 321f                     move.w     (a7)+, d1
1cc4: 201f                     move.l     (a7)+, d0
1cc6: 48c1                     ext.l      d1
1cc8: 8081                     or.l       d1, d0
1cca: 3d40ffe4                 move.w     d0, -$1c(a6)
1cce: 600001e4                 bra.w      $1eb4
1cd2: 302effe4                 move.w     -$1c(a6), d0
1cd6: 48c0                     ext.l      d0
1cd8: 2f00                     move.l     d0, -(a7)
1cda: 554f                     subq.w     #$2, a7
1cdc: 2f0e                     move.l     a6, -(a7)
1cde: 4ebaf56c                 jsr        $124c(pc)
1ce2: 321f                     move.w     (a7)+, d1
1ce4: 201f                     move.l     (a7)+, d0
1ce6: 48c1                     ext.l      d1
1ce8: b181                     eor.l      d0, d1
1cea: 3d41ffe4                 move.w     d1, -$1c(a6)
1cee: 600001c4                 bra.w      $1eb4
1cf2: 554f                     subq.w     #$2, a7
1cf4: 2f0e                     move.l     a6, -(a7)
1cf6: 4ebaf554                 jsr        $124c(pc)
1cfa: 301f                     move.w     (a7)+, d0
1cfc: b06effe4                 cmp.w      -$1c(a6), d0
1d00: 670001b2                 beq.w      $1eb4
1d04: 302effe6                 move.w     -$1a(a6), d0
1d08: 5240                     addq.w     #$1, d0
1d0a: 3d40ffe6                 move.w     d0, -$1a(a6)
1d0e: 600001a4                 bra.w      $1eb4
1d12: 554f                     subq.w     #$2, a7
1d14: 2f0e                     move.l     a6, -(a7)
1d16: 4ebaf534                 jsr        $124c(pc)
1d1a: 301f                     move.w     (a7)+, d0
1d1c: b06effe4                 cmp.w      -$1c(a6), d0
1d20: 6d000192                 blt.w      $1eb4
1d24: 302effe6                 move.w     -$1a(a6), d0
1d28: 5240                     addq.w     #$1, d0
1d2a: 3d40ffe6                 move.w     d0, -$1a(a6)
1d2e: 60000184                 bra.w      $1eb4
1d32: 554f                     subq.w     #$2, a7
1d34: 2f0e                     move.l     a6, -(a7)
1d36: 4ebaf514                 jsr        $124c(pc)
1d3a: 301f                     move.w     (a7)+, d0
1d3c: b06effe4                 cmp.w      -$1c(a6), d0
1d40: 6f000172                 ble.w      $1eb4
1d44: 302effe6                 move.w     -$1a(a6), d0
1d48: 5240                     addq.w     #$1, d0
1d4a: 3d40ffe6                 move.w     d0, -$1a(a6)
1d4e: 60000164                 bra.w      $1eb4
1d52: 554f                     subq.w     #$2, a7
1d54: 2f0e                     move.l     a6, -(a7)
1d56: 4ebaf4f4                 jsr        $124c(pc)
1d5a: 301f                     move.w     (a7)+, d0
1d5c: b06effe4                 cmp.w      -$1c(a6), d0
1d60: 6e000152                 bgt.w      $1eb4
1d64: 302effe6                 move.w     -$1a(a6), d0
1d68: 5240                     addq.w     #$1, d0
1d6a: 3d40ffe6                 move.w     d0, -$1a(a6)
1d6e: 60000144                 bra.w      $1eb4
1d72: 554f                     subq.w     #$2, a7
1d74: 2f0e                     move.l     a6, -(a7)
1d76: 4ebaf4d4                 jsr        $124c(pc)
1d7a: 301f                     move.w     (a7)+, d0
1d7c: b06effe4                 cmp.w      -$1c(a6), d0
1d80: 6c000132                 bge.w      $1eb4
1d84: 302effe6                 move.w     -$1a(a6), d0
1d88: 5240                     addq.w     #$1, d0
1d8a: 3d40ffe6                 move.w     d0, -$1a(a6)
1d8e: 60000124                 bra.w      $1eb4
1d92: 554f                     subq.w     #$2, a7
1d94: 2f0e                     move.l     a6, -(a7)
1d96: 4ebaf4b4                 jsr        $124c(pc)
1d9a: 301f                     move.w     (a7)+, d0
1d9c: b06effe4                 cmp.w      -$1c(a6), d0
1da0: 66000112                 bne.w      $1eb4
1da4: 302effe6                 move.w     -$1a(a6), d0
1da8: 5240                     addq.w     #$1, d0
1daa: 3d40ffe6                 move.w     d0, -$1a(a6)
1dae: 60000104                 bra.w      $1eb4
1db2: 2f0e                     move.l     a6, -(a7)
1db4: 4ebaf5a6                 jsr        $135c(pc)
1db8: 600000fa                 bra.w      $1eb4
1dbc: 554f                     subq.w     #$2, a7
1dbe: 2f0e                     move.l     a6, -(a7)
1dc0: 4ebaf48a                 jsr        $124c(pc)
1dc4: 3e1f                     move.w     (a7)+, d7
1dc6: 554f                     subq.w     #$2, a7
1dc8: 3f07                     move.w     d7, -(a7)
1dca: 2f0e                     move.l     a6, -(a7)
1dcc: 4ebafc92                 jsr        $1a60(pc)
1dd0: 4a1f                     tst.b      (a7)+
1dd2: 670000e0                 beq.w      $1eb4
1dd6: 2f0e                     move.l     a6, -(a7)
1dd8: 4ebaf404                 jsr        $11de(pc)
1ddc: 3d47ffe6                 move.w     d7, -$1a(a6)
1de0: 600000d2                 bra.w      $1eb4
1de4: 554f                     subq.w     #$2, a7
1de6: 2f0e                     move.l     a6, -(a7)
1de8: 4ebaf462                 jsr        $124c(pc)
1dec: 3e1f                     move.w     (a7)+, d7
1dee: 554f                     subq.w     #$2, a7
1df0: 3f07                     move.w     d7, -(a7)
1df2: 2f0e                     move.l     a6, -(a7)
1df4: 4ebafc6a                 jsr        $1a60(pc)
1df8: 4a1f                     tst.b      (a7)+
1dfa: 670000b8                 beq.w      $1eb4
1dfe: 3d47ffe6                 move.w     d7, -$1a(a6)
1e02: 600000b0                 bra.w      $1eb4
1e06: 554f                     subq.w     #$2, a7
1e08: 2f0e                     move.l     a6, -(a7)
1e0a: 4ebaf3ec                 jsr        $11f8(pc)
1e0e: 3d5fffe6                 move.w     (a7)+, -$1a(a6)
1e12: 554f                     subq.w     #$2, a7
1e14: 3f2effe6                 move.w     -$1a(a6), -(a7)
1e18: 2f0e                     move.l     a6, -(a7)
1e1a: 4ebafc44                 jsr        $1a60(pc)
1e1e: 181f                     move.b     (a7)+, d4
1e20: 60000092                 bra.w      $1eb4
1e24: 554f                     subq.w     #$2, a7
1e26: 2f0e                     move.l     a6, -(a7)
1e28: 4ebaf3ce                 jsr        $11f8(pc)
1e2c: 3d5fffe6                 move.w     (a7)+, -$1a(a6)
1e30: 554f                     subq.w     #$2, a7
1e32: 3f2effe6                 move.w     -$1a(a6), -(a7)
1e36: 2f0e                     move.l     a6, -(a7)
1e38: 4ebafc26                 jsr        $1a60(pc)
1e3c: 4a1f                     tst.b      (a7)+
1e3e: 67000074                 beq.w      $1eb4
1e42: 206e000c                 movea.l    $c(a6), a0
1e46: 3d682118ffe4             move.w     $2118(a0), -$1c(a6)
1e4c: 206e000c                 movea.l    $c(a6), a0
1e50: 42282116                 clr.b      $2116(a0)
1e54: 605e                     bra.b      $1eb4
1e56: 302effe8                 move.w     -$18(a6), d0
1e5a: 5340                     subq.w     #$1, d0
1e5c: 3d40ffe8                 move.w     d0, -$18(a6)
1e60: 1c2dc02e                 move.b     -$3fd2(a5), d6
1e64: 604e                     bra.b      $1eb4
1e66: 3f2effe6                 move.w     -$1a(a6), -(a7)
1e6a: 2f0e                     move.l     a6, -(a7)
1e6c: 4ebaf164                 jsr        $fd2(pc)
1e70: 6042                     bra.b      $1eb4
1e72: 024000ff                 andi.w     #$ff, d0
1e76: 0c400017                 cmpi.w     #$17, d0
1e7a: 6438                     bcc.b      $1eb4
1e7c: d040                     add.w      d0, d0
1e7e: 303b0006                 move.w     $1e86(pc, d0.w), d0
1e82: 4efb0002                 jmp        $1e86(pc, d0.w)
1e86: fd56                     dc.w       $fd56
1e88: fd5a                     dc.w       $fd5a
1e8a: fd6a                     dc.w       $fd6a
1e8c: fd80                     dc.w       $fd80
1e8e: fd96                     dc.w       $fd96
1e90: fdac                     dc.w       $fdac
1e92: fde4                     dc.w       $fde4
1e94: fe0c                     dc.w       $fe0c
1e96: fe2c                     dc.w       $fe2c
1e98: fe4c                     dc.w       $fe4c
1e9a: fe6c                     dc.w       $fe6c
1e9c: fe8c                     dc.w       $fe8c
1e9e: fecc                     dc.w       $fecc
1ea0: feac                     dc.w       $feac
1ea2: feec                     dc.w       $feec
1ea4: ff0c                     dc.w       $ff0c
1ea6: ff2c                     dc.w       $ff2c
1ea8: ff36                     dc.w       $ff36
1eaa: ff5e                     dc.w       $ff5e
1eac: ff80                     dc.w       $ff80
1eae: ff9e                     dc.w       $ff9e
1eb0: ffd0                     dc.w       $ffd0
1eb2: ffe0                     dc.w       $ffe0
1eb4: 302effe8                 move.w     -$18(a6), d0
1eb8: 5240                     addq.w     #$1, d0
1eba: 3d40ffe8                 move.w     d0, -$18(a6)
1ebe: ba6effe8                 cmp.w      -$18(a6), d5
1ec2: 5ec0                     sgt.b      d0
1ec4: 1206                     move.b     d6, d1
1ec6: 5301                     subq.b     #$1, d1
1ec8: c001                     and.b      d1, d0
1eca: 6600fcea                 bne.w      $1bb6
1ece: 302effe8                 move.w     -$18(a6), d0
1ed2: 9045                     sub.w      d5, d0
1ed4: 206e000c                 movea.l    $c(a6), a0
1ed8: 31402110                 move.w     d0, $2110(a0)
1edc: 206e000c                 movea.l    $c(a6), a0
1ee0: 316effe6210e             move.w     -$1a(a6), $210e(a0)
1ee6: 206e000c                 movea.l    $c(a6), a0
1eea: 316effe42114             move.w     -$1c(a6), $2114(a0)
1ef0: 206e000c                 movea.l    $c(a6), a0
1ef4: 302effdc                 move.w     -$24(a6), d0
1ef8: b0681f60                 cmp.w      $1f60(a0), d0
1efc: 56c0                     sne.b      d0
1efe: 206e000c                 movea.l    $c(a6), a0
1f02: 322effde                 move.w     -$22(a6), d1
1f06: b2681f62                 cmp.w      $1f62(a0), d1
1f0a: 56c1                     sne.b      d1
1f0c: 8001                     or.b       d1, d0
1f0e: 6760                     beq.b      $1f70
1f10: 206e000c                 movea.l    $c(a6), a0
1f14: 2f08                     move.l     a0, -(a7)
1f16: 554f                     subq.w     #$2, a7
1f18: 206e000c                 movea.l    $c(a6), a0
1f1c: 3f281f62                 move.w     $1f62(a0), -(a7)
1f20: 4ebae10e                 jsr        $30(pc)
1f24: 301f                     move.w     (a7)+, d0
1f26: 205f                     movea.l    (a7)+, a0
1f28: 48c0                     ext.l      d0
1f2a: 81fc0004                 divs.w     #$4, d0
1f2e: c1e81f60                 muls.w     $1f60(a0), d0
1f32: 48c0                     ext.l      d0
1f34: 81fc0004                 divs.w     #$4, d0
1f38: 206e000c                 movea.l    $c(a6), a0
1f3c: 3140215a                 move.w     d0, $215a(a0)
1f40: 206e000c                 movea.l    $c(a6), a0
1f44: 2f08                     move.l     a0, -(a7)
1f46: 554f                     subq.w     #$2, a7
1f48: 206e000c                 movea.l    $c(a6), a0
1f4c: 3f281f62                 move.w     $1f62(a0), -(a7)
1f50: 4ebae148                 jsr        $9a(pc)
1f54: 301f                     move.w     (a7)+, d0
1f56: 205f                     movea.l    (a7)+, a0
1f58: 48c0                     ext.l      d0
1f5a: 81fc0004                 divs.w     #$4, d0
1f5e: c1e81f60                 muls.w     $1f60(a0), d0
1f62: 48c0                     ext.l      d0
1f64: 81fcfffc                 divs.w     #$fffc, d0
1f68: 206e000c                 movea.l    $c(a6), a0
1f6c: 3140215c                 move.w     d0, $215c(a0)
1f70: 1d460010                 move.b     d6, $10(a6)
1f74: 4cdf00f8                 movem.l    (a7)+, d3-d7
1f78: 4e5e                     unlk       a6
1f7a: 205f                     movea.l    (a7)+, a0
1f7c: 504f                     addq.w     #$8, a7
1f7e: 4ed0                     jmp        (a0)
1f80: 4e56ffe2                 link.w     a6, #$ffe2
1f84: 2f0c                     move.l     a4, -(a7)
1f86: 286e0008                 movea.l    $8(a6), a4
1f8a: 206e000c                 movea.l    $c(a6), a0
1f8e: 43eeffe2                 lea.l      -$1e(a6), a1
1f92: 22d8                     move.l     (a0)+, (a1)+
1f94: 22d8                     move.l     (a0)+, (a1)+
1f96: 22d8                     move.l     (a0)+, (a1)+
1f98: 32d8                     move.w     (a0)+, (a1)+
1f9a: 4a2df91c                 tst.b      -$6e4(a5)
1f9e: 6742                     beq.b      $1fe2
1fa0: 102cfbf5                 move.b     -$40b(a4), d0
1fa4: 5300                     subq.b     #$1, d0
1fa6: 322cfbf6                 move.w     -$40a(a4), d1
1faa: b26effe2                 cmp.w      -$1e(a6), d1
1fae: 5fc1                     sle.b      d1
1fb0: 8001                     or.b       d1, d0
1fb2: 672e                     beq.b      $1fe2
1fb4: 4ead01ba                 jsr        $1ba(a5) ; CODE 1 resource+0x07d4
1fb8: 2f2effec                 move.l     -$14(a6), -(a7)
1fbc: 2f2effe8                 move.l     -$18(a6), -(a7)
1fc0: 42a7                     clr.l      -(a7)
1fc2: 4ead01c2                 jsr        $1c2(a5) ; CODE 1 resource+0x06c2
1fc6: 594f                     subq.w     #$4, a7
1fc8: a975                     dc.w       $a975
1fca: 201f                     move.l     (a7)+, d0
1fcc: d0aeffe4                 add.l      -$1c(a6), d0
1fd0: 5380                     subq.l     #$1, d0
1fd2: 2940fbf8                 move.l     d0, -$408(a4)
1fd6: 396effe2fbf6             move.w     -$1e(a6), -$40a(a4)
1fdc: 197c0001fbf5             move.b     #$1, -$40b(a4)
1fe2: 285f                     movea.l    (a7)+, a4
1fe4: 4e5e                     unlk       a6
1fe6: 205f                     movea.l    (a7)+, a0
1fe8: 504f                     addq.w     #$8, a7
1fea: 4ed0                     jmp        (a0)
1fec: 4e56ffe6                 link.w     a6, #$ffe6
1ff0: 48e70308                 movem.l    d6-d7/a4, -(a7)
1ff4: 286e0008                 movea.l    $8(a6), a4
1ff8: 2c2e000c                 move.l     $c(a6), d6
1ffc: 4267                     clr.w      -(a7)
1ffe: 3f3c00ca                 move.w     #$ca, -(a7)
2002: a893                     dc.w       $a893
2004: 3f3c0078                 move.w     #$78, -(a7)
2008: 3f3c00ca                 move.w     #$ca, -(a7)
200c: a891                     dc.w       $a891
200e: 397cfffff836             move.w     #$ffff, -$7ca(a4)
2014: 397cfffff834             move.w     #$ffff, -$7cc(a4)
201a: 426cf832                 clr.w      -$7ce(a4)
201e: 2f2cfec4                 move.l     -$13c(a4), -(a7)
2022: a873                     dc.w       $a873
2024: 486cfeac                 pea.l      -$154(a4)
2028: 4267                     clr.w      -(a7)
202a: 3f3c0047                 move.w     #$47, -(a7)
202e: 3f3c0078                 move.w     #$78, -(a7)
2032: 3f3c00c6                 move.w     #$c6, -(a7)
2036: a8a7                     dc.w       $a8a7
2038: 486cfeac                 pea.l      -$154(a4)
203c: a8a3                     dc.w       $a8a3
203e: 4247                     clr.w      d7
2040: 3007                     move.w     d7, d0
2042: c1fc0018                 muls.w     #$18, d0
2046: 0640f83c                 addi.w     #$f83c, d0
204a: 3f340000                 move.w     (a4, d0.w), -(a7)
204e: 3007                     move.w     d7, d0
2050: c1fc0018                 muls.w     #$18, d0
2054: 0640f83a                 addi.w     #$f83a, d0
2058: 3f340000                 move.w     (a4, d0.w), -(a7)
205c: a893                     dc.w       $a893
205e: 3007                     move.w     d7, d0
2060: c1fc0018                 muls.w     #$18, d0
2064: 0640f83e                 addi.w     #$f83e, d0
2068: 48740000                 pea.l      (a4, d0.w)
206c: a884                     dc.w       $a884
206e: 3007                     move.w     d7, d0
2070: c1fc0018                 muls.w     #$18, d0
2074: 2f00                     move.l     d0, -(a7)
2076: 554f                     subq.w     #$2, a7
2078: 3007                     move.w     d7, d0
207a: c1fc0018                 muls.w     #$18, d0
207e: 0640f83e                 addi.w     #$f83e, d0
2082: 48740000                 pea.l      (a4, d0.w)
2086: a88c                     dc.w       $a88c
2088: 321f                     move.w     (a7)+, d1
208a: 201f                     move.l     (a7)+, d0
208c: 0640f83c                 addi.w     #$f83c, d0
2090: d2740000                 add.w      (a4, d0.w), d1
2094: 3007                     move.w     d7, d0
2096: c1fc0018                 muls.w     #$18, d0
209a: 0640f850                 addi.w     #$f850, d0
209e: 39810000                 move.w     d1, (a4, d0.w)
20a2: 3007                     move.w     d7, d0
20a4: c1fc0018                 muls.w     #$18, d0
20a8: 0640f850                 addi.w     #$f850, d0
20ac: 3f340000                 move.w     (a4, d0.w), -(a7)
20b0: 3007                     move.w     d7, d0
20b2: c1fc0018                 muls.w     #$18, d0
20b6: 0640f83a                 addi.w     #$f83a, d0
20ba: 3f340000                 move.w     (a4, d0.w), -(a7)
20be: a893                     dc.w       $a893
20c0: 2046                     movea.l    d6, a0
20c2: 2050                     movea.l    (a0), a0
20c4: 3007                     move.w     d7, d0
20c6: d040                     add.w      d0, d0
20c8: 06402072                 addi.w     #$2072, d0
20cc: 30300000                 move.w     (a0, d0.w), d0
20d0: 48c0                     ext.l      d0
20d2: 2f00                     move.l     d0, -(a7)
20d4: 486cfd0e                 pea.l      -$2f2(a4)
20d8: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
20dc: 486cfd0e                 pea.l      -$2f2(a4)
20e0: a884                     dc.w       $a884
20e2: 2046                     movea.l    d6, a0
20e4: 2050                     movea.l    (a0), a0
20e6: 3007                     move.w     d7, d0
20e8: d040                     add.w      d0, d0
20ea: 3207                     move.w     d7, d1
20ec: c3fc0018                 muls.w     #$18, d1
20f0: 06402072                 addi.w     #$2072, d0
20f4: 0641f84e                 addi.w     #$f84e, d1
20f8: 39b000001000             move.w     (a0, d0.w), (a4, d1.w)
20fe: 5247                     addq.w     #$1, d7
2100: 0c470012                 cmpi.w     #$12, d7
2104: 6f00ff3a                 ble.w      $2040
2108: 4cdf10c0                 movem.l    (a7)+, d6-d7/a4
210c: 4e5e                     unlk       a6
210e: 205f                     movea.l    (a7)+, a0
2110: 504f                     addq.w     #$8, a7
2112: 4ed0                     jmp        (a0)
2114: 4e56ffde                 link.w     a6, #$ffde
2118: 48e70f38                 movem.l    d4-d7/a2-a4, -(a7)
211c: 286e0008                 movea.l    $8(a6), a4
2120: 246e000c                 movea.l    $c(a6), a2
2124: 486cfed4                 pea.l      -$12c(a4)
2128: a874                     dc.w       $a874
212a: 2f2cfec4                 move.l     -$13c(a4), -(a7)
212e: a873                     dc.w       $a873
2130: 7801                     moveq      #$1, d4
2132: 3004                     move.w     d4, d0
2134: 06400011                 addi.w     #$11, d0
2138: 3d40ffde                 move.w     d0, -$22(a6)
213c: 4247                     clr.w      d7
213e: 600000b0                 bra.w      $21f0
2142: 0c470010                 cmpi.w     #$10, d7
2146: 6608                     bne.b      $2150
2148: 2052                     movea.l    (a2), a0
214a: 3c282288                 move.w     $2288(a0), d6
214e: 602c                     bra.b      $217c
2150: 0c470012                 cmpi.w     #$12, d7
2154: 6614                     bne.b      $216a
2156: 2052                     movea.l    (a2), a0
2158: 3c282230                 move.w     $2230(a0), d6
215c: 7a03                     moveq      #$3, d5
215e: cbecf838                 muls.w     -$7c8(a4), d5
2162: 48c5                     ext.l      d5
2164: 8bfc0002                 divs.w     #$2, d5
2168: 6012                     bra.b      $217c
216a: 2052                     movea.l    (a2), a0
216c: 3c07                     move.w     d7, d6
216e: dc46                     add.w      d6, d6
2170: 41e82072                 lea.l      $2072(a0), a0
2174: 3c306000                 move.w     (a0, d6.w), d6
2178: 3a2cf838                 move.w     -$7c8(a4), d5
217c: 3007                     move.w     d7, d0
217e: c1fc0018                 muls.w     #$18, d0
2182: 0640f84e                 addi.w     #$f84e, d0
2186: bc740000                 cmp.w      (a4, d0.w), d6
218a: 6760                     beq.b      $21ec
218c: 3007                     move.w     d7, d0
218e: c1fc0018                 muls.w     #$18, d0
2192: 0640f83a                 addi.w     #$f83a, d0
2196: 47f40000                 lea.l      (a4, d0.w), a3
219a: 486cfeac                 pea.l      -$154(a4)
219e: 302b0016                 move.w     $16(a3), d0
21a2: 5340                     subq.w     #$1, d0
21a4: 3f00                     move.w     d0, -(a7)
21a6: 3013                     move.w     (a3), d0
21a8: 5f40                     subq.w     #$7, d0
21aa: 3f00                     move.w     d0, -(a7)
21ac: 302b0016                 move.w     $16(a3), d0
21b0: d045                     add.w      d5, d0
21b2: 3f00                     move.w     d0, -(a7)
21b4: 3013                     move.w     (a3), d0
21b6: 5240                     addq.w     #$1, d0
21b8: 3f00                     move.w     d0, -(a7)
21ba: a8a7                     dc.w       $a8a7
21bc: 486cfeac                 pea.l      -$154(a4)
21c0: a8a3                     dc.w       $a8a3
21c2: 3f2b0016                 move.w     $16(a3), -(a7)
21c6: 3f13                     move.w     (a3), -(a7)
21c8: a893                     dc.w       $a893
21ca: 3006                     move.w     d6, d0
21cc: 48c0                     ext.l      d0
21ce: 2f00                     move.l     d0, -(a7)
21d0: 486cfd0e                 pea.l      -$2f2(a4)
21d4: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
21d8: 486cfd0e                 pea.l      -$2f2(a4)
21dc: a884                     dc.w       $a884
21de: 3007                     move.w     d7, d0
21e0: c1fc0018                 muls.w     #$18, d0
21e4: 0640f84e                 addi.w     #$f84e, d0
21e8: 39860000                 move.w     d6, (a4, d0.w)
21ec: 5247                     addq.w     #$1, d7
21ee: 6908                     bvs.b      $21f8
21f0: be6effde                 cmp.w      -$22(a6), d7
21f4: 6f00ff4c                 ble.w      $2142
21f8: 4cdf1cf0                 movem.l    (a7)+, d4-d7/a2-a4
21fc: 4e5e                     unlk       a6
21fe: 205f                     movea.l    (a7)+, a0
2200: 504f                     addq.w     #$8, a7
2202: 4ed0                     jmp        (a0)
2204: 4e56ffba                 link.w     a6, #$ffba
2208: 48e71f38                 movem.l    d3-d7/a2-a4, -(a7)
220c: 286e0008                 movea.l    $8(a6), a4
2210: 266e000c                 movea.l    $c(a6), a3
2214: 70fe                     moveq      #$fe, d0
2216: 2f00                     move.l     d0, -(a7)
2218: a88e                     dc.w       $a88e
221a: 383c00d3                 move.w     #$d3, d4
221e: 2053                     movea.l    (a3), a0
2220: 3e28222a                 move.w     $222a(a0), d7
2224: de47                     add.w      d7, d7
2226: 41ede7f8                 lea.l      -$1808(a5), a0
222a: 3e307000                 move.w     (a0, d7.w), d7
222e: be6cf832                 cmp.w      -$7ce(a4), d7
2232: 670001d8                 beq.w      $240c
2236: 4a6cf832                 tst.w      -$7ce(a4)
223a: 6f2a                     ble.b      $2266
223c: 362cf832                 move.w     -$7ce(a4), d3
2240: 966cf836                 sub.w      -$7ca(a4), d3
2244: c7fc000b                 muls.w     #$b, d3
2248: d644                     add.w      d4, d3
224a: 5b43                     subq.w     #$5, d3
224c: 486cfeac                 pea.l      -$154(a4)
2250: 4267                     clr.w      -(a7)
2252: 3f03                     move.w     d3, -(a7)
2254: 3f3c0003                 move.w     #$3, -(a7)
2258: 3003                     move.w     d3, d0
225a: 5640                     addq.w     #$3, d0
225c: 3f00                     move.w     d0, -(a7)
225e: a8a7                     dc.w       $a8a7
2260: 486cfeac                 pea.l      -$154(a4)
2264: a8a3                     dc.w       $a8a3
2266: be6cf836                 cmp.w      -$7ca(a4), d7
226a: 5dc0                     slt.b      d0
226c: be6cf834                 cmp.w      -$7cc(a4), d7
2270: 5ec1                     sgt.b      d1
2272: 8001                     or.b       d1, d0
2274: 6700016a                 beq.w      $23e0
2278: 486cfeac                 pea.l      -$154(a4)
227c: 4267                     clr.w      -(a7)
227e: 3004                     move.w     d4, d0
2280: 5140                     subq.w     #$8, d0
2282: 3f00                     move.w     d0, -(a7)
2284: 3f3c0078                 move.w     #$78, -(a7)
2288: 3004                     move.w     d4, d0
228a: 0640006e                 addi.w     #$6e, d0
228e: 5640                     addq.w     #$3, d0
2290: 3f00                     move.w     d0, -(a7)
2292: a8a7                     dc.w       $a8a7
2294: 486cfeac                 pea.l      -$154(a4)
2298: a8a3                     dc.w       $a8a3
229a: 0c470002                 cmpi.w     #$2, d7
229e: 6c06                     bge.b      $22a6
22a0: 426effe6                 clr.w      -$1a(a6)
22a4: 6008                     bra.b      $22ae
22a6: 3007                     move.w     d7, d0
22a8: 5340                     subq.w     #$1, d0
22aa: 3d40ffe6                 move.w     d0, -$1a(a6)
22ae: 2053                     movea.l    (a3), a0
22b0: 20680002                 movea.l    $2(a0), a0
22b4: 2050                     movea.l    (a0), a0
22b6: 3028005e                 move.w     $5e(a0), d0
22ba: 0640fff6                 addi.w     #$fff6, d0
22be: 5440                     addq.w     #$2, d0
22c0: be40                     cmp.w      d0, d7
22c2: 6d14                     blt.b      $22d8
22c4: 2053                     movea.l    (a3), a0
22c6: 20680002                 movea.l    $2(a0), a0
22ca: 2050                     movea.l    (a0), a0
22cc: 3028005e                 move.w     $5e(a0), d0
22d0: 5340                     subq.w     #$1, d0
22d2: 3d40ffe4                 move.w     d0, -$1c(a6)
22d6: 600c                     bra.b      $22e4
22d8: 3007                     move.w     d7, d0
22da: 0640000a                 addi.w     #$a, d0
22de: 5540                     subq.w     #$2, d0
22e0: 3d40ffe4                 move.w     d0, -$1c(a6)
22e4: 396effe6f836             move.w     -$1a(a6), -$7ca(a4)
22ea: 396effe4f834             move.w     -$1c(a6), -$7cc(a4)
22f0: 2053                     movea.l    (a3), a0
22f2: 20680002                 movea.l    $2(a0), a0
22f6: 2050                     movea.l    (a0), a0
22f8: 2068003e                 movea.l    $3e(a0), a0
22fc: 2d50ffe0                 move.l     (a0), -$20(a6)
2300: 426effe8                 clr.w      -$18(a6)
2304: 3d6effe4ffba             move.w     -$1c(a6), -$46(a6)
230a: 3c2effe6                 move.w     -$1a(a6), d6
230e: 600000c8                 bra.w      $23d8
2312: 3006                     move.w     d6, d0
2314: 5340                     subq.w     #$1, d0
2316: 2053                     movea.l    (a3), a0
2318: 20680002                 movea.l    $2(a0), a0
231c: 2050                     movea.l    (a0), a0
231e: b068005e                 cmp.w      $5e(a0), d0
2322: 6d22                     blt.b      $2346
2324: 2053                     movea.l    (a3), a0
2326: 20680002                 movea.l    $2(a0), a0
232a: 2050                     movea.l    (a0), a0
232c: 2253                     movea.l    (a3), a1
232e: 22690002                 movea.l    $2(a1), a1
2332: 2251                     movea.l    (a1), a1
2334: 3006                     move.w     d6, d0
2336: d040                     add.w      d0, d0
2338: 3228003c                 move.w     $3c(a0), d1
233c: 92710060                 sub.w      $60(a1, d0.w), d1
2340: 3d41ffda                 move.w     d1, -$26(a6)
2344: 6026                     bra.b      $236c
2346: 2053                     movea.l    (a3), a0
2348: 20680002                 movea.l    $2(a0), a0
234c: 2050                     movea.l    (a0), a0
234e: 3006                     move.w     d6, d0
2350: 5240                     addq.w     #$1, d0
2352: d040                     add.w      d0, d0
2354: 2253                     movea.l    (a3), a1
2356: 22690002                 movea.l    $2(a1), a1
235a: 2251                     movea.l    (a1), a1
235c: 3206                     move.w     d6, d1
235e: d241                     add.w      d1, d1
2360: 30300060                 move.w     $60(a0, d0.w), d0
2364: 90711060                 sub.w      $60(a1, d1.w), d0
2368: 3d40ffda                 move.w     d0, -$26(a6)
236c: 0c6e0028ffda             cmpi.w     #$28, -$26(a6)
2372: 6f06                     ble.b      $237a
2374: 3d7c0028ffda             move.w     #$28, -$26(a6)
237a: 3f3c0003                 move.w     #$3, -(a7)
237e: 700b                     moveq      #$b, d0
2380: c1eeffe8                 muls.w     -$18(a6), d0
2384: d044                     add.w      d4, d0
2386: 3f00                     move.w     d0, -(a7)
2388: a893                     dc.w       $a893
238a: 2053                     movea.l    (a3), a0
238c: 20680002                 movea.l    $2(a0), a0
2390: 2050                     movea.l    (a0), a0
2392: 3006                     move.w     d6, d0
2394: d040                     add.w      d0, d0
2396: 30300060                 move.w     $60(a0, d0.w), d0
239a: 48c0                     ext.l      d0
239c: d0aeffe0                 add.l      -$20(a6), d0
23a0: 2440                     movea.l    d0, a2
23a2: 4245                     clr.w      d5
23a4: 6004                     bra.b      $23aa
23a6: 528a                     addq.l     #$1, a2
23a8: 5245                     addq.w     #$1, d5
23aa: 1012                     move.b     (a2), d0
23ac: 4880                     ext.w      d0
23ae: 0c400020                 cmpi.w     #$20, d0
23b2: 67f2                     beq.b      $23a6
23b4: 4a45                     tst.w      d5
23b6: 6f04                     ble.b      $23bc
23b8: 538a                     subq.l     #$1, a2
23ba: 5345                     subq.w     #$1, d5
23bc: 2f0a                     move.l     a2, -(a7)
23be: 4267                     clr.w      -(a7)
23c0: 302effda                 move.w     -$26(a6), d0
23c4: 9045                     sub.w      d5, d0
23c6: 3f00                     move.w     d0, -(a7)
23c8: a885                     dc.w       $a885
23ca: 302effe8                 move.w     -$18(a6), d0
23ce: 5240                     addq.w     #$1, d0
23d0: 3d40ffe8                 move.w     d0, -$18(a6)
23d4: 5246                     addq.w     #$1, d6
23d6: 6908                     bvs.b      $23e0
23d8: bc6effba                 cmp.w      -$46(a6), d6
23dc: 6f00ff34                 ble.w      $2312
23e0: 3607                     move.w     d7, d3
23e2: 966cf836                 sub.w      -$7ca(a4), d3
23e6: c7fc000b                 muls.w     #$b, d3
23ea: d644                     add.w      d4, d3
23ec: 5b43                     subq.w     #$5, d3
23ee: 486cfeac                 pea.l      -$154(a4)
23f2: 4267                     clr.w      -(a7)
23f4: 3f03                     move.w     d3, -(a7)
23f6: 3f3c0003                 move.w     #$3, -(a7)
23fa: 3003                     move.w     d3, d0
23fc: 5640                     addq.w     #$3, d0
23fe: 3f00                     move.w     d0, -(a7)
2400: a8a7                     dc.w       $a8a7
2402: 486cfeac                 pea.l      -$154(a4)
2406: a8a1                     dc.w       $a8a1
2408: 3947f832                 move.w     d7, -$7ce(a4)
240c: 42a7                     clr.l      -(a7)
240e: a88e                     dc.w       $a88e
2410: 2f2cfed4                 move.l     -$12c(a4), -(a7)
2414: a873                     dc.w       $a873
2416: 4cdf1cf8                 movem.l    (a7)+, d3-d7/a2-a4
241a: 4e5e                     unlk       a6
241c: 205f                     movea.l    (a7)+, a0
241e: 504f                     addq.w     #$8, a7
2420: 4ed0                     jmp        (a0)
2422: 4e56fed6                 link.w     a6, #$fed6
2426: 48e71f18                 movem.l    d3-d7/a3-a4, -(a7)
242a: 286e0008                 movea.l    $8(a6), a4
242e: 4205                     clr.b      d5
2430: 302dbdca                 move.w     -$4236(a5), d0
2434: 60000166                 bra.w      $259c
2438: 202dbdcc                 move.l     -$4234(a5), d0
243c: 0280000000ff             andi.l     #$ff, d0
2442: 2b40bdcc                 move.l     d0, -$4234(a5)
2446: 302dbdd8                 move.w     -$4228(a5), d0
244a: 02400100                 andi.w     #$100, d0
244e: 0c400100                 cmpi.w     #$100, d0
2452: 66000164                 bne.w      $25b8
2456: 7a01                     moveq      #$1, d5
2458: 594f                     subq.w     #$4, a7
245a: 3f2dbdce                 move.w     -$4232(a5), -(a7)
245e: a93e                     dc.w       $a93e
2460: 2c1f                     move.l     (a7)+, d6
2462: 60000154                 bra.w      $25b8
2466: 554f                     subq.w     #$2, a7
2468: 2f2dbdd4                 move.l     -$422c(a5), -(a7)
246c: 486effe8                 pea.l      -$18(a6)
2470: a92c                     dc.w       $a92c
2472: 301f                     move.w     (a7)+, d0
2474: 6026                     bra.b      $249c
2476: 7a01                     moveq      #$1, d5
2478: 594f                     subq.w     #$4, a7
247a: 2f2dbdd4                 move.l     -$422c(a5), -(a7)
247e: a93d                     dc.w       $a93d
2480: 2c1f                     move.l     (a7)+, d6
2482: 60000134                 bra.w      $25b8
2486: 486dbdca                 pea.l      -$4236(a5)
248a: 2f2effe8                 move.l     -$18(a6), -(a7)
248e: a9b3                     dc.w       $a9b3
2490: 60000126                 bra.w      $25b8
2494: 60000122                 bra.w      $25b8
2498: 6000011e                 bra.w      $25b8
249c: 6700011a                 beq.w      $25b8
24a0: 5340                     subq.w     #$1, d0
24a2: 67d2                     beq.b      $2476
24a4: 5340                     subq.w     #$1, d0
24a6: 67de                     beq.b      $2486
24a8: 5540                     subq.w     #$2, d0
24aa: 6700010c                 beq.w      $25b8
24ae: 594f                     subq.w     #$4, a7
24b0: a924                     dc.w       $a924
24b2: 201f                     move.l     (a7)+, d0
24b4: b0aeffe8                 cmp.l      -$18(a6), d0
24b8: 670000fe                 beq.w      $25b8
24bc: 2f2effe8                 move.l     -$18(a6), -(a7)
24c0: a91f                     dc.w       $a91f
24c2: 600000f4                 bra.w      $25b8
24c6: 594f                     subq.w     #$4, a7
24c8: a924                     dc.w       $a924
24ca: 265f                     movea.l    (a7)+, a3
24cc: 200b                     move.l     a3, d0
24ce: 6616                     bne.b      $24e6
24d0: 4a2cfc02                 tst.b      -$3fe(a4)
24d4: 6746                     beq.b      $251c
24d6: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
24da: 4267                     clr.w      -(a7)
24dc: a93a                     dc.w       $a93a
24de: a937                     dc.w       $a937
24e0: 422cfc02                 clr.b      -$3fe(a4)
24e4: 6036                     bra.b      $251c
24e6: 4a6b006c                 tst.w      $6c(a3)
24ea: 5dc0                     slt.b      d0
24ec: 122cfc02                 move.b     -$3fe(a4), d1
24f0: 5301                     subq.b     #$1, d1
24f2: c001                     and.b      d1, d0
24f4: 6712                     beq.b      $2508
24f6: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
24fa: 4267                     clr.w      -(a7)
24fc: a939                     dc.w       $a939
24fe: a937                     dc.w       $a937
2500: 197c0001fc02             move.b     #$1, -$3fe(a4)
2506: 6014                     bra.b      $251c
2508: 4a2cfc02                 tst.b      -$3fe(a4)
250c: 670e                     beq.b      $251c
250e: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
2512: 4267                     clr.w      -(a7)
2514: a93a                     dc.w       $a93a
2516: a937                     dc.w       $a937
2518: 422cfc02                 clr.b      -$3fe(a4)
251c: 302dbdd8                 move.w     -$4228(a5), d0
2520: 02400001                 andi.w     #$1, d0
2524: 4a40                     tst.w      d0
2526: 67000090                 beq.w      $25b8
252a: 2f2dbdcc                 move.l     -$4234(a5), -(a7)
252e: a873                     dc.w       $a873
2530: 60000086                 bra.w      $25b8
2534: 60000082                 bra.w      $25b8
2538: 2d6dbdccffe8             move.l     -$4234(a5), -$18(a6)
253e: 486efed8                 pea.l      -$128(a6)
2542: a874                     dc.w       $a874
2544: 2f2effe8                 move.l     -$18(a6), -(a7)
2548: a873                     dc.w       $a873
254a: 2f2effe8                 move.l     -$18(a6), -(a7)
254e: a922                     dc.w       $a922
2550: 202effe8                 move.l     -$18(a6), d0
2554: b0acfec4                 cmp.l      -$13c(a4), d0
2558: 661e                     bne.b      $2578
255a: 7e01                     moveq      #$1, d7
255c: 3007                     move.w     d7, d0
255e: d040                     add.w      d0, d0
2560: 0640fe44                 addi.w     #$fe44, d0
2564: 42740000                 clr.w      (a4, d0.w)
2568: 5247                     addq.w     #$1, d7
256a: 0c470005                 cmpi.w     #$5, d7
256e: 6fec                     ble.b      $255c
2570: 2f0c                     move.l     a4, -(a7)
2572: 4eba1300                 jsr        $3874(pc)
2576: 6016                     bra.b      $258e
2578: 202effe8                 move.l     -$18(a6), d0
257c: b0adbe26                 cmp.l      -$41da(a5), d0
2580: 660c                     bne.b      $258e
2582: 4227                     clr.b      -(a7)
2584: 1f3c0001                 move.b     #$1, -(a7)
2588: 2f0c                     move.l     a4, -(a7)
258a: 4eba0ad6                 jsr        $3062(pc)
258e: 2f2effe8                 move.l     -$18(a6), -(a7)
2592: a923                     dc.w       $a923
2594: 2f2efed8                 move.l     -$128(a6), -(a7)
2598: a873                     dc.w       $a873
259a: 601c                     bra.b      $25b8
259c: 5340                     subq.w     #$1, d0
259e: 6700fec6                 beq.w      $2466
25a2: 5540                     subq.w     #$2, d0
25a4: 6700fe92                 beq.w      $2438
25a8: 5540                     subq.w     #$2, d0
25aa: 6700fe8c                 beq.w      $2438
25ae: 5340                     subq.w     #$1, d0
25b0: 6786                     beq.b      $2538
25b2: 5540                     subq.w     #$2, d0
25b4: 6700ff10                 beq.w      $24c6
25b8: 4a05                     tst.b      d5
25ba: 670001dc                 beq.w      $2798
25be: 2006                     move.l     d6, d0
25c0: 4840                     swap       d0
25c2: 600001ba                 bra.w      $277e
25c6: 3806                     move.w     d6, d4
25c8: 0c440001                 cmpi.w     #$1, d4
25cc: 6608                     bne.b      $25d6
25ce: 4ead025a                 jsr        $25a(a5) ; CODE 5 resource+0x0376
25d2: 600001c4                 bra.w      $2798
25d6: 2f2dbdf6                 move.l     -$420a(a5), -(a7)
25da: 3f04                     move.w     d4, -(a7)
25dc: 486efee2                 pea.l      -$11e(a6)
25e0: a946                     dc.w       $a946
25e2: 554f                     subq.w     #$2, a7
25e4: 486efee2                 pea.l      -$11e(a6)
25e8: a9b6                     dc.w       $a9b6
25ea: 361f                     move.w     (a7)+, d3
25ec: 600001aa                 bra.w      $2798
25f0: 3006                     move.w     d6, d0
25f2: 6010                     bra.b      $2604
25f4: 1b7c0001bdb5             move.b     #$1, -$424b(a5)
25fa: 1b7c0001fefa             move.b     #$1, -$106(a5)
2600: 60000196                 bra.w      $2798
2604: 0640fff4                 addi.w     #$fff4, d0
2608: 67ea                     beq.b      $25f4
260a: 6000018c                 bra.w      $2798
260e: 554f                     subq.w     #$2, a7
2610: 3006                     move.w     d6, d0
2612: 5340                     subq.w     #$1, d0
2614: 3f00                     move.w     d0, -(a7)
2616: a9c2                     dc.w       $a9c2
2618: 4a1f                     tst.b      (a7)+
261a: 6700017c                 beq.w      $2798
261e: 60000178                 bra.w      $2798
2622: 3006                     move.w     d6, d0
2624: 60000120                 bra.w      $2746
2628: 102dfefb                 move.b     -$105(a5), d0
262c: 5300                     subq.b     #$1, d0
262e: 4400                     neg.b      d0
2630: 1b40fefb                 move.b     d0, -$105(a5)
2634: 4a2dfefb                 tst.b      -$105(a5)
2638: 6712                     beq.b      $264c
263a: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
263e: 3f3c0002                 move.w     #$2, -(a7)
2642: 487a01cc                 pea.l      $2810(pc)
2646: a947                     dc.w       $a947
2648: 6000014e                 bra.w      $2798
264c: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
2650: 3f3c0002                 move.w     #$2, -(a7)
2654: 487a01b4                 pea.l      $280a(pc)
2658: a947                     dc.w       $a947
265a: 6000013c                 bra.w      $2798
265e: 302cfc08                 move.w     -$3f8(a4), d0
2662: b06c000a                 cmp.w      $a(a4), d0
2666: 660a                     bne.b      $2672
2668: 1b7c0001fefa             move.b     #$1, -$106(a5)
266e: 60000128                 bra.w      $2798
2672: 7e01                     moveq      #$1, d7
2674: 41edc375                 lea.l      -$3c8b(a5), a0
2678: 42307000                 clr.b      (a0, d7.w)
267c: 5247                     addq.w     #$1, d7
267e: 0c470005                 cmpi.w     #$5, d7
2682: 6ff0                     ble.b      $2674
2684: 426dc382                 clr.w      -$3c7e(a5)
2688: 426cfc06                 clr.w      -$3fa(a4)
268c: 6000010a                 bra.w      $2798
2690: 1b7c0001fefa             move.b     #$1, -$106(a5)
2696: 60000100                 bra.w      $2798
269a: 102dfefc                 move.b     -$104(a5), d0
269e: 5300                     subq.b     #$1, d0
26a0: 4400                     neg.b      d0
26a2: 1b40fefc                 move.b     d0, -$104(a5)
26a6: 4a2dfefc                 tst.b      -$104(a5)
26aa: 6712                     beq.b      $26be
26ac: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
26b0: 3f3c0008                 move.w     #$8, -(a7)
26b4: 487a0142                 pea.l      $27f8(pc)
26b8: a947                     dc.w       $a947
26ba: 600000dc                 bra.w      $2798
26be: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
26c2: 3f3c0008                 move.w     #$8, -(a7)
26c6: 487a011e                 pea.l      $27e6(pc)
26ca: a947                     dc.w       $a947
26cc: 600000ca                 bra.w      $2798
26d0: 102dc02e                 move.b     -$3fd2(a5), d0
26d4: 5300                     subq.b     #$1, d0
26d6: 4400                     neg.b      d0
26d8: 1b40c02e                 move.b     d0, -$3fd2(a5)
26dc: 4a2dc02e                 tst.b      -$3fd2(a5)
26e0: 6712                     beq.b      $26f4
26e2: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
26e6: 3f3c0009                 move.w     #$9, -(a7)
26ea: 487a00de                 pea.l      $27ca(pc)
26ee: a947                     dc.w       $a947
26f0: 600000a6                 bra.w      $2798
26f4: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
26f8: 3f3c0009                 move.w     #$9, -(a7)
26fc: 487a00b2                 pea.l      $27b0(pc)
2700: a947                     dc.w       $a947
2702: 60000094                 bra.w      $2798
2706: 102dfefb                 move.b     -$105(a5), d0
270a: 5300                     subq.b     #$1, d0
270c: 6714                     beq.b      $2722
270e: 1b7c0001fefb             move.b     #$1, -$105(a5)
2714: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
2718: 3f3c0002                 move.w     #$2, -(a7)
271c: 487a0088                 pea.l      $27a6(pc)
2720: a947                     dc.w       $a947
2722: 197c0001f82d             move.b     #$1, -$7d3(a4)
2728: 6000006e                 bra.w      $2798
272c: 4ead0032                 jsr        $32(a5) ; CODE 4 resource+0x003c
2730: 6066                     bra.b      $2798
2732: 4ead003a                 jsr        $3a(a5) ; CODE 4 resource+0x0090
2736: 6060                     bra.b      $2798
2738: 3006                     move.w     d6, d0
273a: 0640fff1                 addi.w     #$fff1, d0
273e: 3f00                     move.w     d0, -(a7)
2740: 4ead002a                 jsr        $2a(a5) ; CODE 4 resource+0x0004
2744: 6052                     bra.b      $2798
2746: 5540                     subq.w     #$2, d0
2748: 0c400012                 cmpi.w     #$12, d0
274c: 642e                     bcc.b      $277c
274e: d040                     add.w      d0, d0
2750: 303b0006                 move.w     $2758(pc, d0.w), d0
2754: 4efb0002                 jmp        $2758(pc, d0.w)
2758: fed0                     dc.w       $fed0
275a: 0024ff06                 ori.b      #$6, -(a4)
275e: ff38                     dc.w       $ff38
2760: 00240024                 ori.b      #$24, -(a4)
2764: ff42                     dc.w       $ff42
2766: ff78                     dc.w       $ff78
2768: ffae                     dc.w       $ffae
276a: 0024ffd4                 ori.b      #$d4, -(a4)
276e: ffda                     dc.w       $ffda
2770: 0024ffe0                 ori.b      #$e0, -(a4)
2774: ffe0                     dc.w       $ffe0
2776: ffe0                     dc.w       $ffe0
2778: ffe0                     dc.w       $ffe0
277a: ffe0                     dc.w       $ffe0
277c: 601a                     bra.b      $2798
277e: 0640ff80                 addi.w     #$ff80, d0
2782: 6700fe42                 beq.w      $25c6
2786: 5340                     subq.w     #$1, d0
2788: 6700fe66                 beq.w      $25f0
278c: 5340                     subq.w     #$1, d0
278e: 6700fe7e                 beq.w      $260e
2792: 5940                     subq.w     #$4, d0
2794: 6700fe8c                 beq.w      $2622
2798: 4267                     clr.w      -(a7)
279a: a938                     dc.w       $a938
279c: 4cdf18f8                 movem.l    (a7)+, d3-d7/a3-a4
27a0: 4e5e                     unlk       a6
27a2: 2e9f                     move.l     (a7)+, (a7)
27a4: 4e75                     rts        
27a6: 0843                     .byte      0x08, 0x43
27a8: 6f6e                     ble.b      $2818
27aa: 7469                     moveq      #$69, d2
27ac: 6e75                     bgt.b      $2823
27ae: 6516                     bcs.b      $27c6
27b0: 19456e61                 move.b     d5, $6e61(a4)
27b4: 626c                     bhi.b      $2822
27b6: 6520                     bcs.b      $27d8
27b8: 547261636520496e7374     addq.w     #$2, ([$6520, a2], $496e7374)
27c2: 7275                     moveq      #$75, d1
27c4: 6374                     bls.b      $283a
27c6: 696f                     bvs.b      $2837
27c8: 6e73                     bgt.b      $283d
27ca: 1a44                     .byte      0x1a, 0x44
27cc: 6973                     bvs.b      $2841
27ce: 6162                     bsr.b      $2832
27d0: 6c65                     bge.b      $2837
27d2: 2054                     movea.l    (a4), a0
27d4: 7261                     moveq      #$61, d1
27d6: 6365                     bls.b      $283d
27d8: 2049                     movea.l    a1, a0
27da: 6e73                     bgt.b      $284f
27dc: 7472                     moveq      #$72, d2
27de: 7563                     .byte      0x75, 0x63
27e0: 7469                     moveq      #$69, d2
27e2: 6f6e                     ble.b      $2852
27e4: 7316                     .byte      0x73, 0x16
27e6: 1045                     .byte      0x10, 0x45
27e8: 6e61                     bgt.b      $284b
27ea: 626c                     bhi.b      $2858
27ec: 6520                     bcs.b      $280e
27ee: 4465                     neg.w      -(a5)
27f0: 6275                     bhi.b      $2867
27f2: 6767                     beq.b      $285b
27f4: 696e                     bvs.b      $2864
27f6: 6716                     beq.b      $280e
27f8: 11446973                 move.b     d4, $6973(a0)
27fc: 6162                     bsr.b      $2860
27fe: 6c65                     bge.b      $2865
2800: 2044                     movea.l    d4, a0
2802: 6562                     bcs.b      $2866
2804: 7567                     .byte      0x75, 0x67
2806: 6769                     beq.b      $2871
2808: 6e67                     bgt.b      $2871
280a: 0550                     bchg.b     d2, (a0)
280c: 6175                     bsr.b      $2883
280e: 7365                     .byte      0x73, 0x65
2810: 0843                     .byte      0x08, 0x43
2812: 6f6e                     ble.b      $2882
2814: 7469                     moveq      #$69, d2
2816: 6e75                     bgt.b      $288d
2818: 6516                     bcs.b      $2830
281a: 4e560000                 link.w     a6, #$0
281e: 1b7c0001fefc             move.b     #$1, -$104(a5)
2824: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
2828: 3f3c0008                 move.w     #$8, -(a7)
282c: 487a0032                 pea.l      $2860(pc)
2830: a947                     dc.w       $a947
2832: 1b7c0001fefb             move.b     #$1, -$105(a5)
2838: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
283c: 3f3c0002                 move.w     #$2, -(a7)
2840: 487a0014                 pea.l      $2856(pc)
2844: a947                     dc.w       $a947
2846: 206e0008                 movea.l    $8(a6), a0
284a: 117c0001f82d             move.b     #$1, -$7d3(a0)
2850: 4e5e                     unlk       a6
2852: 2e9f                     move.l     (a7)+, (a7)
2854: 4e75                     rts        
2856: 0843                     .byte      0x08, 0x43
2858: 6f6e                     ble.b      $28c8
285a: 7469                     moveq      #$69, d2
285c: 6e75                     bgt.b      $28d3
285e: 6516                     bcs.b      $2876
2860: 11446973                 move.b     d4, $6973(a0)
2864: 6162                     bsr.b      $28c8
2866: 6c65                     bge.b      $28cd
2868: 2044                     movea.l    d4, a0
286a: 6562                     bcs.b      $28ce
286c: 7567                     .byte      0x75, 0x67
286e: 6769                     beq.b      $28d9
2870: 6e67                     bgt.b      $28d9
2872: 4e560000                 link.w     a6, #$0
2876: a9b4                     dc.w       $a9b4
2878: 554f                     subq.w     #$2, a7
287a: 3f3c016e                 move.w     #$16e, -(a7)
287e: 486dbdca                 pea.l      -$4236(a5)
2882: a970                     dc.w       $a970
2884: 4a1f                     tst.b      (a7)+
2886: 6712                     beq.b      $289a
2888: 3f3c0010                 move.w     #$10, -(a7)
288c: 4267                     clr.w      -(a7)
288e: 201f                     move.l     (a7)+, d0
2890: a032                     dc.w       $a032
2892: 2f2e0008                 move.l     $8(a6), -(a7)
2896: 4ebafb8a                 jsr        $2422(pc)
289a: 4e5e                     unlk       a6
289c: 2e9f                     move.l     (a7)+, (a7)
289e: 4e75                     rts        
28a0: 4e56fcde                 link.w     a6, #$fcde
28a4: 2f07                     move.l     d7, -(a7)
28a6: 3e2e0010                 move.w     $10(a6), d7
28aa: 5347                     subq.w     #$1, d7
28ac: cffc003d                 muls.w     #$3d, d7
28b0: 0647001e                 addi.w     #$1e, d7
28b4: 486efde8                 pea.l      -$218(a6)
28b8: 3f3c0020                 move.w     #$20, -(a7)
28bc: 3007                     move.w     d7, d0
28be: 5f40                     subq.w     #$7, d0
28c0: 3f00                     move.w     d0, -(a7)
28c2: 3f3c0078                 move.w     #$78, -(a7)
28c6: 3007                     move.w     d7, d0
28c8: 5440                     addq.w     #$2, d0
28ca: 3f00                     move.w     d0, -(a7)
28cc: a8a7                     dc.w       $a8a7
28ce: 486efde8                 pea.l      -$218(a6)
28d2: a8a3                     dc.w       $a8a3
28d4: 302e000e                 move.w     $e(a6), d0
28d8: 48c0                     ext.l      d0
28da: 2f00                     move.l     d0, -(a7)
28dc: 486efef0                 pea.l      -$110(a6)
28e0: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
28e4: 302e000c                 move.w     $c(a6), d0
28e8: 48c0                     ext.l      d0
28ea: 2f00                     move.l     d0, -(a7)
28ec: 486efdf0                 pea.l      -$210(a6)
28f0: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
28f4: 3f3c000f                 move.w     #$f, -(a7)
28f8: 3f07                     move.w     d7, -(a7)
28fa: a893                     dc.w       $a893
28fc: 486efcde                 pea.l      -$322(a6)
2900: 487a0036                 pea.l      $2938(pc)
2904: 486efef0                 pea.l      -$110(a6)
2908: 487a0022                 pea.l      $292c(pc)
290c: 486efdf0                 pea.l      -$210(a6)
2910: 3f3c0004                 move.w     #$4, -(a7)
2914: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
2918: 584f                     addq.w     #$4, a7
291a: 486efcde                 pea.l      -$322(a6)
291e: a884                     dc.w       $a884
2920: 2e1f                     move.l     (a7)+, d7
2922: 4e5e                     unlk       a6
2924: 205f                     movea.l    (a7)+, a0
2926: 4fef000a                 lea.l      $a(a7), a7
292a: 4ed0                     jmp        (a0)
292c: 0b20                     btst.l     d5, -(a0)
292e: 2020                     move.l     -(a0), d0
2930: 20746f74616c3a20         movea.l    $616c3a20(a4, invalid.w), a0
2938: 0773636f7265             bchg.b     d3, ([$7265, a3])
293e: 3a20                     move.w     -(a0), d5
2940: 4e56ffcc                 link.w     a6, #$ffcc
2944: 48e70318                 movem.l    d6-d7/a3-a4, -(a7)
2948: 286e0008                 movea.l    $8(a6), a4
294c: 486effdc                 pea.l      -$24(a6)
2950: a874                     dc.w       $a874
2952: 2f2cfec4                 move.l     -$13c(a4), -(a7)
2956: a873                     dc.w       $a873
2958: 7e01                     moveq      #$1, d7
295a: 3007                     move.w     d7, d0
295c: d040                     add.w      d0, d0
295e: 0640fe9e                 addi.w     #$fe9e, d0
2962: 4a740000                 tst.w      (a4, d0.w)
2966: 5ec0                     sgt.b      d0
2968: 41edc37b                 lea.l      -$3c85(a5), a0
296c: c0307000                 and.b      (a0, d7.w), d0
2970: 6700010e                 beq.w      $2a80
2974: 3007                     move.w     d7, d0
2976: c1fc00a6                 muls.w     #$a6, d0
297a: 0640c030                 addi.w     #$c030, d0
297e: 26750000                 movea.l    (a5, d0.w), a3
2982: 4a2cfc0b                 tst.b      -$3f5(a4)
2986: 671e                     beq.b      $29a6
2988: 3007                     move.w     d7, d0
298a: d040                     add.w      d0, d0
298c: 0640fe9e                 addi.w     #$fe9e, d0
2990: 3f340000                 move.w     (a4, d0.w), -(a7)
2994: 2053                     movea.l    (a3), a0
2996: 3f2822b8                 move.w     $22b8(a0), -(a7)
299a: 2053                     movea.l    (a3), a0
299c: 3f2822ba                 move.w     $22ba(a0), -(a7)
29a0: 2f0c                     move.l     a4, -(a7)
29a2: 4ebafefc                 jsr        $28a0(pc)
29a6: 41edc375                 lea.l      -$3c8b(a5), a0
29aa: 4a307000                 tst.b      (a0, d7.w)
29ae: 670000d0                 beq.w      $2a80
29b2: 2053                     movea.l    (a3), a0
29b4: 3c28207a                 move.w     $207a(a0), d6
29b8: 3007                     move.w     d7, d0
29ba: d040                     add.w      d0, d0
29bc: 0640fe44                 addi.w     #$fe44, d0
29c0: bc740000                 cmp.w      (a4, d0.w), d6
29c4: 674e                     beq.b      $2a14
29c6: 3007                     move.w     d7, d0
29c8: d040                     add.w      d0, d0
29ca: 0640fe44                 addi.w     #$fe44, d0
29ce: 39860000                 move.w     d6, (a4, d0.w)
29d2: 3007                     move.w     d7, d0
29d4: d040                     add.w      d0, d0
29d6: 0640fe9e                 addi.w     #$fe9e, d0
29da: 30340000                 move.w     (a4, d0.w), d0
29de: e740                     asl.w      #$3, d0
29e0: 0640fe70                 addi.w     #$fe70, d0
29e4: 41f40000                 lea.l      (a4, d0.w), a0
29e8: 43eeffe6                 lea.l      -$1a(a6), a1
29ec: 22d8                     move.l     (a0)+, (a1)+
29ee: 22d8                     move.l     (a0)+, (a1)+
29f0: 302effec                 move.w     -$14(a6), d0
29f4: 906effe8                 sub.w      -$18(a6), d0
29f8: 5340                     subq.w     #$1, d0
29fa: c1c6                     muls.w     d6, d0
29fc: 48c0                     ext.l      d0
29fe: 81fc0064                 divs.w     #$64, d0
2a02: d06effe8                 add.w      -$18(a6), d0
2a06: 3d40ffec                 move.w     d0, -$14(a6)
2a0a: 486effe6                 pea.l      -$1a(a6)
2a0e: 486dffba                 pea.l      -$46(a5)
2a12: a8a5                     dc.w       $a8a5
2a14: 2053                     movea.l    (a3), a0
2a16: 3c282080                 move.w     $2080(a0), d6
2a1a: 3007                     move.w     d7, d0
2a1c: d040                     add.w      d0, d0
2a1e: 0640fe9e                 addi.w     #$fe9e, d0
2a22: 30340000                 move.w     (a4, d0.w), d0
2a26: e740                     asl.w      #$3, d0
2a28: 0640fe48                 addi.w     #$fe48, d0
2a2c: 41f40000                 lea.l      (a4, d0.w), a0
2a30: 43eeffe6                 lea.l      -$1a(a6), a1
2a34: 22d8                     move.l     (a0)+, (a1)+
2a36: 22d8                     move.l     (a0)+, (a1)+
2a38: 486effe6                 pea.l      -$1a(a6)
2a3c: 3f3c0001                 move.w     #$1, -(a7)
2a40: 3f3c0001                 move.w     #$1, -(a7)
2a44: a8a9                     dc.w       $a8a9
2a46: 302effec                 move.w     -$14(a6), d0
2a4a: 906effe8                 sub.w      -$18(a6), d0
2a4e: 2053                     movea.l    (a3), a0
2a50: 32282280                 move.w     $2280(a0), d1
2a54: 48c1                     ext.l      d1
2a56: 83fc0064                 divs.w     #$64, d1
2a5a: 3406                     move.w     d6, d2
2a5c: 48c2                     ext.l      d2
2a5e: 85c1                     divs.w     d1, d2
2a60: 7264                     moveq      #$64, d1
2a62: 9242                     sub.w      d2, d1
2a64: c1c1                     muls.w     d1, d0
2a66: 48c0                     ext.l      d0
2a68: 81fc0064                 divs.w     #$64, d0
2a6c: 322effec                 move.w     -$14(a6), d1
2a70: 9240                     sub.w      d0, d1
2a72: 3d41ffe8                 move.w     d1, -$18(a6)
2a76: 486effe6                 pea.l      -$1a(a6)
2a7a: 486dffc2                 pea.l      -$3e(a5)
2a7e: a8a5                     dc.w       $a8a5
2a80: 5247                     addq.w     #$1, d7
2a82: 0c470005                 cmpi.w     #$5, d7
2a86: 6f00fed2                 ble.w      $295a
2a8a: 422cfc0b                 clr.b      -$3f5(a4)
2a8e: 2f2cfba0                 move.l     -$460(a4), -(a7)
2a92: a873                     dc.w       $a873
2a94: 2f2effdc                 move.l     -$24(a6), -(a7)
2a98: a873                     dc.w       $a873
2a9a: 4cdf18c0                 movem.l    (a7)+, d6-d7/a3-a4
2a9e: 4e5e                     unlk       a6
2aa0: 2e9f                     move.l     (a7)+, (a7)
2aa2: 4e75                     rts        
2aa4: 4e56ffc6                 link.w     a6, #$ffc6
2aa8: 48e70308                 movem.l    d6-d7/a4, -(a7)
2aac: 286e0008                 movea.l    $8(a6), a4
2ab0: 3e2e000c                 move.w     $c(a6), d7
2ab4: 2f2cfec4                 move.l     -$13c(a4), -(a7)
2ab8: a873                     dc.w       $a873
2aba: 3007                     move.w     d7, d0
2abc: d040                     add.w      d0, d0
2abe: 0640fe9e                 addi.w     #$fe9e, d0
2ac2: 30340000                 move.w     (a4, d0.w), d0
2ac6: e740                     asl.w      #$3, d0
2ac8: 0640fe70                 addi.w     #$fe70, d0
2acc: 41f40000                 lea.l      (a4, d0.w), a0
2ad0: 43eeffe8                 lea.l      -$18(a6), a1
2ad4: 22d8                     move.l     (a0)+, (a1)+
2ad6: 22d8                     move.l     (a0)+, (a1)+
2ad8: 302effe8                 move.w     -$18(a6), d0
2adc: 0640fff6                 addi.w     #$fff6, d0
2ae0: 3d40ffe8                 move.w     d0, -$18(a6)
2ae4: 302effee                 move.w     -$12(a6), d0
2ae8: 06400019                 addi.w     #$19, d0
2aec: 3d40ffee                 move.w     d0, -$12(a6)
2af0: 486effe8                 pea.l      -$18(a6)
2af4: a8a3                     dc.w       $a8a3
2af6: 3f3c001b                 move.w     #$1b, -(a7)
2afa: 302effec                 move.w     -$14(a6), d0
2afe: 5540                     subq.w     #$2, d0
2b00: 3f00                     move.w     d0, -(a7)
2b02: a893                     dc.w       $a893
2b04: 487a0108                 pea.l      $2c0e(pc)
2b08: a884                     dc.w       $a884
2b0a: 3c07                     move.w     d7, d6
2b0c: dc46                     add.w      d6, d6
2b0e: 41ecfe9e                 lea.l      -$162(a4), a0
2b12: 30306000                 move.w     (a0, d6.w), d0
2b16: 5340                     subq.w     #$1, d0
2b18: c1fc003d                 muls.w     #$3d, d0
2b1c: 06400013                 addi.w     #$13, d0
2b20: 3c00                     move.w     d0, d6
2b22: 302cfece                 move.w     -$132(a4), d0
2b26: c1fc00a6                 muls.w     #$a6, d0
2b2a: 0640c030                 addi.w     #$c030, d0
2b2e: 29750000feb6             move.l     (a5, d0.w), -$14a(a4)
2b34: 486effe8                 pea.l      -$18(a6)
2b38: 3f3c0010                 move.w     #$10, -(a7)
2b3c: 3006                     move.w     d6, d0
2b3e: 0640fff7                 addi.w     #$fff7, d0
2b42: 3f00                     move.w     d0, -(a7)
2b44: 3f3c0078                 move.w     #$78, -(a7)
2b48: 3006                     move.w     d6, d0
2b4a: 5840                     addq.w     #$4, d0
2b4c: 3f00                     move.w     d0, -(a7)
2b4e: a8a7                     dc.w       $a8a7
2b50: 486effe8                 pea.l      -$18(a6)
2b54: a8a3                     dc.w       $a8a3
2b56: 3f3c0010                 move.w     #$10, -(a7)
2b5a: 3f06                     move.w     d6, -(a7)
2b5c: a893                     dc.w       $a893
2b5e: 3007                     move.w     d7, d0
2b60: c1fc00a6                 muls.w     #$a6, d0
2b64: 0640bf98                 addi.w     #$bf98, d0
2b68: 48750000                 pea.l      (a5, d0.w)
2b6c: 486cfd0e                 pea.l      -$2f2(a4)
2b70: a919                     dc.w       $a919
2b72: 486cfd0e                 pea.l      -$2f2(a4)
2b76: a884                     dc.w       $a884
2b78: 3007                     move.w     d7, d0
2b7a: d040                     add.w      d0, d0
2b7c: 0640fe9e                 addi.w     #$fe9e, d0
2b80: 30340000                 move.w     (a4, d0.w), d0
2b84: 5340                     subq.w     #$1, d0
2b86: c1fc003d                 muls.w     #$3d, d0
2b8a: 3940feca                 move.w     d0, -$136(a4)
2b8e: 486cfeac                 pea.l      -$154(a4)
2b92: 3f3c0002                 move.w     #$2, -(a7)
2b96: 302cfeca                 move.w     -$136(a4), d0
2b9a: 0640000b                 addi.w     #$b, d0
2b9e: 3f00                     move.w     d0, -(a7)
2ba0: 3f3c000d                 move.w     #$d, -(a7)
2ba4: 302cfeca                 move.w     -$136(a4), d0
2ba8: 06400016                 addi.w     #$16, d0
2bac: 3f00                     move.w     d0, -(a7)
2bae: a8a7                     dc.w       $a8a7
2bb0: 486dffc2                 pea.l      -$3e(a5)
2bb4: a89d                     dc.w       $a89d
2bb6: 486cfeac                 pea.l      -$154(a4)
2bba: a8a1                     dc.w       $a8a1
2bbc: a89e                     dc.w       $a89e
2bbe: 3007                     move.w     d7, d0
2bc0: d040                     add.w      d0, d0
2bc2: 0640fe9e                 addi.w     #$fe9e, d0
2bc6: 30340000                 move.w     (a4, d0.w), d0
2bca: e740                     asl.w      #$3, d0
2bcc: 0640fe48                 addi.w     #$fe48, d0
2bd0: 41f40000                 lea.l      (a4, d0.w), a0
2bd4: 43eeffe8                 lea.l      -$18(a6), a1
2bd8: 22d8                     move.l     (a0)+, (a1)+
2bda: 22d8                     move.l     (a0)+, (a1)+
2bdc: 486effe8                 pea.l      -$18(a6)
2be0: 3f3cfff1                 move.w     #$fff1, -(a7)
2be4: 3f3cfffe                 move.w     #$fffe, -(a7)
2be8: a8a9                     dc.w       $a8a9
2bea: 486effe8                 pea.l      -$18(a6)
2bee: 4267                     clr.w      -(a7)
2bf0: 3f3cfff8                 move.w     #$fff8, -(a7)
2bf4: a8a8                     dc.w       $a8a8
2bf6: 486effe8                 pea.l      -$18(a6)
2bfa: a8a3                     dc.w       $a8a3
2bfc: 2f2cfba0                 move.l     -$460(a4), -(a7)
2c00: a873                     dc.w       $a873
2c02: 4cdf10c0                 movem.l    (a7)+, d6-d7/a4
2c06: 4e5e                     unlk       a6
2c08: 205f                     movea.l    (a7)+, a0
2c0a: 5c4f                     addq.w     #$6, a7
2c0c: 4ed0                     jmp        (a0)
2c0e: 0b3c64657374             btst.l     d5, #$64657374
2c14: 726f                     moveq      #$6f, d1
2c16: 7965                     .byte      0x79, 0x65
2c18: 643e                     bcc.b      $2c58
2c1a: 4e560000                 link.w     a6, #$0
2c1e: 48e70118                 movem.l    d7/a3-a4, -(a7)
2c22: 286e0008                 movea.l    $8(a6), a4
2c26: 286c0008                 movea.l    $8(a4), a4
2c2a: 266e0008                 movea.l    $8(a6), a3
2c2e: 3e2e000c                 move.w     $c(a6), d7
2c32: 197c0001fc0b             move.b     #$1, -$3f5(a4)
2c38: 41edc375                 lea.l      -$3c8b(a5), a0
2c3c: 42307000                 clr.b      (a0, d7.w)
2c40: 302dc382                 move.w     -$3c7e(a5), d0
2c44: 5340                     subq.w     #$1, d0
2c46: 3b40c382                 move.w     d0, -$3c7e(a5)
2c4a: 486cfbd0                 pea.l      -$430(a4)
2c4e: 2f0c                     move.l     a4, -(a7)
2c50: 4ebaf32e                 jsr        $1f80(pc)
2c54: 302bffee                 move.w     -$12(a3), d0
2c58: c1fc0006                 muls.w     #$6, d0
2c5c: 0640fe22                 addi.w     #$fe22, d0
2c60: 39bc00010000             move.w     #$1, (a4, d0.w)
2c66: 206bffea                 movea.l    -$16(a3), a0
2c6a: 2050                     movea.l    (a0), a0
2c6c: 302bffee                 move.w     -$12(a3), d0
2c70: c1fc0006                 muls.w     #$6, d0
2c74: 0640fe26                 addi.w     #$fe26, d0
2c78: 39a820720000             move.w     $2072(a0), (a4, d0.w)
2c7e: 206bffea                 movea.l    -$16(a3), a0
2c82: 2050                     movea.l    (a0), a0
2c84: 302bffee                 move.w     -$12(a3), d0
2c88: c1fc0006                 muls.w     #$6, d0
2c8c: 0640fe24                 addi.w     #$fe24, d0
2c90: 39a820740000             move.w     $2074(a0), (a4, d0.w)
2c96: 3007                     move.w     d7, d0
2c98: d040                     add.w      d0, d0
2c9a: 0640fe9e                 addi.w     #$fe9e, d0
2c9e: 4a740000                 tst.w      (a4, d0.w)
2ca2: 6f08                     ble.b      $2cac
2ca4: 3f07                     move.w     d7, -(a7)
2ca6: 2f0c                     move.l     a4, -(a7)
2ca8: 4ebafdfa                 jsr        $2aa4(pc)
2cac: 4cdf1880                 movem.l    (a7)+, d7/a3-a4
2cb0: 4e5e                     unlk       a6
2cb2: 205f                     movea.l    (a7)+, a0
2cb4: 5c4f                     addq.w     #$6, a7
2cb6: 4ed0                     jmp        (a0)
2cb8: 4e56ffc0                 link.w     a6, #$ffc0
2cbc: 48e71f08                 movem.l    d3-d7/a4, -(a7)
2cc0: 286e0008                 movea.l    $8(a6), a4
2cc4: 3f3c0002                 move.w     #$2, -(a7)
2cc8: 3f3c0002                 move.w     #$2, -(a7)
2ccc: a89b                     dc.w       $a89b
2cce: 3d7c0001ffee             move.w     #$1, -$12(a6)
2cd4: 302effee                 move.w     -$12(a6), d0
2cd8: 0640c37b                 addi.w     #$c37b, d0
2cdc: 4a350000                 tst.b      (a5, d0.w)
2ce0: 6700035c                 beq.w      $303e
2ce4: 302effee                 move.w     -$12(a6), d0
2ce8: c1fc00a6                 muls.w     #$a6, d0
2cec: 0640c030                 addi.w     #$c030, d0
2cf0: 2d750000ffea             move.l     (a5, d0.w), -$16(a6)
2cf6: 206effea                 movea.l    -$16(a6), a0
2cfa: 2050                     movea.l    (a0), a0
2cfc: 0c680064207a             cmpi.w     #$64, $207a(a0)
2d02: 5cc0                     sge.b      d0
2d04: 322effee                 move.w     -$12(a6), d1
2d08: 0641c375                 addi.w     #$c375, d1
2d0c: c0351000                 and.b      (a5, d1.w), d0
2d10: 671a                     beq.b      $2d2c
2d12: 206effea                 movea.l    -$16(a6), a0
2d16: 2050                     movea.l    (a0), a0
2d18: 317c0064207a             move.w     #$64, $207a(a0)
2d1e: 3f2effee                 move.w     -$12(a6), -(a7)
2d22: 2f0e                     move.l     a6, -(a7)
2d24: 4ebafef4                 jsr        $2c1a(pc)
2d28: 60000314                 bra.w      $303e
2d2c: 206effea                 movea.l    -$16(a6), a0
2d30: 2050                     movea.l    (a0), a0
2d32: 4a28228a                 tst.b      $228a(a0)
2d36: 67000306                 beq.w      $303e
2d3a: 206effea                 movea.l    -$16(a6), a0
2d3e: 2050                     movea.l    (a0), a0
2d40: 3e282294                 move.w     $2294(a0), d7
2d44: 206effea                 movea.l    -$16(a6), a0
2d48: 2050                     movea.l    (a0), a0
2d4a: 3c282292                 move.w     $2292(a0), d6
2d4e: 206effea                 movea.l    -$16(a6), a0
2d52: 2050                     movea.l    (a0), a0
2d54: 3d682296ffdc             move.w     $2296(a0), -$24(a6)
2d5a: 206effea                 movea.l    -$16(a6), a0
2d5e: 2050                     movea.l    (a0), a0
2d60: 3d682298ffda             move.w     $2298(a0), -$26(a6)
2d66: 102e000e                 move.b     $e(a6), d0
2d6a: 5300                     subq.b     #$1, d0
2d6c: 6734                     beq.b      $2da2
2d6e: 206effea                 movea.l    -$16(a6), a0
2d72: 2050                     movea.l    (a0), a0
2d74: 302effda                 move.w     -$26(a6), d0
2d78: c1c7                     muls.w     d7, d0
2d7a: 48c0                     ext.l      d0
2d7c: 81c6                     divs.w     d6, d0
2d7e: d068229a                 add.w      $229a(a0), d0
2d82: 3d40ffd0                 move.w     d0, -$30(a6)
2d86: 206effea                 movea.l    -$16(a6), a0
2d8a: 2050                     movea.l    (a0), a0
2d8c: 302effdc                 move.w     -$24(a6), d0
2d90: c1c7                     muls.w     d7, d0
2d92: 48c0                     ext.l      d0
2d94: 81c6                     divs.w     d6, d0
2d96: d068229c                 add.w      $229c(a0), d0
2d9a: 3d40ffd2                 move.w     d0, -$2e(a6)
2d9e: 600001b0                 bra.w      $2f50
2da2: 4a47                     tst.w      d7
2da4: 670e                     beq.b      $2db4
2da6: 206effea                 movea.l    -$16(a6), a0
2daa: 2050                     movea.l    (a0), a0
2dac: 2d68229effcc             move.l     $229e(a0), -$34(a6)
2db2: 600a                     bra.b      $2dbe
2db4: 486cfba8                 pea.l      -$458(a4)
2db8: 2f0c                     move.l     a4, -(a7)
2dba: 4ebaf1c4                 jsr        $1f80(pc)
2dbe: 5247                     addq.w     #$1, d7
2dc0: be46                     cmp.w      d6, d7
2dc2: 664e                     bne.b      $2e12
2dc4: 206effea                 movea.l    -$16(a6), a0
2dc8: 2050                     movea.l    (a0), a0
2dca: 2d68228effd0             move.l     $228e(a0), -$30(a6)
2dd0: 206effea                 movea.l    -$16(a6), a0
2dd4: 2050                     movea.l    (a0), a0
2dd6: 117c0001228b             move.b     #$1, $228b(a0)
2ddc: 0c460001                 cmpi.w     #$1, d6
2de0: 661e                     bne.b      $2e00
2de2: 206effea                 movea.l    -$16(a6), a0
2de6: 2050                     movea.l    (a0), a0
2de8: 382effd2                 move.w     -$2e(a6), d4
2dec: 9868229c                 sub.w      $229c(a0), d4
2df0: 206effea                 movea.l    -$16(a6), a0
2df4: 2050                     movea.l    (a0), a0
2df6: 3a2effd0                 move.w     -$30(a6), d5
2dfa: 9a68229a                 sub.w      $229a(a0), d5
2dfe: 6052                     bra.b      $2e52
2e00: 382effd2                 move.w     -$2e(a6), d4
2e04: 986effce                 sub.w      -$32(a6), d4
2e08: 3a2effd0                 move.w     -$30(a6), d5
2e0c: 9a6effcc                 sub.w      -$34(a6), d5
2e10: 6040                     bra.b      $2e52
2e12: 206effea                 movea.l    -$16(a6), a0
2e16: 2050                     movea.l    (a0), a0
2e18: 302effda                 move.w     -$26(a6), d0
2e1c: c1c7                     muls.w     d7, d0
2e1e: 48c0                     ext.l      d0
2e20: 81c6                     divs.w     d6, d0
2e22: d068229a                 add.w      $229a(a0), d0
2e26: 3d40ffd0                 move.w     d0, -$30(a6)
2e2a: 206effea                 movea.l    -$16(a6), a0
2e2e: 2050                     movea.l    (a0), a0
2e30: 302effdc                 move.w     -$24(a6), d0
2e34: c1c7                     muls.w     d7, d0
2e36: 48c0                     ext.l      d0
2e38: 81c6                     divs.w     d6, d0
2e3a: d068229c                 add.w      $229c(a0), d0
2e3e: 3d40ffd2                 move.w     d0, -$2e(a6)
2e42: 382effdc                 move.w     -$24(a6), d4
2e46: 48c4                     ext.l      d4
2e48: 89c6                     divs.w     d6, d4
2e4a: 3a2effda                 move.w     -$26(a6), d5
2e4e: 48c5                     ext.l      d5
2e50: 8bc6                     divs.w     d6, d5
2e52: 554f                     subq.w     #$2, a7
2e54: 2f2effd0                 move.l     -$30(a6), -(a7)
2e58: 206dbe26                 movea.l    -$41da(a5), a0
2e5c: 48680010                 pea.l      $10(a0)
2e60: a8ad                     dc.w       $a8ad
2e62: 101f                     move.b     (a7)+, d0
2e64: 5300                     subq.b     #$1, d0
2e66: 670000e8                 beq.w      $2f50
2e6a: 426effe8                 clr.w      -$18(a6)
2e6e: 426effe6                 clr.w      -$1a(a6)
2e72: 4a45                     tst.w      d5
2e74: 674a                     beq.b      $2ec0
2e76: 4a6effd0                 tst.w      -$30(a6)
2e7a: 6c18                     bge.b      $2e94
2e7c: 302effd0                 move.w     -$30(a6), d0
2e80: c1fc0014                 muls.w     #$14, d0
2e84: 48c0                     ext.l      d0
2e86: 81c5                     divs.w     d5, d0
2e88: 4a40                     tst.w      d0
2e8a: 6a02                     bpl.b      $2e8e
2e8c: 4440                     neg.w      d0
2e8e: 3d40ffe6                 move.w     d0, -$1a(a6)
2e92: 602c                     bra.b      $2ec0
2e94: 206dbe26                 movea.l    -$41da(a5), a0
2e98: 302effd0                 move.w     -$30(a6), d0
2e9c: b0680014                 cmp.w      $14(a0), d0
2ea0: 6f1e                     ble.b      $2ec0
2ea2: 206dbe26                 movea.l    -$41da(a5), a0
2ea6: 302effd0                 move.w     -$30(a6), d0
2eaa: 90680014                 sub.w      $14(a0), d0
2eae: c1fc0014                 muls.w     #$14, d0
2eb2: 48c0                     ext.l      d0
2eb4: 81c5                     divs.w     d5, d0
2eb6: 4a40                     tst.w      d0
2eb8: 6a02                     bpl.b      $2ebc
2eba: 4440                     neg.w      d0
2ebc: 3d40ffe6                 move.w     d0, -$1a(a6)
2ec0: 4a44                     tst.w      d4
2ec2: 674a                     beq.b      $2f0e
2ec4: 4a6effd2                 tst.w      -$2e(a6)
2ec8: 6c18                     bge.b      $2ee2
2eca: 302effd2                 move.w     -$2e(a6), d0
2ece: c1fc0014                 muls.w     #$14, d0
2ed2: 48c0                     ext.l      d0
2ed4: 81c4                     divs.w     d4, d0
2ed6: 4a40                     tst.w      d0
2ed8: 6a02                     bpl.b      $2edc
2eda: 4440                     neg.w      d0
2edc: 3d40ffe8                 move.w     d0, -$18(a6)
2ee0: 602c                     bra.b      $2f0e
2ee2: 206dbe26                 movea.l    -$41da(a5), a0
2ee6: 302effd2                 move.w     -$2e(a6), d0
2eea: b0680016                 cmp.w      $16(a0), d0
2eee: 6f1e                     ble.b      $2f0e
2ef0: 206dbe26                 movea.l    -$41da(a5), a0
2ef4: 302effd2                 move.w     -$2e(a6), d0
2ef8: 90680016                 sub.w      $16(a0), d0
2efc: c1fc0014                 muls.w     #$14, d0
2f00: 48c0                     ext.l      d0
2f02: 81c4                     divs.w     d4, d0
2f04: 4a40                     tst.w      d0
2f06: 6a02                     bpl.b      $2f0a
2f08: 4440                     neg.w      d0
2f0a: 3d40ffe8                 move.w     d0, -$18(a6)
2f0e: 362effe8                 move.w     -$18(a6), d3
2f12: b66effe6                 cmp.w      -$1a(a6), d3
2f16: 6c04                     bge.b      $2f1c
2f18: 362effe6                 move.w     -$1a(a6), d3
2f1c: 3004                     move.w     d4, d0
2f1e: c1c3                     muls.w     d3, d0
2f20: 48c0                     ext.l      d0
2f22: 81fc0014                 divs.w     #$14, d0
2f26: 322effd2                 move.w     -$2e(a6), d1
2f2a: 9240                     sub.w      d0, d1
2f2c: 3d41ffd2                 move.w     d1, -$2e(a6)
2f30: 3005                     move.w     d5, d0
2f32: c1c3                     muls.w     d3, d0
2f34: 48c0                     ext.l      d0
2f36: 81fc0014                 divs.w     #$14, d0
2f3a: 322effd0                 move.w     -$30(a6), d1
2f3e: 9240                     sub.w      d0, d1
2f40: 3d41ffd0                 move.w     d1, -$30(a6)
2f44: 206effea                 movea.l    -$16(a6), a0
2f48: 2050                     movea.l    (a0), a0
2f4a: 117c0001228b             move.b     #$1, $228b(a0)
2f50: 206effea                 movea.l    -$16(a6), a0
2f54: 2050                     movea.l    (a0), a0
2f56: 1028228b                 move.b     $228b(a0), d0
2f5a: c02e000e                 and.b      $e(a6), d0
2f5e: 670000a8                 beq.w      $3008
2f62: 206effea                 movea.l    -$16(a6), a0
2f66: 2050                     movea.l    (a0), a0
2f68: 4268228c                 clr.w      $228c(a0)
2f6c: 206effea                 movea.l    -$16(a6), a0
2f70: 2050                     movea.l    (a0), a0
2f72: 2f08                     move.l     a0, -(a7)
2f74: 594f                     subq.w     #$4, a7
2f76: 2f2effd0                 move.l     -$30(a6), -(a7)
2f7a: 3f2effee                 move.w     -$12(a6), -(a7)
2f7e: 206effea                 movea.l    -$16(a6), a0
2f82: 2050                     movea.l    (a0), a0
2f84: 486822c8                 pea.l      $22c8(a0)
2f88: 4ebad2b4                 jsr        $23e(pc)
2f8c: 201f                     move.l     (a7)+, d0
2f8e: 205f                     movea.l    (a7)+, a0
2f90: d0a822c0                 add.l      $22c0(a0), d0
2f94: 206effea                 movea.l    -$16(a6), a0
2f98: 2050                     movea.l    (a0), a0
2f9a: 214022c0                 move.l     d0, $22c0(a0)
2f9e: 486cfbe2                 pea.l      -$41e(a4)
2fa2: 2f0c                     move.l     a4, -(a7)
2fa4: 4ebaefda                 jsr        $1f80(pc)
2fa8: 206effea                 movea.l    -$16(a6), a0
2fac: 2050                     movea.l    (a0), a0
2fae: 216effd0228e             move.l     -$30(a6), $228e(a0)
2fb4: 206effea                 movea.l    -$16(a6), a0
2fb8: 2050                     movea.l    (a0), a0
2fba: 4228228a                 clr.b      $228a(a0)
2fbe: 4a2e000c                 tst.b      $c(a6)
2fc2: 6738                     beq.b      $2ffc
2fc4: 486cfeac                 pea.l      -$154(a4)
2fc8: 302effd2                 move.w     -$2e(a6), d0
2fcc: 0640fff7                 addi.w     #$fff7, d0
2fd0: 3f00                     move.w     d0, -(a7)
2fd2: 302effd0                 move.w     -$30(a6), d0
2fd6: 0640fff7                 addi.w     #$fff7, d0
2fda: 3f00                     move.w     d0, -(a7)
2fdc: 302effd2                 move.w     -$2e(a6), d0
2fe0: 06400009                 addi.w     #$9, d0
2fe4: 3f00                     move.w     d0, -(a7)
2fe6: 302effd0                 move.w     -$30(a6), d0
2fea: 06400009                 addi.w     #$9, d0
2fee: 3f00                     move.w     d0, -(a7)
2ff0: a8a7                     dc.w       $a8a7
2ff2: 486cfeac                 pea.l      -$154(a4)
2ff6: 486dffb2                 pea.l      -$4e(a5)
2ffa: a8bb                     dc.w       $a8bb
2ffc: 206effea                 movea.l    -$16(a6), a0
3000: 2050                     movea.l    (a0), a0
3002: 4228228b                 clr.b      $228b(a0)
3006: 6036                     bra.b      $303e
3008: 4a2e000c                 tst.b      $c(a6)
300c: 671a                     beq.b      $3028
300e: 486dffba                 pea.l      -$46(a5)
3012: a89d                     dc.w       $a89d
3014: 3f2effd2                 move.w     -$2e(a6), -(a7)
3018: 3f2effd0                 move.w     -$30(a6), -(a7)
301c: a893                     dc.w       $a893
301e: 3f2effd2                 move.w     -$2e(a6), -(a7)
3022: 3f2effd0                 move.w     -$30(a6), -(a7)
3026: a891                     dc.w       $a891
3028: 206effea                 movea.l    -$16(a6), a0
302c: 2050                     movea.l    (a0), a0
302e: 216effd0229e             move.l     -$30(a6), $229e(a0)
3034: 206effea                 movea.l    -$16(a6), a0
3038: 2050                     movea.l    (a0), a0
303a: 31472294                 move.w     d7, $2294(a0)
303e: 526effee                 addq.w     #$1, -$12(a6)
3042: 0c6e0005ffee             cmpi.w     #$5, -$12(a6)
3048: 6f00fc8a                 ble.w      $2cd4
304c: 3f3c0001                 move.w     #$1, -(a7)
3050: 3f3c0001                 move.w     #$1, -(a7)
3054: a89b                     dc.w       $a89b
3056: 4cdf10f8                 movem.l    (a7)+, d3-d7/a4
305a: 4e5e                     unlk       a6
305c: 205f                     movea.l    (a7)+, a0
305e: 504f                     addq.w     #$8, a7
3060: 4ed0                     jmp        (a0)
3062: 4e56ffaa                 link.w     a6, #$ffaa
3066: 48e70f18                 movem.l    d4-d7/a3-a4, -(a7)
306a: 286e0008                 movea.l    $8(a6), a4
306e: 1a2e000c                 move.b     $c(a6), d5
3072: 182e000e                 move.b     $e(a6), d4
3076: 486effc8                 pea.l      -$38(a6)
307a: a874                     dc.w       $a874
307c: 2f2cfba0                 move.l     -$460(a4), -(a7)
3080: a873                     dc.w       $a873
3082: 4a05                     tst.b      d5
3084: 670a                     beq.b      $3090
3086: 206cfba0                 movea.l    -$460(a4), a0
308a: 48680008                 pea.l      $8(a0)
308e: a8a3                     dc.w       $a8a3
3090: 7e01                     moveq      #$1, d7
3092: 41edc37b                 lea.l      -$3c85(a5), a0
3096: 4a307000                 tst.b      (a0, d7.w)
309a: 6700041c                 beq.w      $34b8
309e: 3007                     move.w     d7, d0
30a0: c1fc00a6                 muls.w     #$a6, d0
30a4: 0640c030                 addi.w     #$c030, d0
30a8: 26750000                 movea.l    (a5, d0.w), a3
30ac: 41edc375                 lea.l      -$3c8b(a5), a0
30b0: 4a307000                 tst.b      (a0, d7.w)
30b4: 670000fa                 beq.w      $31b0
30b8: 4a05                     tst.b      d5
30ba: 670000ca                 beq.w      $3186
30be: 2053                     movea.l    (a3), a0
30c0: 41e822a4                 lea.l      $22a4(a0), a0
30c4: 43eeffcc                 lea.l      -$34(a6), a1
30c8: 22d8                     move.l     (a0)+, (a1)+
30ca: 22d8                     move.l     (a0)+, (a1)+
30cc: 2053                     movea.l    (a3), a0
30ce: 4a6822a2                 tst.w      $22a2(a0)
30d2: 6f6a                     ble.b      $313e
30d4: 2053                     movea.l    (a3), a0
30d6: 30282092                 move.w     $2092(a0), d0
30da: 5e40                     addq.w     #$7, d0
30dc: 48c0                     ext.l      d0
30de: 81fc000f                 divs.w     #$f, d0
30e2: 48c0                     ext.l      d0
30e4: 81fc0018                 divs.w     #$18, d0
30e8: 4840                     swap       d0
30ea: 3940fecc                 move.w     d0, -$134(a4)
30ee: 4a04                     tst.b      d4
30f0: 670e                     beq.b      $3100
30f2: 2053                     movea.l    (a3), a0
30f4: 302822a2                 move.w     $22a2(a0), d0
30f8: 5340                     subq.w     #$1, d0
30fa: 2053                     movea.l    (a3), a0
30fc: 314022a2                 move.w     d0, $22a2(a0)
3100: 3007                     move.w     d7, d0
3102: d040                     add.w      d0, d0
3104: 0640fe9e                 addi.w     #$fe9e, d0
3108: 30340000                 move.w     (a4, d0.w), d0
310c: 6a02                     bpl.b      $3110
310e: 4440                     neg.w      d0
3110: c1fc0360                 muls.w     #$360, d0
3114: 322cfecc                 move.w     -$134(a4), d1
3118: c3fc0024                 muls.w     #$24, d1
311c: d041                     add.w      d1, d0
311e: 0640c0e0                 addi.w     #$c0e0, d0
3122: 48750000                 pea.l      (a5, d0.w)
3126: 206cfba0                 movea.l    -$460(a4), a0
312a: 48680002                 pea.l      $2(a0)
312e: 486dc392                 pea.l      -$3c6e(a5)
3132: 486effcc                 pea.l      -$34(a6)
3136: 4267                     clr.w      -(a7)
3138: 42a7                     clr.l      -(a7)
313a: a8ec                     dc.w       $a8ec
313c: 6032                     bra.b      $3170
313e: 3007                     move.w     d7, d0
3140: d040                     add.w      d0, d0
3142: 0640fe9e                 addi.w     #$fe9e, d0
3146: 30340000                 move.w     (a4, d0.w), d0
314a: 6a02                     bpl.b      $314e
314c: 4440                     neg.w      d0
314e: c1fc0024                 muls.w     #$24, d0
3152: 0640c368                 addi.w     #$c368, d0
3156: 48750000                 pea.l      (a5, d0.w)
315a: 206cfba0                 movea.l    -$460(a4), a0
315e: 48680002                 pea.l      $2(a0)
3162: 486dc392                 pea.l      -$3c6e(a5)
3166: 486effcc                 pea.l      -$34(a6)
316a: 4267                     clr.w      -(a7)
316c: 42a7                     clr.l      -(a7)
316e: a8ec                     dc.w       $a8ec
3170: 2053                     movea.l    (a3), a0
3172: 4a682082                 tst.w      $2082(a0)
3176: 670e                     beq.b      $3186
3178: 486dffc2                 pea.l      -$3e(a5)
317c: a89d                     dc.w       $a89d
317e: 486effcc                 pea.l      -$34(a6)
3182: a8a1                     dc.w       $a8a1
3184: a89e                     dc.w       $a89e
3186: 2053                     movea.l    (a3), a0
3188: 4a682286                 tst.w      $2286(a0)
318c: 6f00032a                 ble.w      $34b8
3190: 2053                     movea.l    (a3), a0
3192: 486822a4                 pea.l      $22a4(a0)
3196: a8a4                     dc.w       $a8a4
3198: 4a04                     tst.b      d4
319a: 6700031c                 beq.w      $34b8
319e: 2053                     movea.l    (a3), a0
31a0: 30282286                 move.w     $2286(a0), d0
31a4: 5340                     subq.w     #$1, d0
31a6: 2053                     movea.l    (a3), a0
31a8: 31402286                 move.w     d0, $2286(a0)
31ac: 6000030a                 bra.w      $34b8
31b0: 3c07                     move.w     d7, d6
31b2: cdfc0006                 muls.w     #$6, d6
31b6: 41ecfe22                 lea.l      -$1de(a4), a0
31ba: 3c306000                 move.w     (a0, d6.w), d6
31be: 4a46                     tst.w      d6
31c0: 6f0002f6                 ble.w      $34b8
31c4: 4a05                     tst.b      d5
31c6: 670002d8                 beq.w      $34a0
31ca: 3007                     move.w     d7, d0
31cc: c1fc0006                 muls.w     #$6, d0
31d0: 0640fe24                 addi.w     #$fe24, d0
31d4: 2d740000ffd4             move.l     (a4, d0.w), -$2c(a6)
31da: a89e                     dc.w       $a89e
31dc: 3006                     move.w     d6, d0
31de: 600002a8                 bra.w      $3488
31e2: 3f2effd6                 move.w     -$2a(a6), -(a7)
31e6: 3f2effd4                 move.w     -$2c(a6), -(a7)
31ea: a893                     dc.w       $a893
31ec: 4267                     clr.w      -(a7)
31ee: 3f3c0005                 move.w     #$5, -(a7)
31f2: a892                     dc.w       $a892
31f4: 3f2effd6                 move.w     -$2a(a6), -(a7)
31f8: 3f2effd4                 move.w     -$2c(a6), -(a7)
31fc: a893                     dc.w       $a893
31fe: 3f3c0005                 move.w     #$5, -(a7)
3202: 3f3c0005                 move.w     #$5, -(a7)
3206: a892                     dc.w       $a892
3208: 3f2effd6                 move.w     -$2a(a6), -(a7)
320c: 3f2effd4                 move.w     -$2c(a6), -(a7)
3210: a893                     dc.w       $a893
3212: 3f3c0005                 move.w     #$5, -(a7)
3216: 4267                     clr.w      -(a7)
3218: a892                     dc.w       $a892
321a: 3f2effd6                 move.w     -$2a(a6), -(a7)
321e: 3f2effd4                 move.w     -$2c(a6), -(a7)
3222: a893                     dc.w       $a893
3224: 3f3c0005                 move.w     #$5, -(a7)
3228: 3f3cfffb                 move.w     #$fffb, -(a7)
322c: a892                     dc.w       $a892
322e: 3f2effd6                 move.w     -$2a(a6), -(a7)
3232: 3f2effd4                 move.w     -$2c(a6), -(a7)
3236: a893                     dc.w       $a893
3238: 4267                     clr.w      -(a7)
323a: 3f3cfffb                 move.w     #$fffb, -(a7)
323e: a892                     dc.w       $a892
3240: 3f2effd6                 move.w     -$2a(a6), -(a7)
3244: 3f2effd4                 move.w     -$2c(a6), -(a7)
3248: a893                     dc.w       $a893
324a: 3f3cfffb                 move.w     #$fffb, -(a7)
324e: 3f3cfffb                 move.w     #$fffb, -(a7)
3252: a892                     dc.w       $a892
3254: 3f2effd6                 move.w     -$2a(a6), -(a7)
3258: 3f2effd4                 move.w     -$2c(a6), -(a7)
325c: a893                     dc.w       $a893
325e: 3f3cfffb                 move.w     #$fffb, -(a7)
3262: 4267                     clr.w      -(a7)
3264: a892                     dc.w       $a892
3266: 3f2effd6                 move.w     -$2a(a6), -(a7)
326a: 3f2effd4                 move.w     -$2c(a6), -(a7)
326e: a893                     dc.w       $a893
3270: 3f3cfffb                 move.w     #$fffb, -(a7)
3274: 3f3c0005                 move.w     #$5, -(a7)
3278: a892                     dc.w       $a892
327a: 60000224                 bra.w      $34a0
327e: 3f2effd6                 move.w     -$2a(a6), -(a7)
3282: 302effd4                 move.w     -$2c(a6), d0
3286: 5840                     addq.w     #$4, d0
3288: 3f00                     move.w     d0, -(a7)
328a: a893                     dc.w       $a893
328c: 4267                     clr.w      -(a7)
328e: 3f3c0003                 move.w     #$3, -(a7)
3292: a892                     dc.w       $a892
3294: 302effd6                 move.w     -$2a(a6), d0
3298: 5440                     addq.w     #$2, d0
329a: 3f00                     move.w     d0, -(a7)
329c: 302effd4                 move.w     -$2c(a6), d0
32a0: 5440                     addq.w     #$2, d0
32a2: 3f00                     move.w     d0, -(a7)
32a4: a893                     dc.w       $a893
32a6: 3f3c0004                 move.w     #$4, -(a7)
32aa: 3f3c0004                 move.w     #$4, -(a7)
32ae: a892                     dc.w       $a892
32b0: 302effd6                 move.w     -$2a(a6), d0
32b4: 5840                     addq.w     #$4, d0
32b6: 3f00                     move.w     d0, -(a7)
32b8: 3f2effd4                 move.w     -$2c(a6), -(a7)
32bc: a893                     dc.w       $a893
32be: 3f3c0003                 move.w     #$3, -(a7)
32c2: 4267                     clr.w      -(a7)
32c4: a892                     dc.w       $a892
32c6: 302effd6                 move.w     -$2a(a6), d0
32ca: 5440                     addq.w     #$2, d0
32cc: 3f00                     move.w     d0, -(a7)
32ce: 302effd4                 move.w     -$2c(a6), d0
32d2: 5540                     subq.w     #$2, d0
32d4: 3f00                     move.w     d0, -(a7)
32d6: a893                     dc.w       $a893
32d8: 3f3c0004                 move.w     #$4, -(a7)
32dc: 3f3cfffc                 move.w     #$fffc, -(a7)
32e0: a892                     dc.w       $a892
32e2: 3f2effd6                 move.w     -$2a(a6), -(a7)
32e6: 302effd4                 move.w     -$2c(a6), d0
32ea: 5940                     subq.w     #$4, d0
32ec: 3f00                     move.w     d0, -(a7)
32ee: a893                     dc.w       $a893
32f0: 4267                     clr.w      -(a7)
32f2: 3f3cfffd                 move.w     #$fffd, -(a7)
32f6: a892                     dc.w       $a892
32f8: 302effd6                 move.w     -$2a(a6), d0
32fc: 5540                     subq.w     #$2, d0
32fe: 3f00                     move.w     d0, -(a7)
3300: 302effd4                 move.w     -$2c(a6), d0
3304: 5540                     subq.w     #$2, d0
3306: 3f00                     move.w     d0, -(a7)
3308: a893                     dc.w       $a893
330a: 3f3cfffc                 move.w     #$fffc, -(a7)
330e: 3f3cfffc                 move.w     #$fffc, -(a7)
3312: a892                     dc.w       $a892
3314: 302effd6                 move.w     -$2a(a6), d0
3318: 5940                     subq.w     #$4, d0
331a: 3f00                     move.w     d0, -(a7)
331c: 3f2effd4                 move.w     -$2c(a6), -(a7)
3320: a893                     dc.w       $a893
3322: 3f3cfffd                 move.w     #$fffd, -(a7)
3326: 4267                     clr.w      -(a7)
3328: a892                     dc.w       $a892
332a: 302effd6                 move.w     -$2a(a6), d0
332e: 5540                     subq.w     #$2, d0
3330: 3f00                     move.w     d0, -(a7)
3332: 302effd4                 move.w     -$2c(a6), d0
3336: 5440                     addq.w     #$2, d0
3338: 3f00                     move.w     d0, -(a7)
333a: a893                     dc.w       $a893
333c: 3f3cfffc                 move.w     #$fffc, -(a7)
3340: 3f3c0004                 move.w     #$4, -(a7)
3344: a892                     dc.w       $a892
3346: 60000158                 bra.w      $34a0
334a: 3f2effd6                 move.w     -$2a(a6), -(a7)
334e: 302effd4                 move.w     -$2c(a6), d0
3352: 5040                     addq.w     #$8, d0
3354: 3f00                     move.w     d0, -(a7)
3356: a893                     dc.w       $a893
3358: 4267                     clr.w      -(a7)
335a: 3f3c0001                 move.w     #$1, -(a7)
335e: a892                     dc.w       $a892
3360: 302effd6                 move.w     -$2a(a6), d0
3364: 5840                     addq.w     #$4, d0
3366: 3f00                     move.w     d0, -(a7)
3368: 302effd4                 move.w     -$2c(a6), d0
336c: 5840                     addq.w     #$4, d0
336e: 3f00                     move.w     d0, -(a7)
3370: a893                     dc.w       $a893
3372: 3f3c0003                 move.w     #$3, -(a7)
3376: 3f3c0003                 move.w     #$3, -(a7)
337a: a892                     dc.w       $a892
337c: 302effd6                 move.w     -$2a(a6), d0
3380: 5040                     addq.w     #$8, d0
3382: 3f00                     move.w     d0, -(a7)
3384: 3f2effd4                 move.w     -$2c(a6), -(a7)
3388: a893                     dc.w       $a893
338a: 3f3c0001                 move.w     #$1, -(a7)
338e: 4267                     clr.w      -(a7)
3390: a892                     dc.w       $a892
3392: 302effd6                 move.w     -$2a(a6), d0
3396: 5840                     addq.w     #$4, d0
3398: 3f00                     move.w     d0, -(a7)
339a: 302effd4                 move.w     -$2c(a6), d0
339e: 5940                     subq.w     #$4, d0
33a0: 3f00                     move.w     d0, -(a7)
33a2: a893                     dc.w       $a893
33a4: 3f3c0003                 move.w     #$3, -(a7)
33a8: 3f3cfffd                 move.w     #$fffd, -(a7)
33ac: a892                     dc.w       $a892
33ae: 3f2effd6                 move.w     -$2a(a6), -(a7)
33b2: 302effd4                 move.w     -$2c(a6), d0
33b6: 5140                     subq.w     #$8, d0
33b8: 3f00                     move.w     d0, -(a7)
33ba: a893                     dc.w       $a893
33bc: 4267                     clr.w      -(a7)
33be: 3f3cffff                 move.w     #$ffff, -(a7)
33c2: a892                     dc.w       $a892
33c4: 302effd6                 move.w     -$2a(a6), d0
33c8: 5940                     subq.w     #$4, d0
33ca: 3f00                     move.w     d0, -(a7)
33cc: 302effd4                 move.w     -$2c(a6), d0
33d0: 5940                     subq.w     #$4, d0
33d2: 3f00                     move.w     d0, -(a7)
33d4: a893                     dc.w       $a893
33d6: 3f3cfffd                 move.w     #$fffd, -(a7)
33da: 3f3cfffd                 move.w     #$fffd, -(a7)
33de: a892                     dc.w       $a892
33e0: 302effd6                 move.w     -$2a(a6), d0
33e4: 5140                     subq.w     #$8, d0
33e6: 3f00                     move.w     d0, -(a7)
33e8: 3f2effd4                 move.w     -$2c(a6), -(a7)
33ec: a893                     dc.w       $a893
33ee: 3f3cffff                 move.w     #$ffff, -(a7)
33f2: 4267                     clr.w      -(a7)
33f4: a892                     dc.w       $a892
33f6: 302effd6                 move.w     -$2a(a6), d0
33fa: 5940                     subq.w     #$4, d0
33fc: 3f00                     move.w     d0, -(a7)
33fe: 302effd4                 move.w     -$2c(a6), d0
3402: 5840                     addq.w     #$4, d0
3404: 3f00                     move.w     d0, -(a7)
3406: a893                     dc.w       $a893
3408: 3f3cfffd                 move.w     #$fffd, -(a7)
340c: 3f3c0003                 move.w     #$3, -(a7)
3410: a892                     dc.w       $a892
3412: 6000008c                 bra.w      $34a0
3416: 302effd6                 move.w     -$2a(a6), d0
341a: 5040                     addq.w     #$8, d0
341c: 3f00                     move.w     d0, -(a7)
341e: 302effd4                 move.w     -$2c(a6), d0
3422: 5040                     addq.w     #$8, d0
3424: 3f00                     move.w     d0, -(a7)
3426: a893                     dc.w       $a893
3428: 3f3c0001                 move.w     #$1, -(a7)
342c: 3f3c0001                 move.w     #$1, -(a7)
3430: a892                     dc.w       $a892
3432: 302effd6                 move.w     -$2a(a6), d0
3436: 5040                     addq.w     #$8, d0
3438: 3f00                     move.w     d0, -(a7)
343a: 302effd4                 move.w     -$2c(a6), d0
343e: 5140                     subq.w     #$8, d0
3440: 3f00                     move.w     d0, -(a7)
3442: a893                     dc.w       $a893
3444: 3f3c0001                 move.w     #$1, -(a7)
3448: 3f3cffff                 move.w     #$ffff, -(a7)
344c: a892                     dc.w       $a892
344e: 302effd6                 move.w     -$2a(a6), d0
3452: 5140                     subq.w     #$8, d0
3454: 3f00                     move.w     d0, -(a7)
3456: 302effd4                 move.w     -$2c(a6), d0
345a: 5140                     subq.w     #$8, d0
345c: 3f00                     move.w     d0, -(a7)
345e: a893                     dc.w       $a893
3460: 3f3cffff                 move.w     #$ffff, -(a7)
3464: 3f3cffff                 move.w     #$ffff, -(a7)
3468: a892                     dc.w       $a892
346a: 302effd6                 move.w     -$2a(a6), d0
346e: 5140                     subq.w     #$8, d0
3470: 3f00                     move.w     d0, -(a7)
3472: 302effd4                 move.w     -$2c(a6), d0
3476: 5040                     addq.w     #$8, d0
3478: 3f00                     move.w     d0, -(a7)
347a: a893                     dc.w       $a893
347c: 3f3cffff                 move.w     #$ffff, -(a7)
3480: 3f3c0001                 move.w     #$1, -(a7)
3484: a892                     dc.w       $a892
3486: 6018                     bra.b      $34a0
3488: 5340                     subq.w     #$1, d0
348a: 6700fd56                 beq.w      $31e2
348e: 5340                     subq.w     #$1, d0
3490: 6700fdec                 beq.w      $327e
3494: 5340                     subq.w     #$1, d0
3496: 6700feb2                 beq.w      $334a
349a: 5340                     subq.w     #$1, d0
349c: 6700ff78                 beq.w      $3416
34a0: 5246                     addq.w     #$1, d6
34a2: 0c460004                 cmpi.w     #$4, d6
34a6: 6f02                     ble.b      $34aa
34a8: 4246                     clr.w      d6
34aa: 3007                     move.w     d7, d0
34ac: c1fc0006                 muls.w     #$6, d0
34b0: 0640fe22                 addi.w     #$fe22, d0
34b4: 39860000                 move.w     d6, (a4, d0.w)
34b8: 5247                     addq.w     #$1, d7
34ba: 0c470005                 cmpi.w     #$5, d7
34be: 6f00fbd2                 ble.w      $3092
34c2: 1f04                     move.b     d4, -(a7)
34c4: 1f05                     move.b     d5, -(a7)
34c6: 2f0c                     move.l     a4, -(a7)
34c8: 4ebaf7ee                 jsr        $2cb8(pc)
34cc: 4a05                     tst.b      d5
34ce: 6724                     beq.b      $34f4
34d0: 486cfb36                 pea.l      -$4ca(a4)
34d4: 206dbe26                 movea.l    -$41da(a5), a0
34d8: 48680002                 pea.l      $2(a0)
34dc: 486cfb44                 pea.l      -$4bc(a4)
34e0: 206dbe26                 movea.l    -$41da(a5), a0
34e4: 48680010                 pea.l      $10(a0)
34e8: 4267                     clr.w      -(a7)
34ea: 206dbe26                 movea.l    -$41da(a5), a0
34ee: 2f280018                 move.l     $18(a0), -(a7)
34f2: a8ec                     dc.w       $a8ec
34f4: 2f2effc8                 move.l     -$38(a6), -(a7)
34f8: a873                     dc.w       $a873
34fa: 4cdf18f0                 movem.l    (a7)+, d4-d7/a3-a4
34fe: 4e5e                     unlk       a6
3500: 205f                     movea.l    (a7)+, a0
3502: 504f                     addq.w     #$8, a7
3504: 4ed0                     jmp        (a0)
3506: 4e56ffd2                 link.w     a6, #$ffd2
350a: 48e70f18                 movem.l    d4-d7/a3-a4, -(a7)
350e: 286e0008                 movea.l    $8(a6), a4
3512: 2f2dbe26                 move.l     -$41da(a5), -(a7)
3516: a873                     dc.w       $a873
3518: 2f2cfec4                 move.l     -$13c(a4), -(a7)
351c: a920                     dc.w       $a920
351e: 2f2dbe26                 move.l     -$41da(a5), -(a7)
3522: a920                     dc.w       $a920
3524: 266dbe26                 movea.l    -$41da(a5), a3
3528: 486b0010                 pea.l      $10(a3)
352c: a8a3                     dc.w       $a8a3
352e: 4267                     clr.w      -(a7)
3530: a887                     dc.w       $a887
3532: 3f3c000c                 move.w     #$c, -(a7)
3536: a88a                     dc.w       $a88a
3538: 41fa0330                 lea.l      $386a(pc), a0
353c: 43ecfef0                 lea.l      -$110(a4), a1
3540: 22d8                     move.l     (a0)+, (a1)+
3542: 22d8                     move.l     (a0)+, (a1)+
3544: 22d8                     move.l     (a0)+, (a1)+
3546: 554f                     subq.w     #$2, a7
3548: 486cfef0                 pea.l      -$110(a4)
354c: a88c                     dc.w       $a88c
354e: 3e1f                     move.w     (a7)+, d7
3550: 302b0016                 move.w     $16(a3), d0
3554: 906b0012                 sub.w      $12(a3), d0
3558: 9047                     sub.w      d7, d0
355a: 48c0                     ext.l      d0
355c: 81fc0002                 divs.w     #$2, d0
3560: 3f00                     move.w     d0, -(a7)
3562: 3f3c0023                 move.w     #$23, -(a7)
3566: a893                     dc.w       $a893
3568: 486cfef0                 pea.l      -$110(a4)
356c: a884                     dc.w       $a884
356e: 41fa02e8                 lea.l      $3858(pc), a0
3572: 43ecfef0                 lea.l      -$110(a4), a1
3576: 7004                     moveq      #$4, d0
3578: 22d8                     move.l     (a0)+, (a1)+
357a: 51c8fffc                 dbra       d0, $3578
357e: 554f                     subq.w     #$2, a7
3580: 486cfef0                 pea.l      -$110(a4)
3584: a88c                     dc.w       $a88c
3586: 3e1f                     move.w     (a7)+, d7
3588: 302b0016                 move.w     $16(a3), d0
358c: 906b0012                 sub.w      $12(a3), d0
3590: 9047                     sub.w      d7, d0
3592: 48c0                     ext.l      d0
3594: 81fc0002                 divs.w     #$2, d0
3598: 3f00                     move.w     d0, -(a7)
359a: 3f3c0046                 move.w     #$46, -(a7)
359e: a893                     dc.w       $a893
35a0: 486cfef0                 pea.l      -$110(a4)
35a4: a884                     dc.w       $a884
35a6: 3f3c0003                 move.w     #$3, -(a7)
35aa: a887                     dc.w       $a887
35ac: 3f3c0009                 move.w     #$9, -(a7)
35b0: a88a                     dc.w       $a88a
35b2: 41fa0298                 lea.l      $384c(pc), a0
35b6: 43ecfef0                 lea.l      -$110(a4), a1
35ba: 22d8                     move.l     (a0)+, (a1)+
35bc: 22d8                     move.l     (a0)+, (a1)+
35be: 22d8                     move.l     (a0)+, (a1)+
35c0: 3f3c0004                 move.w     #$4, -(a7)
35c4: 3f3c0062                 move.w     #$62, -(a7)
35c8: a893                     dc.w       $a893
35ca: 486cfef0                 pea.l      -$110(a4)
35ce: a884                     dc.w       $a884
35d0: 41fa026e                 lea.l      $3840(pc), a0
35d4: 43ecfef0                 lea.l      -$110(a4), a1
35d8: 22d8                     move.l     (a0)+, (a1)+
35da: 22d8                     move.l     (a0)+, (a1)+
35dc: 22d8                     move.l     (a0)+, (a1)+
35de: 3f3c0004                 move.w     #$4, -(a7)
35e2: 3f3c0078                 move.w     #$78, -(a7)
35e6: a893                     dc.w       $a893
35e8: 486cfef0                 pea.l      -$110(a4)
35ec: a884                     dc.w       $a884
35ee: 41fa0238                 lea.l      $3828(pc), a0
35f2: 43ecfef0                 lea.l      -$110(a4), a1
35f6: 7005                     moveq      #$5, d0
35f8: 22d8                     move.l     (a0)+, (a1)+
35fa: 51c8fffc                 dbra       d0, $35f8
35fe: 3f3c0004                 move.w     #$4, -(a7)
3602: 3f3c008e                 move.w     #$8e, -(a7)
3606: a893                     dc.w       $a893
3608: 486cfef0                 pea.l      -$110(a4)
360c: a884                     dc.w       $a884
360e: 41fa0202                 lea.l      $3812(pc), a0
3612: 43ecfef0                 lea.l      -$110(a4), a1
3616: 7005                     moveq      #$5, d0
3618: 22d8                     move.l     (a0)+, (a1)+
361a: 51c8fffc                 dbra       d0, $3618
361e: 3f3c0004                 move.w     #$4, -(a7)
3622: 3f3c00a4                 move.w     #$a4, -(a7)
3626: a893                     dc.w       $a893
3628: 486cfef0                 pea.l      -$110(a4)
362c: a884                     dc.w       $a884
362e: 41fa01cc                 lea.l      $37fc(pc), a0
3632: 43ecfef0                 lea.l      -$110(a4), a1
3636: 7005                     moveq      #$5, d0
3638: 22d8                     move.l     (a0)+, (a1)+
363a: 51c8fffc                 dbra       d0, $3638
363e: 3f3c0004                 move.w     #$4, -(a7)
3642: 3f3c00ba                 move.w     #$ba, -(a7)
3646: a893                     dc.w       $a893
3648: 486cfef0                 pea.l      -$110(a4)
364c: a884                     dc.w       $a884
364e: 41fa019a                 lea.l      $37ea(pc), a0
3652: 43ecfef0                 lea.l      -$110(a4), a1
3656: 7004                     moveq      #$4, d0
3658: 22d8                     move.l     (a0)+, (a1)+
365a: 51c8fffc                 dbra       d0, $3658
365e: 3f3c0004                 move.w     #$4, -(a7)
3662: 3f3c00d0                 move.w     #$d0, -(a7)
3666: a893                     dc.w       $a893
3668: 486cfef0                 pea.l      -$110(a4)
366c: a884                     dc.w       $a884
366e: 41fa0166                 lea.l      $37d6(pc), a0
3672: 43ecfef0                 lea.l      -$110(a4), a1
3676: 7004                     moveq      #$4, d0
3678: 22d8                     move.l     (a0)+, (a1)+
367a: 51c8fffc                 dbra       d0, $3678
367e: 3f3c0004                 move.w     #$4, -(a7)
3682: 3f3c00e6                 move.w     #$e6, -(a7)
3686: a893                     dc.w       $a893
3688: 486cfef0                 pea.l      -$110(a4)
368c: a884                     dc.w       $a884
368e: 41fa0134                 lea.l      $37c4(pc), a0
3692: 43ecfef0                 lea.l      -$110(a4), a1
3696: 7004                     moveq      #$4, d0
3698: 22d8                     move.l     (a0)+, (a1)+
369a: 51c8fffc                 dbra       d0, $3698
369e: 3f3c0004                 move.w     #$4, -(a7)
36a2: 3f3c00fc                 move.w     #$fc, -(a7)
36a6: a893                     dc.w       $a893
36a8: 486cfef0                 pea.l      -$110(a4)
36ac: a884                     dc.w       $a884
36ae: 4246                     clr.w      d6
36b0: 7e01                     moveq      #$1, d7
36b2: 41edc37b                 lea.l      -$3c85(a5), a0
36b6: 4a307000                 tst.b      (a0, d7.w)
36ba: 670000f4                 beq.w      $37b0
36be: 5246                     addq.w     #$1, d6
36c0: 3006                     move.w     d6, d0
36c2: 48c0                     ext.l      d0
36c4: 81fc0002                 divs.w     #$2, d0
36c8: 4840                     swap       d0
36ca: c1fc000a                 muls.w     #$a, d0
36ce: 7262                     moveq      #$62, d1
36d0: 9240                     sub.w      d0, d1
36d2: 5c41                     addq.w     #$6, d1
36d4: 3d41ffe2                 move.w     d1, -$1e(a6)
36d8: 3007                     move.w     d7, d0
36da: c1fc00a6                 muls.w     #$a6, d0
36de: 0640c030                 addi.w     #$c030, d0
36e2: 29750000feb6             move.l     (a5, d0.w), -$14a(a4)
36e8: 3007                     move.w     d7, d0
36ea: c1fc00a6                 muls.w     #$a6, d0
36ee: 0640bf98                 addi.w     #$bf98, d0
36f2: 48750000                 pea.l      (a5, d0.w)
36f6: 486cfef0                 pea.l      -$110(a4)
36fa: a919                     dc.w       $a919
36fc: 554f                     subq.w     #$2, a7
36fe: 486cfef0                 pea.l      -$110(a4)
3702: a88c                     dc.w       $a88c
3704: 381f                     move.w     (a7)+, d4
3706: 3006                     move.w     d6, d0
3708: c1fc0037                 muls.w     #$37, d0
370c: 0640003d                 addi.w     #$3d, d0
3710: 3204                     move.w     d4, d1
3712: 48c1                     ext.l      d1
3714: 83fc0002                 divs.w     #$2, d1
3718: 9041                     sub.w      d1, d0
371a: 3d40ffe4                 move.w     d0, -$1c(a6)
371e: 0c6e0037ffe4             cmpi.w     #$37, -$1c(a6)
3724: 6c06                     bge.b      $372c
3726: 3d7c0037ffe4             move.w     #$37, -$1c(a6)
372c: 486cfeac                 pea.l      -$154(a4)
3730: 302effe4                 move.w     -$1c(a6), d0
3734: 5740                     subq.w     #$3, d0
3736: 3f00                     move.w     d0, -(a7)
3738: 302effe2                 move.w     -$1e(a6), d0
373c: 5d40                     subq.w     #$6, d0
373e: 3f00                     move.w     d0, -(a7)
3740: 302effe4                 move.w     -$1c(a6), d0
3744: d044                     add.w      d4, d0
3746: 5640                     addq.w     #$3, d0
3748: 3f00                     move.w     d0, -(a7)
374a: 302effe2                 move.w     -$1e(a6), d0
374e: 5440                     addq.w     #$2, d0
3750: 3f00                     move.w     d0, -(a7)
3752: a8a7                     dc.w       $a8a7
3754: 486cfeac                 pea.l      -$154(a4)
3758: a8a3                     dc.w       $a8a3
375a: 3f2effe4                 move.w     -$1c(a6), -(a7)
375e: 3f2effe2                 move.w     -$1e(a6), -(a7)
3762: a893                     dc.w       $a893
3764: 486cfef0                 pea.l      -$110(a4)
3768: a884                     dc.w       $a884
376a: 4245                     clr.w      d5
376c: 206cfeb6                 movea.l    -$14a(a4), a0
3770: 2050                     movea.l    (a0), a0
3772: 3005                     move.w     d5, d0
3774: e540                     asl.w      #$2, d0
3776: 064022bc                 addi.w     #$22bc, d0
377a: 2f300000                 move.l     (a0, d0.w), -(a7)
377e: 486cfef0                 pea.l      -$110(a4)
3782: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
3786: 3006                     move.w     d6, d0
3788: c1fc0037                 muls.w     #$37, d0
378c: 0640003a                 addi.w     #$3a, d0
3790: 3f00                     move.w     d0, -(a7)
3792: 3005                     move.w     d5, d0
3794: 5240                     addq.w     #$1, d0
3796: c1fc0016                 muls.w     #$16, d0
379a: 06400062                 addi.w     #$62, d0
379e: 3f00                     move.w     d0, -(a7)
37a0: a893                     dc.w       $a893
37a2: 486cfef0                 pea.l      -$110(a4)
37a6: a884                     dc.w       $a884
37a8: 5245                     addq.w     #$1, d5
37aa: 0c450006                 cmpi.w     #$6, d5
37ae: 6fbc                     ble.b      $376c
37b0: 5247                     addq.w     #$1, d7
37b2: 0c470005                 cmpi.w     #$5, d7
37b6: 6f00fefa                 ble.w      $36b2
37ba: 4cdf18f0                 movem.l    (a7)+, d4-d7/a3-a4
37be: 4e5e                     unlk       a6
37c0: 2e9f                     move.l     (a7)+, (a7)
37c2: 4e75                     rts        
37c4: 11435055                 move.b     d3, $5055(a0)
37c8: 2045                     movea.l    d5, a0
37ca: 7272                     moveq      #$72, d1
37cc: 6f72                     ble.b      $3840
37ce: 2052                     movea.l    (a2), a0
37d0: 6573                     bcs.b      $3845
37d2: 6574                     bcs.b      $3848
37d4: 733a                     .byte      0x73, 0x3a
37d6: 1254                     .byte      0x12, 0x54
37d8: 696d                     bvs.b      $3847
37da: 6573                     bcs.b      $384f
37dc: 204f                     movea.l    a7, a0
37de: 7574                     .byte      0x75, 0x74
37e0: 206f6620                 movea.l    $6620(a7), a0
37e4: 4675656c3a98             not.w      $3a98(a5, invalid.w)
37ea: 11436f6c                 move.b     d3, $6f6c(a0)
37ee: 6c69                     bge.b      $3859
37f0: 7369                     .byte      0x73, 0x69
37f2: 6f6e                     ble.b      $3862
37f4: 2044                     movea.l    d4, a0
37f6: 616d                     bsr.b      $3865
37f8: 6167                     bsr.b      $3861
37fa: 653a                     bcs.b      $3836
37fc: 1453                     .byte      0x14, 0x53
37fe: 686f                     bvc.b      $386f
3800: 7420                     moveq      #$20, d2
3802: 4461                     neg.w      -(a1)
3804: 6d61                     blt.b      $3867
3806: 6765                     beq.b      $386d
3808: 20746f205365             movea.l    $5365(a4, d6.l * 8), a0
380e: 6c66                     bge.b      $3876
3810: 3a98                     move.w     (a0)+, (a5)
3812: 1441                     .byte      0x14, 0x41
3814: 7667                     moveq      #$67, d3
3816: 2e20                     move.l     -(a0), d7
3818: 4461                     neg.w      -(a1)
381a: 6d2e                     blt.b      $384a
381c: 2053                     movea.l    (a3), a0
381e: 7573                     .byte      0x75, 0x73
3820: 7461                     moveq      #$61, d2
3822: 696e                     bvs.b      $3892
3824: 6564                     bcs.b      $388a
3826: 3a98                     move.w     (a0)+, (a5)
3828: 1653                     .byte      0x16, 0x53
382a: 686f                     bvc.b      $389b
382c: 7420                     moveq      #$20, d2
382e: 6461                     bcc.b      $3891
3830: 6d61                     blt.b      $3893
3832: 6765                     beq.b      $3899
3834: 20746f206f74             movea.l    $6f74(a4, d6.l * 8), a0
383a: 6865                     bvc.b      $38a1
383c: 7273                     moveq      #$73, d1
383e: 3a98                     move.w     (a0)+, (a5)
3840: 0a47616d                 eori.w     #$616d, d7
3844: 6573                     bcs.b      $38b9
3846: 2057                     movea.l    (a7), a0
3848: 6f6e                     ble.b      $38b8
384a: 3a98                     move.w     (a0)+, (a5)
384c: 0b52                     bchg.b     d5, (a2)
384e: 6f62                     ble.b      $38b2
3850: 6f74                     ble.b      $38c6
3852: 204e                     movea.l    a6, a0
3854: 616d                     bsr.b      $38c3
3856: 653a                     bcs.b      $3892
3858: 11426174                 move.b     d2, $6174(a0)
385c: 746c                     moveq      #$6c, d2
385e: 6520                     bcs.b      $3880
3860: 5374617469737469         subq.w     #$1, $69737469(a4, invalid.w)
3868: 6373                     bls.b      $38dd
386a: 0947                     bchg.b     d4, d7
386c: 616d                     bsr.b      $38db
386e: 6520                     bcs.b      $3890
3870: 4f76                     .byte      0x4f, 0x76
3872: 6572                     bcs.b      $38e6
3874: 4e56fec4                 link.w     a6, #$fec4
3878: 48e70718                 movem.l    d5-d7/a3-a4, -(a7)
387c: 286e0008                 movea.l    $8(a6), a4
3880: 486effe2                 pea.l      -$1e(a6)
3884: a874                     dc.w       $a874
3886: 2f2cfec4                 move.l     -$13c(a4), -(a7)
388a: a873                     dc.w       $a873
388c: 4245                     clr.w      d5
388e: 4a6dfefe                 tst.w      -$102(a5)
3892: 6f02                     ble.b      $3896
3894: 5245                     addq.w     #$1, d5
3896: 302cfc08                 move.w     -$3f8(a4), d0
389a: 48c0                     ext.l      d0
389c: 2f00                     move.l     d0, -(a7)
389e: 486cfd0e                 pea.l      -$2f2(a4)
38a2: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
38a6: 302c000a                 move.w     $a(a4), d0
38aa: 48c0                     ext.l      d0
38ac: 2f00                     move.l     d0, -(a7)
38ae: 486cfc0e                 pea.l      -$3f2(a4)
38b2: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
38b6: 3f3c000f                 move.w     #$f, -(a7)
38ba: 3f3c0008                 move.w     #$8, -(a7)
38be: a893                     dc.w       $a893
38c0: 486efec4                 pea.l      -$13c(a6)
38c4: 487a038c                 pea.l      $3c52(pc)
38c8: 486cfd0e                 pea.l      -$2f2(a4)
38cc: 487a037a                 pea.l      $3c48(pc)
38d0: 486cfc0e                 pea.l      -$3f2(a4)
38d4: 3f3c0004                 move.w     #$4, -(a7)
38d8: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
38dc: 584f                     addq.w     #$4, a7
38de: 486efec4                 pea.l      -$13c(a6)
38e2: a884                     dc.w       $a884
38e4: 7e01                     moveq      #$1, d7
38e6: 423670db                 clr.b      -$25(a6, d7.w)
38ea: 5247                     addq.w     #$1, d7
38ec: 0c470005                 cmpi.w     #$5, d7
38f0: 6ff4                     ble.b      $38e6
38f2: 7e01                     moveq      #$1, d7
38f4: 4a6cfeb4                 tst.w      -$14c(a4)
38f8: 666c                     bne.b      $3966
38fa: 3007                     move.w     d7, d0
38fc: e740                     asl.w      #$3, d0
38fe: 0640fe48                 addi.w     #$fe48, d0
3902: 48740000                 pea.l      (a4, d0.w)
3906: 3f3c0008                 move.w     #$8, -(a7)
390a: 3007                     move.w     d7, d0
390c: 5340                     subq.w     #$1, d0
390e: c1fc003d                 muls.w     #$3d, d0
3912: 0640003e                 addi.w     #$3e, d0
3916: 3f00                     move.w     d0, -(a7)
3918: 3f3c0064                 move.w     #$64, -(a7)
391c: 3007                     move.w     d7, d0
391e: 5340                     subq.w     #$1, d0
3920: c1fc003d                 muls.w     #$3d, d0
3924: 06400044                 addi.w     #$44, d0
3928: 3f00                     move.w     d0, -(a7)
392a: a8a7                     dc.w       $a8a7
392c: 3007                     move.w     d7, d0
392e: e740                     asl.w      #$3, d0
3930: 0640fe70                 addi.w     #$fe70, d0
3934: 48740000                 pea.l      (a4, d0.w)
3938: 3f3c0008                 move.w     #$8, -(a7)
393c: 3007                     move.w     d7, d0
393e: 5340                     subq.w     #$1, d0
3940: c1fc003d                 muls.w     #$3d, d0
3944: 0640002c                 addi.w     #$2c, d0
3948: 3f00                     move.w     d0, -(a7)
394a: 3f3c0064                 move.w     #$64, -(a7)
394e: 3007                     move.w     d7, d0
3950: 5340                     subq.w     #$1, d0
3952: c1fc003d                 muls.w     #$3d, d0
3956: 06400032                 addi.w     #$32, d0
395a: 3f00                     move.w     d0, -(a7)
395c: a8a7                     dc.w       $a8a7
395e: 41edc375                 lea.l      -$3c8b(a5), a0
3962: 42307000                 clr.b      (a0, d7.w)
3966: 41edc37b                 lea.l      -$3c85(a5), a0
396a: 4a307000                 tst.b      (a0, d7.w)
396e: 6700022e                 beq.w      $3b9e
3972: 4a6cfeb4                 tst.w      -$14c(a4)
3976: 666a                     bne.b      $39e2
3978: 41edc375                 lea.l      -$3c8b(a5), a0
397c: 11bc00017000             move.b     #$1, (a0, d7.w)
3982: 302dc382                 move.w     -$3c7e(a5), d0
3986: 5240                     addq.w     #$1, d0
3988: 3b40c382                 move.w     d0, -$3c7e(a5)
398c: 3007                     move.w     d7, d0
398e: c1fc00a6                 muls.w     #$a6, d0
3992: 0640c030                 addi.w     #$c030, d0
3996: 26750000                 movea.l    (a5, d0.w), a3
399a: 2f0b                     move.l     a3, -(a7)
399c: 205f                     movea.l    (a7)+, a0
399e: a029                     dc.w       $a029
39a0: 554f                     subq.w     #$2, a7
39a2: a861                     dc.w       $a861
39a4: 3c1f                     move.w     (a7)+, d6
39a6: 6a02                     bpl.b      $39aa
39a8: 4446                     neg.w      d6
39aa: 48c6                     ext.l      d6
39ac: 8dfc0005                 divs.w     #$5, d6
39b0: 4846                     swap       d6
39b2: 5246                     addq.w     #$1, d6
39b4: 4a3660db                 tst.b      -$25(a6, d6.w)
39b8: 66e6                     bne.b      $39a0
39ba: 1dbc000160db             move.b     #$1, -$25(a6, d6.w)
39c0: 3f2cfc08                 move.w     -$3f8(a4), -(a7)
39c4: 2053                     movea.l    (a3), a0
39c6: 4868011c                 pea.l      $11c(a0)
39ca: 3f06                     move.w     d6, -(a7)
39cc: 4ebad43a                 jsr        $e08(pc)
39d0: 2f0b                     move.l     a3, -(a7)
39d2: 205f                     movea.l    (a7)+, a0
39d4: a02a                     dc.w       $a02a
39d6: 3007                     move.w     d7, d0
39d8: d040                     add.w      d0, d0
39da: 0640fe44                 addi.w     #$fe44, d0
39de: 42740000                 clr.w      (a4, d0.w)
39e2: be6c0008                 cmp.w      $8(a4), d7
39e6: 6638                     bne.b      $3a20
39e8: 302dfefe                 move.w     -$102(a5), d0
39ec: c1fc00a6                 muls.w     #$a6, d0
39f0: 0640c030                 addi.w     #$c030, d0
39f4: 26750000                 movea.l    (a5, d0.w), a3
39f8: 4a6cfeb4                 tst.w      -$14c(a4)
39fc: 660a                     bne.b      $3a08
39fe: 2f0b                     move.l     a3, -(a7)
3a00: 2f0c                     move.l     a4, -(a7)
3a02: 4ebae5e8                 jsr        $1fec(pc)
3a06: 6018                     bra.b      $3a20
3a08: 2f0b                     move.l     a3, -(a7)
3a0a: 2f0c                     move.l     a4, -(a7)
3a0c: 4ebae5de                 jsr        $1fec(pc)
3a10: 2f0b                     move.l     a3, -(a7)
3a12: 2f0c                     move.l     a4, -(a7)
3a14: 4ebae6fe                 jsr        $2114(pc)
3a18: 2f0b                     move.l     a3, -(a7)
3a1a: 2f0c                     move.l     a4, -(a7)
3a1c: 4ebae7e6                 jsr        $2204(pc)
3a20: 4a6dfefe                 tst.w      -$102(a5)
3a24: 5ec0                     sgt.b      d0
3a26: be6dfefe                 cmp.w      -$102(a5), d7
3a2a: 56c1                     sne.b      d1
3a2c: c001                     and.b      d1, d0
3a2e: 6716                     beq.b      $3a46
3a30: 5245                     addq.w     #$1, d5
3a32: 3005                     move.w     d5, d0
3a34: 4440                     neg.w      d0
3a36: 3207                     move.w     d7, d1
3a38: d241                     add.w      d1, d1
3a3a: 0641fe9e                 addi.w     #$fe9e, d1
3a3e: 39801000                 move.w     d0, (a4, d1.w)
3a42: 6000015a                 bra.w      $3b9e
3a46: 4a6dfefe                 tst.w      -$102(a5)
3a4a: 6f10                     ble.b      $3a5c
3a4c: 3007                     move.w     d7, d0
3a4e: d040                     add.w      d0, d0
3a50: 0640fe9e                 addi.w     #$fe9e, d0
3a54: 39bc00010000             move.w     #$1, (a4, d0.w)
3a5a: 600e                     bra.b      $3a6a
3a5c: 5245                     addq.w     #$1, d5
3a5e: 3007                     move.w     d7, d0
3a60: d040                     add.w      d0, d0
3a62: 0640fe9e                 addi.w     #$fe9e, d0
3a66: 39850000                 move.w     d5, (a4, d0.w)
3a6a: 3007                     move.w     d7, d0
3a6c: d040                     add.w      d0, d0
3a6e: 0640fe9e                 addi.w     #$fe9e, d0
3a72: 39740000feaa             move.w     (a4, d0.w), -$156(a4)
3a78: 3c2cfeaa                 move.w     -$156(a4), d6
3a7c: 5346                     subq.w     #$1, d6
3a7e: cdfc003d                 muls.w     #$3d, d6
3a82: 3f3c0010                 move.w     #$10, -(a7)
3a86: 3006                     move.w     d6, d0
3a88: 06400013                 addi.w     #$13, d0
3a8c: 3f00                     move.w     d0, -(a7)
3a8e: a893                     dc.w       $a893
3a90: 1d7c0001ffc2             move.b     #$1, -$3e(a6)
3a96: 7000                     moveq      #$0, d0
3a98: 102effc2                 move.b     -$3e(a6), d0
3a9c: 3f00                     move.w     d0, -(a7)
3a9e: a888                     dc.w       $a888
3aa0: 3007                     move.w     d7, d0
3aa2: c1fc00a6                 muls.w     #$a6, d0
3aa6: 0640bf98                 addi.w     #$bf98, d0
3aaa: 48750000                 pea.l      (a5, d0.w)
3aae: 486cfd0e                 pea.l      -$2f2(a4)
3ab2: a919                     dc.w       $a919
3ab4: 486cfd0e                 pea.l      -$2f2(a4)
3ab8: a884                     dc.w       $a884
3aba: 422effc2                 clr.b      -$3e(a6)
3abe: 7000                     moveq      #$0, d0
3ac0: 102effc2                 move.b     -$3e(a6), d0
3ac4: 3f00                     move.w     d0, -(a7)
3ac6: a888                     dc.w       $a888
3ac8: 486cfeac                 pea.l      -$154(a4)
3acc: 3f3c0002                 move.w     #$2, -(a7)
3ad0: 3006                     move.w     d6, d0
3ad2: 0640000b                 addi.w     #$b, d0
3ad6: 3f00                     move.w     d0, -(a7)
3ad8: 3f3c000d                 move.w     #$d, -(a7)
3adc: 3006                     move.w     d6, d0
3ade: 06400016                 addi.w     #$16, d0
3ae2: 3f00                     move.w     d0, -(a7)
3ae4: a8a7                     dc.w       $a8a7
3ae6: 302cfeaa                 move.w     -$156(a4), d0
3aea: c1fc0024                 muls.w     #$24, d0
3aee: 0640c368                 addi.w     #$c368, d0
3af2: 48750000                 pea.l      (a5, d0.w)
3af6: 206cfed8                 movea.l    -$128(a4), a0
3afa: 48680002                 pea.l      $2(a0)
3afe: 302cfeaa                 move.w     -$156(a4), d0
3b02: c1fc0024                 muls.w     #$24, d0
3b06: 0640c36e                 addi.w     #$c36e, d0
3b0a: 48750000                 pea.l      (a5, d0.w)
3b0e: 486cfeac                 pea.l      -$154(a4)
3b12: 4267                     clr.w      -(a7)
3b14: 42a7                     clr.l      -(a7)
3b16: a8ec                     dc.w       $a8ec
3b18: 302cfeaa                 move.w     -$156(a4), d0
3b1c: e740                     asl.w      #$3, d0
3b1e: 0640fe70                 addi.w     #$fe70, d0
3b22: 48740000                 pea.l      (a4, d0.w)
3b26: a8a1                     dc.w       $a8a1
3b28: 3f3c0009                 move.w     #$9, -(a7)
3b2c: 3006                     move.w     d6, d0
3b2e: 06400029                 addi.w     #$29, d0
3b32: 3f00                     move.w     d0, -(a7)
3b34: a893                     dc.w       $a893
3b36: 487a00fa                 pea.l      $3c32(pc)
3b3a: a884                     dc.w       $a884
3b3c: 302cfeaa                 move.w     -$156(a4), d0
3b40: e740                     asl.w      #$3, d0
3b42: 0640fe48                 addi.w     #$fe48, d0
3b46: 41f40000                 lea.l      (a4, d0.w), a0
3b4a: 43ecfeac                 lea.l      -$154(a4), a1
3b4e: 22d8                     move.l     (a0)+, (a1)+
3b50: 22d8                     move.l     (a0)+, (a1)+
3b52: 486cfeac                 pea.l      -$154(a4)
3b56: a8a1                     dc.w       $a8a1
3b58: 3f3c0009                 move.w     #$9, -(a7)
3b5c: 3006                     move.w     d6, d0
3b5e: 0640003c                 addi.w     #$3c, d0
3b62: 3f00                     move.w     d0, -(a7)
3b64: a893                     dc.w       $a893
3b66: 487a00b2                 pea.l      $3c1a(pc)
3b6a: a884                     dc.w       $a884
3b6c: 486cfeac                 pea.l      -$154(a4)
3b70: 3f3c0001                 move.w     #$1, -(a7)
3b74: 3f3c0001                 move.w     #$1, -(a7)
3b78: a8a9                     dc.w       $a8a9
3b7a: 486cfeac                 pea.l      -$154(a4)
3b7e: 486dffb2                 pea.l      -$4e(a5)
3b82: a8a5                     dc.w       $a8a5
3b84: 4267                     clr.w      -(a7)
3b86: 3006                     move.w     d6, d0
3b88: 06400009                 addi.w     #$9, d0
3b8c: 3f00                     move.w     d0, -(a7)
3b8e: a893                     dc.w       $a893
3b90: 3f3c0078                 move.w     #$78, -(a7)
3b94: 3006                     move.w     d6, d0
3b96: 06400009                 addi.w     #$9, d0
3b9a: 3f00                     move.w     d0, -(a7)
3b9c: a891                     dc.w       $a891
3b9e: 5247                     addq.w     #$1, d7
3ba0: 0c470005                 cmpi.w     #$5, d7
3ba4: 6f00fd4e                 ble.w      $38f4
3ba8: 0646003d                 addi.w     #$3d, d6
3bac: 4267                     clr.w      -(a7)
3bae: 3006                     move.w     d6, d0
3bb0: 06400009                 addi.w     #$9, d0
3bb4: 3f00                     move.w     d0, -(a7)
3bb6: a893                     dc.w       $a893
3bb8: 3f3c0078                 move.w     #$78, -(a7)
3bbc: 3006                     move.w     d6, d0
3bbe: 06400009                 addi.w     #$9, d0
3bc2: 3f00                     move.w     d0, -(a7)
3bc4: a891                     dc.w       $a891
3bc6: 197c0001fc0b             move.b     #$1, -$3f5(a4)
3bcc: 2f0c                     move.l     a4, -(a7)
3bce: 4ebaed70                 jsr        $2940(pc)
3bd2: 7e01                     moveq      #$1, d7
3bd4: 41edc37b                 lea.l      -$3c85(a5), a0
3bd8: 4a307000                 tst.b      (a0, d7.w)
3bdc: 6724                     beq.b      $3c02
3bde: 41edc375                 lea.l      -$3c8b(a5), a0
3be2: 10307000                 move.b     (a0, d7.w), d0
3be6: 5300                     subq.b     #$1, d0
3be8: 4a6dfefe                 tst.w      -$102(a5)
3bec: 5fc1                     sle.b      d1
3bee: be6dfefe                 cmp.w      -$102(a5), d7
3bf2: 57c2                     seq.b      d2
3bf4: 8202                     or.b       d2, d1
3bf6: c001                     and.b      d1, d0
3bf8: 6708                     beq.b      $3c02
3bfa: 3f07                     move.w     d7, -(a7)
3bfc: 2f0c                     move.l     a4, -(a7)
3bfe: 4ebaeea4                 jsr        $2aa4(pc)
3c02: 5247                     addq.w     #$1, d7
3c04: 0c470005                 cmpi.w     #$5, d7
3c08: 6fca                     ble.b      $3bd4
3c0a: 2f2effe2                 move.l     -$1e(a6), -(a7)
3c0e: a873                     dc.w       $a873
3c10: 4cdf18e0                 movem.l    (a7)+, d5-d7/a3-a4
3c14: 4e5e                     unlk       a6
3c16: 2e9f                     move.l     (a7)+, (a7)
3c18: 4e75                     rts        
3c1a: 173025202020             move.b     $2020(a0, d2.w * 4), -(a3)
3c20: 2020                     move.l     -(a0), d0
3c22: 2020                     move.l     -(a0), d0
3c24: 4675656c2020             not.w      $2020(a5, invalid.w)
3c2a: 2020                     move.l     -(a0), d0
3c2c: 2020                     move.l     -(a0), d0
3c2e: 31303025                 move.w     $25(a0, d3.w), -(a0)
3c32: 143025202020             move.b     $2020(a0, d2.w * 4), d2
3c38: 2044                     movea.l    d4, a0
3c3a: 616d                     bsr.b      $3ca9
3c3c: 6167                     bsr.b      $3ca5
3c3e: 6520                     bcs.b      $3c60
3c40: 2020                     move.l     -(a0), d0
3c42: 20313030                 move.l     $30(a1, d3.w), d0
3c46: 2516                     move.l     (a6), -(a2)
3c48: 0820                     .byte      0x08, 0x20
3c4a: 6f75                     ble.b      $3cc1
3c4c: 7420                     moveq      #$20, d2
3c4e: 6f66                     ble.b      $3cb6
3c50: 2012                     move.l     (a2), d0
3c52: 0547                     bchg.b     d2, d7
3c54: 616d                     bsr.b      $3cc3
3c56: 6520                     bcs.b      $3c78
3c58: 4e56ffca                 link.w     a6, #$ffca
3c5c: 48e70118                 movem.l    d7/a3-a4, -(a7)
3c60: 286e0008                 movea.l    $8(a6), a4
3c64: 486cfed0                 pea.l      -$130(a4)
3c68: a874                     dc.w       $a874
3c6a: 2f2dbe26                 move.l     -$41da(a5), -(a7)
3c6e: a873                     dc.w       $a873
3c70: 486effda                 pea.l      -$26(a6)
3c74: 3f3c009b                 move.w     #$9b, -(a7)
3c78: 3f3c0118                 move.w     #$118, -(a7)
3c7c: 3f3c0109                 move.w     #$109, -(a7)
3c80: 3f3c012c                 move.w     #$12c, -(a7)
3c84: a8a7                     dc.w       $a8a7
3c86: 594f                     subq.w     #$4, a7
3c88: 2f2dbe26                 move.l     -$41da(a5), -(a7)
3c8c: 486effda                 pea.l      -$26(a6)
3c90: 487a0166                 pea.l      $3df8(pc)
3c94: 1f3c0001                 move.b     #$1, -(a7)
3c98: 4267                     clr.w      -(a7)
3c9a: 4267                     clr.w      -(a7)
3c9c: 3f3c0001                 move.w     #$1, -(a7)
3ca0: 4267                     clr.w      -(a7)
3ca2: 7063                     moveq      #$63, d0
3ca4: 2f00                     move.l     d0, -(a7)
3ca6: a954                     dc.w       $a954
3ca8: 265f                     movea.l    (a7)+, a3
3caa: 2f0b                     move.l     a3, -(a7)
3cac: a957                     dc.w       $a957
3cae: 486effda                 pea.l      -$26(a6)
3cb2: 3f3cfffc                 move.w     #$fffc, -(a7)
3cb6: 3f3cfffc                 move.w     #$fffc, -(a7)
3cba: a8a9                     dc.w       $a8a9
3cbc: 3f3c0003                 move.w     #$3, -(a7)
3cc0: 3f3c0003                 move.w     #$3, -(a7)
3cc4: a89b                     dc.w       $a89b
3cc6: 486effda                 pea.l      -$26(a6)
3cca: 3f3c0010                 move.w     #$10, -(a7)
3cce: 3f3c0010                 move.w     #$10, -(a7)
3cd2: a8b0                     dc.w       $a8b0
3cd4: 2f2cfed0                 move.l     -$130(a4), -(a7)
3cd8: a873                     dc.w       $a873
3cda: 422cfc03                 clr.b      -$3fd(a4)
3cde: a9b4                     dc.w       $a9b4
3ce0: 554f                     subq.w     #$2, a7
3ce2: 3f3c014a                 move.w     #$14a, -(a7)
3ce6: 486dbdca                 pea.l      -$4236(a5)
3cea: a970                     dc.w       $a970
3cec: 4a1f                     tst.b      (a7)+
3cee: 670000f0                 beq.w      $3de0
3cf2: 302dbdca                 move.w     -$4236(a5), d0
3cf6: 600000d4                 bra.w      $3dcc
3cfa: 2e2dbdcc                 move.l     -$4234(a5), d7
3cfe: 0287000000ff             andi.l     #$ff, d7
3d04: be6dbdba                 cmp.w      -$4246(a5), d7
3d08: 57c0                     seq.b      d0
3d0a: be6dbdc0                 cmp.w      -$4240(a5), d7
3d0e: 57c1                     seq.b      d1
3d10: 8001                     or.b       d1, d0
3d12: 670000cc                 beq.w      $3de0
3d16: 2f0b                     move.l     a3, -(a7)
3d18: 3f3c0001                 move.w     #$1, -(a7)
3d1c: a95d                     dc.w       $a95d
3d1e: 197c0001fc03             move.b     #$1, -$3fd(a4)
3d24: 600000ba                 bra.w      $3de0
3d28: 2d6dbdd4ffe6             move.l     -$422c(a5), -$1a(a6)
3d2e: 486effe6                 pea.l      -$1a(a6)
3d32: a871                     dc.w       $a871
3d34: 554f                     subq.w     #$2, a7
3d36: 2f2effe6                 move.l     -$1a(a6), -(a7)
3d3a: 486effda                 pea.l      -$26(a6)
3d3e: a8ad                     dc.w       $a8ad
3d40: 4a1f                     tst.b      (a7)+
3d42: 6700009c                 beq.w      $3de0
3d46: 554f                     subq.w     #$2, a7
3d48: 2f0b                     move.l     a3, -(a7)
3d4a: 2f2effe6                 move.l     -$1a(a6), -(a7)
3d4e: 42a7                     clr.l      -(a7)
3d50: a968                     dc.w       $a968
3d52: 4a5f                     tst.w      (a7)+
3d54: 6f00008a                 ble.w      $3de0
3d58: 197c0001fc03             move.b     #$1, -$3fd(a4)
3d5e: 60000080                 bra.w      $3de0
3d62: 296dbdccfec0             move.l     -$4234(a5), -$140(a4)
3d68: 486cfed0                 pea.l      -$130(a4)
3d6c: a874                     dc.w       $a874
3d6e: 2f2cfec0                 move.l     -$140(a4), -(a7)
3d72: a873                     dc.w       $a873
3d74: 2f2cfec0                 move.l     -$140(a4), -(a7)
3d78: a922                     dc.w       $a922
3d7a: 202cfec0                 move.l     -$140(a4), d0
3d7e: b0acfec4                 cmp.l      -$13c(a4), d0
3d82: 6608                     bne.b      $3d8c
3d84: 2f0c                     move.l     a4, -(a7)
3d86: 4ebafaec                 jsr        $3874(pc)
3d8a: 6024                     bra.b      $3db0
3d8c: 202cfec0                 move.l     -$140(a4), d0
3d90: b0adbe26                 cmp.l      -$41da(a5), d0
3d94: 661a                     bne.b      $3db0
3d96: 2f0c                     move.l     a4, -(a7)
3d98: 4ebaf76c                 jsr        $3506(pc)
3d9c: 2f2dbe26                 move.l     -$41da(a5), -(a7)
3da0: a969                     dc.w       $a969
3da2: 486effda                 pea.l      -$26(a6)
3da6: 3f3c0010                 move.w     #$10, -(a7)
3daa: 3f3c0010                 move.w     #$10, -(a7)
3dae: a8b0                     dc.w       $a8b0
3db0: 2f2cfec0                 move.l     -$140(a4), -(a7)
3db4: a923                     dc.w       $a923
3db6: 2f2cfed0                 move.l     -$130(a4), -(a7)
3dba: a873                     dc.w       $a873
3dbc: 6022                     bra.b      $3de0
3dbe: 296dbdccfec0             move.l     -$4234(a5), -$140(a4)
3dc4: 2f2cfec0                 move.l     -$140(a4), -(a7)
3dc8: a873                     dc.w       $a873
3dca: 6014                     bra.b      $3de0
3dcc: 5340                     subq.w     #$1, d0
3dce: 6700ff58                 beq.w      $3d28
3dd2: 5540                     subq.w     #$2, d0
3dd4: 6700ff24                 beq.w      $3cfa
3dd8: 5740                     subq.w     #$3, d0
3dda: 6786                     beq.b      $3d62
3ddc: 5540                     subq.w     #$2, d0
3dde: 67de                     beq.b      $3dbe
3de0: 4a2cfc03                 tst.b      -$3fd(a4)
3de4: 6700fef8                 beq.w      $3cde
3de8: 2f2dbe26                 move.l     -$41da(a5), -(a7)
3dec: a956                     dc.w       $a956
3dee: 4cdf1880                 movem.l    (a7)+, d7/a3-a4
3df2: 4e5e                     unlk       a6
3df4: 2e9f                     move.l     (a7)+, (a7)
3df6: 4e75                     rts        
3df8: 1045                     .byte      0x10, 0x45
3dfa: 7869                     moveq      #$69, d4
3dfc: 7420                     moveq      #$20, d2
3dfe: 4261                     clr.w      -(a1)
3e00: 7474                     moveq      #$74, d2
3e02: 6c65                     bge.b      $3e69
3e04: 6669                     bne.b      $3e6f
3e06: 656c                     bcs.b      $3e74
3e08: 6412                     bcc.b      $3e1c
3e0a: 4e560000                 link.w     a6, #$0
3e0e: 2f0c                     move.l     a4, -(a7)
3e10: 286e0008                 movea.l    $8(a6), a4
3e14: 594f                     subq.w     #$4, a7
3e16: a975                     dc.w       $a975
3e18: 201f                     move.l     (a7)+, d0
3e1a: b0acfbf8                 cmp.l      -$408(a4), d0
3e1e: 5ec0                     sgt.b      d0
3e20: c02cfbf5                 and.b      -$40b(a4), d0
3e24: 6708                     beq.b      $3e2e
3e26: 4ead01ba                 jsr        $1ba(a5) ; CODE 1 resource+0x07d4
3e2a: 422cfbf5                 clr.b      -$40b(a4)
3e2e: 285f                     movea.l    (a7)+, a4
3e30: 4e5e                     unlk       a6
3e32: 2e9f                     move.l     (a7)+, (a7)
3e34: 4e75                     rts        
3e36: 4e56f804                 link.w     a6, #$f804
3e3a: 48e71f38                 movem.l    d3-d7/a2-a4, -(a7)
3e3e: 486efedc                 pea.l      -$124(a6)
3e42: a874                     dc.w       $a874
3e44: 206dbdc6                 movea.l    -$423a(a5), a0
3e48: 2f10                     move.l     (a0), -(a7)
3e4a: a851                     dc.w       $a851
3e4c: 6004                     bra.b      $3e52
3e4e: 4ead0042                 jsr        $42(a5) ; CODE 4 resource+0x00e4
3e52: 554f                     subq.w     #$2, a7
3e54: 3f3c0040                 move.w     #$40, -(a7)
3e58: 486dbdca                 pea.l      -$4236(a5)
3e5c: a970                     dc.w       $a970
3e5e: 4a1f                     tst.b      (a7)+
3e60: 66ec                     bne.b      $3e4e
3e62: 3d7c0001fece             move.w     #$1, -$132(a6)
3e68: 7e01                     moveq      #$1, d7
3e6a: 486efeac                 pea.l      -$154(a6)
3e6e: 3f3c001e                 move.w     #$1e, -(a7)
3e72: 3f3c0023                 move.w     #$23, -(a7)
3e76: 3f3c00c8                 move.w     #$c8, -(a7)
3e7a: 3f3c004b                 move.w     #$4b, -(a7)
3e7e: a8a7                     dc.w       $a8a7
3e80: 600000b8                 bra.w      $3f3a
3e84: 302efece                 move.w     -$132(a6), d0
3e88: c1fc00a6                 muls.w     #$a6, d0
3e8c: 0640bf96                 addi.w     #$bf96, d0
3e90: 4a350000                 tst.b      (a5, d0.w)
3e94: 6700009a                 beq.w      $3f30
3e98: 302efece                 move.w     -$132(a6), d0
3e9c: c1fc00a6                 muls.w     #$a6, d0
3ea0: 0640bf98                 addi.w     #$bf98, d0
3ea4: 41f50000                 lea.l      (a5, d0.w), a0
3ea8: 2648                     movea.l    a0, a3
3eaa: 594f                     subq.w     #$4, a7
3eac: 2f0b                     move.l     a3, -(a7)
3eae: a917                     dc.w       $a917
3eb0: 2b5fc030                 move.l     (a7)+, -$3fd0(a5)
3eb4: 302e0008                 move.w     $8(a6), d0
3eb8: b06efece                 cmp.w      -$132(a6), d0
3ebc: 56c0                     sne.b      d0
3ebe: 206dc030                 movea.l    -$3fd0(a5), a0
3ec2: 2050                     movea.l    (a0), a0
3ec4: 1228011a                 move.b     $11a(a0), d1
3ec8: 5301                     subq.b     #$1, d1
3eca: 206dc030                 movea.l    -$3fd0(a5), a0
3ece: 2050                     movea.l    (a0), a0
3ed0: 4401                     neg.b      d1
3ed2: 8228012a                 or.b       $12a(a0), d1
3ed6: c001                     and.b      d1, d0
3ed8: 206dc030                 movea.l    -$3fd0(a5), a0
3edc: 2050                     movea.l    (a0), a0
3ede: 322822b4                 move.w     $22b4(a0), d1
3ee2: 0641c37b                 addi.w     #$c37b, d1
3ee6: c0351000                 and.b      (a5, d1.w), d0
3eea: 6742                     beq.b      $3f2e
3eec: 487a11b4                 pea.l      $50a2(pc)
3ef0: 4ead0062                 jsr        $62(a5) ; CODE 4 resource+0x0b4a
3ef4: 486efeac                 pea.l      -$154(a6)
3ef8: a8a3                     dc.w       $a8a3
3efa: 3f3c001e                 move.w     #$1e, -(a7)
3efe: 3f3c0032                 move.w     #$32, -(a7)
3f02: a893                     dc.w       $a893
3f04: 302efece                 move.w     -$132(a6), d0
3f08: c1fc00a6                 muls.w     #$a6, d0
3f0c: 0640bf98                 addi.w     #$bf98, d0
3f10: 48750000                 pea.l      (a5, d0.w)
3f14: 486efd0e                 pea.l      -$2f2(a6)
3f18: a919                     dc.w       $a919
3f1a: 486efd0e                 pea.l      -$2f2(a6)
3f1e: a884                     dc.w       $a884
3f20: 554f                     subq.w     #$2, a7
3f22: 4227                     clr.b      -(a7)
3f24: 4227                     clr.b      -(a7)
3f26: 4ead0282                 jsr        $282(a5) ; CODE 5 resource+0x3d44
3f2a: 1e1f                     move.b     (a7)+, d7
3f2c: 6002                     bra.b      $3f30
3f2e: 7e01                     moveq      #$1, d7
3f30: 302efece                 move.w     -$132(a6), d0
3f34: 5240                     addq.w     #$1, d0
3f36: 3d40fece                 move.w     d0, -$132(a6)
3f3a: 0c6e0005fece             cmpi.w     #$5, -$132(a6)
3f40: 5fc0                     sle.b      d0
3f42: c007                     and.b      d7, d0
3f44: 6600ff3e                 bne.w      $3e84
3f48: 4a6e0008                 tst.w      $8(a6)
3f4c: 5ec0                     sgt.b      d0
3f4e: c007                     and.b      d7, d0
3f50: 677a                     beq.b      $3fcc
3f52: 302e0008                 move.w     $8(a6), d0
3f56: c1fc00a6                 muls.w     #$a6, d0
3f5a: 0640bf98                 addi.w     #$bf98, d0
3f5e: 41f50000                 lea.l      (a5, d0.w), a0
3f62: 2648                     movea.l    a0, a3
3f64: 594f                     subq.w     #$4, a7
3f66: 2f0b                     move.l     a3, -(a7)
3f68: a917                     dc.w       $a917
3f6a: 2b5fc030                 move.l     (a7)+, -$3fd0(a5)
3f6e: 206dc030                 movea.l    -$3fd0(a5), a0
3f72: 2050                     movea.l    (a0), a0
3f74: 1028011a                 move.b     $11a(a0), d0
3f78: 5300                     subq.b     #$1, d0
3f7a: 206dc030                 movea.l    -$3fd0(a5), a0
3f7e: 2050                     movea.l    (a0), a0
3f80: 1228012a                 move.b     $12a(a0), d1
3f84: 5301                     subq.b     #$1, d1
3f86: 8001                     or.b       d1, d0
3f88: 6742                     beq.b      $3fcc
3f8a: 487a1108                 pea.l      $5094(pc)
3f8e: 4ead0062                 jsr        $62(a5) ; CODE 4 resource+0x0b4a
3f92: 486efeac                 pea.l      -$154(a6)
3f96: a8a3                     dc.w       $a8a3
3f98: 3f3c001e                 move.w     #$1e, -(a7)
3f9c: 3f3c0032                 move.w     #$32, -(a7)
3fa0: a893                     dc.w       $a893
3fa2: 302e0008                 move.w     $8(a6), d0
3fa6: c1fc00a6                 muls.w     #$a6, d0
3faa: 0640bf98                 addi.w     #$bf98, d0
3fae: 48750000                 pea.l      (a5, d0.w)
3fb2: 486efd0e                 pea.l      -$2f2(a6)
3fb6: a919                     dc.w       $a919
3fb8: 486efd0e                 pea.l      -$2f2(a6)
3fbc: a884                     dc.w       $a884
3fbe: 554f                     subq.w     #$2, a7
3fc0: 4227                     clr.b      -(a7)
3fc2: 1f3c0001                 move.b     #$1, -(a7)
3fc6: 4ead0282                 jsr        $282(a5) ; CODE 5 resource+0x3d44
3fca: 1e1f                     move.b     (a7)+, d7
3fcc: 4ead006a                 jsr        $6a(a5) ; CODE 4 resource+0x0bc8
3fd0: a850                     dc.w       $a850
3fd2: 7064                     moveq      #$64, d0
3fd4: 2b40ff4c                 move.l     d0, -$b4(a5)
3fd8: 4a07                     tst.b      d7
3fda: 670000be                 beq.w      $409a
3fde: 4207                     clr.b      d7
3fe0: 594f                     subq.w     #$4, a7
3fe2: 2f3c736e6420             move.l     #$736e6420, -(a7)
3fe8: 487a10a0                 pea.l      $508a(pc)
3fec: a9a1                     dc.w       $a9a1
3fee: 2d5ffbde                 move.l     (a7)+, -$422(a6)
3ff2: 2f2efbde                 move.l     -$422(a6), -(a7)
3ff6: 205f                     movea.l    (a7)+, a0
3ff8: a029                     dc.w       $a029
3ffa: 4aaefbde                 tst.l      -$422(a6)
3ffe: 6700009a                 beq.w      $409a
4002: 206efbde                 movea.l    -$422(a6), a0
4006: 2450                     movea.l    (a0), a2
4008: 0c520001                 cmpi.w     #$1, (a2)
400c: 57c0                     seq.b      d0
400e: 0c6a00010002             cmpi.w     #$1, $2(a2)
4014: 57c1                     seq.b      d1
4016: c001                     and.b      d1, d0
4018: 0c6a0001000a             cmpi.w     #$1, $a(a2)
401e: 57c1                     seq.b      d1
4020: c001                     and.b      d1, d0
4022: 6776                     beq.b      $409a
4024: 7e01                     moveq      #$1, d7
4026: 206efbde                 movea.l    -$422(a6), a0
402a: 2050                     movea.l    (a0), a0
402c: 41e80024                 lea.l      $24(a0), a0
4030: 2848                     movea.l    a0, a4
4032: 4254                     clr.w      (a4)
4034: 594f                     subq.w     #$4, a7
4036: 2f2a001c                 move.l     $1c(a2), -(a7)
403a: 2f3c00010000             move.l     #$10000, -(a7)
4040: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
4044: 544f                     addq.w     #$2, a7
4046: 3f3c56f1                 move.w     #$56f1, -(a7)
404a: a869                     dc.w       $a869
404c: 295f0002                 move.l     (a7)+, $2(a4)
4050: 2d6a0018fbe8             move.l     $18(a2), -$418(a6)
4056: 2f2a0018                 move.l     $18(a2), -(a7)
405a: 703c                     moveq      #$3c, d0
405c: 2f00                     move.l     d0, -(a7)
405e: 4ead0122                 jsr        $122(a5) ; CODE 1 resource+0x0316
4062: 703b                     moveq      #$3b, d0
4064: d09f                     add.l      (a7)+, d0
4066: 2f2a001c                 move.l     $1c(a2), -(a7)
406a: 2f3c00010000             move.l     #$10000, -(a7)
4070: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
4074: 221f                     move.l     (a7)+, d1
4076: 2f00                     move.l     d0, -(a7)
4078: 2f01                     move.l     d1, -(a7)
407a: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
407e: 2d5ffbe4                 move.l     (a7)+, -$41c(a6)
4082: 7032                     moveq      #$32, d0
4084: b0aefbe4                 cmp.l      -$41c(a6), d0
4088: 6c06                     bge.b      $4090
408a: 7032                     moveq      #$32, d0
408c: 2d40fbe4                 move.l     d0, -$41c(a6)
4090: 2d4cfbec                 move.l     a4, -$414(a6)
4094: 3d7c0002fbe2             move.w     #$2, -$41e(a6)
409a: 4a07                     tst.b      d7
409c: 670000a6                 beq.w      $4144
40a0: 4207                     clr.b      d7
40a2: 594f                     subq.w     #$4, a7
40a4: 2f3c736e6420             move.l     #$736e6420, -(a7)
40aa: 487a0fd8                 pea.l      $5084(pc)
40ae: a9a1                     dc.w       $a9a1
40b0: 261f                     move.l     (a7)+, d3
40b2: 2f03                     move.l     d3, -(a7)
40b4: 205f                     movea.l    (a7)+, a0
40b6: a029                     dc.w       $a029
40b8: 4a83                     tst.l      d3
40ba: 67000088                 beq.w      $4144
40be: 2043                     movea.l    d3, a0
40c0: 2450                     movea.l    (a0), a2
40c2: 0c520001                 cmpi.w     #$1, (a2)
40c6: 57c0                     seq.b      d0
40c8: 0c6a00010002             cmpi.w     #$1, $2(a2)
40ce: 57c1                     seq.b      d1
40d0: c001                     and.b      d1, d0
40d2: 0c6a0001000a             cmpi.w     #$1, $a(a2)
40d8: 57c1                     seq.b      d1
40da: c001                     and.b      d1, d0
40dc: 6766                     beq.b      $4144
40de: 7e01                     moveq      #$1, d7
40e0: 2043                     movea.l    d3, a0
40e2: 2050                     movea.l    (a0), a0
40e4: 41e80024                 lea.l      $24(a0), a0
40e8: 2848                     movea.l    a0, a4
40ea: 4254                     clr.w      (a4)
40ec: 594f                     subq.w     #$4, a7
40ee: 2f2a001c                 move.l     $1c(a2), -(a7)
40f2: 2f3c00010000             move.l     #$10000, -(a7)
40f8: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
40fc: 544f                     addq.w     #$2, a7
40fe: 3f3c56f1                 move.w     #$56f1, -(a7)
4102: a869                     dc.w       $a869
4104: 295f0002                 move.l     (a7)+, $2(a4)
4108: 2d6a0018fbd6             move.l     $18(a2), -$42a(a6)
410e: 2f2a0018                 move.l     $18(a2), -(a7)
4112: 703c                     moveq      #$3c, d0
4114: 2f00                     move.l     d0, -(a7)
4116: 4ead0122                 jsr        $122(a5) ; CODE 1 resource+0x0316
411a: 703b                     moveq      #$3b, d0
411c: d09f                     add.l      (a7)+, d0
411e: 2f2a001c                 move.l     $1c(a2), -(a7)
4122: 2f3c00010000             move.l     #$10000, -(a7)
4128: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
412c: 221f                     move.l     (a7)+, d1
412e: 2f00                     move.l     d0, -(a7)
4130: 2f01                     move.l     d1, -(a7)
4132: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
4136: 2d5ffbd2                 move.l     (a7)+, -$42e(a6)
413a: 2d4cfbda                 move.l     a4, -$426(a6)
413e: 3d7c0004fbd0             move.w     #$4, -$430(a6)
4144: 4a07                     tst.b      d7
4146: 670000a6                 beq.w      $41ee
414a: 4207                     clr.b      d7
414c: 594f                     subq.w     #$4, a7
414e: 2f3c736e6420             move.l     #$736e6420, -(a7)
4154: 487a0f24                 pea.l      $507a(pc)
4158: a9a1                     dc.w       $a9a1
415a: 281f                     move.l     (a7)+, d4
415c: 2f04                     move.l     d4, -(a7)
415e: 205f                     movea.l    (a7)+, a0
4160: a029                     dc.w       $a029
4162: 4a84                     tst.l      d4
4164: 67000088                 beq.w      $41ee
4168: 2044                     movea.l    d4, a0
416a: 2450                     movea.l    (a0), a2
416c: 0c520001                 cmpi.w     #$1, (a2)
4170: 57c0                     seq.b      d0
4172: 0c6a00010002             cmpi.w     #$1, $2(a2)
4178: 57c1                     seq.b      d1
417a: c001                     and.b      d1, d0
417c: 0c6a0001000a             cmpi.w     #$1, $a(a2)
4182: 57c1                     seq.b      d1
4184: c001                     and.b      d1, d0
4186: 6766                     beq.b      $41ee
4188: 7e01                     moveq      #$1, d7
418a: 2044                     movea.l    d4, a0
418c: 2050                     movea.l    (a0), a0
418e: 41e80024                 lea.l      $24(a0), a0
4192: 2848                     movea.l    a0, a4
4194: 4254                     clr.w      (a4)
4196: 594f                     subq.w     #$4, a7
4198: 2f2a001c                 move.l     $1c(a2), -(a7)
419c: 2f3c00010000             move.l     #$10000, -(a7)
41a2: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
41a6: 544f                     addq.w     #$2, a7
41a8: 3f3c56f1                 move.w     #$56f1, -(a7)
41ac: a869                     dc.w       $a869
41ae: 295f0002                 move.l     (a7)+, $2(a4)
41b2: 2d6a0018fbc2             move.l     $18(a2), -$43e(a6)
41b8: 2f2a0018                 move.l     $18(a2), -(a7)
41bc: 703c                     moveq      #$3c, d0
41be: 2f00                     move.l     d0, -(a7)
41c0: 4ead0122                 jsr        $122(a5) ; CODE 1 resource+0x0316
41c4: 703b                     moveq      #$3b, d0
41c6: d09f                     add.l      (a7)+, d0
41c8: 2f2a001c                 move.l     $1c(a2), -(a7)
41cc: 2f3c00010000             move.l     #$10000, -(a7)
41d2: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
41d6: 221f                     move.l     (a7)+, d1
41d8: 2f00                     move.l     d0, -(a7)
41da: 2f01                     move.l     d1, -(a7)
41dc: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
41e0: 2d5ffbbe                 move.l     (a7)+, -$442(a6)
41e4: 2d4cfbc6                 move.l     a4, -$43a(a6)
41e8: 3d7c0003fbbc             move.w     #$3, -$444(a6)
41ee: 4a07                     tst.b      d7
41f0: 670000b0                 beq.w      $42a2
41f4: 4207                     clr.b      d7
41f6: 594f                     subq.w     #$4, a7
41f8: 2f3c736e6420             move.l     #$736e6420, -(a7)
41fe: 487a0e74                 pea.l      $5074(pc)
4202: a9a1                     dc.w       $a9a1
4204: 2d5ffba4                 move.l     (a7)+, -$45c(a6)
4208: 2f2efba4                 move.l     -$45c(a6), -(a7)
420c: 205f                     movea.l    (a7)+, a0
420e: a029                     dc.w       $a029
4210: 4aaefba4                 tst.l      -$45c(a6)
4214: 6700008c                 beq.w      $42a2
4218: 206efba4                 movea.l    -$45c(a6), a0
421c: 2450                     movea.l    (a0), a2
421e: 0c520001                 cmpi.w     #$1, (a2)
4222: 57c0                     seq.b      d0
4224: 0c6a00010002             cmpi.w     #$1, $2(a2)
422a: 57c1                     seq.b      d1
422c: c001                     and.b      d1, d0
422e: 0c6a0001000a             cmpi.w     #$1, $a(a2)
4234: 57c1                     seq.b      d1
4236: c001                     and.b      d1, d0
4238: 6768                     beq.b      $42a2
423a: 7e01                     moveq      #$1, d7
423c: 206efba4                 movea.l    -$45c(a6), a0
4240: 2050                     movea.l    (a0), a0
4242: 41e80024                 lea.l      $24(a0), a0
4246: 2848                     movea.l    a0, a4
4248: 4254                     clr.w      (a4)
424a: 594f                     subq.w     #$4, a7
424c: 2f2a001c                 move.l     $1c(a2), -(a7)
4250: 2f3c00010000             move.l     #$10000, -(a7)
4256: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
425a: 544f                     addq.w     #$2, a7
425c: 3f3c56f1                 move.w     #$56f1, -(a7)
4260: a869                     dc.w       $a869
4262: 295f0002                 move.l     (a7)+, $2(a4)
4266: 2d6a0018fbae             move.l     $18(a2), -$452(a6)
426c: 2f2a0018                 move.l     $18(a2), -(a7)
4270: 703c                     moveq      #$3c, d0
4272: 2f00                     move.l     d0, -(a7)
4274: 4ead0122                 jsr        $122(a5) ; CODE 1 resource+0x0316
4278: 703b                     moveq      #$3b, d0
427a: d09f                     add.l      (a7)+, d0
427c: 2f2a001c                 move.l     $1c(a2), -(a7)
4280: 2f3c00010000             move.l     #$10000, -(a7)
4286: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
428a: 221f                     move.l     (a7)+, d1
428c: 2f00                     move.l     d0, -(a7)
428e: 2f01                     move.l     d1, -(a7)
4290: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
4294: 2d5ffbaa                 move.l     (a7)+, -$456(a6)
4298: 2d4cfbb2                 move.l     a4, -$44e(a6)
429c: 3d7c0002fba8             move.w     #$2, -$458(a6)
42a2: 4a6e0008                 tst.w      $8(a6)
42a6: 6f000270                 ble.w      $4518
42aa: 426efece                 clr.w      -$132(a6)
42ae: 3d7c0001fecc             move.w     #$1, -$134(a6)
42b4: 302efece                 move.w     -$132(a6), d0
42b8: 600001b6                 bra.w      $4470
42bc: 3d7c000bfeca             move.w     #$b, -$136(a6)
42c2: 2d7c02783a08fee0         move.l     #$2783a08, -$120(a6)
42ca: 600001f6                 bra.w      $44c2
42ce: 3d7c0034fecc             move.w     #$34, -$134(a6)
42d4: 3d7c000bfeca             move.w     #$b, -$136(a6)
42da: 2d7c02793a08fee0         move.l     #$2793a08, -$120(a6)
42e2: 600001de                 bra.w      $44c2
42e6: 3d7c0016feca             move.w     #$16, -$136(a6)
42ec: 41fa0d80                 lea.l      $506e(pc), a0
42f0: 43eefee0                 lea.l      -$120(a6), a1
42f4: 22d8                     move.l     (a0)+, (a1)+
42f6: 22d8                     move.l     (a0)+, (a1)+
42f8: 600001c8                 bra.w      $44c2
42fc: 3d7c0034fecc             move.w     #$34, -$134(a6)
4302: 3d7c0016feca             move.w     #$16, -$136(a6)
4308: 41fa0d5e                 lea.l      $5068(pc), a0
430c: 43eefee0                 lea.l      -$120(a6), a1
4310: 22d8                     move.l     (a0)+, (a1)+
4312: 22d8                     move.l     (a0)+, (a1)+
4314: 600001ac                 bra.w      $44c2
4318: 3d7c002cfeca             move.w     #$2c, -$136(a6)
431e: 41fa0d40                 lea.l      $5060(pc), a0
4322: 43eefee0                 lea.l      -$120(a6), a1
4326: 22d8                     move.l     (a0)+, (a1)+
4328: 22d8                     move.l     (a0)+, (a1)+
432a: 60000196                 bra.w      $44c2
432e: 3d7c0021feca             move.w     #$21, -$136(a6)
4334: 41fa0d22                 lea.l      $5058(pc), a0
4338: 43eefee0                 lea.l      -$120(a6), a1
433c: 22d8                     move.l     (a0)+, (a1)+
433e: 22d8                     move.l     (a0)+, (a1)+
4340: 60000180                 bra.w      $44c2
4344: 3d7c0036fecc             move.w     #$36, -$134(a6)
434a: 3d7c0021feca             move.w     #$21, -$136(a6)
4350: 41fa0cfe                 lea.l      $5050(pc), a0
4354: 43eefee0                 lea.l      -$120(a6), a1
4358: 22d8                     move.l     (a0)+, (a1)+
435a: 22d8                     move.l     (a0)+, (a1)+
435c: 60000164                 bra.w      $44c2
4360: 3d7c0042fecc             move.w     #$42, -$134(a6)
4366: 3d7c0037feca             move.w     #$37, -$136(a6)
436c: 41fa0cdc                 lea.l      $504a(pc), a0
4370: 43eefee0                 lea.l      -$120(a6), a1
4374: 22d8                     move.l     (a0)+, (a1)+
4376: 22d8                     move.l     (a0)+, (a1)+
4378: 60000148                 bra.w      $44c2
437c: 3d7c003efecc             move.w     #$3e, -$134(a6)
4382: 3d7c002cfeca             move.w     #$2c, -$136(a6)
4388: 41fa0cb8                 lea.l      $5042(pc), a0
438c: 43eefee0                 lea.l      -$120(a6), a1
4390: 22d8                     move.l     (a0)+, (a1)+
4392: 22d8                     move.l     (a0)+, (a1)+
4394: 6000012c                 bra.w      $44c2
4398: 3d7c0042feca             move.w     #$42, -$136(a6)
439e: 41fa0c96                 lea.l      $5036(pc), a0
43a2: 43eefee0                 lea.l      -$120(a6), a1
43a6: 22d8                     move.l     (a0)+, (a1)+
43a8: 22d8                     move.l     (a0)+, (a1)+
43aa: 22d8                     move.l     (a0)+, (a1)+
43ac: 60000114                 bra.w      $44c2
43b0: 3d7c0063feca             move.w     #$63, -$136(a6)
43b6: 41fa0c6e                 lea.l      $5026(pc), a0
43ba: 43eefee0                 lea.l      -$120(a6), a1
43be: 22d8                     move.l     (a0)+, (a1)+
43c0: 22d8                     move.l     (a0)+, (a1)+
43c2: 22d8                     move.l     (a0)+, (a1)+
43c4: 22d8                     move.l     (a0)+, (a1)+
43c6: 600000fa                 bra.w      $44c2
43ca: 3d7c0058feca             move.w     #$58, -$136(a6)
43d0: 41fa0c44                 lea.l      $5016(pc), a0
43d4: 43eefee0                 lea.l      -$120(a6), a1
43d8: 22d8                     move.l     (a0)+, (a1)+
43da: 22d8                     move.l     (a0)+, (a1)+
43dc: 22d8                     move.l     (a0)+, (a1)+
43de: 22d8                     move.l     (a0)+, (a1)+
43e0: 600000e0                 bra.w      $44c2
43e4: 3d7c006efeca             move.w     #$6e, -$136(a6)
43ea: 41fa0c22                 lea.l      $500e(pc), a0
43ee: 43eefee0                 lea.l      -$120(a6), a1
43f2: 22d8                     move.l     (a0)+, (a1)+
43f4: 22d8                     move.l     (a0)+, (a1)+
43f6: 600000ca                 bra.w      $44c2
43fa: 3d7c003bfecc             move.w     #$3b, -$134(a6)
4400: 3d7c006efeca             move.w     #$6e, -$136(a6)
4406: 41fa0bfe                 lea.l      $5006(pc), a0
440a: 43eefee0                 lea.l      -$120(a6), a1
440e: 22d8                     move.l     (a0)+, (a1)+
4410: 22d8                     move.l     (a0)+, (a1)+
4412: 600000ae                 bra.w      $44c2
4416: 3d7c0079feca             move.w     #$79, -$136(a6)
441c: 41fa0be0                 lea.l      $4ffe(pc), a0
4420: 43eefee0                 lea.l      -$120(a6), a1
4424: 22d8                     move.l     (a0)+, (a1)+
4426: 22d8                     move.l     (a0)+, (a1)+
4428: 60000098                 bra.w      $44c2
442c: 3d7c003bfecc             move.w     #$3b, -$134(a6)
4432: 3d7c0079feca             move.w     #$79, -$136(a6)
4438: 41fa0bbc                 lea.l      $4ff6(pc), a0
443c: 43eefee0                 lea.l      -$120(a6), a1
4440: 22d8                     move.l     (a0)+, (a1)+
4442: 22d8                     move.l     (a0)+, (a1)+
4444: 6000007c                 bra.w      $44c2
4448: 3d7c0037feca             move.w     #$37, -$136(a6)
444e: 41fa0b9e                 lea.l      $4fee(pc), a0
4452: 43eefee0                 lea.l      -$120(a6), a1
4456: 22d8                     move.l     (a0)+, (a1)+
4458: 22d8                     move.l     (a0)+, (a1)+
445a: 6066                     bra.b      $44c2
445c: 3d7c004dfeca             move.w     #$4d, -$136(a6)
4462: 41fa0b82                 lea.l      $4fe6(pc), a0
4466: 43eefee0                 lea.l      -$120(a6), a1
446a: 22d8                     move.l     (a0)+, (a1)+
446c: 22d8                     move.l     (a0)+, (a1)+
446e: 6052                     bra.b      $44c2
4470: 0c400012                 cmpi.w     #$12, d0
4474: 642e                     bcc.b      $44a4
4476: d040                     add.w      d0, d0
4478: 303b0006                 move.w     $4480(pc, d0.w), d0
447c: 4efb0002                 jmp        $4480(pc, d0.w)
4480: fe3c                     dc.w       $fe3c
4482: fe4e                     dc.w       $fe4e
4484: fe66                     dc.w       $fe66
4486: fe7c                     dc.w       $fe7c
4488: fe98                     dc.w       $fe98
448a: feae                     dc.w       $feae
448c: fec4                     dc.w       $fec4
448e: fee0                     dc.w       $fee0
4490: fefc                     dc.w       $fefc
4492: ff18                     dc.w       $ff18
4494: ff30                     dc.w       $ff30
4496: ff4a                     dc.w       $ff4a
4498: ff64                     dc.w       $ff64
449a: ff7a                     dc.w       $ff7a
449c: ff96                     dc.w       $ff96
449e: ffac                     dc.w       $ffac
44a0: ffc8                     dc.w       $ffc8
44a2: ffdc                     dc.w       $ffdc
44a4: 0c6e0012fece             cmpi.w     #$12, -$132(a6)
44aa: 6616                     bne.b      $44c2
44ac: 3d7c0084feca             move.w     #$84, -$136(a6)
44b2: 41fa0b24                 lea.l      $4fd8(pc), a0
44b6: 43eefee0                 lea.l      -$120(a6), a1
44ba: 22d8                     move.l     (a0)+, (a1)+
44bc: 22d8                     move.l     (a0)+, (a1)+
44be: 22d8                     move.l     (a0)+, (a1)+
44c0: 22d8                     move.l     (a0)+, (a1)+
44c2: 302efece                 move.w     -$132(a6), d0
44c6: c1fc0018                 muls.w     #$18, d0
44ca: 0640f83c                 addi.w     #$f83c, d0
44ce: 3daefecc0000             move.w     -$134(a6), (a6, d0.w)
44d4: 302efeca                 move.w     -$136(a6), d0
44d8: 0640003d                 addi.w     #$3d, d0
44dc: 5040                     addq.w     #$8, d0
44de: 322efece                 move.w     -$132(a6), d1
44e2: c3fc0018                 muls.w     #$18, d1
44e6: 0641f83a                 addi.w     #$f83a, d1
44ea: 3d801000                 move.w     d0, (a6, d1.w)
44ee: 302efece                 move.w     -$132(a6), d0
44f2: c1fc0018                 muls.w     #$18, d0
44f6: 3f3c000f                 move.w     #$f, -(a7)
44fa: 486efee0                 pea.l      -$120(a6)
44fe: 0640f83e                 addi.w     #$f83e, d0
4502: 48760000                 pea.l      (a6, d0.w)
4506: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
450a: 526efece                 addq.w     #$1, -$132(a6)
450e: 0c6e0012fece             cmpi.w     #$12, -$132(a6)
4514: 6f00fd98                 ble.w      $42ae
4518: 4a07                     tst.b      d7
451a: 67000a2e                 beq.w      $4f4a
451e: 422dfefa                 clr.b      -$106(a5)
4522: 4a6e0008                 tst.w      $8(a6)
4526: 5ec0                     sgt.b      d0
4528: 4400                     neg.b      d0
452a: 1b40fefc                 move.b     d0, -$104(a5)
452e: 1b6dfefcfefb             move.b     -$104(a5), -$105(a5)
4534: 3b6e0008fefe             move.w     $8(a6), -$102(a5)
453a: 3d7c0001fece             move.w     #$1, -$132(a6)
4540: 302efece                 move.w     -$132(a6), d0
4544: e540                     asl.w      #$2, d0
4546: 0640fe0e                 addi.w     #$fe0e, d0
454a: 42b60000                 clr.l      (a6, d0.w)
454e: 526efece                 addq.w     #$1, -$132(a6)
4552: 0c6e0005fece             cmpi.w     #$5, -$132(a6)
4558: 6fe6                     ble.b      $4540
455a: 42aefe0e                 clr.l      -$1f2(a6)
455e: 426efece                 clr.w      -$132(a6)
4562: 594f                     subq.w     #$4, a7
4564: a924                     dc.w       $a924
4566: 265f                     movea.l    (a7)+, a3
4568: 60000070                 bra.w      $45da
456c: 4a6b006c                 tst.w      $6c(a3)
4570: 6c08                     bge.b      $457a
4572: 3f2b006c                 move.w     $6c(a3), -(a7)
4576: a9b7                     dc.w       $a9b7
4578: 605a                     bra.b      $45d4
457a: 594f                     subq.w     #$4, a7
457c: 2f0b                     move.l     a3, -(a7)
457e: a917                     dc.w       $a917
4580: 2b5fc030                 move.l     (a7)+, -$3fd0(a5)
4584: 206dc030                 movea.l    -$3fd0(a5), a0
4588: 2050                     movea.l    (a0), a0
458a: 4a10                     tst.b      (a0)
458c: 57c0                     seq.b      d0
458e: 0c2b0001006e             cmpi.b     #$1, $6e(a3)
4594: 57c1                     seq.b      d1
4596: c001                     and.b      d1, d0
4598: 671a                     beq.b      $45b4
459a: 302efece                 move.w     -$132(a6), d0
459e: 5240                     addq.w     #$1, d0
45a0: 3d40fece                 move.w     d0, -$132(a6)
45a4: 302efece                 move.w     -$132(a6), d0
45a8: e540                     asl.w      #$2, d0
45aa: 0640fe0e                 addi.w     #$fe0e, d0
45ae: 2d8b0000                 move.l     a3, (a6, d0.w)
45b2: 601c                     bra.b      $45d0
45b4: 206dc030                 movea.l    -$3fd0(a5), a0
45b8: 2050                     movea.l    (a0), a0
45ba: 0c100001                 cmpi.b     #$1, (a0)
45be: 57c0                     seq.b      d0
45c0: 0c2b0001006e             cmpi.b     #$1, $6e(a3)
45c6: 57c1                     seq.b      d1
45c8: c001                     and.b      d1, d0
45ca: 6704                     beq.b      $45d0
45cc: 2d4bfe0e                 move.l     a3, -$1f2(a6)
45d0: 2f0b                     move.l     a3, -(a7)
45d2: a916                     dc.w       $a916
45d4: 594f                     subq.w     #$4, a7
45d6: a924                     dc.w       $a924
45d8: 265f                     movea.l    (a7)+, a3
45da: 200b                     move.l     a3, d0
45dc: 668e                     bne.b      $456c
45de: 3d7c0081fece             move.w     #$81, -$132(a6)
45e4: 0c6e0086fece             cmpi.w     #$86, -$132(a6)
45ea: 56c0                     sne.b      d0
45ec: 0c6e0081fece             cmpi.w     #$81, -$132(a6)
45f2: 56c1                     sne.b      d1
45f4: c001                     and.b      d1, d0
45f6: 6712                     beq.b      $460a
45f8: 302efece                 move.w     -$132(a6), d0
45fc: e540                     asl.w      #$2, d0
45fe: 0640bbf6                 addi.w     #$bbf6, d0
4602: 2f350000                 move.l     (a5, d0.w), -(a7)
4606: 4267                     clr.w      -(a7)
4608: a93a                     dc.w       $a93a
460a: 526efece                 addq.w     #$1, -$132(a6)
460e: 0c6e0087fece             cmpi.w     #$87, -$132(a6)
4614: 6fce                     ble.b      $45e4
4616: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
461a: 3f3c0001                 move.w     #$1, -(a7)
461e: a93a                     dc.w       $a93a
4620: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
4624: 3f3c0002                 move.w     #$2, -(a7)
4628: a93a                     dc.w       $a93a
462a: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
462e: 3f3c0004                 move.w     #$4, -(a7)
4632: a93a                     dc.w       $a93a
4634: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
4638: 3f3c0005                 move.w     #$5, -(a7)
463c: a93a                     dc.w       $a93a
463e: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
4642: 3f3c0006                 move.w     #$6, -(a7)
4646: a93a                     dc.w       $a93a
4648: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
464c: 3f3c0007                 move.w     #$7, -(a7)
4650: a93a                     dc.w       $a93a
4652: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
4656: 3f3c0009                 move.w     #$9, -(a7)
465a: a93a                     dc.w       $a93a
465c: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
4660: 3f3c000a                 move.w     #$a, -(a7)
4664: a93a                     dc.w       $a93a
4666: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
466a: 3f3c0001                 move.w     #$1, -(a7)
466e: a93a                     dc.w       $a93a
4670: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4674: 3f3c0002                 move.w     #$2, -(a7)
4678: a939                     dc.w       $a939
467a: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
467e: 3f3c0004                 move.w     #$4, -(a7)
4682: a939                     dc.w       $a939
4684: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4688: 3f3c0005                 move.w     #$5, -(a7)
468c: a939                     dc.w       $a939
468e: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4692: 3f3c0007                 move.w     #$7, -(a7)
4696: a93a                     dc.w       $a93a
4698: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
469c: 3f3c000a                 move.w     #$a, -(a7)
46a0: a939                     dc.w       $a939
46a2: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
46a6: 3f3c0003                 move.w     #$3, -(a7)
46aa: a939                     dc.w       $a939
46ac: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
46b0: 3f3c0004                 move.w     #$4, -(a7)
46b4: a939                     dc.w       $a939
46b6: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
46ba: 3f3c0005                 move.w     #$5, -(a7)
46be: a939                     dc.w       $a939
46c0: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
46c4: 3f3c0006                 move.w     #$6, -(a7)
46c8: a939                     dc.w       $a939
46ca: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
46ce: 3f3c0007                 move.w     #$7, -(a7)
46d2: a93a                     dc.w       $a93a
46d4: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
46d8: 3f3c0009                 move.w     #$9, -(a7)
46dc: a93a                     dc.w       $a93a
46de: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
46e2: 3f3c000a                 move.w     #$a, -(a7)
46e6: a93a                     dc.w       $a93a
46e8: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
46ec: 3f3c000c                 move.w     #$c, -(a7)
46f0: a93a                     dc.w       $a93a
46f2: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
46f6: 3f3c000d                 move.w     #$d, -(a7)
46fa: a93a                     dc.w       $a93a
46fc: 422efc02                 clr.b      -$3fe(a6)
4700: 4a2dfefc                 tst.b      -$104(a5)
4704: 6746                     beq.b      $474c
4706: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
470a: 3f3c0008                 move.w     #$8, -(a7)
470e: a939                     dc.w       $a939
4710: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4714: 3f3c0008                 move.w     #$8, -(a7)
4718: 487a08ac                 pea.l      $4fc6(pc)
471c: a947                     dc.w       $a947
471e: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4722: 3f3c0009                 move.w     #$9, -(a7)
4726: a939                     dc.w       $a939
4728: 1b7c0001c02e             move.b     #$1, -$3fd2(a5)
472e: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4732: 3f3c0009                 move.w     #$9, -(a7)
4736: 487a0872                 pea.l      $4faa(pc)
473a: a947                     dc.w       $a947
473c: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4740: 3f3c0002                 move.w     #$2, -(a7)
4744: 487a085a                 pea.l      $4fa0(pc)
4748: a947                     dc.w       $a947
474a: 600e                     bra.b      $475a
474c: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4750: 3f3c0008                 move.w     #$8, -(a7)
4754: 487a0838                 pea.l      $4f8e(pc)
4758: a947                     dc.w       $a947
475a: 422ef82d                 clr.b      -$7d3(a6)
475e: a937                     dc.w       $a937
4760: 594f                     subq.w     #$4, a7
4762: 3f3c0080                 move.w     #$80, -(a7)
4766: 42a7                     clr.l      -(a7)
4768: 70ff                     moveq      #$ff, d0
476a: 2f00                     move.l     d0, -(a7)
476c: a9bd                     dc.w       $a9bd
476e: 2b5fbe26                 move.l     (a7)+, -$41da(a5)
4772: 426ef82a                 clr.w      -$7d6(a6)
4776: 3d7c0017f828             move.w     #$17, -$7d8(a6)
477c: 2f2dbe26                 move.l     -$41da(a5), -(a7)
4780: 3f2ef82a                 move.w     -$7d6(a6), -(a7)
4784: 3f2ef828                 move.w     -$7d8(a6), -(a7)
4788: 4227                     clr.b      -(a7)
478a: a91b                     dc.w       $a91b
478c: 2f2dbe26                 move.l     -$41da(a5), -(a7)
4790: a873                     dc.w       $a873
4792: 2f2dbe26                 move.l     -$41da(a5), -(a7)
4796: a915                     dc.w       $a915
4798: 426efe26                 clr.w      -$1da(a6)
479c: 246dbe26                 movea.l    -$41da(a5), a2
47a0: 594f                     subq.w     #$4, a7
47a2: 302a0016                 move.w     $16(a2), d0
47a6: 906a0012                 sub.w      $12(a2), d0
47aa: 5e40                     addq.w     #$7, d0
47ac: 48c0                     ext.l      d0
47ae: 81fc0008                 divs.w     #$8, d0
47b2: 322a0014                 move.w     $14(a2), d1
47b6: 926a0010                 sub.w      $10(a2), d1
47ba: c1c1                     muls.w     d1, d0
47bc: 48c0                     ext.l      d0
47be: 2f00                     move.l     d0, -(a7)
47c0: 4ead015a                 jsr        $15a(a5) ; CODE 1 resource+0x053a
47c4: 2d5ffb30                 move.l     (a7)+, -$4d0(a6)
47c8: 4aaefb30                 tst.l      -$4d0(a6)
47cc: 67000626                 beq.w      $4df4
47d0: 2f2efb30                 move.l     -$4d0(a6), -(a7)
47d4: 205f                     movea.l    (a7)+, a0
47d6: a029                     dc.w       $a029
47d8: 41eefb34                 lea.l      -$4cc(a6), a0
47dc: 2d48fba0                 move.l     a0, -$460(a6)
47e0: 2f2efba0                 move.l     -$460(a6), -(a7)
47e4: a86f                     dc.w       $a86f
47e6: 206dbe26                 movea.l    -$41da(a5), a0
47ea: 226dbe26                 movea.l    -$41da(a5), a1
47ee: 30280016                 move.w     $16(a0), d0
47f2: 90690012                 sub.w      $12(a1), d0
47f6: 5e40                     addq.w     #$7, d0
47f8: 48c0                     ext.l      d0
47fa: 81fc0008                 divs.w     #$8, d0
47fe: 3d40fb26                 move.w     d0, -$4da(a6)
4802: 206dbe26                 movea.l    -$41da(a5), a0
4806: 41e80010                 lea.l      $10(a0), a0
480a: 43eefb28                 lea.l      -$4d8(a6), a1
480e: 22d8                     move.l     (a0)+, (a1)+
4810: 22d8                     move.l     (a0)+, (a1)+
4812: 486efb28                 pea.l      -$4d8(a6)
4816: 206dbe26                 movea.l    -$41da(a5), a0
481a: 30280012                 move.w     $12(a0), d0
481e: 4440                     neg.w      d0
4820: 3f00                     move.w     d0, -(a7)
4822: 206dbe26                 movea.l    -$41da(a5), a0
4826: 30280010                 move.w     $10(a0), d0
482a: 4440                     neg.w      d0
482c: 3f00                     move.w     d0, -(a7)
482e: a8a8                     dc.w       $a8a8
4830: 206efb30                 movea.l    -$4d0(a6), a0
4834: 2d50fb22                 move.l     (a0), -$4de(a6)
4838: 486efb22                 pea.l      -$4de(a6)
483c: a875                     dc.w       $a875
483e: 3f2efb2e                 move.w     -$4d2(a6), -(a7)
4842: 3f2efb2c                 move.w     -$4d4(a6), -(a7)
4846: a876                     dc.w       $a876
4848: 594f                     subq.w     #$4, a7
484a: 3f3c0087                 move.w     #$87, -(a7)
484e: 42a7                     clr.l      -(a7)
4850: 70ff                     moveq      #$ff, d0
4852: 2f00                     move.l     d0, -(a7)
4854: a9bd                     dc.w       $a9bd
4856: 2d5ffec4                 move.l     (a7)+, -$13c(a6)
485a: 2d6efec4fed8             move.l     -$13c(a6), -$128(a6)
4860: 2f2efed8                 move.l     -$128(a6), -(a7)
4864: a873                     dc.w       $a873
4866: 2f2efec4                 move.l     -$13c(a6), -(a7)
486a: a915                     dc.w       $a915
486c: 3f3c0003                 move.w     #$3, -(a7)
4870: a887                     dc.w       $a887
4872: 3f3c0009                 move.w     #$9, -(a7)
4876: a88a                     dc.w       $a88a
4878: 4267                     clr.w      -(a7)
487a: a938                     dc.w       $a938
487c: 554f                     subq.w     #$2, a7
487e: 487a0708                 pea.l      $4f88(pc)
4882: a88c                     dc.w       $a88c
4884: 3d5ff838                 move.w     (a7)+, -$7c8(a6)
4888: 594f                     subq.w     #$4, a7
488a: a975                     dc.w       $a975
488c: 2b5fff4c                 move.l     (a7)+, -$b4(a5)
4890: 3d7c0001fc08             move.w     #$1, -$3f8(a6)
4896: 6000049c                 bra.w      $4d34
489a: 422efbf5                 clr.b      -$40b(a6)
489e: 3d7c0032fc06             move.w     #$32, -$3fa(a6)
48a4: 426df904                 clr.w      -$6fc(a5)
48a8: 426dc382                 clr.w      -$3c7e(a5)
48ac: 2f2dbe26                 move.l     -$41da(a5), -(a7)
48b0: a873                     dc.w       $a873
48b2: 206dbe26                 movea.l    -$41da(a5), a0
48b6: 48680010                 pea.l      $10(a0)
48ba: a8a3                     dc.w       $a8a3
48bc: 2f2efec4                 move.l     -$13c(a6), -(a7)
48c0: a873                     dc.w       $a873
48c2: 206efec4                 movea.l    -$13c(a6), a0
48c6: 48680010                 pea.l      $10(a0)
48ca: a8a3                     dc.w       $a8a3
48cc: 426efeb4                 clr.w      -$14c(a6)
48d0: 2f0e                     move.l     a6, -(a7)
48d2: 4ebaefa0                 jsr        $3874(pc)
48d6: 3d7c0001feb4             move.w     #$1, -$14c(a6)
48dc: 1f3c0001                 move.b     #$1, -(a7)
48e0: 1f3c0001                 move.b     #$1, -(a7)
48e4: 2f0e                     move.l     a6, -(a7)
48e6: 4ebae77a                 jsr        $3062(pc)
48ea: 3f3c017e                 move.w     #$17e, -(a7)
48ee: 4267                     clr.w      -(a7)
48f0: 201f                     move.l     (a7)+, d0
48f2: a032                     dc.w       $a032
48f4: 4205                     clr.b      d5
48f6: 594f                     subq.w     #$4, a7
48f8: a975                     dc.w       $a975
48fa: 2d5ffbfc                 move.l     (a7)+, -$404(a6)
48fe: 422ef82d                 clr.b      -$7d3(a6)
4902: 2f0e                     move.l     a6, -(a7)
4904: 4ebadf6c                 jsr        $2872(pc)
4908: 3d6dc382fc0c             move.w     -$3c7e(a5), -$3f4(a6)
490e: 3d6df906f806             move.w     -$6fa(a5), -$7fa(a6)
4914: 3d7c0001fece             move.w     #$1, -$132(a6)
491a: 6040                     bra.b      $495c
491c: 2f0e                     move.l     a6, -(a7)
491e: 4ebadf52                 jsr        $2872(pc)
4922: 303c1b58                 move.w     #$1b58, d0
4926: c1edf906                 muls.w     -$6fa(a5), d0
492a: 06400bb8                 addi.w     #$bb8, d0
492e: 3d40f804                 move.w     d0, -$7fc(a6)
4932: 3d7c0001fecc             move.w     #$1, -$134(a6)
4938: 6012                     bra.b      $494c
493a: 302efecc                 move.w     -$134(a6), d0
493e: d06efece                 add.w      -$132(a6), d0
4942: 3d40feca                 move.w     d0, -$136(a6)
4946: 526efecc                 addq.w     #$1, -$134(a6)
494a: 690a                     bvs.b      $4956
494c: 302efecc                 move.w     -$134(a6), d0
4950: b06ef804                 cmp.w      -$7fc(a6), d0
4954: 6fe4                     ble.b      $493a
4956: 526efece                 addq.w     #$1, -$132(a6)
495a: 690a                     bvs.b      $4966
495c: 302efece                 move.w     -$132(a6), d0
4960: b06ef806                 cmp.w      -$7fa(a6), d0
4964: 6fb6                     ble.b      $491c
4966: 0c6d0004f906             cmpi.w     #$4, -$6fa(a5)
496c: 660e                     bne.b      $497c
496e: 594f                     subq.w     #$4, a7
4970: a975                     dc.w       $a975
4972: 70f6                     moveq      #$f6, d0
4974: d09f                     add.l      (a7)+, d0
4976: b0aefbfc                 cmp.l      -$404(a6), d0
497a: 6ff2                     ble.b      $496e
497c: 594f                     subq.w     #$4, a7
497e: a975                     dc.w       $a975
4980: 2d5ffbfc                 move.l     (a7)+, -$404(a6)
4984: 102dfefb                 move.b     -$105(a5), d0
4988: 5300                     subq.b     #$1, d0
498a: 4400                     neg.b      d0
498c: 802ef82d                 or.b       -$7d3(a6), d0
4990: 6700033c                 beq.w      $4cce
4994: 4206                     clr.b      d6
4996: 3d7c0001fece             move.w     #$1, -$132(a6)
499c: 302efece                 move.w     -$132(a6), d0
49a0: 0640c375                 addi.w     #$c375, d0
49a4: 4a350000                 tst.b      (a5, d0.w)
49a8: 67000198                 beq.w      $4b42
49ac: 2f0e                     move.l     a6, -(a7)
49ae: 4ebaf45a                 jsr        $3e0a(pc)
49b2: 302efece                 move.w     -$132(a6), d0
49b6: c1fc00a6                 muls.w     #$a6, d0
49ba: 0640c030                 addi.w     #$c030, d0
49be: 2d750000feb6             move.l     (a5, d0.w), -$14a(a6)
49c4: 2f2efeb6                 move.l     -$14a(a6), -(a7)
49c8: 205f                     movea.l    (a7)+, a0
49ca: a029                     dc.w       $a029
49cc: 206efeb6                 movea.l    -$14a(a6), a0
49d0: 2050                     movea.l    (a0), a0
49d2: 3028011c                 move.w     $11c(a0), d0
49d6: d040                     add.w      d0, d0
49d8: 206efeb6                 movea.l    -$14a(a6), a0
49dc: 2050                     movea.l    (a0), a0
49de: 0640c384                 addi.w     #$c384, d0
49e2: 30350000                 move.w     (a5, d0.w), d0
49e6: 9068222c                 sub.w      $222c(a0), d0
49ea: 3d40feca                 move.w     d0, -$136(a6)
49ee: 302dfefe                 move.w     -$102(a5), d0
49f2: b06efece                 cmp.w      -$132(a6), d0
49f6: 57c0                     seq.b      d0
49f8: c02dfefc                 and.b      -$104(a5), d0
49fc: 670000e2                 beq.w      $4ae0
4a00: 4a06                     tst.b      d6
4a02: 670a                     beq.b      $4a0e
4a04: 422efc04                 clr.b      -$3fc(a6)
4a08: 4206                     clr.b      d6
4a0a: 600000ba                 bra.w      $4ac6
4a0e: 1d7c0001fc04             move.b     #$1, -$3fc(a6)
4a14: 600000b0                 bra.w      $4ac6
4a18: 422ef82d                 clr.b      -$7d3(a6)
4a1c: 554f                     subq.w     #$2, a7
4a1e: 206efeb6                 movea.l    -$14a(a6), a0
4a22: 2050                     movea.l    (a0), a0
4a24: 4868011c                 pea.l      $11c(a0)
4a28: 3f3c0001                 move.w     #$1, -(a7)
4a2c: 1f2efc04                 move.b     -$3fc(a6), -(a7)
4a30: 4ebad0be                 jsr        $1af0(pc)
4a34: 1c1f                     move.b     (a7)+, d6
4a36: 4a06                     tst.b      d6
4a38: 6708                     beq.b      $4a42
4a3a: 2f0e                     move.l     a6, -(a7)
4a3c: 4ebadddc                 jsr        $281a(pc)
4a40: 4206                     clr.b      d6
4a42: 2f2efeb6                 move.l     -$14a(a6), -(a7)
4a46: 2f0e                     move.l     a6, -(a7)
4a48: 4ebad6ca                 jsr        $2114(pc)
4a4c: 2f2efeb6                 move.l     -$14a(a6), -(a7)
4a50: 2f0e                     move.l     a6, -(a7)
4a52: 4ebad7b0                 jsr        $2204(pc)
4a56: 302efeca                 move.w     -$136(a6), d0
4a5a: 5340                     subq.w     #$1, d0
4a5c: 3d40feca                 move.w     d0, -$136(a6)
4a60: 2f0e                     move.l     a6, -(a7)
4a62: 4ebaf3a6                 jsr        $3e0a(pc)
4a66: 2f0e                     move.l     a6, -(a7)
4a68: 4ebade08                 jsr        $2872(pc)
4a6c: 102dfefb                 move.b     -$105(a5), d0
4a70: 5300                     subq.b     #$1, d0
4a72: 4400                     neg.b      d0
4a74: 802ef82d                 or.b       -$7d3(a6), d0
4a78: 802dfefa                 or.b       -$106(a5), d0
4a7c: 8005                     or.b       d5, d0
4a7e: 67e0                     beq.b      $4a60
4a80: 422efc04                 clr.b      -$3fc(a6)
4a84: 102dfefc                 move.b     -$104(a5), d0
4a88: 5300                     subq.b     #$1, d0
4a8a: 673a                     beq.b      $4ac6
4a8c: 554f                     subq.w     #$2, a7
4a8e: 206efeb6                 movea.l    -$14a(a6), a0
4a92: 2050                     movea.l    (a0), a0
4a94: 4868011c                 pea.l      $11c(a0)
4a98: 3f2efeca                 move.w     -$136(a6), -(a7)
4a9c: 4227                     clr.b      -(a7)
4a9e: 4ebad050                 jsr        $1af0(pc)
4aa2: 1c1f                     move.b     (a7)+, d6
4aa4: 4a06                     tst.b      d6
4aa6: 671a                     beq.b      $4ac2
4aa8: 2f0e                     move.l     a6, -(a7)
4aaa: 4ebadd6e                 jsr        $281a(pc)
4aae: 2f2efeb6                 move.l     -$14a(a6), -(a7)
4ab2: 2f0e                     move.l     a6, -(a7)
4ab4: 4ebad65e                 jsr        $2114(pc)
4ab8: 2f2efeb6                 move.l     -$14a(a6), -(a7)
4abc: 2f0e                     move.l     a6, -(a7)
4abe: 4ebad744                 jsr        $2204(pc)
4ac2: 426efeca                 clr.w      -$136(a6)
4ac6: 4a6efeca                 tst.w      -$136(a6)
4aca: 5ec0                     sgt.b      d0
4acc: 122dfefa                 move.b     -$106(a5), d1
4ad0: 5301                     subq.b     #$1, d1
4ad2: c001                     and.b      d1, d0
4ad4: 1205                     move.b     d5, d1
4ad6: 5301                     subq.b     #$1, d1
4ad8: c001                     and.b      d1, d0
4ada: 6600ff3c                 bne.w      $4a18
4ade: 605a                     bra.b      $4b3a
4ae0: 554f                     subq.w     #$2, a7
4ae2: 206efeb6                 movea.l    -$14a(a6), a0
4ae6: 2050                     movea.l    (a0), a0
4ae8: 4868011c                 pea.l      $11c(a0)
4aec: 3f2efeca                 move.w     -$136(a6), -(a7)
4af0: 1f3c0001                 move.b     #$1, -(a7)
4af4: 4ebacffa                 jsr        $1af0(pc)
4af8: 1c1f                     move.b     (a7)+, d6
4afa: 4a06                     tst.b      d6
4afc: 673c                     beq.b      $4b3a
4afe: 206efeb6                 movea.l    -$14a(a6), a0
4b02: 2050                     movea.l    (a0), a0
4b04: 302efeca                 move.w     -$136(a6), d0
4b08: d068222c                 add.w      $222c(a0), d0
4b0c: 206efeb6                 movea.l    -$14a(a6), a0
4b10: 2050                     movea.l    (a0), a0
4b12: 3140222c                 move.w     d0, $222c(a0)
4b16: 302efece                 move.w     -$132(a6), d0
4b1a: 5340                     subq.w     #$1, d0
4b1c: 3d40fece                 move.w     d0, -$132(a6)
4b20: 2f0e                     move.l     a6, -(a7)
4b22: 4ebadcf6                 jsr        $281a(pc)
4b26: 2f2efeb6                 move.l     -$14a(a6), -(a7)
4b2a: 2f0e                     move.l     a6, -(a7)
4b2c: 4ebad5e6                 jsr        $2114(pc)
4b30: 2f2efeb6                 move.l     -$14a(a6), -(a7)
4b34: 2f0e                     move.l     a6, -(a7)
4b36: 4ebad6cc                 jsr        $2204(pc)
4b3a: 2f2efeb6                 move.l     -$14a(a6), -(a7)
4b3e: 205f                     movea.l    (a7)+, a0
4b40: a02a                     dc.w       $a02a
4b42: 526efece                 addq.w     #$1, -$132(a6)
4b46: 0c6e0005fece             cmpi.w     #$5, -$132(a6)
4b4c: 6f00fe4e                 ble.w      $499c
4b50: 302efeb4                 move.w     -$14c(a6), d0
4b54: 5240                     addq.w     #$1, d0
4b56: 3d40feb4                 move.w     d0, -$14c(a6)
4b5a: 486efbcb                 pea.l      -$435(a6)
4b5e: 3f2efeb4                 move.w     -$14c(a6), -(a7)
4b62: 4ebabd1c                 jsr        $880(pc)
4b66: 4a2efbcb                 tst.b      -$435(a6)
4b6a: 670a                     beq.b      $4b76
4b6c: 486efbbc                 pea.l      -$444(a6)
4b70: 2f0e                     move.l     a6, -(a7)
4b72: 4ebad40c                 jsr        $1f80(pc)
4b76: 1f3c0001                 move.b     #$1, -(a7)
4b7a: 102df91d                 move.b     -$6e3(a5), d0
4b7e: 5300                     subq.b     #$1, d0
4b80: 322efeb4                 move.w     -$14c(a6), d1
4b84: 48c1                     ext.l      d1
4b86: 83fc0008                 divs.w     #$8, d1
4b8a: 4841                     swap       d1
4b8c: 4a41                     tst.w      d1
4b8e: 57c1                     seq.b      d1
4b90: 8001                     or.b       d1, d0
4b92: 4400                     neg.b      d0
4b94: 1f00                     move.b     d0, -(a7)
4b96: 2f0e                     move.l     a6, -(a7)
4b98: 4ebae4c8                 jsr        $3062(pc)
4b9c: 302efc0c                 move.w     -$3f4(a6), d0
4ba0: b06dc382                 cmp.w      -$3c7e(a5), d0
4ba4: 676a                     beq.b      $4c10
4ba6: 3d7c0001fec8             move.w     #$1, -$138(a6)
4bac: 302efec8                 move.w     -$138(a6), d0
4bb0: 0640c375                 addi.w     #$c375, d0
4bb4: 4a350000                 tst.b      (a5, d0.w)
4bb8: 674a                     beq.b      $4c04
4bba: 302efec8                 move.w     -$138(a6), d0
4bbe: c1fc00a6                 muls.w     #$a6, d0
4bc2: 0640c030                 addi.w     #$c030, d0
4bc6: 2d750000feb6             move.l     (a5, d0.w), -$14a(a6)
4bcc: 206efeb6                 movea.l    -$14a(a6), a0
4bd0: 2050                     movea.l    (a0), a0
4bd2: 302822b8                 move.w     $22b8(a0), d0
4bd6: d06efc0c                 add.w      -$3f4(a6), d0
4bda: 906dc382                 sub.w      -$3c7e(a5), d0
4bde: 206efeb6                 movea.l    -$14a(a6), a0
4be2: 2050                     movea.l    (a0), a0
4be4: 314022b8                 move.w     d0, $22b8(a0)
4be8: 206efeb6                 movea.l    -$14a(a6), a0
4bec: 2050                     movea.l    (a0), a0
4bee: 302822ba                 move.w     $22ba(a0), d0
4bf2: d06efc0c                 add.w      -$3f4(a6), d0
4bf6: 906dc382                 sub.w      -$3c7e(a5), d0
4bfa: 206efeb6                 movea.l    -$14a(a6), a0
4bfe: 2050                     movea.l    (a0), a0
4c00: 314022ba                 move.w     d0, $22ba(a0)
4c04: 526efec8                 addq.w     #$1, -$138(a6)
4c08: 0c6e0005fec8             cmpi.w     #$5, -$138(a6)
4c0e: 6f9c                     ble.b      $4bac
4c10: 302efeb4                 move.w     -$14c(a6), d0
4c14: 48c0                     ext.l      d0
4c16: 81fc0004                 divs.w     #$4, d0
4c1a: 4840                     swap       d0
4c1c: 4a40                     tst.w      d0
4c1e: 57c0                     seq.b      d0
4c20: 122df91d                 move.b     -$6e3(a5), d1
4c24: 5301                     subq.b     #$1, d1
4c26: 342efeb4                 move.w     -$14c(a6), d2
4c2a: 48c2                     ext.l      d2
4c2c: 85fc0018                 divs.w     #$18, d2
4c30: 4842                     swap       d2
4c32: 4a42                     tst.w      d2
4c34: 57c2                     seq.b      d2
4c36: 8202                     or.b       d2, d1
4c38: c001                     and.b      d1, d0
4c3a: 6706                     beq.b      $4c42
4c3c: 2f0e                     move.l     a6, -(a7)
4c3e: 4ebadd00                 jsr        $2940(pc)
4c42: 0c6e7d00feb4             cmpi.w     #$7d00, -$14c(a6)
4c48: 6f06                     ble.b      $4c50
4c4a: 3d7c0001feb4             move.w     #$1, -$14c(a6)
4c50: 302df904                 move.w     -$6fc(a5), d0
4c54: 5240                     addq.w     #$1, d0
4c56: 3b40f904                 move.w     d0, -$6fc(a5)
4c5a: 0c6d012cf904             cmpi.w     #$12c, -$6fc(a5)
4c60: 6f02                     ble.b      $4c64
4c62: 7a01                     moveq      #$1, d5
4c64: 0c6d0001c382             cmpi.w     #$1, -$3c7e(a5)
4c6a: 6e62                     bgt.b      $4cce
4c6c: 0c6e0032fc06             cmpi.w     #$32, -$3fa(a6)
4c72: 6648                     bne.b      $4cbc
4c74: 3d7c0001fece             move.w     #$1, -$132(a6)
4c7a: 302efece                 move.w     -$132(a6), d0
4c7e: 0640c375                 addi.w     #$c375, d0
4c82: 4a350000                 tst.b      (a5, d0.w)
4c86: 6728                     beq.b      $4cb0
4c88: 302efece                 move.w     -$132(a6), d0
4c8c: c1fc00a6                 muls.w     #$a6, d0
4c90: 0640c030                 addi.w     #$c030, d0
4c94: 2d750000feb6             move.l     (a5, d0.w), -$14a(a6)
4c9a: 206efeb6                 movea.l    -$14a(a6), a0
4c9e: 2050                     movea.l    (a0), a0
4ca0: 202822bc                 move.l     $22bc(a0), d0
4ca4: 5280                     addq.l     #$1, d0
4ca6: 206efeb6                 movea.l    -$14a(a6), a0
4caa: 2050                     movea.l    (a0), a0
4cac: 214022bc                 move.l     d0, $22bc(a0)
4cb0: 526efece                 addq.w     #$1, -$132(a6)
4cb4: 0c6e0005fece             cmpi.w     #$5, -$132(a6)
4cba: 6fbe                     ble.b      $4c7a
4cbc: 302efc06                 move.w     -$3fa(a6), d0
4cc0: 5340                     subq.w     #$1, d0
4cc2: 3d40fc06                 move.w     d0, -$3fa(a6)
4cc6: 4a6efc06                 tst.w      -$3fa(a6)
4cca: 6e02                     bgt.b      $4cce
4ccc: 7a01                     moveq      #$1, d5
4cce: 102dfefa                 move.b     -$106(a5), d0
4cd2: 8005                     or.b       d5, d0
4cd4: 6700fc28                 beq.w      $48fe
4cd8: 302efc08                 move.w     -$3f8(a6), d0
4cdc: 5240                     addq.w     #$1, d0
4cde: 3d40fc08                 move.w     d0, -$3f8(a6)
4ce2: 3d7c0001fece             move.w     #$1, -$132(a6)
4ce8: 302efece                 move.w     -$132(a6), d0
4cec: 0640c37b                 addi.w     #$c37b, d0
4cf0: 4a350000                 tst.b      (a5, d0.w)
4cf4: 6732                     beq.b      $4d28
4cf6: 302efece                 move.w     -$132(a6), d0
4cfa: c1fc00a6                 muls.w     #$a6, d0
4cfe: 0640c030                 addi.w     #$c030, d0
4d02: 2d750000feb6             move.l     (a5, d0.w), -$14a(a6)
4d08: 206efeb6                 movea.l    -$14a(a6), a0
4d0c: 2050                     movea.l    (a0), a0
4d0e: 226efeb6                 movea.l    -$14a(a6), a1
4d12: 2251                     movea.l    (a1), a1
4d14: 3029207a                 move.w     $207a(a1), d0
4d18: 48c0                     ext.l      d0
4d1a: d0a822c4                 add.l      $22c4(a0), d0
4d1e: 206efeb6                 movea.l    -$14a(a6), a0
4d22: 2050                     movea.l    (a0), a0
4d24: 214022c4                 move.l     d0, $22c4(a0)
4d28: 526efece                 addq.w     #$1, -$132(a6)
4d2c: 0c6e0005fece             cmpi.w     #$5, -$132(a6)
4d32: 6fb4                     ble.b      $4ce8
4d34: 302efc08                 move.w     -$3f8(a6), d0
4d38: b06e000a                 cmp.w      $a(a6), d0
4d3c: 5fc0                     sle.b      d0
4d3e: 122dfefa                 move.b     -$106(a5), d1
4d42: 5301                     subq.b     #$1, d1
4d44: c001                     and.b      d1, d0
4d46: 6600fb52                 bne.w      $489a
4d4a: 302efc08                 move.w     -$3f8(a6), d0
4d4e: b06e000a                 cmp.w      $a(a6), d0
4d52: 6f06                     ble.b      $4d5a
4d54: 3d6e000afc08             move.w     $a(a6), -$3f8(a6)
4d5a: 3d7c0001fece             move.w     #$1, -$132(a6)
4d60: 302efece                 move.w     -$132(a6), d0
4d64: 0640c37b                 addi.w     #$c37b, d0
4d68: 4a350000                 tst.b      (a5, d0.w)
4d6c: 6732                     beq.b      $4da0
4d6e: 302efece                 move.w     -$132(a6), d0
4d72: c1fc00a6                 muls.w     #$a6, d0
4d76: 0640c030                 addi.w     #$c030, d0
4d7a: 2d750000feb6             move.l     (a5, d0.w), -$14a(a6)
4d80: 206efeb6                 movea.l    -$14a(a6), a0
4d84: 2050                     movea.l    (a0), a0
4d86: 302efc08                 move.w     -$3f8(a6), d0
4d8a: 48c0                     ext.l      d0
4d8c: 2f2822c4                 move.l     $22c4(a0), -(a7)
4d90: 2f00                     move.l     d0, -(a7)
4d92: 4ead011a                 jsr        $11a(a5) ; CODE 1 resource+0x02ec
4d96: 206efeb6                 movea.l    -$14a(a6), a0
4d9a: 2050                     movea.l    (a0), a0
4d9c: 215f22c4                 move.l     (a7)+, $22c4(a0)
4da0: 526efece                 addq.w     #$1, -$132(a6)
4da4: 0c6e0005fece             cmpi.w     #$5, -$132(a6)
4daa: 6fb4                     ble.b      $4d60
4dac: 102dbdb5                 move.b     -$424b(a5), d0
4db0: 5300                     subq.b     #$1, d0
4db2: 670c                     beq.b      $4dc0
4db4: 2f0e                     move.l     a6, -(a7)
4db6: 4ebae74e                 jsr        $3506(pc)
4dba: 2f0e                     move.l     a6, -(a7)
4dbc: 4ebaee9a                 jsr        $3c58(pc)
4dc0: 2f2efec4                 move.l     -$13c(a6), -(a7)
4dc4: a92d                     dc.w       $a92d
4dc6: 2f2efba0                 move.l     -$460(a6), -(a7)
4dca: a87d                     dc.w       $a87d
4dcc: 2f2efb30                 move.l     -$4d0(a6), -(a7)
4dd0: 205f                     movea.l    (a7)+, a0
4dd2: a02a                     dc.w       $a02a
4dd4: 2f2efb30                 move.l     -$4d0(a6), -(a7)
4dd8: 205f                     movea.l    (a7)+, a0
4dda: a023                     dc.w       $a023
4ddc: 4ead01ba                 jsr        $1ba(a5) ; CODE 1 resource+0x07d4
4de0: 2f2efbde                 move.l     -$422(a6), -(a7)
4de4: a9a3                     dc.w       $a9a3
4de6: 2f03                     move.l     d3, -(a7)
4de8: a9a3                     dc.w       $a9a3
4dea: 2f04                     move.l     d4, -(a7)
4dec: a9a3                     dc.w       $a9a3
4dee: 2f2efba4                 move.l     -$45c(a6), -(a7)
4df2: a9a3                     dc.w       $a9a3
4df4: 3f3c003e                 move.w     #$3e, -(a7)
4df8: 4267                     clr.w      -(a7)
4dfa: 201f                     move.l     (a7)+, d0
4dfc: a032                     dc.w       $a032
4dfe: 2f2dbe26                 move.l     -$41da(a5), -(a7)
4e02: a92d                     dc.w       $a92d
4e04: 2f2efedc                 move.l     -$124(a6), -(a7)
4e08: a873                     dc.w       $a873
4e0a: 4aaefe0e                 tst.l      -$1f2(a6)
4e0e: 6706                     beq.b      $4e16
4e10: 2f2efe0e                 move.l     -$1f2(a6), -(a7)
4e14: a915                     dc.w       $a915
4e16: 3d7c0005fecc             move.w     #$5, -$134(a6)
4e1c: 302efecc                 move.w     -$134(a6), d0
4e20: e540                     asl.w      #$2, d0
4e22: 0640fe0e                 addi.w     #$fe0e, d0
4e26: 4ab60000                 tst.l      (a6, d0.w)
4e2a: 6720                     beq.b      $4e4c
4e2c: 302efecc                 move.w     -$134(a6), d0
4e30: e540                     asl.w      #$2, d0
4e32: 0640fe0e                 addi.w     #$fe0e, d0
4e36: 2f360000                 move.l     (a6, d0.w), -(a7)
4e3a: a920                     dc.w       $a920
4e3c: 302efecc                 move.w     -$134(a6), d0
4e40: e540                     asl.w      #$2, d0
4e42: 0640fe0e                 addi.w     #$fe0e, d0
4e46: 2f360000                 move.l     (a6, d0.w), -(a7)
4e4a: a915                     dc.w       $a915
4e4c: 536efecc                 subq.w     #$1, -$134(a6)
4e50: 0c6e0001fecc             cmpi.w     #$1, -$134(a6)
4e56: 6cc4                     bge.b      $4e1c
4e58: 594f                     subq.w     #$4, a7
4e5a: a924                     dc.w       $a924
4e5c: 4a9f                     tst.l      (a7)+
4e5e: 6706                     beq.b      $4e66
4e60: 594f                     subq.w     #$4, a7
4e62: a924                     dc.w       $a924
4e64: a91f                     dc.w       $a91f
4e66: 3d7c0080fece             move.w     #$80, -$132(a6)
4e6c: 302efece                 move.w     -$132(a6), d0
4e70: e540                     asl.w      #$2, d0
4e72: 0640bbf6                 addi.w     #$bbf6, d0
4e76: 2f350000                 move.l     (a5, d0.w), -(a7)
4e7a: 4267                     clr.w      -(a7)
4e7c: a939                     dc.w       $a939
4e7e: 526efece                 addq.w     #$1, -$132(a6)
4e82: 0c6e0087fece             cmpi.w     #$87, -$132(a6)
4e88: 6fe2                     ble.b      $4e6c
4e8a: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
4e8e: 3f3c0001                 move.w     #$1, -(a7)
4e92: 0c6d0005bdf0             cmpi.w     #$5, -$4210(a5)
4e98: 5dc0                     slt.b      d0
4e9a: 4400                     neg.b      d0
4e9c: 1f00                     move.b     d0, -(a7)
4e9e: 4ead004a                 jsr        $4a(a5) ; CODE 4 resource+0x014c
4ea2: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
4ea6: 3f3c0002                 move.w     #$2, -(a7)
4eaa: 0c6d0005bdf0             cmpi.w     #$5, -$4210(a5)
4eb0: 5dc0                     slt.b      d0
4eb2: 4400                     neg.b      d0
4eb4: 1f00                     move.b     d0, -(a7)
4eb6: 4ead004a                 jsr        $4a(a5) ; CODE 4 resource+0x014c
4eba: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
4ebe: 3f3c0009                 move.w     #$9, -(a7)
4ec2: a939                     dc.w       $a939
4ec4: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
4ec8: 3f3c000a                 move.w     #$a, -(a7)
4ecc: a939                     dc.w       $a939
4ece: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4ed2: 3f3c0001                 move.w     #$1, -(a7)
4ed6: a939                     dc.w       $a939
4ed8: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4edc: 3f3c0002                 move.w     #$2, -(a7)
4ee0: a93a                     dc.w       $a93a
4ee2: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4ee6: 3f3c0004                 move.w     #$4, -(a7)
4eea: a93a                     dc.w       $a93a
4eec: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4ef0: 3f3c0005                 move.w     #$5, -(a7)
4ef4: a93a                     dc.w       $a93a
4ef6: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4efa: 3f3c0002                 move.w     #$2, -(a7)
4efe: 487a0082                 pea.l      $4f82(pc)
4f02: a947                     dc.w       $a947
4f04: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4f08: 3f3c0008                 move.w     #$8, -(a7)
4f0c: 487a0062                 pea.l      $4f70(pc)
4f10: a947                     dc.w       $a947
4f12: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4f16: 3f3c0008                 move.w     #$8, -(a7)
4f1a: a93a                     dc.w       $a93a
4f1c: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4f20: 3f3c0009                 move.w     #$9, -(a7)
4f24: 487a002e                 pea.l      $4f54(pc)
4f28: a947                     dc.w       $a947
4f2a: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4f2e: 3f3c0009                 move.w     #$9, -(a7)
4f32: a93a                     dc.w       $a93a
4f34: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4f38: 3f3c000a                 move.w     #$a, -(a7)
4f3c: a93a                     dc.w       $a93a
4f3e: a937                     dc.w       $a937
4f40: 3f3c003e                 move.w     #$3e, -(a7)
4f44: 4267                     clr.w      -(a7)
4f46: 201f                     move.l     (a7)+, d0
4f48: a032                     dc.w       $a032
4f4a: 4cdf1cf8                 movem.l    (a7)+, d3-d7/a2-a4
4f4e: 4e5e                     unlk       a6
4f50: 2e9f                     move.l     (a7)+, (a7)
4f52: 4e75                     rts        
4f54: 1a44                     .byte      0x1a, 0x44
4f56: 6973                     bvs.b      $4fcb
4f58: 6162                     bsr.b      $4fbc
4f5a: 6c65                     bge.b      $4fc1
4f5c: 2054                     movea.l    (a4), a0
4f5e: 7261                     moveq      #$61, d1
4f60: 6365                     bls.b      $4fc7
4f62: 2049                     movea.l    a1, a0
4f64: 6e73                     bgt.b      $4fd9
4f66: 7472                     moveq      #$72, d2
4f68: 7563                     .byte      0x75, 0x63
4f6a: 7469                     moveq      #$69, d2
4f6c: 6f6e                     ble.b      $4fdc
4f6e: 7316                     .byte      0x73, 0x16
4f70: 1045                     .byte      0x10, 0x45
4f72: 6e61                     bgt.b      $4fd5
4f74: 626c                     bhi.b      $4fe2
4f76: 6520                     bcs.b      $4f98
4f78: 4465                     neg.w      -(a5)
4f7a: 6275                     bhi.b      $4ff1
4f7c: 6767                     beq.b      $4fe5
4f7e: 696e                     bvs.b      $4fee
4f80: 6716                     beq.b      $4f98
4f82: 0550                     bchg.b     d2, (a0)
4f84: 6175                     bsr.b      $4ffb
4f86: 7365                     .byte      0x73, 0x65
4f88: 043030303016             subi.b     #$30, $16(a0, d3.w)
4f8e: 1045                     .byte      0x10, 0x45
4f90: 6e61                     bgt.b      $4ff3
4f92: 626c                     bhi.b      $5000
4f94: 6520                     bcs.b      $4fb6
4f96: 4465                     neg.w      -(a5)
4f98: 6275                     bhi.b      $500f
4f9a: 6767                     beq.b      $5003
4f9c: 696e                     bvs.b      $500c
4f9e: 6716                     beq.b      $4fb6
4fa0: 0843                     .byte      0x08, 0x43
4fa2: 6f6e                     ble.b      $5012
4fa4: 7469                     moveq      #$69, d2
4fa6: 6e75                     bgt.b      $501d
4fa8: 6516                     bcs.b      $4fc0
4faa: 1a44                     .byte      0x1a, 0x44
4fac: 6973                     bvs.b      $5021
4fae: 6162                     bsr.b      $5012
4fb0: 6c65                     bge.b      $5017
4fb2: 2054                     movea.l    (a4), a0
4fb4: 7261                     moveq      #$61, d1
4fb6: 6365                     bls.b      $501d
4fb8: 2049                     movea.l    a1, a0
4fba: 6e73                     bgt.b      $502f
4fbc: 7472                     moveq      #$72, d2
4fbe: 7563                     .byte      0x75, 0x63
4fc0: 7469                     moveq      #$69, d2
4fc2: 6f6e                     ble.b      $5032
4fc4: 7316                     .byte      0x73, 0x16
4fc6: 11446973                 move.b     d4, $6973(a0)
4fca: 6162                     bsr.b      $502e
4fcc: 6c65                     bge.b      $5033
4fce: 2044                     movea.l    d4, a0
4fd0: 6562                     bcs.b      $5034
4fd2: 7567                     .byte      0x75, 0x67
4fd4: 6769                     beq.b      $503f
4fd6: 6e67                     bgt.b      $503f
4fd8: 0c416363                 cmpi.w     #$6363, d1
4fdc: 756d                     .byte      0x75, 0x6d
4fde: 756c                     .byte      0x75, 0x6c
4fe0: 6174                     bsr.b      $5056
4fe2: 6f72                     ble.b      $5056
4fe4: 3a08                     move.w     a0, d5
4fe6: 0772616e646f             bchg.b     d3, ([$646f, a2])
4fec: 6d3a                     blt.b      $5028
4fee: 0672616461723a080644636f addi.w     #$6164, ([$3a080644, a2], $636f)
4ffa: 6e76                     bgt.b      $5072
4ffc: 3a08                     move.w     a0, d5
4ffe: 0641636f                 addi.w     #$636f, d1
5002: 6e76                     bgt.b      $507a
5004: 3a08                     move.w     a0, d5
5006: 0659636f                 addi.w     #$636f, (a1)+
500a: 6e76                     bgt.b      $5082
500c: 3a08                     move.w     a0, d5
500e: 0658636f                 addi.w     #$636f, (a0)+
5012: 6e76                     bgt.b      $508a
5014: 3a08                     move.w     a0, d5
5016: 0e74                     .byte      0x0e, 0x74
5018: 696d                     bvs.b      $5087
501a: 655f                     bcs.b      $507b
501c: 696e                     bvs.b      $508c
501e: 745f                     moveq      #$5f, d2
5020: 7866                     moveq      #$66, d4
5022: 6572                     bcs.b      $5096
5024: 3a08                     move.w     a0, d5
5026: 0e74                     .byte      0x0e, 0x74
5028: 696d                     bvs.b      $5097
502a: 655f                     bcs.b      $508b
502c: 696e                     bvs.b      $509c
502e: 745f                     moveq      #$5f, d2
5030: 6d61                     blt.b      $5093
5032: 736b                     .byte      0x73, 0x6b
5034: 3a08                     move.w     a0, d5
5036: 0b6e756d                 bchg.b     d5, $756d(a6)
503a: 5f726f626f74733a         subq.w     #$7, ([$6f74, a2], $733a)
5042: 06636c6f                 addi.w     #$6c6f, -(a3)
5046: 616b                     bsr.b      $50b3
5048: 3a08                     move.w     a0, d5
504a: 0566                     bchg.b     d2, -(a6)
504c: 7565                     .byte      0x75, 0x65
504e: 6c3a                     bge.b      $508a
5050: 0764                     bchg.b     d3, -(a4)
5052: 6972                     bvs.b      $50c6
5054: 6563                     bcs.b      $50b9
5056: 743a                     moveq      #$3a, d2
5058: 0673706565643a08         addi.w     #$7065, $3a08(a3, invalid.w)
5060: 0764                     bchg.b     d3, -(a4)
5062: 616d                     bsr.b      $50d1
5064: 6167                     bsr.b      $50cd
5066: 653a                     bcs.b      $50a2
5068: 0573686f                 bchg.b     d2, $6f(a3, d6.l)
506c: 743a                     moveq      #$3a, d2
506e: 0461696d                 subi.w     #$696d, -(a1)
5072: 3a08                     move.w     a0, d5
5074: 04466972                 subi.w     #$6972, d6
5078: 6516                     bcs.b      $5090
507a: 0943                     bchg.b     d4, d3
507c: 6f6c                     ble.b      $50ea
507e: 6c69                     bge.b      $50e9
5080: 7369                     .byte      0x73, 0x69
5082: 6f6e                     ble.b      $50f2
5084: 0544                     bchg.b     d2, d4
5086: 6561                     bcs.b      $50e9
5088: 7468                     moveq      #$68, d2
508a: 0945                     bchg.b     d4, d5
508c: 7870                     moveq      #$70, d4
508e: 6c6f                     bge.b      $50ff
5090: 7369                     .byte      0x73, 0x69
5092: 6f6e                     ble.b      $5102
5094: 0c436f6d                 cmpi.w     #$6f6d, d3
5098: 7069                     moveq      #$69, d0
509a: 6c69                     bge.b      $5105
509c: 6e67                     bgt.b      $5105
509e: 2e2e2e16                 move.l     $2e16(a6), d7
50a2: 0c436f6d                 cmpi.w     #$6f6d, d3
50a6: 7069                     moveq      #$69, d0
50a8: 6c69                     bge.b      $5113
50aa: 6e67                     bgt.b      $5113
50ac: 2e2e2e16                 move.l     $2e16(a6), d7
