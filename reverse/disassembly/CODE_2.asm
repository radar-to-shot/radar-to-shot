; CODE 2, 1566 bytes, resource-relative hexadecimal offsets.
; Linear sweep: embedded data may decode as instructions. Verify control flow.
0004: 4e56ffe6                 link.w     a6, #$ffe6
0008: 48e70108                 movem.l    d7/a4, -(a7)
000c: 206e0008                 movea.l    $8(a6), a0
0010: 43eeffe8                 lea.l      -$18(a6), a1
0014: 22d8                     move.l     (a0)+, (a1)+
0016: 22d8                     move.l     (a0)+, (a1)+
0018: 7e01                     moveq      #$1, d7
001a: 3007                     move.w     d7, d0
001c: c1fc00a6                 muls.w     #$a6, d0
0020: 0640bf8e                 addi.w     #$bf8e, d0
0024: 49f50000                 lea.l      (a5, d0.w), a4
0028: 422c0008                 clr.b      $8(a4)
002c: 41eeffe8                 lea.l      -$18(a6), a0
0030: 43d4                     lea.l      (a4), a1
0032: 22d8                     move.l     (a0)+, (a1)+
0034: 22d8                     move.l     (a0)+, (a1)+
0036: 3014                     move.w     (a4), d0
0038: 06400012                 addi.w     #$12, d0
003c: 3d40ffe8                 move.w     d0, -$18(a6)
0040: 302c0002                 move.w     $2(a4), d0
0044: 06400012                 addi.w     #$12, d0
0048: 3d40ffea                 move.w     d0, -$16(a6)
004c: 3d6c0004ffec             move.w     $4(a4), -$14(a6)
0052: 302c0006                 move.w     $6(a4), d0
0056: 06400012                 addi.w     #$12, d0
005a: 3d40ffee                 move.w     d0, -$12(a6)
005e: 5247                     addq.w     #$1, d7
0060: 0c470005                 cmpi.w     #$5, d7
0064: 6fb4                     ble.b      $1a
0066: 4cdf1080                 movem.l    (a7)+, d7/a4
006a: 4e5e                     unlk       a6
006c: 2e9f                     move.l     (a7)+, (a7)
006e: 4e75                     rts        
0070: 4e56febe                 link.w     a6, #$febe
0074: 48e71f18                 movem.l    d3-d7/a3-a4, -(a7)
0078: 594f                     subq.w     #$4, a7
007a: 2f3c00001000             move.l     #$1000, -(a7)
0080: 4ead015a                 jsr        $15a(a5) ; CODE 1 resource+0x053a
0084: 2b5fbde2                 move.l     (a7)+, -$421e(a5)
0088: 4247                     clr.w      d7
008a: 594f                     subq.w     #$4, a7
008c: 486efeca                 pea.l      -$136(a6)
0090: 3d47fec8                 move.w     d7, -$138(a6)
0094: 486efec8                 pea.l      -$138(a6)
0098: 41fa0570                 lea.l      $60a(pc), a0
009c: 43eefebe                 lea.l      -$142(a6), a1
00a0: 4851                     pea.l      (a1)
00a2: 22d8                     move.l     (a0)+, (a1)+
00a4: 22d8                     move.l     (a0)+, (a1)+
00a6: 32d8                     move.w     (a0)+, (a1)+
00a8: 3f3c2004                 move.w     #$2004, -(a7)
00ac: a9eb                     dc.w       $a9eb
00ae: 486efebe                 pea.l      -$142(a6)
00b2: 4ead00da                 jsr        $da(a5) ; CODE 1 resource+0x0198
00b6: 584f                     addq.w     #$4, a7
00b8: 487a055a                 pea.l      $614(pc)
00bc: 486efeca                 pea.l      -$136(a6)
00c0: 3f3c0004                 move.w     #$4, -(a7)
00c4: a9eb                     dc.w       $a9eb
00c6: 486efeca                 pea.l      -$136(a6)
00ca: 4ead0102                 jsr        $102(a5) ; CODE 1 resource+0x020a
00ce: 3007                     move.w     d7, d0
00d0: d040                     add.w      d0, d0
00d2: 544f                     addq.w     #$2, a7
00d4: 0640f79a                 addi.w     #$f79a, d0
00d8: 3b9f0000                 move.w     (a7)+, (a5, d0.w)
00dc: 5247                     addq.w     #$1, d7
00de: 0c47005a                 cmpi.w     #$5a, d7
00e2: 6fa6                     ble.b      $8a
00e4: 7e5b                     moveq      #$5b, d7
00e6: 303c00b4                 move.w     #$b4, d0
00ea: 9047                     sub.w      d7, d0
00ec: d040                     add.w      d0, d0
00ee: 3207                     move.w     d7, d1
00f0: d241                     add.w      d1, d1
00f2: 0640f79a                 addi.w     #$f79a, d0
00f6: 0641f79a                 addi.w     #$f79a, d1
00fa: 3bb500001000             move.w     (a5, d0.w), (a5, d1.w)
0100: 5247                     addq.w     #$1, d7
0102: 0c4700b4                 cmpi.w     #$b4, d7
0106: 6fde                     ble.b      $e6
0108: 486effee                 pea.l      -$12(a6)
010c: 486effec                 pea.l      -$14(a6)
0110: 4ead0172                 jsr        $172(a5) ; CODE 1 resource+0x055c
0114: 0c6e0075ffee             cmpi.w     #$75, -$12(a6)
011a: 5cc0                     sge.b      d0
011c: 4400                     neg.b      d0
011e: 1b40bdb4                 move.b     d0, -$424c(a5)
0122: 4a2dbdb4                 tst.b      -$424c(a5)
0126: 670c                     beq.b      $134
0128: 554f                     subq.w     #$2, a7
012a: 3eb80baa                 move.w     $baa.w, (a7)
012e: 3b5fc372                 move.w     (a7)+, -$3c8e(a5)
0132: 6006                     bra.b      $13a
0134: 3b7c0014c372             move.w     #$14, -$3c8e(a5)
013a: 594f                     subq.w     #$4, a7
013c: 3f3c0080                 move.w     #$80, -(a7)
0140: a9c0                     dc.w       $a9c0
0142: 2b5fbdda                 move.l     (a7)+, -$4226(a5)
0146: 2f2dbdda                 move.l     -$4226(a5), -(a7)
014a: a93c                     dc.w       $a93c
014c: 3a3c0080                 move.w     #$80, d5
0150: 594f                     subq.w     #$4, a7
0152: 3f05                     move.w     d5, -(a7)
0154: a949                     dc.w       $a949
0156: 3005                     move.w     d5, d0
0158: e540                     asl.w      #$2, d0
015a: 0640bbf6                 addi.w     #$bbf6, d0
015e: 2b9f0000                 move.l     (a7)+, (a5, d0.w)
0162: 5245                     addq.w     #$1, d5
0164: 0c450087                 cmpi.w     #$87, d5
0168: 6fe6                     ble.b      $150
016a: 2f2dbdf6                 move.l     -$420a(a5), -(a7)
016e: 2f3c44525652             move.l     #$44525652, -(a7)
0174: a94d                     dc.w       $a94d
0176: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
017a: 2f3c464f4e54             move.l     #$464f4e54, -(a7)
0180: a94d                     dc.w       $a94d
0182: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
0186: 4267                     clr.w      -(a7)
0188: a93a                     dc.w       $a93a
018a: 2f2dbe02                 move.l     -$41fe(a5), -(a7)
018e: 4267                     clr.w      -(a7)
0190: a93a                     dc.w       $a93a
0192: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
0196: 4267                     clr.w      -(a7)
0198: a93a                     dc.w       $a93a
019a: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
019e: 4267                     clr.w      -(a7)
01a0: a93a                     dc.w       $a93a
01a2: 2f2dbe0e                 move.l     -$41f2(a5), -(a7)
01a6: 4267                     clr.w      -(a7)
01a8: a93a                     dc.w       $a93a
01aa: 1b7c0001bdb9             move.b     #$1, -$4247(a5)
01b0: 2f2dbdfe                 move.l     -$4202(a5), -(a7)
01b4: 3f3c000f                 move.w     #$f, -(a7)
01b8: 1f2dbdb9                 move.b     -$4247(a5), -(a7)
01bc: a945                     dc.w       $a945
01be: a937                     dc.w       $a937
01c0: 3b7c0009f90c             move.w     #$9, -$6f4(a5)
01c6: 3b7c000af90e             move.w     #$a, -$6f2(a5)
01cc: 3b7c000cf910             move.w     #$c, -$6f0(a5)
01d2: 3b7c000ef912             move.w     #$e, -$6ee(a5)
01d8: 3b7c0012f914             move.w     #$12, -$6ec(a5)
01de: 3b7c0014f916             move.w     #$14, -$6ea(a5)
01e4: 3b7c0018f918             move.w     #$18, -$6e8(a5)
01ea: 3b7c0024f91a             move.w     #$24, -$6e6(a5)
01f0: 2f2dbe0a                 move.l     -$41f6(a5), -(a7)
01f4: 3f3c0001                 move.w     #$1, -(a7)
01f8: 1f3c0001                 move.b     #$1, -(a7)
01fc: a945                     dc.w       $a945
01fe: 3b7c0001bdea             move.w     #$1, -$4216(a5)
0204: 302dbdea                 move.w     -$4216(a5), d0
0208: d040                     add.w      d0, d0
020a: 0640f90a                 addi.w     #$f90a, d0
020e: 3b750000bdee             move.w     (a5, d0.w), -$4212(a5)
0214: 4203                     clr.b      d3
0216: 554f                     subq.w     #$2, a7
0218: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
021c: a950                     dc.w       $a950
021e: 3b5fbde6                 move.w     (a7)+, -$421a(a5)
0222: 3d6dbde6fed2             move.w     -$421a(a5), -$12e(a6)
0228: 7a01                     moveq      #$1, d5
022a: 6030                     bra.b      $25c
022c: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
0230: 3f05                     move.w     d5, -(a7)
0232: 486efee4                 pea.l      -$11c(a6)
0236: a946                     dc.w       $a946
0238: 487a03c8                 pea.l      $602(pc)
023c: 486efee4                 pea.l      -$11c(a6)
0240: 4ead010a                 jsr        $10a(a5) ; CODE 1 resource+0x028c
0244: 6612                     bne.b      $258
0246: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
024a: 3f05                     move.w     d5, -(a7)
024c: 1f3c0001                 move.b     #$1, -(a7)
0250: a945                     dc.w       $a945
0252: 3b45bde8                 move.w     d5, -$4218(a5)
0256: 7601                     moveq      #$1, d3
0258: 5245                     addq.w     #$1, d5
025a: 6906                     bvs.b      $262
025c: ba6efed2                 cmp.w      -$12e(a6), d5
0260: 6fca                     ble.b      $22c
0262: 1003                     move.b     d3, d0
0264: 5300                     subq.b     #$1, d0
0266: 6714                     beq.b      $27c
0268: 2f2dbe06                 move.l     -$41fa(a5), -(a7)
026c: 3f3c0001                 move.w     #$1, -(a7)
0270: 1f3c0001                 move.b     #$1, -(a7)
0274: a945                     dc.w       $a945
0276: 3b7c0001bde8             move.w     #$1, -$4218(a5)
027c: 4ead007a                 jsr        $7a(a5) ; CODE 4 resource+0x10fc
0280: 302dff5c                 move.w     -$a4(a5), d0
0284: 906dff58                 sub.w      -$a8(a5), d0
0288: 3b40f908                 move.w     d0, -$6f8(a5)
028c: 302dff5a                 move.w     -$a6(a5), d0
0290: 906dff56                 sub.w      -$aa(a5), d0
0294: 3b40f90a                 move.w     d0, -$6f6(a5)
0298: 486dbe16                 pea.l      -$41ea(a5)
029c: 3f3c0003                 move.w     #$3, -(a7)
02a0: 302dc372                 move.w     -$3c8e(a5), d0
02a4: 06400012                 addi.w     #$12, d0
02a8: 5640                     addq.w     #$3, d0
02aa: 3f00                     move.w     d0, -(a7)
02ac: 302df908                 move.w     -$6f8(a5), d0
02b0: 0640ff9c                 addi.w     #$ff9c, d0
02b4: 3f00                     move.w     d0, -(a7)
02b6: 302df90a                 move.w     -$6f6(a5), d0
02ba: 5940                     subq.w     #$4, d0
02bc: 3f00                     move.w     d0, -(a7)
02be: a8a7                     dc.w       $a8a7
02c0: 486dbe1e                 pea.l      -$41e2(a5)
02c4: 3f3c0003                 move.w     #$3, -(a7)
02c8: 302df90a                 move.w     -$6f6(a5), d0
02cc: 0640ffb0                 addi.w     #$ffb0, d0
02d0: 3f00                     move.w     d0, -(a7)
02d2: 302df908                 move.w     -$6f8(a5), d0
02d6: 5940                     subq.w     #$4, d0
02d8: 3f00                     move.w     d0, -(a7)
02da: 302df90a                 move.w     -$6f6(a5), d0
02de: 5940                     subq.w     #$4, d0
02e0: 3f00                     move.w     d0, -(a7)
02e2: a8a7                     dc.w       $a8a7
02e4: 422dbdb5                 clr.b      -$424b(a5)
02e8: 426dbdf4                 clr.w      -$420c(a5)
02ec: 426dbdf0                 clr.w      -$4210(a5)
02f0: 426dbdf2                 clr.w      -$420e(a5)
02f4: 3b7c000dbdba             move.w     #$d, -$4246(a5)
02fa: 3b7c0008bdbc             move.w     #$8, -$4244(a5)
0300: 3b7c0009bdbe             move.w     #$9, -$4242(a5)
0306: 3b7c0003bdc0             move.w     #$3, -$4240(a5)
030c: 594f                     subq.w     #$4, a7
030e: 3f3c0001                 move.w     #$1, -(a7)
0312: a9b9                     dc.w       $a9b9
0314: 2b5fbdc2                 move.l     (a7)+, -$423e(a5)
0318: 594f                     subq.w     #$4, a7
031a: 3f3c0004                 move.w     #$4, -(a7)
031e: a9b9                     dc.w       $a9b9
0320: 2b5fbdc6                 move.l     (a7)+, -$423a(a5)
0324: 594f                     subq.w     #$4, a7
0326: 3f3c008b                 move.w     #$8b, -(a7)
032a: 486dbed6                 pea.l      -$412a(a5)
032e: 70ff                     moveq      #$ff, d0
0330: 2f00                     move.l     d0, -(a7)
0332: a97c                     dc.w       $a97c
0334: 2b5fbe32                 move.l     (a7)+, -$41ce(a5)
0338: 594f                     subq.w     #$4, a7
033a: 3f3c008c                 move.w     #$8c, -(a7)
033e: 486dbf80                 pea.l      -$4080(a5)
0342: 70ff                     moveq      #$ff, d0
0344: 2f00                     move.l     d0, -(a7)
0346: a97c                     dc.w       $a97c
0348: 2b5fbe36                 move.l     (a7)+, -$41ca(a5)
034c: 594f                     subq.w     #$4, a7
034e: 2f3c00000224             move.l     #$224, -(a7)
0354: 4ead015a                 jsr        $15a(a5) ; CODE 1 resource+0x053a
0358: 2b5fc02a                 move.l     (a7)+, -$3fd6(a5)
035c: 2f2dbe32                 move.l     -$41ce(a5), -(a7)
0360: 2f2dc02a                 move.l     -$3fd6(a5), -(a7)
0364: a918                     dc.w       $a918
0366: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
036a: 2f2dc02a                 move.l     -$3fd6(a5), -(a7)
036e: a918                     dc.w       $a918
0370: 2f2dc02a                 move.l     -$3fd6(a5), -(a7)
0374: 205f                     movea.l    (a7)+, a0
0376: a029                     dc.w       $a029
0378: 206dc02a                 movea.l    -$3fd6(a5), a0
037c: 2850                     movea.l    (a0), a4
037e: 422c0002                 clr.b      $2(a4)
0382: 422c0102                 clr.b      $102(a4)
0386: 422c0202                 clr.b      $202(a4)
038a: 422c0203                 clr.b      $203(a4)
038e: 42ac0204                 clr.l      $204(a4)
0392: 42ac020c                 clr.l      $20c(a4)
0396: 42ac0210                 clr.l      $210(a4)
039a: 42ac0214                 clr.l      $214(a4)
039e: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
03a2: 3f3c0005                 move.w     #$5, -(a7)
03a6: 486efee0                 pea.l      -$120(a6)
03aa: 486c0208                 pea.l      $208(a4)
03ae: 486efed8                 pea.l      -$128(a6)
03b2: a98d                     dc.w       $a98d
03b4: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
03b8: 3f3c0006                 move.w     #$6, -(a7)
03bc: 486efee0                 pea.l      -$120(a6)
03c0: 486c0218                 pea.l      $218(a4)
03c4: 486efed8                 pea.l      -$128(a6)
03c8: a98d                     dc.w       $a98d
03ca: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
03ce: 3f3c0007                 move.w     #$7, -(a7)
03d2: 486efee0                 pea.l      -$120(a6)
03d6: 486c021c                 pea.l      $21c(a4)
03da: 486efed8                 pea.l      -$128(a6)
03de: a98d                     dc.w       $a98d
03e0: 2f2dbe36                 move.l     -$41ca(a5), -(a7)
03e4: 3f3c0008                 move.w     #$8, -(a7)
03e8: 486efee0                 pea.l      -$120(a6)
03ec: 486c0220                 pea.l      $220(a4)
03f0: 486efed8                 pea.l      -$128(a6)
03f4: a98d                     dc.w       $a98d
03f6: 2f2dc02a                 move.l     -$3fd6(a5), -(a7)
03fa: 205f                     movea.l    (a7)+, a0
03fc: a02a                     dc.w       $a02a
03fe: 422dbdb7                 clr.b      -$4249(a5)
0402: 41edbe3a                 lea.l      -$41c6(a5), a0
0406: 2b48be2e                 move.l     a0, -$41d2(a5)
040a: 42adc030                 clr.l      -$3fd0(a5)
040e: 42adbe2a                 clr.l      -$41d6(a5)
0412: 422df9da                 clr.b      -$626(a5)
0416: 486dbe16                 pea.l      -$41ea(a5)
041a: 4ebafbe8                 jsr        $4(pc)
041e: 3b7c0096c384             move.w     #$96, -$3c7c(a5)
0424: 3b7c012cc386             move.w     #$12c, -$3c7a(a5)
042a: 3b7c0258c388             move.w     #$258, -$3c78(a5)
0430: 486efed8                 pea.l      -$128(a6)
0434: 4267                     clr.w      -(a7)
0436: 4267                     clr.w      -(a7)
0438: 3f3c000b                 move.w     #$b, -(a7)
043c: 3f3c000b                 move.w     #$b, -(a7)
0440: a8a7                     dc.w       $a8a7
0442: 7e01                     moveq      #$1, d7
0444: 3007                     move.w     d7, d0
0446: c1fc0024                 muls.w     #$24, d0
044a: 3207                     move.w     d7, d1
044c: c3fc0024                 muls.w     #$24, d1
0450: 0640c376                 addi.w     #$c376, d0
0454: 41f50000                 lea.l      (a5, d0.w), a0
0458: 0641c368                 addi.w     #$c368, d1
045c: 2b881000                 move.l     a0, (a5, d1.w)
0460: 3007                     move.w     d7, d0
0462: c1fc0024                 muls.w     #$24, d0
0466: 0640c36c                 addi.w     #$c36c, d0
046a: 3bbc00020000             move.w     #$2, (a5, d0.w)
0470: 3007                     move.w     d7, d0
0472: c1fc0024                 muls.w     #$24, d0
0476: 41eefed8                 lea.l      -$128(a6), a0
047a: 0640c36e                 addi.w     #$c36e, d0
047e: 43f50000                 lea.l      (a5, d0.w), a1
0482: 22d8                     move.l     (a0)+, (a1)+
0484: 22d8                     move.l     (a0)+, (a1)+
0486: 594f                     subq.w     #$4, a7
0488: 2f3c524f424f             move.l     #$524f424f, -(a7)
048e: 3007                     move.w     d7, d0
0490: 0640007f                 addi.w     #$7f, d0
0494: 3f00                     move.w     d0, -(a7)
0496: a9a0                     dc.w       $a9a0
0498: 265f                     movea.l    (a7)+, a3
049a: 7c01                     moveq      #$1, d6
049c: 2053                     movea.l    (a3), a0
049e: 7000                     moveq      #$0, d0
04a0: 103060ff                 move.b     -$1(a0, d6.w), d0
04a4: 3207                     move.w     d7, d1
04a6: c3fc0024                 muls.w     #$24, d1
04aa: d246                     add.w      d6, d1
04ac: 0641c375                 addi.w     #$c375, d1
04b0: 1b801000                 move.b     d0, (a5, d1.w)
04b4: 5246                     addq.w     #$1, d6
04b6: 0c460016                 cmpi.w     #$16, d6
04ba: 6fe0                     ble.b      $49c
04bc: 2f0b                     move.l     a3, -(a7)
04be: a9a3                     dc.w       $a9a3
04c0: 5247                     addq.w     #$1, d7
04c2: 0c470005                 cmpi.w     #$5, d7
04c6: 6f00ff7c                 ble.w      $444
04ca: 4247                     clr.w      d7
04cc: 594f                     subq.w     #$4, a7
04ce: 2f3c52414452             move.l     #$52414452, -(a7)
04d4: 3007                     move.w     d7, d0
04d6: 06400080                 addi.w     #$80, d0
04da: 3f00                     move.w     d0, -(a7)
04dc: a9a0                     dc.w       $a9a0
04de: 265f                     movea.l    (a7)+, a3
04e0: 7c01                     moveq      #$1, d6
04e2: 3006                     move.w     d6, d0
04e4: c1fc0360                 muls.w     #$360, d0
04e8: 3207                     move.w     d7, d1
04ea: c3fc0024                 muls.w     #$24, d1
04ee: d041                     add.w      d1, d0
04f0: 3206                     move.w     d6, d1
04f2: c3fc0360                 muls.w     #$360, d1
04f6: 3407                     move.w     d7, d2
04f8: c5fc0024                 muls.w     #$24, d2
04fc: d242                     add.w      d2, d1
04fe: 0640c0ee                 addi.w     #$c0ee, d0
0502: 41f50000                 lea.l      (a5, d0.w), a0
0506: 0641c0e0                 addi.w     #$c0e0, d1
050a: 2b881000                 move.l     a0, (a5, d1.w)
050e: 3006                     move.w     d6, d0
0510: c1fc0360                 muls.w     #$360, d0
0514: 3207                     move.w     d7, d1
0516: c3fc0024                 muls.w     #$24, d1
051a: d041                     add.w      d1, d0
051c: 0640c0e4                 addi.w     #$c0e4, d0
0520: 3bbc00020000             move.w     #$2, (a5, d0.w)
0526: 3006                     move.w     d6, d0
0528: c1fc0360                 muls.w     #$360, d0
052c: 3207                     move.w     d7, d1
052e: c3fc0024                 muls.w     #$24, d1
0532: d041                     add.w      d1, d0
0534: 41eefed8                 lea.l      -$128(a6), a0
0538: 0640c0e6                 addi.w     #$c0e6, d0
053c: 43f50000                 lea.l      (a5, d0.w), a1
0540: 22d8                     move.l     (a0)+, (a1)+
0542: 22d8                     move.l     (a0)+, (a1)+
0544: 7801                     moveq      #$1, d4
0546: 3006                     move.w     d6, d0
0548: c1fc0024                 muls.w     #$24, d0
054c: 3206                     move.w     d6, d1
054e: c3fc0360                 muls.w     #$360, d1
0552: 3407                     move.w     d7, d2
0554: c5fc0024                 muls.w     #$24, d2
0558: d242                     add.w      d2, d1
055a: 0640c376                 addi.w     #$c376, d0
055e: 41f50000                 lea.l      (a5, d0.w), a0
0562: 0641c0ee                 addi.w     #$c0ee, d1
0566: 43f51000                 lea.l      (a5, d1.w), a1
056a: 7004                     moveq      #$4, d0
056c: 22d8                     move.l     (a0)+, (a1)+
056e: 51c8fffc                 dbra       d0, $56c
0572: 32d8                     move.w     (a0)+, (a1)+
0574: 5244                     addq.w     #$1, d4
0576: 0c440016                 cmpi.w     #$16, d4
057a: 6fca                     ble.b      $546
057c: 7801                     moveq      #$1, d4
057e: 3006                     move.w     d6, d0
0580: c1fc0360                 muls.w     #$360, d0
0584: 3207                     move.w     d7, d1
0586: c3fc0024                 muls.w     #$24, d1
058a: d041                     add.w      d1, d0
058c: 3204                     move.w     d4, d1
058e: 5441                     addq.w     #$2, d1
0590: d041                     add.w      d1, d0
0592: 7200                     moveq      #$0, d1
0594: 0640c0ed                 addi.w     #$c0ed, d0
0598: 12350000                 move.b     (a5, d0.w), d1
059c: 48c1                     ext.l      d1
059e: 2053                     movea.l    (a3), a0
05a0: 7000                     moveq      #$0, d0
05a2: 103040ff                 move.b     -$1(a0, d4.w), d0
05a6: 48c0                     ext.l      d0
05a8: 8280                     or.l       d0, d1
05aa: 3006                     move.w     d6, d0
05ac: c1fc0360                 muls.w     #$360, d0
05b0: 3407                     move.w     d7, d2
05b2: c5fc0024                 muls.w     #$24, d2
05b6: d042                     add.w      d2, d0
05b8: 3404                     move.w     d4, d2
05ba: 5442                     addq.w     #$2, d2
05bc: d042                     add.w      d2, d0
05be: 0640c0ed                 addi.w     #$c0ed, d0
05c2: 1b810000                 move.b     d1, (a5, d0.w)
05c6: 5244                     addq.w     #$1, d4
05c8: 0c440014                 cmpi.w     #$14, d4
05cc: 6fb0                     ble.b      $57e
05ce: 5246                     addq.w     #$1, d6
05d0: 0c460005                 cmpi.w     #$5, d6
05d4: 6f00ff0c                 ble.w      $4e2
05d8: 2f0b                     move.l     a3, -(a7)
05da: a9a3                     dc.w       $a9a3
05dc: 5247                     addq.w     #$1, d7
05de: 0c470017                 cmpi.w     #$17, d7
05e2: 6f00fee8                 ble.w      $4cc
05e6: 426dbdb2                 clr.w      -$424e(a5)
05ea: 1b7c0001f91c             move.b     #$1, -$6e4(a5)
05f0: 422df91d                 clr.b      -$6e3(a5)
05f4: 4267                     clr.w      -(a7)
05f6: 4ead002a                 jsr        $2a(a5) ; CODE 4 resource+0x0004
05fa: 4cdf18f8                 movem.l    (a7)+, d3-d7/a3-a4
05fe: 4e5e                     unlk       a6
0600: 4e75                     rts        
0602: 064d                     .byte      0x06, 0x4d
0604: 6f6e                     ble.b      $674
0606: 6163                     bsr.b      $66b
0608: 6f80                     ble.b      $58a
060a: 3ff9                     .byte      0x3f, 0xf9
060c: 8efa3554                 divu.w     $3b62(pc), d7
0610: 8f682c29                 or.w       d7, $2c29(a0)
0614: 4009                     .byte      0x40, 0x09
0616: c800                     and.b      d0, d4
0618: 00000000                 ori.b      #$0, d0
061c: 0000                     ori.b      #$aa, d0
