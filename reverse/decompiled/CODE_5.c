/* Ghidra 11.3.2 decompiler output. Analysis aid, not reconstructed original source. */
/* Synthetic addresses: CODE n at n*0x10000; A5=0x100000. */
/* Original bytes retained. Pascal stack ABI and Toolbox calls may be unresolved. */


/* CODE 5 + 0x0004, synthetic address 0x00050004 */

/* WARNING: Unknown calling convention */
/* Original CODE 5 resource offset 0x0004 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE5_0004(void)

{
  undefined2 in_stack_00000004;
  short sVar1;
  
  switch(in_stack_00000004) {
  case 0:
    sVar1 = 100;
    break;
  case 1:
    sVar1 = 0x4b;
    break;
  case 2:
    sVar1 = 0x32;
    break;
  case 3:
    sVar1 = 0x28;
    break;
  case 4:
    sVar1 = 0x1e;
    break;
  case 5:
    sVar1 = 0x14;
    break;
  case 6:
    sVar1 = 0x11;
    break;
  case 7:
    sVar1 = 0xe;
    break;
  case 8:
    sVar1 = 10;
    break;
  case 9:
    sVar1 = 5;
    break;
  case 10:
    sVar1 = 1;
    break;
  default:
    sVar1 = 0;
  }
  return sVar1;
}



/* CODE 5 + 0x00a2, synthetic address 0x000500a2 */

/* Original CODE 5 resource offset 0x00a2 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_00a2(int param_1,int param_2,undefined4 *param_3,int *param_4,int *param_5,int *param_6)

{
  undefined4 uVar1;
  undefined4 uVar2;
  int local_1c;
  int local_1a;
  int local_18;
  int local_16;
  
  uVar1 = *param_3;
  uVar2 = param_3[1];
  local_1c = (int)((ulong)uVar1 >> 0x10);
  if (local_1c - param_1 < 0) {
    local_18 = (int)((ulong)uVar2 >> 0x10);
    if (param_1 - local_18 < 0) {
      *param_6 = 0;
      *param_4 = 0;
    }
    else {
      *param_6 = 2;
      *param_4 = param_1 - local_18;
    }
  }
  else {
    *param_6 = 1;
    *param_4 = local_1c - param_1;
  }
  local_1a = (int)uVar1;
  if (local_1a - param_2 < 0) {
    local_16 = (int)uVar2;
    if (param_2 - local_16 < 0) {
      *param_5 = 0;
    }
    else {
      *param_6 = *param_6 + 6;
      *param_5 = param_2 - local_16;
    }
  }
  else {
    *param_6 = *param_6 + 3;
    *param_5 = local_1a - param_2;
  }
  return;
}



/* CODE 5 + 0x014a, synthetic address 0x0005014a */

/* Original CODE 5 resource offset 0x014a (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_014a(undefined4 param_1,undefined4 *param_2,undefined4 *param_3)

{
  int *piVar1;
  int *piVar2;
  undefined4 *puVar3;
  undefined2 local_46;
  short local_44;
  undefined4 uStack_42;
  undefined4 local_3e;
  undefined4 *puStack_3a;
  undefined1 *puStack_36;
  undefined2 *puStack_32;
  int *piStack_2e;
  undefined1 local_22 [2];
  undefined2 local_20;
  int local_1e;
  undefined4 local_1c;
  undefined4 local_18;
  
  local_1c = *param_2;
  local_18 = param_2[1];
  piStack_2e = &local_1e;
  puStack_32 = &local_20;
  puStack_36 = local_22;
  puStack_3a = &local_1c;
  puVar3 = &local_3e;
  local_3e = param_1;
  uStack_42 = (undefined4 *)0x50172;
  CODE5_00a2();
  if (local_1e == 0) {
    __mac_toolbox(0xa861);
    if (uStack_42._2_2_ < 0) {
      uStack_42._2_2_ = -uStack_42._2_2_;
    }
    local_1e = uStack_42._2_2_ % 8 + 1;
  }
  switch(local_1e) {
  case 1:
    uStack_42 = &local_1c;
    local_44 = 0;
    CODE5_0004();
    puVar3 = (undefined4 *)&local_46;
    __mac_toolbox(0xa8a8);
    break;
  case 2:
    uStack_42 = &local_1c;
    local_44 = 0;
    CODE5_0004();
    puVar3 = (undefined4 *)&local_46;
    __mac_toolbox(0xa8a8);
    break;
  case 3:
    uStack_42 = &local_1c;
    local_46 = local_20;
    CODE5_0004();
    puVar3 = (undefined4 *)&local_46;
    __mac_toolbox(0xa8a8);
    break;
  case 4:
    uStack_42 = &local_1c;
    local_46 = local_20;
    local_44 = CODE5_0004();
    local_44 = local_44 / 2;
    CODE5_0004();
    puVar3 = (undefined4 *)&local_46;
    __mac_toolbox(0xa8a8);
    break;
  case 5:
    uStack_42 = &local_1c;
    local_46 = local_20;
    local_44 = CODE5_0004();
    local_44 = local_44 / 2;
    CODE5_0004();
    puVar3 = (undefined4 *)&local_46;
    __mac_toolbox(0xa8a8);
    break;
  case 6:
    uStack_42 = &local_1c;
    local_46 = local_20;
    CODE5_0004();
    puVar3 = (undefined4 *)&local_46;
    __mac_toolbox(0xa8a8);
    break;
  case 7:
    uStack_42 = &local_1c;
    local_46 = local_20;
    local_44 = CODE5_0004();
    local_44 = -(local_44 / 2);
    CODE5_0004();
    puVar3 = (undefined4 *)&local_46;
    __mac_toolbox(0xa8a8);
    break;
  case 8:
    uStack_42 = &local_1c;
    local_46 = local_20;
    local_44 = CODE5_0004();
    local_44 = -(local_44 / 2);
    CODE5_0004();
    puVar3 = (undefined4 *)&local_46;
    __mac_toolbox(0xa8a8);
  }
  if (local_1c._2_2_ < 1) {
    *(undefined4 **)((long)puVar3 + -4) = &local_1c;
    *(undefined2 *)((long)puVar3 + -6) = 1;
    *(int *)((long)puVar3 + -8) = local_1c._0_2_;
    *(undefined2 *)((long)puVar3 + -10) = 0x47;
    piVar1 = (int *)((long)puVar3 + -0xc);
    puVar3 = (undefined4 *)((long)puVar3 + -0xc);
    *piVar1 = local_18._0_2_;
    __mac_toolbox(0xa8a7);
  }
  else if (0x1ae < local_18._2_2_) {
    *(undefined4 **)((long)puVar3 + -4) = &local_1c;
    *(undefined2 *)((long)puVar3 + -6) = 0x168;
    *(int *)((long)puVar3 + -8) = local_1c._0_2_;
    *(undefined2 *)((long)puVar3 + -10) = 0x1ae;
    piVar2 = (int *)((long)puVar3 + -0xc);
    puVar3 = (undefined4 *)((long)puVar3 + -0xc);
    *piVar2 = local_18._0_2_;
    __mac_toolbox(0xa8a7);
  }
  if (local_1c._0_2_ < 1) {
    *(undefined4 **)((long)puVar3 + -4) = &local_1c;
    *(int *)((long)puVar3 + -6) = local_1c._2_2_;
    *(undefined2 *)((long)puVar3 + -8) = 1;
    *(int *)((long)puVar3 + -10) = local_18._2_2_;
    *(undefined2 *)((long)puVar3 + -0xc) = 0x1f;
    __mac_toolbox(0xa8a7);
  }
  else if (0xfa < local_18._0_2_) {
    *(undefined4 **)((long)puVar3 + -4) = &local_1c;
    *(int *)((long)puVar3 + -6) = local_1c._2_2_;
    *(undefined2 *)((long)puVar3 + -8) = 0xdc;
    *(int *)((long)puVar3 + -10) = local_18._2_2_;
    *(undefined2 *)((long)puVar3 + -0xc) = 0xfa;
    __mac_toolbox(0xa8a7);
  }
  *param_3 = local_1c;
  param_3[1] = local_18;
  return;
}



/* CODE 5 + 0x0376, synthetic address 0x00050376 */

/* Original CODE 5 resource offset 0x0376 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

undefined4 CODE5_0376(void)

{
  undefined4 uVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  bool bVar4;
  undefined1 *puVar5;
  undefined1 *puVar6;
  undefined1 *puVar7;
  undefined4 uStack_112;
  undefined4 uStack_10e;
  undefined4 local_fc;
  undefined2 local_f8;
  undefined1 auStack_f6 [8];
  undefined4 uStack_ee;
  undefined4 uStack_ea;
  undefined1 auStack_e6 [8];
  undefined4 uStack_de;
  undefined4 uStack_da;
  undefined4 uStack_d6;
  undefined4 uStack_d2;
  undefined4 local_ce;
  undefined4 uStack_ca;
  undefined1 auStack_c6 [174];
  undefined4 local_18 [5];
  
  bVar4 = false;
  __mac_toolbox(0xa850);
  puVar5 = &stack0xfffffee2;
  while( true ) {
    *(undefined2 *)(puVar5 + -4) = 0x40;
    *(undefined2 **)(puVar5 + -8) = &DAT_000fbdca;
    __mac_toolbox(0xa970);
    if (puVar5[-8] == '\0') break;
    *(undefined4 *)(puVar5 + -10) = 0x50388;
    JT_CODE4_00e4();
    puVar5 = puVar5 + -6;
  }
  *(undefined4 **)(puVar5 + -10) = local_18;
  __mac_toolbox(0xa874);
  *(undefined2 *)(puVar5 + -0x10) = 0x80;
  *(undefined1 **)(puVar5 + -0x14) = auStack_c6;
  *(undefined4 *)(puVar5 + -0x18) = 0xffffffff;
  __mac_toolbox(0xa97c);
  uVar1 = *(undefined4 *)(puVar5 + -0x18);
  *(undefined4 *)(puVar5 + -0x18) = uVar1;
  __mac_toolbox(0xa873);
  *(undefined2 *)(puVar5 + -0x1e) = 0x80;
  __mac_toolbox(0xa9bc);
  uVar2 = *(undefined4 *)(puVar5 + -0x1e);
  *(undefined1 **)(puVar5 + -0x1e) = auStack_e6;
  *(undefined2 *)(puVar5 + -0x20) = 1;
  *(undefined2 *)(puVar5 + -0x22) = 1;
  *(undefined2 *)(puVar5 + -0x24) = 0x47;
  *(undefined2 *)(puVar5 + -0x26) = 0x1f;
  __mac_toolbox(0xa8a7);
  *(undefined4 **)(puVar5 + -0x2a) = &uStack_d6;
  *(undefined2 *)(puVar5 + -0x2c) = 0x4b;
  *(undefined2 *)(puVar5 + -0x2e) = 0xaf;
  *(undefined2 *)(puVar5 + -0x30) = 0x91;
  *(undefined2 *)(puVar5 + -0x32) = 0xcd;
  __mac_toolbox(0xa8a7);
  uStack_de = uStack_d6;
  uStack_da = uStack_d2;
  *(undefined4 *)(puVar5 + -0x36) = uVar1;
  __mac_toolbox(0xa981);
  *(undefined4 *)(puVar5 + -0x3e) = 0x230;
  *(undefined4 *)(puVar5 + -0x42) = 0x50406;
  JT_CODE1_0530();
  local_fc = *(undefined4 *)(puVar5 + -0x3e);
  local_f8 = 0xe;
  *(undefined1 **)(puVar5 + -0x3e) = auStack_f6;
  *(undefined2 *)(puVar5 + -0x40) = 0;
  *(undefined2 *)(puVar5 + -0x42) = 0;
  *(undefined2 *)(puVar5 + -0x44) = 0x47;
  *(undefined2 *)(puVar5 + -0x46) = 0x1f;
  __mac_toolbox(0xa8a7);
  *(long *)(puVar5 + -0x4a) = DAT_000fffca + 2;
  *(undefined4 **)(puVar5 + -0x4e) = &local_fc;
  *(undefined4 **)(puVar5 + -0x52) = &uStack_d6;
  *(undefined1 **)(puVar5 + -0x56) = auStack_e6;
  *(undefined2 *)(puVar5 + -0x58) = 0;
  *(undefined4 *)(puVar5 + -0x5c) = 0;
  __mac_toolbox(0xa8ec);
  *(undefined4 *)(puVar5 + -0x60) = uVar2;
  __mac_toolbox(0xa029);
  *(undefined4 *)(puVar5 + -0x60) = uVar2;
  puVar7 = puVar5 + -100;
  *(undefined4 **)(puVar5 + -100) = &uStack_d6;
  __mac_toolbox(0xa8f6);
  do {
    __mac_toolbox(0xa9b4);
    *(undefined4 **)(puVar7 + -4) = &local_ce;
    __mac_toolbox(0xa972);
    uStack_ee = uStack_d6;
    uStack_ea = uStack_d2;
    *(undefined4 **)(puVar7 + -8) = &uStack_ee;
    *(undefined2 *)(puVar7 + -10) = 0xfff6;
    *(undefined2 *)(puVar7 + -0xc) = 0xfff6;
    __mac_toolbox(0xa8a9);
    *(undefined4 *)(puVar7 + -0x12) = local_ce;
    *(undefined4 **)(puVar7 + -0x16) = &uStack_ee;
    __mac_toolbox(0xa8ad);
    puVar6 = puVar7 + -0x14;
    if (puVar7[-0x16] != '\0') {
      *(undefined4 **)(puVar7 + -0x18) = &uStack_112;
      *(undefined4 **)(puVar7 + -0x1c) = &uStack_d6;
      *(undefined4 *)(puVar7 + -0x20) = local_ce;
      *(undefined4 *)(puVar7 + -0x24) = 0x5048e;
      CODE5_014a();
      uStack_d6 = uStack_112;
      uStack_d2 = uStack_10e;
      *(undefined4 **)(puVar7 + -0x22) = &uStack_d6;
      *(undefined4 **)(puVar7 + -0x26) = &uStack_de;
      __mac_toolbox(0xa8a6);
      puVar6 = puVar7 + -0x24;
      if (puVar7[-0x26] != '\x01') {
        *(undefined4 **)(puVar7 + -0x28) = &local_fc;
        *(long *)(puVar7 + -0x2c) = DAT_000fffca + 2;
        *(undefined1 **)(puVar7 + -0x30) = auStack_e6;
        *(undefined4 **)(puVar7 + -0x34) = &uStack_de;
        *(undefined2 *)(puVar7 + -0x36) = 0;
        *(undefined4 *)(puVar7 + -0x3a) = 0;
        __mac_toolbox(0xa8ec);
        *(long *)(puVar7 + -0x3e) = DAT_000fffca + 2;
        *(undefined4 **)(puVar7 + -0x42) = &local_fc;
        *(undefined4 **)(puVar7 + -0x46) = &uStack_d6;
        *(undefined1 **)(puVar7 + -0x4a) = auStack_e6;
        *(undefined2 *)(puVar7 + -0x4c) = 0;
        *(undefined4 *)(puVar7 + -0x50) = 0;
        __mac_toolbox(0xa8ec);
        *(undefined4 *)(puVar7 + -0x54) = uVar2;
        puVar6 = puVar7 + -0x58;
        *(undefined4 **)(puVar7 + -0x58) = &uStack_d6;
        __mac_toolbox(0xa8f6);
        uStack_de = uStack_112;
        uStack_da = uStack_10e;
        uStack_ca = local_ce;
      }
    }
    *(undefined2 *)(puVar6 + -4) = 8;
    *(undefined2 **)(puVar6 + -8) = &DAT_000fbdca;
    __mac_toolbox(0xa970);
    if ((puVar6[-8] != '\0') && ((DAT_000fbdcc & 0xff) == 0xd)) {
      bVar4 = true;
    }
    __mac_toolbox(0xa974);
    puVar7 = puVar6 + -6;
    if (puVar6[-8] != '\0') {
      *(undefined4 *)(puVar6 + -0xc) = local_ce;
      *(undefined4 **)(puVar6 + -0x10) = &uStack_d6;
      __mac_toolbox(0xa8ad);
      puVar7 = puVar6 + -0xe;
      if (puVar6[-0x10] != '\0') {
        bVar4 = true;
        puVar7 = puVar6 + -0xe;
      }
    }
  } while (!bVar4);
  *(undefined4 **)(puVar7 + -4) = &uStack_d6;
  *(undefined2 *)(puVar7 + -6) = 10;
  *(undefined2 *)(puVar7 + -8) = 10;
  __mac_toolbox(0xa8b3);
  *(undefined2 *)(puVar7 + -10) = 0x3e;
  *(undefined2 *)(puVar7 + -0xc) = 0;
  uVar3 = *(undefined4 *)(puVar7 + -0xc);
  __mac_toolbox(0xa032);
  *(undefined4 *)(puVar7 + -0xc) = local_fc;
  __mac_toolbox(0xa01f);
  *(undefined4 *)(puVar7 + -0xc) = uVar2;
  __mac_toolbox(0xa02a);
  *(undefined4 *)(puVar7 + -0xc) = uVar1;
  __mac_toolbox(0xa982);
  *(undefined4 *)(puVar7 + -0x10) = local_18[0];
  __mac_toolbox(0xa873);
  return uVar3;
}



/* CODE 5 + 0x0576, synthetic address 0x00050576 */

