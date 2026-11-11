; CODE 4, 21546 bytes, resource-relative hexadecimal offsets.
; Linear sweep: embedded data may decode as instructions. Verify control flow.
0004: 4e560000                 link.w     a6, #$0
0008: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
000c: 302df906                 move.w     -$6fa(a5), d0
0010: 0640000f                 addi.w     #$f, d0
0014: 3f00                     move.w     d0, -(a7)
0016: 4227                     clr.b      -(a7)
0018: a945                     dc.w       $a945
001a: 3b6e0008f906             move.w     $8(a6), -$6fa(a5)
0020: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
0024: 302df906                 move.w     -$6fa(a5), d0
0028: 0640000f                 addi.w     #$f, d0
002c: 3f00                     move.w     d0, -(a7)
002e: 1f3c0001                 move.b     #$1, -(a7)
0032: a945                     dc.w       $a945
0034: 4e5e                     unlk       a6
0036: 205f                     movea.l    (a7)+, a0
0038: 544f                     addq.w     #$2, a7
003a: 4ed0                     jmp        (a0)
003c: 102df91c                 move.b     -$6e4(a5), d0
0040: 5300                     subq.b     #$1, d0
0042: 4400                     neg.b      d0
0044: 1b40f91c                 move.b     d0, -$6e4(a5)
0048: 4a2df91c                 tst.b      -$6e4(a5)
004c: 6710                     beq.b      $5e
004e: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
0052: 3f3c000c                 move.w     #$c, -(a7)
0056: 487a0028                 pea.l      $80(pc)
005a: a947                     dc.w       $a947
005c: 6012                     bra.b      $70
005e: 4ead01ba                 jsr        $1ba(a5) ; CODE 1 resource+0x07d4
0062: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
0066: 3f3c000c                 move.w     #$c, -(a7)
006a: 487a0006                 pea.l      $72(pc)
006e: a947                     dc.w       $a947
0070: 4e75                     rts        
0072: 0d54                     bchg.b     d6, (a4)
0074: 7572                     .byte      0x75, 0x72
0076: 6e20                     bgt.b      $98
0078: 536f756e                 subq.w     #$1, $756e(a7)
007c: 6420                     bcc.b      $9e
007e: 4f6e                     .byte      0x4f, 0x6e
0080: 0e54                     .byte      0x0e, 0x54
0082: 7572                     .byte      0x75, 0x72
0084: 6e20                     bgt.b      $a6
0086: 536f756e                 subq.w     #$1, $756e(a7)
008a: 6420                     bcc.b      $ac
008c: 4f66                     .byte      0x4f, 0x66
008e: 6616                     bne.b      $a6
0090: 102df91d                 move.b     -$6e3(a5), d0
0094: 5300                     subq.b     #$1, d0
0096: 4400                     neg.b      d0
0098: 1b40f91d                 move.b     d0, -$6e3(a5)
009c: 4a2df91d                 tst.b      -$6e3(a5)
00a0: 6710                     beq.b      $b2
00a2: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
00a6: 3f3c000d                 move.w     #$d, -(a7)
00aa: 487a0028                 pea.l      $d4(pc)
00ae: a947                     dc.w       $a947
00b0: 600e                     bra.b      $c0
00b2: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
00b6: 3f3c000d                 move.w     #$d, -(a7)
00ba: 487a0006                 pea.l      $c2(pc)
00be: a947                     dc.w       $a947
00c0: 4e75                     rts        
00c2: 11526564                 move.b     (a2), $6564(a0)
00c6: 7563                     .byte      0x75, 0x63
00c8: 6564                     bcs.b      $12e
00ca: 2041                     movea.l    d1, a0
00cc: 6e69                     bgt.b      $137
00ce: 6d61                     blt.b      $131
00d0: 7469                     moveq      #$69, d2
00d2: 6f6e                     ble.b      $142
00d4: 0e46                     .byte      0x0e, 0x46
00d6: 756c                     .byte      0x75, 0x6c
00d8: 6c20                     bge.b      $fa
00da: 416e                     .byte      0x41, 0x6e
00dc: 696d                     bvs.b      $14b
00de: 6174                     bsr.b      $154
00e0: 696f                     bvs.b      $151
00e2: 6e16                     bgt.b      $fa
00e4: 4e56ffdc                 link.w     a6, #$ffdc
00e8: 48e70018                 movem.l    a3-a4, -(a7)
00ec: 286dbdcc                 movea.l    -$4234(a5), a4
00f0: 594f                     subq.w     #$4, a7
00f2: 2f0c                     move.l     a4, -(a7)
00f4: a917                     dc.w       $a917
00f6: 265f                     movea.l    (a7)+, a3
00f8: 486effec                 pea.l      -$14(a6)
00fc: a874                     dc.w       $a874
00fe: 2f0c                     move.l     a4, -(a7)
0100: a873                     dc.w       $a873
0102: 2f0c                     move.l     a4, -(a7)
0104: a922                     dc.w       $a922
0106: 486c0010                 pea.l      $10(a4)
010a: a8a3                     dc.w       $a8a3
010c: 2f0c                     move.l     a4, -(a7)
010e: a969                     dc.w       $a969
0110: 2053                     movea.l    (a3), a0
0112: 4a10                     tst.b      (a0)
0114: 57c0                     seq.b      d0
0116: 2053                     movea.l    (a3), a0
0118: 0c100001                 cmpi.b     #$1, (a0)
011c: 57c1                     seq.b      d1
011e: 8001                     or.b       d1, d0
0120: 6718                     beq.b      $13a
0122: 2f0c                     move.l     a4, -(a7)
0124: a904                     dc.w       $a904
0126: 2053                     movea.l    (a3), a0
0128: 20680002                 movea.l    $2(a0), a0
012c: 2050                     movea.l    (a0), a0
012e: 48680008                 pea.l      $8(a0)
0132: 2053                     movea.l    (a3), a0
0134: 2f280002                 move.l     $2(a0), -(a7)
0138: a9d3                     dc.w       $a9d3
013a: 2f0c                     move.l     a4, -(a7)
013c: a923                     dc.w       $a923
013e: 2f2effec                 move.l     -$14(a6), -(a7)
0142: a873                     dc.w       $a873
0144: 4cdf1800                 movem.l    (a7)+, a3-a4
0148: 4e5e                     unlk       a6
014a: 4e75                     rts        
014c: 4e560000                 link.w     a6, #$0
0150: 4a2e0008                 tst.b      $8(a6)
0154: 670c                     beq.b      $162
0156: 2f2e000c                 move.l     $c(a6), -(a7)
015a: 3f2e000a                 move.w     $a(a6), -(a7)
015e: a939                     dc.w       $a939
0160: 600a                     bra.b      $16c
0162: 2f2e000c                 move.l     $c(a6), -(a7)
0166: 3f2e000a                 move.w     $a(a6), -(a7)
016a: a93a                     dc.w       $a93a
016c: 4e5e                     unlk       a6
016e: 205f                     movea.l    (a7)+, a0
0170: 504f                     addq.w     #$8, a7
0172: 4ed0                     jmp        (a0)
0174: 4e56ffec                 link.w     a6, #$ffec
0178: 2f0c                     move.l     a4, -(a7)
017a: 2d6e0008ffec             move.l     $8(a6), -$14(a6)
0180: 2f2dc02a                 move.l     -$3fd6(a5), -(a7)
0184: 205f                     movea.l    (a7)+, a0
0186: a029                     dc.w       $a029
0188: 206dc02a                 movea.l    -$3fd6(a5), a0
018c: 2850                     movea.l    (a0), a4
018e: 2f2c0204                 move.l     $204(a4), -(a7)
0192: 486c0002                 pea.l      $2(a4)
0196: a990                     dc.w       $a990
0198: 2f2c0208                 move.l     $208(a4), -(a7)
019c: 486c0102                 pea.l      $102(a4)
01a0: a990                     dc.w       $a990
01a2: 4a2dbdb6                 tst.b      -$424a(a5)
01a6: 670c                     beq.b      $1b4
01a8: 2f2dbe02                 move.l     -$41fe(a5), -(a7)
01ac: 3f3c0002                 move.w     #$2, -(a7)
01b0: a93a                     dc.w       $a93a
01b2: 6016                     bra.b      $1ca
01b4: 2f2dbe02                 move.l     -$41fe(a5), -(a7)
01b8: 3f3c0002                 move.w     #$2, -(a7)
01bc: 4a2c0002                 tst.b      $2(a4)
01c0: 56c0                     sne.b      d0
01c2: 4400                     neg.b      d0
01c4: 1f00                     move.b     d0, -(a7)
01c6: 4ebaff84                 jsr        $14c(pc)
01ca: 1014                     move.b     (a4), d0
01cc: 600000ac                 bra.w      $27a
01d0: 2f2e0008                 move.l     $8(a6), -(a7)
01d4: 3f3c0001                 move.w     #$1, -(a7)
01d8: 4a2c0002                 tst.b      $2(a4)
01dc: 56c0                     sne.b      d0
01de: c02dbdb7                 and.b      -$4249(a5), d0
01e2: 1f00                     move.b     d0, -(a7)
01e4: 4eba0856                 jsr        $a3c(pc)
01e8: 4a2c0002                 tst.b      $2(a4)
01ec: 670c                     beq.b      $1fa
01ee: 2f2c0214                 move.l     $214(a4), -(a7)
01f2: 4267                     clr.w      -(a7)
01f4: a95d                     dc.w       $a95d
01f6: 6000008c                 bra.w      $284
01fa: 2f2c0214                 move.l     $214(a4), -(a7)
01fe: 3f3c00ff                 move.w     #$ff, -(a7)
0202: a95d                     dc.w       $a95d
0204: 6000007e                 bra.w      $284
0208: 2f2e0008                 move.l     $8(a6), -(a7)
020c: 3f3c0001                 move.w     #$1, -(a7)
0210: 4a2c0002                 tst.b      $2(a4)
0214: 56c0                     sne.b      d0
0216: c02dbdb7                 and.b      -$4249(a5), d0
021a: 1f00                     move.b     d0, -(a7)
021c: 4eba081e                 jsr        $a3c(pc)
0220: 4a2c0002                 tst.b      $2(a4)
0224: 6712                     beq.b      $238
0226: 2f2c0214                 move.l     $214(a4), -(a7)
022a: 4267                     clr.w      -(a7)
022c: a95d                     dc.w       $a95d
022e: 2f2c0220                 move.l     $220(a4), -(a7)
0232: 4267                     clr.w      -(a7)
0234: a95d                     dc.w       $a95d
0236: 6014                     bra.b      $24c
0238: 2f2c0214                 move.l     $214(a4), -(a7)
023c: 3f3c00ff                 move.w     #$ff, -(a7)
0240: a95d                     dc.w       $a95d
0242: 2f2c0220                 move.l     $220(a4), -(a7)
0246: 3f3c00ff                 move.w     #$ff, -(a7)
024a: a95d                     dc.w       $a95d
024c: 4a2c0203                 tst.b      $203(a4)
0250: 6712                     beq.b      $264
0252: 2f2c0218                 move.l     $218(a4), -(a7)
0256: 4267                     clr.w      -(a7)
0258: a95d                     dc.w       $a95d
025a: 2f2c021c                 move.l     $21c(a4), -(a7)
025e: 4267                     clr.w      -(a7)
0260: a95d                     dc.w       $a95d
0262: 6020                     bra.b      $284
0264: 2f2c0218                 move.l     $218(a4), -(a7)
0268: 3f3c00ff                 move.w     #$ff, -(a7)
026c: a95d                     dc.w       $a95d
026e: 2f2c021c                 move.l     $21c(a4), -(a7)
0272: 3f3c00ff                 move.w     #$ff, -(a7)
0276: a95d                     dc.w       $a95d
0278: 600a                     bra.b      $284
027a: 5500                     subq.b     #$2, d0
027c: 6700ff52                 beq.w      $1d0
0280: 5300                     subq.b     #$1, d0
0282: 6784                     beq.b      $208
0284: 2f2dc02a                 move.l     -$3fd6(a5), -(a7)
0288: 205f                     movea.l    (a7)+, a0
028a: a02a                     dc.w       $a02a
028c: 285f                     movea.l    (a7)+, a4
028e: 4e5e                     unlk       a6
0290: 2e9f                     move.l     (a7)+, (a7)
0292: 4e75                     rts        
0294: 4e56ffe4                 link.w     a6, #$ffe4
0298: 48e70318                 movem.l    d6-d7/a3-a4, -(a7)
029c: 4206                     clr.b      d6
029e: 206dc030                 movea.l    -$3fd0(a5), a0
02a2: 2050                     movea.l    (a0), a0
02a4: 0c100002                 cmpi.b     #$2, (a0)
02a8: 57c0                     seq.b      d0
02aa: 206dc030                 movea.l    -$3fd0(a5), a0
02ae: 2050                     movea.l    (a0), a0
02b0: 0c100003                 cmpi.b     #$3, (a0)
02b4: 57c1                     seq.b      d1
02b6: 8001                     or.b       d1, d0
02b8: 6722                     beq.b      $2dc
02ba: 266dbe2a                 movea.l    -$41d6(a5), a3
02be: 2f2b00a0                 move.l     $a0(a3), -(a7)
02c2: 205f                     movea.l    (a7)+, a0
02c4: a029                     dc.w       $a029
02c6: 206b00a0                 movea.l    $a0(a3), a0
02ca: 2850                     movea.l    (a0), a4
02cc: 3e2c0020                 move.w     $20(a4), d7
02d0: be6c0022                 cmp.w      $22(a4), d7
02d4: 56c0                     sne.b      d0
02d6: 4400                     neg.b      d0
02d8: 1e00                     move.b     d0, d7
02da: 6038                     bra.b      $314
02dc: 206dc030                 movea.l    -$3fd0(a5), a0
02e0: 2050                     movea.l    (a0), a0
02e2: 2f280002                 move.l     $2(a0), -(a7)
02e6: 205f                     movea.l    (a7)+, a0
02e8: a029                     dc.w       $a029
02ea: 206dc030                 movea.l    -$3fd0(a5), a0
02ee: 2050                     movea.l    (a0), a0
02f0: 20680002                 movea.l    $2(a0), a0
02f4: 2850                     movea.l    (a0), a4
02f6: 3e2c0020                 move.w     $20(a4), d7
02fa: be6c0022                 cmp.w      $22(a4), d7
02fe: 56c0                     sne.b      d0
0300: c02dbdb6                 and.b      -$424a(a5), d0
0304: 1e00                     move.b     d0, d7
0306: 206dc030                 movea.l    -$3fd0(a5), a0
030a: 2050                     movea.l    (a0), a0
030c: 2f280002                 move.l     $2(a0), -(a7)
0310: 205f                     movea.l    (a7)+, a0
0312: a02a                     dc.w       $a02a
0314: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
0318: 3f3c0003                 move.w     #$3, -(a7)
031c: 1f07                     move.b     d7, -(a7)
031e: 4ebafe2c                 jsr        $14c(pc)
0322: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
0326: 3f3c0004                 move.w     #$4, -(a7)
032a: 1f07                     move.b     d7, -(a7)
032c: 4ebafe1e                 jsr        $14c(pc)
0330: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
0334: 3f3c0006                 move.w     #$6, -(a7)
0338: 1f07                     move.b     d7, -(a7)
033a: 4ebafe10                 jsr        $14c(pc)
033e: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
0342: 3f3c0005                 move.w     #$5, -(a7)
0346: 594f                     subq.w     #$4, a7
0348: 4ead022a                 jsr        $22a(a5) ; CODE 1 resource+0x0992
034c: 4a9f                     tst.l      (a7)+
034e: 56c0                     sne.b      d0
0350: 122dbdb6                 move.b     -$424a(a5), d1
0354: 822dbdb7                 or.b       -$4249(a5), d1
0358: c001                     and.b      d1, d0
035a: 1f00                     move.b     d0, -(a7)
035c: 4ebafdee                 jsr        $14c(pc)
0360: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
0364: 3f3c0007                 move.w     #$7, -(a7)
0368: 102dbdb6                 move.b     -$424a(a5), d0
036c: 802dbdb7                 or.b       -$4249(a5), d0
0370: 1f00                     move.b     d0, -(a7)
0372: 4ebafdd8                 jsr        $14c(pc)
0376: 4cdf18c0                 movem.l    (a7)+, d6-d7/a3-a4
037a: 4e5e                     unlk       a6
037c: 4e75                     rts        
037e: 4e56ffea                 link.w     a6, #$ffea
0382: 48e70138                 movem.l    d7/a2-a4, -(a7)
0386: 246e0008                 movea.l    $8(a6), a2
038a: 2f0a                     move.l     a2, -(a7)
038c: 205f                     movea.l    (a7)+, a0
038e: a029                     dc.w       $a029
0390: 2852                     movea.l    (a2), a4
0392: 3e2c005e                 move.w     $5e(a4), d7
0396: 266c003e                 movea.l    $3e(a4), a3
039a: 4a6c003c                 tst.w      $3c(a4)
039e: 6f16                     ble.b      $3b6
03a0: 2053                     movea.l    (a3), a0
03a2: 302c003c                 move.w     $3c(a4), d0
03a6: 5340                     subq.w     #$1, d0
03a8: 7200                     moveq      #$0, d1
03aa: 12300000                 move.b     (a0, d0.w), d1
03ae: b26dbdba                 cmp.w      -$4246(a5), d1
03b2: 6602                     bne.b      $3b6
03b4: 5247                     addq.w     #$1, d7
03b6: 3d47000c                 move.w     d7, $c(a6)
03ba: 2f0a                     move.l     a2, -(a7)
03bc: 205f                     movea.l    (a7)+, a0
03be: a02a                     dc.w       $a02a
03c0: 4cdf1c80                 movem.l    (a7)+, d7/a2-a4
03c4: 4e5e                     unlk       a6
03c6: 2e9f                     move.l     (a7)+, (a7)
03c8: 4e75                     rts        
03ca: 4e56ffec                 link.w     a6, #$ffec
03ce: 48e70700                 movem.l    d5-d7, -(a7)
03d2: 2a2e0008                 move.l     $8(a6), d5
03d6: 554f                     subq.w     #$2, a7
03d8: 2f05                     move.l     d5, -(a7)
03da: 4ebaffa2                 jsr        $37e(pc)
03de: 3e1f                     move.w     (a7)+, d7
03e0: 4206                     clr.b      d6
03e2: 5347                     subq.w     #$1, d7
03e4: 4a47                     tst.w      d7
03e6: 6c06                     bge.b      $3ee
03e8: 4247                     clr.w      d7
03ea: 7c01                     moveq      #$1, d6
03ec: 6018                     bra.b      $406
03ee: 2045                     movea.l    d5, a0
03f0: 2050                     movea.l    (a0), a0
03f2: 2245                     movea.l    d5, a1
03f4: 2251                     movea.l    (a1), a1
03f6: 3007                     move.w     d7, d0
03f8: d040                     add.w      d0, d0
03fa: 32280020                 move.w     $20(a0), d1
03fe: b2710060                 cmp.w      $60(a1, d0.w), d1
0402: 6d02                     blt.b      $406
0404: 7c01                     moveq      #$1, d6
0406: 4a06                     tst.b      d6
0408: 67d8                     beq.b      $3e2
040a: 3d47000c                 move.w     d7, $c(a6)
040e: 4cdf00e0                 movem.l    (a7)+, d5-d7
0412: 4e5e                     unlk       a6
0414: 2e9f                     move.l     (a7)+, (a7)
0416: 4e75                     rts        
0418: 4e560000                 link.w     a6, #$0
041c: 206e0008                 movea.l    $8(a6), a0
0420: 2050                     movea.l    (a0), a0
0422: 2f08                     move.l     a0, -(a7)
0424: 554f                     subq.w     #$2, a7
0426: 2f2e0008                 move.l     $8(a6), -(a7)
042a: 4ebaff9e                 jsr        $3ca(pc)
042e: 301f                     move.w     (a7)+, d0
0430: 205f                     movea.l    (a7)+, a0
0432: d040                     add.w      d0, d0
0434: 3d700060000c             move.w     $60(a0, d0.w), $c(a6)
043a: 4e5e                     unlk       a6
043c: 2e9f                     move.l     (a7)+, (a7)
043e: 4e75                     rts        
0440: 4e56ffec                 link.w     a6, #$ffec
0444: 48e70338                 movem.l    d6-d7/a2-a4, -(a7)
0448: 286e0010                 movea.l    $10(a6), a4
044c: 266e0008                 movea.l    $8(a6), a3
0450: 246e000c                 movea.l    $c(a6), a2
0454: 554f                     subq.w     #$2, a7
0456: 2f0c                     move.l     a4, -(a7)
0458: 4ebaff24                 jsr        $37e(pc)
045c: 3c1f                     move.w     (a7)+, d6
045e: 4247                     clr.w      d7
0460: 4252                     clr.w      (a2)
0462: 4253                     clr.w      (a3)
0464: 554f                     subq.w     #$2, a7
0466: 2f0c                     move.l     a4, -(a7)
0468: 4ebaffae                 jsr        $418(pc)
046c: 2054                     movea.l    (a4), a0
046e: 315f0020                 move.w     (a7)+, $20(a0)
0472: 6002                     bra.b      $476
0474: 5247                     addq.w     #$1, d7
0476: 2054                     movea.l    (a4), a0
0478: 3007                     move.w     d7, d0
047a: d040                     add.w      d0, d0
047c: 2254                     movea.l    (a4), a1
047e: 30300060                 move.w     $60(a0, d0.w), d0
0482: b0690020                 cmp.w      $20(a1), d0
0486: 6dec                     blt.b      $474
0488: 3487                     move.w     d7, (a2)
048a: 2054                     movea.l    (a4), a0
048c: 2254                     movea.l    (a4), a1
048e: 30280020                 move.w     $20(a0), d0
0492: b0690022                 cmp.w      $22(a1), d0
0496: 57c0                     seq.b      d0
0498: 0c460001                 cmpi.w     #$1, d6
049c: 5ec1                     sgt.b      d1
049e: c001                     and.b      d1, d0
04a0: 6748                     beq.b      $4ea
04a2: 3692                     move.w     (a2), (a3)
04a4: 3006                     move.w     d6, d0
04a6: 5340                     subq.w     #$1, d0
04a8: be40                     cmp.w      d0, d7
04aa: 6c14                     bge.b      $4c0
04ac: 2054                     movea.l    (a4), a0
04ae: 3007                     move.w     d7, d0
04b0: 5240                     addq.w     #$1, d0
04b2: d040                     add.w      d0, d0
04b4: 2254                     movea.l    (a4), a1
04b6: 337000600022             move.w     $60(a0, d0.w), $22(a1)
04bc: 60000082                 bra.w      $540
04c0: 2054                     movea.l    (a4), a0
04c2: 2254                     movea.l    (a4), a1
04c4: 3028003c                 move.w     $3c(a0), d0
04c8: b0690020                 cmp.w      $20(a1), d0
04cc: 6710                     beq.b      $4de
04ce: 2054                     movea.l    (a4), a0
04d0: 3007                     move.w     d7, d0
04d2: d040                     add.w      d0, d0
04d4: 2254                     movea.l    (a4), a1
04d6: 337000600022             move.w     $60(a0, d0.w), $22(a1)
04dc: 6062                     bra.b      $540
04de: 3012                     move.w     (a2), d0
04e0: 5340                     subq.w     #$1, d0
04e2: 3680                     move.w     d0, (a3)
04e4: 605a                     bra.b      $540
04e6: 6002                     bra.b      $4ea
04e8: 5247                     addq.w     #$1, d7
04ea: 2054                     movea.l    (a4), a0
04ec: 3007                     move.w     d7, d0
04ee: d040                     add.w      d0, d0
04f0: 2254                     movea.l    (a4), a1
04f2: 30300060                 move.w     $60(a0, d0.w), d0
04f6: b0690022                 cmp.w      $22(a1), d0
04fa: 5dc0                     slt.b      d0
04fc: be46                     cmp.w      d6, d7
04fe: 5dc1                     slt.b      d1
0500: c001                     and.b      d1, d0
0502: 66e4                     bne.b      $4e8
0504: be46                     cmp.w      d6, d7
0506: 57c0                     seq.b      d0
0508: 2054                     movea.l    (a4), a0
050a: 3206                     move.w     d6, d1
050c: d241                     add.w      d1, d1
050e: 2254                     movea.l    (a4), a1
0510: 32301060                 move.w     $60(a0, d1.w), d1
0514: b2690022                 cmp.w      $22(a1), d1
0518: 5dc1                     slt.b      d1
051a: c001                     and.b      d1, d0
051c: 670e                     beq.b      $52c
051e: 3687                     move.w     d7, (a3)
0520: 2054                     movea.l    (a4), a0
0522: 2254                     movea.l    (a4), a1
0524: 3368003c0022             move.w     $3c(a0), $22(a1)
052a: 6014                     bra.b      $540
052c: 3007                     move.w     d7, d0
052e: 5340                     subq.w     #$1, d0
0530: 3680                     move.w     d0, (a3)
0532: 2054                     movea.l    (a4), a0
0534: 3007                     move.w     d7, d0
0536: d040                     add.w      d0, d0
0538: 2254                     movea.l    (a4), a1
053a: 337000600022             move.w     $60(a0, d0.w), $22(a1)
0540: 4cdf1cc0                 movem.l    (a7)+, d6-d7/a2-a4
0544: 4e5e                     unlk       a6
0546: 205f                     movea.l    (a7)+, a0
0548: 4fef000c                 lea.l      $c(a7), a7
054c: 4ed0                     jmp        (a0)
054e: 4e56ffde                 link.w     a6, #$ffde
0552: 48e70108                 movem.l    d7/a4, -(a7)
0556: 7e01                     moveq      #$1, d7
0558: 4aadc030                 tst.l      -$3fd0(a5)
055c: 56c0                     sne.b      d0
055e: 2f00                     move.l     d0, -(a7)
0560: 594f                     subq.w     #$4, a7
0562: a924                     dc.w       $a924
0564: 221f                     move.l     (a7)+, d1
0566: 201f                     move.l     (a7)+, d0
0568: 4a81                     tst.l      d1
056a: 56c1                     sne.b      d1
056c: c001                     and.b      d1, d0
056e: 670000aa                 beq.w      $61a
0572: 486effec                 pea.l      -$14(a6)
0576: a972                     dc.w       $a972
0578: 206dc030                 movea.l    -$3fd0(a5), a0
057c: 2050                     movea.l    (a0), a0
057e: 4a10                     tst.b      (a0)
0580: 662a                     bne.b      $5ac
0582: 206dc030                 movea.l    -$3fd0(a5), a0
0586: 2050                     movea.l    (a0), a0
0588: 2f280002                 move.l     $2(a0), -(a7)
058c: a9da                     dc.w       $a9da
058e: 206dc030                 movea.l    -$3fd0(a5), a0
0592: 2050                     movea.l    (a0), a0
0594: 20680002                 movea.l    $2(a0), a0
0598: 2050                     movea.l    (a0), a0
059a: 41e80008                 lea.l      $8(a0), a0
059e: 43eeffe4                 lea.l      -$1c(a6), a1
05a2: 22d8                     move.l     (a0)+, (a1)+
05a4: 22d8                     move.l     (a0)+, (a1)+
05a6: 426effe6                 clr.w      -$1a(a6)
05aa: 6036                     bra.b      $5e2
05ac: 206dc030                 movea.l    -$3fd0(a5), a0
05b0: 2050                     movea.l    (a0), a0
05b2: 0c100002                 cmpi.b     #$2, (a0)
05b6: 57c0                     seq.b      d0
05b8: 206dc030                 movea.l    -$3fd0(a5), a0
05bc: 2050                     movea.l    (a0), a0
05be: 0c100003                 cmpi.b     #$3, (a0)
05c2: 57c1                     seq.b      d1
05c4: 8001                     or.b       d1, d0
05c6: 6718                     beq.b      $5e0
05c8: 286dbe2a                 movea.l    -$41d6(a5), a4
05cc: 206c00a0                 movea.l    $a0(a4), a0
05d0: 2050                     movea.l    (a0), a0
05d2: 41e80008                 lea.l      $8(a0), a0
05d6: 43eeffe4                 lea.l      -$1c(a6), a1
05da: 22d8                     move.l     (a0)+, (a1)+
05dc: 22d8                     move.l     (a0)+, (a1)+
05de: 6002                     bra.b      $5e2
05e0: 4207                     clr.b      d7
05e2: 4a07                     tst.b      d7
05e4: 6734                     beq.b      $61a
05e6: 554f                     subq.w     #$2, a7
05e8: 2f2effec                 move.l     -$14(a6), -(a7)
05ec: 486effe4                 pea.l      -$1c(a6)
05f0: a8ad                     dc.w       $a8ad
05f2: 4a1f                     tst.b      (a7)+
05f4: 6718                     beq.b      $60e
05f6: 102dbdb8                 move.b     -$4248(a5), d0
05fa: 5300                     subq.b     #$1, d0
05fc: 671c                     beq.b      $61a
05fe: 206dbdc2                 movea.l    -$423e(a5), a0
0602: 2f10                     move.l     (a0), -(a7)
0604: a851                     dc.w       $a851
0606: 1b7c0001bdb8             move.b     #$1, -$4248(a5)
060c: 600c                     bra.b      $61a
060e: 4a2dbdb8                 tst.b      -$4248(a5)
0612: 6706                     beq.b      $61a
0614: a850                     dc.w       $a850
0616: 422dbdb8                 clr.b      -$4248(a5)
061a: 4cdf1080                 movem.l    (a7)+, d7/a4
061e: 4e5e                     unlk       a6
0620: 4e75                     rts        
0622: 4e56ffd6                 link.w     a6, #$ffd6
0626: 48e71f18                 movem.l    d3-d7/a3-a4, -(a7)
062a: 286e000a                 movea.l    $a(a6), a4
062e: 2f0c                     move.l     a4, -(a7)
0630: a9d9                     dc.w       $a9d9
0632: 4246                     clr.w      d6
0634: 2f0c                     move.l     a4, -(a7)
0636: 486effec                 pea.l      -$14(a6)
063a: 486effea                 pea.l      -$16(a6)
063e: 4ebafe00                 jsr        $440(pc)
0642: 2054                     movea.l    (a4), a0
0644: 2668003e                 movea.l    $3e(a0), a3
0648: 2054                     movea.l    (a4), a0
064a: 36280020                 move.w     $20(a0), d3
064e: 48c3                     ext.l      d3
0650: 2054                     movea.l    (a4), a0
0652: 38280022                 move.w     $22(a0), d4
0656: 48c4                     ext.l      d4
0658: 3d6effeaffd6             move.w     -$16(a6), -$2a(a6)
065e: 3e2effec                 move.w     -$14(a6), d7
0662: 603c                     bra.b      $6a0
0664: 2053                     movea.l    (a3), a0
0666: 2254                     movea.l    (a4), a1
0668: 3007                     move.w     d7, d0
066a: d040                     add.w      d0, d0
066c: 30310060                 move.w     $60(a1, d0.w), d0
0670: 7200                     moveq      #$0, d1
0672: 12300000                 move.b     (a0, d0.w), d1
0676: b26e0008                 cmp.w      $8(a6), d1
067a: 6620                     bne.b      $69c
067c: 2054                     movea.l    (a4), a0
067e: 3a07                     move.w     d7, d5
0680: da45                     add.w      d5, d5
0682: 30305060                 move.w     $60(a0, d5.w), d0
0686: 48c0                     ext.l      d0
0688: 2a00                     move.l     d0, d5
068a: 2f05                     move.l     d5, -(a7)
068c: 2005                     move.l     d5, d0
068e: 5280                     addq.l     #$1, d0
0690: 2f00                     move.l     d0, -(a7)
0692: 2f0c                     move.l     a4, -(a7)
0694: a9d1                     dc.w       $a9d1
0696: 2f0c                     move.l     a4, -(a7)
0698: a9d7                     dc.w       $a9d7
069a: 5246                     addq.w     #$1, d6
069c: 5247                     addq.w     #$1, d7
069e: 6906                     bvs.b      $6a6
06a0: be6effd6                 cmp.w      -$2a(a6), d7
06a4: 6fbe                     ble.b      $664
06a6: 2f03                     move.l     d3, -(a7)
06a8: 3006                     move.w     d6, d0
06aa: 48c0                     ext.l      d0
06ac: 2204                     move.l     d4, d1
06ae: 9280                     sub.l      d0, d1
06b0: 2f01                     move.l     d1, -(a7)
06b2: 2f0c                     move.l     a4, -(a7)
06b4: a9d1                     dc.w       $a9d1
06b6: 2f0c                     move.l     a4, -(a7)
06b8: a9d8                     dc.w       $a9d8
06ba: 206dc030                 movea.l    -$3fd0(a5), a0
06be: 2050                     movea.l    (a0), a0
06c0: 117c0001000a             move.b     #$1, $a(a0)
06c6: 206dc030                 movea.l    -$3fd0(a5), a0
06ca: 2050                     movea.l    (a0), a0
06cc: 4228011a                 clr.b      $11a(a0)
06d0: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
06d4: 3f3c0005                 move.w     #$5, -(a7)
06d8: 206dc030                 movea.l    -$3fd0(a5), a0
06dc: 2050                     movea.l    (a0), a0
06de: 4a280014                 tst.b      $14(a0)
06e2: 56c0                     sne.b      d0
06e4: 4400                     neg.b      d0
06e6: 1f00                     move.b     d0, -(a7)
06e8: 4ebafa62                 jsr        $14c(pc)
06ec: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
06f0: 3f3c0007                 move.w     #$7, -(a7)
06f4: 206dc030                 movea.l    -$3fd0(a5), a0
06f8: 2050                     movea.l    (a0), a0
06fa: 4a280014                 tst.b      $14(a0)
06fe: 56c0                     sne.b      d0
0700: 4400                     neg.b      d0
0702: 1f00                     move.b     d0, -(a7)
0704: 4ebafa46                 jsr        $14c(pc)
0708: 4cdf18f8                 movem.l    (a7)+, d3-d7/a3-a4
070c: 4e5e                     unlk       a6
070e: 205f                     movea.l    (a7)+, a0
0710: 5c4f                     addq.w     #$6, a7
0712: 4ed0                     jmp        (a0)
0714: 4e56ffda                 link.w     a6, #$ffda
0718: 48e70f08                 movem.l    d4-d7/a4, -(a7)
071c: 286e000a                 movea.l    $a(a6), a4
0720: 2f0c                     move.l     a4, -(a7)
0722: a9d9                     dc.w       $a9d9
0724: 1d6e0009ffdd             move.b     $9(a6), -$23(a6)
072a: 2f0c                     move.l     a4, -(a7)
072c: 486effec                 pea.l      -$14(a6)
0730: 486effea                 pea.l      -$16(a6)
0734: 4ebafd0a                 jsr        $440(pc)
0738: 2054                     movea.l    (a4), a0
073a: 302effea                 move.w     -$16(a6), d0
073e: 906effec                 sub.w      -$14(a6), d0
0742: 5240                     addq.w     #$1, d0
0744: d068003c                 add.w      $3c(a0), d0
0748: 0c407fff                 cmpi.w     #$7fff, d0
074c: 6e0000b0                 bgt.w      $7fe
0750: 2054                     movea.l    (a4), a0
0752: 38280020                 move.w     $20(a0), d4
0756: 48c4                     ext.l      d4
0758: 2054                     movea.l    (a4), a0
075a: 3a280022                 move.w     $22(a0), d5
075e: 48c5                     ext.l      d5
0760: 3d6effeaffda             move.w     -$16(a6), -$26(a6)
0766: 3e2effec                 move.w     -$14(a6), d7
076a: 6026                     bra.b      $792
076c: 2054                     movea.l    (a4), a0
076e: 3c07                     move.w     d7, d6
0770: dc46                     add.w      d6, d6
0772: 30306060                 move.w     $60(a0, d6.w), d0
0776: 48c0                     ext.l      d0
0778: 2c00                     move.l     d0, d6
077a: 2f06                     move.l     d6, -(a7)
077c: 2f06                     move.l     d6, -(a7)
077e: 2f0c                     move.l     a4, -(a7)
0780: a9d1                     dc.w       $a9d1
0782: 486effdd                 pea.l      -$23(a6)
0786: 7001                     moveq      #$1, d0
0788: 2f00                     move.l     d0, -(a7)
078a: 2f0c                     move.l     a4, -(a7)
078c: a9de                     dc.w       $a9de
078e: 5247                     addq.w     #$1, d7
0790: 6906                     bvs.b      $798
0792: be6effda                 cmp.w      -$26(a6), d7
0796: 6fd4                     ble.b      $76c
0798: 2f04                     move.l     d4, -(a7)
079a: 302effea                 move.w     -$16(a6), d0
079e: 906effec                 sub.w      -$14(a6), d0
07a2: 5240                     addq.w     #$1, d0
07a4: 48c0                     ext.l      d0
07a6: d085                     add.l      d5, d0
07a8: 2f00                     move.l     d0, -(a7)
07aa: 2f0c                     move.l     a4, -(a7)
07ac: a9d1                     dc.w       $a9d1
07ae: 206dc030                 movea.l    -$3fd0(a5), a0
07b2: 2050                     movea.l    (a0), a0
07b4: 117c0001000a             move.b     #$1, $a(a0)
07ba: 206dc030                 movea.l    -$3fd0(a5), a0
07be: 2050                     movea.l    (a0), a0
07c0: 4228011a                 clr.b      $11a(a0)
07c4: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
07c8: 3f3c0005                 move.w     #$5, -(a7)
07cc: 206dc030                 movea.l    -$3fd0(a5), a0
07d0: 2050                     movea.l    (a0), a0
07d2: 4a280014                 tst.b      $14(a0)
07d6: 56c0                     sne.b      d0
07d8: 4400                     neg.b      d0
07da: 1f00                     move.b     d0, -(a7)
07dc: 4ebaf96e                 jsr        $14c(pc)
07e0: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
07e4: 3f3c0007                 move.w     #$7, -(a7)
07e8: 206dc030                 movea.l    -$3fd0(a5), a0
07ec: 2050                     movea.l    (a0), a0
07ee: 4a280014                 tst.b      $14(a0)
07f2: 56c0                     sne.b      d0
07f4: 4400                     neg.b      d0
07f6: 1f00                     move.b     d0, -(a7)
07f8: 4ebaf952                 jsr        $14c(pc)
07fc: 6006                     bra.b      $804
07fe: 3f3c0005                 move.w     #$5, -(a7)
0802: a9c8                     dc.w       $a9c8
0804: 2f0c                     move.l     a4, -(a7)
0806: a9d8                     dc.w       $a9d8
0808: 4cdf10f0                 movem.l    (a7)+, d4-d7/a4
080c: 4e5e                     unlk       a6
080e: 205f                     movea.l    (a7)+, a0
0810: 5c4f                     addq.w     #$6, a7
0812: 4ed0                     jmp        (a0)
0814: 4e56ffe6                 link.w     a6, #$ffe6
0818: 48e70308                 movem.l    d6-d7/a4, -(a7)
081c: 286e0008                 movea.l    $8(a6), a4
0820: 2f0c                     move.l     a4, -(a7)
0822: a9d9                     dc.w       $a9d9
0824: 2f0c                     move.l     a4, -(a7)
0826: a9d7                     dc.w       $a9d7
0828: 486effe8                 pea.l      -$18(a6)
082c: 7004                     moveq      #$4, d0
082e: 2f00                     move.l     d0, -(a7)
0830: 4ead00d2                 jsr        $d2(a5) ; CODE 1 resource+0x0170
0834: 2054                     movea.l    (a4), a0
0836: 2f08                     move.l     a0, -(a7)
0838: 554f                     subq.w     #$2, a7
083a: 2f0c                     move.l     a4, -(a7)
083c: 4ebafbda                 jsr        $418(pc)
0840: 301f                     move.w     (a7)+, d0
0842: 205f                     movea.l    (a7)+, a0
0844: 3c280020                 move.w     $20(a0), d6
0848: 9c40                     sub.w      d0, d6
084a: 48c6                     ext.l      d6
084c: 8dfc0004                 divs.w     #$4, d6
0850: 4846                     swap       d6
0852: 7004                     moveq      #$4, d0
0854: 9046                     sub.w      d6, d0
0856: 3c00                     move.w     d0, d6
0858: 3d46ffe6                 move.w     d6, -$1a(a6)
085c: 7e01                     moveq      #$1, d7
085e: 600e                     bra.b      $86e
0860: 206effe8                 movea.l    -$18(a6), a0
0864: 11bc002070ff             move.b     #$20, -$1(a0, d7.w)
086a: 5247                     addq.w     #$1, d7
086c: 6906                     bvs.b      $874
086e: be6effe6                 cmp.w      -$1a(a6), d7
0872: 6fec                     ble.b      $860
0874: 2f2effe8                 move.l     -$18(a6), -(a7)
0878: 3006                     move.w     d6, d0
087a: 48c0                     ext.l      d0
087c: 2f00                     move.l     d0, -(a7)
087e: 2f0c                     move.l     a4, -(a7)
0880: a9de                     dc.w       $a9de
0882: 486effe8                 pea.l      -$18(a6)
0886: 7004                     moveq      #$4, d0
0888: 2f00                     move.l     d0, -(a7)
088a: 4ead00b2                 jsr        $b2(a5) ; CODE 1 resource+0x004c
088e: 2f0c                     move.l     a4, -(a7)
0890: a9d8                     dc.w       $a9d8
0892: 4cdf10c0                 movem.l    (a7)+, d6-d7/a4
0896: 4e5e                     unlk       a6
0898: 2e9f                     move.l     (a7)+, (a7)
089a: 4e75                     rts        
089c: 4e56ffea                 link.w     a6, #$ffea
08a0: 48e70308                 movem.l    d6-d7/a4, -(a7)
08a4: 286e0008                 movea.l    $8(a6), a4
08a8: 2054                     movea.l    (a4), a0
08aa: 4a680020                 tst.w      $20(a0)
08ae: 67000096                 beq.w      $946
08b2: 2f0c                     move.l     a4, -(a7)
08b4: a9d9                     dc.w       $a9d9
08b6: 2f0c                     move.l     a4, -(a7)
08b8: a9d7                     dc.w       $a9d7
08ba: 2054                     movea.l    (a4), a0
08bc: 2f08                     move.l     a0, -(a7)
08be: 554f                     subq.w     #$2, a7
08c0: 2f0c                     move.l     a4, -(a7)
08c2: 4ebafb54                 jsr        $418(pc)
08c6: 301f                     move.w     (a7)+, d0
08c8: 205f                     movea.l    (a7)+, a0
08ca: 3c280020                 move.w     $20(a0), d6
08ce: 9c40                     sub.w      d0, d6
08d0: 4a46                     tst.w      d6
08d2: 6640                     bne.b      $914
08d4: 2054                     movea.l    (a4), a0
08d6: 30280020                 move.w     $20(a0), d0
08da: 5340                     subq.w     #$1, d0
08dc: 2054                     movea.l    (a4), a0
08de: 31400020                 move.w     d0, $20(a0)
08e2: 2054                     movea.l    (a4), a0
08e4: 2f08                     move.l     a0, -(a7)
08e6: 554f                     subq.w     #$2, a7
08e8: 2f0c                     move.l     a4, -(a7)
08ea: 4ebafb2c                 jsr        $418(pc)
08ee: 301f                     move.w     (a7)+, d0
08f0: 205f                     movea.l    (a7)+, a0
08f2: 3c280020                 move.w     $20(a0), d6
08f6: 9c40                     sub.w      d0, d6
08f8: 2054                     movea.l    (a4), a0
08fa: 30280020                 move.w     $20(a0), d0
08fe: 5240                     addq.w     #$1, d0
0900: 2054                     movea.l    (a4), a0
0902: 31400020                 move.w     d0, $20(a0)
0906: 3e06                     move.w     d6, d7
0908: 48c7                     ext.l      d7
090a: 8ffc0004                 divs.w     #$4, d7
090e: 4847                     swap       d7
0910: 5247                     addq.w     #$1, d7
0912: 6010                     bra.b      $924
0914: 3e06                     move.w     d6, d7
0916: 48c7                     ext.l      d7
0918: 8ffc0004                 divs.w     #$4, d7
091c: 4847                     swap       d7
091e: 4a47                     tst.w      d7
0920: 6602                     bne.b      $924
0922: 7e04                     moveq      #$4, d7
0924: 2054                     movea.l    (a4), a0
0926: 30280020                 move.w     $20(a0), d0
092a: 9047                     sub.w      d7, d0
092c: 48c0                     ext.l      d0
092e: 2f00                     move.l     d0, -(a7)
0930: 2054                     movea.l    (a4), a0
0932: 30280020                 move.w     $20(a0), d0
0936: 48c0                     ext.l      d0
0938: 2f00                     move.l     d0, -(a7)
093a: 2f0c                     move.l     a4, -(a7)
093c: a9d1                     dc.w       $a9d1
093e: 2f0c                     move.l     a4, -(a7)
0940: a9d7                     dc.w       $a9d7
0942: 2f0c                     move.l     a4, -(a7)
0944: a9d8                     dc.w       $a9d8
0946: 4cdf10c0                 movem.l    (a7)+, d6-d7/a4
094a: 4e5e                     unlk       a6
094c: 2e9f                     move.l     (a7)+, (a7)
094e: 4e75                     rts        
0950: 4e56ffe4                 link.w     a6, #$ffe4
0954: 48e70718                 movem.l    d5-d7/a3-a4, -(a7)
0958: 286e0008                 movea.l    $8(a6), a4
095c: 3f2dbdba                 move.w     -$4246(a5), -(a7)
0960: 2f0c                     move.l     a4, -(a7)
0962: a9dc                     dc.w       $a9dc
0964: 554f                     subq.w     #$2, a7
0966: 2f0c                     move.l     a4, -(a7)
0968: 4ebafa60                 jsr        $3ca(pc)
096c: 3a1f                     move.w     (a7)+, d5
096e: 2054                     movea.l    (a4), a0
0970: 3e05                     move.w     d5, d7
0972: 5347                     subq.w     #$1, d7
0974: de47                     add.w      d7, d7
0976: 3e307060                 move.w     $60(a0, d7.w), d7
097a: 4246                     clr.w      d6
097c: 6004                     bra.b      $982
097e: 5247                     addq.w     #$1, d7
0980: 5246                     addq.w     #$1, d6
0982: 2054                     movea.l    (a4), a0
0984: 2068003e                 movea.l    $3e(a0), a0
0988: 2050                     movea.l    (a0), a0
098a: 7000                     moveq      #$0, d0
098c: 10307000                 move.b     (a0, d7.w), d0
0990: 0c400020                 cmpi.w     #$20, d0
0994: 57c0                     seq.b      d0
0996: 2054                     movea.l    (a4), a0
0998: 3205                     move.w     d5, d1
099a: d241                     add.w      d1, d1
099c: be701060                 cmp.w      $60(a0, d1.w), d7
09a0: 5dc1                     slt.b      d1
09a2: c001                     and.b      d1, d0
09a4: 66d8                     bne.b      $97e
09a6: 4a46                     tst.w      d6
09a8: 6f3c                     ble.b      $9e6
09aa: 594f                     subq.w     #$4, a7
09ac: 3006                     move.w     d6, d0
09ae: 48c0                     ext.l      d0
09b0: 2f00                     move.l     d0, -(a7)
09b2: 4ead0152                 jsr        $152(a5) ; CODE 1 resource+0x0530
09b6: 265f                     movea.l    (a7)+, a3
09b8: 3006                     move.w     d6, d0
09ba: 5340                     subq.w     #$1, d0
09bc: 3d40ffe4                 move.w     d0, -$1c(a6)
09c0: 4247                     clr.w      d7
09c2: 600a                     bra.b      $9ce
09c4: 17bc00207000             move.b     #$20, (a3, d7.w)
09ca: 5247                     addq.w     #$1, d7
09cc: 6906                     bvs.b      $9d4
09ce: be6effe4                 cmp.w      -$1c(a6), d7
09d2: 6ff0                     ble.b      $9c4
09d4: 2f0b                     move.l     a3, -(a7)
09d6: 3006                     move.w     d6, d0
09d8: 48c0                     ext.l      d0
09da: 2f00                     move.l     d0, -(a7)
09dc: 2f0c                     move.l     a4, -(a7)
09de: a9de                     dc.w       $a9de
09e0: 2f0b                     move.l     a3, -(a7)
09e2: 205f                     movea.l    (a7)+, a0
09e4: a01f                     dc.w       $a01f
09e6: 4cdf18e0                 movem.l    (a7)+, d5-d7/a3-a4
09ea: 4e5e                     unlk       a6
09ec: 2e9f                     move.l     (a7)+, (a7)
09ee: 4e75                     rts        
09f0: 4e56ffd0                 link.w     a6, #$ffd0
09f4: 486effd0                 pea.l      -$30(a6)
09f8: a898                     dc.w       $a898
09fa: 3f3c0002                 move.w     #$2, -(a7)
09fe: 3f3c0002                 move.w     #$2, -(a7)
0a02: a89b                     dc.w       $a89b
0a04: 2f2e000a                 move.l     $a(a6), -(a7)
0a08: 3f2e0008                 move.w     $8(a6), -(a7)
0a0c: 486effe6                 pea.l      -$1a(a6)
0a10: 486effe2                 pea.l      -$1e(a6)
0a14: 486effe8                 pea.l      -$18(a6)
0a18: a98d                     dc.w       $a98d
0a1a: 3f2effea                 move.w     -$16(a6), -(a7)
0a1e: 3f2effe8                 move.w     -$18(a6), -(a7)
0a22: a893                     dc.w       $a893
0a24: 3f2effee                 move.w     -$12(a6), -(a7)
0a28: 3f2effe8                 move.w     -$18(a6), -(a7)
0a2c: a891                     dc.w       $a891
0a2e: 486effd0                 pea.l      -$30(a6)
0a32: a899                     dc.w       $a899
0a34: 4e5e                     unlk       a6
0a36: 205f                     movea.l    (a7)+, a0
0a38: 5c4f                     addq.w     #$6, a7
0a3a: 4ed0                     jmp        (a0)
0a3c: 4e56ffc4                 link.w     a6, #$ffc4
0a40: 486effcc                 pea.l      -$34(a6)
0a44: a874                     dc.w       $a874
0a46: 2f2e000c                 move.l     $c(a6), -(a7)
0a4a: a873                     dc.w       $a873
0a4c: 486effd0                 pea.l      -$30(a6)
0a50: a898                     dc.w       $a898
0a52: 2f2e000c                 move.l     $c(a6), -(a7)
0a56: 3f2e000a                 move.w     $a(a6), -(a7)
0a5a: 486effe6                 pea.l      -$1a(a6)
0a5e: 486effe2                 pea.l      -$1e(a6)
0a62: 486effe8                 pea.l      -$18(a6)
0a66: a98d                     dc.w       $a98d
0a68: 486effe8                 pea.l      -$18(a6)
0a6c: 3f3cfffc                 move.w     #$fffc, -(a7)
0a70: 3f3cfffc                 move.w     #$fffc, -(a7)
0a74: a8a9                     dc.w       $a8a9
0a76: 3f3c0003                 move.w     #$3, -(a7)
0a7a: 3f3c0003                 move.w     #$3, -(a7)
0a7e: a89b                     dc.w       $a89b
0a80: 102e0008                 move.b     $8(a6), d0
0a84: 5300                     subq.b     #$1, d0
0a86: 6706                     beq.b      $a8e
0a88: 486dffc2                 pea.l      -$3e(a5)
0a8c: a89d                     dc.w       $a89d
0a8e: 486effe8                 pea.l      -$18(a6)
0a92: 3f3c0010                 move.w     #$10, -(a7)
0a96: 3f3c0010                 move.w     #$10, -(a7)
0a9a: a8b0                     dc.w       $a8b0
0a9c: 486effd0                 pea.l      -$30(a6)
0aa0: a899                     dc.w       $a899
0aa2: 2f2effcc                 move.l     -$34(a6), -(a7)
0aa6: a873                     dc.w       $a873
0aa8: 4e5e                     unlk       a6
0aaa: 205f                     movea.l    (a7)+, a0
0aac: 504f                     addq.w     #$8, a7
0aae: 4ed0                     jmp        (a0)
0ab0: 4e560000                 link.w     a6, #$0
0ab4: 2f2e000a                 move.l     $a(a6), -(a7)
0ab8: 3f2e0008                 move.w     $8(a6), -(a7)
0abc: 1f3c0001                 move.b     #$1, -(a7)
0ac0: 4ebaff7a                 jsr        $a3c(pc)
0ac4: 4e5e                     unlk       a6
0ac6: 205f                     movea.l    (a7)+, a0
0ac8: 5c4f                     addq.w     #$6, a7
0aca: 4ed0                     jmp        (a0)
0acc: 4e560000                 link.w     a6, #$0
0ad0: 2f2e000a                 move.l     $a(a6), -(a7)
0ad4: 3f2e0008                 move.w     $8(a6), -(a7)
0ad8: 4227                     clr.b      -(a7)
0ada: 4ebaff60                 jsr        $a3c(pc)
0ade: 4e5e                     unlk       a6
0ae0: 205f                     movea.l    (a7)+, a0
0ae2: 5c4f                     addq.w     #$6, a7
0ae4: 4ed0                     jmp        (a0)
0ae6: 4e56feea                 link.w     a6, #$feea
0aea: 206e0008                 movea.l    $8(a6), a0
0aee: 43eefef0                 lea.l      -$110(a6), a1
0af2: 703f                     moveq      #$3f, d0
0af4: 22d8                     move.l     (a0)+, (a1)+
0af6: 51c8fffc                 dbra       d0, $af4
0afa: a850                     dc.w       $a850
0afc: 6004                     bra.b      $b02
0afe: 4ebaf5e4                 jsr        $e4(pc)
0b02: 554f                     subq.w     #$2, a7
0b04: 3f3c0040                 move.w     #$40, -(a7)
0b08: 486dbdca                 pea.l      -$4236(a5)
0b0c: a970                     dc.w       $a970
0b0e: 4a1f                     tst.b      (a7)+
0b10: 66ec                     bne.b      $afe
0b12: 486efeea                 pea.l      -$116(a6)
0b16: a874                     dc.w       $a874
0b18: 486efef0                 pea.l      -$110(a6)
0b1c: 487a002a                 pea.l      $b48(pc)
0b20: 487a0024                 pea.l      $b46(pc)
0b24: 487a001e                 pea.l      $b44(pc)
0b28: a98b                     dc.w       $a98b
0b2a: 554f                     subq.w     #$2, a7
0b2c: 3f3c0083                 move.w     #$83, -(a7)
0b30: 42a7                     clr.l      -(a7)
0b32: a985                     dc.w       $a985
0b34: 3d5ffeee                 move.w     (a7)+, -$112(a6)
0b38: 2f2efeea                 move.l     -$116(a6), -(a7)
0b3c: a873                     dc.w       $a873
0b3e: 4e5e                     unlk       a6
0b40: 2e9f                     move.l     (a7)+, (a7)
0b42: 4e75                     rts        
0b44: 00000000                 ori.b      #$0, d0
0b48: 00004e56                 ori.b      #$56, d0
0b4c: fef0                     dc.w       $fef0
0b4e: 206e0008                 movea.l    $8(a6), a0
0b52: 43eefef0                 lea.l      -$110(a6), a1
0b56: 703f                     moveq      #$3f, d0
0b58: 22d8                     move.l     (a0)+, (a1)+
0b5a: 51c8fffc                 dbra       d0, $b58
0b5e: 102df9da                 move.b     -$626(a5), d0
0b62: 5300                     subq.b     #$1, d0
0b64: 6756                     beq.b      $bbc
0b66: a850                     dc.w       $a850
0b68: 6004                     bra.b      $b6e
0b6a: 4ebaf578                 jsr        $e4(pc)
0b6e: 554f                     subq.w     #$2, a7
0b70: 3f3c0040                 move.w     #$40, -(a7)
0b74: 486dbdca                 pea.l      -$4236(a5)
0b78: a970                     dc.w       $a970
0b7a: 4a1f                     tst.b      (a7)+
0b7c: 66ec                     bne.b      $b6a
0b7e: 486df928                 pea.l      -$6d8(a5)
0b82: a874                     dc.w       $a874
0b84: 486efef0                 pea.l      -$110(a6)
0b88: 487a003c                 pea.l      $bc6(pc)
0b8c: 487a0036                 pea.l      $bc4(pc)
0b90: 487a0030                 pea.l      $bc2(pc)
0b94: a98b                     dc.w       $a98b
0b96: 594f                     subq.w     #$4, a7
0b98: 3f3c0086                 move.w     #$86, -(a7)
0b9c: 486df930                 pea.l      -$6d0(a5)
0ba0: 70ff                     moveq      #$ff, d0
0ba2: 2f00                     move.l     d0, -(a7)
0ba4: a97c                     dc.w       $a97c
0ba6: 2b5ff92c                 move.l     (a7)+, -$6d4(a5)
0baa: 2f2df92c                 move.l     -$6d4(a5), -(a7)
0bae: a873                     dc.w       $a873
0bb0: 2f2df92c                 move.l     -$6d4(a5), -(a7)
0bb4: a981                     dc.w       $a981
0bb6: 1b7c0001f9da             move.b     #$1, -$626(a5)
0bbc: 4e5e                     unlk       a6
0bbe: 2e9f                     move.l     (a7)+, (a7)
0bc0: 4e75                     rts        
0bc2: 00000000                 ori.b      #$0, d0
0bc6: 00004a2d                 ori.b      #$2d, d0
0bca: f9da                     dc.w       $f9da
0bcc: 6710                     beq.b      $bde
0bce: 2f2df92c                 move.l     -$6d4(a5), -(a7)
0bd2: a982                     dc.w       $a982
0bd4: 2f2df928                 move.l     -$6d8(a5), -(a7)
0bd8: a873                     dc.w       $a873
0bda: 422df9da                 clr.b      -$626(a5)
0bde: 4e75                     rts        
0be0: 4e56ffee                 link.w     a6, #$ffee
0be4: 48e70138                 movem.l    d7/a2-a4, -(a7)
0be8: 266e0008                 movea.l    $8(a6), a3
0bec: 246e000c                 movea.l    $c(a6), a2
0bf0: 0c520003                 cmpi.w     #$3, (a2)
0bf4: 57c0                     seq.b      d0
0bf6: 0c520005                 cmpi.w     #$5, (a2)
0bfa: 57c1                     seq.b      d1
0bfc: 8001                     or.b       d1, d0
0bfe: 6752                     beq.b      $c52
0c00: 2e2a0002                 move.l     $2(a2), d7
0c04: 0287000000ff             andi.l     #$ff, d7
0c0a: 0c470030                 cmpi.w     #$30, d7
0c0e: 5cc0                     sge.b      d0
0c10: 0c470039                 cmpi.w     #$39, d7
0c14: 5fc1                     sle.b      d1
0c16: c001                     and.b      d1, d0
0c18: 6706                     beq.b      $c20
0c1a: 422e0014                 clr.b      $14(a6)
0c1e: 6036                     bra.b      $c56
0c20: be6dbdba                 cmp.w      -$4246(a5), d7
0c24: 57c0                     seq.b      d0
0c26: be6dbdc0                 cmp.w      -$4240(a5), d7
0c2a: 57c1                     seq.b      d1
0c2c: 8001                     or.b       d1, d0
0c2e: 670c                     beq.b      $c3c
0c30: 1d7c00010014             move.b     #$1, $14(a6)
0c36: 36bc0001                 move.w     #$1, (a3)
0c3a: 601a                     bra.b      $c56
0c3c: be6dbdbc                 cmp.w      -$4244(a5), d7
0c40: 6606                     bne.b      $c48
0c42: 422e0014                 clr.b      $14(a6)
0c46: 600e                     bra.b      $c56
0c48: 1d7c00010014             move.b     #$1, $14(a6)
0c4e: 4253                     clr.w      (a3)
0c50: 6004                     bra.b      $c56
0c52: 422e0014                 clr.b      $14(a6)
0c56: 4cdf1c80                 movem.l    (a7)+, d7/a2-a4
0c5a: 4e5e                     unlk       a6
0c5c: 205f                     movea.l    (a7)+, a0
0c5e: 4fef000c                 lea.l      $c(a7), a7
0c62: 4ed0                     jmp        (a0)
0c64: 4e560000                 link.w     a6, #$0
0c68: 2f0c                     move.l     a4, -(a7)
0c6a: 286e0008                 movea.l    $8(a6), a4
0c6e: 0c6c0002fce2             cmpi.w     #$2, -$31e(a4)
0c74: 6c18                     bge.b      $c8e
0c76: 2f2cffdc                 move.l     -$24(a4), -(a7)
0c7a: 3f3c0001                 move.w     #$1, -(a7)
0c7e: 4ebafe4c                 jsr        $acc(pc)
0c82: 2f2cfcde                 move.l     -$322(a4), -(a7)
0c86: 3f3c00ff                 move.w     #$ff, -(a7)
0c8a: a95d                     dc.w       $a95d
0c8c: 6014                     bra.b      $ca2
0c8e: 2f2cffdc                 move.l     -$24(a4), -(a7)
0c92: 3f3c0001                 move.w     #$1, -(a7)
0c96: 4ebafe18                 jsr        $ab0(pc)
0c9a: 2f2cfcde                 move.l     -$322(a4), -(a7)
0c9e: 4267                     clr.w      -(a7)
0ca0: a95d                     dc.w       $a95d
0ca2: 285f                     movea.l    (a7)+, a4
0ca4: 4e5e                     unlk       a6
0ca6: 2e9f                     move.l     (a7)+, (a7)
0ca8: 4e75                     rts        
0caa: 4e56fcde                 link.w     a6, #$fcde
0cae: 48e70f38                 movem.l    d4-d7/a2-a4, -(a7)
0cb2: 286e0008                 movea.l    $8(a6), a4
0cb6: 4204                     clr.b      d4
0cb8: a850                     dc.w       $a850
0cba: 6004                     bra.b      $cc0
0cbc: 4ebaf426                 jsr        $e4(pc)
0cc0: 554f                     subq.w     #$2, a7
0cc2: 3f3c0040                 move.w     #$40, -(a7)
0cc6: 486dbdca                 pea.l      -$4236(a5)
0cca: a970                     dc.w       $a970
0ccc: 4a1f                     tst.b      (a7)+
0cce: 66ec                     bne.b      $cbc
0cd0: 486effe0                 pea.l      -$20(a6)
0cd4: a874                     dc.w       $a874
0cd6: 594f                     subq.w     #$4, a7
0cd8: 3f3c0088                 move.w     #$88, -(a7)
0cdc: 486eff32                 pea.l      -$ce(a6)
0ce0: 70ff                     moveq      #$ff, d0
0ce2: 2f00                     move.l     d0, -(a7)
0ce4: a97c                     dc.w       $a97c
0ce6: 2d5fffdc                 move.l     (a7)+, -$24(a6)
0cea: 2f2effdc                 move.l     -$24(a6), -(a7)
0cee: 3f3c0001                 move.w     #$1, -(a7)
0cf2: 486eff2c                 pea.l      -$d4(a6)
0cf6: 486efef4                 pea.l      -$10c(a6)
0cfa: 486efeec                 pea.l      -$114(a6)
0cfe: a98d                     dc.w       $a98d
0d00: 2d6efef4fcde             move.l     -$10c(a6), -$322(a6)
0d06: 7a0d                     moveq      #$d, d5
0d08: 7c01                     moveq      #$1, d6
0d0a: 7e01                     moveq      #$1, d7
0d0c: 3007                     move.w     d7, d0
0d0e: c1fc00a6                 muls.w     #$a6, d0
0d12: 0640bf96                 addi.w     #$bf96, d0
0d16: 4a350000                 tst.b      (a5, d0.w)
0d1a: 6700009e                 beq.w      $dba
0d1e: 2f2effdc                 move.l     -$24(a6), -(a7)
0d22: 3006                     move.w     d6, d0
0d24: 5440                     addq.w     #$2, d0
0d26: 3f00                     move.w     d0, -(a7)
0d28: 486eff2c                 pea.l      -$d4(a6)
0d2c: 486efef4                 pea.l      -$10c(a6)
0d30: 486efeec                 pea.l      -$114(a6)
0d34: a98d                     dc.w       $a98d
0d36: 3006                     move.w     d6, d0
0d38: e540                     asl.w      #$2, d0
0d3a: 0640fef8                 addi.w     #$fef8, d0
0d3e: 2daefef40000             move.l     -$10c(a6), (a6, d0.w)
0d44: 3007                     move.w     d7, d0
0d46: c1fc00a6                 muls.w     #$a6, d0
0d4a: 0640c030                 addi.w     #$c030, d0
0d4e: 24750000                 movea.l    (a5, d0.w), a2
0d52: 3007                     move.w     d7, d0
0d54: c1fc00a6                 muls.w     #$a6, d0
0d58: 0640bf98                 addi.w     #$bf98, d0
0d5c: 48750000                 pea.l      (a5, d0.w)
0d60: 486efce8                 pea.l      -$318(a6)
0d64: a919                     dc.w       $a919
0d66: 3006                     move.w     d6, d0
0d68: e540                     asl.w      #$2, d0
0d6a: 0640fef8                 addi.w     #$fef8, d0
0d6e: 2f360000                 move.l     (a6, d0.w), -(a7)
0d72: 486efce8                 pea.l      -$318(a6)
0d76: a95f                     dc.w       $a95f
0d78: 41edc37b                 lea.l      -$3c85(a5), a0
0d7c: 4a307000                 tst.b      (a0, d7.w)
0d80: 6714                     beq.b      $d96
0d82: 3006                     move.w     d6, d0
0d84: e540                     asl.w      #$2, d0
0d86: 0640fef8                 addi.w     #$fef8, d0
0d8a: 2f360000                 move.l     (a6, d0.w), -(a7)
0d8e: 3f3c0001                 move.w     #$1, -(a7)
0d92: a963                     dc.w       $a963
0d94: 6010                     bra.b      $da6
0d96: 3006                     move.w     d6, d0
0d98: e540                     asl.w      #$2, d0
0d9a: 0640fef8                 addi.w     #$fef8, d0
0d9e: 2f360000                 move.l     (a6, d0.w), -(a7)
0da2: 4267                     clr.w      -(a7)
0da4: a963                     dc.w       $a963
0da6: 3006                     move.w     d6, d0
0da8: d040                     add.w      d0, d0
0daa: 3d8700e4                 move.w     d7, -$1c(a6, d0.w)
0dae: be54                     cmp.w      (a4), d7
0db0: 6604                     bne.b      $db6
0db2: 3a06                     move.w     d6, d5
0db4: 5e45                     addq.w     #$7, d5
0db6: 5246                     addq.w     #$1, d6
0db8: 6010                     bra.b      $dca
0dba: 41edc37b                 lea.l      -$3c85(a5), a0
0dbe: 42307000                 clr.b      (a0, d7.w)
0dc2: be6dbdb2                 cmp.w      -$424e(a5), d7
0dc6: 6602                     bne.b      $dca
0dc8: 7a0d                     moveq      #$d, d5
0dca: 5247                     addq.w     #$1, d7
0dcc: 0c470005                 cmpi.w     #$5, d7
0dd0: 6f00ff3a                 ble.w      $d0c
0dd4: 3006                     move.w     d6, d0
0dd6: 5340                     subq.w     #$1, d0
0dd8: 3d40fce2                 move.w     d0, -$31e(a6)
0ddc: 7e01                     moveq      #$1, d7
0dde: 2f2effdc                 move.l     -$24(a6), -(a7)
0de2: 3007                     move.w     d7, d0
0de4: 5e40                     addq.w     #$7, d0
0de6: 3f00                     move.w     d0, -(a7)
0de8: 486eff2c                 pea.l      -$d4(a6)
0dec: 486efef4                 pea.l      -$10c(a6)
0df0: 486efeec                 pea.l      -$114(a6)
0df4: a98d                     dc.w       $a98d
0df6: 3007                     move.w     d7, d0
0df8: 5a40                     addq.w     #$5, d0
0dfa: e540                     asl.w      #$2, d0
0dfc: 0640fef8                 addi.w     #$fef8, d0
0e00: 2daefef40000             move.l     -$10c(a6), (a6, d0.w)
0e06: be6efce2                 cmp.w      -$31e(a6), d7
0e0a: 6f18                     ble.b      $e24
0e0c: 0c470006                 cmpi.w     #$6, d7
0e10: 6736                     beq.b      $e48
0e12: 3007                     move.w     d7, d0
0e14: 5a40                     addq.w     #$5, d0
0e16: e540                     asl.w      #$2, d0
0e18: 0640fef8                 addi.w     #$fef8, d0
0e1c: 2f360000                 move.l     (a6, d0.w), -(a7)
0e20: a958                     dc.w       $a958
0e22: 6024                     bra.b      $e48
0e24: 3007                     move.w     d7, d0
0e26: d040                     add.w      d0, d0
0e28: 303600e4                 move.w     -$1c(a6, d0.w), d0
0e2c: 0640c37b                 addi.w     #$c37b, d0
0e30: 10350000                 move.b     (a5, d0.w), d0
0e34: 5300                     subq.b     #$1, d0
0e36: 6710                     beq.b      $e48
0e38: 3007                     move.w     d7, d0
0e3a: 5a40                     addq.w     #$5, d0
0e3c: e540                     asl.w      #$2, d0
0e3e: 0640fef8                 addi.w     #$fef8, d0
0e42: 2f360000                 move.l     (a6, d0.w), -(a7)
0e46: a958                     dc.w       $a958
0e48: 5247                     addq.w     #$1, d7
0e4a: 0c470006                 cmpi.w     #$6, d7
0e4e: 6f8e                     ble.b      $dde
0e50: 3005                     move.w     d5, d0
0e52: 5540                     subq.w     #$2, d0
0e54: e540                     asl.w      #$2, d0
0e56: 0640fef8                 addi.w     #$fef8, d0
0e5a: 2f360000                 move.l     (a6, d0.w), -(a7)
0e5e: 3f3c0001                 move.w     #$1, -(a7)
0e62: a963                     dc.w       $a963
0e64: 3e06                     move.w     d6, d7
0e66: 6036                     bra.b      $e9e
0e68: 2f2effdc                 move.l     -$24(a6), -(a7)
0e6c: 3007                     move.w     d7, d0
0e6e: 5440                     addq.w     #$2, d0
0e70: 3f00                     move.w     d0, -(a7)
0e72: 486eff2c                 pea.l      -$d4(a6)
0e76: 486efef4                 pea.l      -$10c(a6)
0e7a: 486efeec                 pea.l      -$114(a6)
0e7e: a98d                     dc.w       $a98d
0e80: 3007                     move.w     d7, d0
0e82: e540                     asl.w      #$2, d0
0e84: 0640fef8                 addi.w     #$fef8, d0
0e88: 2daefef40000             move.l     -$10c(a6), (a6, d0.w)
0e8e: 3007                     move.w     d7, d0
0e90: e540                     asl.w      #$2, d0
0e92: 0640fef8                 addi.w     #$fef8, d0
0e96: 2f360000                 move.l     (a6, d0.w), -(a7)
0e9a: a958                     dc.w       $a958
0e9c: 5247                     addq.w     #$1, d7
0e9e: 0c470005                 cmpi.w     #$5, d7
0ea2: 6fc4                     ble.b      $e68
0ea4: 2f2effdc                 move.l     -$24(a6), -(a7)
0ea8: 3f3c000f                 move.w     #$f, -(a7)
0eac: 486eff2c                 pea.l      -$d4(a6)
0eb0: 486efef4                 pea.l      -$10c(a6)
0eb4: 486efeec                 pea.l      -$114(a6)
0eb8: a98d                     dc.w       $a98d
0eba: 266efef4                 movea.l    -$10c(a6), a3
0ebe: 2f2effdc                 move.l     -$24(a6), -(a7)
0ec2: a873                     dc.w       $a873
0ec4: 2f2effdc                 move.l     -$24(a6), -(a7)
0ec8: a915                     dc.w       $a915
0eca: 2f2effdc                 move.l     -$24(a6), -(a7)
0ece: 3f3c000f                 move.w     #$f, -(a7)
0ed2: 4267                     clr.w      -(a7)
0ed4: 3f3c7fff                 move.w     #$7fff, -(a7)
0ed8: a97e                     dc.w       $a97e
0eda: 2f2effdc                 move.l     -$24(a6), -(a7)
0ede: 3f3c0001                 move.w     #$1, -(a7)
0ee2: 4ebafbcc                 jsr        $ab0(pc)
0ee6: 2f2effdc                 move.l     -$24(a6), -(a7)
0eea: 3f3c0010                 move.w     #$10, -(a7)
0eee: 4ebafb00                 jsr        $9f0(pc)
0ef2: 486d0072                 pea.l      $72(a5)
0ef6: 486effe4                 pea.l      -$1c(a6)
0efa: a991                     dc.w       $a991
0efc: 302effe4                 move.w     -$1c(a6), d0
0f00: 60000180                 bra.w      $1082
0f04: 0c6e0002fce2             cmpi.w     #$2, -$31e(a6)
0f0a: 6c0a                     bge.b      $f16
0f0c: 3f3c0005                 move.w     #$5, -(a7)
0f10: a9c8                     dc.w       $a9c8
0f12: 6000019a                 bra.w      $10ae
0f16: 2f2efcde                 move.l     -$322(a6), -(a7)
0f1a: 3f3c0001                 move.w     #$1, -(a7)
0f1e: a95d                     dc.w       $a95d
0f20: 2f0b                     move.l     a3, -(a7)
0f22: 486efde8                 pea.l      -$218(a6)
0f26: a990                     dc.w       $a990
0f28: 486efde8                 pea.l      -$218(a6)
0f2c: 486eff28                 pea.l      -$d8(a6)
0f30: 4ead01fa                 jsr        $1fa(a5) ; CODE 1 resource+0x093a
0f34: 202eff28                 move.l     -$d8(a6), d0
0f38: 6a02                     bpl.b      $f3c
0f3a: 4480                     neg.l      d0
0f3c: 2d40ff28                 move.l     d0, -$d8(a6)
0f40: 0cae000003e8ff28         cmpi.l     #$3e8, -$d8(a6)
0f48: 6f1c                     ble.b      $f66
0f4a: 487a0192                 pea.l      $10de(pc)
0f4e: 4ebafb96                 jsr        $ae6(pc)
0f52: 2f2effdc                 move.l     -$24(a6), -(a7)
0f56: 3f3c000f                 move.w     #$f, -(a7)
0f5a: 4267                     clr.w      -(a7)
0f5c: 3f3c7fff                 move.w     #$7fff, -(a7)
0f60: a97e                     dc.w       $a97e
0f62: 6000014a                 bra.w      $10ae
0f66: 7801                     moveq      #$1, d4
0f68: 3d6eff2a000c             move.w     -$d6(a6), $c(a6)
0f6e: 6000013e                 bra.w      $10ae
0f72: 426e000c                 clr.w      $c(a6)
0f76: 7801                     moveq      #$1, d4
0f78: 60000134                 bra.w      $10ae
0f7c: 302effe4                 move.w     -$1c(a6), d0
0f80: 5540                     subq.w     #$2, d0
0f82: d040                     add.w      d0, d0
0f84: 303600e4                 move.w     -$1c(a6, d0.w), d0
0f88: 0640c37b                 addi.w     #$c37b, d0
0f8c: 4a350000                 tst.b      (a5, d0.w)
0f90: 6770                     beq.b      $1002
0f92: 302efce2                 move.w     -$31e(a6), d0
0f96: 5340                     subq.w     #$1, d0
0f98: 3d40fce2                 move.w     d0, -$31e(a6)
0f9c: 302effe4                 move.w     -$1c(a6), d0
0fa0: 5540                     subq.w     #$2, d0
0fa2: e540                     asl.w      #$2, d0
0fa4: 0640fef8                 addi.w     #$fef8, d0
0fa8: 2f360000                 move.l     (a6, d0.w), -(a7)
0fac: 4267                     clr.w      -(a7)
0fae: a963                     dc.w       $a963
0fb0: 302effe4                 move.w     -$1c(a6), d0
0fb4: 5540                     subq.w     #$2, d0
0fb6: d040                     add.w      d0, d0
0fb8: 303600e4                 move.w     -$1c(a6, d0.w), d0
0fbc: 0640c37b                 addi.w     #$c37b, d0
0fc0: 42350000                 clr.b      (a5, d0.w)
0fc4: 302effe4                 move.w     -$1c(a6), d0
0fc8: 5540                     subq.w     #$2, d0
0fca: 5a40                     addq.w     #$5, d0
0fcc: e540                     asl.w      #$2, d0
0fce: 0640fef8                 addi.w     #$fef8, d0
0fd2: 2f360000                 move.l     (a6, d0.w), -(a7)
0fd6: a958                     dc.w       $a958
0fd8: 302effe4                 move.w     -$1c(a6), d0
0fdc: 5a40                     addq.w     #$5, d0
0fde: ba40                     cmp.w      d0, d5
0fe0: 666a                     bne.b      $104c
0fe2: 3005                     move.w     d5, d0
0fe4: 5540                     subq.w     #$2, d0
0fe6: e540                     asl.w      #$2, d0
0fe8: 0640fef8                 addi.w     #$fef8, d0
0fec: 2f360000                 move.l     (a6, d0.w), -(a7)
0ff0: 4267                     clr.w      -(a7)
0ff2: a963                     dc.w       $a963
0ff4: 2f2eff24                 move.l     -$dc(a6), -(a7)
0ff8: 3f3c0001                 move.w     #$1, -(a7)
0ffc: a963                     dc.w       $a963
0ffe: 7a0d                     moveq      #$d, d5
1000: 604a                     bra.b      $104c
1002: 302efce2                 move.w     -$31e(a6), d0
1006: 5240                     addq.w     #$1, d0
1008: 3d40fce2                 move.w     d0, -$31e(a6)
100c: 302effe4                 move.w     -$1c(a6), d0
1010: 5540                     subq.w     #$2, d0
1012: e540                     asl.w      #$2, d0
1014: 0640fef8                 addi.w     #$fef8, d0
1018: 2f360000                 move.l     (a6, d0.w), -(a7)
101c: 3f3c0001                 move.w     #$1, -(a7)
1020: a963                     dc.w       $a963
1022: 302effe4                 move.w     -$1c(a6), d0
1026: 5540                     subq.w     #$2, d0
1028: d040                     add.w      d0, d0
102a: 303600e4                 move.w     -$1c(a6, d0.w), d0
102e: 0640c37b                 addi.w     #$c37b, d0
1032: 1bbc00010000             move.b     #$1, (a5, d0.w)
1038: 302effe4                 move.w     -$1c(a6), d0
103c: 5540                     subq.w     #$2, d0
103e: 5a40                     addq.w     #$5, d0
1040: e540                     asl.w      #$2, d0
1042: 0640fef8                 addi.w     #$fef8, d0
1046: 2f360000                 move.l     (a6, d0.w), -(a7)
104a: a957                     dc.w       $a957
104c: 2f0e                     move.l     a6, -(a7)
104e: 4ebafc14                 jsr        $c64(pc)
1052: 605a                     bra.b      $10ae
1054: 3005                     move.w     d5, d0
1056: 5540                     subq.w     #$2, d0
1058: e540                     asl.w      #$2, d0
105a: 0640fef8                 addi.w     #$fef8, d0
105e: 2f360000                 move.l     (a6, d0.w), -(a7)
1062: 4267                     clr.w      -(a7)
1064: a963                     dc.w       $a963
1066: 302effe4                 move.w     -$1c(a6), d0
106a: 5540                     subq.w     #$2, d0
106c: e540                     asl.w      #$2, d0
106e: 0640fef8                 addi.w     #$fef8, d0
1072: 2f360000                 move.l     (a6, d0.w), -(a7)
1076: 3f3c0001                 move.w     #$1, -(a7)
107a: a963                     dc.w       $a963
107c: 3a2effe4                 move.w     -$1c(a6), d5
1080: 602c                     bra.b      $10ae
1082: 5340                     subq.w     #$1, d0
1084: 0c40000d                 cmpi.w     #$d, d0
1088: 6424                     bcc.b      $10ae
108a: d040                     add.w      d0, d0
108c: 303b0006                 move.w     $1094(pc, d0.w), d0
1090: 4efb0002                 jmp        $1094(pc, d0.w)
1094: fe70                     dc.w       $fe70
1096: fede                     dc.w       $fede
1098: fee8                     dc.w       $fee8
109a: fee8                     dc.w       $fee8
109c: fee8                     dc.w       $fee8
109e: fee8                     dc.w       $fee8
10a0: fee8                     dc.w       $fee8
10a2: ffc0                     dc.w       $ffc0
10a4: ffc0                     dc.w       $ffc0
10a6: ffc0                     dc.w       $ffc0
10a8: ffc0                     dc.w       $ffc0
10aa: ffc0                     dc.w       $ffc0
10ac: ffc0                     dc.w       $ffc0
10ae: 4a04                     tst.b      d4
10b0: 6700fe40                 beq.w      $ef2
10b4: 0c45000d                 cmpi.w     #$d, d5
10b8: 6604                     bne.b      $10be
10ba: 4254                     clr.w      (a4)
10bc: 600a                     bra.b      $10c8
10be: 3005                     move.w     d5, d0
10c0: 5f40                     subq.w     #$7, d0
10c2: d040                     add.w      d0, d0
10c4: 38b600e4                 move.w     -$1c(a6, d0.w), (a4)
10c8: 2f2effdc                 move.l     -$24(a6), -(a7)
10cc: a982                     dc.w       $a982
10ce: 2f2effe0                 move.l     -$20(a6), -(a7)
10d2: a873                     dc.w       $a873
10d4: 4cdf1cf0                 movem.l    (a7)+, d4-d7/a2-a4
10d8: 4e5e                     unlk       a6
10da: 2e9f                     move.l     (a7)+, (a7)
10dc: 4e75                     rts        
10de: 1c4d                     .byte      0x1c, 0x4d
10e0: 6178                     bsr.b      $115a
10e2: 696d                     bvs.b      $1151
10e4: 756d                     .byte      0x75, 0x6d
10e6: 2023                     move.l     -(a3), d0
10e8: 206f6620                 movea.l    $6620(a7), a0
10ec: 4261                     clr.w      -(a1)
10ee: 7474                     moveq      #$74, d2
10f0: 6c65                     bge.b      $1157
10f2: 7320                     .byte      0x73, 0x20
10f4: 6973                     bvs.b      $1169
10f6: 20313030                 move.l     $30(a1, d3.w), d0
10fa: 3016                     move.w     (a6), d0
10fc: 4e56feea                 link.w     a6, #$feea
1100: 2f07                     move.l     d7, -(a7)
1102: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
1106: 3f2dbde8                 move.w     -$4218(a5), -(a7)
110a: 486efeec                 pea.l      -$114(a6)
110e: a946                     dc.w       $a946
1110: 486efeec                 pea.l      -$114(a6)
1114: 486effee                 pea.l      -$12(a6)
1118: a900                     dc.w       $a900
111a: 7e01                     moveq      #$1, d7
111c: 554f                     subq.w     #$2, a7
111e: 3f2effee                 move.w     -$12(a6), -(a7)
1122: 3007                     move.w     d7, d0
1124: d040                     add.w      d0, d0
1126: 0640f90a                 addi.w     #$f90a, d0
112a: 3f350000                 move.w     (a5, d0.w), -(a7)
112e: a902                     dc.w       $a902
1130: 4a1f                     tst.b      (a7)+
1132: 6718                     beq.b      $114c
1134: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
1138: 3f07                     move.w     d7, -(a7)
113a: 1d7c0008feea             move.b     #$8, -$116(a6)
1140: 7000                     moveq      #$0, d0
1142: 102efeea                 move.b     -$116(a6), d0
1146: 3f00                     move.w     d0, -(a7)
1148: a942                     dc.w       $a942
114a: 6014                     bra.b      $1160
114c: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
1150: 3f07                     move.w     d7, -(a7)
1152: 422efeea                 clr.b      -$116(a6)
1156: 7000                     moveq      #$0, d0
1158: 102efeea                 move.b     -$116(a6), d0
115c: 3f00                     move.w     d0, -(a7)
115e: a942                     dc.w       $a942
1160: 5247                     addq.w     #$1, d7
1162: 0c470008                 cmpi.w     #$8, d7
1166: 6fb4                     ble.b      $111c
1168: 3b6effeebdec             move.w     -$12(a6), -$4214(a5)
116e: 2e1f                     move.l     (a7)+, d7
1170: 4e5e                     unlk       a6
1172: 4e75                     rts        
1174: 4e56ffde                 link.w     a6, #$ffde
1178: 48e70f38                 movem.l    d4-d7/a2-a4, -(a7)
117c: a850                     dc.w       $a850
117e: 206dc02a                 movea.l    -$3fd6(a5), a0
1182: 2050                     movea.l    (a0), a0
1184: 42280203                 clr.b      $203(a0)
1188: 422dbdb8                 clr.b      -$4248(a5)
118c: 246dbdcc                 movea.l    -$4234(a5), a2
1190: 280a                     move.l     a2, d4
1192: 594f                     subq.w     #$4, a7
1194: 2f0a                     move.l     a2, -(a7)
1196: a917                     dc.w       $a917
1198: 2a1f                     move.l     (a7)+, d5
119a: 594f                     subq.w     #$4, a7
119c: a924                     dc.w       $a924
119e: 2c1f                     move.l     (a7)+, d6
11a0: 4a86                     tst.l      d6
11a2: 6604                     bne.b      $11a8
11a4: 4207                     clr.b      d7
11a6: 600a                     bra.b      $11b2
11a8: 2046                     movea.l    d6, a0
11aa: 4a68006c                 tst.w      $6c(a0)
11ae: 5dc7                     slt.b      d7
11b0: 4407                     neg.b      d7
11b2: 2f0a                     move.l     a2, -(a7)
11b4: a873                     dc.w       $a873
11b6: 2045                     movea.l    d5, a0
11b8: 2850                     movea.l    (a0), a4
11ba: 302dbdd8                 move.w     -$4228(a5), d0
11be: 02400001                 andi.w     #$1, d0
11c2: 4a40                     tst.w      d0
11c4: 670002ac                 beq.w      $1472
11c8: 2b45c030                 move.l     d5, -$3fd0(a5)
11cc: 2b4abe2a                 move.l     a2, -$41d6(a5)
11d0: 4a14                     tst.b      (a4)
11d2: 57c0                     seq.b      d0
11d4: 4400                     neg.b      d0
11d6: 1b40bdb6                 move.b     d0, -$424a(a5)
11da: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
11de: 3f3c0004                 move.w     #$4, -(a7)
11e2: a939                     dc.w       $a939
11e4: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
11e8: 4267                     clr.w      -(a7)
11ea: 102dbdb6                 move.b     -$424a(a5), d0
11ee: 8007                     or.b       d7, d0
11f0: 1f00                     move.b     d0, -(a7)
11f2: 4ebaef58                 jsr        $14c(pc)
11f6: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
11fa: 3f3c000c                 move.w     #$c, -(a7)
11fe: a939                     dc.w       $a939
1200: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
1204: 4267                     clr.w      -(a7)
1206: 0c6d0002bdf0             cmpi.w     #$2, -$4210(a5)
120c: 5cc0                     sge.b      d0
120e: 4400                     neg.b      d0
1210: 802dbdb6                 or.b       -$424a(a5), d0
1214: 1f00                     move.b     d0, -(a7)
1216: 4ebaef34                 jsr        $14c(pc)
121a: 0c140002                 cmpi.b     #$2, (a4)
121e: 57c0                     seq.b      d0
1220: 0c140003                 cmpi.b     #$3, (a4)
1224: 57c1                     seq.b      d1
1226: 8001                     or.b       d1, d0
1228: 670000d2                 beq.w      $12fc
122c: 1b7c0001bdb7             move.b     #$1, -$4249(a5)
1232: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
1236: 4ebaef3c                 jsr        $174(pc)
123a: 206dc02a                 movea.l    -$3fd6(a5), a0
123e: 2050                     movea.l    (a0), a0
1240: 2f280210                 move.l     $210(a0), -(a7)
1244: 4267                     clr.w      -(a7)
1246: a95d                     dc.w       $a95d
1248: 206dc02a                 movea.l    -$3fd6(a5), a0
124c: 2050                     movea.l    (a0), a0
124e: 2f28020c                 move.l     $20c(a0), -(a7)
1252: 4267                     clr.w      -(a7)
1254: a95d                     dc.w       $a95d
1256: 0c140002                 cmpi.b     #$2, (a4)
125a: 6612                     bne.b      $126e
125c: 2f2dbe32                 move.l     -$41ce(a5), -(a7)
1260: 3f3c0003                 move.w     #$3, -(a7)
1264: 4267                     clr.w      -(a7)
1266: 3f3c7fff                 move.w     #$7fff, -(a7)
126a: a97e                     dc.w       $a97e
126c: 6010                     bra.b      $127e
126e: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
1272: 3f3c0003                 move.w     #$3, -(a7)
1276: 4267                     clr.w      -(a7)
1278: 3f3c7fff                 move.w     #$7fff, -(a7)
127c: a97e                     dc.w       $a97e
127e: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
1282: 3f3c0005                 move.w     #$5, -(a7)
1286: a93a                     dc.w       $a93a
1288: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
128c: 3f3c0006                 move.w     #$6, -(a7)
1290: a93a                     dc.w       $a93a
1292: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
1296: 3f3c0007                 move.w     #$7, -(a7)
129a: a93a                     dc.w       $a93a
129c: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
12a0: 3f3c000a                 move.w     #$a, -(a7)
12a4: a93a                     dc.w       $a93a
12a6: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
12aa: 3f3c0007                 move.w     #$7, -(a7)
12ae: a93a                     dc.w       $a93a
12b0: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
12b4: 4267                     clr.w      -(a7)
12b6: a939                     dc.w       $a939
12b8: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
12bc: 3f3c0009                 move.w     #$9, -(a7)
12c0: a93a                     dc.w       $a93a
12c2: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
12c6: 3f3c000a                 move.w     #$a, -(a7)
12ca: a93a                     dc.w       $a93a
12cc: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
12d0: 3f3c000c                 move.w     #$c, -(a7)
12d4: a93a                     dc.w       $a93a
12d6: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
12da: 3f3c000d                 move.w     #$d, -(a7)
12de: a93a                     dc.w       $a93a
12e0: 2f2dbe02                 move.l     -$41fe(a5), -(a7)
12e4: 4267                     clr.w      -(a7)
12e6: a93a                     dc.w       $a93a
12e8: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
12ec: 4267                     clr.w      -(a7)
12ee: a93a                     dc.w       $a93a
12f0: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
12f4: 4267                     clr.w      -(a7)
12f6: a93a                     dc.w       $a93a
12f8: 600000f2                 bra.w      $13ec
12fc: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
1300: 3f3c0005                 move.w     #$5, -(a7)
1304: 102dbdb6                 move.b     -$424a(a5), d0
1308: c02c000a                 and.b      $a(a4), d0
130c: 4a2c0014                 tst.b      $14(a4)
1310: 56c1                     sne.b      d1
1312: c001                     and.b      d1, d0
1314: 1f00                     move.b     d0, -(a7)
1316: 4ebaee34                 jsr        $14c(pc)
131a: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
131e: 3f3c0006                 move.w     #$6, -(a7)
1322: 1f2dbdb6                 move.b     -$424a(a5), -(a7)
1326: 4ebaee24                 jsr        $14c(pc)
132a: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
132e: 3f3c0007                 move.w     #$7, -(a7)
1332: 102dbdb6                 move.b     -$424a(a5), d0
1336: c02c000a                 and.b      $a(a4), d0
133a: 4a2c0014                 tst.b      $14(a4)
133e: 56c1                     sne.b      d1
1340: c001                     and.b      d1, d0
1342: 1f00                     move.b     d0, -(a7)
1344: 4ebaee06                 jsr        $14c(pc)
1348: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
134c: 3f3c000a                 move.w     #$a, -(a7)
1350: 1f2dbdb6                 move.b     -$424a(a5), -(a7)
1354: 4ebaedf6                 jsr        $14c(pc)
1358: 2f2dbe02                 move.l     -$41fe(a5), -(a7)
135c: 4267                     clr.w      -(a7)
135e: 1f2dbdb6                 move.b     -$424a(a5), -(a7)
1362: 4ebaede8                 jsr        $14c(pc)
1366: 2f2dbe02                 move.l     -$41fe(a5), -(a7)
136a: 3f3c0006                 move.w     #$6, -(a7)
136e: a939                     dc.w       $a939
1370: 2f2dbe02                 move.l     -$41fe(a5), -(a7)
1374: 3f3c0005                 move.w     #$5, -(a7)
1378: a939                     dc.w       $a939
137a: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
137e: 4267                     clr.w      -(a7)
1380: 1f2dbdb6                 move.b     -$424a(a5), -(a7)
1384: 4ebaedc6                 jsr        $14c(pc)
1388: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
138c: 4267                     clr.w      -(a7)
138e: 1f2dbdb6                 move.b     -$424a(a5), -(a7)
1392: 4ebaedb8                 jsr        $14c(pc)
1396: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
139a: 3f3c0009                 move.w     #$9, -(a7)
139e: 1f2dbdb6                 move.b     -$424a(a5), -(a7)
13a2: 4ebaeda8                 jsr        $14c(pc)
13a6: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
13aa: 3f3c000a                 move.w     #$a, -(a7)
13ae: 1f2dbdb6                 move.b     -$424a(a5), -(a7)
13b2: 4ebaed98                 jsr        $14c(pc)
13b6: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
13ba: 3f3c000c                 move.w     #$c, -(a7)
13be: 1f2dbdb6                 move.b     -$424a(a5), -(a7)
13c2: 4ebaed88                 jsr        $14c(pc)
13c6: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
13ca: 3f3c000d                 move.w     #$d, -(a7)
13ce: 1f2dbdb6                 move.b     -$424a(a5), -(a7)
13d2: 4ebaed78                 jsr        $14c(pc)
13d6: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
13da: 3f3c0007                 move.w     #$7, -(a7)
13de: 1f2dbdb6                 move.b     -$424a(a5), -(a7)
13e2: 4ebaed68                 jsr        $14c(pc)
13e6: 2f2c0002                 move.l     $2(a4), -(a7)
13ea: a9d8                     dc.w       $a9d8
13ec: 4ebaeea6                 jsr        $294(pc)
13f0: a937                     dc.w       $a937
13f2: 4a14                     tst.b      (a4)
13f4: 6664                     bne.b      $145a
13f6: 2f2c0010                 move.l     $10(a4), -(a7)
13fa: 4267                     clr.w      -(a7)
13fc: a95d                     dc.w       $a95d
13fe: 2f2c000c                 move.l     $c(a4), -(a7)
1402: 4267                     clr.w      -(a7)
1404: a95d                     dc.w       $a95d
1406: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
140a: 3f2dbde8                 move.w     -$4218(a5), -(a7)
140e: 4227                     clr.b      -(a7)
1410: a945                     dc.w       $a945
1412: 3b6c0116bde8             move.w     $116(a4), -$4218(a5)
1418: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
141c: 3f2dbde8                 move.w     -$4218(a5), -(a7)
1420: 1f3c0001                 move.b     #$1, -(a7)
1424: a945                     dc.w       $a945
1426: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
142a: 3f2dbdea                 move.w     -$4216(a5), -(a7)
142e: 4227                     clr.b      -(a7)
1430: a945                     dc.w       $a945
1432: 3b6c0118bdea             move.w     $118(a4), -$4216(a5)
1438: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
143c: 3f2dbdea                 move.w     -$4216(a5), -(a7)
1440: 1f3c0001                 move.b     #$1, -(a7)
1444: a945                     dc.w       $a945
1446: 4ebafcb4                 jsr        $10fc(pc)
144a: 302dbdea                 move.w     -$4216(a5), d0
144e: d040                     add.w      d0, d0
1450: 0640f90a                 addi.w     #$f90a, d0
1454: 3b750000bdee             move.w     (a5, d0.w), -$4212(a5)
145a: 4a14                     tst.b      (a4)
145c: 57c0                     seq.b      d0
145e: 0c140001                 cmpi.b     #$1, (a4)
1462: 57c1                     seq.b      d1
1464: 8001                     or.b       d1, d0
1466: 670001d2                 beq.w      $163a
146a: 2f0a                     move.l     a2, -(a7)
146c: a904                     dc.w       $a904
146e: 600001ca                 bra.w      $163a
1472: 42adc030                 clr.l      -$3fd0(a5)
1476: 42adbe2a                 clr.l      -$41d6(a5)
147a: 422dbdb6                 clr.b      -$424a(a5)
147e: 422dbdb7                 clr.b      -$4249(a5)
1482: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
1486: 3f3c0004                 move.w     #$4, -(a7)
148a: a93a                     dc.w       $a93a
148c: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
1490: 3f3c0005                 move.w     #$5, -(a7)
1494: a93a                     dc.w       $a93a
1496: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
149a: 3f3c0006                 move.w     #$6, -(a7)
149e: a93a                     dc.w       $a93a
14a0: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
14a4: 3f3c0007                 move.w     #$7, -(a7)
14a8: a93a                     dc.w       $a93a
14aa: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
14ae: 3f3c000a                 move.w     #$a, -(a7)
14b2: a93a                     dc.w       $a93a
14b4: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
14b8: 3f3c0007                 move.w     #$7, -(a7)
14bc: a93a                     dc.w       $a93a
14be: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
14c2: 3f3c000c                 move.w     #$c, -(a7)
14c6: 4a86                     tst.l      d6
14c8: 56c0                     sne.b      d0
14ca: 4400                     neg.b      d0
14cc: 1f00                     move.b     d0, -(a7)
14ce: 4ebaec7c                 jsr        $14c(pc)
14d2: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
14d6: 4267                     clr.w      -(a7)
14d8: 1f07                     move.b     d7, -(a7)
14da: 4ebaec70                 jsr        $14c(pc)
14de: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
14e2: 3f3c0009                 move.w     #$9, -(a7)
14e6: a93a                     dc.w       $a93a
14e8: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
14ec: 3f3c000a                 move.w     #$a, -(a7)
14f0: a93a                     dc.w       $a93a
14f2: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
14f6: 3f3c000c                 move.w     #$c, -(a7)
14fa: a93a                     dc.w       $a93a
14fc: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
1500: 3f3c000d                 move.w     #$d, -(a7)
1504: a93a                     dc.w       $a93a
1506: 2f2dbe02                 move.l     -$41fe(a5), -(a7)
150a: 4267                     clr.w      -(a7)
150c: 4a86                     tst.l      d6
150e: 56c0                     sne.b      d0
1510: 1207                     move.b     d7, d1
1512: 5301                     subq.b     #$1, d1
1514: c001                     and.b      d1, d0
1516: 4400                     neg.b      d0
1518: 1f00                     move.b     d0, -(a7)
151a: 4ebaec30                 jsr        $14c(pc)
151e: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
1522: 4267                     clr.w      -(a7)
1524: 4a86                     tst.l      d6
1526: 56c0                     sne.b      d0
1528: 1207                     move.b     d7, d1
152a: 5301                     subq.b     #$1, d1
152c: c001                     and.b      d1, d0
152e: 4400                     neg.b      d0
1530: 1f00                     move.b     d0, -(a7)
1532: 4ebaec18                 jsr        $14c(pc)
1536: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
153a: 4267                     clr.w      -(a7)
153c: 4a86                     tst.l      d6
153e: 56c0                     sne.b      d0
1540: 1207                     move.b     d7, d1
1542: 5301                     subq.b     #$1, d1
1544: c001                     and.b      d1, d0
1546: 4400                     neg.b      d0
1548: 1f00                     move.b     d0, -(a7)
154a: 4ebaec00                 jsr        $14c(pc)
154e: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
1552: 4267                     clr.w      -(a7)
1554: 0c6d0002bdf0             cmpi.w     #$2, -$4210(a5)
155a: 5cc0                     sge.b      d0
155c: 4a86                     tst.l      d6
155e: 56c1                     sne.b      d1
1560: 0c6d0001bdf0             cmpi.w     #$1, -$4210(a5)
1566: 5cc2                     sge.b      d2
1568: c202                     and.b      d2, d1
156a: 1407                     move.b     d7, d2
156c: 5302                     subq.b     #$1, d2
156e: c202                     and.b      d2, d1
1570: 8001                     or.b       d1, d0
1572: 4400                     neg.b      d0
1574: 1f00                     move.b     d0, -(a7)
1576: 4ebaebd4                 jsr        $14c(pc)
157a: 0c140002                 cmpi.b     #$2, (a4)
157e: 57c0                     seq.b      d0
1580: 0c140003                 cmpi.b     #$3, (a4)
1584: 57c1                     seq.b      d1
1586: 8001                     or.b       d1, d0
1588: 6700007e                 beq.w      $1608
158c: 2f2dc02a                 move.l     -$3fd6(a5), -(a7)
1590: 205f                     movea.l    (a7)+, a0
1592: a029                     dc.w       $a029
1594: 206dc02a                 movea.l    -$3fd6(a5), a0
1598: 2650                     movea.l    (a0), a3
159a: 2f2b0210                 move.l     $210(a3), -(a7)
159e: 3f3c00ff                 move.w     #$ff, -(a7)
15a2: a95d                     dc.w       $a95d
15a4: 2f2b020c                 move.l     $20c(a3), -(a7)
15a8: 3f3c00ff                 move.w     #$ff, -(a7)
15ac: a95d                     dc.w       $a95d
15ae: 0c130002                 cmpi.b     #$2, (a3)
15b2: 6618                     bne.b      $15cc
15b4: 2f2b0214                 move.l     $214(a3), -(a7)
15b8: 3f3c00ff                 move.w     #$ff, -(a7)
15bc: a95d                     dc.w       $a95d
15be: 2f0a                     move.l     a2, -(a7)
15c0: 3f3c0001                 move.w     #$1, -(a7)
15c4: 4227                     clr.b      -(a7)
15c6: 4ebaf474                 jsr        $a3c(pc)
15ca: 6034                     bra.b      $1600
15cc: 2f2b0214                 move.l     $214(a3), -(a7)
15d0: 3f3c00ff                 move.w     #$ff, -(a7)
15d4: a95d                     dc.w       $a95d
15d6: 2f2b0218                 move.l     $218(a3), -(a7)
15da: 3f3c00ff                 move.w     #$ff, -(a7)
15de: a95d                     dc.w       $a95d
15e0: 2f2b021c                 move.l     $21c(a3), -(a7)
15e4: 3f3c00ff                 move.w     #$ff, -(a7)
15e8: a95d                     dc.w       $a95d
15ea: 2f2b0220                 move.l     $220(a3), -(a7)
15ee: 3f3c00ff                 move.w     #$ff, -(a7)
15f2: a95d                     dc.w       $a95d
15f4: 2f0a                     move.l     a2, -(a7)
15f6: 3f3c0001                 move.w     #$1, -(a7)
15fa: 4227                     clr.b      -(a7)
15fc: 4ebaf43e                 jsr        $a3c(pc)
1600: 2f2dc02a                 move.l     -$3fd6(a5), -(a7)
1604: 205f                     movea.l    (a7)+, a0
1606: a02a                     dc.w       $a02a
1608: a937                     dc.w       $a937
160a: 4a14                     tst.b      (a4)
160c: 6614                     bne.b      $1622
160e: 2f2c0010                 move.l     $10(a4), -(a7)
1612: 3f3c00ff                 move.w     #$ff, -(a7)
1616: a95d                     dc.w       $a95d
1618: 2f2c000c                 move.l     $c(a4), -(a7)
161c: 3f3c00ff                 move.w     #$ff, -(a7)
1620: a95d                     dc.w       $a95d
1622: 4a14                     tst.b      (a4)
1624: 57c0                     seq.b      d0
1626: 0c140001                 cmpi.b     #$1, (a4)
162a: 57c1                     seq.b      d1
162c: 8001                     or.b       d1, d0
162e: 670a                     beq.b      $163a
1630: 2f2c0002                 move.l     $2(a4), -(a7)
1634: a9d9                     dc.w       $a9d9
1636: 2f0a                     move.l     a2, -(a7)
1638: a904                     dc.w       $a904
163a: 0c6d0002bdf2             cmpi.w     #$2, -$420e(a5)
1640: 6d16                     blt.b      $1658
1642: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
1646: 3f3c0001                 move.w     #$1, -(a7)
164a: a939                     dc.w       $a939
164c: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
1650: 3f3c0002                 move.w     #$2, -(a7)
1654: a939                     dc.w       $a939
1656: 6014                     bra.b      $166c
1658: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
165c: 3f3c0001                 move.w     #$1, -(a7)
1660: a93a                     dc.w       $a93a
1662: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
1666: 3f3c0002                 move.w     #$2, -(a7)
166a: a93a                     dc.w       $a93a
166c: 4cdf1cf0                 movem.l    (a7)+, d4-d7/a2-a4
1670: 4e5e                     unlk       a6
1672: 4e75                     rts        
1674: 4e56ffea                 link.w     a6, #$ffea
1678: 48e70718                 movem.l    d5-d7/a3-a4, -(a7)
167c: 206e0008                 movea.l    $8(a6), a0
1680: 2850                     movea.l    (a0), a4
1682: 206c0002                 movea.l    $2(a4), a0
1686: 2650                     movea.l    (a0), a3
1688: 3a2b0008                 move.w     $8(a3), d5
168c: 9a53                     sub.w      (a3), d5
168e: 554f                     subq.w     #$2, a7
1690: 2f2c0010                 move.l     $10(a4), -(a7)
1694: a960                     dc.w       $a960
1696: 3c1f                     move.w     (a7)+, d6
1698: cdeb0018                 muls.w     $18(a3), d6
169c: 3e05                     move.w     d5, d7
169e: 9e46                     sub.w      d6, d7
16a0: 4a47                     tst.w      d7
16a2: 670a                     beq.b      $16ae
16a4: 4267                     clr.w      -(a7)
16a6: 3f07                     move.w     d7, -(a7)
16a8: 2f2c0002                 move.l     $2(a4), -(a7)
16ac: a9dd                     dc.w       $a9dd
16ae: 3a2b000a                 move.w     $a(a3), d5
16b2: 9a6b0002                 sub.w      $2(a3), d5
16b6: 554f                     subq.w     #$2, a7
16b8: 2f2c000c                 move.l     $c(a4), -(a7)
16bc: a960                     dc.w       $a960
16be: 3c1f                     move.w     (a7)+, d6
16c0: e746                     asl.w      #$3, d6
16c2: 3e05                     move.w     d5, d7
16c4: 9e46                     sub.w      d6, d7
16c6: 4a47                     tst.w      d7
16c8: 670a                     beq.b      $16d4
16ca: 3f07                     move.w     d7, -(a7)
16cc: 4267                     clr.w      -(a7)
16ce: 2f2c0002                 move.l     $2(a4), -(a7)
16d2: a9dd                     dc.w       $a9dd
16d4: 4cdf18e0                 movem.l    (a7)+, d5-d7/a3-a4
16d8: 4e5e                     unlk       a6
16da: 2e9f                     move.l     (a7)+, (a7)
16dc: 4e75                     rts        
16de: 4e56ffec                 link.w     a6, #$ffec
16e2: 48e70f08                 movem.l    d4-d7/a4, -(a7)
16e6: 2a2e000a                 move.l     $a(a6), d5
16ea: 382e0008                 move.w     $8(a6), d4
16ee: 4a44                     tst.w      d4
16f0: 67000060                 beq.w      $1752
16f4: 206dc030                 movea.l    -$3fd0(a5), a0
16f8: 2850                     movea.l    (a0), a4
16fa: baac0010                 cmp.l      $10(a4), d5
16fe: 6608                     bne.b      $1708
1700: 3c2c0006                 move.w     $6(a4), d6
1704: 5346                     subq.w     #$1, d6
1706: 600a                     bra.b      $1712
1708: 3c2c0008                 move.w     $8(a4), d6
170c: 48c6                     ext.l      d6
170e: 8dfc0002                 divs.w     #$2, d6
1712: 3004                     move.w     d4, d0
1714: 6012                     bra.b      $1728
1716: 7eff                     moveq      #$ff, d7
1718: 6020                     bra.b      $173a
171a: 7e01                     moveq      #$1, d7
171c: 601c                     bra.b      $173a
171e: 3e06                     move.w     d6, d7
1720: 4447                     neg.w      d7
1722: 6016                     bra.b      $173a
1724: 3e06                     move.w     d6, d7
1726: 6012                     bra.b      $173a
1728: 0640ffec                 addi.w     #$ffec, d0
172c: 67e8                     beq.b      $1716
172e: 5340                     subq.w     #$1, d0
1730: 67e8                     beq.b      $171a
1732: 5340                     subq.w     #$1, d0
1734: 67e8                     beq.b      $171e
1736: 5340                     subq.w     #$1, d0
1738: 67ea                     beq.b      $1724
173a: 2f05                     move.l     d5, -(a7)
173c: 554f                     subq.w     #$2, a7
173e: 2f05                     move.l     d5, -(a7)
1740: a960                     dc.w       $a960
1742: 301f                     move.w     (a7)+, d0
1744: d047                     add.w      d7, d0
1746: 3f00                     move.w     d0, -(a7)
1748: a963                     dc.w       $a963
174a: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
174e: 4ebaff24                 jsr        $1674(pc)
1752: 4cdf10f0                 movem.l    (a7)+, d4-d7/a4
1756: 4e5e                     unlk       a6
1758: 205f                     movea.l    (a7)+, a0
175a: 5c4f                     addq.w     #$6, a7
175c: 4ed0                     jmp        (a0)
175e: 4e56ffe8                 link.w     a6, #$ffe8
1762: 48e70018                 movem.l    a3-a4, -(a7)
1766: 1d7c00010008             move.b     #$1, $8(a6)
176c: 594f                     subq.w     #$4, a7
176e: a8d8                     dc.w       $a8d8
1770: 265f                     movea.l    (a7)+, a3
1772: 2f0b                     move.l     a3, -(a7)
1774: a87a                     dc.w       $a87a
1776: 206dbe2a                 movea.l    -$41d6(a5), a0
177a: 48680010                 pea.l      $10(a0)
177e: a87b                     dc.w       $a87b
1780: 486effec                 pea.l      -$14(a6)
1784: a972                     dc.w       $a972
1786: 206dc030                 movea.l    -$3fd0(a5), a0
178a: 2850                     movea.l    (a0), a4
178c: 206c0002                 movea.l    $2(a4), a0
1790: 2050                     movea.l    (a0), a0
1792: 302effec                 move.w     -$14(a6), d0
1796: b0680008                 cmp.w      $8(a0), d0
179a: 6c0e                     bge.b      $17aa
179c: 2f2c0010                 move.l     $10(a4), -(a7)
17a0: 3f3c0014                 move.w     #$14, -(a7)
17a4: 4ebaff38                 jsr        $16de(pc)
17a8: 601c                     bra.b      $17c6
17aa: 206c0002                 movea.l    $2(a4), a0
17ae: 2050                     movea.l    (a0), a0
17b0: 302effec                 move.w     -$14(a6), d0
17b4: b068000c                 cmp.w      $c(a0), d0
17b8: 6f0c                     ble.b      $17c6
17ba: 2f2c0010                 move.l     $10(a4), -(a7)
17be: 3f3c0015                 move.w     #$15, -(a7)
17c2: 4ebaff1a                 jsr        $16de(pc)
17c6: 2f0b                     move.l     a3, -(a7)
17c8: a879                     dc.w       $a879
17ca: 2f0b                     move.l     a3, -(a7)
17cc: a8d9                     dc.w       $a8d9
17ce: 4cdf1800                 movem.l    (a7)+, a3-a4
17d2: 4e5e                     unlk       a6
17d4: 4e75                     rts        
17d6: 4e560000                 link.w     a6, #$0
17da: 0c6e0081000c             cmpi.w     #$81, $c(a6)
17e0: 6716                     beq.b      $17f8
17e2: 554f                     subq.w     #$2, a7
17e4: 2f2e000e                 move.l     $e(a6), -(a7)
17e8: 2f2e0008                 move.l     $8(a6), -(a7)
17ec: 486d0082                 pea.l      $82(a5)
17f0: a968                     dc.w       $a968
17f2: 3d5f000c                 move.w     (a7)+, $c(a6)
17f6: 601a                     bra.b      $1812
17f8: 554f                     subq.w     #$2, a7
17fa: 2f2e000e                 move.l     $e(a6), -(a7)
17fe: 2f2e0008                 move.l     $8(a6), -(a7)
1802: 42a7                     clr.l      -(a7)
1804: a968                     dc.w       $a968
1806: 3d5f000c                 move.w     (a7)+, $c(a6)
180a: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
180e: 4ebafe64                 jsr        $1674(pc)
1812: 4e5e                     unlk       a6
1814: 205f                     movea.l    (a7)+, a0
1816: 4fef000a                 lea.l      $a(a7), a7
181a: 4ed0                     jmp        (a0)
181c: 4e56ffee                 link.w     a6, #$ffee
1820: 48e70108                 movem.l    d7/a4, -(a7)
1824: 206e0008                 movea.l    $8(a6), a0
1828: 2850                     movea.l    (a0), a4
182a: 554f                     subq.w     #$2, a7
182c: 2f2c0002                 move.l     $2(a4), -(a7)
1830: 4ebaeb4c                 jsr        $37e(pc)
1834: 3e1f                     move.w     (a7)+, d7
1836: 9e6c0006                 sub.w      $6(a4), d7
183a: 4a47                     tst.w      d7
183c: 6c02                     bge.b      $1840
183e: 4247                     clr.w      d7
1840: 2f2c0010                 move.l     $10(a4), -(a7)
1844: 3f07                     move.w     d7, -(a7)
1846: a965                     dc.w       $a965
1848: 4cdf1080                 movem.l    (a7)+, d7/a4
184c: 4e5e                     unlk       a6
184e: 2e9f                     move.l     (a7)+, (a7)
1850: 4e75                     rts        
1852: 4e56ffde                 link.w     a6, #$ffde
1856: 48e70338                 movem.l    d6-d7/a2-a4, -(a7)
185a: 1e2e0008                 move.b     $8(a6), d7
185e: 486effe4                 pea.l      -$1c(a6)
1862: a874                     dc.w       $a874
1864: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
1868: a873                     dc.w       $a873
186a: 1007                     move.b     d7, d0
186c: 5300                     subq.b     #$1, d0
186e: 6712                     beq.b      $1882
1870: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
1874: 3f2e000c                 move.w     $c(a6), -(a7)
1878: 3f2e000a                 move.w     $a(a6), -(a7)
187c: 1f3c0001                 move.b     #$1, -(a7)
1880: a91d                     dc.w       $a91d
1882: 206dbe2a                 movea.l    -$41d6(a5), a0
1886: 48680010                 pea.l      $10(a0)
188a: a928                     dc.w       $a928
188c: 206dc030                 movea.l    -$3fd0(a5), a0
1890: 2650                     movea.l    (a0), a3
1892: 206b0002                 movea.l    $2(a3), a0
1896: 2850                     movea.l    (a0), a4
1898: 206dbe2a                 movea.l    -$41d6(a5), a0
189c: 45e80010                 lea.l      $10(a0), a2
18a0: 41ec0008                 lea.l      $8(a4), a0
18a4: 43eeffe8                 lea.l      -$18(a6), a1
18a8: 22d8                     move.l     (a0)+, (a1)+
18aa: 22d8                     move.l     (a0)+, (a1)+
18ac: 4a13                     tst.b      (a3)
18ae: 660a                     bne.b      $18ba
18b0: 554f                     subq.w     #$2, a7
18b2: 2f2b0010                 move.l     $10(a3), -(a7)
18b6: a960                     dc.w       $a960
18b8: 3c1f                     move.w     (a7)+, d6
18ba: 302a0004                 move.w     $4(a2), d0
18be: 0640fff0                 addi.w     #$fff0, d0
18c2: 5740                     subq.w     #$3, d0
18c4: 3940000c                 move.w     d0, $c(a4)
18c8: 302a0006                 move.w     $6(a2), d0
18cc: 0640fff0                 addi.w     #$fff0, d0
18d0: 3940000e                 move.w     d0, $e(a4)
18d4: 302c000c                 move.w     $c(a4), d0
18d8: 906c0008                 sub.w      $8(a4), d0
18dc: 48c0                     ext.l      d0
18de: 81ec0018                 divs.w     $18(a4), d0
18e2: 37400006                 move.w     d0, $6(a3)
18e6: 302b0006                 move.w     $6(a3), d0
18ea: c1ec0018                 muls.w     $18(a4), d0
18ee: d06c0008                 add.w      $8(a4), d0
18f2: 3940000c                 move.w     d0, $c(a4)
18f6: 302c000e                 move.w     $e(a4), d0
18fa: 906c000a                 sub.w      $a(a4), d0
18fe: 48c0                     ext.l      d0
1900: 81fc0008                 divs.w     #$8, d0
1904: 37400008                 move.w     d0, $8(a3)
1908: 41ec0008                 lea.l      $8(a4), a0
190c: 43d4                     lea.l      (a4), a1
190e: 22d8                     move.l     (a0)+, (a1)+
1910: 22d8                     move.l     (a0)+, (a1)+
1912: 302c0006                 move.w     $6(a4), d0
1916: 064007d0                 addi.w     #$7d0, d0
191a: 39400006                 move.w     d0, $6(a4)
191e: 4a13                     tst.b      (a3)
1920: 6676                     bne.b      $1998
1922: a896                     dc.w       $a896
1924: 2f2b0010                 move.l     $10(a3), -(a7)
1928: 302a0006                 move.w     $6(a2), d0
192c: 0640fff1                 addi.w     #$fff1, d0
1930: 3f00                     move.w     d0, -(a7)
1932: 3f3cffff                 move.w     #$ffff, -(a7)
1936: a959                     dc.w       $a959
1938: 2f2b000c                 move.l     $c(a3), -(a7)
193c: 3f3cffff                 move.w     #$ffff, -(a7)
1940: 302a0004                 move.w     $4(a2), d0
1944: 0640fff1                 addi.w     #$fff1, d0
1948: 3f00                     move.w     d0, -(a7)
194a: a959                     dc.w       $a959
194c: 2f2b0010                 move.l     $10(a3), -(a7)
1950: 3f3c0010                 move.w     #$10, -(a7)
1954: 302a0004                 move.w     $4(a2), d0
1958: 5240                     addq.w     #$1, d0
195a: 3212                     move.w     (a2), d1
195c: 5341                     subq.w     #$1, d1
195e: 9041                     sub.w      d1, d0
1960: 0640fff1                 addi.w     #$fff1, d0
1964: 3f00                     move.w     d0, -(a7)
1966: a95c                     dc.w       $a95c
1968: 2f2b000c                 move.l     $c(a3), -(a7)
196c: 302a0006                 move.w     $6(a2), d0
1970: 5240                     addq.w     #$1, d0
1972: 322a0002                 move.w     $2(a2), d1
1976: 5341                     subq.w     #$1, d1
1978: 9041                     sub.w      d1, d0
197a: 0640fff1                 addi.w     #$fff1, d0
197e: 3f00                     move.w     d0, -(a7)
1980: 3f3c0010                 move.w     #$10, -(a7)
1984: a95c                     dc.w       $a95c
1986: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
198a: 4ebafe90                 jsr        $181c(pc)
198e: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
1992: 4ebafce0                 jsr        $1674(pc)
1996: a897                     dc.w       $a897
1998: 4a13                     tst.b      (a3)
199a: 663c                     bne.b      $19d8
199c: 554f                     subq.w     #$2, a7
199e: 2f2b0010                 move.l     $10(a3), -(a7)
19a2: a960                     dc.w       $a960
19a4: bc5f                     cmp.w      (a7)+, d6
19a6: 57c0                     seq.b      d0
19a8: 1207                     move.b     d7, d1
19aa: 5301                     subq.b     #$1, d1
19ac: c001                     and.b      d1, d0
19ae: 6754                     beq.b      $1a04
19b0: 302c000e                 move.w     $e(a4), d0
19b4: b06effee                 cmp.w      -$12(a6), d0
19b8: 6c06                     bge.b      $19c0
19ba: 3d6c000effee             move.w     $e(a4), -$12(a6)
19c0: 302c000c                 move.w     $c(a4), d0
19c4: b06effec                 cmp.w      -$14(a6), d0
19c8: 6c06                     bge.b      $19d0
19ca: 3d6c000cffec             move.w     $c(a4), -$14(a6)
19d0: 486effe8                 pea.l      -$18(a6)
19d4: a92a                     dc.w       $a92a
19d6: 602c                     bra.b      $1a04
19d8: 1007                     move.b     d7, d0
19da: 5300                     subq.b     #$1, d0
19dc: 6726                     beq.b      $1a04
19de: 302c000e                 move.w     $e(a4), d0
19e2: b06effee                 cmp.w      -$12(a6), d0
19e6: 6c06                     bge.b      $19ee
19e8: 3d6c000effee             move.w     $e(a4), -$12(a6)
19ee: 302c000c                 move.w     $c(a4), d0
19f2: b06effec                 cmp.w      -$14(a6), d0
19f6: 6c06                     bge.b      $19fe
19f8: 3d6c000cffec             move.w     $c(a4), -$14(a6)
19fe: 486effe8                 pea.l      -$18(a6)
1a02: a92a                     dc.w       $a92a
1a04: 2f2effe4                 move.l     -$1c(a6), -(a7)
1a08: a873                     dc.w       $a873
1a0a: 4cdf1cc0                 movem.l    (a7)+, d6-d7/a2-a4
1a0e: 4e5e                     unlk       a6
1a10: 205f                     movea.l    (a7)+, a0
1a12: 5c4f                     addq.w     #$6, a7
1a14: 4ed0                     jmp        (a0)
1a16: 4e56ffe8                 link.w     a6, #$ffe8
1a1a: 202dbe2a                 move.l     -$41d6(a5), d0
1a1e: b0ae0008                 cmp.l      $8(a6), d0
1a22: 57c0                     seq.b      d0
1a24: 322dbdd8                 move.w     -$4228(a5), d1
1a28: 02410100                 andi.w     #$100, d1
1a2c: 0c410100                 cmpi.w     #$100, d1
1a30: 57c1                     seq.b      d1
1a32: 8001                     or.b       d1, d0
1a34: 6734                     beq.b      $1a6a
1a36: 594f                     subq.w     #$4, a7
1a38: 2eb809ee                 move.l     $9ee.w, (a7)
1a3c: 205f                     movea.l    (a7)+, a0
1a3e: 2050                     movea.l    (a0), a0
1a40: 41e80002                 lea.l      $2(a0), a0
1a44: 43eeffe8                 lea.l      -$18(a6), a1
1a48: 22d8                     move.l     (a0)+, (a1)+
1a4a: 22d8                     move.l     (a0)+, (a1)+
1a4c: 486effe8                 pea.l      -$18(a6)
1a50: 3f3c0004                 move.w     #$4, -(a7)
1a54: 3f3c0004                 move.w     #$4, -(a7)
1a58: a8a9                     dc.w       $a8a9
1a5a: 2f2e0008                 move.l     $8(a6), -(a7)
1a5e: 2f2dbdd4                 move.l     -$422c(a5), -(a7)
1a62: 486effe8                 pea.l      -$18(a6)
1a66: a925                     dc.w       $a925
1a68: 6006                     bra.b      $1a70
1a6a: 2f2e0008                 move.l     $8(a6), -(a7)
1a6e: a91f                     dc.w       $a91f
1a70: 4e5e                     unlk       a6
1a72: 2e9f                     move.l     (a7)+, (a7)
1a74: 4e75                     rts        
1a76: 4e56ffee                 link.w     a6, #$ffee
1a7a: 48e70138                 movem.l    d7/a2-a4, -(a7)
1a7e: 246e0008                 movea.l    $8(a6), a2
1a82: 2852                     movea.l    (a2), a4
1a84: 206c0002                 movea.l    $2(a4), a0
1a88: 2650                     movea.l    (a0), a3
1a8a: 4247                     clr.w      d7
1a8c: 6002                     bra.b      $1a90
1a8e: 5247                     addq.w     #$1, d7
1a90: 3007                     move.w     d7, d0
1a92: d040                     add.w      d0, d0
1a94: 322b0020                 move.w     $20(a3), d1
1a98: b2730060                 cmp.w      $60(a3, d0.w), d1
1a9c: 6cf0                     bge.b      $1a8e
1a9e: 2f2c0010                 move.l     $10(a4), -(a7)
1aa2: 302c0006                 move.w     $6(a4), d0
1aa6: 48c0                     ext.l      d0
1aa8: 81fc0002                 divs.w     #$2, d0
1aac: 3207                     move.w     d7, d1
1aae: 9240                     sub.w      d0, d1
1ab0: 3f01                     move.w     d1, -(a7)
1ab2: a963                     dc.w       $a963
1ab4: 2f0a                     move.l     a2, -(a7)
1ab6: 4ebafbbc                 jsr        $1674(pc)
1aba: 4cdf1c80                 movem.l    (a7)+, d7/a2-a4
1abe: 4e5e                     unlk       a6
1ac0: 2e9f                     move.l     (a7)+, (a7)
1ac2: 4e75                     rts        
1ac4: 4e56ffec                 link.w     a6, #$ffec
1ac8: 48e70338                 movem.l    d6-d7/a2-a4, -(a7)
1acc: 246e0008                 movea.l    $8(a6), a2
1ad0: 2f0a                     move.l     a2, -(a7)
1ad2: 4ebafd48                 jsr        $181c(pc)
1ad6: 2f0a                     move.l     a2, -(a7)
1ad8: 4ebafb9a                 jsr        $1674(pc)
1adc: 2652                     movea.l    (a2), a3
1ade: 206b0002                 movea.l    $2(a3), a0
1ae2: 2850                     movea.l    (a0), a4
1ae4: 554f                     subq.w     #$2, a7
1ae6: 2f2b0010                 move.l     $10(a3), -(a7)
1aea: a960                     dc.w       $a960
1aec: 3e1f                     move.w     (a7)+, d7
1aee: 3c07                     move.w     d7, d6
1af0: dc6b0006                 add.w      $6(a3), d6
1af4: 3007                     move.w     d7, d0
1af6: d040                     add.w      d0, d0
1af8: 322c0020                 move.w     $20(a4), d1
1afc: b2740060                 cmp.w      $60(a4, d0.w), d1
1b00: 6c08                     bge.b      $1b0a
1b02: 2f0a                     move.l     a2, -(a7)
1b04: 4ebaff70                 jsr        $1a76(pc)
1b08: 6014                     bra.b      $1b1e
1b0a: 3006                     move.w     d6, d0
1b0c: d040                     add.w      d0, d0
1b0e: 322c0020                 move.w     $20(a4), d1
1b12: b2740060                 cmp.w      $60(a4, d0.w), d1
1b16: 6d06                     blt.b      $1b1e
1b18: 2f0a                     move.l     a2, -(a7)
1b1a: 4ebaff5a                 jsr        $1a76(pc)
1b1e: 4cdf1cc0                 movem.l    (a7)+, d6-d7/a2-a4
1b22: 4e5e                     unlk       a6
1b24: 2e9f                     move.l     (a7)+, (a7)
1b26: 4e75                     rts        
1b28: 4e56fdd2                 link.w     a6, #$fdd2
1b2c: 48e70738                 movem.l    d5-d7/a2-a4, -(a7)
1b30: 2e2e000e                 move.l     $e(a6), d7
1b34: 1c2e0008                 move.b     $8(a6), d6
1b38: 206e0018                 movea.l    $18(a6), a0
1b3c: 43eefde8                 lea.l      -$218(a6), a1
1b40: 703f                     moveq      #$3f, d0
1b42: 22d8                     move.l     (a0)+, (a1)+
1b44: 51c8fffc                 dbra       d0, $1b42
1b48: 206e0014                 movea.l    $14(a6), a0
1b4c: 43eefee8                 lea.l      -$118(a6), a1
1b50: 703f                     moveq      #$3f, d0
1b52: 22d8                     move.l     (a0)+, (a1)+
1b54: 51c8fffc                 dbra       d0, $1b52
1b58: 206e000a                 movea.l    $a(a6), a0
1b5c: 43eeffe8                 lea.l      -$18(a6), a1
1b60: 22d8                     move.l     (a0)+, (a1)+
1b62: 22d8                     move.l     (a0)+, (a1)+
1b64: 95ca                     suba.l     a2, a2
1b66: 206dbdc6                 movea.l    -$423a(a5), a0
1b6a: 2f10                     move.l     (a0), -(a7)
1b6c: a851                     dc.w       $a851
1b6e: 4a2dbdb4                 tst.b      -$424c(a5)
1b72: 6722                     beq.b      $1b96
1b74: 594f                     subq.w     #$4, a7
1b76: 2f07                     move.l     d7, -(a7)
1b78: 486effe8                 pea.l      -$18(a6)
1b7c: 486efde8                 pea.l      -$218(a6)
1b80: 4227                     clr.b      -(a7)
1b82: 3f3c0008                 move.w     #$8, -(a7)
1b86: 70ff                     moveq      #$ff, d0
1b88: 2f00                     move.l     d0, -(a7)
1b8a: 1f3c0001                 move.b     #$1, -(a7)
1b8e: 42a7                     clr.l      -(a7)
1b90: a913                     dc.w       $a913
1b92: 2e1f                     move.l     (a7)+, d7
1b94: 601e                     bra.b      $1bb4
1b96: 594f                     subq.w     #$4, a7
1b98: 2f07                     move.l     d7, -(a7)
1b9a: 486effe8                 pea.l      -$18(a6)
1b9e: 486efde8                 pea.l      -$218(a6)
1ba2: 4227                     clr.b      -(a7)
1ba4: 4267                     clr.w      -(a7)
1ba6: 70ff                     moveq      #$ff, d0
1ba8: 2f00                     move.l     d0, -(a7)
1baa: 1f3c0001                 move.b     #$1, -(a7)
1bae: 42a7                     clr.l      -(a7)
1bb0: a913                     dc.w       $a913
1bb2: 2e1f                     move.l     (a7)+, d7
1bb4: 4a06                     tst.b      d6
1bb6: 6610                     bne.b      $1bc8
1bb8: 594f                     subq.w     #$4, a7
1bba: 2f3c000022da             move.l     #$22da, -(a7)
1bc0: 4ead015a                 jsr        $15a(a5) ; CODE 1 resource+0x053a
1bc4: 245f                     movea.l    (a7)+, a2
1bc6: 600c                     bra.b      $1bd4
1bc8: 594f                     subq.w     #$4, a7
1bca: 700a                     moveq      #$a, d0
1bcc: 2f00                     move.l     d0, -(a7)
1bce: 4ead015a                 jsr        $15a(a5) ; CODE 1 resource+0x053a
1bd2: 245f                     movea.l    (a7)+, a2
1bd4: 200a                     move.l     a2, d0
1bd6: 67000240                 beq.w      $1e18
1bda: 2f07                     move.l     d7, -(a7)
1bdc: 2f0a                     move.l     a2, -(a7)
1bde: a918                     dc.w       $a918
1be0: 2f07                     move.l     d7, -(a7)
1be2: a873                     dc.w       $a873
1be4: 3f2dbdec                 move.w     -$4214(a5), -(a7)
1be8: a887                     dc.w       $a887
1bea: 3f2dbdee                 move.w     -$4212(a5), -(a7)
1bee: a88a                     dc.w       $a88a
1bf0: 4a06                     tst.b      d6
1bf2: 6610                     bne.b      $1c04
1bf4: 2052                     movea.l    (a2), a0
1bf6: 316dbde80116             move.w     -$4218(a5), $116(a0)
1bfc: 2052                     movea.l    (a2), a0
1bfe: 316dbdea0118             move.w     -$4216(a5), $118(a0)
1c04: 486efdd8                 pea.l      -$228(a6)
1c08: a88b                     dc.w       $a88b
1c0a: 3a2efdd8                 move.w     -$228(a6), d5
1c0e: da6efdda                 add.w      -$226(a6), d5
1c12: da6efdde                 add.w      -$222(a6), d5
1c16: 2f0a                     move.l     a2, -(a7)
1c18: 205f                     movea.l    (a7)+, a0
1c1a: a029                     dc.w       $a029
1c1c: 2047                     movea.l    d7, a0
1c1e: 47e80010                 lea.l      $10(a0), a3
1c22: 2852                     movea.l    (a2), a4
1c24: 4a06                     tst.b      d6
1c26: 6600009c                 bne.w      $1cc4
1c2a: 486efde0                 pea.l      -$220(a6)
1c2e: 302b0006                 move.w     $6(a3), d0
1c32: 0640fff0                 addi.w     #$fff0, d0
1c36: 5240                     addq.w     #$1, d0
1c38: 3f00                     move.w     d0, -(a7)
1c3a: 3f3cffff                 move.w     #$ffff, -(a7)
1c3e: 302b0006                 move.w     $6(a3), d0
1c42: 5240                     addq.w     #$1, d0
1c44: 3f00                     move.w     d0, -(a7)
1c46: 302b0004                 move.w     $4(a3), d0
1c4a: 0640fff0                 addi.w     #$fff0, d0
1c4e: 5440                     addq.w     #$2, d0
1c50: 3f00                     move.w     d0, -(a7)
1c52: a8a7                     dc.w       $a8a7
1c54: 594f                     subq.w     #$4, a7
1c56: 2f07                     move.l     d7, -(a7)
1c58: 486efde0                 pea.l      -$220(a6)
1c5c: 487a01ca                 pea.l      $1e28(pc)
1c60: 1f3c0001                 move.b     #$1, -(a7)
1c64: 4267                     clr.w      -(a7)
1c66: 4267                     clr.w      -(a7)
1c68: 4267                     clr.w      -(a7)
1c6a: 3f3c0010                 move.w     #$10, -(a7)
1c6e: 42a7                     clr.l      -(a7)
1c70: a954                     dc.w       $a954
1c72: 295f0010                 move.l     (a7)+, $10(a4)
1c76: 486efde0                 pea.l      -$220(a6)
1c7a: 3f3cffff                 move.w     #$ffff, -(a7)
1c7e: 302b0004                 move.w     $4(a3), d0
1c82: 0640fff0                 addi.w     #$fff0, d0
1c86: 5240                     addq.w     #$1, d0
1c88: 3f00                     move.w     d0, -(a7)
1c8a: 302b0006                 move.w     $6(a3), d0
1c8e: 0640fff0                 addi.w     #$fff0, d0
1c92: 5440                     addq.w     #$2, d0
1c94: 3f00                     move.w     d0, -(a7)
1c96: 302b0004                 move.w     $4(a3), d0
1c9a: 5240                     addq.w     #$1, d0
1c9c: 3f00                     move.w     d0, -(a7)
1c9e: a8a7                     dc.w       $a8a7
1ca0: 594f                     subq.w     #$4, a7
1ca2: 2f07                     move.l     d7, -(a7)
1ca4: 486efde0                 pea.l      -$220(a6)
1ca8: 487a017c                 pea.l      $1e26(pc)
1cac: 1f3c0001                 move.b     #$1, -(a7)
1cb0: 4267                     clr.w      -(a7)
1cb2: 4267                     clr.w      -(a7)
1cb4: 3f3c0200                 move.w     #$200, -(a7)
1cb8: 3f3c0010                 move.w     #$10, -(a7)
1cbc: 42a7                     clr.l      -(a7)
1cbe: a954                     dc.w       $a954
1cc0: 295f000c                 move.l     (a7)+, $c(a4)
1cc4: 486efde0                 pea.l      -$220(a6)
1cc8: 3f3c000a                 move.w     #$a, -(a7)
1ccc: 3f3c0004                 move.w     #$4, -(a7)
1cd0: 302b0006                 move.w     $6(a3), d0
1cd4: 0640fff0                 addi.w     #$fff0, d0
1cd8: 3f00                     move.w     d0, -(a7)
1cda: 302b0004                 move.w     $4(a3), d0
1cde: 0640fff0                 addi.w     #$fff0, d0
1ce2: 5740                     subq.w     #$3, d0
1ce4: 3f00                     move.w     d0, -(a7)
1ce6: a8a7                     dc.w       $a8a7
1ce8: 302efde4                 move.w     -$21c(a6), d0
1cec: 906efde0                 sub.w      -$220(a6), d0
1cf0: 48c0                     ext.l      d0
1cf2: 81c5                     divs.w     d5, d0
1cf4: 39400006                 move.w     d0, $6(a4)
1cf8: 302c0006                 move.w     $6(a4), d0
1cfc: c1c5                     muls.w     d5, d0
1cfe: d06efde0                 add.w      -$220(a6), d0
1d02: 3d40fde4                 move.w     d0, -$21c(a6)
1d06: 302efde6                 move.w     -$21a(a6), d0
1d0a: 906efde2                 sub.w      -$21e(a6), d0
1d0e: 48c0                     ext.l      d0
1d10: 81fc0008                 divs.w     #$8, d0
1d14: 39400008                 move.w     d0, $8(a4)
1d18: 594f                     subq.w     #$4, a7
1d1a: 486efde0                 pea.l      -$220(a6)
1d1e: 486efde0                 pea.l      -$220(a6)
1d22: a9d2                     dc.w       $a9d2
1d24: 295f0002                 move.l     (a7)+, $2(a4)
1d28: 206c0002                 movea.l    $2(a4), a0
1d2c: 2050                     movea.l    (a0), a0
1d2e: 317cffff0048             move.w     #$ffff, $48(a0)
1d34: 1886                     move.b     d6, (a4)
1d36: 0c060001                 cmpi.b     #$1, d6
1d3a: 663a                     bne.b      $1d76
1d3c: 206c0002                 movea.l    $2(a4), a0
1d40: 2050                     movea.l    (a0), a0
1d42: 2f28003e                 move.l     $3e(a0), -(a7)
1d46: 205f                     movea.l    (a7)+, a0
1d48: a023                     dc.w       $a023
1d4a: 594f                     subq.w     #$4, a7
1d4c: 2eb80ab4                 move.l     $ab4.w, (a7)
1d50: 206c0002                 movea.l    $2(a4), a0
1d54: 2050                     movea.l    (a0), a0
1d56: 215f003e                 move.l     (a7)+, $3e(a0)
1d5a: 594f                     subq.w     #$4, a7
1d5c: 4ead022a                 jsr        $22a(a5) ; CODE 1 resource+0x0992
1d60: 206c0002                 movea.l    $2(a4), a0
1d64: 2050                     movea.l    (a0), a0
1d66: 544f                     addq.w     #$2, a7
1d68: 315f003c                 move.w     (a7)+, $3c(a0)
1d6c: 2f2c0002                 move.l     $2(a4), -(a7)
1d70: a9d0                     dc.w       $a9d0
1d72: 6000008e                 bra.w      $1e02
1d76: 4a06                     tst.b      d6
1d78: 66000088                 bne.w      $1e02
1d7c: 486d008a                 pea.l      $8a(a5)
1d80: 2f2c0002                 move.l     $2(a4), -(a7)
1d84: 4ead0242                 jsr        $242(a5) ; CODE 1 resource+0x0a1a
1d88: 422c000a                 clr.b      $a(a4)
1d8c: 422c011a                 clr.b      $11a(a4)
1d90: 3f3c00ff                 move.w     #$ff, -(a7)
1d94: 486efee8                 pea.l      -$118(a6)
1d98: 486c0014                 pea.l      $14(a4)
1d9c: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
1da0: 396e00120114             move.w     $12(a6), $114(a4)
1da6: 4a2efee8                 tst.b      -$118(a6)
1daa: 674e                     beq.b      $1dfa
1dac: 206c0002                 movea.l    $2(a4), a0
1db0: 2050                     movea.l    (a0), a0
1db2: 2f28003e                 move.l     $3e(a0), -(a7)
1db6: 205f                     movea.l    (a7)+, a0
1db8: a023                     dc.w       $a023
1dba: 206c0002                 movea.l    $2(a4), a0
1dbe: 2050                     movea.l    (a0), a0
1dc0: 216dbdde003e             move.l     -$4222(a5), $3e(a0)
1dc6: 594f                     subq.w     #$4, a7
1dc8: 2f2dbdde                 move.l     -$4222(a5), -(a7)
1dcc: 4ead0162                 jsr        $162(a5) ; CODE 1 resource+0x0544
1dd0: 206c0002                 movea.l    $2(a4), a0
1dd4: 2050                     movea.l    (a0), a0
1dd6: 544f                     addq.w     #$2, a7
1dd8: 315f003c                 move.w     (a7)+, $3c(a0)
1ddc: 2f2c0002                 move.l     $2(a4), -(a7)
1de0: a9d0                     dc.w       $a9d0
1de2: 2f0a                     move.l     a2, -(a7)
1de4: 4ebafa36                 jsr        $181c(pc)
1de8: 486efde8                 pea.l      -$218(a6)
1dec: 486efee8                 pea.l      -$118(a6)
1df0: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
1df4: 6704                     beq.b      $1dfa
1df6: 422c0014                 clr.b      $14(a4)
1dfa: 2f07                     move.l     d7, -(a7)
1dfc: a915                     dc.w       $a915
1dfe: 2f07                     move.l     d7, -(a7)
1e00: a91f                     dc.w       $a91f
1e02: 42a7                     clr.l      -(a7)
1e04: 42a7                     clr.l      -(a7)
1e06: 2f2c0002                 move.l     $2(a4), -(a7)
1e0a: a9d1                     dc.w       $a9d1
1e0c: 2f0a                     move.l     a2, -(a7)
1e0e: 205f                     movea.l    (a7)+, a0
1e10: a02a                     dc.w       $a02a
1e12: 422dbdb8                 clr.b      -$4248(a5)
1e16: a850                     dc.w       $a850
1e18: 4cdf1ce0                 movem.l    (a7)+, d5-d7/a2-a4
1e1c: 4e5e                     unlk       a6
1e1e: 205f                     movea.l    (a7)+, a0
1e20: 4fef0014                 lea.l      $14(a7), a7
1e24: 4ed0                     jmp        (a0)
1e26: 00000000                 ori.b      #$0, d0
1e2a: 4e56ffec                 link.w     a6, #$ffec
1e2e: 2f0c                     move.l     a4, -(a7)
1e30: 594f                     subq.w     #$4, a7
1e32: 2f2e0008                 move.l     $8(a6), -(a7)
1e36: a917                     dc.w       $a917
1e38: 285f                     movea.l    (a7)+, a4
1e3a: 2f2e0008                 move.l     $8(a6), -(a7)
1e3e: a92d                     dc.w       $a92d
1e40: 2054                     movea.l    (a4), a0
1e42: 2f280002                 move.l     $2(a0), -(a7)
1e46: a9cd                     dc.w       $a9cd
1e48: 2f0c                     move.l     a4, -(a7)
1e4a: 205f                     movea.l    (a7)+, a0
1e4c: a023                     dc.w       $a023
1e4e: 285f                     movea.l    (a7)+, a4
1e50: 4e5e                     unlk       a6
1e52: 2e9f                     move.l     (a7)+, (a7)
1e54: 4e75                     rts        
1e56: 4e56ffe8                 link.w     a6, #$ffe8
1e5a: 554f                     subq.w     #$2, a7
1e5c: 2f2e000a                 move.l     $a(a6), -(a7)
1e60: 2f2dbdd4                 move.l     -$422c(a5), -(a7)
1e64: 3f2e0008                 move.w     $8(a6), -(a7)
1e68: a83b                     dc.w       $a83b
1e6a: 4a1f                     tst.b      (a7)+
1e6c: 6722                     beq.b      $1e90
1e6e: 206e000a                 movea.l    $a(a6), a0
1e72: 48680010                 pea.l      $10(a0)
1e76: a8a3                     dc.w       $a8a3
1e78: 2f2e000a                 move.l     $a(a6), -(a7)
1e7c: 3f2e0008                 move.w     $8(a6), -(a7)
1e80: 4227                     clr.b      -(a7)
1e82: a83a                     dc.w       $a83a
1e84: 4267                     clr.w      -(a7)
1e86: 4267                     clr.w      -(a7)
1e88: 1f3c0001                 move.b     #$1, -(a7)
1e8c: 4ebaf9c4                 jsr        $1852(pc)
1e90: 4e5e                     unlk       a6
1e92: 205f                     movea.l    (a7)+, a0
1e94: 5c4f                     addq.w     #$6, a7
1e96: 4ed0                     jmp        (a0)
1e98: 4e56ffd8                 link.w     a6, #$ffd8
1e9c: 48e70138                 movem.l    d7/a2-a4, -(a7)
1ea0: 246e000e                 movea.l    $e(a6), a2
1ea4: 2e2e000a                 move.l     $a(a6), d7
1ea8: 2f0a                     move.l     a2, -(a7)
1eaa: 205f                     movea.l    (a7)+, a0
1eac: a029                     dc.w       $a029
1eae: 2052                     movea.l    (a2), a0
1eb0: 2f280002                 move.l     $2(a0), -(a7)
1eb4: 205f                     movea.l    (a7)+, a0
1eb6: a029                     dc.w       $a029
1eb8: 486effdc                 pea.l      -$24(a6)
1ebc: a874                     dc.w       $a874
1ebe: 2f07                     move.l     d7, -(a7)
1ec0: a873                     dc.w       $a873
1ec2: 2652                     movea.l    (a2), a3
1ec4: 206b0002                 movea.l    $2(a3), a0
1ec8: 2850                     movea.l    (a0), a4
1eca: 4a2e0008                 tst.b      $8(a6)
1ece: 6714                     beq.b      $1ee4
1ed0: 3f2dbdec                 move.w     -$4214(a5), -(a7)
1ed4: a887                     dc.w       $a887
1ed6: 396dbdec004a             move.w     -$4214(a5), $4a(a4)
1edc: 376dbde80116             move.w     -$4218(a5), $116(a3)
1ee2: 6012                     bra.b      $1ef6
1ee4: 3f2dbdee                 move.w     -$4212(a5), -(a7)
1ee8: a88a                     dc.w       $a88a
1eea: 396dbdee0050             move.w     -$4212(a5), $50(a4)
1ef0: 376dbdea0118             move.w     -$4216(a5), $118(a3)
1ef6: 486effe8                 pea.l      -$18(a6)
1efa: a88b                     dc.w       $a88b
1efc: 302effe8                 move.w     -$18(a6), d0
1f00: d06effea                 add.w      -$16(a6), d0
1f04: d06effee                 add.w      -$12(a6), d0
1f08: 39400018                 move.w     d0, $18(a4)
1f0c: 396effe8001a             move.w     -$18(a6), $1a(a4)
1f12: 2047                     movea.l    d7, a0
1f14: 41e80010                 lea.l      $10(a0), a0
1f18: 2d48ffd8                 move.l     a0, -$28(a6)
1f1c: 206effd8                 movea.l    -$28(a6), a0
1f20: 30280004                 move.w     $4(a0), d0
1f24: 0640fff0                 addi.w     #$fff0, d0
1f28: 5540                     subq.w     #$2, d0
1f2a: 3940000c                 move.w     d0, $c(a4)
1f2e: 302c000c                 move.w     $c(a4), d0
1f32: 906c0008                 sub.w      $8(a4), d0
1f36: 48c0                     ext.l      d0
1f38: 81ec0018                 divs.w     $18(a4), d0
1f3c: 37400006                 move.w     d0, $6(a3)
1f40: 302b0006                 move.w     $6(a3), d0
1f44: c1ec0018                 muls.w     $18(a4), d0
1f48: d06c0008                 add.w      $8(a4), d0
1f4c: 3940000c                 move.w     d0, $c(a4)
1f50: 41ec0008                 lea.l      $8(a4), a0
1f54: 43d4                     lea.l      (a4), a1
1f56: 22d8                     move.l     (a0)+, (a1)+
1f58: 22d8                     move.l     (a0)+, (a1)+
1f5a: 302c0006                 move.w     $6(a4), d0
1f5e: 064007d0                 addi.w     #$7d0, d0
1f62: 39400006                 move.w     d0, $6(a4)
1f66: 2f0a                     move.l     a2, -(a7)
1f68: 4ebaf8b2                 jsr        $181c(pc)
1f6c: 2f2b0010                 move.l     $10(a3), -(a7)
1f70: 4267                     clr.w      -(a7)
1f72: a963                     dc.w       $a963
1f74: 2047                     movea.l    d7, a0
1f76: 41e80010                 lea.l      $10(a0), a0
1f7a: 43eeffe0                 lea.l      -$20(a6), a1
1f7e: 22d8                     move.l     (a0)+, (a1)+
1f80: 22d8                     move.l     (a0)+, (a1)+
1f82: 302effe6                 move.w     -$1a(a6), d0
1f86: 0640fff0                 addi.w     #$fff0, d0
1f8a: 5240                     addq.w     #$1, d0
1f8c: 3d40ffe6                 move.w     d0, -$1a(a6)
1f90: 302effe4                 move.w     -$1c(a6), d0
1f94: 0640fff0                 addi.w     #$fff0, d0
1f98: 5240                     addq.w     #$1, d0
1f9a: 3d40ffe4                 move.w     d0, -$1c(a6)
1f9e: 486effe0                 pea.l      -$20(a6)
1fa2: a928                     dc.w       $a928
1fa4: 2f2effdc                 move.l     -$24(a6), -(a7)
1fa8: a873                     dc.w       $a873
1faa: 2052                     movea.l    (a2), a0
1fac: 2f280002                 move.l     $2(a0), -(a7)
1fb0: 205f                     movea.l    (a7)+, a0
1fb2: a02a                     dc.w       $a02a
1fb4: 2f0a                     move.l     a2, -(a7)
1fb6: 205f                     movea.l    (a7)+, a0
1fb8: a02a                     dc.w       $a02a
1fba: 4cdf1c80                 movem.l    (a7)+, d7/a2-a4
1fbe: 4e5e                     unlk       a6
1fc0: 205f                     movea.l    (a7)+, a0
1fc2: 4fef000a                 lea.l      $a(a7), a7
1fc6: 4ed0                     jmp        (a0)
1fc8: 4e56ffe8                 link.w     a6, #$ffe8
1fcc: 48e70018                 movem.l    a3-a4, -(a7)
1fd0: 594f                     subq.w     #$4, a7
1fd2: a924                     dc.w       $a924
1fd4: 285f                     movea.l    (a7)+, a4
1fd6: 4a6c006c                 tst.w      $6c(a4)
1fda: 6c08                     bge.b      $1fe4
1fdc: 3f2c006c                 move.w     $6c(a4), -(a7)
1fe0: a9b7                     dc.w       $a9b7
1fe2: 601c                     bra.b      $2000
1fe4: 594f                     subq.w     #$4, a7
1fe6: 2f0c                     move.l     a4, -(a7)
1fe8: a917                     dc.w       $a917
1fea: 265f                     movea.l    (a7)+, a3
1fec: 2053                     movea.l    (a3), a0
1fee: 4a10                     tst.b      (a0)
1ff0: 660a                     bne.b      $1ffc
1ff2: 302dbdf2                 move.w     -$420e(a5), d0
1ff6: 5340                     subq.w     #$1, d0
1ff8: 3b40bdf2                 move.w     d0, -$420e(a5)
1ffc: 2f0c                     move.l     a4, -(a7)
1ffe: a916                     dc.w       $a916
2000: 42adbe2a                 clr.l      -$41d6(a5)
2004: 42adc030                 clr.l      -$3fd0(a5)
2008: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
200c: 3f3c0004                 move.w     #$4, -(a7)
2010: a93a                     dc.w       $a93a
2012: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
2016: 3f3c0005                 move.w     #$5, -(a7)
201a: a93a                     dc.w       $a93a
201c: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
2020: 3f3c0006                 move.w     #$6, -(a7)
2024: a93a                     dc.w       $a93a
2026: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
202a: 3f3c000a                 move.w     #$a, -(a7)
202e: a93a                     dc.w       $a93a
2030: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
2034: 3f3c0007                 move.w     #$7, -(a7)
2038: a93a                     dc.w       $a93a
203a: 0c6d0002bdf2             cmpi.w     #$2, -$420e(a5)
2040: 6c14                     bge.b      $2056
2042: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
2046: 3f3c0001                 move.w     #$1, -(a7)
204a: a93a                     dc.w       $a93a
204c: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
2050: 3f3c0002                 move.w     #$2, -(a7)
2054: a93a                     dc.w       $a93a
2056: 594f                     subq.w     #$4, a7
2058: a924                     dc.w       $a924
205a: 4a9f                     tst.l      (a7)+
205c: 662c                     bne.b      $208a
205e: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
2062: 4267                     clr.w      -(a7)
2064: a93a                     dc.w       $a93a
2066: 2f2dbe02                 move.l     -$41fe(a5), -(a7)
206a: 4267                     clr.w      -(a7)
206c: a93a                     dc.w       $a93a
206e: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
2072: 4267                     clr.w      -(a7)
2074: a93a                     dc.w       $a93a
2076: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
207a: 4267                     clr.w      -(a7)
207c: a93a                     dc.w       $a93a
207e: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
2082: 3f3c000c                 move.w     #$c, -(a7)
2086: a93a                     dc.w       $a93a
2088: a937                     dc.w       $a937
208a: 4cdf1800                 movem.l    (a7)+, a3-a4
208e: 4e5e                     unlk       a6
2090: 4e75                     rts        
2092: 4e560000                 link.w     a6, #$0
2096: 7016                     moveq      #$16, d0
2098: c1ee000a                 muls.w     $a(a6), d0
209c: d06dc372                 add.w      -$3c8e(a5), d0
20a0: 322df90a                 move.w     -$6f6(a5), d1
20a4: 926dc372                 sub.w      -$3c8e(a5), d1
20a8: 342e0008                 move.w     $8(a6), d2
20ac: 5242                     addq.w     #$1, d2
20ae: e542                     asl.w      #$2, d2
20b0: 9242                     sub.w      d2, d1
20b2: 7412                     moveq      #$12, d2
20b4: c5ee0008                 muls.w     $8(a6), d2
20b8: 9242                     sub.w      d2, d1
20ba: 48c1                     ext.l      d1
20bc: 83ee0008                 divs.w     $8(a6), d1
20c0: 342e000a                 move.w     $a(a6), d2
20c4: 5342                     subq.w     #$1, d2
20c6: c3c2                     muls.w     d2, d1
20c8: d041                     add.w      d1, d0
20ca: 3d40000c                 move.w     d0, $c(a6)
20ce: 4e5e                     unlk       a6
20d0: 2e9f                     move.l     (a7)+, (a7)
20d2: 4e75                     rts        
20d4: 4e560000                 link.w     a6, #$0
20d8: 2f07                     move.l     d7, -(a7)
20da: 3e2e0008                 move.w     $8(a6), d7
20de: 554f                     subq.w     #$2, a7
20e0: 3f2e000a                 move.w     $a(a6), -(a7)
20e4: 3f07                     move.w     d7, -(a7)
20e6: 4ebaffaa                 jsr        $2092(pc)
20ea: 302df90a                 move.w     -$6f6(a5), d0
20ee: 906dc372                 sub.w      -$3c8e(a5), d0
20f2: 3207                     move.w     d7, d1
20f4: 5241                     addq.w     #$1, d1
20f6: e541                     asl.w      #$2, d1
20f8: 9041                     sub.w      d1, d0
20fa: 7212                     moveq      #$12, d1
20fc: c3c7                     muls.w     d7, d1
20fe: 9041                     sub.w      d1, d0
2100: 48c0                     ext.l      d0
2102: 81c7                     divs.w     d7, d0
2104: d05f                     add.w      (a7)+, d0
2106: 3d40000c                 move.w     d0, $c(a6)
210a: 2e1f                     move.l     (a7)+, d7
210c: 4e5e                     unlk       a6
210e: 2e9f                     move.l     (a7)+, (a7)
2110: 4e75                     rts        
2112: 4e560000                 link.w     a6, #$0
2116: 302e000a                 move.w     $a(a6), d0
211a: e540                     asl.w      #$2, d0
211c: 322e0008                 move.w     $8(a6), d1
2120: 5241                     addq.w     #$1, d1
2122: e541                     asl.w      #$2, d1
2124: 342df908                 move.w     -$6f8(a5), d2
2128: 9441                     sub.w      d1, d2
212a: 48c2                     ext.l      d2
212c: 85ee0008                 divs.w     $8(a6), d2
2130: 322e000a                 move.w     $a(a6), d1
2134: 5341                     subq.w     #$1, d1
2136: c5c1                     muls.w     d1, d2
2138: d042                     add.w      d2, d0
213a: 3d40000c                 move.w     d0, $c(a6)
213e: 4e5e                     unlk       a6
2140: 2e9f                     move.l     (a7)+, (a7)
2142: 4e75                     rts        
2144: 4e560000                 link.w     a6, #$0
2148: 554f                     subq.w     #$2, a7
214a: 3f2e000a                 move.w     $a(a6), -(a7)
214e: 3f2e0008                 move.w     $8(a6), -(a7)
2152: 4ebaffbe                 jsr        $2112(pc)
2156: 302e0008                 move.w     $8(a6), d0
215a: 5240                     addq.w     #$1, d0
215c: e540                     asl.w      #$2, d0
215e: 322df908                 move.w     -$6f8(a5), d1
2162: 9240                     sub.w      d0, d1
2164: 48c1                     ext.l      d1
2166: 83ee0008                 divs.w     $8(a6), d1
216a: d25f                     add.w      (a7)+, d1
216c: 3d41000c                 move.w     d1, $c(a6)
2170: 4e5e                     unlk       a6
2172: 2e9f                     move.l     (a7)+, (a7)
2174: 4e75                     rts        
2176: 4e56ffe8                 link.w     a6, #$ffe8
217a: 2f07                     move.l     d7, -(a7)
217c: 3e2e0008                 move.w     $8(a6), d7
2180: 302e000a                 move.w     $a(a6), d0
2184: 600001fe                 bra.w      $2384
2188: 554f                     subq.w     #$2, a7
218a: 3f07                     move.w     d7, -(a7)
218c: 3f3c0002                 move.w     #$2, -(a7)
2190: 4ebaff80                 jsr        $2112(pc)
2194: 3d5fffea                 move.w     (a7)+, -$16(a6)
2198: 554f                     subq.w     #$2, a7
219a: 3f3c0001                 move.w     #$1, -(a7)
219e: 3f3c0002                 move.w     #$2, -(a7)
21a2: 4ebafeee                 jsr        $2092(pc)
21a6: 3d5fffe8                 move.w     (a7)+, -$18(a6)
21aa: 554f                     subq.w     #$2, a7
21ac: 3f07                     move.w     d7, -(a7)
21ae: 3f3c0002                 move.w     #$2, -(a7)
21b2: 4ebaff90                 jsr        $2144(pc)
21b6: 3d5fffee                 move.w     (a7)+, -$12(a6)
21ba: 554f                     subq.w     #$2, a7
21bc: 3f3c0002                 move.w     #$2, -(a7)
21c0: 3f3c0002                 move.w     #$2, -(a7)
21c4: 4ebaff0e                 jsr        $20d4(pc)
21c8: 3d5fffec                 move.w     (a7)+, -$14(a6)
21cc: 600001da                 bra.w      $23a8
21d0: 0c470001                 cmpi.w     #$1, d7
21d4: 664c                     bne.b      $2222
21d6: 554f                     subq.w     #$2, a7
21d8: 3f3c0001                 move.w     #$1, -(a7)
21dc: 3f3c0002                 move.w     #$2, -(a7)
21e0: 4ebaff30                 jsr        $2112(pc)
21e4: 3d5fffea                 move.w     (a7)+, -$16(a6)
21e8: 554f                     subq.w     #$2, a7
21ea: 3f3c0001                 move.w     #$1, -(a7)
21ee: 3f3c0002                 move.w     #$2, -(a7)
21f2: 4ebafe9e                 jsr        $2092(pc)
21f6: 3d5fffe8                 move.w     (a7)+, -$18(a6)
21fa: 554f                     subq.w     #$2, a7
21fc: 3f3c0001                 move.w     #$1, -(a7)
2200: 3f3c0002                 move.w     #$2, -(a7)
2204: 4ebaff3e                 jsr        $2144(pc)
2208: 3d5fffee                 move.w     (a7)+, -$12(a6)
220c: 554f                     subq.w     #$2, a7
220e: 3f3c0002                 move.w     #$2, -(a7)
2212: 3f3c0002                 move.w     #$2, -(a7)
2216: 4ebafebc                 jsr        $20d4(pc)
221a: 3d5fffec                 move.w     (a7)+, -$14(a6)
221e: 60000188                 bra.w      $23a8
2222: 554f                     subq.w     #$2, a7
2224: 3f3c0002                 move.w     #$2, -(a7)
2228: 3f3c0002                 move.w     #$2, -(a7)
222c: 4ebafee4                 jsr        $2112(pc)
2230: 3d5fffea                 move.w     (a7)+, -$16(a6)
2234: 554f                     subq.w     #$2, a7
2236: 3007                     move.w     d7, d0
2238: 5340                     subq.w     #$1, d0
223a: 3f00                     move.w     d0, -(a7)
223c: 3f3c0002                 move.w     #$2, -(a7)
2240: 4ebafe50                 jsr        $2092(pc)
2244: 3d5fffe8                 move.w     (a7)+, -$18(a6)
2248: 554f                     subq.w     #$2, a7
224a: 3f3c0002                 move.w     #$2, -(a7)
224e: 3f3c0002                 move.w     #$2, -(a7)
2252: 4ebafef0                 jsr        $2144(pc)
2256: 3d5fffee                 move.w     (a7)+, -$12(a6)
225a: 554f                     subq.w     #$2, a7
225c: 3007                     move.w     d7, d0
225e: 5340                     subq.w     #$1, d0
2260: 3f00                     move.w     d0, -(a7)
2262: 3f3c0002                 move.w     #$2, -(a7)
2266: 4ebafe6c                 jsr        $20d4(pc)
226a: 3d5fffec                 move.w     (a7)+, -$14(a6)
226e: 60000138                 bra.w      $23a8
2272: 554f                     subq.w     #$2, a7
2274: 3007                     move.w     d7, d0
2276: 48c0                     ext.l      d0
2278: 81fc0002                 divs.w     #$2, d0
227c: 4840                     swap       d0
227e: 7202                     moveq      #$2, d1
2280: 9240                     sub.w      d0, d1
2282: 3f01                     move.w     d1, -(a7)
2284: 3f3c0002                 move.w     #$2, -(a7)
2288: 4ebafe88                 jsr        $2112(pc)
228c: 3d5fffea                 move.w     (a7)+, -$16(a6)
2290: 554f                     subq.w     #$2, a7
2292: 3007                     move.w     d7, d0
2294: 5340                     subq.w     #$1, d0
2296: 48c0                     ext.l      d0
2298: 81fc0002                 divs.w     #$2, d0
229c: 5240                     addq.w     #$1, d0
229e: 3f00                     move.w     d0, -(a7)
22a0: 3f3c0002                 move.w     #$2, -(a7)
22a4: 4ebafdec                 jsr        $2092(pc)
22a8: 3d5fffe8                 move.w     (a7)+, -$18(a6)
22ac: 554f                     subq.w     #$2, a7
22ae: 3007                     move.w     d7, d0
22b0: 48c0                     ext.l      d0
22b2: 81fc0002                 divs.w     #$2, d0
22b6: 4840                     swap       d0
22b8: 7202                     moveq      #$2, d1
22ba: 9240                     sub.w      d0, d1
22bc: 3f01                     move.w     d1, -(a7)
22be: 3f3c0002                 move.w     #$2, -(a7)
22c2: 4ebafe80                 jsr        $2144(pc)
22c6: 3d5fffee                 move.w     (a7)+, -$12(a6)
22ca: 554f                     subq.w     #$2, a7
22cc: 3007                     move.w     d7, d0
22ce: 5340                     subq.w     #$1, d0
22d0: 48c0                     ext.l      d0
22d2: 81fc0002                 divs.w     #$2, d0
22d6: 5240                     addq.w     #$1, d0
22d8: 3f00                     move.w     d0, -(a7)
22da: 3f3c0002                 move.w     #$2, -(a7)
22de: 4ebafdf4                 jsr        $20d4(pc)
22e2: 3d5fffec                 move.w     (a7)+, -$14(a6)
22e6: 600000c0                 bra.w      $23a8
22ea: 0c470003                 cmpi.w     #$3, d7
22ee: 6c46                     bge.b      $2336
22f0: 554f                     subq.w     #$2, a7
22f2: 3f07                     move.w     d7, -(a7)
22f4: 3f3c0002                 move.w     #$2, -(a7)
22f8: 4ebafe18                 jsr        $2112(pc)
22fc: 3d5fffea                 move.w     (a7)+, -$16(a6)
2300: 554f                     subq.w     #$2, a7
2302: 3f3c0001                 move.w     #$1, -(a7)
2306: 3f3c0002                 move.w     #$2, -(a7)
230a: 4ebafd86                 jsr        $2092(pc)
230e: 3d5fffe8                 move.w     (a7)+, -$18(a6)
2312: 554f                     subq.w     #$2, a7
2314: 3f07                     move.w     d7, -(a7)
2316: 3f3c0002                 move.w     #$2, -(a7)
231a: 4ebafe28                 jsr        $2144(pc)
231e: 3d5fffee                 move.w     (a7)+, -$12(a6)
2322: 554f                     subq.w     #$2, a7
2324: 3f3c0001                 move.w     #$1, -(a7)
2328: 3f3c0002                 move.w     #$2, -(a7)
232c: 4ebafda6                 jsr        $20d4(pc)
2330: 3d5fffec                 move.w     (a7)+, -$14(a6)
2334: 6072                     bra.b      $23a8
2336: 554f                     subq.w     #$2, a7
2338: 3007                     move.w     d7, d0
233a: 5540                     subq.w     #$2, d0
233c: 3f00                     move.w     d0, -(a7)
233e: 3f3c0003                 move.w     #$3, -(a7)
2342: 4ebafdce                 jsr        $2112(pc)
2346: 3d5fffea                 move.w     (a7)+, -$16(a6)
234a: 554f                     subq.w     #$2, a7
234c: 3f3c0003                 move.w     #$3, -(a7)
2350: 3f3c0004                 move.w     #$4, -(a7)
2354: 4ebafd3c                 jsr        $2092(pc)
2358: 3d5fffe8                 move.w     (a7)+, -$18(a6)
235c: 554f                     subq.w     #$2, a7
235e: 3007                     move.w     d7, d0
2360: 5540                     subq.w     #$2, d0
2362: 3f00                     move.w     d0, -(a7)
2364: 3f3c0003                 move.w     #$3, -(a7)
2368: 4ebafdda                 jsr        $2144(pc)
236c: 3d5fffee                 move.w     (a7)+, -$12(a6)
2370: 554f                     subq.w     #$2, a7
2372: 3f3c0004                 move.w     #$4, -(a7)
2376: 3f3c0004                 move.w     #$4, -(a7)
237a: 4ebafd58                 jsr        $20d4(pc)
237e: 3d5fffec                 move.w     (a7)+, -$14(a6)
2382: 6024                     bra.b      $23a8
2384: 5540                     subq.w     #$2, d0
2386: 6700fe00                 beq.w      $2188
238a: 5340                     subq.w     #$1, d0
238c: 6700fe42                 beq.w      $21d0
2390: 5340                     subq.w     #$1, d0
2392: 6700fede                 beq.w      $2272
2396: 5340                     subq.w     #$1, d0
2398: 6700ff50                 beq.w      $22ea
239c: 41edbe16                 lea.l      -$41ea(a5), a0
23a0: 43eeffe8                 lea.l      -$18(a6), a1
23a4: 22d8                     move.l     (a0)+, (a1)+
23a6: 22d8                     move.l     (a0)+, (a1)+
23a8: 206e000c                 movea.l    $c(a6), a0
23ac: 43eeffe8                 lea.l      -$18(a6), a1
23b0: 20d9                     move.l     (a1)+, (a0)+
23b2: 20d9                     move.l     (a1)+, (a0)+
23b4: 2e1f                     move.l     (a7)+, d7
23b6: 4e5e                     unlk       a6
23b8: 2e9f                     move.l     (a7)+, (a7)
23ba: 4e75                     rts        
23bc: 4227                     clr.b      -(a7)
23be: 4eba0050                 jsr        $2410(pc)
23c2: 4e75                     rts        
23c4: 1f3c0001                 move.b     #$1, -(a7)
23c8: 4eba0046                 jsr        $2410(pc)
23cc: 4e75                     rts        
23ce: 4e56ffee                 link.w     a6, #$ffee
23d2: 48e70108                 movem.l    d7/a4, -(a7)
23d6: 286e0008                 movea.l    $8(a6), a4
23da: 4207                     clr.b      d7
23dc: 6018                     bra.b      $23f6
23de: 4a6c006c                 tst.w      $6c(a4)
23e2: 5dc0                     slt.b      d0
23e4: 4a2c006e                 tst.b      $6e(a4)
23e8: 57c1                     seq.b      d1
23ea: 8001                     or.b       d1, d0
23ec: 6706                     beq.b      $23f4
23ee: 286c0090                 movea.l    $90(a4), a4
23f2: 6002                     bra.b      $23f6
23f4: 7e01                     moveq      #$1, d7
23f6: 200c                     move.l     a4, d0
23f8: 56c0                     sne.b      d0
23fa: 1207                     move.b     d7, d1
23fc: 5301                     subq.b     #$1, d1
23fe: c001                     and.b      d1, d0
2400: 66dc                     bne.b      $23de
2402: 2d4c000c                 move.l     a4, $c(a6)
2406: 4cdf1080                 movem.l    (a7)+, d7/a4
240a: 4e5e                     unlk       a6
240c: 2e9f                     move.l     (a7)+, (a7)
240e: 4e75                     rts        
2410: 4e56ffbe                 link.w     a6, #$ffbe
2414: 48e70f18                 movem.l    d4-d7/a3-a4, -(a7)
2418: 182e0008                 move.b     $8(a6), d4
241c: 206dbdc6                 movea.l    -$423a(a5), a0
2420: 2f10                     move.l     (a0), -(a7)
2422: a851                     dc.w       $a851
2424: 7c01                     moveq      #$1, d6
2426: 3006                     move.w     d6, d0
2428: e540                     asl.w      #$2, d0
242a: 42b600c6                 clr.l      -$3a(a6, d0.w)
242e: 5246                     addq.w     #$1, d6
2430: 0c460005                 cmpi.w     #$5, d6
2434: 6ff0                     ble.b      $2426
2436: 97cb                     suba.l     a3, a3
2438: 4246                     clr.w      d6
243a: 4245                     clr.w      d5
243c: 594f                     subq.w     #$4, a7
243e: a924                     dc.w       $a924
2440: 4a9f                     tst.l      (a7)+
2442: 6700015c                 beq.w      $25a0
2446: 594f                     subq.w     #$4, a7
2448: 594f                     subq.w     #$4, a7
244a: a924                     dc.w       $a924
244c: 4ebaff80                 jsr        $23ce(pc)
2450: 285f                     movea.l    (a7)+, a4
2452: 6048                     bra.b      $249c
2454: 594f                     subq.w     #$4, a7
2456: 2f0c                     move.l     a4, -(a7)
2458: a917                     dc.w       $a917
245a: 2b5fc030                 move.l     (a7)+, -$3fd0(a5)
245e: 206dc030                 movea.l    -$3fd0(a5), a0
2462: 2050                     movea.l    (a0), a0
2464: 4a10                     tst.b      (a0)
2466: 660e                     bne.b      $2476
2468: 5246                     addq.w     #$1, d6
246a: 5245                     addq.w     #$1, d5
246c: 3006                     move.w     d6, d0
246e: e540                     asl.w      #$2, d0
2470: 2d8c00c6                 move.l     a4, -$3a(a6, d0.w)
2474: 600e                     bra.b      $2484
2476: 206dc030                 movea.l    -$3fd0(a5), a0
247a: 2050                     movea.l    (a0), a0
247c: 0c100001                 cmpi.b     #$1, (a0)
2480: 6602                     bne.b      $2484
2482: 264c                     movea.l    a4, a3
2484: 2f0c                     move.l     a4, -(a7)
2486: 4227                     clr.b      -(a7)
2488: a908                     dc.w       $a908
248a: 2f0c                     move.l     a4, -(a7)
248c: 4227                     clr.b      -(a7)
248e: a91c                     dc.w       $a91c
2490: 594f                     subq.w     #$4, a7
2492: 2f2c0090                 move.l     $90(a4), -(a7)
2496: 4ebaff36                 jsr        $23ce(pc)
249a: 285f                     movea.l    (a7)+, a4
249c: 200c                     move.l     a4, d0
249e: 66b4                     bne.b      $2454
24a0: 4a04                     tst.b      d4
24a2: 671c                     beq.b      $24c0
24a4: 486effbe                 pea.l      -$42(a6)
24a8: 3f05                     move.w     d5, -(a7)
24aa: 3f05                     move.w     d5, -(a7)
24ac: 4ebafcc8                 jsr        $2176(pc)
24b0: 584f                     addq.w     #$4, a7
24b2: 41eeffbe                 lea.l      -$42(a6), a0
24b6: 43eeffe2                 lea.l      -$1e(a6), a1
24ba: 22d8                     move.l     (a0)+, (a1)+
24bc: 22d8                     move.l     (a0)+, (a1)+
24be: 600c                     bra.b      $24cc
24c0: 41edbe16                 lea.l      -$41ea(a5), a0
24c4: 43eeffe2                 lea.l      -$1e(a6), a1
24c8: 22d8                     move.l     (a0)+, (a1)+
24ca: 22d8                     move.l     (a0)+, (a1)+
24cc: 200b                     move.l     a3, d0
24ce: 6708                     beq.b      $24d8
24d0: 2f0b                     move.l     a3, -(a7)
24d2: 1f3c0001                 move.b     #$1, -(a7)
24d6: a908                     dc.w       $a908
24d8: 3e06                     move.w     d6, d7
24da: 600000b2                 bra.w      $258e
24de: 3007                     move.w     d7, d0
24e0: e540                     asl.w      #$2, d0
24e2: 4ab600c6                 tst.l      -$3a(a6, d0.w)
24e6: 670000a4                 beq.w      $258c
24ea: 3007                     move.w     d7, d0
24ec: e540                     asl.w      #$2, d0
24ee: 2b7600c6be2a             move.l     -$3a(a6, d0.w), -$41d6(a5)
24f4: 594f                     subq.w     #$4, a7
24f6: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
24fa: a917                     dc.w       $a917
24fc: 2b5fc030                 move.l     (a7)+, -$3fd0(a5)
2500: 302effe8                 move.w     -$18(a6), d0
2504: 906effe4                 sub.w      -$1c(a6), d0
2508: 3f00                     move.w     d0, -(a7)
250a: 302effe6                 move.w     -$1a(a6), d0
250e: 906effe2                 sub.w      -$1e(a6), d0
2512: 3f00                     move.w     d0, -(a7)
2514: 4227                     clr.b      -(a7)
2516: 4ebaf33a                 jsr        $1852(pc)
251a: 3007                     move.w     d7, d0
251c: e540                     asl.w      #$2, d0
251e: 2f3600c6                 move.l     -$3a(a6, d0.w), -(a7)
2522: 3f2effe4                 move.w     -$1c(a6), -(a7)
2526: 3f2effe2                 move.w     -$1e(a6), -(a7)
252a: 1f3c0001                 move.b     #$1, -(a7)
252e: a91b                     dc.w       $a91b
2530: 3007                     move.w     d7, d0
2532: e540                     asl.w      #$2, d0
2534: 2f3600c6                 move.l     -$3a(a6, d0.w), -(a7)
2538: 1f3c0001                 move.b     #$1, -(a7)
253c: a908                     dc.w       $a908
253e: 0c470001                 cmpi.w     #$1, d7
2542: 6f48                     ble.b      $258c
2544: 4a04                     tst.b      d4
2546: 6720                     beq.b      $2568
2548: 486effbe                 pea.l      -$42(a6)
254c: 3f05                     move.w     d5, -(a7)
254e: 3007                     move.w     d7, d0
2550: 5340                     subq.w     #$1, d0
2552: 3f00                     move.w     d0, -(a7)
2554: 4ebafc20                 jsr        $2176(pc)
2558: 584f                     addq.w     #$4, a7
255a: 41eeffbe                 lea.l      -$42(a6), a0
255e: 43eeffe2                 lea.l      -$1e(a6), a1
2562: 22d8                     move.l     (a0)+, (a1)+
2564: 22d8                     move.l     (a0)+, (a1)+
2566: 6024                     bra.b      $258c
2568: 302effe2                 move.w     -$1e(a6), d0
256c: 06400012                 addi.w     #$12, d0
2570: 3d40ffe2                 move.w     d0, -$1e(a6)
2574: 302effe4                 move.w     -$1c(a6), d0
2578: 06400012                 addi.w     #$12, d0
257c: 3d40ffe4                 move.w     d0, -$1c(a6)
2580: 302effe8                 move.w     -$18(a6), d0
2584: 06400012                 addi.w     #$12, d0
2588: 3d40ffe8                 move.w     d0, -$18(a6)
258c: 5347                     subq.w     #$1, d7
258e: 0c470001                 cmpi.w     #$1, d7
2592: 6c00ff4a                 bge.w      $24de
2596: 594f                     subq.w     #$4, a7
2598: a924                     dc.w       $a924
259a: 1f3c0001                 move.b     #$1, -(a7)
259e: a91c                     dc.w       $a91c
25a0: a850                     dc.w       $a850
25a2: 4cdf18f0                 movem.l    (a7)+, d4-d7/a3-a4
25a6: 4e5e                     unlk       a6
25a8: 205f                     movea.l    (a7)+, a0
25aa: 544f                     addq.w     #$2, a7
25ac: 4ed0                     jmp        (a0)
25ae: 4e560000                 link.w     a6, #$0
25b2: 302e0008                 move.w     $8(a6), d0
25b6: 60000204                 bra.w      $27bc
25ba: 206e000a                 movea.l    $a(a6), a0
25be: 43fa05a0                 lea.l      $2b60(pc), a1
25c2: 7004                     moveq      #$4, d0
25c4: 20d9                     move.l     (a1)+, (a0)+
25c6: 51c8fffc                 dbra       d0, $25c4
25ca: 60000244                 bra.w      $2810
25ce: 206e000a                 movea.l    $a(a6), a0
25d2: 43fa055e                 lea.l      $2b32(pc), a1
25d6: 700b                     moveq      #$b, d0
25d8: 20d9                     move.l     (a1)+, (a0)+
25da: 51c8fffc                 dbra       d0, $25d8
25de: 60000230                 bra.w      $2810
25e2: 206e000a                 movea.l    $a(a6), a0
25e6: 43fa052c                 lea.l      $2b14(pc), a1
25ea: 7007                     moveq      #$7, d0
25ec: 20d9                     move.l     (a1)+, (a0)+
25ee: 51c8fffc                 dbra       d0, $25ec
25f2: 6000021c                 bra.w      $2810
25f6: 206e000a                 movea.l    $a(a6), a0
25fa: 43fa050e                 lea.l      $2b0a(pc), a1
25fe: 20d9                     move.l     (a1)+, (a0)+
2600: 20d9                     move.l     (a1)+, (a0)+
2602: 20d9                     move.l     (a1)+, (a0)+
2604: 6000020a                 bra.w      $2810
2608: 206e000a                 movea.l    $a(a6), a0
260c: 43fa04e0                 lea.l      $2aee(pc), a1
2610: 7006                     moveq      #$6, d0
2612: 20d9                     move.l     (a1)+, (a0)+
2614: 51c8fffc                 dbra       d0, $2612
2618: 600001f6                 bra.w      $2810
261c: 206e000a                 movea.l    $a(a6), a0
2620: 43fa04be                 lea.l      $2ae0(pc), a1
2624: 20d9                     move.l     (a1)+, (a0)+
2626: 20d9                     move.l     (a1)+, (a0)+
2628: 20d9                     move.l     (a1)+, (a0)+
262a: 20d9                     move.l     (a1)+, (a0)+
262c: 600001e2                 bra.w      $2810
2630: 206e000a                 movea.l    $a(a6), a0
2634: 43fa0478                 lea.l      $2aae(pc), a1
2638: 700c                     moveq      #$c, d0
263a: 20d9                     move.l     (a1)+, (a0)+
263c: 51c8fffc                 dbra       d0, $263a
2640: 600001ce                 bra.w      $2810
2644: 206e000a                 movea.l    $a(a6), a0
2648: 43fa043a                 lea.l      $2a84(pc), a1
264c: 700a                     moveq      #$a, d0
264e: 20d9                     move.l     (a1)+, (a0)+
2650: 51c8fffc                 dbra       d0, $264e
2654: 600001ba                 bra.w      $2810
2658: 206e000a                 movea.l    $a(a6), a0
265c: 43fa0412                 lea.l      $2a70(pc), a1
2660: 7004                     moveq      #$4, d0
2662: 20d9                     move.l     (a1)+, (a0)+
2664: 51c8fffc                 dbra       d0, $2662
2668: 600001a6                 bra.w      $2810
266c: 206e000a                 movea.l    $a(a6), a0
2670: 43fa03f0                 lea.l      $2a62(pc), a1
2674: 20d9                     move.l     (a1)+, (a0)+
2676: 20d9                     move.l     (a1)+, (a0)+
2678: 20d9                     move.l     (a1)+, (a0)+
267a: 20d9                     move.l     (a1)+, (a0)+
267c: 60000192                 bra.w      $2810
2680: 206e000a                 movea.l    $a(a6), a0
2684: 43fa03b4                 lea.l      $2a3a(pc), a1
2688: 7009                     moveq      #$9, d0
268a: 20d9                     move.l     (a1)+, (a0)+
268c: 51c8fffc                 dbra       d0, $268a
2690: 6000017e                 bra.w      $2810
2694: 206e000a                 movea.l    $a(a6), a0
2698: 43fa0390                 lea.l      $2a2a(pc), a1
269c: 20d9                     move.l     (a1)+, (a0)+
269e: 20d9                     move.l     (a1)+, (a0)+
26a0: 20d9                     move.l     (a1)+, (a0)+
26a2: 20d9                     move.l     (a1)+, (a0)+
26a4: 6000016a                 bra.w      $2810
26a8: 206e000a                 movea.l    $a(a6), a0
26ac: 43fa0358                 lea.l      $2a06(pc), a1
26b0: 7008                     moveq      #$8, d0
26b2: 20d9                     move.l     (a1)+, (a0)+
26b4: 51c8fffc                 dbra       d0, $26b2
26b8: 60000156                 bra.w      $2810
26bc: 206e000a                 movea.l    $a(a6), a0
26c0: 43fa031a                 lea.l      $29dc(pc), a1
26c4: 700a                     moveq      #$a, d0
26c6: 20d9                     move.l     (a1)+, (a0)+
26c8: 51c8fffc                 dbra       d0, $26c6
26cc: 60000142                 bra.w      $2810
26d0: 206e000a                 movea.l    $a(a6), a0
26d4: 43fa02ca                 lea.l      $29a0(pc), a1
26d8: 700e                     moveq      #$e, d0
26da: 20d9                     move.l     (a1)+, (a0)+
26dc: 51c8fffc                 dbra       d0, $26da
26e0: 6000012e                 bra.w      $2810
26e4: 206e000a                 movea.l    $a(a6), a0
26e8: 43fa0268                 lea.l      $2952(pc), a1
26ec: 7013                     moveq      #$13, d0
26ee: 20d9                     move.l     (a1)+, (a0)+
26f0: 51c8fffc                 dbra       d0, $26ee
26f4: 6000011a                 bra.w      $2810
26f8: 206e000a                 movea.l    $a(a6), a0
26fc: 43fa023c                 lea.l      $293a(pc), a1
2700: 7005                     moveq      #$5, d0
2702: 20d9                     move.l     (a1)+, (a0)+
2704: 51c8fffc                 dbra       d0, $2702
2708: 60000106                 bra.w      $2810
270c: 206e000a                 movea.l    $a(a6), a0
2710: 43fa01ee                 lea.l      $2900(pc), a1
2714: 700e                     moveq      #$e, d0
2716: 20d9                     move.l     (a1)+, (a0)+
2718: 51c8fffc                 dbra       d0, $2716
271c: 600000f2                 bra.w      $2810
2720: 206e000a                 movea.l    $a(a6), a0
2724: 43fa01c4                 lea.l      $28ea(pc), a1
2728: 7005                     moveq      #$5, d0
272a: 20d9                     move.l     (a1)+, (a0)+
272c: 51c8fffc                 dbra       d0, $272a
2730: 600000de                 bra.w      $2810
2734: 206e000a                 movea.l    $a(a6), a0
2738: 43fa019c                 lea.l      $28d6(pc), a1
273c: 7004                     moveq      #$4, d0
273e: 20d9                     move.l     (a1)+, (a0)+
2740: 51c8fffc                 dbra       d0, $273e
2744: 600000ca                 bra.w      $2810
2748: 206e000a                 movea.l    $a(a6), a0
274c: 43fa0160                 lea.l      $28ae(pc), a1
2750: 7009                     moveq      #$9, d0
2752: 20d9                     move.l     (a1)+, (a0)+
2754: 51c8fffc                 dbra       d0, $2752
2758: 600000b6                 bra.w      $2810
275c: 206e000a                 movea.l    $a(a6), a0
2760: 43fa011c                 lea.l      $287e(pc), a1
2764: 700b                     moveq      #$b, d0
2766: 20d9                     move.l     (a1)+, (a0)+
2768: 51c8fffc                 dbra       d0, $2766
276c: 600000a2                 bra.w      $2810
2770: 206e000a                 movea.l    $a(a6), a0
2774: 43fa00fa                 lea.l      $2870(pc), a1
2778: 20d9                     move.l     (a1)+, (a0)+
277a: 20d9                     move.l     (a1)+, (a0)+
277c: 20d9                     move.l     (a1)+, (a0)+
277e: 20d9                     move.l     (a1)+, (a0)+
2780: 6000008e                 bra.w      $2810
2784: 206e000a                 movea.l    $a(a6), a0
2788: 43fa00d0                 lea.l      $285a(pc), a1
278c: 7005                     moveq      #$5, d0
278e: 20d9                     move.l     (a1)+, (a0)+
2790: 51c8fffc                 dbra       d0, $278e
2794: 6000007a                 bra.w      $2810
2798: 206e000a                 movea.l    $a(a6), a0
279c: 43fa00a6                 lea.l      $2844(pc), a1
27a0: 7005                     moveq      #$5, d0
27a2: 20d9                     move.l     (a1)+, (a0)+
27a4: 51c8fffc                 dbra       d0, $27a2
27a8: 6066                     bra.b      $2810
27aa: 206e000a                 movea.l    $a(a6), a0
27ae: 43fa0068                 lea.l      $2818(pc), a1
27b2: 700a                     moveq      #$a, d0
27b4: 20d9                     move.l     (a1)+, (a0)+
27b6: 51c8fffc                 dbra       d0, $27b4
27ba: 6054                     bra.b      $2810
27bc: 0640003d                 addi.w     #$3d, d0
27c0: 0c40001d                 cmpi.w     #$1d, d0
27c4: 6444                     bcc.b      $280a
27c6: d040                     add.w      d0, d0
27c8: 303b0006                 move.w     $27d0(pc, d0.w), d0
27cc: 4efb0002                 jmp        $27d0(pc, d0.w)
27d0: ffda                     dc.w       $ffda
27d2: 003a                     .byte      0x00, 0x3a
27d4: ffc8                     dc.w       $ffc8
27d6: 003a                     .byte      0x00, 0x3a
27d8: ffb4                     dc.w       $ffb4
27da: ffa0                     dc.w       $ffa0
27dc: ff8c                     dc.w       $ff8c
27de: ff78                     dc.w       $ff78
27e0: ff64                     dc.w       $ff64
27e2: ff50                     dc.w       $ff50
27e4: ff3c                     dc.w       $ff3c
27e6: ff28                     dc.w       $ff28
27e8: ff14                     dc.w       $ff14
27ea: ff00                     dc.w       $ff00
27ec: feec                     dc.w       $feec
27ee: fed8                     dc.w       $fed8
27f0: fec4                     dc.w       $fec4
27f2: feb0                     dc.w       $feb0
27f4: fe9c                     dc.w       $fe9c
27f6: fe88                     dc.w       $fe88
27f8: 003a                     .byte      0x00, 0x3a
27fa: fe74                     dc.w       $fe74
27fc: fe60                     dc.w       $fe60
27fe: fe4c                     dc.w       $fe4c
2800: fe38                     dc.w       $fe38
2802: fe26                     dc.w       $fe26
2804: fe12                     dc.w       $fe12
2806: fdfe                     dc.w       $fdfe
2808: fdea                     dc.w       $fdea
280a: 206e000a                 movea.l    $a(a6), a0
280e: 4210                     clr.b      (a0)
2810: 4e5e                     unlk       a6
2812: 205f                     movea.l    (a7)+, a0
2814: 544f                     addq.w     #$2, a7
2816: 4ed0                     jmp        (a0)
2818: 2b526561                 move.l     (a2), $6561(a5)
281c: 642f                     bcc.b      $284d
281e: 7772                     .byte      0x77, 0x72
2820: 6974                     bvs.b      $2896
2822: 6520                     bcs.b      $2844
2824: 7065                     moveq      #$65, d0
2826: 726d                     moveq      #$6d, d1
2828: 6973                     bvs.b      $289d
282a: 7369                     .byte      0x73, 0x69
282c: 6f6e                     ble.b      $289c
282e: 2064                     movea.l    -(a4), a0
2830: 6f65                     ble.b      $2897
2832: 736e                     .byte      0x73, 0x6e
2834: 277420616c6c             move.l     $61(a4, d2.w), $6c6c(a3)
283a: 6f77                     ble.b      $28b3
283c: 20777269                 movea.l    $69(a7, d7.w), a0
2840: 7469                     moveq      #$69, d2
2842: 6e67                     bgt.b      $28ab
2844: 1550726f                 move.b     (a0), $726f(a2)
2848: 626c                     bhi.b      $28b6
284a: 656d                     bcs.b      $28b9
284c: 2064                     movea.l    -(a4), a0
284e: 7572                     .byte      0x75, 0x72
2850: 696e                     bvs.b      $28c0
2852: 6720                     beq.b      $2874
2854: 7265                     moveq      #$65, d1
2856: 6e61                     bgt.b      $28b9
2858: 6d65                     blt.b      $28bf
285a: 144e                     .byte      0x14, 0x4e
285c: 6f74                     ble.b      $28d2
285e: 2061                     movea.l    -(a1), a0
2860: 204d                     movea.l    a5, a0
2862: 6163                     bsr.b      $28c7
2864: 696e                     bvs.b      $28d4
2866: 746f                     moveq      #$6f, d2
2868: 7368                     .byte      0x73, 0x68
286a: 2064                     movea.l    -(a4), a0
286c: 6973                     bvs.b      $28e1
286e: 6b98                     bmi.b      $2808
2870: 0d4e6f20                 movep.l    $6f20(a6), d6
2874: 7375                     .byte      0x73, 0x75
2876: 6368                     bls.b      $28e0
2878: 2064                     movea.l    -(a4), a0
287a: 7269                     moveq      #$69, d1
287c: 7665                     moveq      #$65, d3
287e: 2f537065                 move.l     (a3), $7065(a7)
2882: 6369                     bls.b      $28ed
2884: 6669                     bne.b      $28ef
2886: 6564                     bcs.b      $28ec
2888: 20766f6c756d             movea.l    $756d(a6, invalid.w), a0
288e: 6520                     bcs.b      $28b0
2890: 6973                     bvs.b      $2905
2892: 2061                     movea.l    -(a1), a0
2894: 6c72                     bge.b      $2908
2896: 6561                     bcs.b      $28f9
2898: 6479                     bcc.b      $2913
289a: 206d6f75                 movea.l    $6f75(a5), a0
289e: 6e74                     bgt.b      $2914
28a0: 6564                     bcs.b      $2906
28a2: 2061                     movea.l    -(a1), a0
28a4: 6e64                     bgt.b      $290a
28a6: 206f6e2d                 movea.l    $6e2d(a7), a0
28aa: 6c69                     bge.b      $2915
28ac: 6e65                     bgt.b      $2913
28ae: 27417474                 move.l     d1, $7474(a3)
28b2: 656d                     bcs.b      $2921
28b4: 7074                     moveq      #$74, d0
28b6: 20746f206f70             movea.l    $6f70(a4, d6.l * 8), a0
28bc: 656e                     bcs.b      $292c
28be: 206c6f63                 movea.l    $6f63(a4), a0
28c2: 6b65                     bmi.b      $2929
28c4: 6420                     bcc.b      $28e6
28c6: 6669                     bne.b      $2931
28c8: 6c65                     bge.b      $292f
28ca: 2066                     movea.l    -(a6), a0
28cc: 6f72                     ble.b      $2940
28ce: 20777269                 movea.l    $69(a7, d7.w), a0
28d2: 7469                     moveq      #$69, d2
28d4: 6e67                     bgt.b      $293d
28d6: 1256                     .byte      0x12, 0x56
28d8: 6f6c                     ble.b      $2946
28da: 756d                     .byte      0x75, 0x6d
28dc: 6520                     bcs.b      $28fe
28de: 6e6f                     bgt.b      $294f
28e0: 7420                     moveq      #$20, d2
28e2: 6f6e                     ble.b      $2952
28e4: 2d6c696e6598             move.l     $696e(a4), $6598(a6)
28ea: 1445                     .byte      0x14, 0x45
28ec: 7272                     moveq      #$72, d1
28ee: 6f72                     ble.b      $2962
28f0: 2064                     movea.l    -(a4), a0
28f2: 7572                     .byte      0x75, 0x72
28f4: 696e                     bvs.b      $2964
28f6: 6720                     beq.b      $2918
28f8: 4765                     .byte      0x47, 0x65
28fa: 7446                     moveq      #$46, d2
28fc: 506f7398                 addq.w     #$8, $7398(a7)
2900: 3850                     movea.w    (a0), a4
2902: 6174                     bsr.b      $2978
2904: 6820                     bvc.b      $2926
2906: 7265                     moveq      #$65, d1
2908: 6665                     bne.b      $296f
290a: 7265                     moveq      #$65, d1
290c: 6e63                     bgt.b      $2971
290e: 6520                     bcs.b      $2930
2910: 6e75                     bgt.b      $2987
2912: 6d62                     blt.b      $2976
2914: 6572                     bcs.b      $2988
2916: 20737065                 movea.l    $65(a3, d7.w), a0
291a: 6369                     bls.b      $2985
291c: 6669                     bne.b      $2987
291e: 6573                     bcs.b      $2993
2920: 206e6f6e                 movea.l    $6f6e(a6), a0
2924: 6578                     bcs.b      $299e
2926: 6973                     bvs.b      $299b
2928: 7465                     moveq      #$65, d2
292a: 6e74                     bgt.b      $29a0
292c: 2061                     movea.l    -(a1), a0
292e: 6363                     bls.b      $2993
2930: 6573                     bcs.b      $29a5
2932: 7320                     .byte      0x73, 0x20
2934: 7061                     moveq      #$61, d0
2936: 7468                     moveq      #$68, d2
2938: 2098                     move.l     (a0)+, (a0)
293a: 17457272                 move.b     d5, $7272(a3)
293e: 6f72                     ble.b      $29b2
2940: 20696e20                 movea.l    $6e20(a1), a0
2944: 7061                     moveq      #$61, d0
2946: 7261                     moveq      #$61, d1
2948: 6d65                     blt.b      $29af
294a: 7465                     moveq      #$65, d2
294c: 7220                     moveq      #$20, d1
294e: 6c69                     bge.b      $29b9
2950: 7374                     .byte      0x73, 0x74
2952: 4d54                     .byte      0x4d, 0x54
2954: 6865                     bvc.b      $29bb
2956: 20726561642f             movea.l    ([$642f, a2]), a0
295c: 7772                     .byte      0x77, 0x72
295e: 6974                     bvs.b      $29d4
2960: 6520                     bcs.b      $2982
2962: 7065                     moveq      #$65, d0
2964: 726d                     moveq      #$6d, d1
2966: 6973                     bvs.b      $29db
2968: 7369                     .byte      0x73, 0x69
296a: 6f6e                     ble.b      $29da
296c: 206f6620                 movea.l    $6620(a7), a0
2970: 6f6e                     ble.b      $29e0
2972: 6c79                     bge.b      $29ed
2974: 206f6e65                 movea.l    $6e65(a7), a0
2978: 2061                     movea.l    -(a1), a0
297a: 6363                     bls.b      $29df
297c: 6573                     bcs.b      $29f1
297e: 7320                     .byte      0x73, 0x20
2980: 7061                     moveq      #$61, d0
2982: 7468                     moveq      #$68, d2
2984: 20746f206120             movea.l    $6120(a4, d6.l * 8), a0
298a: 6669                     bne.b      $29f5
298c: 6c65                     bge.b      $29f3
298e: 2063                     movea.l    -(a3), a0
2990: 616e                     bsr.b      $2a00
2992: 2061                     movea.l    -(a1), a0
2994: 6c6c                     bge.b      $2a02
2996: 6f77                     ble.b      $2a0f
2998: 20777269                 movea.l    $69(a7, d7.w), a0
299c: 7469                     moveq      #$69, d2
299e: 6e67                     bgt.b      $2a07
29a0: 3a46                     movea.w    d6, a5
29a2: 696c                     bvs.b      $2a10
29a4: 6520                     bcs.b      $29c6
29a6: 7769                     .byte      0x77, 0x69
29a8: 7468                     moveq      #$68, d2
29aa: 20737065                 movea.l    $65(a3, d7.w), a0
29ae: 6369                     bls.b      $2a19
29b0: 6669                     bne.b      $2a1b
29b2: 6564                     bcs.b      $2a18
29b4: 206e616d                 movea.l    $616d(a6), a0
29b8: 6520                     bcs.b      $29da
29ba: 616e                     bsr.b      $2a2a
29bc: 6420                     bcc.b      $29de
29be: 7665                     moveq      #$65, d3
29c0: 7273                     moveq      #$73, d1
29c2: 696f                     bvs.b      $2a33
29c4: 6e20                     bgt.b      $29e6
29c6: 6e75                     bgt.b      $2a3d
29c8: 6d62                     blt.b      $2a2c
29ca: 6572                     bcs.b      $2a3e
29cc: 2061                     movea.l    -(a1), a0
29ce: 6c72                     bge.b      $2a42
29d0: 6561                     bcs.b      $2a33
29d2: 6479                     bcc.b      $2a4d
29d4: 2065                     movea.l    -(a5), a0
29d6: 7869                     moveq      #$69, d4
29d8: 7374                     .byte      0x73, 0x74
29da: 7398                     .byte      0x73, 0x98
29dc: 2846                     movea.l    d6, a4
29de: 696c                     bvs.b      $2a4c
29e0: 6520                     bcs.b      $2a02
29e2: 6973                     bvs.b      $2a57
29e4: 2062                     movea.l    -(a2), a0
29e6: 7573                     .byte      0x75, 0x73
29e8: 793b                     .byte      0x79, 0x3b
29ea: 206f6e65                 movea.l    $6e65(a7), a0
29ee: 206f7220                 movea.l    $7220(a7), a0
29f2: 6d6f                     blt.b      $2a63
29f4: 7265                     moveq      #$65, d1
29f6: 2066                     movea.l    -(a6), a0
29f8: 696c                     bvs.b      $2a66
29fa: 6573                     bcs.b      $2a6f
29fc: 2061                     movea.l    -(a1), a0
29fe: 7265                     moveq      #$65, d1
2a00: 206f7065                 movea.l    $7065(a7), a0
2a04: 6e98                     bgt.b      $299e
2a06: 23566f6c                 move.l     (a6), $6f6c(a1)
2a0a: 756d                     .byte      0x75, 0x6d
2a0c: 6520                     bcs.b      $2a2e
2a0e: 6973                     bvs.b      $2a83
2a10: 206c6f63                 movea.l    $6f63(a4), a0
2a14: 6b65                     bmi.b      $2a7b
2a16: 6420                     bcc.b      $2a38
2a18: 6279                     bhi.b      $2a93
2a1a: 2061                     movea.l    -(a1), a0
2a1c: 20736f667477             movea.l    ([$7477, a3]), a0
2a22: 6172                     bsr.b      $2a96
2a24: 6520                     bcs.b      $2a46
2a26: 666c                     bne.b      $2a94
2a28: 6167                     bsr.b      $2a91
2a2a: 0e46                     .byte      0x0e, 0x46
2a2c: 696c                     bvs.b      $2a9a
2a2e: 6520                     bcs.b      $2a50
2a30: 6973                     bvs.b      $2aa5
2a32: 206c6f63                 movea.l    $6f63(a4), a0
2a36: 6b65                     bmi.b      $2a9d
2a38: 6498                     bcc.b      $29d2
2a3a: 2656                     movea.l    (a6), a3
2a3c: 6f6c                     ble.b      $2aaa
2a3e: 756d                     .byte      0x75, 0x6d
2a40: 6520                     bcs.b      $2a62
2a42: 6973                     bvs.b      $2ab7
2a44: 206c6f63                 movea.l    $6f63(a4), a0
2a48: 6b65                     bmi.b      $2aaf
2a4a: 6420                     bcc.b      $2a6c
2a4c: 6279                     bhi.b      $2ac7
2a4e: 2061                     movea.l    -(a1), a0
2a50: 20686172                 movea.l    $6172(a0), a0
2a54: 6477                     bcc.b      $2acd
2a56: 6172                     bsr.b      $2aca
2a58: 6520                     bcs.b      $2a7a
2a5a: 7365                     .byte      0x73, 0x65
2a5c: 7474                     moveq      #$74, d2
2a5e: 696e                     bvs.b      $2ace
2a60: 6798                     beq.b      $29fa
2a62: 0d46                     bchg.b     d6, d6
2a64: 696c                     bvs.b      $2ad2
2a66: 6520                     bcs.b      $2a88
2a68: 6e6f                     bgt.b      $2ad9
2a6a: 2066                     movea.l    -(a6), a0
2a6c: 6f75                     ble.b      $2ae3
2a6e: 6e64                     bgt.b      $2ad4
2a70: 13546f6f                 move.b     (a4), $6f6f(a1)
2a74: 206d616e                 movea.l    $616e(a5), a0
2a78: 7920                     .byte      0x79, 0x20
2a7a: 6669                     bne.b      $2ae5
2a7c: 6c65                     bge.b      $2ae3
2a7e: 7320                     .byte      0x73, 0x20
2a80: 6f70                     ble.b      $2af2
2a82: 656e                     bcs.b      $2af2
2a84: 2841                     movea.l    d1, a4
2a86: 7474                     moveq      #$74, d2
2a88: 656d                     bcs.b      $2af7
2a8a: 7074                     moveq      #$74, d0
2a8c: 20746f20706f             movea.l    $706f(a4, d6.l * 8), a0
2a92: 7369                     .byte      0x73, 0x69
2a94: 7469                     moveq      #$69, d2
2a96: 6f6e                     ble.b      $2b06
2a98: 2062                     movea.l    -(a2), a0
2a9a: 6566                     bcs.b      $2b02
2a9c: 6f72                     ble.b      $2b10
2a9e: 6520                     bcs.b      $2ac0
2aa0: 7374                     .byte      0x73, 0x74
2aa2: 6172                     bsr.b      $2b16
2aa4: 7420                     moveq      #$20, d2
2aa6: 6f66                     ble.b      $2b0e
2aa8: 2066                     movea.l    -(a6), a0
2aaa: 696c                     bvs.b      $2b18
2aac: 6598                     bcs.b      $2a46
2aae: 314c6f67                 move.w     a4, $6f67(a0)
2ab2: 6963                     bvs.b      $2b17
2ab4: 616c                     bsr.b      $2b22
2ab6: 2065                     movea.l    -(a5), a0
2ab8: 6e64                     bgt.b      $2b1e
2aba: 2d6f662d6669             move.l     $662d(a7), $6669(a6)
2ac0: 6c65                     bge.b      $2b27
2ac2: 207265616368             movea.l    ([$6368, a2]), a0
2ac8: 6564                     bcs.b      $2b2e
2aca: 2064                     movea.l    -(a4), a0
2acc: 7572                     .byte      0x75, 0x72
2ace: 696e                     bvs.b      $2b3e
2ad0: 6720                     beq.b      $2af2
2ad2: 7265                     moveq      #$65, d1
2ad4: 6164                     bsr.b      $2b3a
2ad6: 206f7065                 movea.l    $7065(a7), a0
2ada: 7261                     moveq      #$61, d1
2adc: 7469                     moveq      #$69, d2
2ade: 6f6e                     ble.b      $2b4e
2ae0: 0c46696c                 cmpi.w     #$696c, d6
2ae4: 6520                     bcs.b      $2b06
2ae6: 6e6f                     bgt.b      $2b57
2ae8: 206f7065                 movea.l    $7065(a7), a0
2aec: 6e98                     bgt.b      $2a86
2aee: 1b426164                 move.b     d2, $6164(a5)
2af2: 2066                     movea.l    -(a6), a0
2af4: 696c                     bvs.b      $2b62
2af6: 656e                     bcs.b      $2b66
2af8: 616d                     bsr.b      $2b67
2afa: 6520                     bcs.b      $2b1c
2afc: 6f72                     ble.b      $2b70
2afe: 20766f6c756d             movea.l    $756d(a6, invalid.w), a0
2b04: 6520                     bcs.b      $2b26
2b06: 6e61                     bgt.b      $2b69
2b08: 6d65                     blt.b      $2b6f
2b0a: 09492f4f                 movep.l    $2f4f(a1), d4
2b0e: 2065                     movea.l    -(a5), a0
2b10: 7272                     moveq      #$72, d1
2b12: 6f72                     ble.b      $2b86
2b14: 1d537065                 move.b     (a3), $7065(a6)
2b18: 6369                     bls.b      $2b83
2b1a: 6669                     bne.b      $2b85
2b1c: 6564                     bcs.b      $2b82
2b1e: 20766f6c756d             movea.l    $756d(a6, invalid.w), a0
2b24: 6520                     bcs.b      $2b46
2b26: 646f                     bcc.b      $2b97
2b28: 6573                     bcs.b      $2b9d
2b2a: 6e27                     bgt.b      $2b53
2b2c: 7420                     moveq      #$20, d2
2b2e: 6578                     bcs.b      $2ba8
2b30: 6974                     bvs.b      $2ba6
2b32: 2c41                     movea.l    d1, a6
2b34: 6c6c                     bge.b      $2ba2
2b36: 2061                     movea.l    -(a1), a0
2b38: 6c6c                     bge.b      $2ba6
2b3a: 6f63                     ble.b      $2b9f
2b3c: 6174                     bsr.b      $2bb2
2b3e: 696f                     bvs.b      $2baf
2b40: 6e20                     bgt.b      $2b62
2b42: 626c                     bhi.b      $2bb0
2b44: 6f63                     ble.b      $2ba9
2b46: 6b73                     bmi.b      $2bbb
2b48: 206f6e20                 movea.l    $6e20(a7), a0
2b4c: 7468                     moveq      #$68, d2
2b4e: 6520                     bcs.b      $2b70
2b50: 766f                     moveq      #$6f, d3
2b52: 6c75                     bge.b      $2bc9
2b54: 6d65                     blt.b      $2bbb
2b56: 2061                     movea.l    -(a1), a0
2b58: 7265                     moveq      #$65, d1
2b5a: 2066                     movea.l    -(a6), a0
2b5c: 756c                     .byte      0x75, 0x6c
2b5e: 6c98                     bge.b      $2af8
2b60: 1346696c                 move.b     d6, $696c(a1)
2b64: 6520                     bcs.b      $2b86
2b66: 6469                     bcc.b      $2bd1
2b68: 7265                     moveq      #$65, d1
2b6a: 6374                     bls.b      $2be0
2b6c: 6f72                     ble.b      $2be0
2b6e: 7920                     .byte      0x79, 0x20
2b70: 6675                     bne.b      $2be7
2b72: 6c6c                     bge.b      $2be0
2b74: 4e56fef0                 link.w     a6, #$fef0
2b78: 302e0008                 move.w     $8(a6), d0
2b7c: 48c0                     ext.l      d0
2b7e: 2f00                     move.l     d0, -(a7)
2b80: 486efef0                 pea.l      -$110(a6)
2b84: 4ead0202                 jsr        $202(a5) ; CODE 1 resource+0x094e
2b88: 206e000a                 movea.l    $a(a6), a0
2b8c: 3f3c00ff                 move.w     #$ff, -(a7)
2b90: 486efef0                 pea.l      -$110(a6)
2b94: 2f08                     move.l     a0, -(a7)
2b96: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2b9a: 4e5e                     unlk       a6
2b9c: 205f                     movea.l    (a7)+, a0
2b9e: 544f                     addq.w     #$2, a7
2ba0: 4ed0                     jmp        (a0)
2ba2: 4e56fe92                 link.w     a6, #$fe92
2ba6: 206e0010                 movea.l    $10(a6), a0
2baa: 43eefef0                 lea.l      -$110(a6), a1
2bae: 703f                     moveq      #$3f, d0
2bb0: 22d8                     move.l     (a0)+, (a1)+
2bb2: 51c8fffc                 dbra       d0, $2bb0
2bb6: 3d7c0050feee             move.w     #$50, -$112(a6)
2bbc: 3d7c0037feec             move.w     #$37, -$114(a6)
2bc2: 2d6e000cfe92             move.l     $c(a6), -$16e(a6)
2bc8: 4a2e0014                 tst.b      $14(a6)
2bcc: 6620                     bne.b      $2bee
2bce: 2f2efeec                 move.l     -$114(a6), -(a7)
2bd2: 487a0078                 pea.l      $2c4c(pc)
2bd6: 42a7                     clr.l      -(a7)
2bd8: 3f3c0001                 move.w     #$1, -(a7)
2bdc: 486efe92                 pea.l      -$16e(a6)
2be0: 42a7                     clr.l      -(a7)
2be2: 486efea2                 pea.l      -$15e(a6)
2be6: 3f3c0002                 move.w     #$2, -(a7)
2bea: a9ea                     dc.w       $a9ea
2bec: 6018                     bra.b      $2c06
2bee: 2f2efeec                 move.l     -$114(a6), -(a7)
2bf2: 487a0046                 pea.l      $2c3a(pc)
2bf6: 486efef0                 pea.l      -$110(a6)
2bfa: 42a7                     clr.l      -(a7)
2bfc: 486efea2                 pea.l      -$15e(a6)
2c00: 3f3c0001                 move.w     #$1, -(a7)
2c04: a9ea                     dc.w       $a9ea
2c06: 102efea2                 move.b     -$15e(a6), d0
2c0a: 5300                     subq.b     #$1, d0
2c0c: 6708                     beq.b      $2c16
2c0e: 206e0016                 movea.l    $16(a6), a0
2c12: 4210                     clr.b      (a0)
2c14: 601a                     bra.b      $2c30
2c16: 206e0016                 movea.l    $16(a6), a0
2c1a: 3f3c00ff                 move.w     #$ff, -(a7)
2c1e: 486efeac                 pea.l      -$154(a6)
2c22: 2f08                     move.l     a0, -(a7)
2c24: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2c28: 206e0008                 movea.l    $8(a6), a0
2c2c: 30aefea8                 move.w     -$158(a6), (a0)
2c30: 4e5e                     unlk       a6
2c32: 205f                     movea.l    (a7)+, a0
2c34: 4fef000e                 lea.l      $e(a7), a7
2c38: 4ed0                     jmp        (a0)
2c3a: 11536176                 move.b     (a3), $6176(a0)
2c3e: 6520                     bcs.b      $2c60
2c40: 646f                     bcc.b      $2cb1
2c42: 6375                     bls.b      $2cb9
2c44: 6d65                     blt.b      $2cab
2c46: 6e74                     bgt.b      $2cbc
2c48: 2061                     movea.l    -(a1), a0
2c4a: 733a                     .byte      0x73, 0x3a
2c4c: 00004e56                 ori.b      #$56, d0
2c50: fdec                     dc.w       $fdec
2c52: 48e70308                 movem.l    d6-d7/a4, -(a7)
2c56: 206e0008                 movea.l    $8(a6), a0
2c5a: 43eefef0                 lea.l      -$110(a6), a1
2c5e: 703f                     moveq      #$3f, d0
2c60: 22d8                     move.l     (a0)+, (a1)+
2c62: 51c8fffc                 dbra       d0, $2c60
2c66: 4247                     clr.w      d7
2c68: 4206                     clr.b      d6
2c6a: 6030                     bra.b      $2c9c
2c6c: 5247                     addq.w     #$1, d7
2c6e: 3007                     move.w     d7, d0
2c70: c1fc00a6                 muls.w     #$a6, d0
2c74: 0640bf8e                 addi.w     #$bf8e, d0
2c78: 49f50000                 lea.l      (a5, d0.w), a4
2c7c: 4a2c0008                 tst.b      $8(a4)
2c80: 671a                     beq.b      $2c9c
2c82: 486c000a                 pea.l      $a(a4)
2c86: 486efdee                 pea.l      -$212(a6)
2c8a: a919                     dc.w       $a919
2c8c: 486efdee                 pea.l      -$212(a6)
2c90: 486efef0                 pea.l      -$110(a6)
2c94: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
2c98: 57c6                     seq.b      d6
2c9a: 4406                     neg.b      d6
2c9c: 0c470005                 cmpi.w     #$5, d7
2ca0: 5dc0                     slt.b      d0
2ca2: 1206                     move.b     d6, d1
2ca4: 5301                     subq.b     #$1, d1
2ca6: c001                     and.b      d1, d0
2ca8: 66c2                     bne.b      $2c6c
2caa: 1d46000c                 move.b     d6, $c(a6)
2cae: 4cdf10c0                 movem.l    (a7)+, d6-d7/a4
2cb2: 4e5e                     unlk       a6
2cb4: 2e9f                     move.l     (a7)+, (a7)
2cb6: 4e75                     rts        
2cb8: 4e56fde6                 link.w     a6, #$fde6
2cbc: 48e70708                 movem.l    d5-d7/a4, -(a7)
2cc0: 206e0008                 movea.l    $8(a6), a0
2cc4: 43eefef0                 lea.l      -$110(a6), a1
2cc8: 703f                     moveq      #$3f, d0
2cca: 22d8                     move.l     (a0)+, (a1)+
2ccc: 51c8fffc                 dbra       d0, $2cca
2cd0: a850                     dc.w       $a850
2cd2: 6004                     bra.b      $2cd8
2cd4: 4ebad40e                 jsr        $e4(pc)
2cd8: 554f                     subq.w     #$2, a7
2cda: 3f3c0040                 move.w     #$40, -(a7)
2cde: 486dbdca                 pea.l      -$4236(a5)
2ce2: a970                     dc.w       $a970
2ce4: 4a1f                     tst.b      (a7)+
2ce6: 66ec                     bne.b      $2cd4
2ce8: 486efde8                 pea.l      -$218(a6)
2cec: a874                     dc.w       $a874
2cee: 4247                     clr.w      d7
2cf0: 4206                     clr.b      d6
2cf2: 60000086                 bra.w      $2d7a
2cf6: 5247                     addq.w     #$1, d7
2cf8: 3007                     move.w     d7, d0
2cfa: c1fc00a6                 muls.w     #$a6, d0
2cfe: 0640bf8e                 addi.w     #$bf8e, d0
2d02: 49f50000                 lea.l      (a5, d0.w), a4
2d06: 102c0008                 move.b     $8(a4), d0
2d0a: 5300                     subq.b     #$1, d0
2d0c: 6700006c                 beq.w      $2d7a
2d10: 3007                     move.w     d7, d0
2d12: 6050                     bra.b      $2d64
2d14: 41fa00f6                 lea.l      $2e0c(pc), a0
2d18: 43eefdec                 lea.l      -$214(a6), a1
2d1c: 22d8                     move.l     (a0)+, (a1)+
2d1e: 22d8                     move.l     (a0)+, (a1)+
2d20: 22d8                     move.l     (a0)+, (a1)+
2d22: 6054                     bra.b      $2d78
2d24: 41fa00da                 lea.l      $2e00(pc), a0
2d28: 43eefdec                 lea.l      -$214(a6), a1
2d2c: 22d8                     move.l     (a0)+, (a1)+
2d2e: 22d8                     move.l     (a0)+, (a1)+
2d30: 22d8                     move.l     (a0)+, (a1)+
2d32: 6044                     bra.b      $2d78
2d34: 41fa00be                 lea.l      $2df4(pc), a0
2d38: 43eefdec                 lea.l      -$214(a6), a1
2d3c: 22d8                     move.l     (a0)+, (a1)+
2d3e: 22d8                     move.l     (a0)+, (a1)+
2d40: 22d8                     move.l     (a0)+, (a1)+
2d42: 6034                     bra.b      $2d78
2d44: 41fa00a2                 lea.l      $2de8(pc), a0
2d48: 43eefdec                 lea.l      -$214(a6), a1
2d4c: 22d8                     move.l     (a0)+, (a1)+
2d4e: 22d8                     move.l     (a0)+, (a1)+
2d50: 22d8                     move.l     (a0)+, (a1)+
2d52: 6024                     bra.b      $2d78
2d54: 41fa0086                 lea.l      $2ddc(pc), a0
2d58: 43eefdec                 lea.l      -$214(a6), a1
2d5c: 22d8                     move.l     (a0)+, (a1)+
2d5e: 22d8                     move.l     (a0)+, (a1)+
2d60: 22d8                     move.l     (a0)+, (a1)+
2d62: 6014                     bra.b      $2d78
2d64: 5340                     subq.w     #$1, d0
2d66: 67ac                     beq.b      $2d14
2d68: 5340                     subq.w     #$1, d0
2d6a: 67b8                     beq.b      $2d24
2d6c: 5340                     subq.w     #$1, d0
2d6e: 67c4                     beq.b      $2d34
2d70: 5340                     subq.w     #$1, d0
2d72: 67d0                     beq.b      $2d44
2d74: 5340                     subq.w     #$1, d0
2d76: 67dc                     beq.b      $2d54
2d78: 7c01                     moveq      #$1, d6
2d7a: 1006                     move.b     d6, d0
2d7c: 5300                     subq.b     #$1, d0
2d7e: 0c470005                 cmpi.w     #$5, d7
2d82: 5dc1                     slt.b      d1
2d84: c001                     and.b      d1, d0
2d86: 6600ff6e                 bne.w      $2cf6
2d8a: 486efef0                 pea.l      -$110(a6)
2d8e: 486efdec                 pea.l      -$214(a6)
2d92: 487a0046                 pea.l      $2dda(pc)
2d96: 487a0040                 pea.l      $2dd8(pc)
2d9a: a98b                     dc.w       $a98b
2d9c: 554f                     subq.w     #$2, a7
2d9e: 3f3c0084                 move.w     #$84, -(a7)
2da2: 42a7                     clr.l      -(a7)
2da4: a985                     dc.w       $a985
2da6: 3a1f                     move.w     (a7)+, d5
2da8: 2f2efde8                 move.l     -$218(a6), -(a7)
2dac: a873                     dc.w       $a873
2dae: 0c450001                 cmpi.w     #$1, d5
2db2: 6614                     bne.b      $2dc8
2db4: 206e000c                 movea.l    $c(a6), a0
2db8: 3f3c00ff                 move.w     #$ff, -(a7)
2dbc: 486efdec                 pea.l      -$214(a6)
2dc0: 2f08                     move.l     a0, -(a7)
2dc2: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2dc6: 6006                     bra.b      $2dce
2dc8: 206e000c                 movea.l    $c(a6), a0
2dcc: 4210                     clr.b      (a0)
2dce: 4cdf10e0                 movem.l    (a7)+, d5-d7/a4
2dd2: 4e5e                     unlk       a6
2dd4: 2e9f                     move.l     (a7)+, (a7)
2dd6: 4e75                     rts        
2dd8: 00000000                 ori.b      #$0, d0
2ddc: 0a556e74                 eori.w     #$6e74, (a5)
2de0: 6974                     bvs.b      $2e56
2de2: 6c65                     bge.b      $2e49
2de4: 6420                     bcc.b      $2e06
2de6: 3508                     move.w     a0, -(a2)
2de8: 0a556e74                 eori.w     #$6e74, (a5)
2dec: 6974                     bvs.b      $2e62
2dee: 6c65                     bge.b      $2e55
2df0: 6420                     bcc.b      $2e12
2df2: 3408                     move.w     a0, d2
2df4: 0a556e74                 eori.w     #$6e74, (a5)
2df8: 6974                     bvs.b      $2e6e
2dfa: 6c65                     bge.b      $2e61
2dfc: 6420                     bcc.b      $2e1e
2dfe: 3308                     move.w     a0, -(a1)
2e00: 0a556e74                 eori.w     #$6e74, (a5)
2e04: 6974                     bvs.b      $2e7a
2e06: 6c65                     bge.b      $2e6d
2e08: 6420                     bcc.b      $2e2a
2e0a: 3208                     move.w     a0, d1
2e0c: 0a556e74                 eori.w     #$6e74, (a5)
2e10: 6974                     bvs.b      $2e86
2e12: 6c65                     bge.b      $2e79
2e14: 6420                     bcc.b      $2e36
2e16: 3108                     move.w     a0, -(a0)
2e18: 4e56fdf0                 link.w     a6, #$fdf0
2e1c: 206e000c                 movea.l    $c(a6), a0
2e20: 43eefef0                 lea.l      -$110(a6), a1
2e24: 703f                     moveq      #$3f, d0
2e26: 22d8                     move.l     (a0)+, (a1)+
2e28: 51c8fffc                 dbra       d0, $2e26
2e2c: 486efdf0                 pea.l      -$210(a6)
2e30: 487a0046                 pea.l      $2e78(pc)
2e34: 206e0008                 movea.l    $8(a6), a0
2e38: 4868fef0                 pea.l      -$110(a0)
2e3c: 487a0034                 pea.l      $2e72(pc)
2e40: 486efef0                 pea.l      -$110(a6)
2e44: 3f3c0004                 move.w     #$4, -(a7)
2e48: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
2e4c: 584f                     addq.w     #$4, a7
2e4e: 486efdf0                 pea.l      -$210(a6)
2e52: 4ebadc92                 jsr        $ae6(pc)
2e56: 206e0008                 movea.l    $8(a6), a0
2e5a: 4228000e                 clr.b      $e(a0)
2e5e: 3f3c0001                 move.w     #$1, -(a7)
2e62: 487a0160                 pea.l      $2fc4(pc)
2e66: 4ead0112                 jsr        $112(a5) ; CODE 1 resource+0x02c2
2e6a: 4e5e                     unlk       a6
2e6c: 205f                     movea.l    (a7)+, a0
2e6e: 504f                     addq.w     #$8, a7
2e70: 4ed0                     jmp        (a0)
2e72: 0422202d                 subi.b     #$2d, -(a2)
2e76: 2012                     move.l     (a2), d0
2e78: 1a45                     .byte      0x1a, 0x45
2e7a: 7272                     moveq      #$72, d1
2e7c: 6f72                     ble.b      $2ef0
2e7e: 20776869                 movea.l    $69(a7, d6.l), a0
2e82: 6c65                     bge.b      $2ee9
2e84: 207265616469             movea.l    ([$6469, a2]), a0
2e8a: 6e67                     bgt.b      $2ef3
2e8c: 2066                     movea.l    -(a6), a0
2e8e: 726f                     moveq      #$6f, d1
2e90: 6d20                     blt.b      $2eb2
2e92: 2212                     move.l     (a2), d1
2e94: 4e56fbf0                 link.w     a6, #$fbf0
2e98: 4a6e000c                 tst.w      $c(a6)
2e9c: 6756                     beq.b      $2ef4
2e9e: 486efdf0                 pea.l      -$210(a6)
2ea2: 487a005c                 pea.l      $2f00(pc)
2ea6: 486efcf0                 pea.l      -$310(a6)
2eaa: 3f2e000c                 move.w     $c(a6), -(a7)
2eae: 4ebafcc4                 jsr        $2b74(pc)
2eb2: 584f                     addq.w     #$4, a7
2eb4: 486efcf0                 pea.l      -$310(a6)
2eb8: 487a0042                 pea.l      $2efc(pc)
2ebc: 486efbf0                 pea.l      -$410(a6)
2ec0: 3f2e000c                 move.w     $c(a6), -(a7)
2ec4: 4ebaf6e8                 jsr        $25ae(pc)
2ec8: 584f                     addq.w     #$4, a7
2eca: 486efbf0                 pea.l      -$410(a6)
2ece: 3f3c0004                 move.w     #$4, -(a7)
2ed2: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
2ed6: 584f                     addq.w     #$4, a7
2ed8: 3f3c00ff                 move.w     #$ff, -(a7)
2edc: 486efdf0                 pea.l      -$210(a6)
2ee0: 486efef0                 pea.l      -$110(a6)
2ee4: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
2ee8: 486efef0                 pea.l      -$110(a6)
2eec: 2f2e0008                 move.l     $8(a6), -(a7)
2ef0: 4ebaff26                 jsr        $2e18(pc)
2ef4: 4e5e                     unlk       a6
2ef6: 205f                     movea.l    (a7)+, a0
2ef8: 5c4f                     addq.w     #$6, a7
2efa: 4ed0                     jmp        (a0)
2efc: 0320                     btst.l     d1, -(a0)
2efe: 2d20                     move.l     -(a0), -(a6)
2f00: 0b492f4f                 movep.l    $2f4f(a1), d5
2f04: 2065                     movea.l    -(a5), a0
2f06: 7272                     moveq      #$72, d1
2f08: 6f72                     ble.b      $2f7c
2f0a: 2023                     move.l     -(a3), d0
2f0c: 4e56fee6                 link.w     a6, #$fee6
2f10: 48e71f38                 movem.l    d3-d7/a2-a4, -(a7)
2f14: 2d4ffffc                 move.l     a7, -$4(a6)
2f18: 206e000a                 movea.l    $a(a6), a0
2f1c: 43eefef0                 lea.l      -$110(a6), a1
2f20: 703f                     moveq      #$3f, d0
2f22: 22d8                     move.l     (a0)+, (a1)+
2f24: 51c8fffc                 dbra       d0, $2f22
2f28: 422efeeb                 clr.b      -$115(a6)
2f2c: 554f                     subq.w     #$2, a7
2f2e: 486efef0                 pea.l      -$110(a6)
2f32: 3f2e0008                 move.w     $8(a6), -(a7)
2f36: 486efee8                 pea.l      -$118(a6)
2f3a: 4ead017a                 jsr        $17a(a5) ; CODE 1 resource+0x0580
2f3e: 2f0e                     move.l     a6, -(a7)
2f40: 4ebaff52                 jsr        $2e94(pc)
2f44: 1d7c0001feeb             move.b     #$1, -$115(a6)
2f4a: 554f                     subq.w     #$2, a7
2f4c: 3f2efee8                 move.w     -$118(a6), -(a7)
2f50: 486efeec                 pea.l      -$114(a6)
2f54: 4ead01aa                 jsr        $1aa(a5) ; CODE 1 resource+0x0680
2f58: 2f0e                     move.l     a6, -(a7)
2f5a: 4ebaff38                 jsr        $2e94(pc)
2f5e: 0cae00007ffffeec         cmpi.l     #$7fff, -$114(a6)
2f66: 6f0a                     ble.b      $2f72
2f68: 487a007a                 pea.l      $2fe4(pc)
2f6c: 2f0e                     move.l     a6, -(a7)
2f6e: 4ebafea8                 jsr        $2e18(pc)
2f72: 554f                     subq.w     #$2, a7
2f74: 3f2efee8                 move.w     -$118(a6), -(a7)
2f78: 4ead0182                 jsr        $182(a5) ; CODE 1 resource+0x05c0
2f7c: 3d5ffee6                 move.w     (a7)+, -$11a(a6)
2f80: 594f                     subq.w     #$4, a7
2f82: 2f2efeec                 move.l     -$114(a6), -(a7)
2f86: 4ead015a                 jsr        $15a(a5) ; CODE 1 resource+0x053a
2f8a: 2b5fbdde                 move.l     (a7)+, -$4222(a5)
2f8e: 554f                     subq.w     #$2, a7
2f90: 486efef0                 pea.l      -$110(a6)
2f94: 3f2e0008                 move.w     $8(a6), -(a7)
2f98: 486efee8                 pea.l      -$118(a6)
2f9c: 4ead017a                 jsr        $17a(a5) ; CODE 1 resource+0x0580
2fa0: 3d5ffee6                 move.w     (a7)+, -$11a(a6)
2fa4: 554f                     subq.w     #$2, a7
2fa6: 3f2efee8                 move.w     -$118(a6), -(a7)
2faa: 486efeec                 pea.l      -$114(a6)
2fae: 206dbdde                 movea.l    -$4222(a5), a0
2fb2: 2f10                     move.l     (a0), -(a7)
2fb4: 4ead018a                 jsr        $18a(a5) ; CODE 1 resource+0x05da
2fb8: 2f0e                     move.l     a6, -(a7)
2fba: 4ebafed8                 jsr        $2e94(pc)
2fbe: 1d7c0001000e             move.b     #$1, $e(a6)
2fc4: 4a2efeeb                 tst.b      -$115(a6)
2fc8: 670e                     beq.b      $2fd8
2fca: 554f                     subq.w     #$2, a7
2fcc: 3f2efee8                 move.w     -$118(a6), -(a7)
2fd0: 4ead0182                 jsr        $182(a5) ; CODE 1 resource+0x05c0
2fd4: 3d5ffee6                 move.w     (a7)+, -$11a(a6)
2fd8: 4cdf1cf8                 movem.l    (a7)+, d3-d7/a2-a4
2fdc: 4e5e                     unlk       a6
2fde: 205f                     movea.l    (a7)+, a0
2fe0: 5c4f                     addq.w     #$6, a7
2fe2: 4ed0                     jmp        (a0)
2fe4: 1746696c                 move.b     d6, $696c(a3)
2fe8: 6520                     bcs.b      $300a
2fea: 6973                     bvs.b      $305f
2fec: 20746f6f2062             movea.l    ([$2062, a4]), a0
2ff2: 6967                     bvs.b      $305b
2ff4: 20746f206564             movea.l    $6564(a4, d6.l * 8), a0
2ffa: 6974                     bvs.b      $3070
2ffc: 4e56fd00                 link.w     a6, #$fd00
3000: 4a6e000c                 tst.w      $c(a6)
3004: 6762                     beq.b      $3068
3006: 486eff00                 pea.l      -$100(a6)
300a: 487a0078                 pea.l      $3084(pc)
300e: 206e0008                 movea.l    $8(a6), a0
3012: 4868fef0                 pea.l      -$110(a0)
3016: 487a005c                 pea.l      $3074(pc)
301a: 486efe00                 pea.l      -$200(a6)
301e: 3f2e000c                 move.w     $c(a6), -(a7)
3022: 4ebafb50                 jsr        $2b74(pc)
3026: 584f                     addq.w     #$4, a7
3028: 486efe00                 pea.l      -$200(a6)
302c: 487a0042                 pea.l      $3070(pc)
3030: 486efd00                 pea.l      -$300(a6)
3034: 3f2e000c                 move.w     $c(a6), -(a7)
3038: 4ebaf574                 jsr        $25ae(pc)
303c: 584f                     addq.w     #$4, a7
303e: 486efd00                 pea.l      -$300(a6)
3042: 3f3c0006                 move.w     #$6, -(a7)
3046: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
304a: 584f                     addq.w     #$4, a7
304c: 486eff00                 pea.l      -$100(a6)
3050: 4ebada94                 jsr        $ae6(pc)
3054: 206e0008                 movea.l    $8(a6), a0
3058: 42280012                 clr.b      $12(a0)
305c: 3f3c0001                 move.w     #$1, -(a7)
3060: 487a00e8                 pea.l      $314a(pc)
3064: 4ead0112                 jsr        $112(a5) ; CODE 1 resource+0x02c2
3068: 4e5e                     unlk       a6
306a: 205f                     movea.l    (a7)+, a0
306c: 5c4f                     addq.w     #$6, a7
306e: 4ed0                     jmp        (a0)
3070: 0320                     btst.l     d1, -(a0)
3072: 2d20                     move.l     -(a0), -(a6)
3074: 0f22                     btst.l     d7, -(a2)
3076: 202d2049                 move.l     $2049(a5), d0
307a: 2f4f2065                 move.l     a7, $2065(a7)
307e: 7272                     moveq      #$72, d1
3080: 6f72                     ble.b      $30f4
3082: 2023                     move.l     -(a3), d0
3084: 1845                     .byte      0x18, 0x45
3086: 7272                     moveq      #$72, d1
3088: 6f72                     ble.b      $30fc
308a: 20776869                 movea.l    $69(a7, d6.l), a0
308e: 6c65                     bge.b      $30f5
3090: 20777269                 movea.l    $69(a7, d7.w), a0
3094: 7469                     moveq      #$69, d2
3096: 6e67                     bgt.b      $30ff
3098: 20746f202212             movea.l    $2212(a4, d6.l * 8), a0
309e: 4e56fee8                 link.w     a6, #$fee8
30a2: 48e71f38                 movem.l    d3-d7/a2-a4, -(a7)
30a6: 2d4ffffc                 move.l     a7, -$4(a6)
30aa: 206e000e                 movea.l    $e(a6), a0
30ae: 43eefef0                 lea.l      -$110(a6), a1
30b2: 703f                     moveq      #$3f, d0
30b4: 22d8                     move.l     (a0)+, (a1)+
30b6: 51c8fffc                 dbra       d0, $30b4
30ba: 554f                     subq.w     #$2, a7
30bc: 486efef0                 pea.l      -$110(a6)
30c0: 3f2e000c                 move.w     $c(a6), -(a7)
30c4: 2f3c52576172             move.l     #$52576172, -(a7)
30ca: 2f3c54455854             move.l     #$54455854, -(a7)
30d0: 4ead01a2                 jsr        $1a2(a5) ; CODE 1 resource+0x0642
30d4: 3d5ffee8                 move.w     (a7)+, -$118(a6)
30d8: 0c6effd0fee8             cmpi.w     #$ffd0, -$118(a6)
30de: 670a                     beq.b      $30ea
30e0: 3f2efee8                 move.w     -$118(a6), -(a7)
30e4: 2f0e                     move.l     a6, -(a7)
30e6: 4ebaff14                 jsr        $2ffc(pc)
30ea: 554f                     subq.w     #$2, a7
30ec: 486efef0                 pea.l      -$110(a6)
30f0: 3f2e000c                 move.w     $c(a6), -(a7)
30f4: 486efeea                 pea.l      -$116(a6)
30f8: 4ead017a                 jsr        $17a(a5) ; CODE 1 resource+0x0580
30fc: 2f0e                     move.l     a6, -(a7)
30fe: 4ebafefc                 jsr        $2ffc(pc)
3102: 554f                     subq.w     #$2, a7
3104: 3f2efeea                 move.w     -$116(a6), -(a7)
3108: 42a7                     clr.l      -(a7)
310a: 4ead01b2                 jsr        $1b2(a5) ; CODE 1 resource+0x06a2
310e: 2f0e                     move.l     a6, -(a7)
3110: 4ebafeea                 jsr        $2ffc(pc)
3114: 206e0008                 movea.l    $8(a6), a0
3118: 2050                     movea.l    (a0), a0
311a: 3028003c                 move.w     $3c(a0), d0
311e: 48c0                     ext.l      d0
3120: 2d40feec                 move.l     d0, -$114(a6)
3124: 554f                     subq.w     #$2, a7
3126: 3f2efeea                 move.w     -$116(a6), -(a7)
312a: 486efeec                 pea.l      -$114(a6)
312e: 206e0008                 movea.l    $8(a6), a0
3132: 2050                     movea.l    (a0), a0
3134: 2068003e                 movea.l    $3e(a0), a0
3138: 2f10                     move.l     (a0), -(a7)
313a: 4ead0192                 jsr        $192(a5) ; CODE 1 resource+0x05de
313e: 2f0e                     move.l     a6, -(a7)
3140: 4ebafeba                 jsr        $2ffc(pc)
3144: 1d7c00010012             move.b     #$1, $12(a6)
314a: 554f                     subq.w     #$2, a7
314c: 3f2efeea                 move.w     -$116(a6), -(a7)
3150: 4ead0182                 jsr        $182(a5) ; CODE 1 resource+0x05c0
3154: 3d5ffee8                 move.w     (a7)+, -$118(a6)
3158: 554f                     subq.w     #$2, a7
315a: 42a7                     clr.l      -(a7)
315c: 3f2e000c                 move.w     $c(a6), -(a7)
3160: 4ead019a                 jsr        $19a(a5) ; CODE 1 resource+0x0622
3164: 3d5ffee8                 move.w     (a7)+, -$118(a6)
3168: 4cdf1cf8                 movem.l    (a7)+, d3-d7/a2-a4
316c: 4e5e                     unlk       a6
316e: 205f                     movea.l    (a7)+, a0
3170: 4fef000a                 lea.l      $a(a7), a7
3174: 4ed0                     jmp        (a0)
3176: 4e56ffec                 link.w     a6, #$ffec
317a: 48e70308                 movem.l    d6-d7/a4, -(a7)
317e: 4247                     clr.w      d7
3180: 4206                     clr.b      d6
3182: 600000d8                 bra.w      $325c
3186: 5247                     addq.w     #$1, d7
3188: 3007                     move.w     d7, d0
318a: c1fc00a6                 muls.w     #$a6, d0
318e: 0640bf8e                 addi.w     #$bf8e, d0
3192: 49f50000                 lea.l      (a5, d0.w), a4
3196: 102c0008                 move.b     $8(a4), d0
319a: 5300                     subq.b     #$1, d0
319c: 670000be                 beq.w      $325c
31a0: 3d47000e                 move.w     d7, $e(a6)
31a4: 206e000a                 movea.l    $a(a6), a0
31a8: 4a10                     tst.b      (a0)
31aa: 66000076                 bne.w      $3222
31ae: 3007                     move.w     d7, d0
31b0: 605c                     bra.b      $320e
31b2: 41ee0008                 lea.l      $8(a6), a0
31b6: 3f18                     move.w     (a0)+, -(a7)
31b8: 487a00ee                 pea.l      $32a8(pc)
31bc: 2f10                     move.l     (a0), -(a7)
31be: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
31c2: 6000005e                 bra.w      $3222
31c6: 41ee0008                 lea.l      $8(a6), a0
31ca: 3f18                     move.w     (a0)+, -(a7)
31cc: 487a00ce                 pea.l      $329c(pc)
31d0: 2f10                     move.l     (a0), -(a7)
31d2: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
31d6: 604a                     bra.b      $3222
31d8: 41ee0008                 lea.l      $8(a6), a0
31dc: 3f18                     move.w     (a0)+, -(a7)
31de: 487a00b0                 pea.l      $3290(pc)
31e2: 2f10                     move.l     (a0), -(a7)
31e4: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
31e8: 6038                     bra.b      $3222
31ea: 41ee0008                 lea.l      $8(a6), a0
31ee: 3f18                     move.w     (a0)+, -(a7)
31f0: 487a0092                 pea.l      $3284(pc)
31f4: 2f10                     move.l     (a0), -(a7)
31f6: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
31fa: 6026                     bra.b      $3222
31fc: 41ee0008                 lea.l      $8(a6), a0
3200: 3f18                     move.w     (a0)+, -(a7)
3202: 487a0074                 pea.l      $3278(pc)
3206: 2f10                     move.l     (a0), -(a7)
3208: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
320c: 6014                     bra.b      $3222
320e: 5340                     subq.w     #$1, d0
3210: 67a0                     beq.b      $31b2
3212: 5340                     subq.w     #$1, d0
3214: 67b0                     beq.b      $31c6
3216: 5340                     subq.w     #$1, d0
3218: 67be                     beq.b      $31d8
321a: 5340                     subq.w     #$1, d0
321c: 67cc                     beq.b      $31ea
321e: 5340                     subq.w     #$1, d0
3220: 67da                     beq.b      $31fc
3222: 197c00010008             move.b     #$1, $8(a4)
3228: 302dbdf0                 move.w     -$4210(a5), d0
322c: 5240                     addq.w     #$1, d0
322e: 3b40bdf0                 move.w     d0, -$4210(a5)
3232: 302dbdf2                 move.w     -$420e(a5), d0
3236: 5240                     addq.w     #$1, d0
3238: 3b40bdf2                 move.w     d0, -$420e(a5)
323c: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
3240: 3007                     move.w     d7, d0
3242: 5640                     addq.w     #$3, d0
3244: 3f00                     move.w     d0, -(a7)
3246: a939                     dc.w       $a939
3248: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
324c: 3007                     move.w     d7, d0
324e: 5640                     addq.w     #$3, d0
3250: 3f00                     move.w     d0, -(a7)
3252: 206e000a                 movea.l    $a(a6), a0
3256: 2f08                     move.l     a0, -(a7)
3258: a947                     dc.w       $a947
325a: 7c01                     moveq      #$1, d6
325c: 1006                     move.b     d6, d0
325e: 5300                     subq.b     #$1, d0
3260: 0c470005                 cmpi.w     #$5, d7
3264: 5dc1                     slt.b      d1
3266: c001                     and.b      d1, d0
3268: 6600ff1c                 bne.w      $3186
326c: 4cdf10c0                 movem.l    (a7)+, d6-d7/a4
3270: 4e5e                     unlk       a6
3272: 205f                     movea.l    (a7)+, a0
3274: 5c4f                     addq.w     #$6, a7
3276: 4ed0                     jmp        (a0)
3278: 0a556e74                 eori.w     #$6e74, (a5)
327c: 6974                     bvs.b      $32f2
327e: 6c65                     bge.b      $32e5
3280: 6420                     bcc.b      $32a2
3282: 3508                     move.w     a0, -(a2)
3284: 0a556e74                 eori.w     #$6e74, (a5)
3288: 6974                     bvs.b      $32fe
328a: 6c65                     bge.b      $32f1
328c: 6420                     bcc.b      $32ae
328e: 3408                     move.w     a0, d2
3290: 0a556e74                 eori.w     #$6e74, (a5)
3294: 6974                     bvs.b      $330a
3296: 6c65                     bge.b      $32fd
3298: 6420                     bcc.b      $32ba
329a: 3308                     move.w     a0, -(a1)
329c: 0a556e74                 eori.w     #$6e74, (a5)
32a0: 6974                     bvs.b      $3316
32a2: 6c65                     bge.b      $3309
32a4: 6420                     bcc.b      $32c6
32a6: 3208                     move.w     a0, d1
32a8: 0a556e74                 eori.w     #$6e74, (a5)
32ac: 6974                     bvs.b      $3322
32ae: 6c65                     bge.b      $3315
32b0: 6420                     bcc.b      $32d2
32b2: 3108                     move.w     a0, -(a0)
32b4: 4e56ffe8                 link.w     a6, #$ffe8
32b8: 48e70f08                 movem.l    d4-d7/a4, -(a7)
32bc: 2a2e0008                 move.l     $8(a6), d5
32c0: 4247                     clr.w      d7
32c2: 4206                     clr.b      d6
32c4: 6056                     bra.b      $331c
32c6: 5247                     addq.w     #$1, d7
32c8: 3007                     move.w     d7, d0
32ca: c1fc00a6                 muls.w     #$a6, d0
32ce: 0640bf8e                 addi.w     #$bf8e, d0
32d2: 49f50000                 lea.l      (a5, d0.w), a4
32d6: 41ec000a                 lea.l      $a(a4), a0
32da: ba88                     cmp.l      a0, d5
32dc: 663e                     bne.b      $331c
32de: 594f                     subq.w     #$4, a7
32e0: 2f05                     move.l     d5, -(a7)
32e2: a917                     dc.w       $a917
32e4: 281f                     move.l     (a7)+, d4
32e6: 302dbdf0                 move.w     -$4210(a5), d0
32ea: 5340                     subq.w     #$1, d0
32ec: 3b40bdf0                 move.w     d0, -$4210(a5)
32f0: 302dbdf2                 move.w     -$420e(a5), d0
32f4: 5340                     subq.w     #$1, d0
32f6: 3b40bdf2                 move.w     d0, -$420e(a5)
32fa: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
32fe: 3007                     move.w     d7, d0
3300: 5640                     addq.w     #$3, d0
3302: 3f00                     move.w     d0, -(a7)
3304: a93a                     dc.w       $a93a
3306: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
330a: 3007                     move.w     d7, d0
330c: 5640                     addq.w     #$3, d0
330e: 3f00                     move.w     d0, -(a7)
3310: 487a0022                 pea.l      $3334(pc)
3314: a947                     dc.w       $a947
3316: 422c0008                 clr.b      $8(a4)
331a: 7c01                     moveq      #$1, d6
331c: 1006                     move.b     d6, d0
331e: 5300                     subq.b     #$1, d0
3320: 0c470005                 cmpi.w     #$5, d7
3324: 5dc1                     slt.b      d1
3326: c001                     and.b      d1, d0
3328: 669c                     bne.b      $32c6
332a: 4cdf10f0                 movem.l    (a7)+, d4-d7/a4
332e: 4e5e                     unlk       a6
3330: 2e9f                     move.l     (a7)+, (a7)
3332: 4e75                     rts        
3334: 06556e75                 addi.w     #$6e75, (a5)
3338: 7365                     .byte      0x73, 0x65
333a: 6416                     bcc.b      $3352
333c: 4e56feec                 link.w     a6, #$feec
3340: 48e70708                 movem.l    d5-d7/a4, -(a7)
3344: 2a2e000c                 move.l     $c(a6), d5
3348: 206e0008                 movea.l    $8(a6), a0
334c: 43eefef0                 lea.l      -$110(a6), a1
3350: 703f                     moveq      #$3f, d0
3352: 22d8                     move.l     (a0)+, (a1)+
3354: 51c8fffc                 dbra       d0, $3352
3358: 4247                     clr.w      d7
335a: 4206                     clr.b      d6
335c: 2f05                     move.l     d5, -(a7)
335e: 486efef0                 pea.l      -$110(a6)
3362: a91a                     dc.w       $a91a
3364: 602a                     bra.b      $3390
3366: 5247                     addq.w     #$1, d7
3368: 3007                     move.w     d7, d0
336a: c1fc00a6                 muls.w     #$a6, d0
336e: 0640bf8e                 addi.w     #$bf8e, d0
3372: 49f50000                 lea.l      (a5, d0.w), a4
3376: 41ec000a                 lea.l      $a(a4), a0
337a: ba88                     cmp.l      a0, d5
337c: 6612                     bne.b      $3390
337e: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
3382: 3007                     move.w     d7, d0
3384: 5640                     addq.w     #$3, d0
3386: 3f00                     move.w     d0, -(a7)
3388: 486efef0                 pea.l      -$110(a6)
338c: a947                     dc.w       $a947
338e: 7c01                     moveq      #$1, d6
3390: 1006                     move.b     d6, d0
3392: 5300                     subq.b     #$1, d0
3394: 0c470005                 cmpi.w     #$5, d7
3398: 5dc1                     slt.b      d1
339a: c001                     and.b      d1, d0
339c: 66c8                     bne.b      $3366
339e: 4cdf10e0                 movem.l    (a7)+, d5-d7/a4
33a2: 4e5e                     unlk       a6
33a4: 205f                     movea.l    (a7)+, a0
33a6: 504f                     addq.w     #$8, a7
33a8: 4ed0                     jmp        (a0)
33aa: 4e56fcea                 link.w     a6, #$fcea
33ae: 48e70318                 movem.l    d6-d7/a3-a4, -(a7)
33b2: 1c2e000e                 move.b     $e(a6), d6
33b6: 206e000a                 movea.l    $a(a6), a0
33ba: 43eefef0                 lea.l      -$110(a6), a1
33be: 703f                     moveq      #$3f, d0
33c0: 22d8                     move.l     (a0)+, (a1)+
33c2: 51c8fffc                 dbra       d0, $33c0
33c6: 1006                     move.b     d6, d0
33c8: 5300                     subq.b     #$1, d0
33ca: 670000b4                 beq.w      $3480
33ce: 422efdee                 clr.b      -$212(a6)
33d2: 4a2efef0                 tst.b      -$110(a6)
33d6: 662a                     bne.b      $3402
33d8: 486efcea                 pea.l      -$316(a6)
33dc: 4227                     clr.b      -(a7)
33de: 487a0190                 pea.l      $3570(pc)
33e2: 2f3c54455854             move.l     #$54455854, -(a7)
33e8: 486e0008                 pea.l      $8(a6)
33ec: 4ebaf7b4                 jsr        $2ba2(pc)
33f0: 584f                     addq.w     #$4, a7
33f2: 3f3c00ff                 move.w     #$ff, -(a7)
33f6: 486efcea                 pea.l      -$316(a6)
33fa: 486efef0                 pea.l      -$110(a6)
33fe: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
3402: 4a2efef0                 tst.b      -$110(a6)
3406: 67000078                 beq.w      $3480
340a: 554f                     subq.w     #$2, a7
340c: 486efef0                 pea.l      -$110(a6)
3410: 4ebaf83c                 jsr        $2c4e(pc)
3414: 101f                     move.b     (a7)+, d0
3416: 5300                     subq.b     #$1, d0
3418: 6712                     beq.b      $342c
341a: 3f3c00ff                 move.w     #$ff, -(a7)
341e: 486efef0                 pea.l      -$110(a6)
3422: 486efdee                 pea.l      -$212(a6)
3426: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
342a: 601e                     bra.b      $344a
342c: 486efcea                 pea.l      -$316(a6)
3430: 486efef0                 pea.l      -$110(a6)
3434: 4ebaf882                 jsr        $2cb8(pc)
3438: 584f                     addq.w     #$4, a7
343a: 3f3c00ff                 move.w     #$ff, -(a7)
343e: 486efcea                 pea.l      -$316(a6)
3442: 486efdee                 pea.l      -$212(a6)
3446: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
344a: 4a2efdee                 tst.b      -$212(a6)
344e: 6730                     beq.b      $3480
3450: 554f                     subq.w     #$2, a7
3452: 486efef0                 pea.l      -$110(a6)
3456: 3f2e0008                 move.w     $8(a6), -(a7)
345a: 4ebafab0                 jsr        $2f0c(pc)
345e: 101f                     move.b     (a7)+, d0
3460: 5300                     subq.b     #$1, d0
3462: 670c                     beq.b      $3470
3464: 422efdee                 clr.b      -$212(a6)
3468: 6016                     bra.b      $3480
346a: 6004                     bra.b      $3470
346c: 4ebacc76                 jsr        $e4(pc)
3470: 554f                     subq.w     #$2, a7
3472: 3f3c0040                 move.w     #$40, -(a7)
3476: 486dbdca                 pea.l      -$4236(a5)
347a: a970                     dc.w       $a970
347c: 4a1f                     tst.b      (a7)+
347e: 66ec                     bne.b      $346c
3480: 4a2efdee                 tst.b      -$212(a6)
3484: 56c0                     sne.b      d0
3486: 4400                     neg.b      d0
3488: 8006                     or.b       d6, d0
348a: 670000d8                 beq.w      $3564
348e: 4a06                     tst.b      d6
3490: 670c                     beq.b      $349e
3492: 422efdee                 clr.b      -$212(a6)
3496: 422efef0                 clr.b      -$110(a6)
349a: 426e0008                 clr.w      $8(a6)
349e: 554f                     subq.w     #$2, a7
34a0: 486efdee                 pea.l      -$212(a6)
34a4: 3f3c00ff                 move.w     #$ff, -(a7)
34a8: 4ebafccc                 jsr        $3176(pc)
34ac: 3e1f                     move.w     (a7)+, d7
34ae: 3007                     move.w     d7, d0
34b0: c1fc00a6                 muls.w     #$a6, d0
34b4: 0640bf8e                 addi.w     #$bf8e, d0
34b8: 49f50000                 lea.l      (a5, d0.w), a4
34bc: 486efdee                 pea.l      -$212(a6)
34c0: 486efef0                 pea.l      -$110(a6)
34c4: 3f2e0008                 move.w     $8(a6), -(a7)
34c8: 486c000a                 pea.l      $a(a4)
34cc: 2f0c                     move.l     a4, -(a7)
34ce: 4227                     clr.b      -(a7)
34d0: 4ebae656                 jsr        $1b28(pc)
34d4: 266c00a2                 movea.l    $a2(a4), a3
34d8: 2053                     movea.l    (a3), a0
34da: 314722b4                 move.w     d7, $22b4(a0)
34de: be6dbdb2                 cmp.w      -$424e(a5), d7
34e2: 6604                     bne.b      $34e8
34e4: 426dbdb2                 clr.w      -$424e(a5)
34e8: 41edc37b                 lea.l      -$3c85(a5), a0
34ec: 11bc00017000             move.b     #$1, (a0, d7.w)
34f2: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
34f6: 3f3c0001                 move.w     #$1, -(a7)
34fa: 0c6d0005bdf0             cmpi.w     #$5, -$4210(a5)
3500: 5dc0                     slt.b      d0
3502: 4400                     neg.b      d0
3504: 1f00                     move.b     d0, -(a7)
3506: 4ebacc44                 jsr        $14c(pc)
350a: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
350e: 3f3c0002                 move.w     #$2, -(a7)
3512: 0c6d0005bdf0             cmpi.w     #$5, -$4210(a5)
3518: 5dc0                     slt.b      d0
351a: 4400                     neg.b      d0
351c: 1f00                     move.b     d0, -(a7)
351e: 4ebacc2c                 jsr        $14c(pc)
3522: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
3526: 3f3c0004                 move.w     #$4, -(a7)
352a: a939                     dc.w       $a939
352c: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
3530: 3f3c0006                 move.w     #$6, -(a7)
3534: a939                     dc.w       $a939
3536: 0c6d0002bdf2             cmpi.w     #$2, -$420e(a5)
353c: 6d14                     blt.b      $3552
353e: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
3542: 3f3c0001                 move.w     #$1, -(a7)
3546: a939                     dc.w       $a939
3548: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
354c: 3f3c0002                 move.w     #$2, -(a7)
3550: a939                     dc.w       $a939
3552: 0c6d0002bdf0             cmpi.w     #$2, -$4210(a5)
3558: 6d0a                     blt.b      $3564
355a: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
355e: 3f3c0001                 move.w     #$1, -(a7)
3562: a939                     dc.w       $a939
3564: 4cdf18c0                 movem.l    (a7)+, d6-d7/a3-a4
3568: 4e5e                     unlk       a6
356a: 205f                     movea.l    (a7)+, a0
356c: 504f                     addq.w     #$8, a7
356e: 4ed0                     jmp        (a0)
3570: 00004e56                 ori.b      #$56, d0
3574: fdee                     dc.w       $fdee
3576: 2f0c                     move.l     a4, -(a7)
3578: 422e0012                 clr.b      $12(a6)
357c: 206e000a                 movea.l    $a(a6), a0
3580: 2050                     movea.l    (a0), a0
3582: 3d680114ffee             move.w     $114(a0), -$12(a6)
3588: 206e000a                 movea.l    $a(a6), a0
358c: 2050                     movea.l    (a0), a0
358e: 3f3c00ff                 move.w     #$ff, -(a7)
3592: 48680014                 pea.l      $14(a0)
3596: 486efeee                 pea.l      -$112(a6)
359a: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
359e: 4a2e0008                 tst.b      $8(a6)
35a2: 6752                     beq.b      $35f6
35a4: 4a2efeee                 tst.b      -$112(a6)
35a8: 6610                     bne.b      $35ba
35aa: 2f2e000e                 move.l     $e(a6), -(a7)
35ae: 486efeee                 pea.l      -$112(a6)
35b2: a919                     dc.w       $a919
35b4: 6004                     bra.b      $35ba
35b6: 4ebacb2c                 jsr        $e4(pc)
35ba: 554f                     subq.w     #$2, a7
35bc: 3f3c0040                 move.w     #$40, -(a7)
35c0: 486dbdca                 pea.l      -$4236(a5)
35c4: a970                     dc.w       $a970
35c6: 4a1f                     tst.b      (a7)+
35c8: 66ec                     bne.b      $35b6
35ca: 486efdee                 pea.l      -$212(a6)
35ce: 1f3c0001                 move.b     #$1, -(a7)
35d2: 486efeee                 pea.l      -$112(a6)
35d6: 2f3c54455854             move.l     #$54455854, -(a7)
35dc: 486effee                 pea.l      -$12(a6)
35e0: 4ebaf5c0                 jsr        $2ba2(pc)
35e4: 584f                     addq.w     #$4, a7
35e6: 3f3c00ff                 move.w     #$ff, -(a7)
35ea: 486efdee                 pea.l      -$212(a6)
35ee: 486efeee                 pea.l      -$112(a6)
35f2: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
35f6: 4a2efeee                 tst.b      -$112(a6)
35fa: 6774                     beq.b      $3670
35fc: 206dbdc6                 movea.l    -$423a(a5), a0
3600: 2f10                     move.l     (a0), -(a7)
3602: a851                     dc.w       $a851
3604: 206e000a                 movea.l    $a(a6), a0
3608: 2850                     movea.l    (a0), a4
360a: 554f                     subq.w     #$2, a7
360c: 486efeee                 pea.l      -$112(a6)
3610: 3f2effee                 move.w     -$12(a6), -(a7)
3614: 2f2c0002                 move.l     $2(a4), -(a7)
3618: 4ebafa84                 jsr        $309e(pc)
361c: 4a1f                     tst.b      (a7)+
361e: 6746                     beq.b      $3666
3620: 1d7c00010012             move.b     #$1, $12(a6)
3626: 422c000a                 clr.b      $a(a4)
362a: 3f3c00ff                 move.w     #$ff, -(a7)
362e: 486efeee                 pea.l      -$112(a6)
3632: 486c0014                 pea.l      $14(a4)
3636: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
363a: 396effee0114             move.w     -$12(a6), $114(a4)
3640: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
3644: 3f3c0005                 move.w     #$5, -(a7)
3648: a93a                     dc.w       $a93a
364a: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
364e: 3f3c0007                 move.w     #$7, -(a7)
3652: a93a                     dc.w       $a93a
3654: 4a2e0008                 tst.b      $8(a6)
3658: 670c                     beq.b      $3666
365a: 2f2e000e                 move.l     $e(a6), -(a7)
365e: 486efeee                 pea.l      -$112(a6)
3662: 4ebafcd8                 jsr        $333c(pc)
3666: a850                     dc.w       $a850
3668: 422dbdb8                 clr.b      -$4248(a5)
366c: 4ebacee0                 jsr        $54e(pc)
3670: 285f                     movea.l    (a7)+, a4
3672: 4e5e                     unlk       a6
3674: 205f                     movea.l    (a7)+, a0
3676: 4fef000a                 lea.l      $a(a7), a7
367a: 4ed0                     jmp        (a0)
367c: 4e56feea                 link.w     a6, #$feea
3680: 48e70308                 movem.l    d6-d7/a4, -(a7)
3684: 286e000a                 movea.l    $a(a6), a4
3688: 2c2e000e                 move.l     $e(a6), d6
368c: 1d7c00010012             move.b     #$1, $12(a6)
3692: 200c                     move.l     a4, d0
3694: 67000090                 beq.w      $3726
3698: 2054                     movea.l    (a4), a0
369a: 4a10                     tst.b      (a0)
369c: 66000088                 bne.w      $3726
36a0: 2054                     movea.l    (a4), a0
36a2: 4a28000a                 tst.b      $a(a0)
36a6: 6700007e                 beq.w      $3726
36aa: a850                     dc.w       $a850
36ac: 6004                     bra.b      $36b2
36ae: 4ebaca34                 jsr        $e4(pc)
36b2: 554f                     subq.w     #$2, a7
36b4: 3f3c0040                 move.w     #$40, -(a7)
36b8: 486dbdca                 pea.l      -$4236(a5)
36bc: a970                     dc.w       $a970
36be: 4a1f                     tst.b      (a7)+
36c0: 66ec                     bne.b      $36ae
36c2: 486efeea                 pea.l      -$116(a6)
36c6: a874                     dc.w       $a874
36c8: 2f06                     move.l     d6, -(a7)
36ca: 486efef0                 pea.l      -$110(a6)
36ce: a919                     dc.w       $a919
36d0: 486efef0                 pea.l      -$110(a6)
36d4: 487a0062                 pea.l      $3738(pc)
36d8: 487a005c                 pea.l      $3736(pc)
36dc: 487a0056                 pea.l      $3734(pc)
36e0: a98b                     dc.w       $a98b
36e2: 554f                     subq.w     #$2, a7
36e4: 3f2e0008                 move.w     $8(a6), -(a7)
36e8: 42a7                     clr.l      -(a7)
36ea: a985                     dc.w       $a985
36ec: 3e1f                     move.w     (a7)+, d7
36ee: 2f2efeea                 move.l     -$116(a6), -(a7)
36f2: a873                     dc.w       $a873
36f4: 422dbdb8                 clr.b      -$4248(a5)
36f8: 3007                     move.w     d7, d0
36fa: 6022                     bra.b      $371e
36fc: 554f                     subq.w     #$2, a7
36fe: 2f06                     move.l     d6, -(a7)
3700: 2f0c                     move.l     a4, -(a7)
3702: 2054                     movea.l    (a4), a0
3704: 4a280014                 tst.b      $14(a0)
3708: 57c0                     seq.b      d0
370a: 4400                     neg.b      d0
370c: 1f00                     move.b     d0, -(a7)
370e: 4ebafe62                 jsr        $3572(pc)
3712: 1d5f0012                 move.b     (a7)+, $12(a6)
3716: 600e                     bra.b      $3726
3718: 422e0012                 clr.b      $12(a6)
371c: 6008                     bra.b      $3726
371e: 5340                     subq.w     #$1, d0
3720: 67da                     beq.b      $36fc
3722: 5540                     subq.w     #$2, d0
3724: 67f2                     beq.b      $3718
3726: 4cdf10c0                 movem.l    (a7)+, d6-d7/a4
372a: 4e5e                     unlk       a6
372c: 205f                     movea.l    (a7)+, a0
372e: 4fef000a                 lea.l      $a(a7), a7
3732: 4ed0                     jmp        (a0)
3734: 00000000                 ori.b      #$0, d0
3738: 00004e56                 ori.b      #$56, d0
373c: ffe6                     dc.w       $ffe6
373e: 48e70118                 movem.l    d7/a3-a4, -(a7)
3742: 4207                     clr.b      d7
3744: 594f                     subq.w     #$4, a7
3746: a924                     dc.w       $a924
3748: 201f                     move.l     (a7)+, d0
374a: b0adbe2a                 cmp.l      -$41d6(a5), d0
374e: 6720                     beq.b      $3770
3750: 594f                     subq.w     #$4, a7
3752: a924                     dc.w       $a924
3754: 285f                     movea.l    (a7)+, a4
3756: 4a6c006c                 tst.w      $6c(a4)
375a: 6c0c                     bge.b      $3768
375c: 3f2c006c                 move.w     $6c(a4), -(a7)
3760: a9b7                     dc.w       $a9b7
3762: 7e01                     moveq      #$1, d7
3764: 600000a2                 bra.w      $3808
3768: 2f0c                     move.l     a4, -(a7)
376a: a916                     dc.w       $a916
376c: 6000009a                 bra.w      $3808
3770: 102dbdb6                 move.b     -$424a(a5), d0
3774: 5300                     subq.b     #$1, d0
3776: 6712                     beq.b      $378a
3778: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
377c: a916                     dc.w       $a916
377e: 42adbe2a                 clr.l      -$41d6(a5)
3782: 42adc030                 clr.l      -$3fd0(a5)
3786: 60000080                 bra.w      $3808
378a: 554f                     subq.w     #$2, a7
378c: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
3790: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
3794: 3f3c0082                 move.w     #$82, -(a7)
3798: 4ebafee2                 jsr        $367c(pc)
379c: 4a1f                     tst.b      (a7)+
379e: 6768                     beq.b      $3808
37a0: 206dbdc6                 movea.l    -$423a(a5), a0
37a4: 2f10                     move.l     (a0), -(a7)
37a6: a851                     dc.w       $a851
37a8: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
37ac: 4ebafb06                 jsr        $32b4(pc)
37b0: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
37b4: 4ebae674                 jsr        $1e2a(pc)
37b8: 42adbe2a                 clr.l      -$41d6(a5)
37bc: 42adc030                 clr.l      -$3fd0(a5)
37c0: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
37c4: 3f3c0001                 move.w     #$1, -(a7)
37c8: a939                     dc.w       $a939
37ca: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
37ce: 3f3c0002                 move.w     #$2, -(a7)
37d2: a939                     dc.w       $a939
37d4: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
37d8: 3f3c0004                 move.w     #$4, -(a7)
37dc: a93a                     dc.w       $a93a
37de: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
37e2: 3f3c0005                 move.w     #$5, -(a7)
37e6: a93a                     dc.w       $a93a
37e8: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
37ec: 3f3c0006                 move.w     #$6, -(a7)
37f0: a93a                     dc.w       $a93a
37f2: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
37f6: 3f3c000a                 move.w     #$a, -(a7)
37fa: a93a                     dc.w       $a93a
37fc: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
3800: 3f3c0007                 move.w     #$7, -(a7)
3804: a93a                     dc.w       $a93a
3806: a850                     dc.w       $a850
3808: 0c6d0002bdf0             cmpi.w     #$2, -$4210(a5)
380e: 6c38                     bge.b      $3848
3810: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
3814: 3f3c0001                 move.w     #$1, -(a7)
3818: a93a                     dc.w       $a93a
381a: 0c6d0002bdf2             cmpi.w     #$2, -$420e(a5)
3820: 6c14                     bge.b      $3836
3822: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
3826: 3f3c0001                 move.w     #$1, -(a7)
382a: a93a                     dc.w       $a93a
382c: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
3830: 3f3c0002                 move.w     #$2, -(a7)
3834: a93a                     dc.w       $a93a
3836: 4a6dbdf0                 tst.w      -$4210(a5)
383a: 660c                     bne.b      $3848
383c: 2f2dbe32                 move.l     -$41ce(a5), -(a7)
3840: a916                     dc.w       $a916
3842: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
3846: a916                     dc.w       $a916
3848: 594f                     subq.w     #$4, a7
384a: a924                     dc.w       $a924
384c: 4a9f                     tst.l      (a7)+
384e: 57c0                     seq.b      d0
3850: 4400                     neg.b      d0
3852: 8007                     or.b       d7, d0
3854: 674c                     beq.b      $38a2
3856: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
385a: 4267                     clr.w      -(a7)
385c: a93a                     dc.w       $a93a
385e: 2f2dbe02                 move.l     -$41fe(a5), -(a7)
3862: 4267                     clr.w      -(a7)
3864: a93a                     dc.w       $a93a
3866: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
386a: 4267                     clr.w      -(a7)
386c: a93a                     dc.w       $a93a
386e: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
3872: 4267                     clr.w      -(a7)
3874: a93a                     dc.w       $a93a
3876: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
387a: 3f3c000c                 move.w     #$c, -(a7)
387e: a93a                     dc.w       $a93a
3880: 594f                     subq.w     #$4, a7
3882: a924                     dc.w       $a924
3884: 4a9f                     tst.l      (a7)+
3886: 6616                     bne.b      $389e
3888: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
388c: 4267                     clr.w      -(a7)
388e: 0c6d0002bdf0             cmpi.w     #$2, -$4210(a5)
3894: 5cc0                     sge.b      d0
3896: 4400                     neg.b      d0
3898: 1f00                     move.b     d0, -(a7)
389a: 4ebac8b0                 jsr        $14c(pc)
389e: a937                     dc.w       $a937
38a0: 6052                     bra.b      $38f4
38a2: 594f                     subq.w     #$4, a7
38a4: a924                     dc.w       $a924
38a6: 285f                     movea.l    (a7)+, a4
38a8: 200c                     move.l     a4, d0
38aa: 6748                     beq.b      $38f4
38ac: 4a6c006c                 tst.w      $6c(a4)
38b0: 6c42                     bge.b      $38f4
38b2: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
38b6: 4267                     clr.w      -(a7)
38b8: a939                     dc.w       $a939
38ba: 2f2dbe02                 move.l     -$41fe(a5), -(a7)
38be: 4267                     clr.w      -(a7)
38c0: a93a                     dc.w       $a93a
38c2: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
38c6: 4267                     clr.w      -(a7)
38c8: a93a                     dc.w       $a93a
38ca: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
38ce: 4267                     clr.w      -(a7)
38d0: a93a                     dc.w       $a93a
38d2: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
38d6: 3f3c0007                 move.w     #$7, -(a7)
38da: a93a                     dc.w       $a93a
38dc: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
38e0: 4267                     clr.w      -(a7)
38e2: 0c6d0002bdf0             cmpi.w     #$2, -$4210(a5)
38e8: 5cc0                     sge.b      d0
38ea: 4400                     neg.b      d0
38ec: 1f00                     move.b     d0, -(a7)
38ee: 4ebac85c                 jsr        $14c(pc)
38f2: a937                     dc.w       $a937
38f4: 4cdf1880                 movem.l    (a7)+, d7/a3-a4
38f8: 4e5e                     unlk       a6
38fa: 4e75                     rts        
38fc: 4e56ffea                 link.w     a6, #$ffea
3900: 48e70118                 movem.l    d7/a3-a4, -(a7)
3904: 266e0008                 movea.l    $8(a6), a3
3908: a850                     dc.w       $a850
390a: 6004                     bra.b      $3910
390c: 4ebac7d6                 jsr        $e4(pc)
3910: 554f                     subq.w     #$2, a7
3912: 3f3c0040                 move.w     #$40, -(a7)
3916: 486dbdca                 pea.l      -$4236(a5)
391a: a970                     dc.w       $a970
391c: 4a1f                     tst.b      (a7)+
391e: 66ec                     bne.b      $390c
3920: 2f0b                     move.l     a3, -(a7)
3922: 205f                     movea.l    (a7)+, a0
3924: a029                     dc.w       $a029
3926: 2853                     movea.l    (a3), a4
3928: 486effec                 pea.l      -$14(a6)
392c: a874                     dc.w       $a874
392e: 486c0014                 pea.l      $14(a4)
3932: 487a00d2                 pea.l      $3a06(pc)
3936: 487a00cc                 pea.l      $3a04(pc)
393a: 487a00c6                 pea.l      $3a02(pc)
393e: a98b                     dc.w       $a98b
3940: 554f                     subq.w     #$2, a7
3942: 3f3c008a                 move.w     #$8a, -(a7)
3946: 42a7                     clr.l      -(a7)
3948: a985                     dc.w       $a985
394a: 3e1f                     move.w     (a7)+, d7
394c: 2f2effec                 move.l     -$14(a6), -(a7)
3950: a873                     dc.w       $a873
3952: 0c470001                 cmpi.w     #$1, d7
3956: 66000098                 bne.w      $39f0
395a: 554f                     subq.w     #$2, a7
395c: 486c0014                 pea.l      $14(a4)
3960: 3f2c0114                 move.w     $114(a4), -(a7)
3964: 4ebaf5a6                 jsr        $2f0c(pc)
3968: 4a1f                     tst.b      (a7)+
396a: 67000084                 beq.w      $39f0
396e: 206dbdc6                 movea.l    -$423a(a5), a0
3972: 2f10                     move.l     (a0), -(a7)
3974: a851                     dc.w       $a851
3976: 2f2c0002                 move.l     $2(a4), -(a7)
397a: a9d9                     dc.w       $a9d9
397c: 206c0002                 movea.l    $2(a4), a0
3980: 2050                     movea.l    (a0), a0
3982: 2f28003e                 move.l     $3e(a0), -(a7)
3986: 205f                     movea.l    (a7)+, a0
3988: a023                     dc.w       $a023
398a: 206c0002                 movea.l    $2(a4), a0
398e: 2050                     movea.l    (a0), a0
3990: 216dbdde003e             move.l     -$4222(a5), $3e(a0)
3996: 594f                     subq.w     #$4, a7
3998: 2f2dbdde                 move.l     -$4222(a5), -(a7)
399c: 4ead0162                 jsr        $162(a5) ; CODE 1 resource+0x0544
39a0: 206c0002                 movea.l    $2(a4), a0
39a4: 2050                     movea.l    (a0), a0
39a6: 544f                     addq.w     #$2, a7
39a8: 315f003c                 move.w     (a7)+, $3c(a0)
39ac: 2f2c0002                 move.l     $2(a4), -(a7)
39b0: a9d0                     dc.w       $a9d0
39b2: 2f0b                     move.l     a3, -(a7)
39b4: 4ebade66                 jsr        $181c(pc)
39b8: 42a7                     clr.l      -(a7)
39ba: 42a7                     clr.l      -(a7)
39bc: 2f2c0002                 move.l     $2(a4), -(a7)
39c0: a9d1                     dc.w       $a9d1
39c2: 206e000c                 movea.l    $c(a6), a0
39c6: 48680010                 pea.l      $10(a0)
39ca: a928                     dc.w       $a928
39cc: 2f0b                     move.l     a3, -(a7)
39ce: 4ebae0f4                 jsr        $1ac4(pc)
39d2: 422c000a                 clr.b      $a(a4)
39d6: 422c011a                 clr.b      $11a(a4)
39da: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
39de: 3f3c0005                 move.w     #$5, -(a7)
39e2: a93a                     dc.w       $a93a
39e4: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
39e8: 3f3c0007                 move.w     #$7, -(a7)
39ec: a93a                     dc.w       $a93a
39ee: a850                     dc.w       $a850
39f0: 2f0b                     move.l     a3, -(a7)
39f2: 205f                     movea.l    (a7)+, a0
39f4: a02a                     dc.w       $a02a
39f6: 4cdf1880                 movem.l    (a7)+, d7/a3-a4
39fa: 4e5e                     unlk       a6
39fc: 205f                     movea.l    (a7)+, a0
39fe: 504f                     addq.w     #$8, a7
3a00: 4ed0                     jmp        (a0)
3a02: 00000000                 ori.b      #$0, d0
3a06: 00004e56                 ori.b      #$56, d0
3a0a: ffe4                     dc.w       $ffe4
3a0c: 48e70308                 movem.l    d6-d7/a4, -(a7)
3a10: 7c01                     moveq      #$1, d6
3a12: 7e01                     moveq      #$1, d7
3a14: 6042                     bra.b      $3a58
3a16: 3007                     move.w     d7, d0
3a18: c1fc00a6                 muls.w     #$a6, d0
3a1c: 0640bf96                 addi.w     #$bf96, d0
3a20: 4a350000                 tst.b      (a5, d0.w)
3a24: 6730                     beq.b      $3a56
3a26: 594f                     subq.w     #$4, a7
3a28: 3007                     move.w     d7, d0
3a2a: c1fc00a6                 muls.w     #$a6, d0
3a2e: 0640bf98                 addi.w     #$bf98, d0
3a32: 48750000                 pea.l      (a5, d0.w)
3a36: a917                     dc.w       $a917
3a38: 285f                     movea.l    (a7)+, a4
3a3a: 554f                     subq.w     #$2, a7
3a3c: 3c07                     move.w     d7, d6
3a3e: cdfc00a6                 muls.w     #$a6, d6
3a42: 41edbf98                 lea.l      -$4068(a5), a0
3a46: 48706000                 pea.l      (a0, d6.w)
3a4a: 2f0c                     move.l     a4, -(a7)
3a4c: 3f2e0008                 move.w     $8(a6), -(a7)
3a50: 4ebafc2a                 jsr        $367c(pc)
3a54: 1c1f                     move.b     (a7)+, d6
3a56: 5247                     addq.w     #$1, d7
3a58: 0c470005                 cmpi.w     #$5, d7
3a5c: 5fc0                     sle.b      d0
3a5e: c006                     and.b      d6, d0
3a60: 66b4                     bne.b      $3a16
3a62: 1b46bdb5                 move.b     d6, -$424b(a5)
3a66: 4cdf10c0                 movem.l    (a7)+, d6-d7/a4
3a6a: 4e5e                     unlk       a6
3a6c: 205f                     movea.l    (a7)+, a0
3a6e: 544f                     addq.w     #$2, a7
3a70: 4ed0                     jmp        (a0)
3a72: 4e560000                 link.w     a6, #$0
3a76: 4aadbde2                 tst.l      -$421e(a5)
3a7a: 670c                     beq.b      $3a88
3a7c: 2f2dbde2                 move.l     -$421e(a5), -(a7)
3a80: 205f                     movea.l    (a7)+, a0
3a82: a023                     dc.w       $a023
3a84: 42adbde2                 clr.l      -$421e(a5)
3a88: 4e5e                     unlk       a6
3a8a: 2e9f                     move.l     (a7)+, (a7)
3a8c: 4e75                     rts        
3a8e: 554f                     subq.w     #$2, a7
3a90: 4ead0232                 jsr        $232(a5) ; CODE 1 resource+0x099e
3a94: 4a5f                     tst.w      (a7)+
3a96: 4e75                     rts        
3a98: 4e56ffec                 link.w     a6, #$ffec
3a9c: 2f07                     move.l     d7, -(a7)
3a9e: 594f                     subq.w     #$4, a7
3aa0: a9fc                     dc.w       $a9fc
3aa2: 2e1f                     move.l     (a7)+, d7
3aa4: 554f                     subq.w     #$2, a7
3aa6: 4ead023a                 jsr        $23a(a5) ; CODE 1 resource+0x09f4
3aaa: 3e1f                     move.w     (a7)+, d7
3aac: 48c7                     ext.l      d7
3aae: 2e1f                     move.l     (a7)+, d7
3ab0: 4e5e                     unlk       a6
3ab2: 4e75                     rts        
3ab4: 4e56ffea                 link.w     a6, #$ffea
3ab8: 48e70108                 movem.l    d7/a4, -(a7)
3abc: 594f                     subq.w     #$4, a7
3abe: a924                     dc.w       $a924
3ac0: 285f                     movea.l    (a7)+, a4
3ac2: 200c                     move.l     a4, d0
3ac4: 57c0                     seq.b      d0
3ac6: 4aadbe2a                 tst.l      -$41d6(a5)
3aca: 57c1                     seq.b      d1
3acc: 8001                     or.b       d1, d0
3ace: 670000b0                 beq.w      $3b80
3ad2: 200c                     move.l     a4, d0
3ad4: 6604                     bne.b      $3ada
3ad6: 4207                     clr.b      d7
3ad8: 6008                     bra.b      $3ae2
3ada: 4a6c006c                 tst.w      $6c(a4)
3ade: 5dc7                     slt.b      d7
3ae0: 4407                     neg.b      d7
3ae2: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
3ae6: 3f3c0004                 move.w     #$4, -(a7)
3aea: 1f07                     move.b     d7, -(a7)
3aec: 4ebac65e                 jsr        $14c(pc)
3af0: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
3af4: 3f3c0005                 move.w     #$5, -(a7)
3af8: a93a                     dc.w       $a93a
3afa: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
3afe: 3f3c0006                 move.w     #$6, -(a7)
3b02: a93a                     dc.w       $a93a
3b04: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
3b08: 3f3c0007                 move.w     #$7, -(a7)
3b0c: a93a                     dc.w       $a93a
3b0e: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
3b12: 3f3c000a                 move.w     #$a, -(a7)
3b16: a93a                     dc.w       $a93a
3b18: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
3b1c: 3f3c0001                 move.w     #$1, -(a7)
3b20: 1f07                     move.b     d7, -(a7)
3b22: 4ebac628                 jsr        $14c(pc)
3b26: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
3b2a: 3f3c0003                 move.w     #$3, -(a7)
3b2e: 1f07                     move.b     d7, -(a7)
3b30: 4ebac61a                 jsr        $14c(pc)
3b34: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
3b38: 3f3c0004                 move.w     #$4, -(a7)
3b3c: 1f07                     move.b     d7, -(a7)
3b3e: 4ebac60c                 jsr        $14c(pc)
3b42: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
3b46: 3f3c0005                 move.w     #$5, -(a7)
3b4a: 1f07                     move.b     d7, -(a7)
3b4c: 4ebac5fe                 jsr        $14c(pc)
3b50: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
3b54: 3f3c0006                 move.w     #$6, -(a7)
3b58: 1f07                     move.b     d7, -(a7)
3b5a: 4ebac5f0                 jsr        $14c(pc)
3b5e: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
3b62: 3f3c0007                 move.w     #$7, -(a7)
3b66: a93a                     dc.w       $a93a
3b68: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
3b6c: 3f3c000c                 move.w     #$c, -(a7)
3b70: 4aadbe2a                 tst.l      -$41d6(a5)
3b74: 56c0                     sne.b      d0
3b76: 4400                     neg.b      d0
3b78: 8007                     or.b       d7, d0
3b7a: 1f00                     move.b     d0, -(a7)
3b7c: 4ebac5ce                 jsr        $14c(pc)
3b80: 4cdf1080                 movem.l    (a7)+, d7/a4
3b84: 4e5e                     unlk       a6
3b86: 4e75                     rts        
3b88: 4e56ffe0                 link.w     a6, #$ffe0
3b8c: 48e70338                 movem.l    d6-d7/a2-a4, -(a7)
3b90: 1c2e0008                 move.b     $8(a6), d6
3b94: 594f                     subq.w     #$4, a7
3b96: a9f9                     dc.w       $a9f9
3b98: 245f                     movea.l    (a7)+, a2
3b9a: 302dbdf4                 move.w     -$420c(a5), d0
3b9e: b06a0008                 cmp.w      $8(a2), d0
3ba2: 56c0                     sne.b      d0
3ba4: 4400                     neg.b      d0
3ba6: 8006                     or.b       d6, d0
3ba8: 6766                     beq.b      $3c10
3baa: 3b6a0008bdf4             move.w     $8(a2), -$420c(a5)
3bb0: 4ebafedc                 jsr        $3a8e(pc)
3bb4: 2e2dbe2e                 move.l     -$41d2(a5), d7
3bb8: 2047                     movea.l    d7, a0
3bba: 1006                     move.b     d6, d0
3bbc: 8028006e                 or.b       $6e(a0), d0
3bc0: 674e                     beq.b      $3c10
3bc2: 486effec                 pea.l      -$14(a6)
3bc6: a874                     dc.w       $a874
3bc8: 2f2dbe2e                 move.l     -$41d2(a5), -(a7)
3bcc: a873                     dc.w       $a873
3bce: 594f                     subq.w     #$4, a7
3bd0: 2f2dbe2e                 move.l     -$41d2(a5), -(a7)
3bd4: a917                     dc.w       $a917
3bd6: 265f                     movea.l    (a7)+, a3
3bd8: 2f0b                     move.l     a3, -(a7)
3bda: 205f                     movea.l    (a7)+, a0
3bdc: a029                     dc.w       $a029
3bde: 2853                     movea.l    (a3), a4
3be0: 594f                     subq.w     #$4, a7
3be2: 4ead022a                 jsr        $22a(a5) ; CODE 1 resource+0x0992
3be6: 206c0002                 movea.l    $2(a4), a0
3bea: 2050                     movea.l    (a0), a0
3bec: 544f                     addq.w     #$2, a7
3bee: 315f003c                 move.w     (a7)+, $3c(a0)
3bf2: 2f2c0002                 move.l     $2(a4), -(a7)
3bf6: a9d0                     dc.w       $a9d0
3bf8: 206c0002                 movea.l    $2(a4), a0
3bfc: 2050                     movea.l    (a0), a0
3bfe: 48680008                 pea.l      $8(a0)
3c02: a928                     dc.w       $a928
3c04: 2f0b                     move.l     a3, -(a7)
3c06: 205f                     movea.l    (a7)+, a0
3c08: a02a                     dc.w       $a02a
3c0a: 2f2effec                 move.l     -$14(a6), -(a7)
3c0e: a873                     dc.w       $a873
3c10: 4cdf1cc0                 movem.l    (a7)+, d6-d7/a2-a4
3c14: 4e5e                     unlk       a6
3c16: 205f                     movea.l    (a7)+, a0
3c18: 544f                     addq.w     #$2, a7
3c1a: 4ed0                     jmp        (a0)
3c1c: 4e56ffe6                 link.w     a6, #$ffe6
3c20: 48e70118                 movem.l    d7/a3-a4, -(a7)
3c24: 594f                     subq.w     #$4, a7
3c26: a924                     dc.w       $a924
3c28: 285f                     movea.l    (a7)+, a4
3c2a: 4207                     clr.b      d7
3c2c: 6012                     bra.b      $3c40
3c2e: 266c0098                 movea.l    $98(a4), a3
3c32: 2053                     movea.l    (a3), a0
3c34: 4a10                     tst.b      (a0)
3c36: 6604                     bne.b      $3c3c
3c38: 7e01                     moveq      #$1, d7
3c3a: 6004                     bra.b      $3c40
3c3c: 286c0090                 movea.l    $90(a4), a4
3c40: 200c                     move.l     a4, d0
3c42: 56c0                     sne.b      d0
3c44: 1207                     move.b     d7, d1
3c46: 5301                     subq.b     #$1, d1
3c48: c001                     and.b      d1, d0
3c4a: 66e2                     bne.b      $3c2e
3c4c: 4a07                     tst.b      d7
3c4e: 6706                     beq.b      $3c56
3c50: 2d4b0008                 move.l     a3, $8(a6)
3c54: 6004                     bra.b      $3c5a
3c56: 42ae0008                 clr.l      $8(a6)
3c5a: 4cdf1880                 movem.l    (a7)+, d7/a3-a4
3c5e: 4e5e                     unlk       a6
3c60: 4e75                     rts        
3c62: 4e560000                 link.w     a6, #$0
3c66: 3f2e0008                 move.w     $8(a6), -(a7)
3c6a: 487a0024                 pea.l      $3c90(pc)
3c6e: 4ead0132                 jsr        $132(a5) ; CODE 1 resource+0x03a2
3c72: 670e                     beq.b      $3c82
3c74: 302e0008                 move.w     $8(a6), d0
3c78: 0640ffe0                 addi.w     #$ffe0, d0
3c7c: 3d40000a                 move.w     d0, $a(a6)
3c80: 6006                     bra.b      $3c88
3c82: 3d6e0008000a             move.w     $8(a6), $a(a6)
3c88: 4e5e                     unlk       a6
3c8a: 205f                     movea.l    (a7)+, a0
3c8c: 544f                     addq.w     #$2, a7
3c8e: 4ed0                     jmp        (a0)
3c90: 00000000                 ori.b      #$0, d0
3c94: 00000000                 ori.b      #$0, d0
3c98: 00000000                 ori.b      #$0, d0
3c9c: 00000000                 ori.b      #$0, d0
3ca0: 07ff                     .byte      0x07, 0xff
3ca2: fffe                     dc.w       $fffe
3ca4: 00000000                 ori.b      #$0, d0
3ca8: 00000000                 ori.b      #$0, d0
3cac: 00000000                 ori.b      #$0, d0
3cb0: 4e56feec                 link.w     a6, #$feec
3cb4: 2f07                     move.l     d7, -(a7)
3cb6: 206e0008                 movea.l    $8(a6), a0
3cba: 43eefef0                 lea.l      -$110(a6), a1
3cbe: 703f                     moveq      #$3f, d0
3cc0: 22d8                     move.l     (a0)+, (a1)+
3cc2: 51c8fffc                 dbra       d0, $3cc0
3cc6: 7000                     moveq      #$0, d0
3cc8: 102efef0                 move.b     -$110(a6), d0
3ccc: 3d40feec                 move.w     d0, -$114(a6)
3cd0: 7e01                     moveq      #$1, d7
3cd2: 6020                     bra.b      $3cf4
3cd4: 554f                     subq.w     #$2, a7
3cd6: 7000                     moveq      #$0, d0
3cd8: 41eefef0                 lea.l      -$110(a6), a0
3cdc: 10307000                 move.b     (a0, d7.w), d0
3ce0: 3f00                     move.w     d0, -(a7)
3ce2: 4ebaff7e                 jsr        $3c62(pc)
3ce6: 301f                     move.w     (a7)+, d0
3ce8: 41eefef0                 lea.l      -$110(a6), a0
3cec: 11807000                 move.b     d0, (a0, d7.w)
3cf0: 5247                     addq.w     #$1, d7
3cf2: 6906                     bvs.b      $3cfa
3cf4: be6efeec                 cmp.w      -$114(a6), d7
3cf8: 6fda                     ble.b      $3cd4
3cfa: 206e000c                 movea.l    $c(a6), a0
3cfe: 3f3c00ff                 move.w     #$ff, -(a7)
3d02: 486efef0                 pea.l      -$110(a6)
3d06: 2f08                     move.l     a0, -(a7)
3d08: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
3d0c: 2e1f                     move.l     (a7)+, d7
3d0e: 4e5e                     unlk       a6
3d10: 2e9f                     move.l     (a7)+, (a7)
3d12: 4e75                     rts        
3d14: 4e56fdda                 link.w     a6, #$fdda
3d18: 48e71f38                 movem.l    d3-d7/a2-a4, -(a7)
3d1c: 266e000a                 movea.l    $a(a6), a3
3d20: 4a2e0008                 tst.b      $8(a6)
3d24: 6708                     beq.b      $3d2e
3d26: 206dbdc6                 movea.l    -$423a(a5), a0
3d2a: 2f10                     move.l     (a0), -(a7)
3d2c: a851                     dc.w       $a851
3d2e: 200b                     move.l     a3, d0
3d30: 670001bc                 beq.w      $3eee
3d34: 2f0b                     move.l     a3, -(a7)
3d36: 205f                     movea.l    (a7)+, a0
3d38: a029                     dc.w       $a029
3d3a: 2853                     movea.l    (a3), a4
3d3c: 206c0002                 movea.l    $2(a4), a0
3d40: 2050                     movea.l    (a0), a0
3d42: 2f28003e                 move.l     $3e(a0), -(a7)
3d46: 205f                     movea.l    (a7)+, a0
3d48: a029                     dc.w       $a029
3d4a: 4206                     clr.b      d6
3d4c: 486efdda                 pea.l      -$226(a6)
3d50: 206dc02a                 movea.l    -$3fd6(a5), a0
3d54: 2050                     movea.l    (a0), a0
3d56: 48680002                 pea.l      $2(a0)
3d5a: 4ebaff54                 jsr        $3cb0(pc)
3d5e: 584f                     addq.w     #$4, a7
3d60: 3f3c00ff                 move.w     #$ff, -(a7)
3d64: 486efdda                 pea.l      -$226(a6)
3d68: 486efee6                 pea.l      -$11a(a6)
3d6c: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
3d70: 7000                     moveq      #$0, d0
3d72: 102efee6                 move.b     -$11a(a6), d0
3d76: 3d40ffe8                 move.w     d0, -$18(a6)
3d7a: 206c0002                 movea.l    $2(a4), a0
3d7e: 2050                     movea.l    (a0), a0
3d80: 2d68003efede             move.l     $3e(a0), -$122(a6)
3d86: 206efede                 movea.l    -$122(a6), a0
3d8a: 2450                     movea.l    (a0), a2
3d8c: 206c0002                 movea.l    $2(a4), a0
3d90: 2050                     movea.l    (a0), a0
3d92: 3d68003cffe6             move.w     $3c(a0), -$1a(a6)
3d98: 206dc02a                 movea.l    -$3fd6(a5), a0
3d9c: 2050                     movea.l    (a0), a0
3d9e: 4a280203                 tst.b      $203(a0)
3da2: 6710                     beq.b      $3db4
3da4: 206c0002                 movea.l    $2(a4), a0
3da8: 2050                     movea.l    (a0), a0
3daa: 3e280020                 move.w     $20(a0), d7
3dae: 5247                     addq.w     #$1, d7
3db0: 60000118                 bra.w      $3eca
3db4: 206c0002                 movea.l    $2(a4), a0
3db8: 2050                     movea.l    (a0), a0
3dba: 3e280020                 move.w     $20(a0), d7
3dbe: 6000010a                 bra.w      $3eca
3dc2: 3007                     move.w     d7, d0
3dc4: 48c0                     ext.l      d0
3dc6: 81fc00fa                 divs.w     #$fa, d0
3dca: 4840                     swap       d0
3dcc: 4a40                     tst.w      d0
3dce: 6602                     bne.b      $3dd2
3dd0: a9b4                     dc.w       $a9b4
3dd2: 554f                     subq.w     #$2, a7
3dd4: 7000                     moveq      #$0, d0
3dd6: 10327000                 move.b     (a2, d7.w), d0
3dda: 3f00                     move.w     d0, -(a7)
3ddc: 4ebafe84                 jsr        $3c62(pc)
3de0: 7000                     moveq      #$0, d0
3de2: 102efee7                 move.b     -$119(a6), d0
3de6: b05f                     cmp.w      (a7)+, d0
3de8: 660000de                 bne.w      $3ec8
3dec: 206dc02a                 movea.l    -$3fd6(a5), a0
3df0: 2050                     movea.l    (a0), a0
3df2: 10280202                 move.b     $202(a0), d0
3df6: 5300                     subq.b     #$1, d0
3df8: 6704                     beq.b      $3dfe
3dfa: 7801                     moveq      #$1, d4
3dfc: 6026                     bra.b      $3e24
3dfe: 0c470001                 cmpi.w     #$1, d7
3e02: 6e04                     bgt.b      $3e08
3e04: 7801                     moveq      #$1, d4
3e06: 601c                     bra.b      $3e24
3e08: 3007                     move.w     d7, d0
3e0a: 5340                     subq.w     #$1, d0
3e0c: 7200                     moveq      #$0, d1
3e0e: 12320000                 move.b     (a2, d0.w), d1
3e12: 3f01                     move.w     d1, -(a7)
3e14: 487a019a                 pea.l      $3fb0(pc)
3e18: 4ead0132                 jsr        $132(a5) ; CODE 1 resource+0x03a2
3e1c: 6604                     bne.b      $3e22
3e1e: 7801                     moveq      #$1, d4
3e20: 6002                     bra.b      $3e24
3e22: 4204                     clr.b      d4
3e24: 4a04                     tst.b      d4
3e26: 6700009c                 beq.w      $3ec4
3e2a: 3a07                     move.w     d7, d5
3e2c: 7601                     moveq      #$1, d3
3e2e: 422efee5                 clr.b      -$11b(a6)
3e32: 604a                     bra.b      $3e7e
3e34: b66effe8                 cmp.w      -$18(a6), d3
3e38: 6640                     bne.b      $3e7a
3e3a: 206dc02a                 movea.l    -$3fd6(a5), a0
3e3e: 2050                     movea.l    (a0), a0
3e40: 10280202                 move.b     $202(a0), d0
3e44: 5300                     subq.b     #$1, d0
3e46: 6704                     beq.b      $3e4c
3e48: 7c01                     moveq      #$1, d6
3e4a: 6032                     bra.b      $3e7e
3e4c: ba6effe6                 cmp.w      -$1a(a6), d5
3e50: 6d04                     blt.b      $3e56
3e52: 7c01                     moveq      #$1, d6
3e54: 6028                     bra.b      $3e7e
3e56: 3005                     move.w     d5, d0
3e58: 5240                     addq.w     #$1, d0
3e5a: 7200                     moveq      #$0, d1
3e5c: 12320000                 move.b     (a2, d0.w), d1
3e60: 3f01                     move.w     d1, -(a7)
3e62: 487a012c                 pea.l      $3f90(pc)
3e66: 4ead0132                 jsr        $132(a5) ; CODE 1 resource+0x03a2
3e6a: 6604                     bne.b      $3e70
3e6c: 7c01                     moveq      #$1, d6
3e6e: 600e                     bra.b      $3e7e
3e70: 4206                     clr.b      d6
3e72: 1d7c0001fee5             move.b     #$1, -$11b(a6)
3e78: 6004                     bra.b      $3e7e
3e7a: 5245                     addq.w     #$1, d5
3e7c: 5243                     addq.w     #$1, d3
3e7e: ba6effe6                 cmp.w      -$1a(a6), d5
3e82: 5fc0                     sle.b      d0
3e84: 2f00                     move.l     d0, -(a7)
3e86: 554f                     subq.w     #$2, a7
3e88: 7000                     moveq      #$0, d0
3e8a: 10325000                 move.b     (a2, d5.w), d0
3e8e: 3f00                     move.w     d0, -(a7)
3e90: 4ebafdd0                 jsr        $3c62(pc)
3e94: 321f                     move.w     (a7)+, d1
3e96: 201f                     move.l     (a7)+, d0
3e98: 7400                     moveq      #$0, d2
3e9a: 41eefee6                 lea.l      -$11a(a6), a0
3e9e: 14303000                 move.b     (a0, d3.w), d2
3ea2: b242                     cmp.w      d2, d1
3ea4: 57c1                     seq.b      d1
3ea6: c001                     and.b      d1, d0
3ea8: 1206                     move.b     d6, d1
3eaa: 5301                     subq.b     #$1, d1
3eac: c001                     and.b      d1, d0
3eae: 122efee5                 move.b     -$11b(a6), d1
3eb2: 5301                     subq.b     #$1, d1
3eb4: c001                     and.b      d1, d0
3eb6: 6600ff7c                 bne.w      $3e34
3eba: 1006                     move.b     d6, d0
3ebc: 5300                     subq.b     #$1, d0
3ebe: 670a                     beq.b      $3eca
3ec0: 5247                     addq.w     #$1, d7
3ec2: 6006                     bra.b      $3eca
3ec4: 5247                     addq.w     #$1, d7
3ec6: 6002                     bra.b      $3eca
3ec8: 5247                     addq.w     #$1, d7
3eca: be6effe6                 cmp.w      -$1a(a6), d7
3ece: 5fc0                     sle.b      d0
3ed0: 1206                     move.b     d6, d1
3ed2: 5301                     subq.b     #$1, d1
3ed4: c001                     and.b      d1, d0
3ed6: 6600feea                 bne.w      $3dc2
3eda: 206c0002                 movea.l    $2(a4), a0
3ede: 2050                     movea.l    (a0), a0
3ee0: 2f28003e                 move.l     $3e(a0), -(a7)
3ee4: 205f                     movea.l    (a7)+, a0
3ee6: a02a                     dc.w       $a02a
3ee8: 2f0b                     move.l     a3, -(a7)
3eea: 205f                     movea.l    (a7)+, a0
3eec: a02a                     dc.w       $a02a
3eee: 4a06                     tst.b      d6
3ef0: 673a                     beq.b      $3f2c
3ef2: 2053                     movea.l    (a3), a0
3ef4: 2f280002                 move.l     $2(a0), -(a7)
3ef8: a9d9                     dc.w       $a9d9
3efa: 2053                     movea.l    (a3), a0
3efc: 20680002                 movea.l    $2(a0), a0
3f00: 2050                     movea.l    (a0), a0
3f02: 31470020                 move.w     d7, $20(a0)
3f06: 3005                     move.w     d5, d0
3f08: 5240                     addq.w     #$1, d0
3f0a: 2053                     movea.l    (a3), a0
3f0c: 20680002                 movea.l    $2(a0), a0
3f10: 2050                     movea.l    (a0), a0
3f12: 31400022                 move.w     d0, $22(a0)
3f16: 4a2e0008                 tst.b      $8(a6)
3f1a: 673e                     beq.b      $3f5a
3f1c: 2053                     movea.l    (a3), a0
3f1e: 2f280002                 move.l     $2(a0), -(a7)
3f22: a9d8                     dc.w       $a9d8
3f24: 2f0b                     move.l     a3, -(a7)
3f26: 4ebadb9c                 jsr        $1ac4(pc)
3f2a: 602e                     bra.b      $3f5a
3f2c: 4a2e0008                 tst.b      $8(a6)
3f30: 6728                     beq.b      $3f5a
3f32: 486efdda                 pea.l      -$226(a6)
3f36: 487a0056                 pea.l      $3f8e(pc)
3f3a: 206dc02a                 movea.l    -$3fd6(a5), a0
3f3e: 2050                     movea.l    (a0), a0
3f40: 48680002                 pea.l      $2(a0)
3f44: 487a002c                 pea.l      $3f72(pc)
3f48: 3f3c0003                 move.w     #$3, -(a7)
3f4c: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
3f50: 584f                     addq.w     #$4, a7
3f52: 486efdda                 pea.l      -$226(a6)
3f56: 4ebacb8e                 jsr        $ae6(pc)
3f5a: 1d46000e                 move.b     d6, $e(a6)
3f5e: 4a2e0008                 tst.b      $8(a6)
3f62: 6702                     beq.b      $3f66
3f64: a850                     dc.w       $a850
3f66: 4cdf1cf8                 movem.l    (a7)+, d3-d7/a2-a4
3f6a: 4e5e                     unlk       a6
3f6c: 205f                     movea.l    (a7)+, a0
3f6e: 5c4f                     addq.w     #$6, a7
3f70: 4ed0                     jmp        (a0)
3f72: 1a22                     move.b     -(a2), d5
3f74: 206e6f74                 movea.l    $6f74(a6), a0
3f78: 2066                     movea.l    -(a6), a0
3f7a: 6f75                     ble.b      $3ff1
3f7c: 6e64                     bgt.b      $3fe2
3f7e: 20706173742073656c656374 movea.l    ([$74207365, a0], $6c656374), a0
3f8a: 696f                     bvs.b      $3ffb
3f8c: 6e16                     bgt.b      $3fa4
3f8e: 0122                     btst.l     d0, -(a2)
3f90: 00000000                 ori.b      #$0, d0
3f94: 00000000                 ori.b      #$0, d0
3f98: 00000000                 ori.b      #$0, d0
3f9c: 00000000                 ori.b      #$0, d0
3fa0: 07ff                     .byte      0x07, 0xff
3fa2: fffe                     dc.w       $fffe
3fa4: 07ff                     .byte      0x07, 0xff
3fa6: fffe                     dc.w       $fffe
3fa8: 00000000                 ori.b      #$0, d0
3fac: 00000000                 ori.b      #$0, d0
3fb0: 00000000                 ori.b      #$0, d0
3fb4: 00000000                 ori.b      #$0, d0
3fb8: 00000000                 ori.b      #$0, d0
3fbc: 00000000                 ori.b      #$0, d0
3fc0: 07ff                     .byte      0x07, 0xff
3fc2: fffe                     dc.w       $fffe
3fc4: 07ff                     .byte      0x07, 0xff
3fc6: fffe                     dc.w       $fffe
3fc8: 00000000                 ori.b      #$0, d0
3fcc: 00000000                 ori.b      #$0, d0
3fd0: 4e56feea                 link.w     a6, #$feea
3fd4: 48e70708                 movem.l    d5-d7/a4, -(a7)
3fd8: 2a2e0008                 move.l     $8(a6), d5
3fdc: 206dc02a                 movea.l    -$3fd6(a5), a0
3fe0: 2850                     movea.l    (a0), a4
3fe2: 7000                     moveq      #$0, d0
3fe4: 102c0102                 move.b     $102(a4), d0
3fe8: 3c00                     move.w     d0, d6
3fea: 3d46feea                 move.w     d6, -$116(a6)
3fee: 7e01                     moveq      #$1, d7
3ff0: 6016                     bra.b      $4008
3ff2: 7000                     moveq      #$0, d0
3ff4: 41ec0102                 lea.l      $102(a4), a0
3ff8: 10307000                 move.b     (a0, d7.w), d0
3ffc: 41eefeef                 lea.l      -$111(a6), a0
4000: 11807000                 move.b     d0, (a0, d7.w)
4004: 5247                     addq.w     #$1, d7
4006: 6906                     bvs.b      $400e
4008: be6efeea                 cmp.w      -$116(a6), d7
400c: 6fe4                     ble.b      $3ff2
400e: 2045                     movea.l    d5, a0
4010: 2050                     movea.l    (a0), a0
4012: 2f280002                 move.l     $2(a0), -(a7)
4016: a9d7                     dc.w       $a9d7
4018: 486efef0                 pea.l      -$110(a6)
401c: 3006                     move.w     d6, d0
401e: 48c0                     ext.l      d0
4020: 2f00                     move.l     d0, -(a7)
4022: 2045                     movea.l    d5, a0
4024: 2050                     movea.l    (a0), a0
4026: 2f280002                 move.l     $2(a0), -(a7)
402a: a9de                     dc.w       $a9de
402c: 2045                     movea.l    d5, a0
402e: 2050                     movea.l    (a0), a0
4030: 117c0001000a             move.b     #$1, $a(a0)
4036: 422c0203                 clr.b      $203(a4)
403a: 4cdf10e0                 movem.l    (a7)+, d5-d7/a4
403e: 4e5e                     unlk       a6
4040: 2e9f                     move.l     (a7)+, (a7)
4042: 4e75                     rts        
4044: 4e56feee                 link.w     a6, #$feee
4048: 0c6e00010008             cmpi.w     #$1, $8(a6)
404e: 6608                     bne.b      $4058
4050: 4ead025a                 jsr        $25a(a5) ; CODE 5 resource+0x0376
4054: 60000090                 bra.w      $40e6
4058: 2f2dbdf6                 move.l     -$420a(a5), -(a7)
405c: 3f2e0008                 move.w     $8(a6), -(a7)
4060: 486efef0                 pea.l      -$110(a6)
4064: a946                     dc.w       $a946
4066: 554f                     subq.w     #$2, a7
4068: 486efef0                 pea.l      -$110(a6)
406c: a9b6                     dc.w       $a9b6
406e: 3d5ffeee                 move.w     (a7)+, -$112(a6)
4072: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4076: 3f3c0007                 move.w     #$7, -(a7)
407a: a93a                     dc.w       $a93a
407c: 2f2dbe12                 move.l     -$41ee(a5), -(a7)
4080: 3f3c000c                 move.w     #$c, -(a7)
4084: a939                     dc.w       $a939
4086: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
408a: 4267                     clr.w      -(a7)
408c: a939                     dc.w       $a939
408e: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
4092: 3f3c0009                 move.w     #$9, -(a7)
4096: a93a                     dc.w       $a93a
4098: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
409c: 3f3c000a                 move.w     #$a, -(a7)
40a0: a93a                     dc.w       $a93a
40a2: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
40a6: 3f3c000c                 move.w     #$c, -(a7)
40aa: a93a                     dc.w       $a93a
40ac: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
40b0: 3f3c000d                 move.w     #$d, -(a7)
40b4: a93a                     dc.w       $a93a
40b6: 2f2dbe02                 move.l     -$41fe(a5), -(a7)
40ba: 4267                     clr.w      -(a7)
40bc: a93a                     dc.w       $a93a
40be: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
40c2: 4267                     clr.w      -(a7)
40c4: a93a                     dc.w       $a93a
40c6: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
40ca: 4267                     clr.w      -(a7)
40cc: a93a                     dc.w       $a93a
40ce: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
40d2: 4267                     clr.w      -(a7)
40d4: 0c6d0002bdf0             cmpi.w     #$2, -$4210(a5)
40da: 5cc0                     sge.b      d0
40dc: 4400                     neg.b      d0
40de: 1f00                     move.b     d0, -(a7)
40e0: 4ebac06a                 jsr        $14c(pc)
40e4: a937                     dc.w       $a937
40e6: 4e5e                     unlk       a6
40e8: 205f                     movea.l    (a7)+, a0
40ea: 544f                     addq.w     #$2, a7
40ec: 4ed0                     jmp        (a0)
40ee: 4e560000                 link.w     a6, #$0
40f2: 302e0008                 move.w     $8(a6), d0
40f6: 60000090                 bra.w      $4188
40fa: 1f3c0001                 move.b     #$1, -(a7)
40fe: 487a00bc                 pea.l      $41bc(pc)
4102: 4267                     clr.w      -(a7)
4104: 4ebaf2a4                 jsr        $33aa(pc)
4108: 600000a8                 bra.w      $41b2
410c: 4227                     clr.b      -(a7)
410e: 487a00aa                 pea.l      $41ba(pc)
4112: 4267                     clr.w      -(a7)
4114: 4ebaf294                 jsr        $33aa(pc)
4118: 60000098                 bra.w      $41b2
411c: 4ebaf61c                 jsr        $373a(pc)
4120: 60000090                 bra.w      $41b2
4124: 554f                     subq.w     #$2, a7
4126: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
412a: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
412e: 4227                     clr.b      -(a7)
4130: 4ebaf440                 jsr        $3572(pc)
4134: 4a1f                     tst.b      (a7)+
4136: 6700007a                 beq.w      $41b2
413a: 60000076                 bra.w      $41b2
413e: 554f                     subq.w     #$2, a7
4140: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
4144: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
4148: 1f3c0001                 move.b     #$1, -(a7)
414c: 4ebaf424                 jsr        $3572(pc)
4150: 4a1f                     tst.b      (a7)+
4152: 675e                     beq.b      $41b2
4154: 605c                     bra.b      $41b2
4156: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
415a: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
415e: 4ebaf79c                 jsr        $38fc(pc)
4162: 604e                     bra.b      $41b2
4164: 4ead026a                 jsr        $26a(a5) ; CODE 5 resource+0x0cb0
4168: 6048                     bra.b      $41b2
416a: 486d0252                 pea.l      $252(a5)
416e: a9f1                     dc.w       $a9f1
4170: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
4174: 1f3c0001                 move.b     #$1, -(a7)
4178: 4ead0262                 jsr        $262(a5) ; CODE 5 resource+0x0958
417c: 6034                     bra.b      $41b2
417e: 3f3c0082                 move.w     #$82, -(a7)
4182: 4ebaf884                 jsr        $3a08(pc)
4186: 602a                     bra.b      $41b2
4188: 5340                     subq.w     #$1, d0
418a: 0c40000c                 cmpi.w     #$c, d0
418e: 6422                     bcc.b      $41b2
4190: d040                     add.w      d0, d0
4192: 303b0006                 move.w     $419a(pc, d0.w), d0
4196: 4efb0002                 jmp        $419a(pc, d0.w)
419a: ff60                     dc.w       $ff60
419c: ff72                     dc.w       $ff72
419e: 0018ff82                 ori.b      #$82, (a0)+
41a2: ff8a                     dc.w       $ff8a
41a4: ffa4                     dc.w       $ffa4
41a6: ffbc                     dc.w       $ffbc
41a8: 0018ffca                 ori.b      #$ca, (a0)+
41ac: ffd0                     dc.w       $ffd0
41ae: 0018ffe4                 ori.b      #$e4, (a0)+
41b2: 4e5e                     unlk       a6
41b4: 205f                     movea.l    (a7)+, a0
41b6: 544f                     addq.w     #$2, a7
41b8: 4ed0                     jmp        (a0)
41ba: 00120012                 ori.b      #$12, (a2)
41be: 4e56ffec                 link.w     a6, #$ffec
41c2: 48e70118                 movem.l    d7/a3-a4, -(a7)
41c6: 3e2e0008                 move.w     $8(a6), d7
41ca: 554f                     subq.w     #$2, a7
41cc: 3007                     move.w     d7, d0
41ce: 5340                     subq.w     #$1, d0
41d0: 3f00                     move.w     d0, -(a7)
41d2: a9c2                     dc.w       $a9c2
41d4: 101f                     move.b     (a7)+, d0
41d6: 5300                     subq.b     #$1, d0
41d8: 67000284                 beq.w      $445e
41dc: 206dc030                 movea.l    -$3fd0(a5), a0
41e0: 2850                     movea.l    (a0), a4
41e2: 3007                     move.w     d7, d0
41e4: 60000228                 bra.w      $440e
41e8: 4a2dbdb7                 tst.b      -$4249(a5)
41ec: 670a                     beq.b      $41f8
41ee: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
41f2: 4ead0222                 jsr        $222(a5) ; CODE 1 resource+0x0968
41f6: 603c                     bra.b      $4234
41f8: 197c0001000a             move.b     #$1, $a(a4)
41fe: 422c011a                 clr.b      $11a(a4)
4202: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
4206: 3f3c0005                 move.w     #$5, -(a7)
420a: 4a2c0014                 tst.b      $14(a4)
420e: 56c0                     sne.b      d0
4210: 4400                     neg.b      d0
4212: 1f00                     move.b     d0, -(a7)
4214: 4ebabf36                 jsr        $14c(pc)
4218: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
421c: 3f3c0007                 move.w     #$7, -(a7)
4220: 4a2c0014                 tst.b      $14(a4)
4224: 56c0                     sne.b      d0
4226: 4400                     neg.b      d0
4228: 1f00                     move.b     d0, -(a7)
422a: 4ebabf20                 jsr        $14c(pc)
422e: 2f2c0002                 move.l     $2(a4), -(a7)
4232: a9d6                     dc.w       $a9d6
4234: 4ebaf862                 jsr        $3a98(pc)
4238: 1f3c0001                 move.b     #$1, -(a7)
423c: 4ebaf94a                 jsr        $3b88(pc)
4240: 600001f8                 bra.w      $443a
4244: 4a2dbdb7                 tst.b      -$4249(a5)
4248: 670a                     beq.b      $4254
424a: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
424e: 4ead021a                 jsr        $21a(a5) ; CODE 1 resource+0x096e
4252: 6006                     bra.b      $425a
4254: 2f2c0002                 move.l     $2(a4), -(a7)
4258: a9d5                     dc.w       $a9d5
425a: 4ebaf83c                 jsr        $3a98(pc)
425e: 1f3c0001                 move.b     #$1, -(a7)
4262: 4ebaf924                 jsr        $3b88(pc)
4266: 600001d2                 bra.w      $443a
426a: 4a2dbdb7                 tst.b      -$4249(a5)
426e: 673c                     beq.b      $42ac
4270: 266dbe2a                 movea.l    -$41d6(a5), a3
4274: 206b00a0                 movea.l    $a0(a3), a0
4278: 2050                     movea.l    (a0), a0
427a: 2f08                     move.l     a0, -(a7)
427c: 594f                     subq.w     #$4, a7
427e: 4ead022a                 jsr        $22a(a5) ; CODE 1 resource+0x0992
4282: 201f                     move.l     (a7)+, d0
4284: 205f                     movea.l    (a7)+, a0
4286: 3228003c                 move.w     $3c(a0), d1
428a: 48c1                     ext.l      d1
428c: d280                     add.l      d0, d1
428e: 0c81000000ff             cmpi.l     #$ff, d1
4294: 6f0a                     ble.b      $42a0
4296: 3f3c0005                 move.w     #$5, -(a7)
429a: a9c8                     dc.w       $a9c8
429c: 6000019c                 bra.w      $443a
42a0: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
42a4: 4ead020a                 jsr        $20a(a5) ; CODE 1 resource+0x0960
42a8: 60000190                 bra.w      $443a
42ac: 206c0002                 movea.l    $2(a4), a0
42b0: 2050                     movea.l    (a0), a0
42b2: 2f08                     move.l     a0, -(a7)
42b4: 594f                     subq.w     #$4, a7
42b6: 4ead022a                 jsr        $22a(a5) ; CODE 1 resource+0x0992
42ba: 201f                     move.l     (a7)+, d0
42bc: 205f                     movea.l    (a7)+, a0
42be: 3228003c                 move.w     $3c(a0), d1
42c2: 48c1                     ext.l      d1
42c4: d280                     add.l      d0, d1
42c6: 0c8100007fff             cmpi.l     #$7fff, d1
42cc: 6f0a                     ble.b      $42d8
42ce: 3f3c0005                 move.w     #$5, -(a7)
42d2: a9c8                     dc.w       $a9c8
42d4: 60000164                 bra.w      $443a
42d8: 197c0001000a             move.b     #$1, $a(a4)
42de: 422c011a                 clr.b      $11a(a4)
42e2: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
42e6: 3f3c0005                 move.w     #$5, -(a7)
42ea: 4a2c0014                 tst.b      $14(a4)
42ee: 56c0                     sne.b      d0
42f0: 4400                     neg.b      d0
42f2: 1f00                     move.b     d0, -(a7)
42f4: 4ebabe56                 jsr        $14c(pc)
42f8: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
42fc: 3f3c0007                 move.w     #$7, -(a7)
4300: 4a2c0014                 tst.b      $14(a4)
4304: 56c0                     sne.b      d0
4306: 4400                     neg.b      d0
4308: 1f00                     move.b     d0, -(a7)
430a: 4ebabe40                 jsr        $14c(pc)
430e: 2f2c0002                 move.l     $2(a4), -(a7)
4312: a9db                     dc.w       $a9db
4314: 60000124                 bra.w      $443a
4318: 4a2dbdb7                 tst.b      -$4249(a5)
431c: 670c                     beq.b      $432a
431e: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
4322: 4ead0212                 jsr        $212(a5) ; CODE 1 resource+0x0974
4326: 60000112                 bra.w      $443a
432a: 197c0001000a             move.b     #$1, $a(a4)
4330: 422c011a                 clr.b      $11a(a4)
4334: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
4338: 3f3c0005                 move.w     #$5, -(a7)
433c: 4a2c0014                 tst.b      $14(a4)
4340: 56c0                     sne.b      d0
4342: 4400                     neg.b      d0
4344: 1f00                     move.b     d0, -(a7)
4346: 4ebabe04                 jsr        $14c(pc)
434a: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
434e: 3f3c0007                 move.w     #$7, -(a7)
4352: 4a2c0014                 tst.b      $14(a4)
4356: 56c0                     sne.b      d0
4358: 4400                     neg.b      d0
435a: 1f00                     move.b     d0, -(a7)
435c: 4ebabdee                 jsr        $14c(pc)
4360: 2f2c0002                 move.l     $2(a4), -(a7)
4364: a9d7                     dc.w       $a9d7
4366: 600000d2                 bra.w      $443a
436a: 4a2dbdb7                 tst.b      -$4249(a5)
436e: 671c                     beq.b      $438c
4370: 266dbe2a                 movea.l    -$41d6(a5), a3
4374: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
4378: 302b00a4                 move.w     $a4(a3), d0
437c: 5240                     addq.w     #$1, d0
437e: 3f00                     move.w     d0, -(a7)
4380: 4267                     clr.w      -(a7)
4382: 3f3c7fff                 move.w     #$7fff, -(a7)
4386: a97e                     dc.w       $a97e
4388: 600000b0                 bra.w      $443a
438c: 42a7                     clr.l      -(a7)
438e: 2f3c00007fff             move.l     #$7fff, -(a7)
4394: 2f2c0002                 move.l     $2(a4), -(a7)
4398: a9d1                     dc.w       $a9d1
439a: 6000009e                 bra.w      $443a
439e: 206dc030                 movea.l    -$3fd0(a5), a0
43a2: 2050                     movea.l    (a0), a0
43a4: 2f280002                 move.l     $2(a0), -(a7)
43a8: 3f3c0020                 move.w     #$20, -(a7)
43ac: 4ebac274                 jsr        $622(pc)
43b0: 60000088                 bra.w      $443a
43b4: 206dc030                 movea.l    -$3fd0(a5), a0
43b8: 2050                     movea.l    (a0), a0
43ba: 2f280002                 move.l     $2(a0), -(a7)
43be: 3f3c0020                 move.w     #$20, -(a7)
43c2: 4ebac350                 jsr        $714(pc)
43c6: 60000072                 bra.w      $443a
43ca: 206dc030                 movea.l    -$3fd0(a5), a0
43ce: 2050                     movea.l    (a0), a0
43d0: 2f280002                 move.l     $2(a0), -(a7)
43d4: 3f3c003b                 move.w     #$3b, -(a7)
43d8: 4ebac33a                 jsr        $714(pc)
43dc: 605c                     bra.b      $443a
43de: 206dc030                 movea.l    -$3fd0(a5), a0
43e2: 2050                     movea.l    (a0), a0
43e4: 2f280002                 move.l     $2(a0), -(a7)
43e8: 3f3c003b                 move.w     #$3b, -(a7)
43ec: 4ebac234                 jsr        $622(pc)
43f0: 6048                     bra.b      $443a
43f2: 102dbdb9                 move.b     -$4247(a5), d0
43f6: 5300                     subq.b     #$1, d0
43f8: 4400                     neg.b      d0
43fa: 1b40bdb9                 move.b     d0, -$4247(a5)
43fe: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
4402: 3f3c000f                 move.w     #$f, -(a7)
4406: 1f2dbdb9                 move.b     -$4247(a5), -(a7)
440a: a945                     dc.w       $a945
440c: 602c                     bra.b      $443a
440e: 5740                     subq.w     #$3, d0
4410: 0c40000d                 cmpi.w     #$d, d0
4414: 6424                     bcc.b      $443a
4416: d040                     add.w      d0, d0
4418: 303b0006                 move.w     $4420(pc, d0.w), d0
441c: 4efb0002                 jmp        $4420(pc, d0.w)
4420: fdc8                     dc.w       $fdc8
4422: fe24                     dc.w       $fe24
4424: fe4a                     dc.w       $fe4a
4426: fef8                     dc.w       $fef8
4428: ff4a                     dc.w       $ff4a
442a: 001aff7e                 ori.b      #$7e, (a2)+
442e: ff94                     dc.w       $ff94
4430: 001affaa                 ori.b      #$aa, (a2)+
4434: ffbe                     dc.w       $ffbe
4436: 001affd2                 ori.b      #$d2, (a2)+
443a: 0c47000f                 cmpi.w     #$f, d7
443e: 671a                     beq.b      $445a
4440: 102dbdb7                 move.b     -$4249(a5), d0
4444: 5300                     subq.b     #$1, d0
4446: 670a                     beq.b      $4452
4448: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
444c: 4ebad676                 jsr        $1ac4(pc)
4450: 6008                     bra.b      $445a
4452: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
4456: 4ebabd1c                 jsr        $174(pc)
445a: 4ebabe38                 jsr        $294(pc)
445e: 4cdf1880                 movem.l    (a7)+, d7/a3-a4
4462: 4e5e                     unlk       a6
4464: 205f                     movea.l    (a7)+, a0
4466: 544f                     addq.w     #$2, a7
4468: 4ed0                     jmp        (a0)
446a: 4e56ffe2                 link.w     a6, #$ffe2
446e: 48e70018                 movem.l    a3-a4, -(a7)
4472: 302e0008                 move.w     $8(a6), d0
4476: 60000246                 bra.w      $46be
447a: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
447e: a916                     dc.w       $a916
4480: 266dbe32                 movea.l    -$41ce(a5), a3
4484: 102b006e                 move.b     $6e(a3), d0
4488: 5300                     subq.b     #$1, d0
448a: 670000aa                 beq.w      $4536
448e: 2f2dc02a                 move.l     -$3fd6(a5), -(a7)
4492: 205f                     movea.l    (a7)+, a0
4494: a029                     dc.w       $a029
4496: 206dc02a                 movea.l    -$3fd6(a5), a0
449a: 2850                     movea.l    (a0), a4
449c: 18bc0002                 move.b     #$2, (a4)
44a0: 2f2dbe32                 move.l     -$41ce(a5), -(a7)
44a4: 3f3c0003                 move.w     #$3, -(a7)
44a8: 486effee                 pea.l      -$12(a6)
44ac: 486c0204                 pea.l      $204(a4)
44b0: 486effe6                 pea.l      -$1a(a6)
44b4: a98d                     dc.w       $a98d
44b6: 2f2dbe32                 move.l     -$41ce(a5), -(a7)
44ba: 3f3c0001                 move.w     #$1, -(a7)
44be: 486effee                 pea.l      -$12(a6)
44c2: 486c0214                 pea.l      $214(a4)
44c6: 486effe6                 pea.l      -$1a(a6)
44ca: a98d                     dc.w       $a98d
44cc: 2f2dbe32                 move.l     -$41ce(a5), -(a7)
44d0: 3f3c0004                 move.w     #$4, -(a7)
44d4: 486effee                 pea.l      -$12(a6)
44d8: 486c020c                 pea.l      $20c(a4)
44dc: 486effe6                 pea.l      -$1a(a6)
44e0: a98d                     dc.w       $a98d
44e2: 2f2dbe32                 move.l     -$41ce(a5), -(a7)
44e6: 3f3c0005                 move.w     #$5, -(a7)
44ea: 486effee                 pea.l      -$12(a6)
44ee: 486c0210                 pea.l      $210(a4)
44f2: 486effe6                 pea.l      -$1a(a6)
44f6: a98d                     dc.w       $a98d
44f8: 2f2c0204                 move.l     $204(a4), -(a7)
44fc: 486c0002                 pea.l      $2(a4)
4500: a98f                     dc.w       $a98f
4502: 4a2c0202                 tst.b      $202(a4)
4506: 6714                     beq.b      $451c
4508: 2f2c0210                 move.l     $210(a4), -(a7)
450c: 4267                     clr.w      -(a7)
450e: a963                     dc.w       $a963
4510: 2f2c020c                 move.l     $20c(a4), -(a7)
4514: 3f3c0001                 move.w     #$1, -(a7)
4518: a963                     dc.w       $a963
451a: 6012                     bra.b      $452e
451c: 2f2c020c                 move.l     $20c(a4), -(a7)
4520: 4267                     clr.w      -(a7)
4522: a963                     dc.w       $a963
4524: 2f2c0210                 move.l     $210(a4), -(a7)
4528: 3f3c0001                 move.w     #$1, -(a7)
452c: a963                     dc.w       $a963
452e: 2f2dc02a                 move.l     -$3fd6(a5), -(a7)
4532: 205f                     movea.l    (a7)+, a0
4534: a02a                     dc.w       $a02a
4536: 2f2dbe32                 move.l     -$41ce(a5), -(a7)
453a: 3f3c0003                 move.w     #$3, -(a7)
453e: 4267                     clr.w      -(a7)
4540: 3f3c7fff                 move.w     #$7fff, -(a7)
4544: a97e                     dc.w       $a97e
4546: 2f2dbe32                 move.l     -$41ce(a5), -(a7)
454a: 4ebabc28                 jsr        $174(pc)
454e: 2f2dbe32                 move.l     -$41ce(a5), -(a7)
4552: a915                     dc.w       $a915
4554: 2f2dbe32                 move.l     -$41ce(a5), -(a7)
4558: a91f                     dc.w       $a91f
455a: 2f2dbe32                 move.l     -$41ce(a5), -(a7)
455e: 3f3c0001                 move.w     #$1, -(a7)
4562: 206dc02a                 movea.l    -$3fd6(a5), a0
4566: 2050                     movea.l    (a0), a0
4568: 4a280002                 tst.b      $2(a0)
456c: 56c0                     sne.b      d0
456e: c02dbdb7                 and.b      -$4249(a5), d0
4572: 1f00                     move.b     d0, -(a7)
4574: 4ebac4c6                 jsr        $a3c(pc)
4578: 6000015e                 bra.w      $46d8
457c: 554f                     subq.w     #$2, a7
457e: 594f                     subq.w     #$4, a7
4580: 4ebaf69a                 jsr        $3c1c(pc)
4584: 1f3c0001                 move.b     #$1, -(a7)
4588: 4ebaf78a                 jsr        $3d14(pc)
458c: 206dc02a                 movea.l    -$3fd6(a5), a0
4590: 2050                     movea.l    (a0), a0
4592: 115f0203                 move.b     (a7)+, $203(a0)
4596: 60000140                 bra.w      $46d8
459a: 2f2dbe32                 move.l     -$41ce(a5), -(a7)
459e: a916                     dc.w       $a916
45a0: 266dbe36                 movea.l    -$41ca(a5), a3
45a4: 102b006e                 move.b     $6e(a3), d0
45a8: 5300                     subq.b     #$1, d0
45aa: 670000aa                 beq.w      $4656
45ae: 2f2dc02a                 move.l     -$3fd6(a5), -(a7)
45b2: 205f                     movea.l    (a7)+, a0
45b4: a029                     dc.w       $a029
45b6: 206dc02a                 movea.l    -$3fd6(a5), a0
45ba: 2850                     movea.l    (a0), a4
45bc: 18bc0003                 move.b     #$3, (a4)
45c0: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
45c4: 3f3c0003                 move.w     #$3, -(a7)
45c8: 486effee                 pea.l      -$12(a6)
45cc: 486c0204                 pea.l      $204(a4)
45d0: 486effe6                 pea.l      -$1a(a6)
45d4: a98d                     dc.w       $a98d
45d6: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
45da: 3f3c0001                 move.w     #$1, -(a7)
45de: 486effee                 pea.l      -$12(a6)
45e2: 486c0214                 pea.l      $214(a4)
45e6: 486effe6                 pea.l      -$1a(a6)
45ea: a98d                     dc.w       $a98d
45ec: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
45f0: 3f3c0009                 move.w     #$9, -(a7)
45f4: 486effee                 pea.l      -$12(a6)
45f8: 486c020c                 pea.l      $20c(a4)
45fc: 486effe6                 pea.l      -$1a(a6)
4600: a98d                     dc.w       $a98d
4602: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
4606: 3f3c000a                 move.w     #$a, -(a7)
460a: 486effee                 pea.l      -$12(a6)
460e: 486c0210                 pea.l      $210(a4)
4612: 486effe6                 pea.l      -$1a(a6)
4616: a98d                     dc.w       $a98d
4618: 2f2c0204                 move.l     $204(a4), -(a7)
461c: 486c0002                 pea.l      $2(a4)
4620: a98f                     dc.w       $a98f
4622: 4a2c0202                 tst.b      $202(a4)
4626: 6714                     beq.b      $463c
4628: 2f2c0210                 move.l     $210(a4), -(a7)
462c: 4267                     clr.w      -(a7)
462e: a963                     dc.w       $a963
4630: 2f2c020c                 move.l     $20c(a4), -(a7)
4634: 3f3c0001                 move.w     #$1, -(a7)
4638: a963                     dc.w       $a963
463a: 6012                     bra.b      $464e
463c: 2f2c020c                 move.l     $20c(a4), -(a7)
4640: 4267                     clr.w      -(a7)
4642: a963                     dc.w       $a963
4644: 2f2c0210                 move.l     $210(a4), -(a7)
4648: 3f3c0001                 move.w     #$1, -(a7)
464c: a963                     dc.w       $a963
464e: 2f2dc02a                 move.l     -$3fd6(a5), -(a7)
4652: 205f                     movea.l    (a7)+, a0
4654: a02a                     dc.w       $a02a
4656: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
465a: 3f3c0003                 move.w     #$3, -(a7)
465e: 4267                     clr.w      -(a7)
4660: 3f3c7fff                 move.w     #$7fff, -(a7)
4664: a97e                     dc.w       $a97e
4666: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
466a: 4ebabb08                 jsr        $174(pc)
466e: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
4672: a915                     dc.w       $a915
4674: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
4678: a91f                     dc.w       $a91f
467a: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
467e: 3f3c0001                 move.w     #$1, -(a7)
4682: 206dc02a                 movea.l    -$3fd6(a5), a0
4686: 2050                     movea.l    (a0), a0
4688: 4a280002                 tst.b      $2(a0)
468c: 56c0                     sne.b      d0
468e: c02dbdb7                 and.b      -$4249(a5), d0
4692: 1f00                     move.b     d0, -(a7)
4694: 4ebac3a6                 jsr        $a3c(pc)
4698: 603e                     bra.b      $46d8
469a: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
469e: 4ebad424                 jsr        $1ac4(pc)
46a2: 6034                     bra.b      $46d8
46a4: 42a7                     clr.l      -(a7)
46a6: 42a7                     clr.l      -(a7)
46a8: 206dc030                 movea.l    -$3fd0(a5), a0
46ac: 2050                     movea.l    (a0), a0
46ae: 2f280002                 move.l     $2(a0), -(a7)
46b2: a9d1                     dc.w       $a9d1
46b4: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
46b8: 4ebad40a                 jsr        $1ac4(pc)
46bc: 601a                     bra.b      $46d8
46be: 5340                     subq.w     #$1, d0
46c0: 6700fdb8                 beq.w      $447a
46c4: 5340                     subq.w     #$1, d0
46c6: 6700feb4                 beq.w      $457c
46ca: 5340                     subq.w     #$1, d0
46cc: 6700fecc                 beq.w      $459a
46d0: 5540                     subq.w     #$2, d0
46d2: 67c6                     beq.b      $469a
46d4: 5340                     subq.w     #$1, d0
46d6: 67cc                     beq.b      $46a4
46d8: 4cdf1800                 movem.l    (a7)+, a3-a4
46dc: 4e5e                     unlk       a6
46de: 205f                     movea.l    (a7)+, a0
46e0: 544f                     addq.w     #$2, a7
46e2: 4ed0                     jmp        (a0)
46e4: 4e560000                 link.w     a6, #$0
46e8: 206e000e                 movea.l    $e(a6), a0
46ec: 2050                     movea.l    (a0), a0
46ee: 316e00080116             move.w     $8(a6), $116(a0)
46f4: 2f2e000e                 move.l     $e(a6), -(a7)
46f8: 2f2e000a                 move.l     $a(a6), -(a7)
46fc: 1f3c0001                 move.b     #$1, -(a7)
4700: 4ebad796                 jsr        $1e98(pc)
4704: 4e5e                     unlk       a6
4706: 205f                     movea.l    (a7)+, a0
4708: 4fef000a                 lea.l      $a(a7), a7
470c: 4ed0                     jmp        (a0)
470e: 4e56ffea                 link.w     a6, #$ffea
4712: 48e70308                 movem.l    d6-d7/a4, -(a7)
4716: 3c2e0008                 move.w     $8(a6), d6
471a: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
471e: 3f2dbde8                 move.w     -$4218(a5), -(a7)
4722: 4227                     clr.b      -(a7)
4724: a945                     dc.w       $a945
4726: 3b46bde8                 move.w     d6, -$4218(a5)
472a: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
472e: 3f2dbde8                 move.w     -$4218(a5), -(a7)
4732: 1f3c0001                 move.b     #$1, -(a7)
4736: a945                     dc.w       $a945
4738: 4ebac9c2                 jsr        $10fc(pc)
473c: 302dbdd8                 move.w     -$4228(a5), d0
4740: 02400800                 andi.w     #$800, d0
4744: 0c400800                 cmpi.w     #$800, d0
4748: 6646                     bne.b      $4790
474a: 7e01                     moveq      #$1, d7
474c: 3007                     move.w     d7, d0
474e: c1fc00a6                 muls.w     #$a6, d0
4752: 0640bf96                 addi.w     #$bf96, d0
4756: 4a350000                 tst.b      (a5, d0.w)
475a: 672a                     beq.b      $4786
475c: 594f                     subq.w     #$4, a7
475e: 3007                     move.w     d7, d0
4760: c1fc00a6                 muls.w     #$a6, d0
4764: 0640bf98                 addi.w     #$bf98, d0
4768: 48750000                 pea.l      (a5, d0.w)
476c: a917                     dc.w       $a917
476e: 285f                     movea.l    (a7)+, a4
4770: 2f0c                     move.l     a4, -(a7)
4772: 3007                     move.w     d7, d0
4774: c1fc00a6                 muls.w     #$a6, d0
4778: 0640bf98                 addi.w     #$bf98, d0
477c: 48750000                 pea.l      (a5, d0.w)
4780: 3f06                     move.w     d6, -(a7)
4782: 4ebaff60                 jsr        $46e4(pc)
4786: 5247                     addq.w     #$1, d7
4788: 0c470005                 cmpi.w     #$5, d7
478c: 6fbe                     ble.b      $474c
478e: 600e                     bra.b      $479e
4790: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
4794: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
4798: 3f06                     move.w     d6, -(a7)
479a: 4ebaff48                 jsr        $46e4(pc)
479e: 4cdf10c0                 movem.l    (a7)+, d6-d7/a4
47a2: 4e5e                     unlk       a6
47a4: 205f                     movea.l    (a7)+, a0
47a6: 544f                     addq.w     #$2, a7
47a8: 4ed0                     jmp        (a0)
47aa: 4e560000                 link.w     a6, #$0
47ae: 206e000e                 movea.l    $e(a6), a0
47b2: 2050                     movea.l    (a0), a0
47b4: 316e00080118             move.w     $8(a6), $118(a0)
47ba: 2f2e000e                 move.l     $e(a6), -(a7)
47be: 2f2e000a                 move.l     $a(a6), -(a7)
47c2: 4227                     clr.b      -(a7)
47c4: 4ebad6d2                 jsr        $1e98(pc)
47c8: 4e5e                     unlk       a6
47ca: 205f                     movea.l    (a7)+, a0
47cc: 4fef000a                 lea.l      $a(a7), a7
47d0: 4ed0                     jmp        (a0)
47d2: 4e56ffea                 link.w     a6, #$ffea
47d6: 48e70308                 movem.l    d6-d7/a4, -(a7)
47da: 3c2e0008                 move.w     $8(a6), d6
47de: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
47e2: 3f2dbdea                 move.w     -$4216(a5), -(a7)
47e6: 4227                     clr.b      -(a7)
47e8: a945                     dc.w       $a945
47ea: 3b46bdea                 move.w     d6, -$4216(a5)
47ee: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
47f2: 3f2dbdea                 move.w     -$4216(a5), -(a7)
47f6: 1f3c0001                 move.b     #$1, -(a7)
47fa: a945                     dc.w       $a945
47fc: 302dbdea                 move.w     -$4216(a5), d0
4800: d040                     add.w      d0, d0
4802: 0640f90a                 addi.w     #$f90a, d0
4806: 3b750000bdee             move.w     (a5, d0.w), -$4212(a5)
480c: 302dbdd8                 move.w     -$4228(a5), d0
4810: 02400800                 andi.w     #$800, d0
4814: 0c400800                 cmpi.w     #$800, d0
4818: 6646                     bne.b      $4860
481a: 7e01                     moveq      #$1, d7
481c: 3007                     move.w     d7, d0
481e: c1fc00a6                 muls.w     #$a6, d0
4822: 0640bf96                 addi.w     #$bf96, d0
4826: 4a350000                 tst.b      (a5, d0.w)
482a: 672a                     beq.b      $4856
482c: 594f                     subq.w     #$4, a7
482e: 3007                     move.w     d7, d0
4830: c1fc00a6                 muls.w     #$a6, d0
4834: 0640bf98                 addi.w     #$bf98, d0
4838: 48750000                 pea.l      (a5, d0.w)
483c: a917                     dc.w       $a917
483e: 285f                     movea.l    (a7)+, a4
4840: 2f0c                     move.l     a4, -(a7)
4842: 3007                     move.w     d7, d0
4844: c1fc00a6                 muls.w     #$a6, d0
4848: 0640bf98                 addi.w     #$bf98, d0
484c: 48750000                 pea.l      (a5, d0.w)
4850: 3f06                     move.w     d6, -(a7)
4852: 4ebaff56                 jsr        $47aa(pc)
4856: 5247                     addq.w     #$1, d7
4858: 0c470005                 cmpi.w     #$5, d7
485c: 6fbe                     ble.b      $481c
485e: 600e                     bra.b      $486e
4860: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
4864: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
4868: 3f06                     move.w     d6, -(a7)
486a: 4ebaff3e                 jsr        $47aa(pc)
486e: 4cdf10c0                 movem.l    (a7)+, d6-d7/a4
4872: 4e5e                     unlk       a6
4874: 205f                     movea.l    (a7)+, a0
4876: 544f                     addq.w     #$2, a7
4878: 4ed0                     jmp        (a0)
487a: 4e56ffee                 link.w     a6, #$ffee
487e: 2f07                     move.l     d7, -(a7)
4880: 302e0008                 move.w     $8(a6), d0
4884: 605e                     bra.b      $48e4
4886: 554f                     subq.w     #$2, a7
4888: 486dbdb2                 pea.l      -$424e(a5)
488c: 4ebac41c                 jsr        $caa(pc)
4890: 3e1f                     move.w     (a7)+, d7
4892: 4a47                     tst.w      d7
4894: 6f000072                 ble.w      $4908
4898: 3f07                     move.w     d7, -(a7)
489a: 3f2dbdb2                 move.w     -$424e(a5), -(a7)
489e: 4ead0252                 jsr        $252(a5) ; CODE 3 resource+0x3e36
48a2: 4a2dbdb5                 tst.b      -$424b(a5)
48a6: 67000060                 beq.w      $4908
48aa: 3f3c0081                 move.w     #$81, -(a7)
48ae: 4ebaf158                 jsr        $3a08(pc)
48b2: 60000054                 bra.w      $4908
48b6: 554f                     subq.w     #$2, a7
48b8: 1f3c0001                 move.b     #$1, -(a7)
48bc: 4227                     clr.b      -(a7)
48be: 4ead0282                 jsr        $282(a5) ; CODE 5 resource+0x3d44
48c2: 4a1f                     tst.b      (a7)+
48c4: 6742                     beq.b      $4908
48c6: 6040                     bra.b      $4908
48c8: 4ebab772                 jsr        $3c(pc)
48cc: 603a                     bra.b      $4908
48ce: 4ebab7c0                 jsr        $90(pc)
48d2: 6034                     bra.b      $4908
48d4: 302e0008                 move.w     $8(a6), d0
48d8: 0640fff1                 addi.w     #$fff1, d0
48dc: 3f00                     move.w     d0, -(a7)
48de: 4ebab724                 jsr        $4(pc)
48e2: 6024                     bra.b      $4908
48e4: 5340                     subq.w     #$1, d0
48e6: 679e                     beq.b      $4886
48e8: 5d40                     subq.w     #$6, d0
48ea: 67ca                     beq.b      $48b6
48ec: 5b40                     subq.w     #$5, d0
48ee: 67d8                     beq.b      $48c8
48f0: 5340                     subq.w     #$1, d0
48f2: 67da                     beq.b      $48ce
48f4: 5540                     subq.w     #$2, d0
48f6: 67dc                     beq.b      $48d4
48f8: 5340                     subq.w     #$1, d0
48fa: 67d8                     beq.b      $48d4
48fc: 5340                     subq.w     #$1, d0
48fe: 67d4                     beq.b      $48d4
4900: 5340                     subq.w     #$1, d0
4902: 67d0                     beq.b      $48d4
4904: 5340                     subq.w     #$1, d0
4906: 67cc                     beq.b      $48d4
4908: 2e1f                     move.l     (a7)+, d7
490a: 4e5e                     unlk       a6
490c: 205f                     movea.l    (a7)+, a0
490e: 544f                     addq.w     #$2, a7
4910: 4ed0                     jmp        (a0)
4912: 4e56ffec                 link.w     a6, #$ffec
4916: 48e70118                 movem.l    d7/a3-a4, -(a7)
491a: 3e2e0008                 move.w     $8(a6), d7
491e: 3007                     move.w     d7, d0
4920: 6020                     bra.b      $4942
4922: 2f2dbe2e                 move.l     -$41d2(a5), -(a7)
4926: a915                     dc.w       $a915
4928: 2f2dbe2e                 move.l     -$41d2(a5), -(a7)
492c: a91f                     dc.w       $a91f
492e: 6056                     bra.b      $4986
4930: 4ebada8a                 jsr        $23bc(pc)
4934: 6050                     bra.b      $4986
4936: 4ebada8c                 jsr        $23c4(pc)
493a: 604a                     bra.b      $4986
493c: 4ebad68a                 jsr        $1fc8(pc)
4940: 6044                     bra.b      $4986
4942: 5340                     subq.w     #$1, d0
4944: 67ea                     beq.b      $4930
4946: 5340                     subq.w     #$1, d0
4948: 67ec                     beq.b      $4936
494a: 5140                     subq.w     #$8, d0
494c: 67d4                     beq.b      $4922
494e: 5540                     subq.w     #$2, d0
4950: 67ea                     beq.b      $493c
4952: 3007                     move.w     d7, d0
4954: 5740                     subq.w     #$3, d0
4956: c1fc00a6                 muls.w     #$a6, d0
495a: 0640bf8e                 addi.w     #$bf8e, d0
495e: 49f50000                 lea.l      (a5, d0.w), a4
4962: 41ec000a                 lea.l      $a(a4), a0
4966: 2648                     movea.l    a0, a3
4968: 102b006e                 move.b     $6e(a3), d0
496c: 5300                     subq.b     #$1, d0
496e: 670a                     beq.b      $497a
4970: 302dbdf2                 move.w     -$420e(a5), d0
4974: 5240                     addq.w     #$1, d0
4976: 3b40bdf2                 move.w     d0, -$420e(a5)
497a: 486c000a                 pea.l      $a(a4)
497e: a915                     dc.w       $a915
4980: 486c000a                 pea.l      $a(a4)
4984: a91f                     dc.w       $a91f
4986: 4cdf1880                 movem.l    (a7)+, d7/a3-a4
498a: 4e5e                     unlk       a6
498c: 205f                     movea.l    (a7)+, a0
498e: 544f                     addq.w     #$2, a7
4990: 4ed0                     jmp        (a0)
4992: 4e56ffec                 link.w     a6, #$ffec
4996: 2f07                     move.l     d7, -(a7)
4998: 4ebaf11a                 jsr        $3ab4(pc)
499c: 0c6d0001bdca             cmpi.w     #$1, -$4236(a5)
49a2: 660c                     bne.b      $49b0
49a4: 594f                     subq.w     #$4, a7
49a6: 2f2dbdd4                 move.l     -$422c(a5), -(a7)
49aa: a93d                     dc.w       $a93d
49ac: 2e1f                     move.l     (a7)+, d7
49ae: 600a                     bra.b      $49ba
49b0: 594f                     subq.w     #$4, a7
49b2: 3f2dbdce                 move.w     -$4232(a5), -(a7)
49b6: a93e                     dc.w       $a93e
49b8: 2e1f                     move.l     (a7)+, d7
49ba: 2007                     move.l     d7, d0
49bc: 4840                     swap       d0
49be: 6040                     bra.b      $4a00
49c0: 3f07                     move.w     d7, -(a7)
49c2: 4ebaf680                 jsr        $4044(pc)
49c6: 605c                     bra.b      $4a24
49c8: 3f07                     move.w     d7, -(a7)
49ca: 4ebaf722                 jsr        $40ee(pc)
49ce: 6054                     bra.b      $4a24
49d0: 3f07                     move.w     d7, -(a7)
49d2: 4ebaf7ea                 jsr        $41be(pc)
49d6: 604c                     bra.b      $4a24
49d8: 3f07                     move.w     d7, -(a7)
49da: 4ebafa8e                 jsr        $446a(pc)
49de: 6044                     bra.b      $4a24
49e0: 3f07                     move.w     d7, -(a7)
49e2: 4ebafd2a                 jsr        $470e(pc)
49e6: 603c                     bra.b      $4a24
49e8: 3f07                     move.w     d7, -(a7)
49ea: 4ebafde6                 jsr        $47d2(pc)
49ee: 6034                     bra.b      $4a24
49f0: 3f07                     move.w     d7, -(a7)
49f2: 4ebafe86                 jsr        $487a(pc)
49f6: 602c                     bra.b      $4a24
49f8: 3f07                     move.w     d7, -(a7)
49fa: 4ebaff16                 jsr        $4912(pc)
49fe: 6024                     bra.b      $4a24
4a00: 0640ff80                 addi.w     #$ff80, d0
4a04: 0c400008                 cmpi.w     #$8, d0
4a08: 641a                     bcc.b      $4a24
4a0a: d040                     add.w      d0, d0
4a0c: 303b0006                 move.w     $4a14(pc, d0.w), d0
4a10: 4efb0002                 jmp        $4a14(pc, d0.w)
4a14: ffac                     dc.w       $ffac
4a16: ffb4                     dc.w       $ffb4
4a18: ffbc                     dc.w       $ffbc
4a1a: ffc4                     dc.w       $ffc4
4a1c: ffcc                     dc.w       $ffcc
4a1e: ffd4                     dc.w       $ffd4
4a20: ffdc                     dc.w       $ffdc
4a22: ffe4                     dc.w       $ffe4
4a24: 4267                     clr.w      -(a7)
4a26: a938                     dc.w       $a938
4a28: 2e1f                     move.l     (a7)+, d7
4a2a: 4e5e                     unlk       a6
4a2c: 4e75                     rts        
4a2e: 4e56ffea                 link.w     a6, #$ffea
4a32: 48e70108                 movem.l    d7/a4, -(a7)
4a36: 486dbdd4                 pea.l      -$422c(a5)
4a3a: a871                     dc.w       $a871
4a3c: 554f                     subq.w     #$2, a7
4a3e: 2f2dbdd4                 move.l     -$422c(a5), -(a7)
4a42: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
4a46: 486effea                 pea.l      -$16(a6)
4a4a: a96c                     dc.w       $a96c
4a4c: 3e1f                     move.w     (a7)+, d7
4a4e: 4a47                     tst.w      d7
4a50: 6712                     beq.b      $4a64
4a52: 2f2effea                 move.l     -$16(a6), -(a7)
4a56: 3f07                     move.w     d7, -(a7)
4a58: 2f2dbdd4                 move.l     -$422c(a5), -(a7)
4a5c: 4ebacd78                 jsr        $17d6(pc)
4a60: 60000078                 bra.w      $4ada
4a64: 4a2dbdb6                 tst.b      -$424a(a5)
4a68: 6770                     beq.b      $4ada
4a6a: 206dc030                 movea.l    -$3fd0(a5), a0
4a6e: 2850                     movea.l    (a0), a4
4a70: 0c6d000abdd6             cmpi.w     #$a, -$422a(a5)
4a76: 5dc0                     slt.b      d0
4a78: 206c0002                 movea.l    $2(a4), a0
4a7c: 2050                     movea.l    (a0), a0
4a7e: 322dbdd4                 move.w     -$422c(a5), d1
4a82: b2680008                 cmp.w      $8(a0), d1
4a86: 5cc1                     sge.b      d1
4a88: c001                     and.b      d1, d0
4a8a: 206c0002                 movea.l    $2(a4), a0
4a8e: 2050                     movea.l    (a0), a0
4a90: 322dbdd4                 move.w     -$422c(a5), d1
4a94: b268000c                 cmp.w      $c(a0), d1
4a98: 5fc1                     sle.b      d1
4a9a: c001                     and.b      d1, d0
4a9c: 6706                     beq.b      $4aa4
4a9e: 3b7c000abdd6             move.w     #$a, -$422a(a5)
4aa4: 554f                     subq.w     #$2, a7
4aa6: 2f2dbdd4                 move.l     -$422c(a5), -(a7)
4aaa: 206c0002                 movea.l    $2(a4), a0
4aae: 2050                     movea.l    (a0), a0
4ab0: 48680008                 pea.l      $8(a0)
4ab4: a8ad                     dc.w       $a8ad
4ab6: 4a1f                     tst.b      (a7)+
4ab8: 6720                     beq.b      $4ada
4aba: 2f2dbdd4                 move.l     -$422c(a5), -(a7)
4abe: 302dbdd8                 move.w     -$4228(a5), d0
4ac2: 02400200                 andi.w     #$200, d0
4ac6: 0c400200                 cmpi.w     #$200, d0
4aca: 57c0                     seq.b      d0
4acc: 4400                     neg.b      d0
4ace: 1f00                     move.b     d0, -(a7)
4ad0: 2f2c0002                 move.l     $2(a4), -(a7)
4ad4: a9d4                     dc.w       $a9d4
4ad6: 4ebab7bc                 jsr        $294(pc)
4ada: 4cdf1080                 movem.l    (a7)+, d7/a4
4ade: 4e5e                     unlk       a6
4ae0: 4e75                     rts        
4ae2: 4e56ffd6                 link.w     a6, #$ffd6
4ae6: 48e70318                 movem.l    d6-d7/a3-a4, -(a7)
4aea: 554f                     subq.w     #$2, a7
4aec: 2f2dbdd4                 move.l     -$422c(a5), -(a7)
4af0: 486effde                 pea.l      -$22(a6)
4af4: a92c                     dc.w       $a92c
4af6: 3c1f                     move.w     (a7)+, d6
4af8: 3006                     move.w     d6, d0
4afa: 60000084                 bra.w      $4b80
4afe: 4ebafe92                 jsr        $4992(pc)
4b02: 60000158                 bra.w      $4c5c
4b06: 594f                     subq.w     #$4, a7
4b08: a924                     dc.w       $a924
4b0a: 265f                     movea.l    (a7)+, a3
4b0c: 486dbdca                 pea.l      -$4236(a5)
4b10: 2f2effde                 move.l     -$22(a6), -(a7)
4b14: a9b3                     dc.w       $a9b3
4b16: 594f                     subq.w     #$4, a7
4b18: a924                     dc.w       $a924
4b1a: 285f                     movea.l    (a7)+, a4
4b1c: 200c                     move.l     a4, d0
4b1e: 6624                     bne.b      $4b44
4b20: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
4b24: 4267                     clr.w      -(a7)
4b26: 0c6d0002bdf0             cmpi.w     #$2, -$4210(a5)
4b2c: 5cc0                     sge.b      d0
4b2e: 4400                     neg.b      d0
4b30: 1f00                     move.b     d0, -(a7)
4b32: 4ebab618                 jsr        $14c(pc)
4b36: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
4b3a: 4267                     clr.w      -(a7)
4b3c: a93a                     dc.w       $a93a
4b3e: a937                     dc.w       $a937
4b40: 6000011a                 bra.w      $4c5c
4b44: b7cc                     cmpa.l     a4, a3
4b46: 67000114                 beq.w      $4c5c
4b4a: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
4b4e: 4267                     clr.w      -(a7)
4b50: a939                     dc.w       $a939
4b52: 2f2dbe02                 move.l     -$41fe(a5), -(a7)
4b56: 4267                     clr.w      -(a7)
4b58: a93a                     dc.w       $a93a
4b5a: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
4b5e: 4267                     clr.w      -(a7)
4b60: a93a                     dc.w       $a93a
4b62: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
4b66: 4267                     clr.w      -(a7)
4b68: a93a                     dc.w       $a93a
4b6a: a937                     dc.w       $a937
4b6c: 600000ee                 bra.w      $4c5c
4b70: 2f2effde                 move.l     -$22(a6), -(a7)
4b74: 4ebacea0                 jsr        $1a16(pc)
4b78: 600000e2                 bra.w      $4c5c
4b7c: 600000de                 bra.w      $4c5c
4b80: 670000da                 beq.w      $4c5c
4b84: 5340                     subq.w     #$1, d0
4b86: 6700ff76                 beq.w      $4afe
4b8a: 5340                     subq.w     #$1, d0
4b8c: 6700ff78                 beq.w      $4b06
4b90: 5540                     subq.w     #$2, d0
4b92: 67dc                     beq.b      $4b70
4b94: 594f                     subq.w     #$4, a7
4b96: a924                     dc.w       $a924
4b98: 201f                     move.l     (a7)+, d0
4b9a: b0aeffde                 cmp.l      -$22(a6), d0
4b9e: 670a                     beq.b      $4baa
4ba0: 2f2effde                 move.l     -$22(a6), -(a7)
4ba4: a91f                     dc.w       $a91f
4ba6: 600000b4                 bra.w      $4c5c
4baa: 4aadbe2a                 tst.l      -$41d6(a5)
4bae: 670000ac                 beq.w      $4c5c
4bb2: 3006                     move.w     d6, d0
4bb4: 60000090                 bra.w      $4c46
4bb8: 554f                     subq.w     #$2, a7
4bba: 2f2effde                 move.l     -$22(a6), -(a7)
4bbe: 2f2dbdd4                 move.l     -$422c(a5), -(a7)
4bc2: a91e                     dc.w       $a91e
4bc4: 4a1f                     tst.b      (a7)+
4bc6: 67000094                 beq.w      $4c5c
4bca: 4ebaeb6e                 jsr        $373a(pc)
4bce: 6000008c                 bra.w      $4c5c
4bd2: 594f                     subq.w     #$4, a7
4bd4: 2eb809ee                 move.l     $9ee.w, (a7)
4bd8: 205f                     movea.l    (a7)+, a0
4bda: 2050                     movea.l    (a0), a0
4bdc: 41e80002                 lea.l      $2(a0), a0
4be0: 43eeffe2                 lea.l      -$1e(a6), a1
4be4: 22d8                     move.l     (a0)+, (a1)+
4be6: 22d8                     move.l     (a0)+, (a1)+
4be8: 486effe2                 pea.l      -$1e(a6)
4bec: 3f3c0064                 move.w     #$64, -(a7)
4bf0: 3f3c0064                 move.w     #$64, -(a7)
4bf4: 3f2df908                 move.w     -$6f8(a5), -(a7)
4bf8: 3f2df90a                 move.w     -$6f6(a5), -(a7)
4bfc: a8a7                     dc.w       $a8a7
4bfe: 594f                     subq.w     #$4, a7
4c00: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
4c04: 2f2dbdd4                 move.l     -$422c(a5), -(a7)
4c08: 486effe2                 pea.l      -$1e(a6)
4c0c: a92b                     dc.w       $a92b
4c0e: 2e1f                     move.l     (a7)+, d7
4c10: 4a87                     tst.l      d7
4c12: 6748                     beq.b      $4c5c
4c14: 3f07                     move.w     d7, -(a7)
4c16: 2007                     move.l     d7, d0
4c18: 4840                     swap       d0
4c1a: 3f00                     move.w     d0, -(a7)
4c1c: 4227                     clr.b      -(a7)
4c1e: 4ebacc32                 jsr        $1852(pc)
4c22: 6038                     bra.b      $4c5c
4c24: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
4c28: 3f3c0007                 move.w     #$7, -(a7)
4c2c: 4ebad228                 jsr        $1e56(pc)
4c30: 602a                     bra.b      $4c5c
4c32: 2f2dbe2a                 move.l     -$41d6(a5), -(a7)
4c36: 3f3c0008                 move.w     #$8, -(a7)
4c3a: 4ebad21a                 jsr        $1e56(pc)
4c3e: 601c                     bra.b      $4c5c
4c40: 4ebafdec                 jsr        $4a2e(pc)
4c44: 6016                     bra.b      $4c5c
4c46: 5740                     subq.w     #$3, d0
4c48: 67f6                     beq.b      $4c40
4c4a: 5540                     subq.w     #$2, d0
4c4c: 6784                     beq.b      $4bd2
4c4e: 5340                     subq.w     #$1, d0
4c50: 6700ff66                 beq.w      $4bb8
4c54: 5340                     subq.w     #$1, d0
4c56: 67cc                     beq.b      $4c24
4c58: 5340                     subq.w     #$1, d0
4c5a: 67d6                     beq.b      $4c32
4c5c: 4cdf18c0                 movem.l    (a7)+, d6-d7/a3-a4
4c60: 4e5e                     unlk       a6
4c62: 4e75                     rts        
4c64: 4e56ffee                 link.w     a6, #$ffee
4c68: 48e70108                 movem.l    d7/a4, -(a7)
4c6c: 202dbdcc                 move.l     -$4234(a5), d0
4c70: 0280000000ff             andi.l     #$ff, d0
4c76: 2b40bdcc                 move.l     d0, -$4234(a5)
4c7a: 302dbdd8                 move.w     -$4228(a5), d0
4c7e: 02400100                 andi.w     #$100, d0
4c82: 0c400100                 cmpi.w     #$100, d0
4c86: 6608                     bne.b      $4c90
4c88: 4ebafd08                 jsr        $4992(pc)
4c8c: 60000140                 bra.w      $4dce
4c90: 4aadc030                 tst.l      -$3fd0(a5)
4c94: 660a                     bne.b      $4ca0
4c96: 3f3c0005                 move.w     #$5, -(a7)
4c9a: a9c8                     dc.w       $a9c8
4c9c: 60000130                 bra.w      $4dce
4ca0: 206dc030                 movea.l    -$3fd0(a5), a0
4ca4: 2850                     movea.l    (a0), a4
4ca6: 3e2dbdce                 move.w     -$4232(a5), d7
4caa: 0c140001                 cmpi.b     #$1, (a4)
4cae: 660a                     bne.b      $4cba
4cb0: 3f3c0005                 move.w     #$5, -(a7)
4cb4: a9c8                     dc.w       $a9c8
4cb6: 60000116                 bra.w      $4dce
4cba: 302dbdd8                 move.w     -$4228(a5), d0
4cbe: 02400200                 andi.w     #$200, d0
4cc2: 0c400200                 cmpi.w     #$200, d0
4cc6: 57c0                     seq.b      d0
4cc8: be6dbdbe                 cmp.w      -$4242(a5), d7
4ccc: 57c1                     seq.b      d1
4cce: c001                     and.b      d1, d0
4cd0: 6714                     beq.b      $4ce6
4cd2: 2f2c0002                 move.l     $2(a4), -(a7)
4cd6: 4ebabbc4                 jsr        $89c(pc)
4cda: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
4cde: 4ebacde4                 jsr        $1ac4(pc)
4ce2: 600000ea                 bra.w      $4dce
4ce6: 0c470020                 cmpi.w     #$20, d7
4cea: 5dc0                     slt.b      d0
4cec: be6dbdba                 cmp.w      -$4246(a5), d7
4cf0: 56c1                     sne.b      d1
4cf2: c001                     and.b      d1, d0
4cf4: be6dbdbc                 cmp.w      -$4244(a5), d7
4cf8: 56c1                     sne.b      d1
4cfa: c001                     and.b      d1, d0
4cfc: be6dbdbe                 cmp.w      -$4242(a5), d7
4d00: 56c1                     sne.b      d1
4d02: c001                     and.b      d1, d0
4d04: 0c47001c                 cmpi.w     #$1c, d7
4d08: 5cc1                     sge.b      d1
4d0a: 0c47001f                 cmpi.w     #$1f, d7
4d0e: 5fc2                     sle.b      d2
4d10: c202                     and.b      d2, d1
4d12: 5201                     addq.b     #$1, d1
4d14: c001                     and.b      d1, d0
4d16: 670a                     beq.b      $4d22
4d18: 3f3c0005                 move.w     #$5, -(a7)
4d1c: a9c8                     dc.w       $a9c8
4d1e: 600000ae                 bra.w      $4dce
4d22: 206c0002                 movea.l    $2(a4), a0
4d26: 2050                     movea.l    (a0), a0
4d28: 0c687fff003c             cmpi.w     #$7fff, $3c(a0)
4d2e: 57c0                     seq.b      d0
4d30: be6dbdbc                 cmp.w      -$4244(a5), d7
4d34: 56c1                     sne.b      d1
4d36: c001                     and.b      d1, d0
4d38: 670a                     beq.b      $4d44
4d3a: 3f3c0005                 move.w     #$5, -(a7)
4d3e: a9c8                     dc.w       $a9c8
4d40: 6000008c                 bra.w      $4dce
4d44: 197c0001000a             move.b     #$1, $a(a4)
4d4a: 422c011a                 clr.b      $11a(a4)
4d4e: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
4d52: 3f3c0005                 move.w     #$5, -(a7)
4d56: 4a2c0014                 tst.b      $14(a4)
4d5a: 56c0                     sne.b      d0
4d5c: 4400                     neg.b      d0
4d5e: 1f00                     move.b     d0, -(a7)
4d60: 4ebab3ea                 jsr        $14c(pc)
4d64: 2f2dbdfa                 move.l     -$4206(a5), -(a7)
4d68: 3f3c0007                 move.w     #$7, -(a7)
4d6c: 4a2c0014                 tst.b      $14(a4)
4d70: 56c0                     sne.b      d0
4d72: 4400                     neg.b      d0
4d74: 1f00                     move.b     d0, -(a7)
4d76: 4ebab3d4                 jsr        $14c(pc)
4d7a: be6dbdbe                 cmp.w      -$4242(a5), d7
4d7e: 6624                     bne.b      $4da4
4d80: 206c0002                 movea.l    $2(a4), a0
4d84: 2050                     movea.l    (a0), a0
4d86: 3028003c                 move.w     $3c(a0), d0
4d8a: 5840                     addq.w     #$4, d0
4d8c: 0c407fff                 cmpi.w     #$7fff, d0
4d90: 6d08                     blt.b      $4d9a
4d92: 3f3c0005                 move.w     #$5, -(a7)
4d96: a9c8                     dc.w       $a9c8
4d98: 6028                     bra.b      $4dc2
4d9a: 2f2c0002                 move.l     $2(a4), -(a7)
4d9e: 4ebaba74                 jsr        $814(pc)
4da2: 601e                     bra.b      $4dc2
4da4: be6dbdba                 cmp.w      -$4246(a5), d7
4da8: 57c0                     seq.b      d0
4daa: c02dbdb9                 and.b      -$4247(a5), d0
4dae: 670a                     beq.b      $4dba
4db0: 2f2c0002                 move.l     $2(a4), -(a7)
4db4: 4ebabb9a                 jsr        $950(pc)
4db8: 6008                     bra.b      $4dc2
4dba: 3f07                     move.w     d7, -(a7)
4dbc: 2f2c0002                 move.l     $2(a4), -(a7)
4dc0: a9dc                     dc.w       $a9dc
4dc2: 2f2dc030                 move.l     -$3fd0(a5), -(a7)
4dc6: 4ebaccfc                 jsr        $1ac4(pc)
4dca: 4ebab4c8                 jsr        $294(pc)
4dce: 4cdf1080                 movem.l    (a7)+, d7/a4
4dd2: 4e5e                     unlk       a6
4dd4: 4e75                     rts        
4dd6: 4e56ffea                 link.w     a6, #$ffea
4dda: 4a6dbdcc                 tst.w      -$4234(a5)
4dde: 6726                     beq.b      $4e06
4de0: 3d7c006effec             move.w     #$6e, -$14(a6)
4de6: 3d7c0055ffea             move.w     #$55, -$16(a6)
4dec: 4ead01e2                 jsr        $1e2(a5) ; CODE 1 resource+0x0924
4df0: 554f                     subq.w     #$2, a7
4df2: 2f2effea                 move.l     -$16(a6), -(a7)
4df6: 2f2dbdcc                 move.l     -$4234(a5), -(a7)
4dfa: 4ead01f2                 jsr        $1f2(a5) ; CODE 1 resource+0x0934
4dfe: 3d5fffee                 move.w     (a7)+, -$12(a6)
4e02: 4ead01ea                 jsr        $1ea(a5) ; CODE 1 resource+0x092e
4e06: 4e5e                     unlk       a6
4e08: 4e75                     rts        
4e0a: 4e56ffde                 link.w     a6, #$ffde
4e0e: 48e70338                 movem.l    d6-d7/a2-a4, -(a7)
4e12: 7c01                     moveq      #$1, d6
4e14: 594f                     subq.w     #$4, a7
4e16: a924                     dc.w       $a924
4e18: 245f                     movea.l    (a7)+, a2
4e1a: 594f                     subq.w     #$4, a7
4e1c: 4ebaedfe                 jsr        $3c1c(pc)
4e20: 265f                     movea.l    (a7)+, a3
4e22: 0c6d0005bdca             cmpi.w     #$5, -$4236(a5)
4e28: 57c0                     seq.b      d0
4e2a: 0c6d0003bdca             cmpi.w     #$3, -$4236(a5)
4e30: 57c1                     seq.b      d1
4e32: 8001                     or.b       d1, d0
4e34: 670000aa                 beq.w      $4ee0
4e38: 202dbdcc                 move.l     -$4234(a5), d0
4e3c: 0280000000ff             andi.l     #$ff, d0
4e42: 2b40bdcc                 move.l     d0, -$4234(a5)
4e46: 302dbdd8                 move.w     -$4228(a5), d0
4e4a: 02400100                 andi.w     #$100, d0
4e4e: 0c400100                 cmpi.w     #$100, d0
4e52: 6610                     bne.b      $4e64
4e54: 4ebafb3c                 jsr        $4992(pc)
4e58: 2f0a                     move.l     a2, -(a7)
4e5a: 4ebab318                 jsr        $174(pc)
4e5e: 4206                     clr.b      d6
4e60: 6000007e                 bra.w      $4ee0
4e64: 3e2dbdce                 move.w     -$4232(a5), d7
4e68: 0c470020                 cmpi.w     #$20, d7
4e6c: 5dc0                     slt.b      d0
4e6e: be6dbdbc                 cmp.w      -$4244(a5), d7
4e72: 56c1                     sne.b      d1
4e74: c001                     and.b      d1, d0
4e76: be6dbdbe                 cmp.w      -$4242(a5), d7
4e7a: 56c1                     sne.b      d1
4e7c: c001                     and.b      d1, d0
4e7e: 6740                     beq.b      $4ec0
4e80: be6dbdba                 cmp.w      -$4246(a5), d7
4e84: 57c0                     seq.b      d0
4e86: be6dbdc0                 cmp.w      -$4240(a5), d7
4e8a: 57c1                     seq.b      d1
4e8c: 8001                     or.b       d1, d0
4e8e: 206dc02a                 movea.l    -$3fd6(a5), a0
4e92: 2050                     movea.l    (a0), a0
4e94: 4a280002                 tst.b      $2(a0)
4e98: 56c1                     sne.b      d1
4e9a: c001                     and.b      d1, d0
4e9c: 6718                     beq.b      $4eb6
4e9e: 554f                     subq.w     #$2, a7
4ea0: 2f0b                     move.l     a3, -(a7)
4ea2: 1f3c0001                 move.b     #$1, -(a7)
4ea6: 4ebaee6c                 jsr        $3d14(pc)
4eaa: 206dc02a                 movea.l    -$3fd6(a5), a0
4eae: 2050                     movea.l    (a0), a0
4eb0: 115f0203                 move.b     (a7)+, $203(a0)
4eb4: 6006                     bra.b      $4ebc
4eb6: 3f3c0005                 move.w     #$5, -(a7)
4eba: a9c8                     dc.w       $a9c8
4ebc: 4206                     clr.b      d6
4ebe: 6020                     bra.b      $4ee0
4ec0: 206a00a0                 movea.l    $a0(a2), a0
4ec4: 2050                     movea.l    (a0), a0
4ec6: 0c6800ff003c             cmpi.w     #$ff, $3c(a0)
4ecc: 5cc0                     sge.b      d0
4ece: be6dbdbc                 cmp.w      -$4244(a5), d7
4ed2: 56c1                     sne.b      d1
4ed4: c001                     and.b      d1, d0
4ed6: 6708                     beq.b      $4ee0
4ed8: 4206                     clr.b      d6
4eda: 3f3c0005                 move.w     #$5, -(a7)
4ede: a9c8                     dc.w       $a9c8
4ee0: 4a06                     tst.b      d6
4ee2: 670001f2                 beq.w      $50d6
4ee6: 554f                     subq.w     #$2, a7
4ee8: 486dbdca                 pea.l      -$4236(a5)
4eec: 486effe8                 pea.l      -$18(a6)
4ef0: 486effe6                 pea.l      -$1a(a6)
4ef4: a980                     dc.w       $a980
4ef6: 4a1f                     tst.b      (a7)+
4ef8: 6700016e                 beq.w      $5068
4efc: 2f2dc02a                 move.l     -$3fd6(a5), -(a7)
4f00: 205f                     movea.l    (a7)+, a0
4f02: a029                     dc.w       $a029
4f04: 206dc02a                 movea.l    -$3fd6(a5), a0
4f08: 2850                     movea.l    (a0), a4
4f0a: 1014                     move.b     (a4), d0
4f0c: 60000138                 bra.w      $5046
4f10: 302effe6                 move.w     -$1a(a6), d0
4f14: 604a                     bra.b      $4f60
4f16: 554f                     subq.w     #$2, a7
4f18: 2f0b                     move.l     a3, -(a7)
4f1a: 1f3c0001                 move.b     #$1, -(a7)
4f1e: 4ebaedf4                 jsr        $3d14(pc)
4f22: 195f0203                 move.b     (a7)+, $203(a4)
4f26: 6000012a                 bra.w      $5052
4f2a: 2f2c020c                 move.l     $20c(a4), -(a7)
4f2e: 4267                     clr.w      -(a7)
4f30: a963                     dc.w       $a963
4f32: 2f2c0210                 move.l     $210(a4), -(a7)
4f36: 3f3c0001                 move.w     #$1, -(a7)
4f3a: a963                     dc.w       $a963
4f3c: 422c0202                 clr.b      $202(a4)
4f40: 60000110                 bra.w      $5052
4f44: 2f2c0210                 move.l     $210(a4), -(a7)
4f48: 4267                     clr.w      -(a7)
4f4a: a963                     dc.w       $a963
4f4c: 2f2c020c                 move.l     $20c(a4), -(a7)
4f50: 3f3c0001                 move.w     #$1, -(a7)
4f54: a963                     dc.w       $a963
4f56: 197c00010202             move.b     #$1, $202(a4)
4f5c: 600000f4                 bra.w      $5052
4f60: 5340                     subq.w     #$1, d0
4f62: 67b2                     beq.b      $4f16
4f64: 5740                     subq.w     #$3, d0
4f66: 67dc                     beq.b      $4f44
4f68: 5340                     subq.w     #$1, d0
4f6a: 67be                     beq.b      $4f2a
4f6c: 600000e4                 bra.w      $5052
4f70: 302effe6                 move.w     -$1a(a6), d0
4f74: 600000ae                 bra.w      $5024
4f78: 554f                     subq.w     #$2, a7
4f7a: 2f0b                     move.l     a3, -(a7)
4f7c: 1f3c0001                 move.b     #$1, -(a7)
4f80: 4ebaed92                 jsr        $3d14(pc)
4f84: 195f0203                 move.b     (a7)+, $203(a4)
4f88: 600000c8                 bra.w      $5052
4f8c: 2f0b                     move.l     a3, -(a7)
4f8e: 4ebaf040                 jsr        $3fd0(pc)
4f92: 600000be                 bra.w      $5052
4f96: 2f0b                     move.l     a3, -(a7)
4f98: 4ebaf036                 jsr        $3fd0(pc)
4f9c: 554f                     subq.w     #$2, a7
4f9e: 2f0b                     move.l     a3, -(a7)
4fa0: 1f3c0001                 move.b     #$1, -(a7)
4fa4: 4ebaed6e                 jsr        $3d14(pc)
4fa8: 195f0203                 move.b     (a7)+, $203(a4)
4fac: 600000a4                 bra.w      $5052
4fb0: 206dbdc6                 movea.l    -$423a(a5), a0
4fb4: 2f10                     move.l     (a0), -(a7)
4fb6: a851                     dc.w       $a851
4fb8: 6006                     bra.b      $4fc0
4fba: 2f0b                     move.l     a3, -(a7)
4fbc: 4ebaf012                 jsr        $3fd0(pc)
4fc0: 554f                     subq.w     #$2, a7
4fc2: 2f0b                     move.l     a3, -(a7)
4fc4: 4227                     clr.b      -(a7)
4fc6: 4ebaed4c                 jsr        $3d14(pc)
4fca: 4a1f                     tst.b      (a7)+
4fcc: 66ec                     bne.b      $4fba
4fce: 2f0b                     move.l     a3, -(a7)
4fd0: 4ebacaf2                 jsr        $1ac4(pc)
4fd4: a850                     dc.w       $a850
4fd6: 6000007a                 bra.w      $5052
4fda: 2f2c020c                 move.l     $20c(a4), -(a7)
4fde: 4267                     clr.w      -(a7)
4fe0: a963                     dc.w       $a963
4fe2: 2f2c0210                 move.l     $210(a4), -(a7)
4fe6: 3f3c0001                 move.w     #$1, -(a7)
4fea: a963                     dc.w       $a963
4fec: 4a2c0202                 tst.b      $202(a4)
4ff0: 67000060                 beq.w      $5052
4ff4: 422c0203                 clr.b      $203(a4)
4ff8: 422c0202                 clr.b      $202(a4)
4ffc: 6054                     bra.b      $5052
4ffe: 2f2c0210                 move.l     $210(a4), -(a7)
5002: 4267                     clr.w      -(a7)
5004: a963                     dc.w       $a963
5006: 2f2c020c                 move.l     $20c(a4), -(a7)
500a: 3f3c0001                 move.w     #$1, -(a7)
500e: a963                     dc.w       $a963
5010: 102c0202                 move.b     $202(a4), d0
5014: 5300                     subq.b     #$1, d0
5016: 673a                     beq.b      $5052
5018: 422c0203                 clr.b      $203(a4)
501c: 197c00010202             move.b     #$1, $202(a4)
5022: 602e                     bra.b      $5052
5024: 5340                     subq.w     #$1, d0
5026: 6700ff50                 beq.w      $4f78
502a: 5b40                     subq.w     #$5, d0
502c: 6700ff68                 beq.w      $4f96
5030: 5340                     subq.w     #$1, d0
5032: 6700ff58                 beq.w      $4f8c
5036: 5340                     subq.w     #$1, d0
5038: 6700ff76                 beq.w      $4fb0
503c: 5340                     subq.w     #$1, d0
503e: 67be                     beq.b      $4ffe
5040: 5340                     subq.w     #$1, d0
5042: 6796                     beq.b      $4fda
5044: 600c                     bra.b      $5052
5046: 5500                     subq.b     #$2, d0
5048: 6700fec6                 beq.w      $4f10
504c: 5300                     subq.b     #$1, d0
504e: 6700ff20                 beq.w      $4f70
5052: 2f2dc02a                 move.l     -$3fd6(a5), -(a7)
5056: 205f                     movea.l    (a7)+, a0
5058: a02a                     dc.w       $a02a
505a: 4ebab238                 jsr        $294(pc)
505e: 2f0a                     move.l     a2, -(a7)
5060: 4ebab112                 jsr        $174(pc)
5064: 60000070                 bra.w      $50d6
5068: 302dbdca                 move.w     -$4236(a5), d0
506c: 605c                     bra.b      $50ca
506e: 4ebafa72                 jsr        $4ae2(pc)
5072: 60000062                 bra.w      $50d6
5076: 4ebac0fc                 jsr        $1174(pc)
507a: 605a                     bra.b      $50d6
507c: 4a2dbdb7                 tst.b      -$4249(a5)
5080: 6754                     beq.b      $50d6
5082: 206dc02a                 movea.l    -$3fd6(a5), a0
5086: 2050                     movea.l    (a0), a0
5088: 0c100002                 cmpi.b     #$2, (a0)
508c: 661e                     bne.b      $50ac
508e: 2f2effe8                 move.l     -$18(a6), -(a7)
5092: 3f3c0001                 move.w     #$1, -(a7)
5096: 206dc02a                 movea.l    -$3fd6(a5), a0
509a: 2050                     movea.l    (a0), a0
509c: 4a280002                 tst.b      $2(a0)
50a0: 56c0                     sne.b      d0
50a2: 4400                     neg.b      d0
50a4: 1f00                     move.b     d0, -(a7)
50a6: 4ebab994                 jsr        $a3c(pc)
50aa: 602a                     bra.b      $50d6
50ac: 2f2effe8                 move.l     -$18(a6), -(a7)
50b0: 3f3c0001                 move.w     #$1, -(a7)
50b4: 206dc02a                 movea.l    -$3fd6(a5), a0
50b8: 2050                     movea.l    (a0), a0
50ba: 4a280002                 tst.b      $2(a0)
50be: 56c0                     sne.b      d0
50c0: 4400                     neg.b      d0
50c2: 1f00                     move.b     d0, -(a7)
50c4: 4ebab976                 jsr        $a3c(pc)
50c8: 600c                     bra.b      $50d6
50ca: 5340                     subq.w     #$1, d0
50cc: 67a0                     beq.b      $506e
50ce: 5b40                     subq.w     #$5, d0
50d0: 67aa                     beq.b      $507c
50d2: 5540                     subq.w     #$2, d0
50d4: 67a0                     beq.b      $5076
50d6: 4cdf1cc0                 movem.l    (a7)+, d6-d7/a2-a4
50da: 4e5e                     unlk       a6
50dc: 4e75                     rts        
50de: 4e56fcd4                 link.w     a6, #$fcd4
50e2: 48e70718                 movem.l    d5-d7/a3-a4, -(a7)
50e6: 486effee                 pea.l      -$12(a6)
50ea: 486effec                 pea.l      -$14(a6)
50ee: 4ead01ca                 jsr        $1ca(a5) ; CODE 1 resource+0x087e
50f2: 0c6e0001ffee             cmpi.w     #$1, -$12(a6)
50f8: 66000128                 bne.w      $5222
50fc: 7a01                     moveq      #$1, d5
50fe: 0c6e0001ffec             cmpi.w     #$1, -$14(a6)
5104: 6f32                     ble.b      $5138
5106: 594f                     subq.w     #$4, a7
5108: 7078                     moveq      #$78, d0
510a: 2f00                     move.l     d0, -(a7)
510c: 4ead015a                 jsr        $15a(a5) ; CODE 1 resource+0x053a
5110: 285f                     movea.l    (a7)+, a4
5112: 2f3cc8000000             move.l     #$c8000000, -(a7)
5118: a8fd                     dc.w       $a8fd
511a: 2f0c                     move.l     a4, -(a7)
511c: 2f3c20040480             move.l     #$20040480, -(a7)
5122: a8fd                     dc.w       $a8fd
5124: 554f                     subq.w     #$2, a7
5126: 2f0c                     move.l     a4, -(a7)
5128: 2f3c32040488             move.l     #$32040488, -(a7)
512e: a8fd                     dc.w       $a8fd
5130: 101f                     move.b     (a7)+, d0
5132: 5300                     subq.b     #$1, d0
5134: 6702                     beq.b      $5138
5136: 4205                     clr.b      d5
5138: 7e01                     moveq      #$1, d7
513a: 600000c0                 bra.w      $51fc
513e: 3f07                     move.w     d7, -(a7)
5140: 486efee2                 pea.l      -$11e(a6)
5144: 4ead01d2                 jsr        $1d2(a5) ; CODE 1 resource+0x08a2
5148: 0cae54455854fee4         cmpi.l     #$54455854, -$11c(a6)
5150: 666c                     bne.b      $51be
5152: 4227                     clr.b      -(a7)
5154: 486efeea                 pea.l      -$116(a6)
5158: 3f2efee2                 move.w     -$11e(a6), -(a7)
515c: 4ebae24c                 jsr        $33aa(pc)
5160: 5246                     addq.w     #$1, d6
5162: 0c6e0001ffec             cmpi.w     #$1, -$14(a6)
5168: 6f16                     ble.b      $5180
516a: 2f0c                     move.l     a4, -(a7)
516c: 2f2df924                 move.l     -$6dc(a5), -(a7)
5170: 2f3c5804089c             move.l     #$5804089c, -(a7)
5176: a8fd                     dc.w       $a8fd
5178: 2f3cd0000000             move.l     #$d0000000, -(a7)
517e: a8fd                     dc.w       $a8fd
5180: 594f                     subq.w     #$4, a7
5182: 486dc03e                 pea.l      -$3fc2(a5)
5186: a917                     dc.w       $a917
5188: 265f                     movea.l    (a7)+, a3
518a: 2f0b                     move.l     a3, -(a7)
518c: 0c6e0001ffec             cmpi.w     #$1, -$14(a6)
5192: 57c0                     seq.b      d0
5194: 4400                     neg.b      d0
5196: 1f00                     move.b     d0, -(a7)
5198: 4ead0262                 jsr        $262(a5) ; CODE 5 resource+0x0958
519c: 3f07                     move.w     d7, -(a7)
519e: 4ead01da                 jsr        $1da(a5) ; CODE 1 resource+0x08e8
51a2: 6004                     bra.b      $51a8
51a4: 4ebabfce                 jsr        $1174(pc)
51a8: 554f                     subq.w     #$2, a7
51aa: 3f3c0100                 move.w     #$100, -(a7)
51ae: 486dbdca                 pea.l      -$4236(a5)
51b2: a970                     dc.w       $a970
51b4: 4a1f                     tst.b      (a7)+
51b6: 66ec                     bne.b      $51a4
51b8: 4ebae580                 jsr        $373a(pc)
51bc: 603c                     bra.b      $51fa
51be: 3d7c0122fde0             move.w     #$122, -$220(a6)
51c4: 486efcd4                 pea.l      -$32c(a6)
51c8: 486efde0                 pea.l      -$220(a6)
51cc: 486efeea                 pea.l      -$116(a6)
51d0: 486efde0                 pea.l      -$220(a6)
51d4: 487a014e                 pea.l      $5324(pc)
51d8: 3f3c0004                 move.w     #$4, -(a7)
51dc: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
51e0: 584f                     addq.w     #$4, a7
51e2: 3f3c00ff                 move.w     #$ff, -(a7)
51e6: 486efcd4                 pea.l      -$32c(a6)
51ea: 486efde2                 pea.l      -$21e(a6)
51ee: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
51f2: 486efde2                 pea.l      -$21e(a6)
51f6: 4ebab8ee                 jsr        $ae6(pc)
51fa: 5247                     addq.w     #$1, d7
51fc: be6effec                 cmp.w      -$14(a6), d7
5200: 5fc0                     sle.b      d0
5202: c005                     and.b      d5, d0
5204: 6600ff38                 bne.w      $513e
5208: 0c6e0001ffec             cmpi.w     #$1, -$14(a6)
520e: 6f06                     ble.b      $5216
5210: 2f0c                     move.l     a4, -(a7)
5212: 205f                     movea.l    (a7)+, a0
5214: a023                     dc.w       $a023
5216: 3f3c0081                 move.w     #$81, -(a7)
521a: 4ebae7ec                 jsr        $3a08(pc)
521e: 600000b6                 bra.w      $52d6
5222: 7e01                     moveq      #$1, d7
5224: 4246                     clr.w      d6
5226: 60000082                 bra.w      $52aa
522a: 3f07                     move.w     d7, -(a7)
522c: 486efee2                 pea.l      -$11e(a6)
5230: 4ead01d2                 jsr        $1d2(a5) ; CODE 1 resource+0x08a2
5234: 0cae54455854fee4         cmpi.l     #$54455854, -$11c(a6)
523c: 662e                     bne.b      $526c
523e: 4227                     clr.b      -(a7)
5240: 486efeea                 pea.l      -$116(a6)
5244: 3f2efee2                 move.w     -$11e(a6), -(a7)
5248: 4ebae160                 jsr        $33aa(pc)
524c: 3f07                     move.w     d7, -(a7)
524e: 4ead01da                 jsr        $1da(a5) ; CODE 1 resource+0x08e8
5252: 5246                     addq.w     #$1, d6
5254: 6004                     bra.b      $525a
5256: 4ebabf1c                 jsr        $1174(pc)
525a: 554f                     subq.w     #$2, a7
525c: 3f3c0100                 move.w     #$100, -(a7)
5260: 486dbdca                 pea.l      -$4236(a5)
5264: a970                     dc.w       $a970
5266: 4a1f                     tst.b      (a7)+
5268: 66ec                     bne.b      $5256
526a: 603c                     bra.b      $52a8
526c: 3d7c0122fde0             move.w     #$122, -$220(a6)
5272: 486efcd4                 pea.l      -$32c(a6)
5276: 486efde0                 pea.l      -$220(a6)
527a: 486efeea                 pea.l      -$116(a6)
527e: 486efde0                 pea.l      -$220(a6)
5282: 487a0088                 pea.l      $530c(pc)
5286: 3f3c0004                 move.w     #$4, -(a7)
528a: 4ead00aa                 jsr        $aa(a5) ; CODE 1 resource+0x0004
528e: 584f                     addq.w     #$4, a7
5290: 3f3c00ff                 move.w     #$ff, -(a7)
5294: 486efcd4                 pea.l      -$32c(a6)
5298: 486efde2                 pea.l      -$21e(a6)
529c: 4ead013a                 jsr        $13a(a5) ; CODE 1 resource+0x03e2
52a0: 486efde2                 pea.l      -$21e(a6)
52a4: 4ebab840                 jsr        $ae6(pc)
52a8: 5247                     addq.w     #$1, d7
52aa: be6effec                 cmp.w      -$14(a6), d7
52ae: 5fc0                     sle.b      d0
52b0: 0c460005                 cmpi.w     #$5, d6
52b4: 5dc1                     slt.b      d1
52b6: c001                     and.b      d1, d0
52b8: 6600ff70                 bne.w      $522a
52bc: be6effec                 cmp.w      -$14(a6), d7
52c0: 5fc0                     sle.b      d0
52c2: 0c6e0005ffec             cmpi.w     #$5, -$14(a6)
52c8: 5ec1                     sgt.b      d1
52ca: c001                     and.b      d1, d0
52cc: 6708                     beq.b      $52d6
52ce: 487a000e                 pea.l      $52de(pc)
52d2: 4ebab812                 jsr        $ae6(pc)
52d6: 4cdf18e0                 movem.l    (a7)+, d5-d7/a3-a4
52da: 4e5e                     unlk       a6
52dc: 4e75                     rts        
52de: 2d41206d                 move.l     d1, $206d(a6)
52e2: 6178                     bsr.b      $535c
52e4: 696d                     bvs.b      $5353
52e6: 756d                     .byte      0x75, 0x6d
52e8: 206f6620                 movea.l    $6620(a7), a0
52ec: 3520                     move.w     -(a0), -(a2)
52ee: 6669                     bne.b      $5359
52f0: 6c65                     bge.b      $5357
52f2: 7320                     .byte      0x73, 0x20
52f4: 6361                     bls.b      $5357
52f6: 6e20                     bgt.b      $5318
52f8: 6265                     bhi.b      $535f
52fa: 206f7065                 movea.l    $7065(a7), a0
52fe: 6e65                     bgt.b      $5365
5300: 6420                     bcc.b      $5322
5302: 6174                     bsr.b      $5378
5304: 2061                     movea.l    -(a1), a0
5306: 2074696d652e             movea.l    ([$652e, a4]), a0
530c: 1620                     move.b     -(a0), d3
530e: 6973                     bvs.b      $5383
5310: 206e6f74                 movea.l    $6f74(a6), a0
5314: 2061                     movea.l    -(a1), a0
5316: 2022                     move.l     -(a2), d0
5318: 5445                     addq.w     #$2, d5
531a: 5854                     addq.w     #$4, (a4)
531c: 2220                     move.l     -(a0), d1
531e: 6669                     bne.b      $5389
5320: 6c65                     bge.b      $5387
5322: 2e16                     move.l     (a6), d7
5324: 1620                     move.b     -(a0), d3
5326: 6973                     bvs.b      $539b
5328: 206e6f74                 movea.l    $6f74(a6), a0
532c: 2061                     movea.l    -(a1), a0
532e: 2022                     move.l     -(a2), d0
5330: 5445                     addq.w     #$2, d5
5332: 5854                     addq.w     #$4, (a4)
5334: 2220                     move.l     -(a0), d1
5336: 6669                     bne.b      $53a1
5338: 6c65                     bge.b      $539f
533a: 2e16                     move.l     (a6), d7
533c: 4e56ffee                 link.w     a6, #$ffee
5340: 2f07                     move.l     d7, -(a7)
5342: 486d009a                 pea.l      $9a(a5)
5346: 205f                     movea.l    (a7)+, a0
5348: a04b                     dc.w       $a04b
534a: 487a00a4                 pea.l      $53f0(pc)
534e: 487a009e                 pea.l      $53ee(pc)
5352: 4267                     clr.w      -(a7)
5354: 2f2dbe2e                 move.l     -$41d2(a5), -(a7)
5358: 486dbe1e                 pea.l      -$41e2(a5)
535c: 1f3c0001                 move.b     #$1, -(a7)
5360: 4ebac7c6                 jsr        $1b28(pc)
5364: 4ebafd78                 jsr        $50de(pc)
5368: 4227                     clr.b      -(a7)
536a: 4ebae81c                 jsr        $3b88(pc)
536e: a9b4                     dc.w       $a9b4
5370: 4ebab1dc                 jsr        $54e(pc)
5374: 554f                     subq.w     #$2, a7
5376: 3f3cffff                 move.w     #$ffff, -(a7)
537a: 486dbdca                 pea.l      -$4236(a5)
537e: a970                     dc.w       $a970
5380: 1e1f                     move.b     (a7)+, d7
5382: 554f                     subq.w     #$2, a7
5384: 486dbdca                 pea.l      -$4236(a5)
5388: a97f                     dc.w       $a97f
538a: 4a1f                     tst.b      (a7)+
538c: 6706                     beq.b      $5394
538e: 4ebafa7a                 jsr        $4e0a(pc)
5392: 6040                     bra.b      $53d4
5394: 4a07                     tst.b      d7
5396: 673c                     beq.b      $53d4
5398: 302dbdca                 move.w     -$4236(a5), d0
539c: 601e                     bra.b      $53bc
539e: 4ebaf742                 jsr        $4ae2(pc)
53a2: 6030                     bra.b      $53d4
53a4: 4ebaf8be                 jsr        $4c64(pc)
53a8: 602a                     bra.b      $53d4
53aa: 4ebabdc8                 jsr        $1174(pc)
53ae: 6024                     bra.b      $53d4
53b0: 4ebaad32                 jsr        $e4(pc)
53b4: 601e                     bra.b      $53d4
53b6: 4ebafa1e                 jsr        $4dd6(pc)
53ba: 6018                     bra.b      $53d4
53bc: 5340                     subq.w     #$1, d0
53be: 67de                     beq.b      $539e
53c0: 5540                     subq.w     #$2, d0
53c2: 67e0                     beq.b      $53a4
53c4: 5540                     subq.w     #$2, d0
53c6: 67dc                     beq.b      $53a4
53c8: 5340                     subq.w     #$1, d0
53ca: 67e4                     beq.b      $53b0
53cc: 5340                     subq.w     #$1, d0
53ce: 67e6                     beq.b      $53b6
53d0: 5340                     subq.w     #$1, d0
53d2: 67d6                     beq.b      $53aa
53d4: 4a2dbdb5                 tst.b      -$424b(a5)
53d8: 678e                     beq.b      $5368
53da: 594f                     subq.w     #$4, a7
53dc: 4ead022a                 jsr        $22a(a5) ; CODE 1 resource+0x0992
53e0: 4a9f                     tst.l      (a7)+
53e2: 6f04                     ble.b      $53e8
53e4: 4ebae6b2                 jsr        $3a98(pc)
53e8: 2e1f                     move.l     (a7)+, d7
53ea: 4e5e                     unlk       a6
53ec: 4e75                     rts        
53ee: 00000943                 ori.b      #$43, d0
53f2: 6c69                     bge.b      $545d
53f4: 7062                     moveq      #$62, d0
53f6: 6f61                     ble.b      $5459
53f8: 7264                     moveq      #$64, d1
53fa: 4ead00c2                 jsr        $c2(a5) ; CODE 1 resource+0x0092
53fe: 4ead014a                 jsr        $14a(a5) ; CODE 1 resource+0x052e
5402: 4ead00ca                 jsr        $ca(a5) ; CODE 1 resource+0x015a
5406: 4ead00fa                 jsr        $fa(a5) ; CODE 1 resource+0x01d8
540a: 4e560000                 link.w     a6, #$0
540e: 4ead0272                 jsr        $272(a5) ; CODE 5 resource+0x0d4c
5412: 4ead024a                 jsr        $24a(a5) ; CODE 2 resource+0x0070
5416: 486d024a                 pea.l      $24a(a5)
541a: a9f1                     dc.w       $a9f1
541c: 4ebaff1e                 jsr        $533c(pc)
5420: 4ead027a                 jsr        $27a(a5) ; CODE 5 resource+0x0e2e
5424: 4e5e                     unlk       a6
5426: 4ead00ba                 jsr        $ba(a5) ; CODE 1 resource+0x007c
