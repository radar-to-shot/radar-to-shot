/* Ghidra 11.3.2 decompiler output. Analysis aid, not reconstructed original source. */
/* Synthetic addresses: CODE n at n*0x10000; A5=0x100000. */
/* Original bytes retained. Pascal stack ABI and Toolbox calls may be unresolved. */


/* CODE 2 + 0x0004, synthetic address 0x00020004 */

/* Original CODE 2 resource offset 0x0004 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE2_0004(undefined4 *param_1)

{
  long lVar1;
  int iVar2;
  undefined4 local_1c;
  undefined4 local_18;
  
  local_1c = *param_1;
  local_18 = param_1[1];
  iVar2 = 1;
  do {
    lVar1 = (long)(iVar2 * 0xa6 + -0x4072);
    *(undefined1 *)(lVar1 + 0x100008) = 0;
    *(undefined4 *)(lVar1 + 0x100000) = local_1c;
    *(undefined4 *)(lVar1 + 0x100004) = local_18;
    local_1c = CONCAT22(*(int *)(lVar1 + 0x100000) + 0x12,*(int *)(lVar1 + 0x100002) + 0x12);
    local_18 = CONCAT22(*(undefined2 *)(lVar1 + 0x100004),*(int *)(lVar1 + 0x100006) + 0x12);
    iVar2 = iVar2 + 1;
  } while (iVar2 < 6);
  return;
}



/* CODE 2 + 0x0070, synthetic address 0x00020070 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* WARNING: Restarted to delay deadcode elimination for space: ram */
/* Original CODE 2 resource offset 0x0070 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE2_0070(void)

{
  long lVar1;
  long *plVar2;
  bool bVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  undefined4 *puVar8;
  undefined4 *puVar10;
  undefined1 *puVar12;
  undefined1 *puVar13;
  undefined1 *puVar14;
  undefined1 *puVar15;
  undefined1 *puVar16;
  undefined1 *puVar17;
  undefined1 *puVar18;
  bool bVar19;
  undefined1 auStack_166 [4];
  undefined4 uStack_146;
  undefined4 uStack_142;
  undefined2 uStack_13e;
  int local_13c;
  undefined1 auStack_13a [8];
  int local_132;
  undefined4 uStack_12c;
  undefined4 uStack_128;
  undefined1 auStack_124 [4];
  undefined1 auStack_120 [264];
  undefined1 auStack_18 [2];
  int local_16 [9];
  undefined4 *puVar9;
  undefined4 *puVar11;
  
  JT_CODE1_053a();
  DAT_000fbde2 = 0x1000;
  iVar7 = 0;
  puVar14 = auStack_166;
  do {
    puVar12 = puVar14;
    *(undefined1 **)(puVar12 + -8) = auStack_13a;
    *(int **)(puVar12 + -0xc) = &local_13c;
    *(undefined4 **)(puVar12 + -0x10) = &uStack_146;
    uStack_146 = DAT_0002060a;
    uStack_142 = DAT_0002060e;
    uStack_13e = DAT_00020612;
    *(undefined2 *)(puVar12 + -0x12) = 0x2004;
    __mac_toolbox(0xa9eb);
    *(undefined4 **)(puVar12 + -0x16) = &uStack_146;
    *(undefined4 *)(puVar12 + -0x1a) = 0x200b6;
    local_13c = iVar7;
    JT_CODE1_0198();
    *(undefined **)(puVar12 + -0x16) = &DAT_00020614;
    *(undefined1 **)(puVar12 + -0x1a) = auStack_13a;
    *(undefined2 *)(puVar12 + -0x1c) = 4;
    __mac_toolbox(0xa9eb);
    *(undefined1 **)(puVar12 + -0x20) = auStack_13a;
    *(undefined4 *)(puVar12 + -0x24) = 0x200ce;
    JT_CODE1_020a();
    *(undefined2 *)((long)(iVar7 * 2 + -0x866) + 0x100000) = *(undefined2 *)(puVar12 + -0x1e);
    iVar7 = iVar7 + 1;
    puVar14 = puVar12 + -0x1c;
  } while (iVar7 < 0x5b);
  iVar7 = 0x5b;
  do {
    *(undefined2 *)((long)(iVar7 * 2 + -0x866) + 0x100000) =
         *(undefined2 *)((long)((0xb4 - iVar7) * 2 + -0x866) + 0x100000);
    iVar7 = iVar7 + 1;
  } while (iVar7 < 0xb5);
  *(int **)(puVar12 + -0x20) = local_16;
  *(undefined1 **)(puVar12 + -0x24) = auStack_18;
  *(undefined4 *)(puVar12 + -0x28) = 0x20114;
  JT_CODE1_055c();
  DAT_000fbdb4 = 0x74 < local_16[0];
  if ((bool)DAT_000fbdb4) {
    *(undefined2 *)(puVar12 + -0x26) = _DAT_00000baa;
    DAT_000fc372 = *(int *)(puVar12 + -0x26);
  }
  else {
    DAT_000fc372 = 0x14;
  }
  *(undefined2 *)(puVar12 + -0x2a) = 0x80;
  __mac_toolbox(0xa9c0);
  DAT_000fbdda = *(undefined4 *)(puVar12 + -0x2a);
  *(undefined4 *)(puVar12 + -0x2a) = DAT_000fbdda;
  __mac_toolbox(0xa93c);
  iVar7 = 0x80;
  puVar14 = puVar12 + -0x2a;
  do {
    puVar13 = puVar14;
    *(int *)(puVar13 + -6) = iVar7;
    __mac_toolbox(0xa949);
    *(undefined4 *)((long)(iVar7 * 4 + -0x440a) + 0x100000) = *(undefined4 *)(puVar13 + -6);
    iVar7 = iVar7 + 1;
    puVar14 = puVar13 + -2;
  } while (iVar7 < 0x88);
  *(undefined4 *)(puVar13 + -6) = DAT_000fbdf6;
  *(undefined4 *)(puVar13 + -10) = 0x44525652;
  __mac_toolbox(0xa94d);
  *(undefined4 *)(puVar13 + -0xe) = DAT_000fbe06;
  *(undefined4 *)(puVar13 + -0x12) = 0x464f4e54;
  __mac_toolbox(0xa94d);
  *(undefined4 *)(puVar13 + -0x16) = DAT_000fbdfe;
  *(undefined2 *)(puVar13 + -0x18) = 0;
  __mac_toolbox(0xa93a);
  *(undefined4 *)(puVar13 + -0x1c) = DAT_000fbe02;
  *(undefined2 *)(puVar13 + -0x1e) = 0;
  __mac_toolbox(0xa93a);
  *(undefined4 *)(puVar13 + -0x22) = DAT_000fbe06;
  *(undefined2 *)(puVar13 + -0x24) = 0;
  __mac_toolbox(0xa93a);
  *(undefined4 *)(puVar13 + -0x28) = DAT_000fbe0a;
  *(undefined2 *)(puVar13 + -0x2a) = 0;
  __mac_toolbox(0xa93a);
  *(undefined4 *)(puVar13 + -0x2e) = DAT_000fbe0e;
  *(undefined2 *)(puVar13 + -0x30) = 0;
  __mac_toolbox(0xa93a);
  DAT_000fbdb9 = 1;
  *(undefined4 *)(puVar13 + -0x34) = DAT_000fbdfe;
  *(undefined2 *)(puVar13 + -0x36) = 0xf;
  puVar13[-0x38] = 1;
  __mac_toolbox(0xa945);
  __mac_toolbox(0xa937);
  DAT_000ff90c = 9;
  DAT_000ff90e = 10;
  DAT_000ff910 = 0xc;
  DAT_000ff912 = 0xe;
  DAT_000ff914 = 0x12;
  DAT_000ff916 = 0x14;
  DAT_000ff918 = 0x18;
  DAT_000ff91a = 0x24;
  *(undefined4 *)(puVar13 + -0x3c) = DAT_000fbe0a;
  *(undefined2 *)(puVar13 + -0x3e) = 1;
  puVar13[-0x40] = 1;
  __mac_toolbox(0xa945);
  DAT_000fbdea = 1;
  DAT_000fbdee = 9;
  bVar3 = false;
  *(undefined4 *)(puVar13 + -0x46) = DAT_000fbe06;
  __mac_toolbox(0xa950);
  DAT_000fbde6 = *(int *)(puVar13 + -0x46);
  iVar7 = 1;
  puVar14 = puVar13 + -0x44;
  local_132 = DAT_000fbde6;
  do {
    puVar16 = puVar14;
    if (local_132 < iVar7) break;
    *(undefined4 *)(puVar14 + -4) = DAT_000fbe06;
    *(int *)(puVar14 + -6) = iVar7;
    bVar19 = iVar7 == 0;
    *(undefined1 **)(puVar14 + -10) = auStack_120;
    __mac_toolbox(0xa946);
    *(undefined **)(puVar14 + -0xe) = &DAT_00020602;
    puVar16 = puVar14 + -0x12;
    *(undefined1 **)(puVar14 + -0x12) = auStack_120;
    *(undefined4 *)(puVar14 + -0x16) = 0x20244;
    JT_CODE1_028c();
    if (bVar19) {
      *(undefined4 *)(puVar14 + -0x16) = DAT_000fbe06;
      *(int *)(puVar14 + -0x18) = iVar7;
      puVar16 = puVar14 + -0x1a;
      puVar14[-0x1a] = 1;
      __mac_toolbox(0xa945);
      bVar3 = true;
      DAT_000fbde8 = iVar7;
    }
    bVar19 = SCARRY2(iVar7,1);
    iVar7 = iVar7 + 1;
    puVar14 = puVar16;
  } while (!bVar19);
  if (!bVar3) {
    *(undefined4 *)(puVar16 + -4) = DAT_000fbe06;
    *(undefined2 *)(puVar16 + -6) = 1;
    puVar15 = puVar16 + -8;
    puVar16 = puVar16 + -8;
    *puVar15 = 1;
    __mac_toolbox(0xa945);
    DAT_000fbde8 = 1;
  }
  *(undefined4 *)(puVar16 + -4) = 0x20280;
  JT_CODE4_10fc();
  DAT_000ff908 = DAT_000fff5c - DAT_000fff58;
  DAT_000ff90a = DAT_000fff5a - DAT_000fff56;
  *(undefined4 **)(puVar16 + -4) = &DAT_000fbe16;
  *(undefined2 *)(puVar16 + -6) = 3;
  *(int *)(puVar16 + -8) = DAT_000fc372 + 0x15;
  *(int *)(puVar16 + -10) = DAT_000ff908 + -100;
  *(int *)(puVar16 + -0xc) = DAT_000ff90a + -4;
  __mac_toolbox(0xa8a7);
  *(undefined **)(puVar16 + -0x10) = &DAT_000fbe1e;
  *(undefined2 *)(puVar16 + -0x12) = 3;
  *(int *)(puVar16 + -0x14) = DAT_000ff90a + -0x50;
  *(int *)(puVar16 + -0x16) = DAT_000ff908 + -4;
  *(int *)(puVar16 + -0x18) = DAT_000ff90a + -4;
  __mac_toolbox(0xa8a7);
  DAT_000fbdb5 = 0;
  DAT_000fbdf4 = 0;
  DAT_000fbdf0 = 0;
  DAT_000fbdf2 = 0;
  DAT_000fbdba = 0xd;
  DAT_000fbdbc = 8;
  DAT_000fbdbe = 9;
  DAT_000fbdc0 = 3;
  *(undefined2 *)(puVar16 + -0x1e) = 1;
  __mac_toolbox(0xa9b9);
  DAT_000fbdc2 = *(undefined4 *)(puVar16 + -0x1e);
  *(undefined2 *)(puVar16 + -0x20) = 4;
  __mac_toolbox(0xa9b9);
  DAT_000fbdc6 = *(undefined4 *)(puVar16 + -0x20);
  *(undefined2 *)(puVar16 + -0x22) = 0x8b;
  *(undefined **)(puVar16 + -0x26) = &DAT_000fbed6;
  *(undefined4 *)(puVar16 + -0x2a) = 0xffffffff;
  __mac_toolbox(0xa97c);
  DAT_000fbe32 = *(undefined4 *)(puVar16 + -0x2a);
  *(undefined2 *)(puVar16 + -0x2c) = 0x8c;
  *(undefined **)(puVar16 + -0x30) = &DAT_000fbf80;
  *(undefined4 *)(puVar16 + -0x34) = 0xffffffff;
  __mac_toolbox(0xa97c);
  DAT_000fbe36 = *(undefined4 *)(puVar16 + -0x34);
  *(undefined4 *)(puVar16 + -0x38) = 0x224;
  *(undefined4 *)(puVar16 + -0x3c) = 0x20358;
  JT_CODE1_053a();
  DAT_000fc02a = *(long **)(puVar16 + -0x38);
  *(undefined4 *)(puVar16 + -0x38) = DAT_000fbe32;
  *(long **)(puVar16 + -0x3c) = DAT_000fc02a;
  __mac_toolbox(0xa918);
  *(undefined4 *)(puVar16 + -0x40) = DAT_000fbe36;
  *(long **)(puVar16 + -0x44) = DAT_000fc02a;
  __mac_toolbox(0xa918);
  *(long **)(puVar16 + -0x48) = DAT_000fc02a;
  __mac_toolbox(0xa029);
  lVar1 = *DAT_000fc02a;
  *(undefined1 *)(lVar1 + 2) = 0;
  *(undefined1 *)(lVar1 + 0x102) = 0;
  *(undefined1 *)(lVar1 + 0x202) = 0;
  *(undefined1 *)(lVar1 + 0x203) = 0;
  *(undefined4 *)(lVar1 + 0x204) = 0;
  *(undefined4 *)(lVar1 + 0x20c) = 0;
  *(undefined4 *)(lVar1 + 0x210) = 0;
  *(undefined4 *)(lVar1 + 0x214) = 0;
  *(undefined4 *)(puVar16 + -0x48) = DAT_000fbe36;
  *(undefined2 *)(puVar16 + -0x4a) = 5;
  *(undefined1 **)(puVar16 + -0x4e) = auStack_124;
  *(long *)(puVar16 + -0x52) = lVar1 + 0x208;
  *(undefined4 **)(puVar16 + -0x56) = &uStack_12c;
  __mac_toolbox(0xa98d);
  *(undefined4 *)(puVar16 + -0x5a) = DAT_000fbe36;
  *(undefined2 *)(puVar16 + -0x5c) = 6;
  *(undefined1 **)(puVar16 + -0x60) = auStack_124;
  *(long *)(puVar16 + -100) = lVar1 + 0x218;
  *(undefined4 **)(puVar16 + -0x68) = &uStack_12c;
  __mac_toolbox(0xa98d);
  *(undefined4 *)(puVar16 + -0x6c) = DAT_000fbe36;
  *(undefined2 *)(puVar16 + -0x6e) = 7;
  *(undefined1 **)(puVar16 + -0x72) = auStack_124;
  *(long *)(puVar16 + -0x76) = lVar1 + 0x21c;
  *(undefined4 **)(puVar16 + -0x7a) = &uStack_12c;
  __mac_toolbox(0xa98d);
  *(undefined4 *)(puVar16 + -0x7e) = DAT_000fbe36;
  *(undefined2 *)(puVar16 + -0x80) = 8;
  *(undefined1 **)(puVar16 + -0x84) = auStack_124;
  *(long *)(puVar16 + -0x88) = lVar1 + 0x220;
  *(undefined4 **)(puVar16 + -0x8c) = &uStack_12c;
  __mac_toolbox(0xa98d);
  *(long **)(puVar16 + -0x90) = DAT_000fc02a;
  __mac_toolbox(0xa02a);
  DAT_000fbdb7 = 0;
  DAT_000fbe2e = &DAT_000fbe3a;
  DAT_000fc030 = 0;
  DAT_000fbe2a = 0;
  DAT_000ff9da = 0;
  *(undefined4 **)(puVar16 + -0x90) = &DAT_000fbe16;
  *(undefined4 *)(puVar16 + -0x94) = 0x2041e;
  CODE2_0004();
  DAT_000fc384 = 0x96;
  DAT_000fc386 = 300;
  DAT_000fc388 = 600;
  *(undefined4 **)(puVar16 + -0x94) = &uStack_12c;
  *(undefined2 *)(puVar16 + -0x96) = 0;
  *(undefined2 *)(puVar16 + -0x98) = 0;
  *(undefined2 *)(puVar16 + -0x9a) = 0xb;
  *(undefined2 *)(puVar16 + -0x9c) = 0xb;
  __mac_toolbox(0xa8a7);
  iVar7 = 1;
  puVar14 = puVar16 + -0x9c;
  do {
    puVar17 = puVar14;
    *(long *)((long)(iVar7 * 0x24 + -0x3c98) + 0x100000) = (long)(iVar7 * 0x24 + -0x3c8a) + 0x100000
    ;
    *(undefined2 *)((long)(iVar7 * 0x24 + -0x3c94) + 0x100000) = 2;
    lVar1 = (long)(iVar7 * 0x24 + -0x3c92);
    *(undefined4 *)(lVar1 + 0x100000) = uStack_12c;
    *(undefined4 *)(lVar1 + 0x100004) = uStack_128;
    *(undefined4 *)(puVar17 + -8) = 0x524f424f;
    *(int *)(puVar17 + -10) = iVar7 + 0x7f;
    __mac_toolbox(0xa9a0);
    plVar2 = *(long **)(puVar17 + -10);
    iVar6 = 1;
    do {
      *(undefined1 *)((long)(iVar6 + iVar7 * 0x24 + -0x3c8b) + 0x100000) =
           *(undefined1 *)(*plVar2 + -1 + (long)iVar6);
      iVar6 = iVar6 + 1;
    } while (iVar6 < 0x17);
    *(long **)(puVar17 + -10) = plVar2;
    __mac_toolbox(0xa9a3);
    iVar7 = iVar7 + 1;
    puVar14 = puVar17 + -10;
  } while (iVar7 < 6);
  iVar7 = 0;
  puVar14 = puVar17;
  do {
    puVar18 = puVar14;
    *(undefined4 *)(puVar18 + -0x12) = 0x52414452;
    *(int *)(puVar18 + -0x14) = iVar7 + 0x80;
    __mac_toolbox(0xa9a0);
    plVar2 = *(long **)(puVar18 + -0x14);
    iVar6 = 1;
    do {
      *(long *)((long)(iVar7 * 0x24 + iVar6 * 0x360 + -0x3f20) + 0x100000) =
           (long)(iVar7 * 0x24 + iVar6 * 0x360 + -0x3f12) + 0x100000;
      *(undefined2 *)((long)(iVar7 * 0x24 + iVar6 * 0x360 + -0x3f1c) + 0x100000) = 2;
      lVar1 = (long)(iVar7 * 0x24 + iVar6 * 0x360 + -0x3f1a);
      *(undefined4 *)(lVar1 + 0x100000) = uStack_12c;
      *(undefined4 *)(lVar1 + 0x100004) = uStack_128;
      iVar5 = 1;
      do {
        iVar4 = 4;
        puVar8 = (undefined4 *)((long)(iVar6 * 0x24 + -0x3c8a) + 0x100000);
        puVar10 = (undefined4 *)((long)(iVar7 * 0x24 + iVar6 * 0x360 + -0x3f12) + 0x100000);
        do {
          puVar9 = puVar8 + 1;
          puVar11 = puVar10 + 1;
          *puVar10 = *puVar8;
          iVar4 = iVar4 + -1;
          puVar8 = puVar9;
          puVar10 = puVar11;
        } while (iVar4 != -1);
        *(undefined2 *)puVar11 = *(undefined2 *)puVar9;
        iVar5 = iVar5 + 1;
      } while (iVar5 < 0x17);
      iVar5 = 1;
      do {
        *(byte *)((long)(iVar5 + iVar7 * 0x24 + iVar6 * 0x360 + -0x3f11) + 0x100000) =
             *(byte *)(*plVar2 + -1 + (long)iVar5) |
             *(byte *)((long)(iVar5 + iVar7 * 0x24 + iVar6 * 0x360 + -0x3f11) + 0x100000);
        iVar5 = iVar5 + 1;
      } while (iVar5 < 0x15);
      iVar6 = iVar6 + 1;
    } while (iVar6 < 6);
    *(long **)(puVar18 + -0x14) = plVar2;
    __mac_toolbox(0xa9a3);
    iVar7 = iVar7 + 1;
    puVar14 = puVar18 + -10;
  } while (iVar7 < 0x18);
  DAT_000fbdb2 = 0;
  DAT_000ff91c = 1;
  DAT_000ff91d = 0;
  *(undefined2 *)(puVar18 + -0x16) = 0;
  *(undefined4 *)(puVar18 + -0x1a) = 0x205fa;
  JT_CODE4_0004();
  return;
}