void thunk_FUN_0005057c(void)

{
  undefined1 *puVar1;
  
  puVar1 = (undefined1 *)register0x0000003c;
  while( true ) {
    *(undefined2 *)(puVar1 + -4) = 0x40;
    *(undefined2 **)(puVar1 + -8) = &DAT_000fbdca;
    __mac_toolbox(0xa970);
    if (puVar1[-8] == '\0') break;
    *(code **)(puVar1 + -10) = FUN_0005057c;
    JT_CODE4_00e4();
    puVar1 = puVar1 + -6;
  }
  *(undefined4 **)(puVar1 + -10) = &DAT_000ffe3a;
  __mac_toolbox(0xa874);
  *(undefined2 *)(puVar1 + -0x10) = 0x89;
  *(undefined **)(puVar1 + -0x14) = &DAT_000ffe42;
  *(undefined4 *)(puVar1 + -0x18) = 0xffffffff;
  __mac_toolbox(0xa97c);
  DAT_000ffe3e = *(undefined4 *)(puVar1 + -0x18);
  *(undefined4 *)(puVar1 + -0x18) = DAT_000ffe3e;
  __mac_toolbox(0xa873);
  *(undefined4 *)(puVar1 + -0x1c) = DAT_000ffe3e;
  __mac_toolbox(0xa981);
  return;
}



/* CODE 5 + 0x057c, synthetic address 0x0005057c */

void FUN_0005057c(void)

{
  while( true ) {
    *(undefined2 *)((long)register0x0000003c + -4) = 0x40;
    *(undefined2 **)((long)register0x0000003c + -8) = &DAT_000fbdca;
    __mac_toolbox(0xa970);
    if (*(char *)((long)register0x0000003c + -8) == '\0') break;
    *(code **)((long)register0x0000003c + -10) = FUN_0005057c;
    JT_CODE4_00e4();
    register0x0000003c = (BADSPACEBASE *)((long)register0x0000003c + -6);
  }
  *(undefined4 **)((long)register0x0000003c + -10) = &DAT_000ffe3a;
  __mac_toolbox(0xa874);
  *(undefined2 *)((long)register0x0000003c + -0x10) = 0x89;
  *(undefined **)((long)register0x0000003c + -0x14) = &DAT_000ffe42;
  *(undefined4 *)((long)register0x0000003c + -0x18) = 0xffffffff;
  __mac_toolbox(0xa97c);
  DAT_000ffe3e = *(undefined4 *)((long)register0x0000003c + -0x18);
  *(undefined4 *)((long)register0x0000003c + -0x18) = DAT_000ffe3e;
  __mac_toolbox(0xa873);
  *(undefined4 *)((long)register0x0000003c + -0x1c) = DAT_000ffe3e;
  __mac_toolbox(0xa981);
  return;
}



/* CODE 5 + 0x05b4, synthetic address 0x000505b4 */

void FUN_000505b4(void)

{
  __mac_toolbox(0xa982);
  __mac_toolbox(0xa873);
  return;
}



/* CODE 5 + 0x05c2, synthetic address 0x000505c2 */

/* Original CODE 5 resource offset 0x05c2 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_05c2(void)

{
  if (DAT_000ffe00 <= DAT_000ffdf4) {
    __mac_toolbox(0xa893);
    __mac_toolbox(0xa029);
    __mac_toolbox(0xa885);
    __mac_toolbox(0xa02a);
  }
  DAT_000ffe04 = DAT_000ffe04 + 1;
  DAT_000ffbe0 = DAT_000ffbe0 + 1;
  return;
}



/* CODE 5 + 0x0640, synthetic address 0x00050640 */

/* Original CODE 5 resource offset 0x0640 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_0640(void)

{
  undefined2 extraout_D0u;
  int iVar1;
  int in_stack_fffffdbe;
  undefined1 auStack_216 [254];
  undefined1 local_118;
  undefined1 auStack_116 [274];
  
  DAT_000ffe04 = 0;
  iVar1 = DAT_000ffdfa + DAT_000ffdf6 * -2;
  if (iVar1 < DAT_000ffdf6) {
    iVar1 = DAT_000ffdfa;
  }
  __mac_toolbox(0xa893);
  local_118 = 1;
  __mac_toolbox(0xa888);
  __mac_toolbox(0xa884);
  JT_CODE1_0004(3,&DAT_000ffcea,&DAT_0005075a,&DAT_000ffbea,auStack_216,&DAT_000ffadc,1,iVar1,
                DAT_000ffdf8);
  JT_CODE1_03e2(auStack_116,auStack_216,0xff);
  __mac_toolbox(0xa88c);
  __mac_toolbox(0xa893);
  __mac_toolbox(0xa884);
  JT_CODE1_094e(auStack_116,(long)(DAT_000ffdf4 + 1),auStack_116,iVar1,
                DAT_000ffdf8 + (in_stack_fffffdbe - (int)((ulong)auStack_116 >> 0x10)) / 2,
                CONCAT22(extraout_D0u,DAT_000ffdfe - DAT_000ffdf8));
  JT_CODE1_0004(3,&DAT_0005074c,auStack_116,&DAT_00050752,auStack_216);
  JT_CODE1_03e2(auStack_116,auStack_216,0xff);
  __mac_toolbox(0xa88c);
  __mac_toolbox(0xa893);
  __mac_toolbox(0xa884);
  __mac_toolbox(0xa888);
  DAT_000ffe04 = DAT_000ffe04 + 2;
  return;
}



/* CODE 5 + 0x0760, synthetic address 0x00050760 */

/* WARNING: Removing unreachable block (ram,0x00050842) */
/* WARNING: Unknown calling convention */
/* Original CODE 5 resource offset 0x0760 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE5_0760(void)

{
  int iVar1;
  undefined4 *puVar2;
  ulong *puVar3;
  undefined4 *in_stack_00000004;
  undefined4 local_528;
  long local_524;
  undefined2 uStack_520;
  undefined2 local_51e;
  undefined2 uStack_51c;
  undefined2 uStack_51a;
  ulong local_518;
  undefined1 auStack_514 [256];
  undefined1 auStack_414 [256];
  undefined1 auStack_314 [256];
  undefined1 auStack_214 [256];
  undefined4 auStack_114 [68];
  
  iVar1 = 0x3f;
  puVar2 = auStack_114;
  do {
    *puVar2 = *in_stack_00000004;
    iVar1 = iVar1 + -1;
    in_stack_00000004 = in_stack_00000004 + 1;
    puVar2 = puVar2 + 1;
  } while (iVar1 != -1);
  local_518 = (ulong)CONCAT11(0xff,DAT_000ffe0a + -1);
  local_51e = 0xba00;
  uStack_51c = 0;
  __mac_toolbox(0xa8fd);
  puVar3 = &local_518;
  if (DAT_000ffe0c != 0) {
    uStack_51c = (undefined2)((ulong)DAT_000ffe0c >> 0x10);
    uStack_51a = (undefined2)DAT_000ffe0c;
    uStack_520 = 0x1800;
    local_51e = 0x40c;
    __mac_toolbox(0xa8fd);
    local_524 = DAT_000ffe0c;
    puVar3 = &local_528;
    local_528 = 0x8000484;
    __mac_toolbox(0xa8fd);
    DAT_000ffe0c = 0;
  }
  *(undefined4 *)((long)puVar3 + -6) = 0xba000000;
  __mac_toolbox(0xa8fd);
  if (DAT_000ffe0a != '\x01' || *(int *)((long)puVar3 + -6) != 0) {
    *(undefined4 *)((long)puVar3 + -8) = DAT_000ffe36;
    __mac_toolbox(0xa873);
    *(undefined4 *)((long)puVar3 + -0xe) = 0xba000000;
    __mac_toolbox(0xa8fd);
    *(long *)((long)puVar3 + -0x10) = (long)*(int *)((long)puVar3 + -0xe);
    *(undefined1 **)((long)puVar3 + -0x14) = auStack_214;
    *(undefined4 *)((long)puVar3 + -0x18) = 0x507ec;
    JT_CODE1_094e();
    *(undefined1 **)((long)puVar3 + -0x18) = auStack_314;
    *(undefined1 **)((long)puVar3 + -0x1c) = auStack_414;
    *(undefined1 **)((long)puVar3 + -0x20) = auStack_514;
    *(undefined **)((long)puVar3 + -0x24) = &DAT_00050854;
    *(undefined1 **)((long)puVar3 + -0x28) = auStack_214;
    *(undefined2 *)((long)puVar3 + -0x2a) = 2;
    *(undefined4 *)((long)puVar3 + -0x2e) = 0x50808;
    JT_CODE1_0004();
    *(undefined1 **)((long)puVar3 + -0x2a) = auStack_514;
    *(undefined **)((long)puVar3 + -0x2e) = &DAT_0005084e;
    *(undefined2 *)((long)puVar3 + -0x30) = 2;
    *(undefined4 *)((long)puVar3 + -0x34) = 0x5081a;
    JT_CODE1_0004();
    *(undefined1 **)((long)puVar3 + -0x30) = auStack_414;
    *(undefined4 **)((long)puVar3 + -0x34) = auStack_114;
    *(undefined2 *)((long)puVar3 + -0x36) = 2;
    *(undefined4 *)((long)puVar3 + -0x3a) = 0x5082c;
    JT_CODE1_0004();
    *(undefined1 **)((long)puVar3 + -0x36) = auStack_314;
    *(undefined4 *)((long)puVar3 + -0x3a) = 0x50836;
    JT_CODE4_0ae6();
  }
  DAT_000ffdea = 1;
  return 0;
}



/* CODE 5 + 0x0868, synthetic address 0x00050868 */

/* Original CODE 5 resource offset 0x0868 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_0868(void)

{
  char cVar1;
  undefined1 *puVar2;
  undefined4 *puVar3;
  byte bStack_28;
  undefined4 local_26;
  undefined4 local_22;
  undefined4 local_1e;
  
  DAT_000ffbe0 = 0;
  DAT_000ffdf4 = 0;
  DAT_000ffe04 = 0;
  cVar1 = '\0';
  local_1e = DAT_000ffe0c;
  local_22 = 0;
  local_26 = 0x10000808;
  __mac_toolbox(0xa8fd);
  bStack_28 = CODE5_0760();
  puVar3 = &local_26;
  if (bStack_28 != 0) {
    puVar3 = &local_26;
    if (DAT_000ffe00 <= DAT_000ffdf4) {
      CODE5_0640();
      puVar3 = &local_26;
    }
    while ((byte)(-(DAT_000ffbe0 < DAT_000ffbe2) & cVar1 - 1U & DAT_000ffdea - 1U) != 0) {
      puVar2 = (undefined1 *)puVar3;
      if (DAT_000ffe08 <= DAT_000ffe04) {
        DAT_000ffdf4 = DAT_000ffdf4 + 1;
        if (DAT_000ffe02 < DAT_000ffdf4) {
          cVar1 = '\x01';
        }
        else {
          *(undefined4 *)((long)puVar3 + -4) = DAT_000ffe0c;
          *(undefined4 *)((long)puVar3 + -8) = 0x1800040c;
          __mac_toolbox(0xa8fd);
          *(undefined4 *)((long)puVar3 + -0xc) = DAT_000ffe0c;
          *(undefined4 *)((long)puVar3 + -0x10) = 0;
          *(undefined4 *)((long)puVar3 + -0x14) = 0x10000808;
          __mac_toolbox(0xa8fd);
          *(undefined **)((long)puVar3 + -0x1a) = &DAT_00050932;
          *(undefined4 *)((long)puVar3 + -0x1e) = 0x508f0;
          CODE5_0760();
          puVar2 = (undefined1 *)((long)puVar3 + -0x14);
          if (*(char *)((long)puVar3 + -0x16) == '\0') {
            cVar1 = '\x01';
          }
          else {
            *(undefined4 *)((long)puVar3 + -0x18) = 0x508f8;
            CODE5_0640();
            puVar2 = (undefined1 *)((long)puVar3 + -0x14);
          }
        }
      }
      puVar3 = (undefined4 *)puVar2;
      if (cVar1 != '\x01') {
        *(undefined4 *)(puVar2 + -4) = 0x50906;
        CODE5_05c2();
      }
    }
  }
  *(undefined4 *)((long)puVar3 + -4) = DAT_000ffe0c;
  *(undefined4 *)((long)puVar3 + -8) = 0x1800040c;
  __mac_toolbox(0xa8fd);
  return;
}



/* CODE 5 + 0x0958, synthetic address 0x00050958 */

