/* Ghidra 11.3.2 decompiler output. Analysis aid, not reconstructed original source. */
/* Synthetic addresses: CODE n at n*0x10000; A5=0x100000. */
/* Original bytes retained. Pascal stack ABI and Toolbox calls may be unresolved. */


/* CODE 1 + 0x0004, synthetic address 0x00010004 */

void CODE1_0004(int param_1)

{
  byte *pbVar1;
  byte bVar2;
  byte bVar3;
  uint uVar4;
  byte *pbVar5;
  long *plVar6;
  long *plVar7;
  byte *pbVar8;
  bool bVar9;
  long in_stack_00000000;
  long alStack_7ffa [8189];
  
  plVar6 = (long *)(&stack0x00000006 + (param_1 << 2));
  pbVar1 = (byte *)*plVar6;
  *plVar6 = in_stack_00000000;
  bVar3 = 0;
  pbVar5 = pbVar1 + 1;
  plVar7 = plVar6;
  while (param_1 = param_1 + -1, param_1 != -1) {
    plVar7 = plVar7 + -1;
    pbVar8 = (byte *)*plVar7 + 1;
    bVar2 = *(byte *)*plVar7;
    uVar4 = (uint)bVar2;
    bVar9 = CARRY1(bVar2,bVar3);
    bVar3 = bVar2 + bVar3;
    if (bVar9) {
      uVar4 = (uint)(byte)((bVar2 - bVar3) - 1);
      param_1 = 0;
      bVar3 = 0xff;
    }
    while (uVar4 = uVar4 - 1, uVar4 != 0xffff) {
      *pbVar5 = *pbVar8;
      pbVar5 = pbVar5 + 1;
      pbVar8 = pbVar8 + 1;
    }
  }
  *pbVar1 = bVar3;
                    /* WARNING: Could not recover jumptable at 0x0001004a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)*plVar6)();
  return;
}



/* CODE 1 + 0x004c, synthetic address 0x0001004c */

/* Original CODE 1 resource offset 0x004c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE1_004c(undefined2 param_1,undefined2 param_2,long *param_3)

{
  undefined4 unaff_D3;
  undefined4 unaff_D4;
  undefined4 unaff_D5;
  undefined4 unaff_D6;
  undefined4 unaff_D7;
  undefined4 *extraout_A1;
  undefined4 unaff_A2;
  undefined4 unaff_A3;
  undefined4 unaff_A4;
  code *UNRECOVERED_JUMPTABLE;
  
  puRam000fbc8c = &stack0xfffffffc;
  puRam000fbc90 = &stack0xfffffffc;
  uRam000fbc7c = 0x1006c;
  uRam000fbc68 = unaff_D3;
  uRam000fbc6c = unaff_D4;
  uRam000fbc70 = unaff_D5;
  uRam000fbc74 = unaff_D6;
  uRam000fbc78 = unaff_D7;
  uRam000fbc80 = unaff_A2;
  uRam000fbc84 = unaff_A3;
  uRam000fbc88 = unaff_A4;
  if (*param_3 != 0) {
    __mac_toolbox(0xa01f);
    puRam000fbc8c = &stack0xfffffffc;
    puRam000fbc90 = &stack0xfffffffc;
    FUN_0001047c();
    *extraout_A1 = 0;
                    /* WARNING: Could not recover jumptable at 0x00010072. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE)();
    return;
  }
  FUN_0001047c();
  if (DAT_000fbc58 != (code *)0x0) {
    (*DAT_000fbc58)();
  }
  if (DAT_000fbdae != (code *)0x0) {
    (*DAT_000fbdae)();
  }
  __mac_toolbox(0xa9f4);
  return;
}



/* CODE 1 + 0x007c, synthetic address 0x0001007c */

void CODE1_007c(void)

{
  if (DAT_000fbc58 != (code *)0x0) {
    (*DAT_000fbc58)();
  }
  if (DAT_000fbdae != (code *)0x0) {
    (*DAT_000fbdae)();
  }
  __mac_toolbox(0xa9f4);
  return;
}



/* CODE 1 + 0x0092, synthetic address 0x00010092 */

void CODE1_0092(void)

{
  undefined4 *extraout_A0;
  
  FUN_000100e2();
  DAT_000fffde = DAT_000fffde + -1;
  DAT_000fffdc = 2;
  DAT_000fffd6 = 0;
  DAT_000fbc58 = 0;
  DAT_000fbc5c = 0;
  DAT_000fbc60 = 0;
  DAT_000fbc64 = 0;
  DAT_000fbc94 = 0;
  DAT_000fbc96 = 0;
  DAT_000fbc98 = 0xff;
  DAT_000fbc99 = 0xff;
  DAT_000fbc9a = 0;
  DAT_000fbc9b = 0;
  DAT_000fbdae = 0;
  FUN_0001046a();
  DAT_000fbc54 = *extraout_A0;
  return;
}



/* CODE 1 + 0x00e2, synthetic address 0x000100e2 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000100e2(void)

{
  int iVar1;
  int *piVar2;
  int *piVar3;
  int *piVar4;
  int *piVar5;
  int *piVar6;
  
  __mac_toolbox(0xa9a0);
  __mac_toolbox(0xa9a4);
  if (_DAT_00000900 != 0) {
    return;
  }
  __mac_toolbox(0xa9a0);
  piVar3 = piRam00004441;
  piVar5 = _DAT_00000908;
  piVar6 = piRam5a450000;
  while (piVar5 != (int *)&DAT_00100000) {
    piVar2 = piVar3 + 1;
    iVar1 = *piVar3;
    piVar4 = piVar5 + 1;
    *piVar5 = iVar1;
    piVar3 = piVar2;
    piVar5 = piVar4;
    if (iVar1 == 0) {
      piVar2 = piVar6 + 1;
      iVar1 = *piVar6;
      while (iVar1 = iVar1 + -1, piVar6 = piVar2, iVar1 != -1) {
        *piVar5 = 0;
        piVar5 = piVar5 + 1;
      }
    }
  }
  __mac_toolbox(0xa9a3);
  __mac_toolbox(0xa9a3);
  __mac_toolbox(0xa9a0);
  __mac_toolbox(0xa025);
  iVar1 = 0;
  piVar3 = piRam00004452;
  while (iVar1 = iVar1 + -1, iVar1 != -1) {
    *(long *)((long)*piVar3 + 0x100000) = *(long *)((long)*piVar3 + 0x100000) + 0x100000;
    piVar3 = piVar3 + 1;
  }
  __mac_toolbox(0xa9a3);
  return;
}



/* CODE 1 + 0x015a, synthetic address 0x0001015a */

void CODE1_015a(void)

{
  __mac_toolbox(0xa9eb);
  return;
}



/* CODE 1 + 0x0170, synthetic address 0x00010170 */

/* Original CODE 1 resource offset 0x0170 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE1_0170(undefined2 param_1,undefined2 param_2,undefined4 *param_3)

{
  undefined4 unaff_D3;
  undefined4 unaff_D4;
  undefined4 unaff_D5;
  undefined4 unaff_D6;
  undefined4 unaff_D7;
  undefined4 extraout_A0;
  undefined4 *extraout_A1;
  undefined4 unaff_A2;
  undefined4 unaff_A3;
  undefined4 unaff_A4;
  code *UNRECOVERED_JUMPTABLE;
  
  puRam000fbc8c = &stack0xfffffffc;
  puRam000fbc90 = &stack0xfffffffc;
  uRam000fbc7c = 0x10190;
  uRam000fbc68 = unaff_D3;
  uRam000fbc6c = unaff_D4;
  uRam000fbc70 = unaff_D5;
  uRam000fbc74 = unaff_D6;
  uRam000fbc78 = unaff_D7;
  uRam000fbc80 = unaff_A2;
  uRam000fbc84 = unaff_A3;
  uRam000fbc88 = unaff_A4;
  *param_3 = 0;
  __mac_toolbox(0xa31e);
  FUN_0001047c();
  *extraout_A1 = extraout_A0;
                    /* WARNING: Could not recover jumptable at 0x00010196. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x0198, synthetic address 0x00010198 */

void CODE1_0198(void)

{
  FUN_000101aa();
  return;
}



/* CODE 1 + 0x019c, synthetic address 0x0001019c */

void CODE1_019c(void)

{
  FUN_000101aa();
  return;
}



/* CODE 1 + 0x01a0, synthetic address 0x000101a0 */

void CODE1_01a0(void)

{
  FUN_000101aa();
  return;
}



/* CODE 1 + 0x01aa, synthetic address 0x000101aa */

void FUN_000101aa(undefined4 *param_1,undefined4 *param_2)

{
  *param_2 = *param_1;
  param_2[1] = param_1[1];
  *(undefined2 *)(param_2 + 2) = *(undefined2 *)(param_1 + 2);
  __mac_toolbox(0xa9ec);
  return;
}



/* CODE 1 + 0x01c0, synthetic address 0x000101c0 */

void CODE1_01c0(undefined4 *param_1,undefined4 *param_2)

{
  *param_2 = *param_1;
  param_2[1] = param_1[1];
  *(undefined2 *)(param_2 + 2) = *(undefined2 *)(param_1 + 2);
  __mac_toolbox(0xa9eb);
  return;
}



/* CODE 1 + 0x01d8, synthetic address 0x000101d8 */

void CODE1_01d8(void)

{
  int iVar1;
  
  __mac_toolbox(0xa86e);
  __mac_toolbox(0xa8fe);
  __mac_toolbox(0xa912);
  __mac_toolbox(0xa930);
  __mac_toolbox(0xa9cc);
  __mac_toolbox(0xa97b);
  __mac_toolbox(0xa02d);
  FUN_00010920(&DAT_00010204,&DAT_000fffca);
  iVar1 = 9;
  do {
    __mac_toolbox(0xa036);
    iVar1 = iVar1 + -1;
  } while (iVar1 != -1);
  return;
}



/* CODE 1 + 0x020a, synthetic address 0x0001020a */

/* WARNING: Removing unreachable block (ram,0x0001024e) */
/* WARNING: Removing unreachable block (ram,0x00010256) */
/* WARNING: Removing unreachable block (ram,0x0001025a) */

void CODE1_020a(void)

{
  __mac_toolbox(0xa9eb);
  __mac_toolbox(0xa9eb);
  FUN_0001027c();
  __mac_toolbox(0xa9eb);
  __mac_toolbox(0xa9eb);
  return;
}



/* CODE 1 + 0x020c, synthetic address 0x0001020c */

/* WARNING: Removing unreachable block (ram,0x0001024e) */
/* WARNING: Removing unreachable block (ram,0x00010256) */
/* WARNING: Removing unreachable block (ram,0x0001025a) */
/* Original CODE 1 resource offset 0x020c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE1_020c(void)

{
  __mac_toolbox(0xa9eb);
  __mac_toolbox(0xa9eb);
  FUN_0001027c();
  __mac_toolbox(0xa9eb);
  __mac_toolbox(0xa9eb);
  return;
}



/* CODE 1 + 0x027c, synthetic address 0x0001027c */

void FUN_0001027c(void)

{
  __mac_toolbox(0xa9eb);
  return;
}



/* CODE 1 + 0x028c, synthetic address 0x0001028c */

undefined8 CODE1_028c(byte *param_1,byte *param_2)

{
  byte bVar1;
  undefined4 in_D0;
  undefined4 in_D1;
  int iVar2;
  
  bVar1 = *param_2;
  if (*param_1 < *param_2) {
    bVar1 = *param_1;
  }
  iVar2 = bVar1 - 1;
  if (bVar1 != 0) {
    do {
      param_1 = param_1 + 1;
      param_2 = param_2 + 1;
      if (*param_1 != *param_2) break;
      iVar2 = iVar2 + -1;
    } while (iVar2 != -1);
  }
  return CONCAT44(in_D0,in_D1);
}



/* CODE 1 + 0x02c2, synthetic address 0x000102c2 */

void CODE1_02c2(undefined2 param_1,undefined2 param_2,int param_3)

{
  long *unaff_A6;
  
  if (param_3 == 0) {
    do {
      unaff_A6 = (long *)*unaff_A6;
    } while (*unaff_A6 != 0x100000);
  }
  else {
    param_3 = param_3 + -1;
    do {
      param_3 = param_3 + -1;
    } while (param_3 != -1);
  }
  if (DAT_000fbc5c != (code *)0x0) {
    (*DAT_000fbc5c)();
  }
                    /* WARNING: Could not recover jumptable at 0x000102ea. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)CONCAT22(param_1,param_2))();
  return;
}



/* CODE 1 + 0x02ec, synthetic address 0x000102ec */

undefined8 CODE1_02ec(void)

{
  undefined4 in_D0;
  undefined4 in_D1;
  
  FUN_00010496();
  return CONCAT44(in_D0,in_D1);
}



/* CODE 1 + 0x0316, synthetic address 0x00010316 */

undefined8 CODE1_0316(void)

{
  undefined4 in_D0;
  undefined4 in_D1;
  
  return CONCAT44(in_D0,in_D1);
}



/* CODE 1 + 0x0356, synthetic address 0x00010356 */

undefined8 CODE1_0356(int param_1,undefined4 *param_2,undefined2 *param_3)

{
  uint uVar1;
  undefined4 in_D0;
  undefined4 in_D1;
  uint uVar2;
  undefined2 *puVar3;
  
  *param_2 = 0;
  param_2[1] = 0;
  param_2[2] = 0;
  param_2[3] = 0;
  param_2[4] = 0;
  param_2[5] = 0;
  param_2[6] = 0;
  param_2[7] = 0;
  uVar1 = param_1 - 1;
  if (uVar1 == 0) {
    *(undefined1 *)((long)param_2 + 0x1f) = *(undefined1 *)param_3;
  }
  else {
    uVar2 = uVar1 >> 1;
    puVar3 = (undefined2 *)((long)param_2 + (long)(int)(0x1f - uVar1));
    do {
      *puVar3 = *param_3;
      uVar2 = uVar2 - 1;
      puVar3 = puVar3 + 1;
      param_3 = param_3 + 1;
    } while (uVar2 != 0xffff);
  }
  return CONCAT44(in_D0,in_D1);
}



/* CODE 1 + 0x03a2, synthetic address 0x000103a2 */

undefined8 CODE1_03a2(void)

{
  undefined4 in_D0;
  undefined4 in_D1;
  
  return CONCAT44(in_D0,in_D1);
}



/* CODE 1 + 0x03e2, synthetic address 0x000103e2 */

void CODE1_03e2(byte *param_1,byte *param_2,int param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  
  if (*param_2 < (byte)param_3) {
    param_3 = CONCAT11((char)((uint)param_3 >> 8),*param_2);
  }
  *param_1 = (byte)param_3;
  while( true ) {
    param_2 = param_2 + 1;
    param_1 = param_1 + 1;
    param_3 = param_3 + -1;
    if (param_3 == -1) break;
    *param_1 = *param_2;
  }
                    /* WARNING: Could not recover jumptable at 0x0001040e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x0414, synthetic address 0x00010414 */

void FUN_00010414(void)

{
  code *pcVar1;
  undefined4 *extraout_A0;
  undefined4 *extraout_A0_00;
  undefined4 *puVar2;
  long *plVar3;
  bool bVar4;
  long local_8;
  undefined1 local_4 [2];
  undefined2 local_2;
  
  local_2 = 0;
  plVar3 = (long *)local_4;
  if (DAT_000fbc60 != (code *)0x0) {
    plVar3 = (long *)local_4;
    if (DAT_000fbc64 != 0) {
      plVar3 = &local_8;
      local_8 = DAT_000fbc64;
    }
    *(int *)((long)plVar3 + -4) = 1;
    *(int *)((long)plVar3 + -2) = 0x42a;
    (*DAT_000fbc60)();
    if (*(int *)plVar3 == 0) {
                    /* WARNING: Could not recover jumptable at 0x00010434. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*pcRam000fbc7c)();
      return;
    }
  }
  bVar4 = false;
  *(undefined4 *)((long)plVar3 + -4) = 0x10440;
  FUN_0001046a();
  puVar2 = extraout_A0;
  if (bVar4) {
    bVar4 = false;
    *(undefined4 *)((long)plVar3 + -4) = 0x1044a;
    FUN_0001046a();
    puVar2 = extraout_A0_00;
    if (bVar4) {
      *(undefined **)((long)plVar3 + -4) = &DAT_0001045c;
      __mac_toolbox(0xabff);
      __mac_toolbox(0xa9f4);
      return;
    }
  }
  pcVar1 = (code *)*puVar2;
  *(undefined4 *)((long)plVar3 + -4) = 0x10450;
  (*pcVar1)();
                    /* WARNING: Subroutine does not return */
  CODE1_007c();
}



/* CODE 1 + 0x0436, synthetic address 0x00010436 */

void CODE1_0436(void)

{
  undefined4 *extraout_A0;
  undefined4 *extraout_A0_00;
  undefined4 *puVar1;
  bool bVar2;
  
  bVar2 = false;
  FUN_0001046a();
  puVar1 = extraout_A0;
  if (bVar2) {
    bVar2 = false;
    FUN_0001046a();
    puVar1 = extraout_A0_00;
    if (bVar2) {
      __mac_toolbox(0xabff);
      __mac_toolbox(0xa9f4);
      return;
    }
  }
  (*(code *)*puVar1)();
                    /* WARNING: Subroutine does not return */
  CODE1_007c();
}



/* CODE 1 + 0x046a, synthetic address 0x0001046a */

undefined4 FUN_0001046a(void)

{
  undefined2 in_D0w;
  
  __mac_toolbox(0xa9a0);
  return CONCAT22(in_D0w,0x4c53);
}



/* CODE 1 + 0x047c, synthetic address 0x0001047c */

void FUN_0001047c(void)

{
  int in_D0w;
  
  DAT_000fbc94 = in_D0w;
  if (in_D0w == 0) {
    return;
  }
  if (DAT_000fbc98 != '\0') {
    FUN_00010414();
    return;
  }
                    /* WARNING: Could not recover jumptable at 0x00010494. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*pcRam000fbc7c)();
  return;
}



/* CODE 1 + 0x0496, synthetic address 0x00010496 */

ulong FUN_00010496(void)

{
  ulong in_D0;
  ulong in_D1;
  long lVar1;
  ulong uVar2;
  ulong uVar3;
  ulong uVar4;
  ulong uVar5;
  
  if ((long)in_D0 < 0) {
    if (-1 < (long)in_D1) {
      lVar1 = FUN_000104c4();
      return -lVar1;
    }
    lVar1 = FUN_000104c4();
    return -lVar1;
  }
  if ((long)in_D1 < 0) {
    uVar2 = FUN_000104c4();
    return uVar2;
  }
  if (in_D0 < in_D1) {
    return in_D0;
  }
  if (0xffff < in_D0) {
    uVar2 = in_D0;
    uVar3 = in_D1;
    if (0xffff < in_D1) {
      do {
        uVar2 = uVar2 >> 1;
        uVar3 = uVar3 >> 1;
      } while (0xffff < uVar3);
      for (uVar2 = uVar2 / (uVar3 & 0xffff) & 0xffff;
          (uVar4 = (in_D1 & 0xffff) * uVar2, uVar3 = (in_D1 >> 0x10) * uVar2,
          uVar5 = uVar3 * 0x10000 | uVar3 >> 0x10, uVar3 = uVar5 + uVar4, CARRY4(uVar5,uVar4) ||
          (lVar1 = uVar3 - in_D0, in_D0 <= uVar3 && lVar1 != 0)); uVar2 = (ulong)((int)uVar2 - 1)) {
      }
      return -lVar1;
    }
    return ((in_D0 >> 0x10) % (in_D1 & 0xffff) << 0x10 | in_D0 & 0xffff) % (in_D1 & 0xffff);
  }
  return in_D0 % (in_D1 & 0xffff);
}



/* CODE 1 + 0x04c4, synthetic address 0x000104c4 */

ulonglong FUN_000104c4(void)

{
  long lVar1;
  ulong in_D0;
  undefined2 uVar2;
  ulong in_D1;
  ulong uVar3;
  ulong uVar4;
  ulong uVar5;
  ulong uVar6;
  
  if (in_D0 < in_D1) {
    return (ulonglong)in_D0;
  }
  uVar2 = (undefined2)(in_D1 >> 0x10);
  if (0xffff < in_D0) {
    uVar5 = in_D0;
    uVar3 = in_D1;
    if (0xffff < in_D1) {
      do {
        uVar5 = uVar5 >> 1;
        uVar3 = uVar3 >> 1;
      } while (0xffff < uVar3);
      for (uVar5 = uVar5 / (uVar3 & 0xffff) & 0xffff;
          (uVar4 = (in_D1 & 0xffff) * uVar5, uVar3 = (in_D1 >> 0x10) * uVar5,
          uVar6 = uVar3 * 0x10000 | uVar3 >> 0x10, uVar3 = uVar6 + uVar4, CARRY4(uVar6,uVar4) ||
          (lVar1 = uVar3 - in_D0, in_D0 <= uVar3 && lVar1 != 0)); uVar5 = (ulong)((int)uVar5 - 1)) {
      }
      return CONCAT44(uVar5,-lVar1);
    }
    uVar5 = (in_D0 >> 0x10) % (in_D1 & 0xffff) << 0x10 | in_D0 & 0xffff;
    return CONCAT44(CONCAT22((int)((in_D0 >> 0x10) / (in_D1 & 0xffff)),
                             (int)(uVar5 / (in_D1 & 0xffff))),
                    CONCAT22(uVar2,(int)(uVar5 % (in_D1 & 0xffff))));
  }
  return CONCAT44(in_D0 / (in_D1 & 0xffff),CONCAT22(uVar2,(int)(in_D0 % (in_D1 & 0xffff)))) &
         0xffffffffffff;
}



/* CODE 1 + 0x052e, synthetic address 0x0001052e */

void CODE1_052e(void)

{
  return;
}



/* CODE 1 + 0x0530, synthetic address 0x00010530 */

void CODE1_0530(void)

{
  code *UNRECOVERED_JUMPTABLE;
  
  __mac_toolbox(0xa11e);
                    /* WARNING: Could not recover jumptable at 0x00010538. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x053a, synthetic address 0x0001053a */

void CODE1_053a(void)

{
  code *UNRECOVERED_JUMPTABLE;
  
  __mac_toolbox(0xa122);
                    /* WARNING: Could not recover jumptable at 0x00010542. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x0544, synthetic address 0x00010544 */

void CODE1_0544(void)

{
  long in_D0;
  code *UNRECOVERED_JUMPTABLE;
  long lStack00000008;
  
  __mac_toolbox(0xa025);
  lStack00000008 = in_D0;
  if (in_D0 < 0) {
    lStack00000008 = 0;
  }
                    /* WARNING: Could not recover jumptable at 0x00010550. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x0552, synthetic address 0x00010552 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void CODE1_0552(undefined4 *param_1)

{
  code *UNRECOVERED_JUMPTABLE;
  
  *param_1 = _DAT_0000020c;
                    /* WARNING: Could not recover jumptable at 0x0001055a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x055c, synthetic address 0x0001055c */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void CODE1_055c(undefined2 *param_1,uint *param_2)

{
  char cVar1;
  uint uVar2;
  code *UNRECOVERED_JUMPTABLE;
  
  uVar2 = *(uint *)(_DAT_000002ae + 8);
  *param_1 = 0;
  if ((char)uVar2 != -1) {
    cVar1 = (char)(uVar2 >> 8) + '\x01';
    uVar2 = CONCAT11((char)uVar2,cVar1);
    *(char *)((long)param_1 + 1) = cVar1;
  }
  *param_2 = uVar2 >> 8;
                    /* WARNING: Could not recover jumptable at 0x0001057e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x0580, synthetic address 0x00010580 */

/* WARNING: Removing unreachable block (ram,0x000105a8) */
/* WARNING: Unknown calling convention */
/* Original CODE 1 resource offset 0x0580 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE1_0580(void)

{
  undefined2 *in_stack_00000004;
  undefined2 local_1e;
  
  __mac_toolbox(0xa060);
  *in_stack_00000004 = local_1e;
  return 0x1a;
}



/* CODE 1 + 0x05c0, synthetic address 0x000105c0 */

/* Original CODE 1 resource offset 0x05c0 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE1_05c0(void)

{
  code *UNRECOVERED_JUMPTABLE;
  
  __mac_toolbox(0xa001);
                    /* WARNING: Could not recover jumptable at 0x000105d8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x05da, synthetic address 0x000105da */

void CODE1_05da(void)

{
  CODE1_05e0();
  return;
}



/* CODE 1 + 0x05de, synthetic address 0x000105de */

/* WARNING: Removing unreachable block (ram,0x00010606) */

void CODE1_05de(undefined2 param_1,undefined2 param_2,undefined4 *param_3)

{
  code *UNRECOVERED_JUMPTABLE;
  undefined4 uStack_e;
  
  __mac_toolbox(0xa003);
  *param_3 = uStack_e;
                    /* WARNING: Could not recover jumptable at 0x00010620. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x05e0, synthetic address 0x000105e0 */

/* Original CODE 1 resource offset 0x05e0 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE1_05e0(undefined2 param_1,undefined2 param_2,undefined4 *param_3)

{
  char in_D1b;
  code *UNRECOVERED_JUMPTABLE;
  undefined4 local_e;
  
  if (in_D1b == '\0') {
    __mac_toolbox(0xa002);
  }
  else {
    __mac_toolbox(0xa003);
  }
  *param_3 = local_e;
                    /* WARNING: Could not recover jumptable at 0x00010620. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x0622, synthetic address 0x00010622 */

/* Original CODE 1 resource offset 0x0622 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE1_0622(void)

{
  code *UNRECOVERED_JUMPTABLE;
  
  __mac_toolbox(0xa013);
                    /* WARNING: Could not recover jumptable at 0x00010640. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x0642, synthetic address 0x00010642 */

/* Original CODE 1 resource offset 0x0642 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE1_0642(void)

{
  code *UNRECOVERED_JUMPTABLE;
  
  __mac_toolbox(0xa008);
  __mac_toolbox(0xa00c);
  __mac_toolbox(0xa00d);
                    /* WARNING: Could not recover jumptable at 0x0001067e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x0680, synthetic address 0x00010680 */

/* Original CODE 1 resource offset 0x0680 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE1_0680(undefined4 *param_1)

{
  code *UNRECOVERED_JUMPTABLE;
  undefined4 local_1a;
  
  __mac_toolbox(0xa011);
  *param_1 = local_1a;
                    /* WARNING: Could not recover jumptable at 0x000106a0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x06a2, synthetic address 0x000106a2 */

/* Original CODE 1 resource offset 0x06a2 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE1_06a2(void)

{
  code *UNRECOVERED_JUMPTABLE;
  
  __mac_toolbox(0xa012);
                    /* WARNING: Could not recover jumptable at 0x000106c0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x06c2, synthetic address 0x000106c2 */

/* WARNING: Removing unreachable block (ram,0x000106d2) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void CODE1_06c2(long *param_1,undefined4 param_2,undefined4 param_3)

{
  byte bVar1;
  long lVar2;
  long *plVar3;
  long extraout_A1;
  long lVar4;
  bool bVar5;
  code *UNRECOVERED_JUMPTABLE;
  
  plVar3 = _DAT_00000ae8;
  if ((long)_DAT_00000ae8 < 0) {
    __mac_toolbox(0xa322);
    goto LAB_000107b0;
  }
  lVar4 = *_DAT_00000ae8;
  if (*(int *)(lVar4 + 0x10) < 1) {
LAB_00010774:
    *(undefined2 *)(lVar4 + 0x32) = 0x3a;
    *(undefined4 *)(lVar4 + 0x24) = param_2;
    *(undefined4 *)(lVar4 + 0x20) = param_3;
    *(undefined2 *)(lVar4 + 0x18) = 0xfffc;
    if (param_1 != _DAT_00000a06) {
      *(long **)(lVar4 + 0x1c) = param_1;
      *(code **)(lVar4 + 0xc) = FUN_000107fa;
      __mac_toolbox(0xa403);
      bVar5 = (int)plVar3 == 0;
      goto LAB_000107ac;
    }
    __mac_toolbox(0xa003);
  }
  else {
    if (_DAT_00000ae8 == _DAT_00000a06) {
      do {
        plVar3 = (long *)(ulong)*(uint *)(lVar4 + 0x10);
      } while (0 < (int)*(uint *)(lVar4 + 0x10));
      goto LAB_00010774;
    }
    *(undefined1 *)(lVar4 + 0x39) = 0xff;
    lVar2 = _DAT_0000027a;
    __mac_toolbox(0xa9e1);
    bVar5 = (int)plVar3 == 0;
    if (bVar5) {
      bVar5 = *(int *)(lVar4 + 0x32) == -0xc;
      __mac_toolbox(0xa024);
      if (bVar5) {
        __mac_toolbox(0xa029);
        lVar4 = *plVar3;
        _DAT_00000ae8 = plVar3;
        *(long *)(_DAT_0000027a + 8) = lVar4;
        *(long *)(lVar2 + 0xc) = lVar4;
        *(byte *)(lVar4 + 0x38) = *(byte *)(*plVar3 + 0x38) | *(byte *)(lVar4 + 0x38);
        __mac_toolbox(0xa023);
        *(undefined2 *)(lVar4 + 0x32) = 0;
        bVar1 = *(byte *)(lVar4 + 0x38);
        *(byte *)(lVar4 + 0x38) = bVar1 & 0xfe;
        if ((bVar1 & 1) != 0) {
          *(undefined2 *)(lVar4 + 0x10) = 0;
          FUN_000107fa();
          lVar4 = extraout_A1;
        }
        *(undefined1 *)(lVar4 + 0x39) = 0;
        __mac_toolbox(0xa02e);
        goto LAB_000107b0;
      }
    }
LAB_000107ac:
    if (bVar5) goto LAB_000107b0;
  }
  FUN_000107b8();
LAB_000107b0:
                    /* WARNING: Could not recover jumptable at 0x000107b6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x07b8, synthetic address 0x000107b8 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_000107b8(void)

{
  if (_DAT_00000ae8 != (long *)(long)_DAT_00000a06) {
    _DAT_0000033c = *(undefined4 *)(*_DAT_00000ae8 + 0x34);
    __mac_toolbox(0xa023);
    _DAT_00000ae8 = _DAT_00000a06;
  }
  return;
}



/* CODE 1 + 0x07d4, synthetic address 0x000107d4 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Original CODE 1 resource offset 0x07d4 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE1_07d4(void)

{
  __mac_toolbox(0xa206);
  _DAT_00000280 = 0;
  FUN_000107b8();
  return;
}



/* CODE 1 + 0x07fa, synthetic address 0x000107fa */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 FUN_000107fa(void)

{
  long lVar1;
  undefined4 in_D0;
  undefined4 in_D1;
  int iVar2;
  
  lVar1 = *_DAT_00000ae8;
  if (*(char *)(lVar1 + 0x39) == '\0') {
    iVar2 = *(int *)(lVar1 + 0x32);
    if (*(code **)(lVar1 + 0x1c) != (code *)0x0) {
      (**(code **)(lVar1 + 0x1c))();
    }
    if (iVar2 == 0x3a) {
      FUN_000107b8();
    }
    else {
      *(undefined4 *)(lVar1 + 0x1c) = *(undefined4 *)(lVar1 + 0x3a);
      *(undefined4 *)(lVar1 + 0x24) = *(undefined4 *)(lVar1 + 0x3e);
      *(undefined4 *)(lVar1 + 0x20) = *(undefined4 *)(lVar1 + 0x42);
      *(undefined2 *)(lVar1 + 0x18) = 0xfffc;
      if (iVar2 == 0x46) {
        iVar2 = 0x3a;
      }
      else {
        __mac_toolbox(0xa02e);
        iVar2 = iVar2 + -0xc;
      }
      lVar1 = *_DAT_00000ae8;
      *(int *)(lVar1 + 0x32) = iVar2;
      *(code **)(lVar1 + 0xc) = FUN_000107fa;
      __mac_toolbox(0xa403);
    }
  }
  else {
    *(undefined1 *)(lVar1 + 0x38) = 0xff;
  }
  return CONCAT44(in_D0,in_D1);
}



/* CODE 1 + 0x087e, synthetic address 0x0001087e */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void CODE1_087e(undefined2 *param_1,undefined2 *param_2)

{
  undefined2 *puVar1;
  long in_D0;
  code *UNRECOVERED_JUMPTABLE;
  
  *param_1 = 0;
  __mac_toolbox(0xa025);
  if (0 < in_D0) {
    puVar1 = (undefined2 *)*_DAT_00000aec;
    *param_2 = *puVar1;
    *param_1 = puVar1[1];
  }
                    /* WARNING: Could not recover jumptable at 0x000108a0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x08a2, synthetic address 0x000108a2 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void CODE1_08a2(long param_1,int param_2)

{
  long in_D0;
  code *UNRECOVERED_JUMPTABLE;
  
  *(undefined4 *)(param_1 + 2) = 0;
  __mac_toolbox(0xa025);
  if ((0 < in_D0) && (param_2 <= *(int *)(*_DAT_00000aec + 2))) {
    while (0 < param_2) {
      __mac_toolbox(0xa02e);
      param_2 = param_2 + -1;
    }
  }
                    /* WARNING: Could not recover jumptable at 0x000108e6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x08e8, synthetic address 0x000108e8 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void CODE1_08e8(int param_1)

{
  long in_D0;
  long lVar1;
  code *UNRECOVERED_JUMPTABLE;
  
  __mac_toolbox(0xa025);
  if ((0 < in_D0) && (lVar1 = *_DAT_00000aec + 4, param_1 <= *(int *)(*_DAT_00000aec + 2))) {
    while( true ) {
      if (param_1 < 1) break;
      if (param_1 + -1 == 0) {
        *(undefined4 *)(lVar1 + 2) = 0;
        break;
      }
      lVar1 = (int)(((byte)(*(char *)(lVar1 + 8) + 2) & 0xfffe) + 8) + lVar1;
      param_1 = param_1 + -1;
    }
  }
                    /* WARNING: Could not recover jumptable at 0x0001091e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x0920, synthetic address 0x00010920 */

void FUN_00010920(void)

{
  __mac_toolbox(0xa063);
  return;
}



/* CODE 1 + 0x0924, synthetic address 0x00010924 */

void CODE1_0924(void)

{
  undefined4 uVar1;
  undefined2 uVar2;
  undefined4 *puVar3;
  
  uVar2 = 2;
  do {
    uVar1 = *(undefined4 *)register0x0000003c;
    *(undefined2 *)((long)register0x0000003c + 2) = uVar2;
    puVar3 = (undefined4 *)((long)register0x0000003c + -2);
    register0x0000003c = (BADSPACEBASE *)((long)register0x0000003c + -2);
    *puVar3 = uVar1;
    __mac_toolbox(0xade9);
    uVar2 = 4;
  } while( true );
}



/* CODE 1 + 0x092e, synthetic address 0x0001092e */

void CODE1_092e(void)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  
  do {
    uVar1 = *(undefined4 *)register0x0000003c;
    *(undefined2 *)((long)register0x0000003c + 2) = 4;
    puVar2 = (undefined4 *)((long)register0x0000003c + -2);
    register0x0000003c = (BADSPACEBASE *)((long)register0x0000003c + -2);
    *puVar2 = uVar1;
    __mac_toolbox(0xade9);
  } while( true );
}



/* CODE 1 + 0x0934, synthetic address 0x00010934 */

void CODE1_0934(void)

{
  undefined4 uVar1;
  undefined2 uVar2;
  undefined4 *puVar3;
  
  uVar2 = 0;
  do {
    uVar1 = *(undefined4 *)register0x0000003c;
    *(undefined2 *)((long)register0x0000003c + 2) = uVar2;
    puVar3 = (undefined4 *)((long)register0x0000003c + -2);
    register0x0000003c = (BADSPACEBASE *)((long)register0x0000003c + -2);
    *puVar3 = uVar1;
    __mac_toolbox(0xade9);
    uVar2 = 4;
  } while( true );
}



/* CODE 1 + 0x093a, synthetic address 0x0001093a */

void CODE1_093a(void)

{
  undefined4 in_D0;
  undefined2 in_stack_00000000;
  undefined4 *in_stack_00000002;
  undefined2 local_2;
  
  _local_2 = (code *)CONCAT22(1,in_stack_00000000);
  __mac_toolbox(0xa9ee);
  *in_stack_00000002 = in_D0;
                    /* WARNING: Could not recover jumptable at 0x0001095e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*_local_2)();
  return;
}



/* CODE 1 + 0x094e, synthetic address 0x0001094e */

void CODE1_094e(void)

{
  uint in_stack_00000000;
  
  __mac_toolbox(0xa9ee);
                    /* WARNING: Could not recover jumptable at 0x0001095e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(ulong)in_stack_00000000)();
  return;
}



/* CODE 1 + 0x0960, synthetic address 0x00010960 */

void CODE1_0960(void)

{
  FUN_0001097a();
  __mac_toolbox(0xa9db);
  return;
}



/* CODE 1 + 0x0968, synthetic address 0x00010968 */

void CODE1_0968(void)

{
  FUN_0001097a();
  __mac_toolbox(0xa9d6);
  return;
}



/* CODE 1 + 0x096e, synthetic address 0x0001096e */

void CODE1_096e(void)

{
  FUN_0001097a();
  __mac_toolbox(0xa9d5);
  return;
}



/* CODE 1 + 0x0974, synthetic address 0x00010974 */

void CODE1_0974(void)

{
  FUN_0001097a();
  __mac_toolbox(0xa9d7);
  return;
}



/* CODE 1 + 0x097a, synthetic address 0x0001097a */

void FUN_0001097a(code *UNRECOVERED_JUMPTABLE,long param_2)

{
  code *UNRECOVERED_JUMPTABLE_00;
  
  if (-1 < *(int *)(param_2 + 0xa4)) {
                    /* WARNING: Could not recover jumptable at 0x0001098a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*UNRECOVERED_JUMPTABLE_00)();
    return;
  }
                    /* WARNING: Could not recover jumptable at 0x00010990. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}



/* CODE 1 + 0x0992, synthetic address 0x00010992 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void CODE1_0992(void)

{
  return;
}



/* CODE 1 + 0x099e, synthetic address 0x0001099e */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void CODE1_099e(void)

{
  undefined1 *puVar1;
  undefined2 uVar2;
  undefined1 *puVar3;
  undefined1 *puVar4;
  undefined1 local_18 [8];
  undefined1 local_10 [4];
  undefined1 local_c [8];
  undefined1 local_4 [4];
  
  puVar1 = local_4;
  __mac_toolbox(0xa9fd);
  puVar3 = local_c;
  if (-1 < (long)puVar1) {
    if (puVar1 < (undefined1 *)0x7d01) {
      puVar1 = local_10;
      __mac_toolbox(0xa9fd);
      puVar3 = local_18;
      puVar4 = local_18;
      if (-1 < (long)puVar1) {
        _DAT_00000ab0 = SUB42(puVar1,0);
        uVar2 = 0;
        goto LAB_000109ee;
      }
    }
    else {
      puVar1 = (undefined1 *)0xfe0b;
      puVar3 = local_c;
    }
  }
  uVar2 = SUB42(puVar1,0);
  _DAT_00000ab0 = 0;
  puVar4 = puVar3;
LAB_000109ee:
  *(undefined2 *)(puVar4 + 4) = uVar2;
  return;
}



/* CODE 1 + 0x09f4, synthetic address 0x000109f4 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void CODE1_09f4(void)

{
  __mac_toolbox(0xa029);
  __mac_toolbox(0xa9fe);
  __mac_toolbox(0xa02a);
  return;
}



/* CODE 1 + 0x0a1a, synthetic address 0x00010a1a */

void CODE1_0a1a(long *param_1,undefined4 param_2)

{
  code *UNRECOVERED_JUMPTABLE;
  
  DAT_00100014 = param_2;
  *(undefined1 **)(*param_1 + 0x2a) = &LAB_00010a30;
                    /* WARNING: Could not recover jumptable at 0x00010a2e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}


