; CODE 1, 2620 bytes, resource-relative hexadecimal offsets.
; Linear sweep: embedded data may decode as instructions. Verify control flow.
0004: 302f0004                 move.w     $4(a7), d0
0008: 43ef0006                 lea.l      $6(a7), a1
000c: 3200                     move.w     d0, d1
000e: e549                     lsl.w      #$2, d1
0010: d2c1                     adda.w     d1, a1
0012: 2051                     movea.l    (a1), a0
0014: 2297                     move.l     (a7), (a1)
0016: 48e700e0                 movem.l    a0-a2, -(a7)
001a: 7200                     moveq      #$0, d1
001c: 5248                     addq.w     #$1, a0
001e: 601a                     bra.b      $3a
0020: 2461                     movea.l    -(a1), a2
0022: 7400                     moveq      #$0, d2
0024: 141a                     move.b     (a2)+, d2
0026: d202                     add.b      d2, d1
0028: 640c                     bcc.b      $36
002a: 9401                     sub.b      d1, d2
002c: 5302                     subq.b     #$1, d2
002e: 7000                     moveq      #$0, d0
0030: 72ff                     moveq      #$ff, d1
0032: 6002                     bra.b      $36
0034: 10da                     move.b     (a2)+, (a0)+
0036: 51cafffc                 dbra       d2, $34
003a: 51c8ffe4                 dbra       d0, $20
003e: 4cdf0700                 movem.l    (a7)+, a0-a2
0042: 1081                     move.b     d1, (a0)
0044: 2e49                     movea.l    a1, a7
0046: 5241                     addq.w     #$1, d1
0048: 2057                     movea.l    (a7), a0
004a: 4ed0                     jmp        (a0)
004c: 4e560000                 link.w     a6, #$0
0050: 41fa001a                 lea.l      $6c(pc), a0
0054: 48edddf8bc68             movem.l    d3-d7/a0/a2-a4/a6-a7, -$4398(a5)
005a: 226e000c                 movea.l    $c(a6), a1
005e: 2011                     move.l     (a1), d0
0060: 6712                     beq.b      $74
0062: 2040                     movea.l    d0, a0
0064: a01f                     dc.w       $a01f
0066: 4eba0414                 jsr        $47c(pc)
006a: 4291                     clr.l      (a1)
006c: 4e5e                     unlk       a6
006e: 205f                     movea.l    (a7)+, a0
0070: 508f                     addq.l     #$8, a7
0072: 4ed0                     jmp        (a0)
0074: 303c000b                 move.w     #$b, d0
0078: 4eba0402                 jsr        $47c(pc)
007c: 202dbc58                 move.l     -$43a8(a5), d0
0080: 6704                     beq.b      $86
0082: 2040                     movea.l    d0, a0
0084: 4e90                     jsr        (a0)
0086: 202dbdae                 move.l     -$4252(a5), d0
008a: 6704                     beq.b      $90
008c: 2040                     movea.l    d0, a0
008e: 4e90                     jsr        (a0)
0090: a9f4                     dc.w       $a9f4
0092: 4eba004e                 jsr        $e2(pc)
0096: 2c4d                     movea.l    a5, a6
0098: 536dffde                 subq.w     #$1, -$22(a5)
009c: 3b7c0002ffdc             move.w     #$2, -$24(a5)
00a2: 426dffd6                 clr.w      -$2a(a5)
00a6: 42adbc58                 clr.l      -$43a8(a5)
00aa: 42adbc5c                 clr.l      -$43a4(a5)
00ae: 42adbc60                 clr.l      -$43a0(a5)
00b2: 42adbc64                 clr.l      -$439c(a5)
00b6: 426dbc94                 clr.w      -$436c(a5)
00ba: 426dbc96                 clr.w      -$436a(a5)
00be: 50edbc98                 st.b       -$4368(a5)
00c2: 50edbc99                 st.b       -$4367(a5)
00c6: 51edbc9a                 sf.b       -$4366(a5)
00ca: 51edbc9b                 sf.b       -$4365(a5)
00ce: 42adbdae                 clr.l      -$4252(a5)
00d2: 303c07d0                 move.w     #$7d0, d0
00d6: 4eba0392                 jsr        $46a(pc)
00da: 2050                     movea.l    (a0), a0
00dc: 2b48bc54                 move.l     a0, -$43ac(a5)
00e0: 4e75                     rts        
00e2: 598f                     subq.l     #$4, a7
00e4: 2f3c5a45524f             move.l     #$5a45524f, -(a7)
00ea: 4267                     clr.w      -(a7)
00ec: a9a0                     dc.w       $a9a0
00ee: 2017                     move.l     (a7), d0
00f0: 670e                     beq.b      $100
00f2: 4267                     clr.w      -(a7)
00f4: 2f00                     move.l     d0, -(a7)
00f6: a9a4                     dc.w       $a9a4
00f8: 301f                     move.w     (a7)+, d0
00fa: b0780900                 cmp.w      $900.w, d0
00fe: 6704                     beq.b      $104
0100: 588f                     addq.l     #$4, a7
0102: 4e75                     rts        
0104: 2457                     movea.l    (a7), a2
0106: 598f                     subq.l     #$4, a7
0108: 2f3c44415441             move.l     #$44415441, -(a7)
010e: 4267                     clr.w      -(a7)
0110: a9a0                     dc.w       $a9a0
0112: 2057                     movea.l    (a7), a0
0114: 2050                     movea.l    (a0), a0
0116: 22780908                 movea.l    $908.w, a1
011a: 2452                     movea.l    (a2), a2
011c: 600e                     bra.b      $12c
011e: 32d8                     move.w     (a0)+, (a1)+
0120: 660a                     bne.b      $12c
0122: 321a                     move.w     (a2)+, d1
0124: 6002                     bra.b      $128
0126: 4259                     clr.w      (a1)+
0128: 51c9fffc                 dbra       d1, $126
012c: bbc9                     cmpa.l     a1, a5
012e: 66ee                     bne.b      $11e
0130: a9a3                     dc.w       $a9a3
0132: a9a3                     dc.w       $a9a3
0134: 598f                     subq.l     #$4, a7
0136: 2f3c4452454c             move.l     #$4452454c, -(a7)
013c: 4267                     clr.w      -(a7)
013e: a9a0                     dc.w       $a9a0
0140: 2057                     movea.l    (a7), a0
0142: a025                     dc.w       $a025
0144: 2050                     movea.l    (a0), a0
0146: e240                     asr.w      #$1, d0
0148: 240d                     move.l     a5, d2
014a: 6006                     bra.b      $152
014c: 3218                     move.w     (a0)+, d1
014e: d5b51000                 add.l      d2, (a5, d1.w)
0152: 51c8fff8                 dbra       d0, $14c
0156: a9a3                     dc.w       $a9a3
0158: 4e75                     rts        
015a: 487a0010                 pea.l      $16c(pc)
015e: 3f3c0001                 move.w     #$1, -(a7)
0162: a9eb                     dc.w       $a9eb
0164: 4e75                     rts        
0166: 487a0006                 pea.l      $16e(pc)
016a: 60f2                     bra.b      $15e
016c: 0000000d                 ori.b      #$d, d0
0170: 4e560000                 link.w     a6, #$0
0174: 41fa001a                 lea.l      $190(pc), a0
0178: 48edddf8bc68             movem.l    d3-d7/a0/a2-a4/a6-a7, -$4398(a5)
017e: 202e0008                 move.l     $8(a6), d0
0182: 226e000c                 movea.l    $c(a6), a1
0186: 4291                     clr.l      (a1)
0188: a31e                     dc.w       $a31e
018a: 4eba02f0                 jsr        $47c(pc)
018e: 2288                     move.l     a0, (a1)
0190: 4e5e                     unlk       a6
0192: 205f                     movea.l    (a7)+, a0
0194: 508f                     addq.l     #$8, a7
0196: 4ed0                     jmp        (a0)
0198: 7218                     moveq      #$18, d1
019a: 600e                     bra.b      $1aa
019c: 721a                     moveq      #$1a, d1
019e: 600a                     bra.b      $1aa
01a0: 721e                     moveq      #$1e, d1
01a2: 6006                     bra.b      $1aa
01a4: 7200                     moveq      #$0, d1
01a6: 6002                     bra.b      $1aa
01a8: 7208                     moveq      #$8, d1
01aa: 201f                     move.l     (a7)+, d0
01ac: 205f                     movea.l    (a7)+, a0
01ae: 2257                     movea.l    (a7), a1
01b0: 2f00                     move.l     d0, -(a7)
01b2: 2f09                     move.l     a1, -(a7)
01b4: 22d8                     move.l     (a0)+, (a1)+
01b6: 22d8                     move.l     (a0)+, (a1)+
01b8: 32d8                     move.w     (a0)+, (a1)+
01ba: 3f01                     move.w     d1, -(a7)
01bc: a9ec                     dc.w       $a9ec
01be: 4e75                     rts        
01c0: 201f                     move.l     (a7)+, d0
01c2: 205f                     movea.l    (a7)+, a0
01c4: 2257                     movea.l    (a7), a1
01c6: 2f00                     move.l     d0, -(a7)
01c8: 2f09                     move.l     a1, -(a7)
01ca: 22d8                     move.l     (a0)+, (a1)+
01cc: 22d8                     move.l     (a0)+, (a1)+
01ce: 32d8                     move.w     (a0)+, (a1)+
01d0: 3f3c0012                 move.w     #$12, -(a7)
01d4: a9eb                     dc.w       $a9eb
01d6: 4e75                     rts        
01d8: 486dffca                 pea.l      -$36(a5)
01dc: a86e                     dc.w       $a86e
01de: a8fe                     dc.w       $a8fe
01e0: a912                     dc.w       $a912
01e2: a930                     dc.w       $a930
01e4: a9cc                     dc.w       $a9cc
01e6: 487a001c                 pea.l      $204(pc)
01ea: a97b                     dc.w       $a97b
01ec: 204f                     movea.l    a7, a0
01ee: 226dbc54                 movea.l    -$43ac(a5), a1
01f2: 91d1                     suba.l     (a1), a0
01f4: a02d                     dc.w       $a02d
01f6: 4eba0728                 jsr        $920(pc)
01fa: 7209                     moveq      #$9, d1
01fc: a036                     dc.w       $a036
01fe: 51c9fffc                 dbra       d1, $1fc
0202: 4e75                     rts        
0204: a9f4                     dc.w       $a9f4
0206: 7200                     moveq      #$0, d1
0208: 6002                     bra.b      $20c
020a: 72ff                     moveq      #$ff, d1
020c: 4e56fff4                 link.w     a6, #$fff4
0210: 486efff4                 pea.l      -$c(a6)
0214: 3f3c0017                 move.w     #$17, -(a7)
0218: a9eb                     dc.w       $a9eb
021a: 3f3c6000                 move.w     #$6000, -(a7)
021e: 4857                     pea.l      (a7)
0220: 3f3c0001                 move.w     #$1, -(a7)
0224: a9eb                     dc.w       $a9eb
0226: 544f                     addq.w     #$2, a7
0228: 41eefff6                 lea.l      -$a(a6), a0
022c: 226e0008                 movea.l    $8(a6), a1
0230: 20d9                     move.l     (a1)+, (a0)+
0232: 20d9                     move.l     (a1)+, (a0)+
0234: 3091                     move.w     (a1), (a0)
0236: 5148                     subq.w     #$8, a0
0238: 43ee000c                 lea.l      $c(a6), a1
023c: 613e                     bsr.b      $27c
023e: 3f3c0004                 move.w     #$4, -(a7)
0242: 4857                     pea.l      (a7)
0244: 3f3c001b                 move.w     #$1b, -(a7)
0248: a9eb                     dc.w       $a9eb
024a: c21f                     and.b      (a7)+, d1
024c: 671c                     beq.b      $26a
024e: 7200                     moveq      #$0, d1
0250: 08900007                 bclr.b     #$7, (a0)
0254: 6704                     beq.b      $25a
0256: 123c0080                 move.b     #$80, d1
025a: 487a002c                 pea.l      $288(pc)
025e: 4850                     pea.l      (a0)
0260: 3f3c1000                 move.w     #$1000, -(a7)
0264: a9eb                     dc.w       $a9eb
0266: 8310                     or.b       d1, (a0)
0268: 6112                     bsr.b      $27c
026a: 486efff4                 pea.l      -$c(a6)
026e: 3f3c0019                 move.w     #$19, -(a7)
0272: a9eb                     dc.w       $a9eb
0274: 4e5e                     unlk       a6
0276: 205f                     movea.l    (a7)+, a0
0278: 584f                     addq.w     #$4, a7
027a: 4ed0                     jmp        (a0)
027c: 4850                     pea.l      (a0)
027e: 4851                     pea.l      (a1)
0280: 3f3c2810                 move.w     #$2810, -(a7)
0284: a9eb                     dc.w       $a9eb
0286: 4e75                     rts        
0288: 3f00                     move.w     d0, -(a7)
028a: 000048e7                 ori.b      #$e7, d0
028e: e0c0                     .byte      0xe0, 0xc0
0290: 226f0018                 movea.l    $18(a7), a1
0294: 206f001c                 movea.l    $1c(a7), a0
0298: 2f6f0014001c             move.l     $14(a7), $1c(a7)
029e: 7000                     moveq      #$0, d0
02a0: 1018                     move.b     (a0)+, d0
02a2: 3400                     move.w     d0, d2
02a4: 1219                     move.b     (a1)+, d1
02a6: b200                     cmp.b      d0, d1
02a8: 6402                     bcc.b      $2ac
02aa: 1401                     move.b     d1, d2
02ac: 5342                     subq.w     #$1, d2
02ae: 6d08                     blt.b      $2b8
02b0: b308                     cmpm.b     (a0)+, (a1)+
02b2: 56cafffc                 dbne       d2, $2b0
02b6: 6602                     bne.b      $2ba
02b8: b200                     cmp.b      d0, d1
02ba: 4cdf0307                 movem.l    (a7)+, d0-d2/a0-a1
02be: 508f                     addq.l     #$8, a7
02c0: 4e75                     rts        
02c2: 584f                     addq.w     #$4, a7
02c4: 245f                     movea.l    (a7)+, a2
02c6: 301f                     move.w     (a7)+, d0
02c8: 670c                     beq.b      $2d6
02ca: 5340                     subq.w     #$1, d0
02cc: 2c6e0008                 movea.l    $8(a6), a6
02d0: 51c8fffa                 dbra       d0, $2cc
02d4: 6006                     bra.b      $2dc
02d6: 2c56                     movea.l    (a6), a6
02d8: bbd6                     cmpa.l     (a6), a5
02da: 66fa                     bne.b      $2d6
02dc: 202dbc5c                 move.l     -$43a4(a5), d0
02e0: 6704                     beq.b      $2e6
02e2: 2040                     movea.l    d0, a0
02e4: 4e90                     jsr        (a0)
02e6: 2e6efffc                 movea.l    -$4(a6), a7
02ea: 4ed2                     jmp        (a2)
02ec: 2f01                     move.l     d1, -(a7)
02ee: 222f0008                 move.l     $8(a7), d1
02f2: 2f6f00040008             move.l     $4(a7), $8(a7)
02f8: 2f400004                 move.l     d0, $4(a7)
02fc: 202f000c                 move.l     $c(a7), d0
0300: 48e73100                 movem.l    d2-d3/d7, -(a7)
0304: 4eba0190                 jsr        $496(pc)
0308: 4cdf008c                 movem.l    (a7)+, d2-d3/d7
030c: 2f40000c                 move.l     d0, $c(a7)
0310: 221f                     move.l     (a7)+, d1
0312: 201f                     move.l     (a7)+, d0
0314: 4e75                     rts        
0316: 2f01                     move.l     d1, -(a7)
0318: 222f0008                 move.l     $8(a7), d1
031c: 2f6f00040008             move.l     $4(a7), $8(a7)
0322: 2f400004                 move.l     d0, $4(a7)
0326: 202f000c                 move.l     $c(a7), d0
032a: 48e73c00                 movem.l    d2-d5, -(a7)
032e: 2400                     move.l     d0, d2
0330: 2601                     move.l     d1, d3
0332: 4842                     swap       d2
0334: c4c3                     mulu.w     d3, d2
0336: 2800                     move.l     d0, d4
0338: 2a01                     move.l     d1, d5
033a: 4845                     swap       d5
033c: c8c5                     mulu.w     d5, d4
033e: d444                     add.w      d4, d2
0340: 4842                     swap       d2
0342: 4242                     clr.w      d2
0344: c0c1                     mulu.w     d1, d0
0346: d082                     add.l      d2, d0
0348: 4cdf003c                 movem.l    (a7)+, d2-d5
034c: 2f40000c                 move.l     d0, $c(a7)
0350: 221f                     move.l     (a7)+, d1
0352: 201f                     move.l     (a7)+, d0
0354: 4e75                     rts        
0356: 48e7c0c0                 movem.l    d0-d1/a0-a1, -(a7)
035a: 322f0014                 move.w     $14(a7), d1
035e: 206f0016                 movea.l    $16(a7), a0
0362: 2248                     movea.l    a0, a1
0364: 7000                     moveq      #$0, d0
0366: 22c0                     move.l     d0, (a1)+
0368: 22c0                     move.l     d0, (a1)+
036a: 22c0                     move.l     d0, (a1)+
036c: 22c0                     move.l     d0, (a1)+
036e: 22c0                     move.l     d0, (a1)+
0370: 22c0                     move.l     d0, (a1)+
0372: 22c0                     move.l     d0, (a1)+
0374: 22c0                     move.l     d0, (a1)+
0376: 226f001a                 movea.l    $1a(a7), a1
037a: 5341                     subq.w     #$1, d1
037c: 671e                     beq.b      $39c
037e: 701f                     moveq      #$1f, d0
0380: 9041                     sub.w      d1, d0
0382: e249                     lsr.w      #$1, d1
0384: 41f00000                 lea.l      (a0, d0.w), a0
0388: 30d9                     move.w     (a1)+, (a0)+
038a: 51c9fffc                 dbra       d1, $388
038e: 4cdf0303                 movem.l    (a7)+, d0-d1/a0-a1
0392: 2f57000a                 move.l     (a7), $a(a7)
0396: 4fef000a                 lea.l      $a(a7), a7
039a: 4e75                     rts        
039c: 1159001f                 move.b     (a1)+, $1f(a0)
03a0: 60ec                     bra.b      $38e
03a2: 48e7c080                 movem.l    d0-d1/a0, -(a7)
03a6: 206f0010                 movea.l    $10(a7), a0
03aa: 302f0014                 move.w     $14(a7), d0
03ae: 6b20                     bmi.b      $3d0
03b0: 0c4000ff                 cmpi.w     #$ff, d0
03b4: 6e1a                     bgt.b      $3d0
03b6: 721f                     moveq      #$1f, d1
03b8: e648                     lsr.w      #$3, d0
03ba: 9240                     sub.w      d0, d1
03bc: 302f0014                 move.w     $14(a7), d0
03c0: 02400007                 andi.w     #$7, d0
03c4: 2f6f000c0012             move.l     $c(a7), $12(a7)
03ca: 01301000                 btst.l     d0, (a0, d1.w)
03ce: 600a                     bra.b      $3da
03d0: 2f6f000c0012             move.l     $c(a7), $12(a7)
03d6: 7000                     moveq      #$0, d0
03d8: 4a00                     tst.b      d0
03da: 4cdf0103                 movem.l    (a7)+, d0-d1/a0
03de: 5c4f                     addq.w     #$6, a7
03e0: 4e75                     rts        
03e2: 2f0a                     move.l     a2, -(a7)
03e4: 226f0008                 movea.l    $8(a7), a1
03e8: 246f000c                 movea.l    $c(a7), a2
03ec: 302f0010                 move.w     $10(a7), d0
03f0: 3400                     move.w     d0, d2
03f2: 121a                     move.b     (a2)+, d1
03f4: b202                     cmp.b      d2, d1
03f6: 6402                     bcc.b      $3fa
03f8: 1401                     move.b     d1, d2
03fa: 12c2                     move.b     d2, (a1)+
03fc: 6002                     bra.b      $400
03fe: 12da                     move.b     (a2)+, (a1)+
0400: 51cafffc                 dbra       d2, $3fe
0404: b001                     cmp.b      d1, d0
0406: 245f                     movea.l    (a7)+, a2
0408: 205f                     movea.l    (a7)+, a0
040a: 4fef000a                 lea.l      $a(a7), a7
040e: 4ed0                     jmp        (a0)
0410: 588f                     addq.l     #$4, a7
0412: 301f                     move.w     (a7)+, d0
0414: 4267                     clr.w      -(a7)
0416: 3f00                     move.w     d0, -(a7)
0418: 202dbc60                 move.l     -$43a0(a5), d0
041c: 671a                     beq.b      $438
041e: 2040                     movea.l    d0, a0
0420: 202dbc64                 move.l     -$439c(a5), d0
0424: 6702                     beq.b      $428
0426: 2f00                     move.l     d0, -(a7)
0428: 4e90                     jsr        (a0)
042a: 4a57                     tst.w      (a7)
042c: 660a                     bne.b      $438
042e: 4cedddf8bc68             movem.l    -$4398(a5), d3-d7/a0/a2-a4/a6-a7
0434: 4ed0                     jmp        (a0)
0436: 3f00                     move.w     d0, -(a7)
0438: 303c07d1                 move.w     #$7d1, d0
043c: 4eba002c                 jsr        $46a(pc)
0440: 660a                     bne.b      $44c
0442: 303c07d2                 move.w     #$7d2, d0
0446: 4eba0022                 jsr        $46a(pc)
044a: 6708                     beq.b      $454
044c: 2050                     movea.l    (a0), a0
044e: 4e90                     jsr        (a0)
0450: 4efafc2a                 jmp        $7c(pc)
0454: 487a0006                 pea.l      $45c(pc)
0458: abff                     dc.w       $abff
045a: a9f4                     dc.w       $a9f4
045c: 0d52                     bchg.b     d6, (a2)
045e: 554e                     subq.w     #$2, a6
0460: 5449                     addq.w     #$2, a1
0462: 4d45                     .byte      0x4d, 0x45
0464: 2045                     movea.l    d5, a0
0466: 5252                     addq.w     #$1, (a2)
0468: 4f52                     .byte      0x4f, 0x52
046a: 598f                     subq.l     #$4, a7
046c: 2f3c4c535020             move.l     #$4c535020, -(a7)
0472: 3f00                     move.w     d0, -(a7)
0474: a9a0                     dc.w       $a9a0
0476: 205f                     movea.l    (a7)+, a0
0478: 2008                     move.l     a0, d0
047a: 4e75                     rts        
047c: 3b40bc94                 move.w     d0, -$436c(a5)
0480: 6602                     bne.b      $484
0482: 4e75                     rts        
0484: 4a2dbc98                 tst.b      -$4368(a5)
0488: 6704                     beq.b      $48e
048a: 4efaff88                 jmp        $414(pc)
048e: 4cedddf8bc68             movem.l    -$4398(a5), d3-d7/a0/a2-a4/a6-a7
0494: 4ed0                     jmp        (a0)
0496: 4a80                     tst.l      d0
0498: 6a1c                     bpl.b      $4b6
049a: 4a81                     tst.l      d1
049c: 6a0c                     bpl.b      $4aa
049e: 4480                     neg.l      d0
04a0: 4481                     neg.l      d1
04a2: 4eba0020                 jsr        $4c4(pc)
04a6: 4481                     neg.l      d1
04a8: 4e75                     rts        
04aa: 4480                     neg.l      d0
04ac: 4eba0016                 jsr        $4c4(pc)
04b0: 4480                     neg.l      d0
04b2: 4481                     neg.l      d1
04b4: 4e75                     rts        
04b6: 4a81                     tst.l      d1
04b8: 6a0a                     bpl.b      $4c4
04ba: 4481                     neg.l      d1
04bc: 4eba0006                 jsr        $4c4(pc)
04c0: 4480                     neg.l      d0
04c2: 4e75                     rts        
04c4: 2e3c0000ffff             move.l     #$ffff, d7
04ca: b280                     cmp.l      d0, d1
04cc: 6306                     bls.b      $4d4
04ce: 2200                     move.l     d0, d1
04d0: 7000                     moveq      #$0, d0
04d2: 4e75                     rts        
04d4: b087                     cmp.l      d7, d0
04d6: 620c                     bhi.b      $4e4
04d8: 80c1                     divu.w     d1, d0
04da: 4840                     swap       d0
04dc: 3200                     move.w     d0, d1
04de: 4240                     clr.w      d0
04e0: 4840                     swap       d0
04e2: 4e75                     rts        
04e4: b287                     cmp.l      d7, d1
04e6: 621a                     bhi.b      $502
04e8: 2e00                     move.l     d0, d7
04ea: 4240                     clr.w      d0
04ec: 4840                     swap       d0
04ee: 80c1                     divu.w     d1, d0
04f0: 4840                     swap       d0
04f2: 4847                     swap       d7
04f4: 3e00                     move.w     d0, d7
04f6: 4847                     swap       d7
04f8: 8ec1                     divu.w     d1, d7
04fa: 3007                     move.w     d7, d0
04fc: 4847                     swap       d7
04fe: 3207                     move.w     d7, d1
0500: 4e75                     rts        
0502: 2400                     move.l     d0, d2
0504: 2601                     move.l     d1, d3
0506: e288                     lsr.l      #$1, d0
0508: e289                     lsr.l      #$1, d1
050a: b287                     cmp.l      d7, d1
050c: 62f8                     bhi.b      $506
050e: 80c1                     divu.w     d1, d0
0510: c087                     and.l      d7, d0
0512: 3203                     move.w     d3, d1
0514: c2c0                     mulu.w     d0, d1
0516: 2e03                     move.l     d3, d7
0518: 4847                     swap       d7
051a: cec0                     mulu.w     d0, d7
051c: 4847                     swap       d7
051e: d287                     add.l      d7, d1
0520: 6508                     bcs.b      $52a
0522: 9282                     sub.l      d2, d1
0524: 6204                     bhi.b      $52a
0526: 4481                     neg.l      d1
0528: 4e75                     rts        
052a: 5340                     subq.w     #$1, d0
052c: 60e4                     bra.b      $512
052e: 4e75                     rts        
0530: 225f                     movea.l    (a7)+, a1
0532: 201f                     move.l     (a7)+, d0
0534: a11e                     dc.w       $a11e
0536: 2e88                     move.l     a0, (a7)
0538: 4ed1                     jmp        (a1)
053a: 225f                     movea.l    (a7)+, a1
053c: 201f                     move.l     (a7)+, d0
053e: a122                     dc.w       $a122
0540: 2e88                     move.l     a0, (a7)
0542: 4ed1                     jmp        (a1)
0544: 225f                     movea.l    (a7)+, a1
0546: 205f                     movea.l    (a7)+, a0
0548: a025                     dc.w       $a025
054a: 2e80                     move.l     d0, (a7)
054c: 6a02                     bpl.b      $550
054e: 4297                     clr.l      (a7)
0550: 4ed1                     jmp        (a1)
0552: 225f                     movea.l    (a7)+, a1
0554: 205f                     movea.l    (a7)+, a0
0556: 20b8020c                 move.l     $20c.w, (a0)
055a: 4ed1                     jmp        (a1)
055c: 205f                     movea.l    (a7)+, a0
055e: 227802ae                 movea.l    $2ae.w, a1
0562: 5049                     addq.w     #$8, a1
0564: 3011                     move.w     (a1), d0
0566: 225f                     movea.l    (a7)+, a1
0568: 4251                     clr.w      (a1)
056a: 0c0000ff                 cmpi.b     #$ff, d0
056e: 6708                     beq.b      $578
0570: e058                     ror.w      #$8, d0
0572: 5200                     addq.b     #$1, d0
0574: 13400001                 move.b     d0, $1(a1)
0578: e048                     lsr.w      #$8, d0
057a: 225f                     movea.l    (a7)+, a1
057c: 3280                     move.w     d0, (a1)
057e: 4ed0                     jmp        (a0)
0580: 4e56ffce                 link.w     a6, #$ffce
0584: 204f                     movea.l    a7, a0
0586: 216e000e0012             move.l     $e(a6), $12(a0)
058c: 316e000c0016             move.w     $c(a6), $16(a0)
0592: 4228001a                 clr.b      $1a(a0)
0596: 4228001b                 clr.b      $1b(a0)
059a: 42a8001c                 clr.l      $1c(a0)
059e: 701a                     moveq      #$1a, d0
05a0: a060                     dc.w       $a060
05a2: 0c40ffce                 cmpi.w     #$ffce, d0
05a6: 6602                     bne.b      $5aa
05a8: a000                     dc.w       $a000
05aa: 226e0008                 movea.l    $8(a6), a1
05ae: 32a80018                 move.w     $18(a0), (a1)
05b2: 3d400012                 move.w     d0, $12(a6)
05b6: 4e5e                     unlk       a6
05b8: 205f                     movea.l    (a7)+, a0
05ba: 4fef000a                 lea.l      $a(a7), a7
05be: 4ed0                     jmp        (a0)
05c0: 4e56ffce                 link.w     a6, #$ffce
05c4: 204f                     movea.l    a7, a0
05c6: 316e00080018             move.w     $8(a6), $18(a0)
05cc: a001                     dc.w       $a001
05ce: 3d40000a                 move.w     d0, $a(a6)
05d2: 4e5e                     unlk       a6
05d4: 205f                     movea.l    (a7)+, a0
05d6: 548f                     addq.l     #$2, a7
05d8: 4ed0                     jmp        (a0)
05da: 51c1                     sf.b       d1
05dc: 6002                     bra.b      $5e0
05de: 50c1                     st.b       d1
05e0: 4e56ffce                 link.w     a6, #$ffce
05e4: 204f                     movea.l    a7, a0
05e6: 216e00080020             move.l     $8(a6), $20(a0)
05ec: 316e00100018             move.w     $10(a6), $18(a0)
05f2: 226e000c                 movea.l    $c(a6), a1
05f6: 21510024                 move.l     (a1), $24(a0)
05fa: 4268002c                 clr.w      $2c(a0)
05fe: 42a8002e                 clr.l      $2e(a0)
0602: 4a01                     tst.b      d1
0604: 6604                     bne.b      $60a
0606: a002                     dc.w       $a002
0608: 6002                     bra.b      $60c
060a: a003                     dc.w       $a003
060c: 3d400012                 move.w     d0, $12(a6)
0610: 226e000c                 movea.l    $c(a6), a1
0614: 22a80028                 move.l     $28(a0), (a1)
0618: 4e5e                     unlk       a6
061a: 225f                     movea.l    (a7)+, a1
061c: 4fef000a                 lea.l      $a(a7), a7
0620: 4ed1                     jmp        (a1)
0622: 4e56ffc0                 link.w     a6, #$ffc0
0626: 204f                     movea.l    a7, a0
0628: 316e00080016             move.w     $8(a6), $16(a0)
062e: 216e000a0012             move.l     $a(a6), $12(a0)
0634: a013                     dc.w       $a013
0636: 3d40000e                 move.w     d0, $e(a6)
063a: 4e5e                     unlk       a6
063c: 225f                     movea.l    (a7)+, a1
063e: 5c8f                     addq.l     #$6, a7
0640: 4ed1                     jmp        (a1)
0642: 4e56ffb0                 link.w     a6, #$ffb0
0646: 204f                     movea.l    a7, a0
0648: 216e00120012             move.l     $12(a6), $12(a0)
064e: 316e00100016             move.w     $10(a6), $16(a0)
0654: 4228001a                 clr.b      $1a(a0)
0658: a008                     dc.w       $a008
065a: 6616                     bne.b      $672
065c: 4268001c                 clr.w      $1c(a0)
0660: a00c                     dc.w       $a00c
0662: 660e                     bne.b      $672
0664: 43e80020                 lea.l      $20(a0), a1
0668: 22ee0008                 move.l     $8(a6), (a1)+
066c: 22ae000c                 move.l     $c(a6), (a1)
0670: a00d                     dc.w       $a00d
0672: 3d400016                 move.w     d0, $16(a6)
0676: 4e5e                     unlk       a6
0678: 225f                     movea.l    (a7)+, a1
067a: 4fef000e                 lea.l      $e(a7), a7
067e: 4ed1                     jmp        (a1)
0680: 4e56ffce                 link.w     a6, #$ffce
0684: 204f                     movea.l    a7, a0
0686: 316e000c0018             move.w     $c(a6), $18(a0)
068c: a011                     dc.w       $a011
068e: 3d40000e                 move.w     d0, $e(a6)
0692: 226e0008                 movea.l    $8(a6), a1
0696: 22a8001c                 move.l     $1c(a0), (a1)
069a: 4e5e                     unlk       a6
069c: 225f                     movea.l    (a7)+, a1
069e: 5c8f                     addq.l     #$6, a7
06a0: 4ed1                     jmp        (a1)
06a2: 4e56ffce                 link.w     a6, #$ffce
06a6: 204f                     movea.l    a7, a0
06a8: 316e000c0018             move.w     $c(a6), $18(a0)
06ae: 216e0008001c             move.l     $8(a6), $1c(a0)
06b4: a012                     dc.w       $a012
06b6: 3d40000e                 move.w     d0, $e(a6)
06ba: 4e5e                     unlk       a6
06bc: 225f                     movea.l    (a7)+, a1
06be: 5c8f                     addq.l     #$6, a7
06c0: 4ed1                     jmp        (a1)
06c2: 20780ae8                 movea.l    $ae8.w, a0
06c6: 2008                     move.l     a0, d0
06c8: 6a1e                     bpl.b      $6e8
06ca: 703a                     moveq      #$3a, d0
06cc: a322                     dc.w       $a322
06ce: 660000e0                 bne.w      $7b0
06d2: a029                     dc.w       $a029
06d4: 21c80ae8                 move.l     a0, $ae8.w
06d8: 2250                     movea.l    (a0), a1
06da: 2378033c0034             move.l     $33c.w, $34(a1)
06e0: 43fa010c                 lea.l      $7ee(pc), a1
06e4: 21c9033c                 move.l     a1, $33c.w
06e8: 2250                     movea.l    (a0), a1
06ea: 4a690010                 tst.w      $10(a1)
06ee: 6f000084                 ble.w      $774
06f2: 222f0004                 move.l     $4(a7), d1
06f6: b0b80a06                 cmp.l      $a06.w, d0
06fa: 6772                     beq.b      $76e
06fc: 50e90039                 st.b       $39(a1)
0700: 32290032                 move.w     $32(a1), d1
0704: 2408                     move.l     a0, d2
0706: 48e76000                 movem.l    d1-d2, -(a7)
070a: a9e1                     dc.w       $a9e1
070c: 4cdf0006                 movem.l    (a7)+, d1-d2
0710: 4a40                     tst.w      d0
0712: 66000098                 bne.w      $7ac
0716: 7000                     moveq      #$0, d0
0718: 0641000c                 addi.w     #$c, d1
071c: 3001                     move.w     d1, d0
071e: a024                     dc.w       $a024
0720: 6600008a                 bne.w      $7ac
0724: a029                     dc.w       $a029
0726: 21c80ae8                 move.l     a0, $ae8.w
072a: 2250                     movea.l    (a0), a1
072c: 2078027a                 movea.l    $27a.w, a0
0730: 21490008                 move.l     a1, $8(a0)
0734: 2149000c                 move.l     a1, $c(a0)
0738: 2042                     movea.l    d2, a0
073a: 2050                     movea.l    (a0), a0
073c: 10280038                 move.b     $38(a0), d0
0740: 81290038                 or.b       d0, $38(a1)
0744: 2042                     movea.l    d2, a0
0746: a023                     dc.w       $a023
0748: 33410032                 move.w     d1, $32(a1)
074c: 08a900000038             bclr.b     #$0, $38(a1)
0752: 6708                     beq.b      $75c
0754: 42690010                 clr.w      $10(a1)
0758: 4eba00a0                 jsr        $7fa(pc)
075c: 51e90039                 sf.b       $39(a1)
0760: d2c1                     adda.w     d1, a1
0762: 700c                     moveq      #$c, d0
0764: 92c0                     suba.w     d0, a1
0766: 41ef0004                 lea.l      $4(a7), a0
076a: a02e                     dc.w       $a02e
076c: 6042                     bra.b      $7b0
076e: 30290010                 move.w     $10(a1), d0
0772: 6efa                     bgt.b      $76e
0774: 2049                     movea.l    a1, a0
0776: 317c003a0032             move.w     #$3a, $32(a0)
077c: 216f00080024             move.l     $8(a7), $24(a0)
0782: 216f000c0020             move.l     $c(a7), $20(a0)
0788: 317cfffc0018             move.w     #$fffc, $18(a0)
078e: 222f0004                 move.l     $4(a7), d1
0792: b2b80a06                 cmp.l      $a06.w, d1
0796: 6604                     bne.b      $79c
0798: a003                     dc.w       $a003
079a: 6012                     bra.b      $7ae
079c: 2141001c                 move.l     d1, $1c(a0)
07a0: 43fa0058                 lea.l      $7fa(pc), a1
07a4: 2149000c                 move.l     a1, $c(a0)
07a8: a403                     dc.w       $a403
07aa: 4a40                     tst.w      d0
07ac: 6702                     beq.b      $7b0
07ae: 6108                     bsr.b      $7b8
07b0: 225f                     movea.l    (a7)+, a1
07b2: 4fef000c                 lea.l      $c(a7), a7
07b6: 4ed1                     jmp        (a1)
07b8: 20780ae8                 movea.l    $ae8.w, a0
07bc: b0f80a06                 cmpa.w     $a06.w, a0
07c0: 6710                     beq.b      $7d2
07c2: 2250                     movea.l    (a0), a1
07c4: 21e90034033c             move.l     $34(a1), $33c.w
07ca: a023                     dc.w       $a023
07cc: 21f80a060ae8             move.l     $a06.w, $ae8.w
07d2: 4e75                     rts        
07d4: 4e56ffe0                 link.w     a6, #$ffe0
07d8: 41eeffe0                 lea.l      -$20(a6), a0
07dc: 317cfffc0018             move.w     #$fffc, $18(a0)
07e2: a206                     dc.w       $a206
07e4: 42780280                 clr.w      $280.w
07e8: 61ce                     bsr.b      $7b8
07ea: 4e5e                     unlk       a6
07ec: 4e75                     rts        
07ee: 61e4                     bsr.b      $7d4
07f0: 2038033c                 move.l     $33c.w, d0
07f4: 6ff6                     ble.b      $7ec
07f6: 2040                     movea.l    d0, a0
07f8: 4ed0                     jmp        (a0)
07fa: 48e7e0c0                 movem.l    d0-d2/a0-a1, -(a7)
07fe: 20780ae8                 movea.l    $ae8.w, a0
0802: 2050                     movea.l    (a0), a0
0804: 4a280039                 tst.b      $39(a0)
0808: 6706                     beq.b      $810
080a: 50e80038                 st.b       $38(a0)
080e: 6068                     bra.b      $878
0810: 30280032                 move.w     $32(a0), d0
0814: 2228001c                 move.l     $1c(a0), d1
0818: 670c                     beq.b      $826
081a: 2241                     movea.l    d1, a1
081c: 48e78080                 movem.l    d0/a0, -(a7)
0820: 4e91                     jsr        (a1)
0822: 4cdf0101                 movem.l    (a7)+, d0/a0
0826: 0c40003a                 cmpi.w     #$3a, d0
082a: 6606                     bne.b      $832
082c: 4ebaff8a                 jsr        $7b8(pc)
0830: 6046                     bra.b      $878
0832: 2248                     movea.l    a0, a1
0834: 41e8003a                 lea.l      $3a(a0), a0
0838: 2358001c                 move.l     (a0)+, $1c(a1)
083c: 23580024                 move.l     (a0)+, $24(a1)
0840: 23580020                 move.l     (a0)+, $20(a1)
0844: 337cfffc0018             move.w     #$fffc, $18(a1)
084a: 7246                     moveq      #$46, d1
084c: 9041                     sub.w      d1, d0
084e: 6712                     beq.b      $862
0850: 3200                     move.w     d0, d1
0852: 48c0                     ext.l      d0
0854: 2248                     movea.l    a0, a1
0856: 92fc000c                 suba.w     #$c, a1
085a: a02e                     dc.w       $a02e
085c: 0641003a                 addi.w     #$3a, d1
0860: 6002                     bra.b      $864
0862: 723a                     moveq      #$3a, d1
0864: 20780ae8                 movea.l    $ae8.w, a0
0868: 2050                     movea.l    (a0), a0
086a: 31410032                 move.w     d1, $32(a0)
086e: 43faff8a                 lea.l      $7fa(pc), a1
0872: 2149000c                 move.l     a1, $c(a0)
0876: a403                     dc.w       $a403
0878: 4cdf0307                 movem.l    (a7)+, d0-d2/a0-a1
087c: 4e75                     rts        
087e: 226f0004                 movea.l    $4(a7), a1
0882: 4251                     clr.w      (a1)
0884: 20780aec                 movea.l    $aec.w, a0
0888: a025                     dc.w       $a025
088a: 4a80                     tst.l      d0
088c: 6f0e                     ble.b      $89c
088e: 2050                     movea.l    (a0), a0
0890: 226f0008                 movea.l    $8(a7), a1
0894: 3298                     move.w     (a0)+, (a1)
0896: 226f0004                 movea.l    $4(a7), a1
089a: 3290                     move.w     (a0), (a1)
089c: 205f                     movea.l    (a7)+, a0
089e: 504f                     addq.w     #$8, a7
08a0: 4ed0                     jmp        (a0)
08a2: 48e70030                 movem.l    a2-a3, -(a7)
08a6: 226f000c                 movea.l    $c(a7), a1
08aa: 42a90002                 clr.l      $2(a1)
08ae: 20780aec                 movea.l    $aec.w, a0
08b2: a025                     dc.w       $a025
08b4: 4a80                     tst.l      d0
08b6: 6f26                     ble.b      $8de
08b8: 2450                     movea.l    (a0), a2
08ba: 544a                     addq.w     #$2, a2
08bc: 322f0010                 move.w     $10(a7), d1
08c0: b25a                     cmp.w      (a2)+, d1
08c2: 6e1a                     bgt.b      $8de
08c4: 5341                     subq.w     #$1, d1
08c6: 6d16                     blt.b      $8de
08c8: 204a                     movea.l    a2, a0
08ca: 7002                     moveq      #$2, d0
08cc: d0280008                 add.b      $8(a0), d0
08d0: 0240fffe                 andi.w     #$fffe, d0
08d4: 5040                     addq.w     #$8, d0
08d6: d4c0                     adda.w     d0, a2
08d8: a02e                     dc.w       $a02e
08da: 5341                     subq.w     #$1, d1
08dc: 60e8                     bra.b      $8c6
08de: 4cdf0c00                 movem.l    (a7)+, a2-a3
08e2: 205f                     movea.l    (a7)+, a0
08e4: 5c4f                     addq.w     #$6, a7
08e6: 4ed0                     jmp        (a0)
08e8: 20780aec                 movea.l    $aec.w, a0
08ec: a025                     dc.w       $a025
08ee: 4a80                     tst.l      d0
08f0: 6f28                     ble.b      $91a
08f2: 2050                     movea.l    (a0), a0
08f4: 5448                     addq.w     #$2, a0
08f6: 322f0004                 move.w     $4(a7), d1
08fa: b258                     cmp.w      (a0)+, d1
08fc: 6e1c                     bgt.b      $91a
08fe: 5341                     subq.w     #$1, d1
0900: 6d18                     blt.b      $91a
0902: 6712                     beq.b      $916
0904: 7002                     moveq      #$2, d0
0906: d0280008                 add.b      $8(a0), d0
090a: 0240fffe                 andi.w     #$fffe, d0
090e: 5040                     addq.w     #$8, d0
0910: d0c0                     adda.w     d0, a0
0912: 5341                     subq.w     #$1, d1
0914: 60ea                     bra.b      $900
0916: 42a80002                 clr.l      $2(a0)
091a: 205f                     movea.l    (a7)+, a0
091c: 544f                     addq.w     #$2, a7
091e: 4ed0                     jmp        (a0)
0920: a063                     dc.w       $a063
0922: 4e75                     rts        
0924: 7402                     moveq      #$2, d2
0926: 205f                     movea.l    (a7)+, a0
0928: 3f02                     move.w     d2, -(a7)
092a: 2f08                     move.l     a0, -(a7)
092c: ade9                     dc.w       $ade9
092e: 7404                     moveq      #$4, d2
0930: 4efafff4                 jmp        $926(pc)
0934: 7400                     moveq      #$0, d2
0936: 4efaffee                 jmp        $926(pc)
093a: 206f0008                 movea.l    $8(a7), a0
093e: 3f3c0001                 move.w     #$1, -(a7)
0942: a9ee                     dc.w       $a9ee
0944: 206f0004                 movea.l    $4(a7), a0
0948: 2080                     move.l     d0, (a0)
094a: 4efa000e                 jmp        $95a(pc)
094e: 206f0004                 movea.l    $4(a7), a0
0952: 202f0008                 move.l     $8(a7), d0
0956: 4267                     clr.w      -(a7)
0958: a9ee                     dc.w       $a9ee
095a: 205f                     movea.l    (a7)+, a0
095c: 504f                     addq.w     #$8, a7
095e: 4ed0                     jmp        (a0)
0960: 6118                     bsr.b      $97a
0962: a9db                     dc.w       $a9db
0964: 2e9f                     move.l     (a7)+, (a7)
0966: 4e75                     rts        
0968: 6110                     bsr.b      $97a
096a: a9d6                     dc.w       $a9d6
096c: 60f6                     bra.b      $964
096e: 610a                     bsr.b      $97a
0970: a9d5                     dc.w       $a9d5
0972: 60f0                     bra.b      $964
0974: 6104                     bsr.b      $97a
0976: a9d7                     dc.w       $a9d7
0978: 60ea                     bra.b      $964
097a: 206f0008                 movea.l    $8(a7), a0
097e: 4a6800a4                 tst.w      $a4(a0)
0982: 6b08                     bmi.b      $98c
0984: 225f                     movea.l    (a7)+, a1
0986: 2f2800a0                 move.l     $a0(a0), -(a7)
098a: 4ed1                     jmp        (a1)
098c: 4cdf0301                 movem.l    (a7)+, d0/a0-a1
0990: 4ed0                     jmp        (a0)
0992: 42af0004                 clr.l      $4(a7)
0996: 3f780ab00006             move.w     $ab0.w, $6(a7)
099c: 4e75                     rts        
099e: 42a7                     clr.l      -(a7)
09a0: 594f                     subq.w     #$4, a7
09a2: 42a7                     clr.l      -(a7)
09a4: 2f3c54455854             move.l     #$54455854, -(a7)
09aa: 486f000c                 pea.l      $c(a7)
09ae: a9fd                     dc.w       $a9fd
09b0: 201f                     move.l     (a7)+, d0
09b2: 584f                     addq.w     #$4, a7
09b4: 6b28                     bmi.b      $9de
09b6: 0c8000007d01             cmpi.l     #$7d01, d0
09bc: 6506                     bcs.b      $9c4
09be: 303cfe0b                 move.w     #$fe0b, d0
09c2: 601a                     bra.b      $9de
09c4: 42a7                     clr.l      -(a7)
09c6: 594f                     subq.w     #$4, a7
09c8: 2f380ab4                 move.l     $ab4.w, -(a7)
09cc: 2f3c54455854             move.l     #$54455854, -(a7)
09d2: 486f000c                 pea.l      $c(a7)
09d6: a9fd                     dc.w       $a9fd
09d8: 201f                     move.l     (a7)+, d0
09da: 584f                     addq.w     #$4, a7
09dc: 6a06                     bpl.b      $9e4
09de: 42780ab0                 clr.w      $ab0.w
09e2: 600a                     bra.b      $9ee
09e4: 426f0004                 clr.w      $4(a7)
09e8: 31c00ab0                 move.w     d0, $ab0.w
09ec: 7000                     moveq      #$0, d0
09ee: 3f400004                 move.w     d0, $4(a7)
09f2: 4e75                     rts        
09f4: 20780ab4                 movea.l    $ab4.w, a0
09f8: a029                     dc.w       $a029
09fa: 594f                     subq.w     #$4, a7
09fc: 3f380ab0                 move.w     $ab0.w, -(a7)
0a00: 4267                     clr.w      -(a7)
0a02: 2f3c54455854             move.l     #$54455854, -(a7)
0a08: 2f10                     move.l     (a0), -(a7)
0a0a: a9fe                     dc.w       $a9fe
0a0c: 544f                     addq.w     #$2, a7
0a0e: 3f5f0004                 move.w     (a7)+, $4(a7)
0a12: 20780ab4                 movea.l    $ab4.w, a0
0a16: a02a                     dc.w       $a02a
0a18: 4e75                     rts        
0a1a: 201f                     move.l     (a7)+, d0
0a1c: 225f                     movea.l    (a7)+, a1
0a1e: 2b5f0014                 move.l     (a7)+, $14(a5)
0a22: 2251                     movea.l    (a1), a1
0a24: 41fa000a                 lea.l      $a30(pc), a0
0a28: 2348002a                 move.l     a0, $2a(a1)
0a2c: 2040                     movea.l    d0, a0
0a2e: 4ed0                     jmp        (a0)
0a30: 4227                     clr.b      -(a7)
0a32: 206d0014                 movea.l    $14(a5), a0
0a36: 4e90                     jsr        (a0)
0a38: 101f                     move.b     (a7)+, d0
0a3a: 4e75                     rts        