/* WARNING: Removing unreachable block (ram,0x0005097e) */
/* WARNING: Removing unreachable block (ram,0x0005099c) */
/* WARNING: Removing unreachable block (ram,0x000509a2) */
/* WARNING: Removing unreachable block (ram,0x000509a8) */
/* WARNING: Removing unreachable block (ram,0x000509b8) */
/* WARNING: Removing unreachable block (ram,0x00050a74) */
/* WARNING: Removing unreachable block (ram,0x00050a88) */
/* WARNING: Removing unreachable block (ram,0x00050a8a) */
/* WARNING: Removing unreachable block (ram,0x00050a92) */
/* WARNING: Removing unreachable block (ram,0x00050ae6) */
/* WARNING: Removing unreachable block (ram,0x00050aa0) */
/* WARNING: Removing unreachable block (ram,0x00050af6) */
/* WARNING: Removing unreachable block (ram,0x00050b14) */
/* WARNING: Removing unreachable block (ram,0x00050b24) */
/* WARNING: Removing unreachable block (ram,0x00050bd6) */
/* WARNING: Removing unreachable block (ram,0x00050bc8) */
/* WARNING: Removing unreachable block (ram,0x00050be6) */
/* WARNING: Removing unreachable block (ram,0x00050c22) */
/* WARNING: Removing unreachable block (ram,0x00050c38) */
/* WARNING: Removing unreachable block (ram,0x00050c3e) */
/* Original CODE 5 resource offset 0x0958 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_0958(void)

{
  if (DAT_000ff924 == 0) {
    CODE5_0d4c();
  }
  __mac_toolbox(0xa8fd);
  return;
}



/* CODE 5 + 0x0cb0, synthetic address 0x00050cb0 */

/* WARNING: Removing unreachable block (ram,0x00050ccc) */
/* WARNING: Removing unreachable block (ram,0x00050d08) */
/* WARNING: Removing unreachable block (ram,0x00050d1a) */
/* Original CODE 5 resource offset 0x0cb0 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_0cb0(void)

{
  if (DAT_000ff924 == 0) {
    CODE5_0d4c();
  }
  __mac_toolbox(0xa8fd);
  return;
}



/* CODE 5 + 0x0d4c, synthetic address 0x00050d4c */

/* WARNING: Removing unreachable block (ram,0x00050d7e) */
/* WARNING: Removing unreachable block (ram,0x00050da2) */
/* WARNING: Removing unreachable block (ram,0x00050d98) */
/* WARNING: Removing unreachable block (ram,0x00050dae) */

void CODE5_0d4c(void)

{
  __mac_toolbox(0xa8fd);
  DAT_000ff924 = 0;
  DAT_000ffe0c = 0;
  __mac_toolbox(0xa8fd);
  __mac_toolbox(0xa8fd);
  JT_CODE4_0ae6();
  return;
}



/* CODE 5 + 0x0e2e, synthetic address 0x00050e2e */

void CODE5_0e2e(void)

{
  if (DAT_000ff924 != 0) {
    __mac_toolbox(0xa023);
  }
  return;
}



/* CODE 5 + 0x0e3e, synthetic address 0x00050e3e */

/* WARNING: Unknown calling convention */
/* Original CODE 5 resource offset 0x0e3e (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE5_0e3e(void)

{
  int in_stack_00000008;
  
  if ((byte)(-(in_stack_00000008 < 0x7b) & -(0x60 < in_stack_00000008)) != 0) {
    in_stack_00000008 = in_stack_00000008 + -0x20;
  }
  return in_stack_00000008;
}



/* CODE 5 + 0x0e72, synthetic address 0x00050e72 */

/* Original CODE 5 resource offset 0x0e72 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE5_0e72(long param_1)

{
  int iVar1;
  char cVar2;
  byte bVar3;
  int iVar4;
  undefined1 *puVar5;
  undefined1 *puVar6;
  undefined1 auStack_11a [278];
  
  puVar5 = &stack0xfffffed6;
  for (iVar4 = 0;
      bVar3 = -(**(char **)(param_1 + 0x1c) == '\0') & -(iVar4 < **(int **)(param_1 + 0xe)),
      bVar3 != 0; iVar4 = iVar4 + 1) {
    puVar6 = puVar5;
    if (*(char *)(*(long *)(param_1 + 0x16) + 1 + (long)(iVar4 << 2)) == '\x05' ||
        *(char *)(*(long *)(param_1 + 0x16) + 1 + (long)(iVar4 << 2)) == '\x03') {
      iVar1 = *(int *)(*(long *)(param_1 + 0x16) + 2 + (long)(iVar4 << 2));
      if (*(char *)((long)(iVar1 * 0x18 + -0x2acc) + 0x100000) == '\0') {
        *(undefined1 **)(puVar5 + -4) = auStack_11a;
        *(undefined **)(puVar5 + -8) = &DAT_0005104e;
        *(long *)(puVar5 + -0xc) = (long)(iVar1 * 0x18 + -0x2ae0) + 0x100000;
        *(undefined2 *)(puVar5 + -0xe) = 2;
        *(undefined4 *)(puVar5 + -0x12) = 0x51004;
        JT_CODE1_0004();
        *(undefined2 *)(puVar5 + -0xc) = *(undefined2 *)(param_1 + 0x1a);
        *(undefined1 **)(puVar5 + -0x10) = auStack_11a;
        puVar6 = puVar5 + -0x14;
        *(undefined4 *)(puVar5 + -0x14) = *(undefined4 *)(param_1 + 0x1c);
        *(undefined4 *)(puVar5 + -0x18) = 0x51016;
        JT_CODE1_03e2();
        **(undefined2 **)(param_1 + 10) = *(undefined2 *)((long)(iVar1 * 0x18 + -0x2aca) + 0x100000)
        ;
      }
      else {
        *(undefined2 *)(*(long *)(param_1 + 0x16) + 2 + (long)(iVar4 << 2)) =
             *(undefined2 *)((long)(iVar1 * 0x18 + -0x2ace) + 0x100000);
        cVar2 = (&DAT_000fd530)[iVar1 * 0x18];
        if (*(char *)(*(long *)(param_1 + 0x16) + 1 + (long)(iVar4 << 2)) == '\x05') {
          if (cVar2 == '\x03') {
            *(undefined2 *)(puVar5 + -2) = *(undefined2 *)(param_1 + 0x1a);
            *(undefined **)(puVar5 + -6) = &DAT_000510c0;
            *(undefined4 *)(puVar5 + -10) = *(undefined4 *)(param_1 + 0x1c);
            *(undefined4 *)(puVar5 + -0xe) = 0x50f14;
            JT_CODE1_03e2();
            puVar5 = puVar5 + -10;
          }
        }
        else {
          *(char *)(*(long *)(param_1 + 0x16) + 1 + (long)(iVar4 << 2)) = cVar2;
        }
        puVar6 = puVar5;
        if ((byte)((-(cVar2 == '\x03') | -(cVar2 == '\x02')) &
                  -(*(char *)(*(long *)(param_1 + 0x16) + (long)(iVar4 << 2)) == '\x10')) != 0) {
          *(long *)(puVar5 + -4) = (long)iVar4;
          *(long *)(puVar5 + -8) = param_1 + -0x1a6;
          *(undefined4 *)(puVar5 + -0xc) = 0x50f54;
          JT_CODE1_094e();
          *(long *)(puVar5 + -0xc) = (long)**(int **)(param_1 + 0xe);
          *(long *)(puVar5 + -0x10) = param_1 + -0x2a6;
          *(undefined4 *)(puVar5 + -0x14) = 0x50f66;
          JT_CODE1_094e();
          *(undefined1 **)(puVar5 + -0x14) = auStack_11a;
          *(undefined **)(puVar5 + -0x18) = &DAT_000510a8;
          *(long *)(puVar5 + -0x1c) = param_1 + -0x1a6;
          *(undefined **)(puVar5 + -0x20) = &DAT_0005109e;
          *(long *)(puVar5 + -0x24) = param_1 + -0x2a6;
          *(undefined **)(puVar5 + -0x28) = &DAT_0005109c;
          *(undefined2 *)(puVar5 + -0x2a) = 5;
          *(undefined4 *)(puVar5 + -0x2e) = 0x50f86;
          JT_CODE1_0004();
          *(undefined2 *)(puVar5 + -0x28) = *(undefined2 *)(param_1 + 0x1a);
          *(undefined1 **)(puVar5 + -0x2c) = auStack_11a;
          *(undefined4 *)(puVar5 + -0x30) = *(undefined4 *)(param_1 + 0x1c);
          *(undefined4 *)(puVar5 + -0x34) = 0x50f98;
          JT_CODE1_03e2();
          *(undefined1 **)(puVar5 + -0x34) = auStack_11a;
          *(undefined4 *)(puVar5 + -0x38) = *(undefined4 *)(param_1 + 0x1c);
          *(undefined **)(puVar5 + -0x3c) = &DAT_0005108e;
          *(long *)(puVar5 + -0x40) = (long)(iVar1 * 0x18 + -0x2ae0) + 0x100000;
          *(undefined **)(puVar5 + -0x44) = &DAT_00051062;
          *(undefined2 *)(puVar5 + -0x46) = 4;
          *(undefined4 *)(puVar5 + -0x4a) = 0x50fc0;
          JT_CODE1_0004();
          *(undefined2 *)(puVar5 + -0x44) = *(undefined2 *)(param_1 + 0x1a);
          *(undefined1 **)(puVar5 + -0x48) = auStack_11a;
          puVar6 = puVar5 + -0x4c;
          *(undefined4 *)(puVar5 + -0x4c) = *(undefined4 *)(param_1 + 0x1c);
          *(undefined4 *)(puVar5 + -0x50) = 0x50fd2;
          JT_CODE1_03e2();
          **(undefined2 **)(param_1 + 10) =
               *(undefined2 *)((long)(iVar1 * 0x18 + -0x2aca) + 0x100000);
        }
      }
    }
    puVar5 = puVar6;
  }
  return bVar3;
}



/* CODE 5 + 0x10e8, synthetic address 0x000510e8 */

/* WARNING: Unknown calling convention */
/* Original CODE 5 resource offset 0x10e8 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE5_10e8(void)

{
  int iVar1;
  char cVar2;
  int iVar3;
  undefined1 *puVar4;
  undefined1 *puVar5;
  bool bVar6;
  long in_stack_00000004;
  char in_stack_00000008;
  undefined4 uStack_13e;
  undefined1 auStack_138 [4];
  undefined1 local_134 [4];
  undefined1 auStack_130 [4];
  undefined1 auStack_12c [4];
  undefined2 local_128;
  undefined1 auStack_11a [278];
  
  iVar3 = 0;
  cVar2 = '\0';
  puVar4 = &stack0xfffffeda;
  while ((byte)(cVar2 - 1U & -(iVar3 < *(int *)(in_stack_00000004 + -0x9c))) != 0) {
    *(long *)(puVar4 + -4) = in_stack_00000004 + -0x8e;
    iVar1 = iVar3 * 0x18 + -0x2ae0;
    bVar6 = iVar1 == 0;
    *(long *)(puVar4 + -8) = (long)iVar1 + 0x100000;
    *(undefined4 *)(puVar4 + -0xc) = 0x51110;
    JT_CODE1_028c();
    if (bVar6) {
      cVar2 = '\x01';
      puVar4 = puVar4 + -8;
    }
    else {
      iVar3 = iVar3 + 1;
      puVar4 = puVar4 + -8;
    }
  }
  *(char *)(in_stack_00000004 + -0x96) = cVar2;
  if (in_stack_00000008 == '\0') {
    puVar5 = puVar4;
    if (cVar2 != '\x01') {
      *(undefined2 *)(puVar4 + -2) = 0xf;
      *(long *)(puVar4 + -6) = in_stack_00000004 + -0x8e;
      puVar5 = puVar4 + -10;
      *(long *)(puVar4 + -10) = (long)(iVar3 * 0x18 + -0x2ae0) + 0x100000;
      *(undefined4 *)(puVar4 + -0xe) = 0x51216;
      JT_CODE1_03e2();
      *(undefined1 *)((long)(iVar3 * 0x18 + -0x2acc) + 0x100000) = 0;
      *(undefined2 *)((long)(iVar3 * 0x18 + -0x2aca) + 0x100000) =
           *(undefined2 *)(in_stack_00000004 + -0x9e);
      *(int *)(in_stack_00000004 + -0x9c) = *(int *)(in_stack_00000004 + -0x9c) + 1;
    }
  }
  else {
    *(undefined1 *)((long)(iVar3 * 0x18 + -0x2ad0) + 0x100000) = 3;
    if (cVar2 == '\0') {
      *(undefined2 *)(puVar4 + -2) = 0xf;
      *(long *)(puVar4 + -6) = in_stack_00000004 + -0x8e;
      puVar5 = puVar4 + -10;
      *(long *)(puVar4 + -10) = (long)(iVar3 * 0x18 + -0x2ae0) + 0x100000;
      *(undefined4 *)(puVar4 + -0xe) = 0x511b6;
      JT_CODE1_03e2();
      *(undefined2 *)((long)(iVar3 * 0x18 + -0x2ace) + 0x100000) =
           **(undefined2 **)(in_stack_00000004 + 0xe);
      *(int *)(in_stack_00000004 + -0x9c) = *(int *)(in_stack_00000004 + -0x9c) + 1;
    }
    else if (*(char *)((long)(iVar3 * 0x18 + -0x2acc) + 0x100000) == '\0') {
      *(undefined2 *)((long)(iVar3 * 0x18 + -0x2ace) + 0x100000) =
           **(undefined2 **)(in_stack_00000004 + 0xe);
      puVar5 = puVar4;
    }
    else {
      *(undefined1 **)(puVar4 + -4) = auStack_11a;
      *(undefined **)(puVar4 + -8) = &DAT_0005127c;
      *(long *)(puVar4 + -0xc) = (long)(iVar3 * 0x18 + -0x2ae0) + 0x100000;
      *(undefined2 *)(puVar4 + -0xe) = 2;
      *(undefined4 *)(puVar4 + -0x12) = 0x51174;
      JT_CODE1_0004();
      *(undefined2 *)(puVar4 + -0xc) = *(undefined2 *)(in_stack_00000004 + 0x1a);
      *(undefined1 **)(puVar4 + -0x10) = auStack_11a;
      *(undefined4 *)(puVar4 + -0x14) = *(undefined4 *)(in_stack_00000004 + 0x1c);
      *(undefined4 *)(puVar4 + -0x18) = 0x51186;
      JT_CODE1_03e2();
      puVar5 = puVar4 + -0x14;
    }
    *(undefined2 *)((long)(iVar3 * 0x18 + -0x2aca) + 0x100000) =
         **(undefined2 **)(in_stack_00000004 + 0xe);
    *(undefined1 *)((long)(iVar3 * 0x18 + -0x2acc) + 0x100000) = 1;
  }
  if (199 < *(int *)(in_stack_00000004 + -0x9c)) {
    *(undefined2 *)(puVar5 + -2) = *(undefined2 *)(in_stack_00000004 + 0x1a);
    *(undefined **)(puVar5 + -6) = &DAT_00051266;
    *(undefined4 *)(puVar5 + -10) = *(undefined4 *)(in_stack_00000004 + 0x1c);
    *(undefined4 *)(puVar5 + -0xe) = 0x51256;
    JT_CODE1_03e2();
  }
  return iVar3;
}



/* CODE 5 + 0x1296, synthetic address 0x00051296 */

/* Original CODE 5 resource offset 0x1296 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_1296(long param_1,undefined2 param_2,undefined2 param_3)

{
  *(undefined1 *)((long)((*(int *)(param_1 + -0x9c) + -1) * 0x18 + -0x2ad0) + 0x100000) =
       param_3._0_1_;
  *(undefined2 *)((long)((*(int *)(param_1 + -0x9c) + -1) * 0x18 + -0x2ace) + 0x100000) = param_2;
  *(undefined1 *)((long)((*(int *)(param_1 + -0x9c) + -1) * 0x18 + -0x2acc) + 0x100000) = 1;
  return;
}



/* CODE 5 + 0x12e6, synthetic address 0x000512e6 */

/* WARNING: Unknown calling convention */
/* Original CODE 5 resource offset 0x12e6 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE5_12e6(void)

{
  int iVar1;
  char cVar2;
  int iVar3;
  undefined1 *puVar4;
  bool bVar5;
  long in_stack_00000004;
  short in_stack_00000008;
  undefined1 auStack_34 [4];
  undefined1 local_30 [4];
  undefined1 auStack_2c [4];
  undefined2 local_28;
  
  iVar3 = 0;
  cVar2 = '\0';
  puVar4 = &stack0xffffffda;
  while ((byte)(cVar2 - 1U & -(iVar3 < *(int *)(in_stack_00000004 + -0x9c))) != 0) {
    *(long *)(puVar4 + -4) = in_stack_00000004 + -0x8e;
    iVar1 = iVar3 * 0x18 + -0x2ae0;
    bVar5 = iVar1 == 0;
    *(long *)(puVar4 + -8) = (long)iVar1 + 0x100000;
    *(undefined4 *)(puVar4 + -0xc) = 0x5130e;
    JT_CODE1_028c();
    if (bVar5) {
      cVar2 = '\x01';
      puVar4 = puVar4 + -8;
    }
    else {
      iVar3 = iVar3 + 1;
      puVar4 = puVar4 + -8;
    }
  }
  if (cVar2 == '\0') {
    *(undefined2 *)(puVar4 + -2) = *(undefined2 *)(in_stack_00000004 + 0x1a);
    *(undefined **)(puVar4 + -6) = &DAT_00051354;
    *(undefined4 *)(puVar4 + -10) = *(undefined4 *)(in_stack_00000004 + 0x1c);
    *(undefined4 *)(puVar4 + -0xe) = 0x5134a;
    JT_CODE1_03e2();
  }
  else {
    in_stack_00000008 = *(short *)((long)(iVar3 * 0x18 + -0x2ace) + 0x100000);
  }
  return in_stack_00000008;
}



/* CODE 5 + 0x137a, synthetic address 0x0005137a */

/* Original CODE 5 resource offset 0x137a (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_137a(long param_1)

{
  undefined2 uStack_a;
  
  *(undefined1 *)(param_1 + -0x97) = 0;
  *(undefined1 *)(*(long *)(param_1 + 0x16) + 1 + (long)(**(int **)(param_1 + 0xe) << 2)) = 2;
  uStack_a = CODE5_12e6();
  *(short *)(*(long *)(param_1 + 0x16) + 2 + (long)(**(int **)(param_1 + 0xe) << 2)) = uStack_a;
  return;
}



/* CODE 5 + 0x13ba, synthetic address 0x000513ba */

/* WARNING: Unknown calling convention */
/* Original CODE 5 resource offset 0x13ba (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE5_13ba(void)

{
  int iVar1;
  long in_stack_00000004;
  
  iVar1 = *(int *)(in_stack_00000004 + -0x9e);
  while ((byte)(-(*(int *)(in_stack_00000004 + -0x9e) < *(int *)(in_stack_00000004 + 0x20)) &
               (-(*(byte *)(**(long **)(in_stack_00000004 + 0x22) +
                           (long)*(int *)(in_stack_00000004 + -0x9e)) == DAT_000fbdbe) |
               -(*(char *)(**(long **)(in_stack_00000004 + 0x22) +
                          (long)*(int *)(in_stack_00000004 + -0x9e)) == ' '))) != 0) {
    *(int *)(in_stack_00000004 + -0x9e) = *(int *)(in_stack_00000004 + -0x9e) + 1;
  }
  return *(int *)(in_stack_00000004 + -0x9e) - iVar1;
}



/* CODE 5 + 0x1426, synthetic address 0x00051426 */

/* WARNING: Unknown calling convention */
/* Original CODE 5 resource offset 0x1426 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE5_1426(void)

{
  bool bVar1;
  byte unaff_D4b;
  int iVar2;
  uint uVar3;
  long in_stack_00000004;
  
  iVar2 = *(int *)(in_stack_00000004 + -0x9e);
  bVar1 = false;
  while (!bVar1) {
    uVar3 = (uint)*(byte *)(**(long **)(in_stack_00000004 + 0x22) + (long)iVar2);
    if (uVar3 == 0x3b || uVar3 == 0xd) {
      bVar1 = true;
      unaff_D4b = 1;
    }
    else if ((byte)(-(uVar3 != DAT_000fbdbe) & -(uVar3 != 0x20)) != 0) {
      bVar1 = true;
      unaff_D4b = 0;
    }
    iVar2 = iVar2 + 1;
  }
  return unaff_D4b;
}



/* CODE 5 + 0x1486, synthetic address 0x00051486 */

/* WARNING: Unknown calling convention */
/* Original CODE 5 resource offset 0x1486 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE5_1486(void)

{
  long lVar1;
  int iVar2;
  undefined1 *puVar3;
  undefined1 *puVar4;
  long in_stack_00000004;
  byte bVar5;
  
  lVar1 = *(long *)(in_stack_00000004 + 8);
  if ((byte)(-(*(int *)(in_stack_00000004 + -0x12) < 0x3a) &
            -(0x2f < *(int *)(in_stack_00000004 + -0x12))) == 0) {
    bVar5 = 0;
  }
  else {
    bVar5 = 1;
    *(undefined1 *)(lVar1 + -0x7c) = 0x12;
    *(undefined4 *)(in_stack_00000004 + -0x18) = 0;
    puVar3 = &stack0xfffffff4;
    do {
      *(undefined4 *)(puVar3 + -4) = *(undefined4 *)(in_stack_00000004 + -0x18);
      *(undefined4 *)(puVar3 + -8) = 10;
      *(undefined4 *)(puVar3 + -0xc) = 0x514d4;
      iVar2 = JT_CODE1_0316();
      *(long *)(in_stack_00000004 + -0x18) = *(long *)(puVar3 + -8) + (long)iVar2;
      *(uint *)(puVar3 + -8) =
           (uint)*(byte *)(**(long **)(lVar1 + 0x22) + (long)*(int *)(lVar1 + -0x9e));
      *(long *)(puVar3 + -0xc) = lVar1;
      *(undefined4 *)(puVar3 + -0x10) = 0x514f6;
      CODE5_0e3e();
      puVar4 = puVar3 + -4;
      *(undefined2 *)(in_stack_00000004 + -0x12) = *(undefined2 *)(puVar3 + -6);
      *(int *)(lVar1 + -0x9e) = *(int *)(lVar1 + -0x9e) + 1;
      if (0x7fff < *(long *)(in_stack_00000004 + -0x18)) {
        *(undefined2 *)(puVar3 + -6) = *(undefined2 *)(lVar1 + 0x1a);
        *(undefined **)(puVar3 + -10) = &DAT_0005156e;
        puVar4 = puVar3 + -0xe;
        *(undefined4 *)(puVar3 + -0xe) = *(undefined4 *)(lVar1 + 0x1c);
        *(undefined4 *)(puVar3 + -0x12) = 0x5151e;
        JT_CODE1_03e2();
      }
      puVar3 = puVar4;
    } while (*(int *)(lVar1 + -0x9e) < *(int *)(lVar1 + 0x20) &&
             (**(char **)(lVar1 + 0x1c) == '\0' &&
             (*(int *)(in_stack_00000004 + -0x12) < 0x3a &&
             0x2f < *(int *)(in_stack_00000004 + -0x12))));
    *(int *)(lVar1 + -0x9e) = *(int *)(lVar1 + -0x9e) + -1;
    *(undefined2 *)(lVar1 + -0x90) = *(undefined2 *)(in_stack_00000004 + -0x16);
  }
  return bVar5;
}



/* CODE 5 + 0x15aa, synthetic address 0x000515aa */

/* Original CODE 5 resource offset 0x15aa (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_15aa(long param_1,undefined1 param_2,undefined4 param_3)

{
  long lVar1;
  byte bVar2;
  undefined1 *puVar3;
  uint uVar4;
  uint uVar5;
  undefined1 *puVar6;
  undefined1 auStack_316 [258];
  undefined2 local_214;
  undefined2 local_114 [136];
  
  lVar1 = *(long *)(param_1 + 8);
  local_114[0] = (undefined2)CONCAT31(1,param_2);
  local_214 = 0x13f;
  bVar2 = *(byte *)(**(long **)(lVar1 + 0x22) + (long)*(int *)(lVar1 + -0x9e));
  uVar4 = (uint)bVar2;
  uVar5 = (uint)bVar2;
  puVar3 = &stack0xfffffcde;
  if ((byte)(-(uVar5 < 0x7b) & -(0x60 < uVar5)) != 0) {
    uVar4 = uVar5 - 0x20;
  }
  while (puVar6 = puVar3,
        (byte)((-((int)uVar4 < 0x3a) & -(0x2f < (int)uVar4) |
               -((int)uVar4 < 0x5b) & -(0x40 < (int)uVar4) | -(uVar4 == 0x5f)) &
              -(*(int *)(lVar1 + -0x9e) < *(int *)(lVar1 + 0x20))) != 0) {
    local_214 = CONCAT11(local_214._0_1_,(char)uVar4);
    *(undefined1 **)(puVar6 + -4) = auStack_316;
    *(undefined2 **)(puVar6 + -8) = local_114;
    *(undefined2 **)(puVar6 + -0xc) = &local_214;
    *(undefined2 *)(puVar6 + -0xe) = 2;
    *(undefined4 *)(puVar6 + -0x12) = 0x51610;
    JT_CODE1_0004();
    *(undefined2 *)(puVar6 + -0xc) = 0xff;
    *(undefined1 **)(puVar6 + -0x10) = auStack_316;
    *(undefined2 **)(puVar6 + -0x14) = local_114;
    *(undefined4 *)(puVar6 + -0x18) = 0x51622;
    JT_CODE1_03e2();
    *(int *)(lVar1 + -0x9e) = *(int *)(lVar1 + -0x9e) + 1;
    bVar2 = *(byte *)(**(long **)(lVar1 + 0x22) + (long)*(int *)(lVar1 + -0x9e));
    uVar4 = (uint)bVar2;
    uVar5 = (uint)bVar2;
    if ((byte)(-(uVar5 < 0x7b) & -(0x60 < uVar5)) != 0) {
      uVar4 = uVar5 - 0x20;
    }
    puVar3 = puVar6 + -0x14;
    if (0xe < local_114[0]._0_1_) {
      while (puVar3 = puVar6 + -0x14,
            (byte)((-((int)uVar4 < 0x3a) & -(0x2f < (int)uVar4) |
                   -((int)uVar4 < 0x5b) & -(0x40 < (int)uVar4) | -(uVar4 == 0x5f)) &
                  -(*(int *)(lVar1 + -0x9e) < *(int *)(lVar1 + 0x20))) != 0) {
        *(int *)(lVar1 + -0x9e) = *(int *)(lVar1 + -0x9e) + 1;
        if (*(int *)(lVar1 + -0x9e) <= *(int *)(lVar1 + 0x20)) {
          *(uint *)(puVar6 + -0x18) =
               (uint)*(byte *)(**(long **)(lVar1 + 0x22) + (long)*(int *)(lVar1 + -0x9e));
          *(long *)(puVar6 + -0x1c) = lVar1;
          *(undefined4 *)(puVar6 + -0x20) = 0x5168e;
          CODE5_0e3e();
          uVar4 = *(uint *)(puVar6 + -0x16);
        }
      }
    }
  }
  *(undefined2 *)(puVar6 + -2) = 0xff;
  *(undefined2 **)(puVar6 + -6) = local_114;
  *(undefined4 *)(puVar6 + -10) = param_3;
  *(undefined4 *)(puVar6 + -0xe) = 0x5170c;
  JT_CODE1_03e2();
  return;
}



/* CODE 5 + 0x1718, synthetic address 0x00051718 */

/* Original CODE 5 resource offset 0x1718 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_1718(long param_1)

{
  short sVar1;
  bool bVar2;
  byte bStack_126;
  undefined1 uVar3;
  undefined1 auStack_11c [262];
  int local_16;
  
  _bStack_126 = CODE5_0e3e();
  local_16 = _bStack_126;
  *(int *)(param_1 + -0x9e) = *(int *)(param_1 + -0x9e) + 1;
  _bStack_126 = CODE5_0e3e();
  sVar1 = _bStack_126;
  if ((byte)(-(local_16 < 0x5b) & -(0x40 < local_16)) == 0) {
    if (local_16 == 0xd) {
      *(undefined1 *)(param_1 + -0x7c) = 0;
    }
    else if (local_16 == 0x3b) {
      *(undefined1 *)(param_1 + -0x7c) = 0x11;
    }
    else {
      bStack_126 = CODE5_1486();
      if (bStack_126 == 0) {
        if (local_16 == 0x2b) {
          if (*(char *)(param_1 + -0x7b) == '\0') {
            if (*(int *)(param_1 + -0x9e) < *(int *)(param_1 + 0x20)) {
              _bStack_126 = CODE5_0e3e();
              local_16 = _bStack_126;
              *(int *)(param_1 + -0x9e) = *(int *)(param_1 + -0x9e) + 1;
              bStack_126 = CODE5_1486();
              if (bStack_126 != 1) {
                uVar3 = (undefined1)*(undefined2 *)(param_1 + 0x1a);
                JT_CODE1_03e2((int)((ulong)*(undefined4 *)(param_1 + 0x1c) >> 0x10),
                              (int)*(undefined4 *)(param_1 + 0x1c),5,0x20fc,uVar3);
              }
            }
            else {
              uVar3 = (undefined1)*(undefined2 *)(param_1 + 0x1a);
              JT_CODE1_03e2((int)((ulong)*(undefined4 *)(param_1 + 0x1c) >> 0x10),
                            (int)*(undefined4 *)(param_1 + 0x1c),5,0x20b6,uVar3);
              *(int *)(param_1 + -0x9e) = *(int *)(param_1 + -0x9e) + -1;
            }
          }
          else {
            *(undefined1 *)(param_1 + -0x7c) = 2;
            *(undefined1 *)(param_1 + -0x7d) = 2;
          }
        }
        else if (local_16 == 0x2d) {
          if (*(char *)(param_1 + -0x7b) == '\0') {
            if (*(int *)(param_1 + -0x9e) < *(int *)(param_1 + 0x20)) {
              _bStack_126 = CODE5_0e3e();
              local_16 = _bStack_126;
              *(int *)(param_1 + -0x9e) = *(int *)(param_1 + -0x9e) + 1;
              bStack_126 = CODE5_1486();
              if (bStack_126 == 0) {
                uVar3 = (undefined1)*(undefined2 *)(param_1 + 0x1a);
                JT_CODE1_03e2((int)((ulong)*(undefined4 *)(param_1 + 0x1c) >> 0x10),
                              (int)*(undefined4 *)(param_1 + 0x1c),5,0x208a,uVar3);
              }
              else {
                *(int *)(param_1 + -0x90) = -*(int *)(param_1 + -0x90);
              }
            }
            else {
              uVar3 = (undefined1)*(undefined2 *)(param_1 + 0x1a);
              JT_CODE1_03e2((int)((ulong)*(undefined4 *)(param_1 + 0x1c) >> 0x10),
                            (int)*(undefined4 *)(param_1 + 0x1c),5,0x2044,uVar3);
              *(int *)(param_1 + -0x9e) = *(int *)(param_1 + -0x9e) + -1;
            }
          }
          else {
            *(undefined1 *)(param_1 + -0x7c) = 2;
            *(undefined1 *)(param_1 + -0x7d) = 3;
          }
        }
        else if (local_16 == 0x2a) {
          *(undefined1 *)(param_1 + -0x7c) = 2;
          *(undefined1 *)(param_1 + -0x7d) = 4;
        }
        else if (local_16 == 0x2f) {
          *(undefined1 *)(param_1 + -0x7c) = 2;
          *(undefined1 *)(param_1 + -0x7d) = 5;
        }
        else if (local_16 == 0x3c) {
          *(undefined1 *)(param_1 + -0x7c) = 3;
          if (*(int *)(param_1 + -0x9e) < *(int *)(param_1 + 0x20)) {
            if (sVar1 == 0x3d) {
              *(int *)(param_1 + -0x9e) = *(int *)(param_1 + -0x9e) + 1;
              *(undefined1 *)(param_1 + -0x7d) = 0xe;
            }
            else if (sVar1 == 0x3e) {
              *(int *)(param_1 + -0x9e) = *(int *)(param_1 + -0x9e) + 1;
              *(undefined1 *)(param_1 + -0x7d) = 0xf;
            }
            else {
              *(undefined1 *)(param_1 + -0x7d) = 0xc;
            }
          }
          else {
            *(undefined1 *)(param_1 + -0x7d) = 0xc;
          }
        }
        else if (local_16 == 0x3e) {
          *(undefined1 *)(param_1 + -0x7c) = 3;
          if ((byte)(-(sVar1 == 0x3d) & -(*(int *)(param_1 + -0x9e) < *(int *)(param_1 + 0x20))) ==
              0) {
            *(undefined1 *)(param_1 + -0x7d) = 0xb;
          }
          else {
            *(int *)(param_1 + -0x9e) = *(int *)(param_1 + -0x9e) + 1;
            *(undefined1 *)(param_1 + -0x7d) = 0xd;
          }
        }
        else if (local_16 == 0x3d) {
          *(undefined1 *)(param_1 + -0x7c) = 3;
          *(undefined1 *)(param_1 + -0x7d) = 10;
        }
        else if (local_16 == 0x26) {
          *(undefined1 *)(param_1 + -0x7c) = 0x17;
        }
        else if (local_16 == 0x5e) {
          *(undefined1 *)(param_1 + -0x7c) = 0x18;
        }
        else {
          uVar3 = (undefined1)local_16;
          JT_CODE1_094e(param_1 + -0x1a6,local_16 >> 0xf,uVar3);
          JT_CODE1_0004(2,param_1 + -0x1a6,5,0x2012,auStack_11c);
          JT_CODE1_03e2((int)((ulong)*(undefined4 *)(param_1 + 0x1c) >> 0x10),
                        (int)*(undefined4 *)(param_1 + 0x1c),auStack_11c,
                        *(undefined2 *)(param_1 + 0x1a));
        }
      }
    }
  }
  else {
    uVar3 = SUB41(auStack_11c,0);
    CODE5_15aa(&stack0xfffffffc,local_16,(int)((ulong)auStack_11c >> 0x10),uVar3);
    JT_CODE1_03e2(param_1 + -0x8e,auStack_11c,0xf);
    if (local_16 < 0x4f) {
      bVar2 = local_16 == 0x46;
      if (local_16 < 0x47) {
        bVar2 = local_16 == 0x43;
        if (local_16 < 0x44) {
          JT_CODE1_028c(param_1 + -0x8e,&DAT_0005227c);
          if (bVar2) {
            *(undefined1 *)(param_1 + -0x7c) = 1;
            *(undefined2 *)(param_1 + -0x90) = 0xe;
          }
          else {
            JT_CODE1_028c(param_1 + -0x8e,5,0x2272);
            if (bVar2) {
              *(undefined1 *)(param_1 + -0x7c) = 0x16;
            }
            else {
              bVar2 = *(long *)(param_1 + -0x8e) == 0x341494d;
              if (bVar2) {
                *(undefined1 *)(param_1 + -0x7c) = 1;
                *(undefined2 *)(param_1 + -0x90) = 2;
              }
              else {
                JT_CODE1_028c(param_1 + -0x8e,&DAT_0005226c);
                if (bVar2) {
                  *(undefined1 *)(param_1 + -0x7c) = 1;
                  *(undefined2 *)(param_1 + -0x90) = 8;
                }
                else {
                  JT_CODE1_028c(param_1 + -0x8e,&DAT_00052262);
                  if (bVar2) {
                    *(undefined1 *)(param_1 + -0x7c) = 0x15;
                    *(undefined1 *)(param_1 + -0xa5) = 0;
                  }
                  else {
                    JT_CODE1_028c(param_1 + -0x8e,&DAT_00052258);
                    if (bVar2) {
                      *(undefined1 *)(param_1 + -0x7c) = 0x15;
                      *(undefined1 *)(param_1 + -0xa5) = 5;
                    }
                    else {
                      JT_CODE1_028c(param_1 + -0x8e,&DAT_00052252);
                      if (bVar2) {
                        *(undefined1 *)(param_1 + -0x7c) = 0x15;
                        *(undefined1 *)(param_1 + -0xa5) = 6;
                      }
                      else if (*(long *)(param_1 + -0x8e) == 0x3414e44) {
                        *(undefined1 *)(param_1 + -0x7c) = 2;
                        *(undefined1 *)(param_1 + -0x7d) = 7;
                      }
                      else {
                        *(undefined1 *)(param_1 + -0x7c) = 0x14;
                      }
                    }
                  }
                }
              }
            }
          }
        }
        else {
          bVar2 = *(long *)(param_1 + -0x8e) == 0x3454e44;
          if (bVar2) {
            *(undefined1 *)(param_1 + -0x7c) = 0xb;
          }
          else {
            JT_CODE1_028c(param_1 + -0x8e,&DAT_0005224c);
            if (bVar2) {
              *(undefined1 *)(param_1 + -0x7c) = 6;
            }
            else {
              JT_CODE1_028c(param_1 + -0x8e,5,0x2244);
              if (bVar2) {
                *(undefined1 *)(param_1 + -0x7c) = 0xf;
              }
              else {
                JT_CODE1_028c(param_1 + -0x8e,&DAT_00052240);
                if (bVar2) {
                  *(undefined1 *)(param_1 + -0x7c) = 8;
                }
                else {
                  JT_CODE1_028c(param_1 + -0x8e,&DAT_00052238);
                  if (bVar2) {
                    *(undefined1 *)(param_1 + -0x7c) = 0x13;
                  }
                  else {
                    JT_CODE1_028c(param_1 + -0x8e,&DAT_0005222e);
                    if (bVar2) {
                      *(undefined1 *)(param_1 + -0x7c) = 1;
                      *(undefined2 *)(param_1 + -0x90) = 0xf;
                    }
                    else {
                      JT_CODE1_028c(param_1 + -0x8e,&DAT_00052226);
                      if (bVar2) {
                        *(undefined1 *)(param_1 + -0x7c) = 1;
                        *(undefined2 *)(param_1 + -0x90) = 4;
                      }
                      else {
                        JT_CODE1_028c(param_1 + -0x8e,&DAT_0005221c);
                        if (bVar2) {
                          *(undefined1 *)(param_1 + -0x7c) = 1;
                          *(undefined2 *)(param_1 + -0x90) = 6;
                        }
                        else {
                          JT_CODE1_028c(param_1 + -0x8e,&DAT_00052216);
                          if (bVar2) {
                            *(undefined1 *)(param_1 + -0x7c) = 1;
                            *(undefined2 *)(param_1 + -0x90) = 7;
                          }
                          else {
                            JT_CODE1_028c(param_1 + -0x8e,&DAT_0005220c);
                            if (bVar2) {
                              *(undefined1 *)(param_1 + -0x7c) = 0x15;
                              *(undefined1 *)(param_1 + -0xa5) = 1;
                            }
                            else {
                              JT_CODE1_028c(param_1 + -0x8e,&DAT_00052200);
                              if (bVar2) {
                                *(undefined1 *)(param_1 + -0x7c) = 0x15;
                                *(undefined1 *)(param_1 + -0xa5) = 2;
                              }
                              else {
                                JT_CODE1_028c(param_1 + -0x8e,&DAT_000521f2);
                                if (bVar2) {
                                  *(undefined1 *)(param_1 + -0x7c) = 0x15;
                                  *(undefined1 *)(param_1 + -0xa5) = 4;
                                }
                                else {
                                  *(undefined1 *)(param_1 + -0x7c) = 0x14;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      else {
        JT_CODE1_028c(param_1 + -0x8e,&DAT_000521ec);
        if (bVar2) {
          *(undefined1 *)(param_1 + -0x7c) = 0xc;
        }
        else {
          JT_CODE1_028c(param_1 + -0x8e,5,0x21e8);
          if (bVar2) {
            *(undefined1 *)(param_1 + -0x7c) = 4;
          }
          else {
            JT_CODE1_028c(param_1 + -0x8e,&DAT_000521e2);
            if (bVar2) {
              *(undefined1 *)(param_1 + -0x7c) = 0xd;
            }
            else {
              JT_CODE1_028c(param_1 + -0x8e,&DAT_000521d6);
              if (bVar2) {
                *(undefined1 *)(param_1 + -0x7c) = 1;
                *(undefined2 *)(param_1 + -0x90) = 9;
              }
              else if (*(long *)(param_1 + -0x8e) == 0x34d4f44) {
                *(undefined1 *)(param_1 + -0x7c) = 2;
                *(undefined1 *)(param_1 + -0x7d) = 6;
              }
              else {
                *(undefined1 *)(param_1 + -0x7c) = 0x14;
              }
            }
          }
        }
      }
    }
    else {
      bVar2 = local_16 == 0x53;
      if (local_16 < 0x54) {
        JT_CODE1_028c(param_1 + -0x8e,&DAT_000521ce);
        if (bVar2) {
          *(undefined1 *)(param_1 + -0x7c) = 0xe;
        }
        else {
          JT_CODE1_028c(param_1 + -0x8e,5,0x21c6);
          if (bVar2) {
            *(undefined1 *)(param_1 + -0x7c) = 9;
          }
          else {
            JT_CODE1_028c(param_1 + -0x8e,&DAT_000521c0);
            if (bVar2) {
              *(undefined1 *)(param_1 + -0x7c) = 1;
              *(undefined2 *)(param_1 + -0x90) = 3;
            }
            else {
              JT_CODE1_028c(param_1 + -0x8e,&DAT_000521ba);
              if (bVar2) {
                *(undefined1 *)(param_1 + -0x7c) = 1;
                *(undefined2 *)(param_1 + -0x90) = 0x10;
              }
              else {
                JT_CODE1_028c(param_1 + -0x8e,&DAT_000521b4);
                if (bVar2) {
                  *(undefined1 *)(param_1 + -0x7c) = 1;
                  *(undefined2 *)(param_1 + -0x90) = 5;
                }
                else {
                  JT_CODE1_028c(param_1 + -0x8e,&DAT_000521ac);
                  if (bVar2) {
                    *(undefined1 *)(param_1 + -0x7c) = 1;
                    *(undefined2 *)(param_1 + -0x90) = 0x11;
                  }
                  else {
                    JT_CODE1_028c(param_1 + -0x8e,&DAT_000521a0);
                    if (bVar2) {
                      *(undefined1 *)(param_1 + -0x7c) = 0x12;
                      *(undefined2 *)(param_1 + -0x90) = 0x12;
                    }
                    else {
                      JT_CODE1_028c(param_1 + -0x8e,&DAT_0005219a);
                      if (bVar2) {
                        *(undefined1 *)(param_1 + -0x7c) = 1;
                        *(undefined2 *)(param_1 + -0x90) = 0x12;
                      }
                      else {
                        JT_CODE1_028c(param_1 + -0x8e,&DAT_0005218e);
                        if (bVar2) {
                          *(undefined1 *)(param_1 + -0x7c) = 0x15;
                          *(undefined1 *)(param_1 + -0xa5) = 3;
                        }
                        else {
                          JT_CODE1_028c(param_1 + -0x8e,&DAT_0005218a);
                          if (bVar2) {
                            *(undefined1 *)(param_1 + -0x7c) = 2;
                            *(undefined1 *)(param_1 + -0x7d) = 8;
                          }
                          else {
                            JT_CODE1_028c(param_1 + -0x8e,&DAT_00052184);
                            if (bVar2) {
                              *(undefined1 *)(param_1 + -0x7c) = 0x1a;
                            }
                            else {
                              *(undefined1 *)(param_1 + -0x7c) = 0x14;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      else {
        JT_CODE1_028c(param_1 + -0x8e,&DAT_00052180);
        if (bVar2) {
          *(undefined1 *)(param_1 + -0x7c) = 0x10;
        }
        else {
          JT_CODE1_028c(param_1 + -0x8e,5,0x217a);
          if (bVar2) {
            *(undefined1 *)(param_1 + -0x7c) = 5;
          }
          else if (*(int *)(param_1 + -0x8e) == 0x158) {
            *(undefined1 *)(param_1 + -0x7c) = 1;
            *(undefined2 *)(param_1 + -0x90) = 0;
          }
          else {
            bVar2 = *(int *)(param_1 + -0x8e) == 0x159;
            if (bVar2) {
              *(undefined1 *)(param_1 + -0x7c) = 1;
              *(undefined2 *)(param_1 + -0x90) = 1;
            }
            else {
              JT_CODE1_028c(param_1 + -0x8e,&DAT_00052174);
              if (bVar2) {
                *(undefined1 *)(param_1 + -0x7c) = 0x19;
              }
              else {
                JT_CODE1_028c(param_1 + -0x8e,&DAT_0005216c);
                if (bVar2) {
                  *(undefined1 *)(param_1 + -0x7c) = 1;
                  *(undefined2 *)(param_1 + -0x90) = 0xd;
                }
                else {
                  JT_CODE1_028c(param_1 + -0x8e,&DAT_00052164);
                  if (bVar2) {
                    *(undefined1 *)(param_1 + -0x7c) = 1;
                    *(undefined2 *)(param_1 + -0x90) = 0xc;
                  }
                  else {
                    JT_CODE1_028c(param_1 + -0x8e,&DAT_0005215e);
                    if (bVar2) {
                      *(undefined1 *)(param_1 + -0x7c) = 7;
                    }
                    else {
                      JT_CODE1_028c(param_1 + -0x8e,&DAT_00052158);
                      if (bVar2) {
                        *(undefined1 *)(param_1 + -0x7c) = 10;
                      }
                      else {
                        JT_CODE1_028c(param_1 + -0x8e,&DAT_00052150);
                        if (bVar2) {
                          *(undefined1 *)(param_1 + -0x7c) = 1;
                          *(undefined2 *)(param_1 + -0x90) = 0x11;
                        }
                        else {
                          JT_CODE1_028c(param_1 + -0x8e,&DAT_0005214a);
                          if (bVar2) {
                            *(undefined1 *)(param_1 + -0x7c) = 0x12;
                            *(undefined2 *)(param_1 + -0x90) = 0x17d;
                          }
                          else {
                            JT_CODE1_028c(param_1 + -0x8e,&DAT_00052144);
                            if (bVar2) {
                              *(undefined1 *)(param_1 + -0x7c) = 0x12;
                              *(undefined2 *)(param_1 + -0x90) = 0x139;
                            }
                            else {
                              JT_CODE1_028c(param_1 + -0x8e,&DAT_00052136);
                              if (bVar2) {
                                *(undefined1 *)(param_1 + -0x7c) = 1;
                                *(undefined2 *)(param_1 + -0x90) = 10;
                              }
                              else {
                                JT_CODE1_028c(param_1 + -0x8e,&DAT_00052128);
                                if (bVar2) {
                                  *(undefined1 *)(param_1 + -0x7c) = 1;
                                  *(undefined2 *)(param_1 + -0x90) = 0xb;
                                }
                                else if (*(long *)(param_1 + -0x8e) == 0x3584f52) {
                                  *(undefined1 *)(param_1 + -0x7c) = 2;
                                  *(undefined1 *)(param_1 + -0x7d) = 9;
                                }
                                else {
                                  *(undefined1 *)(param_1 + -0x7c) = 0x14;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return;
}



/* CODE 5 + 0x2288, synthetic address 0x00052288 */

/* Original CODE 5 resource offset 0x2288 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_2288(long param_1,undefined2 param_2)

{
  if (*(int *)(param_1 + -0x78) < 0xf) {
    *(undefined1 *)(param_1 + -0x70 + (long)(*(int *)(param_1 + -0x78) * 6)) = param_2._0_1_;
    *(undefined2 *)(param_1 + -0x6e + (long)(*(int *)(param_1 + -0x78) * 6)) =
         **(undefined2 **)(param_1 + 0xe);
    *(undefined2 *)(param_1 + -0x6c + (long)(*(int *)(param_1 + -0x78) * 6)) =
         **(undefined2 **)(param_1 + 0xe);
    *(int *)(param_1 + -0x78) = *(int *)(param_1 + -0x78) + 1;
  }
  else {
    JT_CODE1_03e2(*(undefined4 *)(param_1 + 0x1c),&DAT_000522ee,*(undefined2 *)(param_1 + 0x1a));
  }
  return;
}



/* CODE 5 + 0x231c, synthetic address 0x0005231c */

/* Original CODE 5 resource offset 0x231c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_231c(long param_1)

{
  CODE5_2288(param_1);
  *(undefined1 *)(*(long *)(param_1 + 0x16) + (long)(**(int **)(param_1 + 0xe) << 2)) = 0x12;
  **(int **)(param_1 + 0xe) = **(int **)(param_1 + 0xe) + 1;
  return;
}



/* CODE 5 + 0x235a, synthetic address 0x0005235a */

/* Original CODE 5 resource offset 0x235a (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_235a(long param_1,undefined4 *param_2)

{
  undefined4 *puVar1;
  
  if (*(int *)(param_1 + -0x78) < 1) {
    *(undefined1 *)param_2 = 0;
    JT_CODE1_03e2(*(undefined4 *)(param_1 + 0x1c),&DAT_000523aa,*(undefined2 *)(param_1 + 0x1a));
  }
  else {
    *(int *)(param_1 + -0x78) = *(int *)(param_1 + -0x78) + -1;
    puVar1 = (undefined4 *)(param_1 + -0x70 + (long)(*(int *)(param_1 + -0x78) * 6));
    *param_2 = *puVar1;
    *(undefined2 *)(param_2 + 1) = *(undefined2 *)(puVar1 + 1);
  }
  return;
}



/* CODE 5 + 0x23dc, synthetic address 0x000523dc */

/* Original CODE 5 resource offset 0x23dc (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_23dc(long param_1)

{
  int iVar1;
  int iVar2;
  bool bVar3;
  
  iVar1 = **(int **)(param_1 + 0xe);
  iVar2 = *(int *)(param_1 + -0xa2);
  do {
    if (iVar1 + -1 < iVar2) break;
    *(undefined2 *)((long)(iVar2 * 2 + -0x1808) + 0x100000) = *(undefined2 *)(param_1 + -0xa4);
    bVar3 = SCARRY2(iVar2,1);
    iVar2 = iVar2 + 1;
  } while (!bVar3);
  *(undefined2 *)(param_1 + -0xa2) = **(undefined2 **)(param_1 + 0xe);
  *(int *)(param_1 + -0xa4) = *(int *)(param_1 + -0xa4) + 1;
  *(undefined1 *)(*(long *)(param_1 + 0x16) + (long)(**(int **)(param_1 + 0xe) << 2)) = 0;
  if (*(char *)(param_1 + -0x95) != '\0') {
    *(undefined1 *)(*(long *)(param_1 + 0x16) + 1 + (long)(*(int *)(param_1 + -0x9a) << 2)) = 2;
    *(undefined2 *)(*(long *)(param_1 + 0x16) + 2 + (long)(*(int *)(param_1 + -0x9a) << 2)) =
         **(undefined2 **)(param_1 + 0xe);
  }
  *(undefined1 *)(param_1 + -0x95) = 0;
  *(undefined1 *)(param_1 + -0x79) = 0;
  *(undefined2 *)(param_1 + -0x9a) = 0;
  *(undefined1 *)(param_1 + -0x7a) = 0;
  *(undefined1 *)(param_1 + -0x7b) = 0;
  if (0x7c6 < **(int **)(param_1 + 0xe)) {
    JT_CODE1_03e2(*(undefined4 *)(param_1 + 0x1c),&DAT_00052494,*(undefined2 *)(param_1 + 0x1a));
  }
  return;
}



/* CODE 5 + 0x24dc, synthetic address 0x000524dc */

/* Original CODE 5 resource offset 0x24dc (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE5_24dc(undefined2 param_1,int *param_2,int *param_3,long param_4,long param_5,
               undefined2 param_6,char *param_7,int param_8,long *param_9)

{
  undefined4 uVar1;
  char cVar2;
  int iVar3;
  undefined1 *puVar4;
  undefined1 *puVar5;
  char **ppcVar6;
  bool bVar7;
  int aiStack_8072 [15952];
  char *local_3d2;
  undefined2 uStack_3ce;
  undefined2 uStack_3cc;
  undefined2 local_3ca;
  undefined1 *local_3c8;
  char *local_3c4;
  undefined *puStack_3c0;
  undefined2 local_3bc;
  undefined1 auStack_3aa [250];
  undefined4 uStack_2b0;
  undefined2 uStack_2ac;
  undefined1 auStack_1aa [257];
  byte local_a9;
  undefined2 local_a8;
  undefined2 local_a6;
  int local_a2;
  undefined2 local_a0;
  int local_9e;
  byte local_9b;
  byte local_99;
  int local_94;
  undefined1 local_81;
  byte local_80;
  char local_7f;
  char local_7e;
  char local_7d;
  int local_7c;
  undefined4 local_7a;
  undefined2 local_76;
  int aiStack_72 [55];
  
  local_a9 = 0;
  do {
    *(undefined2 *)(param_4 + (int)((uint)local_a9 * 2)) = 0;
    local_a9 = local_a9 + 1;
  } while (local_a9 < 7);
  *param_2 = -1;
  local_7c = 0;
  *param_3 = 0;
  local_a0 = 0;
  local_a2 = 0;
  iVar3 = 0;
  local_3bc = param_6;
  puStack_3c0 = &DAT_00053d42;
  local_3c4 = param_7;
  local_3c8 = (undefined1 *)0x52530;
  JT_CODE1_03e2();
  local_9b = 0;
  local_a6 = 0;
  local_a8 = 0;
  ppcVar6 = &local_3c8;
  uStack_3cc = 5;
  local_3ca = 0x2542;
  local_3c8 = &stack0xfffffffc;
  CODE5_23dc();
  local_a8 = 0;
  if (param_8 < 2) {
    local_3ca = param_6;
    uStack_3ce = 5;
    uStack_3cc = 0x3d0a;
    ppcVar6 = &local_3d2;
    local_3d2 = param_7;
    JT_CODE1_03e2();
  }
  *(undefined1 **)((long)ppcVar6 + -6) = &stack0xfffffffc;
  *(undefined4 *)((long)ppcVar6 + -10) = 0x52566;
  CODE5_13ba();
  cVar2 = '\0';
  while ((byte)(-(*param_7 == '\0') & cVar2 - 1U) != 0) {
    if (local_a2 < param_8) {
      puVar4 = (undefined1 *)((long)ppcVar6 + -4);
      *(undefined1 **)((long)ppcVar6 + -4) = &stack0xfffffffc;
      *(undefined4 *)((long)ppcVar6 + -8) = 0x52586;
      CODE5_1718();
    }
    else {
      cVar2 = '\x01';
      local_80 = 0;
      puVar4 = (undefined1 *)ppcVar6;
    }
    puVar5 = puVar4;
    if ((local_9b & -(local_80 != 0x14)) != 0) {
      *(undefined2 *)(puVar4 + -2) = param_6;
      *(undefined **)(puVar4 + -6) = &DAT_00053ce0;
      puVar5 = puVar4 + -10;
      *(char **)(puVar4 + -10) = param_7;
      *(undefined4 *)(puVar4 + -0xe) = 0x525a4;
      JT_CODE1_03e2();
    }
    ppcVar6 = (char **)puVar5;
    if (*param_7 == '\0') {
      if (local_80 < 0x1b) {
        switch(local_80) {
        case 0:
          if (local_7e == '\x04' ||
              (local_7e == '\x0e' ||
              (local_7e == '\0' || (local_7e == '\x02' || local_7e == '\x01')))) {
            *(undefined1 **)(puVar5 + -4) = &stack0xfffffffc;
            *(undefined4 *)(puVar5 + -8) = 0x525f0;
            CODE5_23dc();
            ppcVar6 = (char **)(puVar5 + -4);
          }
          else if ((byte)(-(local_7d == '\x01') & -(local_7f == '\0') & -(local_7e == '\n')) == 0) {
            if ((byte)(-(local_7d == '\x03') & -(local_7e == '\v')) == 0) {
              *(undefined2 *)(puVar5 + -2) = param_6;
              *(undefined **)(puVar5 + -6) = &DAT_00053c9a;
              *(char **)(puVar5 + -10) = param_7;
              *(undefined4 *)(puVar5 + -0xe) = 0x5270e;
              JT_CODE1_03e2();
              local_a2 = local_a2 + -1;
              ppcVar6 = (char **)(puVar5 + -10);
            }
            else {
              *(undefined4 **)(puVar5 + -4) = &uStack_2b0;
              *(undefined1 **)(puVar5 + -8) = &stack0xfffffffc;
              *(undefined4 *)(puVar5 + -0xc) = 0x5266e;
              CODE5_235a();
              local_7a = uStack_2b0;
              uVar1 = local_7a;
              local_76 = uStack_2ac;
              local_7a._0_1_ = (char)((ulong)uStack_2b0 >> 0x18);
              bVar7 = local_7a._0_1_ == '\x04';
              ppcVar6 = (char **)(puVar5 + -4);
              local_7a = uVar1;
              if (bVar7) {
                *(char *)(param_5 + (*param_3 + -1) * 4) =
                     '\x19' - *(char *)(param_5 + (*param_3 + -1) * 4);
                *(undefined1 *)(param_5 + (*param_3 << 2)) = 0x12;
                *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 2;
                *(undefined2 *)(param_5 + 2 + (long)(*param_3 << 2)) = uStack_2ac;
                *param_3 = *param_3 + 1;
                *(undefined1 **)(puVar5 + -8) = &stack0xfffffffc;
                *(undefined4 *)(puVar5 + -0xc) = 0x526fa;
                CODE5_23dc();
                ppcVar6 = (char **)(puVar5 + -8);
              }
            }
          }
          else {
            *(char *)(param_5 + (*param_3 + -1) * 4) =
                 '\x19' - *(char *)(param_5 + (*param_3 + -1) * 4);
            puVar5[-2] = 1;
            *(undefined1 **)(puVar5 + -6) = &stack0xfffffffc;
            *(undefined4 *)(puVar5 + -10) = 0x52644;
            CODE5_231c();
            *(undefined1 **)(puVar5 + -10) = &stack0xfffffffc;
            *(undefined4 *)(puVar5 + -0xe) = 0x5264a;
            CODE5_23dc();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 1:
          if ((byte)(-(local_7f == '\0') & -(local_7e == '\b')) == 0 && local_7e != '\0') {
            if ((byte)(-(local_7f == '\x02') & (-(local_7e == '\a') | -(local_7e == '\b'))) == 0) {
              if (local_7e == '\t' || (local_7e == '\r' || local_7e == '\f')) {
                *(int *)(param_5 + 2 + (long)(*param_3 << 2)) = local_94;
                *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 1;
                *param_3 = *param_3 + 1;
                if (local_7e == '\t') {
                  local_7f = '\0';
                  local_7e = '\v';
                }
                else if (local_7e == '\f') {
                  local_7e = '\x01';
                }
                else {
                  local_7e = '\x0e';
                  local_7f = '\0';
                }
              }
              else if ((byte)(-(local_7d == '\x01') & -(local_7e == '\n')) == 0) {
                if (local_7e == '\x06') {
                  puVar5[-2] = 1;
                  *(int *)(puVar5 + -4) = local_94;
                  *(undefined1 **)(puVar5 + -8) = &stack0xfffffffc;
                  *(undefined4 *)(puVar5 + -0xc) = 0x528a6;
                  CODE5_1296();
                  local_7e = '\x01';
                  ppcVar6 = (char **)(puVar5 + -8);
                }
                else {
                  *(undefined2 *)(puVar5 + -2) = param_6;
                  *(undefined **)(puVar5 + -6) = &DAT_00053c7a;
                  *(char **)(puVar5 + -10) = param_7;
                  *(undefined4 *)(puVar5 + -0xe) = 0x528c0;
                  JT_CODE1_03e2();
                  ppcVar6 = (char **)(puVar5 + -10);
                }
              }
              else {
                local_99 = 1;
              }
            }
            else {
              *(int *)(param_5 + 2 + (long)(*param_3 << 2)) = local_94;
              *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 1;
              *param_3 = *param_3 + 1;
              local_7f = '\x01';
            }
          }
          else {
            *(undefined1 *)(param_5 + (*param_3 << 2)) = 1;
            *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 1;
            *(int *)(param_5 + 2 + (long)(*param_3 << 2)) = local_94;
            *param_3 = *param_3 + 1;
            local_7f = '\x01';
            if (local_7e == '\0') {
              local_7e = '\a';
            }
          }
          break;
        case 2:
          if ((byte)(-(local_7f == '\x01') & (-(local_7e == '\a') | -(local_7e == '\b'))) == 0) {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_00053c58;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x5290e;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          else {
            local_7f = '\x02';
            *(undefined1 *)(param_5 + (*param_3 << 2)) = local_81;
          }
          break;
        case 3:
          if ((byte)(-(local_7f == '\x01') & -(local_7e == '\b')) == 0) {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_00053c0c;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x52956;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          else {
            *(undefined1 *)(param_5 + (*param_3 << 2)) = local_81;
            local_7e = '\t';
            local_7f = '\0';
          }
          break;
        case 4:
          if (local_7e == '\0') {
            local_7e = '\b';
            local_7d = '\x01';
            local_7f = '\0';
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_00053be8;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x52984;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 5:
          if ((byte)(-(local_7d == '\x01') & -(local_7e == '\v')) == 0) {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_00053bce;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x529b6;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          else {
            local_7e = '\n';
          }
          break;
        case 6:
          if (local_7e == '\0') {
            *(undefined4 **)(puVar5 + -4) = &uStack_2b0;
            *(undefined1 **)(puVar5 + -8) = &stack0xfffffffc;
            *(undefined4 *)(puVar5 + -0xc) = 0x529ca;
            CODE5_235a();
            local_7a = uStack_2b0;
            uVar1 = local_7a;
            local_76 = uStack_2ac;
            local_7a._0_1_ = (char)((ulong)uStack_2b0 >> 0x18);
            local_7a = uVar1;
            if (local_7a._0_1_ == '\x01') {
              local_7a._2_2_ = (int)uStack_2b0;
              *(int *)(param_5 + 2 + (long)(local_7a._2_2_ << 2)) = *param_3 + 1;
              *(undefined1 *)(param_5 + 1 + (long)(local_7a._2_2_ << 2)) = 2;
              puVar5[-6] = 2;
              *(undefined1 **)(puVar5 + -10) = &stack0xfffffffc;
              *(undefined4 *)(puVar5 + -0xe) = 0x52a10;
              CODE5_231c();
              local_7e = '\x01';
              ppcVar6 = (char **)(puVar5 + -10);
            }
            else {
              *(undefined2 *)(puVar5 + -6) = param_6;
              *(undefined **)(puVar5 + -10) = &DAT_00053b9a;
              *(char **)(puVar5 + -0xe) = param_7;
              *(undefined4 *)(puVar5 + -0x12) = 0x52a2a;
              JT_CODE1_03e2();
              ppcVar6 = (char **)(puVar5 + -0xe);
            }
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_00053b7a;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x52a3e;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 7:
          if (local_7e == '\0') {
            puVar5[-2] = 3;
            *(undefined1 **)(puVar5 + -6) = &stack0xfffffffc;
            *(undefined4 *)(puVar5 + -10) = 0x52a52;
            CODE5_2288();
            local_7e = '\b';
            local_7d = '\x02';
            local_7f = '\0';
            ppcVar6 = (char **)(puVar5 + -6);
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_00053b54;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x52a76;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 8:
          if ((byte)(-(local_7d == '\x02') & -(local_7e == '\v')) == 0) {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_00053b28;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x52b04;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          else {
            local_7e = '\x01';
            *(char *)(param_5 + (*param_3 + -1) * 4) =
                 '\x19' - *(char *)(param_5 + (*param_3 + -1) * 4);
            *(int *)((long)aiStack_72 + (long)((local_7c + -1) * 6)) = *param_3;
            *(undefined1 *)(param_5 + (*param_3 << 2)) = 0x12;
            *param_3 = *param_3 + 1;
          }
          break;
        case 9:
          if (local_7e == '\0') {
            puVar5[-2] = 4;
            *(undefined1 **)(puVar5 + -6) = &stack0xfffffffc;
            *(undefined4 *)(puVar5 + -10) = 0x52b18;
            CODE5_2288();
            ppcVar6 = (char **)(puVar5 + -6);
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_00053afa;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x52b2c;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 10:
          if (local_7e == '\0') {
            local_7e = '\b';
            local_7d = '\x03';
            local_7f = '\0';
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_00053ad2;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x52b5a;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 0xb:
          if (local_7e == '\0') {
            *(undefined4 **)(puVar5 + -4) = &uStack_2b0;
            *(undefined1 **)(puVar5 + -8) = &stack0xfffffffc;
            *(undefined4 *)(puVar5 + -0xc) = 0x52b70;
            CODE5_235a();
            local_7a = uStack_2b0;
            uVar1 = local_7a;
            local_76 = uStack_2ac;
            local_7a._0_1_ = (char)((ulong)uStack_2b0 >> 0x18);
            local_7a = uVar1;
            if (local_7a._0_1_ == '\x02' || (local_7a._0_1_ == '\x03' || local_7a._0_1_ == '\x01'))
            {
              if (local_7a._0_1_ == '\x03') {
                *(undefined1 *)(param_5 + (*param_3 << 2)) = 0x12;
                *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 2;
                *(undefined2 *)(param_5 + 2 + (long)(*param_3 << 2)) = uStack_2ac;
                *param_3 = *param_3 + 1;
              }
              local_7a._2_2_ = (int)uStack_2b0;
              *(int *)(param_5 + 2 + (long)(local_7a._2_2_ << 2)) = *param_3;
              *(undefined1 *)(param_5 + 1 + (long)(local_7a._2_2_ << 2)) = 2;
              local_7e = '\x01';
              ppcVar6 = (char **)(puVar5 + -4);
            }
            else {
              *(undefined2 *)(puVar5 + -6) = param_6;
              *(undefined **)(puVar5 + -10) = &DAT_00053a90;
              *(char **)(puVar5 + -0xe) = param_7;
              *(undefined4 *)(puVar5 + -0x12) = 0x52c24;
              JT_CODE1_03e2();
              ppcVar6 = (char **)(puVar5 + -0xe);
            }
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_00053a70;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x52c38;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 0xc:
          if (local_7e == '\n' || local_7e == '\0') {
            *(undefined1 *)(param_5 + (*param_3 << 2)) = 0x12;
            local_7e = '\f';
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_00053a48;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x52c7a;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 0xd:
          if (local_7e == '\n' || local_7e == '\0') {
            *(undefined1 *)(param_5 + (*param_3 << 2)) = 0x11;
            local_7e = '\f';
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_00053a20;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x52cbc;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 0xe:
          if (local_7e == '\n' || local_7e == '\0') {
            *(undefined1 *)(param_5 + (*param_3 << 2)) = 0x13;
            *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 0;
            *(undefined2 *)(param_5 + 2 + (long)(*param_3 << 2)) = 0;
            *param_3 = *param_3 + 1;
            local_7e = '\x01';
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_000539f6;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x52d2c;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 0xf:
          if (local_7e == '\n' || local_7e == '\0') {
            *(undefined1 *)(param_5 + (*param_3 << 2)) = 0x14;
            *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 0;
            *(undefined2 *)(param_5 + 2 + (long)(*param_3 << 2)) = 0;
            *param_3 = *param_3 + 1;
            local_7e = '\x01';
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_000539cc;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x52d9c;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 0x10:
          if (local_7e == '\x0e' || (byte)(-(local_7f == '\x01') & -(local_7e == '\a')) != 0) {
            *(undefined1 *)(param_5 + (*param_3 << 2)) = 0x10;
            local_7e = '\r';
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_0005397e;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x52dea;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 0x11:
          for (; (byte)(-(local_a2 < param_8) & -(*(char *)(*param_9 + (long)local_a2) != '\r')) !=
                 0; local_a2 = local_a2 + 1) {
          }
          break;
        case 0x12:
          if ((byte)(-(local_7f == '\0') & -(local_7e == '\b')) == 0 && local_7e != '\0') {
            if ((byte)(-(local_7f == '\x02') & (-(local_7e == '\a') | -(local_7e == '\b'))) == 0 &&
                local_7e != '\t') {
              if ((byte)(-(local_7d == '\x01') & -(local_7e == '\n')) == 0) {
                if (local_7e == '\x06') {
                  puVar5[-2] = 2;
                  *(int *)(puVar5 + -4) = local_94;
                  *(undefined1 **)(puVar5 + -8) = &stack0xfffffffc;
                  *(undefined4 *)(puVar5 + -0xc) = 0x52f46;
                  CODE5_1296();
                  local_7e = '\x01';
                  ppcVar6 = (char **)(puVar5 + -8);
                }
                else if (local_7e == '\x0f') {
                  *(int *)(param_4 + (int)((uint)local_a9 * 2)) = local_94;
                  local_7e = '\x01';
                  if (local_94 < 0 ||
                      *(int *)((long)(int)((uint)local_a9 * 2 + -0x114) + 0x100000) < local_94) {
                    *(long *)(puVar5 + -4) =
                         (long)*(int *)((long)(int)((uint)local_a9 * 2 + -0x114) + 0x100000);
                    *(undefined1 **)(puVar5 + -8) = auStack_1aa;
                    *(undefined4 *)(puVar5 + -0xc) = 0x52fac;
                    JT_CODE1_094e();
                    *(undefined1 **)(puVar5 + -0xc) = auStack_3aa;
                    *(undefined **)(puVar5 + -0x10) = &DAT_00053934;
                    *(undefined1 **)(puVar5 + -0x14) = auStack_1aa;
                    *(undefined **)(puVar5 + -0x18) = &DAT_00053932;
                    *(undefined2 *)(puVar5 + -0x1a) = 3;
                    *(undefined4 *)(puVar5 + -0x1e) = 0x52fc4;
                    JT_CODE1_0004();
                    *(undefined2 *)(puVar5 + -0x18) = param_6;
                    *(undefined1 **)(puVar5 + -0x1c) = auStack_3aa;
                    *(char **)(puVar5 + -0x20) = param_7;
                    *(undefined4 *)(puVar5 + -0x24) = 0x52fd6;
                    JT_CODE1_03e2();
                    ppcVar6 = (char **)(puVar5 + -0x20);
                  }
                }
                else if (local_7e == '\x04') {
                  iVar3 = local_94 + iVar3 + -1;
                  puVar4 = puVar5;
                  if (200 < iVar3) {
                    *(undefined2 *)(puVar5 + -2) = param_6;
                    *(undefined **)(puVar5 + -6) = &DAT_0005390e;
                    puVar4 = puVar5 + -10;
                    *(char **)(puVar5 + -10) = param_7;
                    *(undefined4 *)(puVar5 + -0xe) = 0x52ffe;
                    JT_CODE1_03e2();
                  }
                  local_7e = '\x01';
                  ppcVar6 = (char **)puVar4;
                }
                else {
                  *(undefined2 *)(puVar5 + -2) = param_6;
                  *(undefined **)(puVar5 + -6) = &DAT_000538e2;
                  *(char **)(puVar5 + -10) = param_7;
                  *(undefined4 *)(puVar5 + -0xe) = 0x53018;
                  JT_CODE1_03e2();
                  ppcVar6 = (char **)(puVar5 + -10);
                }
              }
              else {
                local_99 = 1;
              }
            }
            else {
              *(int *)(param_5 + 2 + (long)(*param_3 << 2)) = local_94;
              *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 2;
              *param_3 = *param_3 + 1;
              if (local_7e == '\t') {
                local_7f = '\0';
                local_7e = '\v';
              }
              else {
                local_7f = '\x01';
              }
            }
          }
          else {
            *(undefined1 *)(param_5 + (*param_3 << 2)) = 1;
            *(int *)(param_5 + 2 + (long)(*param_3 << 2)) = local_94;
            *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 2;
            *param_3 = *param_3 + 1;
            local_7f = '\x01';
            if (local_7e == '\0') {
              local_7e = '\a';
            }
          }
          break;
        case 0x13:
          if (local_7e == '\0') {
            local_7e = '\x05';
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_000538b6;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x5303c;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 0x14:
          *(ulong *)(puVar5 + -4) =
               (ulong)CONCAT11((char)((uint)*(undefined2 *)
                                             ((long)&switchD_00053474::switchdataD_00053478 +
                                             (long)(int)((uint)local_80 * 2)) >> 8),
                               -(local_7e == '\0'));
          *(undefined1 **)(puVar5 + -10) = &stack0xfffffffc;
          *(undefined4 *)(puVar5 + -0xe) = 0x53050;
          CODE5_1426();
          if ((puVar5[-6] & (byte)*(undefined4 *)(puVar5 + -4)) == 0) {
            if ((byte)(-(local_7f == '\0') & -(local_7e == '\b')) == 0 && local_7e != '\0') {
              if ((byte)(-(local_7f == '\x02') & (-(local_7e == '\a') | -(local_7e == '\b'))) == 0
                  && local_7e != '\t') {
                if (local_7e == '\r') {
                  puVar5[-4] = 0;
                  *(undefined1 **)(puVar5 + -8) = &stack0xfffffffc;
                  *(undefined4 *)(puVar5 + -0xc) = 0x531a6;
                  CODE5_10e8();
                  local_94 = *(int *)(puVar5 + -2);
                  if (local_9b == 0) {
                    *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 3;
                    *(int *)(param_5 + 2 + (long)(*param_3 << 2)) = local_94;
                  }
                  else {
                    *(undefined1 **)(puVar5 + -4) = &stack0xfffffffc;
                    *(undefined4 *)(puVar5 + -8) = 0x531b6;
                    CODE5_137a();
                    puVar5 = puVar5 + -4;
                  }
                  *param_3 = *param_3 + 1;
                  local_7e = '\x0e';
                  local_7f = '\0';
                  ppcVar6 = (char **)puVar5;
                }
                else if (local_7e == '\f') {
                  puVar5[-4] = 0;
                  *(undefined1 **)(puVar5 + -8) = &stack0xfffffffc;
                  *(undefined4 *)(puVar5 + -0xc) = 0x5320a;
                  CODE5_10e8();
                  local_94 = *(int *)(puVar5 + -2);
                  *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 3;
                  *(int *)(param_5 + 2 + (long)(*param_3 << 2)) = local_94;
                  *param_3 = *param_3 + 1;
                  local_7e = '\x02';
                }
                else if ((byte)(-(local_7d == '\x01') & -(local_7e == '\n')) == 0) {
                  if (local_7e == '\x05') {
                    puVar5[-4] = 0;
                    *(undefined1 **)(puVar5 + -8) = &stack0xfffffffc;
                    *(undefined4 *)(puVar5 + -0xc) = 0x5327a;
                    CODE5_10e8();
                    local_94 = *(int *)(puVar5 + -2);
                    local_7e = '\x06';
                  }
                  else if (local_7e == '\x03') {
                    puVar5[-4] = 0;
                    *(undefined1 **)(puVar5 + -8) = &stack0xfffffffc;
                    *(undefined4 *)(puVar5 + -0xc) = 0x5329a;
                    CODE5_10e8();
                    local_94 = *(int *)(puVar5 + -2);
                    puVar5[-2] = 4;
                    *(int *)(puVar5 + -4) = iVar3;
                    *(undefined1 **)(puVar5 + -8) = &stack0xfffffffc;
                    *(undefined4 *)(puVar5 + -0xc) = 0x532aa;
                    CODE5_1296();
                    iVar3 = iVar3 + 1;
                    local_7e = '\x04';
                    ppcVar6 = (char **)(puVar5 + -8);
                  }
                  else {
                    *(undefined2 *)(puVar5 + -2) = param_6;
                    *(undefined **)(puVar5 + -6) = &DAT_00053884;
                    *(char **)(puVar5 + -10) = param_7;
                    *(undefined4 *)(puVar5 + -0xe) = 0x532c6;
                    JT_CODE1_03e2();
                    ppcVar6 = (char **)(puVar5 + -10);
                  }
                }
                else {
                  local_99 = 1;
                }
              }
              else {
                puVar5[-4] = 0;
                *(undefined1 **)(puVar5 + -8) = &stack0xfffffffc;
                *(undefined4 *)(puVar5 + -0xc) = 0x53130;
                CODE5_10e8();
                local_94 = *(int *)(puVar5 + -2);
                if (local_9b == 0) {
                  *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 3;
                  *(int *)(param_5 + 2 + (long)(*param_3 << 2)) = local_94;
                }
                else {
                  *(undefined1 **)(puVar5 + -4) = &stack0xfffffffc;
                  *(undefined4 *)(puVar5 + -8) = 0x53140;
                  CODE5_137a();
                  puVar5 = puVar5 + -4;
                }
                *param_3 = *param_3 + 1;
                ppcVar6 = (char **)puVar5;
                if (local_7e == '\t') {
                  local_7f = '\0';
                  local_7e = '\v';
                }
                else {
                  local_7f = '\x01';
                }
              }
            }
            else {
              *(undefined1 *)(param_5 + (*param_3 << 2)) = 1;
              puVar5[-4] = 0;
              *(undefined1 **)(puVar5 + -8) = &stack0xfffffffc;
              *(undefined4 *)(puVar5 + -0xc) = 0x530a4;
              CODE5_10e8();
              local_94 = *(int *)(puVar5 + -2);
              if (local_9b == 0) {
                *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 3;
                *(int *)(param_5 + 2 + (long)(*param_3 << 2)) = local_94;
              }
              else {
                *(undefined1 **)(puVar5 + -4) = &stack0xfffffffc;
                *(undefined4 *)(puVar5 + -8) = 0x530b4;
                CODE5_137a();
                puVar5 = puVar5 + -4;
              }
              *param_3 = *param_3 + 1;
              if (local_7e == '\0') {
                local_7e = '\a';
              }
              local_7f = '\x01';
              ppcVar6 = (char **)puVar5;
            }
          }
          else {
            puVar5[-4] = 1;
            *(undefined1 **)(puVar5 + -8) = &stack0xfffffffc;
            *(undefined4 *)(puVar5 + -0xc) = 0x53064;
            CODE5_10e8();
            local_94 = *(int *)(puVar5 + -2);
          }
          break;
        case 0x15:
          if (local_7e == '\0') {
            local_7e = '\x0f';
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_0005383a;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x532ea;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 0x16:
          if (local_7e == '\0') {
            local_7e = '\x03';
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_0005380e;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x5330e;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 0x17:
          local_9b = 1;
          break;
        case 0x18:
          if ((byte)(-(local_7f == '\x01') & (-(local_7e == '\a') | -(local_7e == '\b'))) == 0 &&
              (local_7e != '\x0e' && local_7e != '\x02')) {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_000537c2;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x533a0;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          else if (*(char *)(param_5 + 1 + (long)((*param_3 + -1) * 4)) == '\x03') {
            *(undefined1 *)(param_5 + 1 + (long)((*param_3 + -1) * 4)) = 5;
          }
          else {
            *(undefined2 *)(puVar5 + -2) = param_6;
            *(undefined **)(puVar5 + -6) = &DAT_000537e8;
            *(char **)(puVar5 + -10) = param_7;
            *(undefined4 *)(puVar5 + -0xe) = 0x5338c;
            JT_CODE1_03e2();
            ppcVar6 = (char **)(puVar5 + -10);
          }
          break;
        case 0x19:
          if (local_7e == '\n' || local_7e == '\0') {
            if (param_1._0_1_ != '\0') {
              *(undefined1 *)(param_5 + (*param_3 << 2)) = 0x15;
              *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 0;
              *(undefined2 *)(param_5 + 2 + (long)(*param_3 << 2)) = 0;
              *param_3 = *param_3 + 1;
            }
            local_7e = '\x01';
          }
          break;
        case 0x1a:
          if (local_7e == '\n' || local_7e == '\0') {
            *(undefined1 *)(param_5 + (*param_3 << 2)) = 0x16;
            *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 0;
            *(undefined2 *)(param_5 + 2 + (long)(*param_3 << 2)) = 0;
            *param_3 = *param_3 + 1;
            local_7e = '\x01';
          }
        }
      }
      else {
        *(undefined2 *)(puVar5 + -2) = param_6;
        *(undefined **)(puVar5 + -6) = &DAT_0005379a;
        *(char **)(puVar5 + -10) = param_7;
        *(undefined4 *)(puVar5 + -0xe) = 0x534be;
        JT_CODE1_03e2();
        ppcVar6 = (char **)(puVar5 + -10);
      }
    }
    if ((local_99 & -(local_9e == 0)) != 0) {
      *(char *)(param_5 + (*param_3 + -1) * 4) = '\x19' - *(char *)(param_5 + (*param_3 + -1) * 4);
      *(undefined1 *)(param_5 + (*param_3 << 2)) = 0x12;
      local_9e = *param_3;
      *param_3 = *param_3 + 1;
      *(undefined1 *)(param_5 + (*param_3 << 2)) = 1;
      *(int *)(param_5 + 2 + (long)(*param_3 << 2)) = local_94;
      if (local_80 == 1) {
        *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 1;
      }
      else if (local_80 == 0x12) {
        *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 2;
      }
      else {
        *(undefined1 *)((long)ppcVar6 + -4) = 0;
        *(undefined1 **)((long)ppcVar6 + -8) = &stack0xfffffffc;
        *(undefined4 *)((long)ppcVar6 + -0xc) = 0x53584;
        CODE5_10e8();
        local_94 = *(int *)((long)ppcVar6 + -2);
        if (local_9b == 0) {
          *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 3;
          *(int *)(param_5 + 2 + (long)(*param_3 << 2)) = local_94;
        }
        else {
          *(undefined1 **)((long)ppcVar6 + -4) = &stack0xfffffffc;
          *(undefined4 *)((long)ppcVar6 + -8) = 0x53594;
          CODE5_137a();
          ppcVar6 = (char **)((long)ppcVar6 + -4);
        }
      }
      *param_3 = *param_3 + 1;
      local_7f = '\x01';
      local_7e = '\a';
    }
    if (*param_7 == '\0') {
      *(undefined1 **)((long)ppcVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppcVar6 + -10) = 0x535e8;
      CODE5_13ba();
    }
  }
  puVar4 = (undefined1 *)ppcVar6;
  if (local_7e != '\0') {
    puVar4 = (undefined1 *)((long)ppcVar6 + -4);
    *(undefined1 **)((long)ppcVar6 + -4) = &stack0xfffffffc;
    *(undefined4 *)((long)ppcVar6 + -8) = 0x5360c;
    CODE5_23dc();
  }
  puVar5 = puVar4;
  if ((byte)(-(0 < local_7c) & -(*param_7 == '\0')) != 0) {
    *(undefined2 *)(puVar4 + -2) = param_6;
    *(undefined **)(puVar4 + -6) = &DAT_0005377c;
    puVar5 = puVar4 + -10;
    *(char **)(puVar4 + -10) = param_7;
    *(undefined4 *)(puVar4 + -0xe) = 0x53632;
    JT_CODE1_03e2();
  }
  puVar4 = puVar5;
  if (*param_7 == '\0') {
    local_94 = 0;
    local_a9 = 0;
    do {
      local_94 = *(int *)(param_4 + (int)((uint)local_a9 * 2)) + local_94;
      local_a9 = local_a9 + 1;
    } while (local_a9 < 7);
    if (6 < local_94) {
      *(long *)(puVar5 + -4) = (long)local_94;
      *(undefined1 **)(puVar5 + -8) = auStack_1aa;
      *(undefined4 *)(puVar5 + -0xc) = 0x5367e;
      JT_CODE1_094e();
      *(undefined1 **)(puVar5 + -0xc) = auStack_3aa;
      *(undefined **)(puVar5 + -0x10) = &DAT_00053768;
      *(undefined1 **)(puVar5 + -0x14) = auStack_1aa;
      *(undefined **)(puVar5 + -0x18) = &DAT_0005373a;
      *(undefined2 *)(puVar5 + -0x1a) = 3;
      *(undefined4 *)(puVar5 + -0x1e) = 0x53696;
      JT_CODE1_0004();
      *(undefined2 *)(puVar5 + -0x18) = param_6;
      *(undefined1 **)(puVar5 + -0x1c) = auStack_3aa;
      puVar4 = puVar5 + -0x20;
      *(char **)(puVar5 + -0x20) = param_7;
      *(undefined4 *)(puVar5 + -0x24) = 0x536a8;
      JT_CODE1_03e2();
      *param_2 = 1;
    }
  }
  if (*param_7 == '\0') {
    *(undefined1 *)(param_5 + (*param_3 << 2)) = 0x16;
    *(undefined1 *)(param_5 + 1 + (long)(*param_3 << 2)) = 0;
    *(undefined2 *)(param_5 + 2 + (long)(*param_3 << 2)) = 0;
    *param_3 = *param_3 + 1;
    *(undefined1 **)(puVar4 + -4) = &stack0xfffffffc;
    *(undefined4 *)(puVar4 + -8) = 0x53702;
    CODE5_0e72();
  }
  if (*param_2 == -1) {
    *param_2 = local_a2;
  }
  if (param_8 <= *param_2) {
    *param_2 = param_8 + -1;
  }
  return;
}



/* CODE 5 + 0x3d44, synthetic address 0x00053d44 */

/* WARNING: Unknown calling convention */
/* Original CODE 5 resource offset 0x3d44 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE5_3d44(void)

{
  long lVar1;
  int iVar2;
  undefined **ppuVar3;
  undefined1 *puVar4;
  undefined1 *puVar5;
  undefined1 uStack00000004;
  char cStack00000006;
  byte bVar6;
  undefined4 local_28e [20];
  undefined *puStack_23e;
  undefined1 auStack_222 [264];
  char local_11a [256];
  int local_1a [11];
  
  ppuVar3 = (undefined **)&stack0xfffffdc6;
  DAT_000ffeec = 2;
  DAT_000ffeee = 4;
  DAT_000ffef0 = 1;
  DAT_000ffef2 = 2;
  DAT_000ffef4 = 2;
  DAT_000ffef6 = 1;
  DAT_000ffef8 = 5;
  if (cStack00000006 != '\0') {
    ppuVar3 = &puStack_23e;
    puStack_23e = &DAT_00053ed4;
    JT_CODE4_0b4a();
  }
  *(undefined4 *)((long)ppuVar3 + -4) = *DAT_000fbdc6;
  __mac_toolbox(0xa851);
  *(long **)((long)ppuVar3 + -8) = DAT_000fc030;
  __mac_toolbox(0xa029);
  lVar1 = *DAT_000fc030;
  *(undefined4 *)((long)ppuVar3 + -8) = *(undefined4 *)(**(long **)(lVar1 + 2) + 0x3e);
  __mac_toolbox(0xa029);
  *(undefined1 *)(lVar1 + 0x12a) = uStack00000004;
  *(undefined4 *)((long)ppuVar3 + -0xc) = *(undefined4 *)(lVar1 + 2);
  __mac_toolbox(0xa9cb);
  *(undefined2 *)((long)ppuVar3 + -0xe) = *(undefined2 *)(**(long **)(lVar1 + 2) + 0x3c);
  *(char **)((long)ppuVar3 + -0x12) = local_11a;
  *(undefined2 *)((long)ppuVar3 + -0x14) = 0xff;
  *(long *)((long)ppuVar3 + -0x18) = lVar1 + 300;
  *(long *)((long)ppuVar3 + -0x1c) = lVar1 + 0x11c;
  *(long *)((long)ppuVar3 + -0x20) = lVar1 + 0x2070;
  *(int **)((long)ppuVar3 + -0x24) = local_1a;
  puVar5 = (undefined1 *)((long)ppuVar3 + -0x26);
  *(undefined1 *)((long)ppuVar3 + -0x26) = uStack00000004;
  *(undefined4 *)((long)ppuVar3 + -0x2a) = 0x53de2;
  CODE5_24dc();
  *(undefined4 *)((long)ppuVar3 + -0x2a) = *(undefined4 *)(**(long **)(*DAT_000fc030 + 2) + 0x3e);
  __mac_toolbox(0xa02a);
  *(long **)((long)ppuVar3 + -0x2a) = DAT_000fc030;
  __mac_toolbox(0xa02a);
  if (cStack00000006 != '\0' || local_11a[0] != '\0') {
    *(undefined4 *)((long)ppuVar3 + -0x2a) = 0x53e12;
    JT_CODE4_0bc8();
  }
  iVar2 = *(int *)(*DAT_000fc030 + 0x22b4);
  if (local_11a[0] == '\0') {
    *(undefined1 *)(*DAT_000fc030 + 0x11a) = 1;
    bVar6 = 1;
  }
  else {
    __mac_toolbox(0xa850);
    bVar6 = 0;
    *(undefined1 *)(*DAT_000fc030 + 0x11a) = 0;
    *(undefined1 **)((long)ppuVar3 + -0x2a) = auStack_222;
    *(undefined **)((long)ppuVar3 + -0x2e) = &DAT_00053ec2;
    *(char **)((long)ppuVar3 + -0x32) = local_11a;
    *(undefined2 *)((long)ppuVar3 + -0x34) = 2;
    *(undefined4 *)((long)ppuVar3 + -0x38) = 0x53e4a;
    JT_CODE1_0004();
    *(undefined1 **)((long)ppuVar3 + -0x34) = auStack_222;
    *(undefined4 *)((long)ppuVar3 + -0x38) = 0x53e54;
    JT_CODE4_0ae6();
    *(long *)((long)ppuVar3 + -0x38) = (long)local_1a[0];
    *(long *)((long)ppuVar3 + -0x3c) = (long)local_1a[0];
    puVar4 = (undefined1 *)((long)ppuVar3 + -0x40);
    *(undefined4 *)((long)ppuVar3 + -0x40) = *(undefined4 *)(*DAT_000fc030 + 2);
    __mac_toolbox(0xa9d1);
    __mac_toolbox(0xa924);
    lVar1 = (long)(iVar2 * 0xa6 + -0x4068) + 0x100000;
    if (*(long *)((long)ppuVar3 + -0x44) != lVar1) {
      *(long *)((long)ppuVar3 + -0x44) = lVar1;
      __mac_toolbox(0xa91f);
      puVar4 = (undefined1 *)((long)ppuVar3 + -0x48);
      *(long *)((long)ppuVar3 + -0x48) = lVar1;
      __mac_toolbox(0xa915);
    }
    puVar5 = puVar4 + -4;
    *(long **)(puVar4 + -4) = DAT_000fc030;
    *(undefined4 *)(puVar4 + -8) = 0x53e9a;
    JT_CODE4_1ac4();
  }
  *(undefined2 *)(puVar5 + -2) = 0x3e;
  *(undefined2 *)(puVar5 + -4) = 0;
  __mac_toolbox(0xa032);
  return bVar6;
}


