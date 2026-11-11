/* Ghidra 11.3.2 decompiler output. Analysis aid, not reconstructed original source. */
/* Synthetic addresses: CODE n at n*0x10000; A5=0x100000. */
/* Original bytes retained. Pascal stack ABI and Toolbox calls may be unresolved. */


/* CODE 4 + 0x0004, synthetic address 0x00040004 */

/* Original CODE 4 resource offset 0x0004 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_0004(undefined2 param_1)

{
  __mac_toolbox(0xa945);
  DAT_000ff906 = param_1;
  __mac_toolbox(0xa945);
  return;
}



/* CODE 4 + 0x003c, synthetic address 0x0004003c */

void CODE4_003c(void)

{
  DAT_000ff91c = -(DAT_000ff91c + -1);
  if (DAT_000ff91c == '\0') {
    JT_CODE1_07d4();
    __mac_toolbox(0xa947);
  }
  else {
    __mac_toolbox(0xa947);
  }
  return;
}



/* CODE 4 + 0x0090, synthetic address 0x00040090 */

void CODE4_0090(void)

{
  char cVar1;
  
  cVar1 = DAT_000ff91d + -1;
  DAT_000ff91d = -cVar1;
  if (-cVar1 == '\0') {
    __mac_toolbox(0xa947);
  }
  else {
    __mac_toolbox(0xa947);
  }
  return;
}



/* CODE 4 + 0x00e4, synthetic address 0x000400e4 */

/* Original CODE 4 resource offset 0x00e4 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_00e4(void)

{
  byte bVar1;
  undefined1 *puVar2;
  undefined1 local_54 [12];
  undefined1 local_48 [24];
  undefined4 local_18;
  
  __mac_toolbox(0xa917);
  __mac_toolbox(0xa874);
  __mac_toolbox(0xa873);
  __mac_toolbox(0xa922);
  __mac_toolbox(0xa8a3);
  puVar2 = local_48;
  __mac_toolbox(0xa969);
  bVar1 = -(*(char *)*DAT_000fbdcc == '\x01') | -(*(char *)*DAT_000fbdcc == '\0');
  if (bVar1 != 0) {
    __mac_toolbox(0xa904);
    puVar2 = local_54;
    __mac_toolbox(0xa9d3);
  }
  *(undefined4 **)(puVar2 + -4) = DAT_000fbdcc;
  __mac_toolbox(0xa923);
  *(undefined4 *)(puVar2 + -8) = local_18;
  __mac_toolbox(0xa873);
  return bVar1;
}



/* CODE 4 + 0x014c, synthetic address 0x0004014c */

/* Original CODE 4 resource offset 0x014c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_014c(undefined2 param_1)

{
  if (param_1._0_1_ == '\0') {
    __mac_toolbox(0xa93a);
  }
  else {
    __mac_toolbox(0xa939);
  }
  return;
}



/* CODE 4 + 0x0174, synthetic address 0x00040174 */

/* Original CODE 4 resource offset 0x0174 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

char CODE4_0174(undefined4 param_1)

{
  char *pcVar1;
  char cVar2;
  undefined2 *puVar3;
  undefined2 *puVar4;
  undefined2 *puVar5;
  undefined2 *puVar6;
  undefined2 *puVar7;
  undefined1 auStack_34 [2];
  undefined2 local_32;
  undefined4 local_30;
  char *pcStack_2c;
  undefined4 local_28;
  char *pcStack_24;
  undefined4 local_20;
  
  __mac_toolbox(0xa029);
  pcVar1 = (char *)*DAT_000fc02a;
  local_20 = *(undefined4 *)(pcVar1 + 0x204);
  pcStack_24 = pcVar1 + 2;
  __mac_toolbox(0xa990);
  local_28 = *(undefined4 *)(pcVar1 + 0x208);
  pcStack_2c = pcVar1 + 0x102;
  __mac_toolbox(0xa990);
  if (DAT_000fbdb6 == '\0') {
    local_30 = DAT_000fbe02;
    local_32 = 2;
    auStack_34[0] = pcVar1[2] != '\0';
    puVar7 = (undefined2 *)auStack_34;
    CODE4_014c();
  }
  else {
    local_30 = DAT_000fbe02;
    puVar7 = &local_32;
    local_32 = 2;
    __mac_toolbox(0xa93a);
  }
  if (*pcVar1 == '\x02') {
    *(undefined4 *)((long)puVar7 + -4) = param_1;
    *(undefined2 *)((long)puVar7 + -6) = 1;
    *(byte *)((long)puVar7 + -8) = DAT_000fbdb7 & -(pcVar1[2] != '\0');
    *(undefined4 *)((long)puVar7 + -0xc) = 0x401e8;
    cVar2 = CODE4_0a3c();
    if (pcVar1[2] == '\0') {
      *(undefined4 *)((long)puVar7 + -0xc) = *(undefined4 *)(pcVar1 + 0x214);
      puVar4 = (undefined2 *)((long)puVar7 + -0xe);
      puVar7 = (undefined2 *)((long)puVar7 + -0xe);
      *puVar4 = 0xff;
      __mac_toolbox(0xa95d);
    }
    else {
      *(undefined4 *)((long)puVar7 + -0xc) = *(undefined4 *)(pcVar1 + 0x214);
      puVar3 = (undefined2 *)((long)puVar7 + -0xe);
      puVar7 = (undefined2 *)((long)puVar7 + -0xe);
      *puVar3 = 0;
      __mac_toolbox(0xa95d);
    }
  }
  else {
    cVar2 = *pcVar1 + -3;
    if (cVar2 == '\0') {
      *(undefined4 *)((long)puVar7 + -4) = param_1;
      *(undefined2 *)((long)puVar7 + -6) = 1;
      *(byte *)((long)puVar7 + -8) = DAT_000fbdb7 & -(pcVar1[2] != '\0');
      *(undefined4 *)((long)puVar7 + -0xc) = 0x40220;
      cVar2 = CODE4_0a3c();
      if (pcVar1[2] == '\0') {
        *(undefined4 *)((long)puVar7 + -0xc) = *(undefined4 *)(pcVar1 + 0x214);
        *(undefined2 *)((long)puVar7 + -0xe) = 0xff;
        __mac_toolbox(0xa95d);
        *(undefined4 *)((long)puVar7 + -0x12) = *(undefined4 *)(pcVar1 + 0x220);
        *(undefined2 *)((long)puVar7 + -0x14) = 0xff;
        __mac_toolbox(0xa95d);
      }
      else {
        *(undefined4 *)((long)puVar7 + -0xc) = *(undefined4 *)(pcVar1 + 0x214);
        *(undefined2 *)((long)puVar7 + -0xe) = 0;
        __mac_toolbox(0xa95d);
        *(undefined4 *)((long)puVar7 + -0x12) = *(undefined4 *)(pcVar1 + 0x220);
        *(undefined2 *)((long)puVar7 + -0x14) = 0;
        __mac_toolbox(0xa95d);
      }
      if (pcVar1[0x203] == '\0') {
        *(undefined4 *)((long)puVar7 + -0x18) = *(undefined4 *)(pcVar1 + 0x218);
        *(undefined2 *)((long)puVar7 + -0x1a) = 0xff;
        __mac_toolbox(0xa95d);
        *(undefined4 *)((long)puVar7 + -0x1e) = *(undefined4 *)(pcVar1 + 0x21c);
        puVar6 = (undefined2 *)((long)puVar7 + -0x20);
        puVar7 = (undefined2 *)((long)puVar7 + -0x20);
        *puVar6 = 0xff;
        __mac_toolbox(0xa95d);
      }
      else {
        *(undefined4 *)((long)puVar7 + -0x18) = *(undefined4 *)(pcVar1 + 0x218);
        *(undefined2 *)((long)puVar7 + -0x1a) = 0;
        __mac_toolbox(0xa95d);
        *(undefined4 *)((long)puVar7 + -0x1e) = *(undefined4 *)(pcVar1 + 0x21c);
        puVar5 = (undefined2 *)((long)puVar7 + -0x20);
        puVar7 = (undefined2 *)((long)puVar7 + -0x20);
        *puVar5 = 0;
        __mac_toolbox(0xa95d);
      }
    }
  }
  *(long **)((long)puVar7 + -4) = DAT_000fc02a;
  __mac_toolbox(0xa02a);
  return cVar2;
}



/* CODE 4 + 0x0294, synthetic address 0x00040294 */

/* Original CODE 4 resource offset 0x0294 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_0294(void)

{
  if (*(char *)*DAT_000fc030 == '\x03' || *(char *)*DAT_000fc030 == '\x02') {
    __mac_toolbox(0xa029);
  }
  else {
    __mac_toolbox(0xa029);
    __mac_toolbox(0xa02a);
  }
  CODE4_014c();
  CODE4_014c();
  CODE4_014c();
  JT_CODE1_0992();
  CODE4_014c();
  CODE4_014c();
  return;
}



/* CODE 4 + 0x037e, synthetic address 0x0004037e */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x037e (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE4_037e(void)

{
  long lVar1;
  int iVar2;
  long *in_stack_00000004;
  
  __mac_toolbox(0xa029);
  lVar1 = *in_stack_00000004;
  iVar2 = *(int *)(lVar1 + 0x5e);
  if ((0 < *(int *)(lVar1 + 0x3c)) &&
     (*(byte *)(**(long **)(lVar1 + 0x3e) + (long)(*(int *)(lVar1 + 0x3c) + -1)) == DAT_000fbdba)) {
    iVar2 = iVar2 + 1;
  }
  __mac_toolbox(0xa02a);
  return iVar2;
}



/* CODE 4 + 0x03ca, synthetic address 0x000403ca */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x03ca (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE4_03ca(void)

{
  bool bVar1;
  long *in_stack_00000004;
  undefined2 uStack_26;
  
  uStack_26 = CODE4_037e();
  bVar1 = false;
  do {
    uStack_26 = uStack_26 + -1;
    if (uStack_26 < 0) {
      uStack_26 = 0;
      bVar1 = true;
    }
    else if (*(int *)(*in_stack_00000004 + 0x60 + (long)(uStack_26 * 2)) <=
             *(int *)(*in_stack_00000004 + 0x20)) {
      bVar1 = true;
    }
  } while (!bVar1);
  return uStack_26;
}



/* CODE 4 + 0x0418, synthetic address 0x00040418 */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x0418 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE4_0418(void)

{
  long lVar1;
  long *in_stack_00000004;
  undefined2 uStack_a;
  
  lVar1 = *in_stack_00000004;
  uStack_a = CODE4_03ca();
  return *(short *)(lVar1 + 0x60 + (long)(uStack_a * 2));
}



/* CODE 4 + 0x0440, synthetic address 0x00040440 */

/* Original CODE 4 resource offset 0x0440 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

int CODE4_0440(int *param_1,int *param_2,long *param_3)

{
  byte bVar1;
  short sVar2;
  int iVar3;
  int iVar4;
  undefined2 uStack_2e;
  
  uStack_2e = CODE4_037e();
  sVar2 = uStack_2e;
  iVar4 = 0;
  *param_2 = 0;
  *param_1 = 0;
  uStack_2e = CODE4_0418();
  *(short *)(*param_3 + 0x20) = uStack_2e;
  while (*(int *)(*param_3 + 0x60 + (long)(iVar4 * 2)) < *(int *)(*param_3 + 0x20)) {
    iVar4 = iVar4 + 1;
  }
  *param_2 = iVar4;
  if ((byte)(-(1 < sVar2) & -(*(int *)(*param_3 + 0x20) == *(int *)(*param_3 + 0x22))) == 0) {
    for (; iVar3 = *(int *)(*param_3 + 0x60 + (long)(iVar4 * 2)),
        (byte)(-(iVar4 < sVar2) & -(iVar3 < *(int *)(*param_3 + 0x22))) != 0; iVar4 = iVar4 + 1) {
    }
    bVar1 = -(*(int *)(*param_3 + 0x60 + (long)(sVar2 * 2)) < *(int *)(*param_3 + 0x22)) &
            -(iVar4 == sVar2);
    iVar3 = CONCAT11((char)((uint)iVar3 >> 8),bVar1);
    if (bVar1 == 0) {
      *param_1 = iVar4 + -1;
      iVar3 = iVar4 * 2;
      *(undefined2 *)(*param_3 + 0x22) = *(undefined2 *)(*param_3 + 0x60 + (long)iVar3);
    }
    else {
      *param_1 = iVar4;
      *(undefined2 *)(*param_3 + 0x22) = *(undefined2 *)(*param_3 + 0x3c);
    }
  }
  else {
    *param_1 = *param_2;
    if (iVar4 < sVar2 + -1) {
      iVar3 = (iVar4 + 1) * 2;
      *(undefined2 *)(*param_3 + 0x22) = *(undefined2 *)(*param_3 + 0x60 + (long)iVar3);
    }
    else if (*(int *)(*param_3 + 0x3c) == *(int *)(*param_3 + 0x20)) {
      iVar3 = *param_2 + -1;
      *param_1 = iVar3;
    }
    else {
      iVar3 = iVar4 * 2;
      *(undefined2 *)(*param_3 + 0x22) = *(undefined2 *)(*param_3 + 0x60 + (long)iVar3);
    }
  }
  return iVar3;
}



/* CODE 4 + 0x054e, synthetic address 0x0004054e */

/* Original CODE 4 resource offset 0x054e (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_054e(void)

{
  bool bVar1;
  byte bVar2;
  long *plVar3;
  long local_36;
  undefined1 local_32 [4];
  undefined1 auStack_20 [8];
  undefined4 local_18;
  
  bVar1 = true;
  __mac_toolbox(0xa924);
  bVar2 = -(local_36 != 0) & -(DAT_000fc030 != (undefined4 *)0x0);
  if (bVar2 != 0) {
    plVar3 = (long *)local_32;
    __mac_toolbox(0xa972);
    if (*(char *)*DAT_000fc030 == '\0') {
      __mac_toolbox(0xa9da);
      plVar3 = &local_36;
    }
    else {
      bVar2 = -(*(char *)*DAT_000fc030 == '\x03') | -(*(char *)*DAT_000fc030 == '\x02');
      if (bVar2 == 0) {
        bVar1 = false;
        plVar3 = (long *)local_32;
      }
    }
    if (bVar1) {
      *(undefined4 *)((long)plVar3 + -6) = local_18;
      *(undefined1 **)((long)plVar3 + -10) = auStack_20;
      __mac_toolbox(0xa8ad);
      if (*(char *)((long)plVar3 + -10) == '\0') {
        if (DAT_000fbdb8 != '\0') {
          __mac_toolbox(0xa850);
          DAT_000fbdb8 = '\0';
        }
      }
      else {
        bVar2 = DAT_000fbdb8 - 1;
        if (bVar2 != 0) {
          *(undefined4 *)((long)plVar3 + -0xc) = *DAT_000fbdc2;
          __mac_toolbox(0xa851);
          DAT_000fbdb8 = '\x01';
        }
      }
    }
  }
  return bVar2;
}



/* CODE 4 + 0x0622, synthetic address 0x00040622 */

/* Original CODE 4 resource offset 0x0622 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_0622(uint param_1,long *param_2)

{
  long *plVar1;
  int iVar2;
  int iVar3;
  long lVar4;
  int iVar5;
  undefined4 *puVar6;
  int **ppiVar7;
  bool bVar8;
  undefined1 auStack_aa [64];
  long local_6a [4];
  int *piStack_5a;
  int *piStack_56;
  long *local_52;
  long *local_4e;
  int local_1a;
  int local_18 [10];
  
  local_4e = param_2;
  __mac_toolbox(0xa9d9);
  iVar5 = 0;
  local_52 = param_2;
  piStack_56 = local_18;
  piStack_5a = &local_1a;
  ppiVar7 = &piStack_5a;
  CODE4_0440();
  plVar1 = *(long **)(*param_2 + 0x3e);
  iVar2 = *(int *)(*param_2 + 0x20);
  iVar3 = *(int *)(*param_2 + 0x22);
  do {
    if (local_1a < local_18[0]) break;
    if (*(byte *)(*plVar1 + (long)*(int *)(*param_2 + 0x60 + (long)(local_18[0] * 2))) == param_1) {
      lVar4 = (long)*(int *)(*param_2 + 0x60 + (long)(local_18[0] * 2));
      *(long *)((long)ppiVar7 + -4) = lVar4;
      *(long *)((long)ppiVar7 + -8) = lVar4 + 1;
      *(long **)((long)ppiVar7 + -0xc) = param_2;
      __mac_toolbox(0xa9d1);
      puVar6 = (undefined4 *)((long)ppiVar7 + -0x10);
      ppiVar7 = (int **)((long)ppiVar7 + -0x10);
      *puVar6 = param_2;
      __mac_toolbox(0xa9d7);
      iVar5 = iVar5 + 1;
    }
    bVar8 = SCARRY2(local_18[0],1);
    local_18[0] = local_18[0] + 1;
  } while (!bVar8);
  *(long *)((long)ppiVar7 + -4) = (long)iVar2;
  *(long *)((long)ppiVar7 + -8) = (long)iVar3 - (long)iVar5;
  *(long **)((long)ppiVar7 + -0xc) = param_2;
  __mac_toolbox(0xa9d1);
  *(long **)((long)ppiVar7 + -0x10) = param_2;
  __mac_toolbox(0xa9d8);
  *(undefined1 *)(*DAT_000fc030 + 10) = 1;
  *(undefined1 *)(*DAT_000fc030 + 0x11a) = 0;
  *(undefined4 *)((long)ppiVar7 + -0x14) = DAT_000fbdfa;
  *(undefined2 *)((long)ppiVar7 + -0x16) = 5;
  *(bool *)((long)ppiVar7 + -0x18) = *(char *)(*DAT_000fc030 + 0x14) != '\0';
  *(undefined4 *)((long)ppiVar7 + -0x1c) = 0x406ec;
  CODE4_014c();
  *(undefined4 *)((long)ppiVar7 + -0x1c) = DAT_000fbdfa;
  *(undefined2 *)((long)ppiVar7 + -0x1e) = 7;
  *(bool *)((long)ppiVar7 + -0x20) = *(char *)(*DAT_000fc030 + 0x14) != '\0';
  *(undefined4 *)((long)ppiVar7 + -0x24) = 0x40708;
  CODE4_014c();
  return;
}



/* CODE 4 + 0x0714, synthetic address 0x00040714 */

/* WARNING: Removing unreachable block (ram,0x000407fe) */
/* Original CODE 4 resource offset 0x0714 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_0714(undefined1 param_1,long *param_2)

{
  int iVar1;
  int iVar2;
  long lVar3;
  int iVar4;
  int **ppiVar5;
  undefined1 *puVar6;
  bool bVar7;
  int *piStack_4e;
  int *piStack_4a;
  long *local_46;
  long *local_42;
  undefined1 local_27 [13];
  int local_1a;
  int local_18 [10];
  
  local_42 = param_2;
  __mac_toolbox(0xa9d9);
  local_27[0] = param_1;
  local_46 = param_2;
  piStack_4a = local_18;
  piStack_4e = &local_1a;
  CODE4_0440();
  iVar1 = *(int *)(*param_2 + 0x20);
  iVar2 = *(int *)(*param_2 + 0x22);
  ppiVar5 = &piStack_4e;
  iVar4 = local_18[0];
  do {
    puVar6 = (undefined1 *)ppiVar5;
    if (local_1a < iVar4) break;
    lVar3 = (long)*(int *)(*param_2 + 0x60 + (long)(iVar4 * 2));
    *(long *)((long)ppiVar5 + -4) = lVar3;
    *(long *)((long)ppiVar5 + -8) = lVar3;
    *(long **)((long)ppiVar5 + -0xc) = param_2;
    __mac_toolbox(0xa9d1);
    *(undefined1 **)((long)ppiVar5 + -0x10) = local_27;
    *(undefined4 *)((long)ppiVar5 + -0x14) = 1;
    puVar6 = (undefined1 *)((long)ppiVar5 + -0x18);
    *(long **)((long)ppiVar5 + -0x18) = param_2;
    __mac_toolbox(0xa9de);
    bVar7 = SCARRY2(iVar4,1);
    iVar4 = iVar4 + 1;
    ppiVar5 = (int **)((long)ppiVar5 + -0x18);
  } while (!bVar7);
  *(long *)(puVar6 + -4) = (long)iVar1;
  *(long *)(puVar6 + -8) = (long)iVar2 + (long)((local_1a - local_18[0]) + 1);
  *(long **)(puVar6 + -0xc) = param_2;
  __mac_toolbox(0xa9d1);
  *(undefined1 *)(*DAT_000fc030 + 10) = 1;
  *(undefined1 *)(*DAT_000fc030 + 0x11a) = 0;
  *(undefined4 *)(puVar6 + -0x10) = DAT_000fbdfa;
  *(undefined2 *)(puVar6 + -0x12) = 5;
  puVar6[-0x14] = *(char *)(*DAT_000fc030 + 0x14) != '\0';
  *(undefined4 *)(puVar6 + -0x18) = 0x407e0;
  CODE4_014c();
  *(undefined4 *)(puVar6 + -0x18) = DAT_000fbdfa;
  *(undefined2 *)(puVar6 + -0x1a) = 7;
  puVar6[-0x1c] = *(char *)(*DAT_000fc030 + 0x14) != '\0';
  *(undefined4 *)(puVar6 + -0x20) = 0x407fc;
  CODE4_014c();
  *(long **)(puVar6 + -0x20) = param_2;
  __mac_toolbox(0xa9d8);
  return;
}



/* CODE 4 + 0x0814, synthetic address 0x00040814 */

/* Original CODE 4 resource offset 0x0814 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_0814(long *param_1)

{
  int iVar1;
  int iVar2;
  bool bVar3;
  short sVar4;
  long lVar5;
  long local_1c [6];
  
  __mac_toolbox(0xa9d9);
  __mac_toolbox(0xa9d7);
  JT_CODE1_0170(4,local_1c,param_1,param_1);
  lVar5 = *param_1;
  sVar4 = CODE4_0418();
  iVar1 = 4 - (*(int *)(lVar5 + 0x20) - sVar4) % 4;
  iVar2 = 1;
  do {
    if (iVar1 < iVar2) break;
    *(undefined1 *)(local_1c[0] + -1 + (long)iVar2) = 0x20;
    bVar3 = SCARRY2(iVar2,1);
    iVar2 = iVar2 + 1;
  } while (!bVar3);
  __mac_toolbox(0xa9de);
  JT_CODE1_004c(4,local_1c,(int)((ulong)param_1 >> 0x10),(int)param_1,iVar1 >> 0xf,iVar1,local_1c[0]
               );
  __mac_toolbox(0xa9d8);
  return;
}



/* CODE 4 + 0x089c, synthetic address 0x0004089c */

/* Original CODE 4 resource offset 0x089c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_089c(long *param_1)

{
  long lVar1;
  short sStack_34;
  
  if (*(int *)(*param_1 + 0x20) != 0) {
    __mac_toolbox(0xa9d9);
    __mac_toolbox(0xa9d7);
    lVar1 = *param_1;
    sStack_34 = CODE4_0418();
    if (*(int *)(lVar1 + 0x20) == sStack_34) {
      *(int *)(*param_1 + 0x20) = *(int *)(*param_1 + 0x20) + -1;
      CODE4_0418();
      *(int *)(*param_1 + 0x20) = *(int *)(*param_1 + 0x20) + 1;
    }
    __mac_toolbox(0xa9d1);
    __mac_toolbox(0xa9d7);
    __mac_toolbox(0xa9d8);
  }
  return;
}



/* CODE 4 + 0x0950, synthetic address 0x00040950 */

/* Original CODE 4 resource offset 0x0950 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

ulong CODE4_0950(long *param_1)

{
  byte bVar1;
  ulong uVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  int iVar6;
  int iVar7;
  undefined2 uVar8;
  short sVar9;
  long *plVar10;
  undefined2 uVar11;
  
  __mac_toolbox(0xa9dc);
  uVar8 = SUB42(param_1,0);
  plVar10 = param_1;
  uVar11 = DAT_000fbdba;
  sVar9 = CODE4_03ca();
  iVar3 = 0;
  for (iVar4 = *(int *)(*param_1 + 0x60 + (long)((sVar9 + -1) * 2));
      bVar1 = -(iVar4 < *(int *)(*param_1 + 0x60 + (long)(sVar9 * 2))) &
              -(*(char *)(**(long **)(*param_1 + 0x3e) + (long)iVar4) == ' '), uVar2 = (ulong)bVar1,
      bVar1 != 0; iVar4 = iVar4 + 1) {
    iVar3 = iVar3 + 1;
  }
  if (0 < iVar3) {
    iVar6 = iVar3 >> 0xf;
    iVar7 = iVar3;
    JT_CODE1_0530(iVar6,iVar3,uVar8,sVar9,plVar10,uVar11);
    iVar4 = 0;
    do {
      if (iVar3 + -1 < iVar4) break;
      *(undefined1 *)(CONCAT22(iVar6,iVar7) + (long)iVar4) = 0x20;
      bVar5 = SCARRY2(iVar4,1);
      iVar4 = iVar4 + 1;
    } while (!bVar5);
    uVar2 = (ulong)iVar3;
    __mac_toolbox(0xa9de);
    __mac_toolbox(0xa01f);
  }
  return uVar2;
}



/* CODE 4 + 0x09f0, synthetic address 0x000409f0 */

/* Original CODE 4 resource offset 0x09f0 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_09f0(void)

{
  __mac_toolbox(0xa898);
  __mac_toolbox(0xa89b);
  __mac_toolbox(0xa98d);
  __mac_toolbox(0xa893);
  __mac_toolbox(0xa891);
  __mac_toolbox(0xa899);
  return;
}



/* CODE 4 + 0x0a3c, synthetic address 0x00040a3c */

/* Original CODE 4 resource offset 0x0a3c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

char CODE4_0a3c(undefined2 param_1)

{
  undefined1 *puVar1;
  undefined1 auStack_6e [4];
  undefined1 local_6a [50];
  undefined4 local_38;
  undefined1 auStack_34 [24];
  undefined1 auStack_1c [24];
  
  __mac_toolbox(0xa874);
  __mac_toolbox(0xa873);
  __mac_toolbox(0xa898);
  __mac_toolbox(0xa98d);
  __mac_toolbox(0xa8a9);
  puVar1 = local_6a;
  __mac_toolbox(0xa89b);
  if ((char)(param_1._0_1_ + -1) != '\0') {
    puVar1 = auStack_6e;
    __mac_toolbox(0xa89d);
  }
  *(undefined1 **)(puVar1 + -4) = auStack_1c;
  *(undefined2 *)(puVar1 + -6) = 0x10;
  *(undefined2 *)(puVar1 + -8) = 0x10;
  __mac_toolbox(0xa8b0);
  *(undefined1 **)(puVar1 + -0xc) = auStack_34;
  __mac_toolbox(0xa899);
  *(undefined4 *)(puVar1 + -0x10) = local_38;
  __mac_toolbox(0xa873);
  return param_1._0_1_ + -1;
}



/* CODE 4 + 0x0ab0, synthetic address 0x00040ab0 */

/* Original CODE 4 resource offset 0x0ab0 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_0ab0(void)

{
  CODE4_0a3c();
  return;
}



/* CODE 4 + 0x0acc, synthetic address 0x00040acc */

/* Original CODE 4 resource offset 0x0acc (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_0acc(void)

{
  CODE4_0a3c();
  return;
}



/* CODE 4 + 0x0ae6, synthetic address 0x00040ae6 */

/* Original CODE 4 resource offset 0x0ae6 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_0ae6(undefined4 *param_1)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 local_11a;
  undefined4 auStack_114 [68];
  
  iVar1 = 0x3f;
  puVar2 = auStack_114;
  do {
    *puVar2 = *param_1;
    iVar1 = iVar1 + -1;
    param_1 = param_1 + 1;
    puVar2 = puVar2 + 1;
  } while (iVar1 != -1);
  __mac_toolbox(0xa850);
  puVar2 = &local_11a;
  while( true ) {
    *(undefined2 *)((long)puVar2 + -4) = 0x40;
    *(undefined2 **)((long)puVar2 + -8) = &DAT_000fbdca;
    __mac_toolbox(0xa970);
    if (*(char *)((long)puVar2 + -8) == '\0') break;
    *(undefined4 *)((long)puVar2 + -10) = 0x40b02;
    CODE4_00e4();
    puVar2 = (undefined4 *)((long)puVar2 + -6);
  }
  *(undefined4 **)((long)puVar2 + -10) = &local_11a;
  __mac_toolbox(0xa874);
  *(undefined4 **)((long)puVar2 + -0xe) = auStack_114;
  *(undefined **)((long)puVar2 + -0x12) = &DAT_00040b48;
  *(undefined **)((long)puVar2 + -0x16) = &DAT_00040b46;
  *(undefined **)((long)puVar2 + -0x1a) = &DAT_00040b44;
  __mac_toolbox(0xa98b);
  *(undefined2 *)((long)puVar2 + -0x1e) = 0x83;
  *(undefined4 *)((long)puVar2 + -0x22) = 0;
  __mac_toolbox(0xa985);
  *(undefined4 *)((long)puVar2 + -0x24) = local_11a;
  __mac_toolbox(0xa873);
  return;
}



/* CODE 4 + 0x0b4a, synthetic address 0x00040b4a */

/* Original CODE 4 resource offset 0x0b4a (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

ulong CODE4_0b4a(undefined4 *param_1)

{
  int iVar2;
  ulong uVar1;
  undefined4 *puVar3;
  undefined4 auStack_114 [68];
  
  iVar2 = 0x3f;
  puVar3 = auStack_114;
  do {
    *puVar3 = *param_1;
    iVar2 = iVar2 + -1;
    param_1 = param_1 + 1;
    puVar3 = puVar3 + 1;
  } while (iVar2 != -1);
  uVar1 = (ulong)CONCAT11(0xff,DAT_000ff9da + -1);
  if ((char)(DAT_000ff9da + -1) != '\0') {
    __mac_toolbox(0xa850);
    puVar3 = auStack_114;
    while( true ) {
      *(undefined2 *)((long)puVar3 + -4) = 0x40;
      *(undefined2 **)((long)puVar3 + -8) = &DAT_000fbdca;
      __mac_toolbox(0xa970);
      if (*(char *)((long)puVar3 + -8) == '\0') break;
      *(undefined4 *)((long)puVar3 + -10) = 0x40b6e;
      CODE4_00e4();
      puVar3 = (undefined4 *)((long)puVar3 + -6);
    }
    *(undefined4 **)((long)puVar3 + -10) = &DAT_000ff928;
    __mac_toolbox(0xa874);
    *(undefined4 **)((long)puVar3 + -0xe) = auStack_114;
    *(undefined **)((long)puVar3 + -0x12) = &DAT_00040bc6;
    *(undefined **)((long)puVar3 + -0x16) = &DAT_00040bc4;
    *(undefined **)((long)puVar3 + -0x1a) = &DAT_00040bc2;
    __mac_toolbox(0xa98b);
    *(undefined2 *)((long)puVar3 + -0x20) = 0x86;
    *(undefined **)((long)puVar3 + -0x24) = &DAT_000ff930;
    uVar1 = 0xffffffff;
    *(undefined4 *)((long)puVar3 + -0x28) = 0xffffffff;
    __mac_toolbox(0xa97c);
    DAT_000ff92c = *(undefined4 *)((long)puVar3 + -0x28);
    *(undefined4 *)((long)puVar3 + -0x28) = DAT_000ff92c;
    __mac_toolbox(0xa873);
    *(undefined4 *)((long)puVar3 + -0x2c) = DAT_000ff92c;
    __mac_toolbox(0xa981);
    DAT_000ff9da = '\x01';
  }
  return uVar1;
}



/* CODE 4 + 0x0bc8, synthetic address 0x00040bc8 */

void CODE4_0bc8(void)

{
  if (DAT_000ff9da != '\0') {
    __mac_toolbox(0xa982);
    __mac_toolbox(0xa873);
    DAT_000ff9da = '\0';
  }
  return;
}



/* CODE 4 + 0x0be0, synthetic address 0x00040be0 */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x0be0 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_0be0(void)

{
  uint uVar1;
  undefined2 *in_stack_00000004;
  int *in_stack_00000008;
  byte bVar2;
  
  if (*in_stack_00000008 == 5 || *in_stack_00000008 == 3) {
    uVar1 = (uint)*(undefined4 *)(in_stack_00000008 + 1) & 0xff;
    if ((byte)(-(uVar1 < 0x3a) & -(0x2f < uVar1)) == 0) {
      if (uVar1 == DAT_000fbdc0 || uVar1 == DAT_000fbdba) {
        bVar2 = 1;
        *in_stack_00000004 = 1;
      }
      else if (uVar1 == DAT_000fbdbc) {
        bVar2 = 0;
      }
      else {
        bVar2 = 1;
        *in_stack_00000004 = 0;
      }
    }
    else {
      bVar2 = 0;
    }
  }
  else {
    bVar2 = 0;
  }
  return bVar2;
}



/* CODE 4 + 0x0c64, synthetic address 0x00040c64 */

/* Original CODE 4 resource offset 0x0c64 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_0c64(long param_1)

{
  if (*(int *)(param_1 + -0x31e) < 2) {
    CODE4_0acc(1,*(undefined4 *)(param_1 + -0x24));
    __mac_toolbox(0xa95d);
  }
  else {
    CODE4_0ab0(1,*(undefined4 *)(param_1 + -0x24));
    __mac_toolbox(0xa95d);
  }
  return;
}



/* CODE 4 + 0x0caa, synthetic address 0x00040caa */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x0caa (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE4_0caa(void)

{
  bool bVar1;
  long lVar2;
  long lVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined1 *puVar7;
  undefined4 *puVar8;
  undefined1 *puVar9;
  undefined1 *puVar10;
  undefined1 *puVar11;
  undefined1 *puVar12;
  int *in_stack_00000004;
  short in_stack_00000008;
  int aiStack_8020 [15983];
  int local_322;
  undefined1 auStack_31c [256];
  undefined1 auStack_21c [260];
  undefined1 auStack_118 [8];
  long local_110 [13];
  undefined4 local_dc;
  undefined1 auStack_d8 [6];
  undefined1 auStack_d2 [170];
  undefined4 local_28;
  undefined4 local_24;
  int local_20 [14];
  
  bVar1 = false;
  __mac_toolbox(0xa850);
  puVar10 = &stack0xfffffcbe;
  while( true ) {
    lVar2 = local_110[0];
    *(undefined2 *)(puVar10 + -4) = 0x40;
    *(undefined2 **)(puVar10 + -8) = &DAT_000fbdca;
    __mac_toolbox(0xa970);
    if (puVar10[-8] == '\0') break;
    *(undefined4 *)(puVar10 + -10) = 0x40cc0;
    CODE4_00e4();
    puVar10 = puVar10 + -6;
  }
  *(undefined4 **)(puVar10 + -10) = &local_24;
  __mac_toolbox(0xa874);
  *(undefined2 *)(puVar10 + -0x10) = 0x88;
  *(undefined1 **)(puVar10 + -0x14) = auStack_d2;
  *(undefined4 *)(puVar10 + -0x18) = 0xffffffff;
  __mac_toolbox(0xa97c);
  local_28 = *(undefined4 *)(puVar10 + -0x18);
  *(undefined4 *)(puVar10 + -0x18) = *(undefined4 *)(puVar10 + -0x18);
  *(undefined2 *)(puVar10 + -0x1a) = 1;
  *(undefined1 **)(puVar10 + -0x1e) = auStack_d8;
  *(long **)(puVar10 + -0x22) = local_110;
  puVar7 = puVar10 + -0x26;
  *(undefined1 **)(puVar10 + -0x26) = auStack_118;
  __mac_toolbox(0xa98d);
  iVar4 = 0xd;
  iVar5 = 1;
  iVar6 = 1;
  do {
    if (*(char *)((long)(iVar6 * 0xa6 + -0x406a) + 0x100000) == '\0') {
      (&DAT_000fc37b)[iVar6] = 0;
      if (iVar6 == DAT_000fbdb2) {
        iVar4 = 0xd;
      }
    }
    else {
      *(undefined4 *)(puVar7 + -4) = local_28;
      *(int *)(puVar7 + -6) = iVar5 + 2;
      *(undefined1 **)(puVar7 + -10) = auStack_d8;
      *(long **)(puVar7 + -0xe) = local_110;
      *(undefined1 **)(puVar7 + -0x12) = auStack_118;
      __mac_toolbox(0xa98d);
      *(long *)(&stack0xfffffffc + (iVar5 * 4 + -0x108)) = local_110[0];
      *(long *)(puVar7 + -0x16) = (long)(iVar6 * 0xa6 + -0x4068) + 0x100000;
      *(undefined1 **)(puVar7 + -0x1a) = auStack_31c;
      __mac_toolbox(0xa919);
      *(undefined4 *)(puVar7 + -0x1e) = *(undefined4 *)(&stack0xfffffffc + (iVar5 * 4 + -0x108));
      *(undefined1 **)(puVar7 + -0x22) = auStack_31c;
      __mac_toolbox(0xa95f);
      if ((&DAT_000fc37b)[iVar6] == '\0') {
        *(undefined4 *)(puVar7 + -0x26) = *(undefined4 *)(&stack0xfffffffc + (iVar5 * 4 + -0x108));
        *(undefined2 *)(puVar7 + -0x28) = 0;
        __mac_toolbox(0xa963);
      }
      else {
        *(undefined4 *)(puVar7 + -0x26) = *(undefined4 *)(&stack0xfffffffc + (iVar5 * 4 + -0x108));
        *(undefined2 *)(puVar7 + -0x28) = 1;
        __mac_toolbox(0xa963);
      }
      puVar7 = puVar7 + -0x28;
      *(int *)((long)local_20 + (long)(iVar5 * 2)) = iVar6;
      if (iVar6 == *in_stack_00000004) {
        iVar4 = iVar5 + 7;
      }
      iVar5 = iVar5 + 1;
    }
    iVar6 = iVar6 + 1;
  } while (iVar6 < 6);
  local_322 = iVar5 + -1;
  iVar6 = 1;
  puVar10 = puVar7;
  do {
    *(undefined4 *)(puVar10 + -4) = local_28;
    *(int *)(puVar10 + -6) = iVar6 + 7;
    *(undefined1 **)(puVar10 + -10) = auStack_d8;
    *(long **)(puVar10 + -0xe) = local_110;
    puVar12 = puVar10 + -0x12;
    *(undefined1 **)(puVar10 + -0x12) = auStack_118;
    __mac_toolbox(0xa98d);
    *(long *)(&stack0xfffffffc + ((iVar6 + 5) * 4 + -0x108)) = local_110[0];
    if (local_322 < iVar6) {
      puVar12 = puVar10 + -0x12;
      if (iVar6 != 6) {
        puVar12 = puVar10 + -0x16;
        *(undefined4 *)(puVar10 + -0x16) =
             *(undefined4 *)(&stack0xfffffffc + ((iVar6 + 5) * 4 + -0x108));
        __mac_toolbox(0xa958);
      }
    }
    else if (*(char *)((long)(*(int *)((long)local_20 + (long)(iVar6 * 2)) + -0x3c85) + 0x100000) !=
             '\x01') {
      puVar12 = puVar10 + -0x16;
      *(undefined4 *)(puVar10 + -0x16) =
           *(undefined4 *)(&stack0xfffffffc + ((iVar6 + 5) * 4 + -0x108));
      __mac_toolbox(0xa958);
    }
    iVar6 = iVar6 + 1;
    puVar10 = puVar12;
  } while (iVar6 < 7);
  *(undefined4 *)(puVar12 + -4) = *(undefined4 *)(&stack0xfffffffc + ((iVar4 + -2) * 4 + -0x108));
  puVar9 = puVar12 + -6;
  *(undefined2 *)(puVar12 + -6) = 1;
  __mac_toolbox(0xa963);
  for (; iVar5 < 6; iVar5 = iVar5 + 1) {
    *(undefined4 *)(puVar9 + -4) = local_28;
    *(int *)(puVar9 + -6) = iVar5 + 2;
    *(undefined1 **)(puVar9 + -10) = auStack_d8;
    *(long **)(puVar9 + -0xe) = local_110;
    *(undefined1 **)(puVar9 + -0x12) = auStack_118;
    __mac_toolbox(0xa98d);
    *(long *)(&stack0xfffffffc + (iVar5 * 4 + -0x108)) = local_110[0];
    puVar8 = (undefined4 *)(puVar9 + -0x16);
    puVar9 = puVar9 + -0x16;
    *puVar8 = *(undefined4 *)(&stack0xfffffffc + (iVar5 * 4 + -0x108));
    __mac_toolbox(0xa958);
  }
  *(undefined4 *)(puVar9 + -4) = local_28;
  *(undefined2 *)(puVar9 + -6) = 0xf;
  *(undefined1 **)(puVar9 + -10) = auStack_d8;
  *(long **)(puVar9 + -0xe) = local_110;
  *(undefined1 **)(puVar9 + -0x12) = auStack_118;
  __mac_toolbox(0xa98d);
  *(undefined4 *)(puVar9 + -0x16) = local_28;
  __mac_toolbox(0xa873);
  *(undefined4 *)(puVar9 + -0x1a) = local_28;
  __mac_toolbox(0xa915);
  *(undefined4 *)(puVar9 + -0x1e) = local_28;
  *(undefined2 *)(puVar9 + -0x20) = 0xf;
  *(undefined2 *)(puVar9 + -0x22) = 0;
  *(undefined2 *)(puVar9 + -0x24) = 0x7fff;
  __mac_toolbox(0xa97e);
  *(undefined4 *)(puVar9 + -0x28) = local_28;
  *(undefined2 *)(puVar9 + -0x2a) = 1;
  *(undefined4 *)(puVar9 + -0x2e) = 0x40ee6;
  CODE4_0ab0();
  *(undefined4 *)(puVar9 + -0x2e) = local_28;
  *(undefined2 *)(puVar9 + -0x30) = 0x10;
  *(undefined4 *)(puVar9 + -0x34) = 0x40ef2;
  CODE4_09f0();
  puVar10 = puVar9 + -0x30;
  do {
    *(undefined1 **)(puVar10 + -4) = &JT_CODE4_0be0;
    *(int **)(puVar10 + -8) = local_20;
    __mac_toolbox(0xa991);
    puVar12 = puVar10 + -8;
    switch(local_20[0]) {
    case 1:
      if (local_322 < 2) {
        puVar12 = puVar10 + -10;
        *(undefined2 *)(puVar10 + -10) = 5;
        __mac_toolbox(0xa9c8);
      }
      else {
        *(long *)(puVar10 + -0xc) = lVar2;
        *(undefined2 *)(puVar10 + -0xe) = 1;
        __mac_toolbox(0xa95d);
        *(long *)(puVar10 + -0x12) = local_110[0];
        *(undefined1 **)(puVar10 + -0x16) = auStack_21c;
        __mac_toolbox(0xa990);
        *(undefined1 **)(puVar10 + -0x1a) = auStack_21c;
        puVar12 = puVar10 + -0x1e;
        *(undefined4 **)(puVar10 + -0x1e) = &local_dc;
        *(undefined4 *)(puVar10 + -0x22) = 0x40f34;
        JT_CODE1_093a();
        if (local_dc < 0) {
          local_dc = -local_dc;
        }
        lVar3 = local_dc;
        if (local_dc < 0x3e9) {
          bVar1 = true;
          in_stack_00000008 = local_dc._2_2_;
          local_dc = lVar3;
        }
        else {
          *(undefined **)(puVar10 + -0x22) = &DAT_000410de;
          *(undefined4 *)(puVar10 + -0x26) = 0x40f52;
          CODE4_0ae6();
          *(undefined4 *)(puVar10 + -0x26) = local_28;
          *(undefined2 *)(puVar10 + -0x28) = 0xf;
          *(undefined2 *)(puVar10 + -0x2a) = 0;
          puVar12 = puVar10 + -0x2c;
          *(undefined2 *)(puVar10 + -0x2c) = 0x7fff;
          __mac_toolbox(0xa97e);
        }
      }
      break;
    case 2:
      in_stack_00000008 = 0;
      bVar1 = true;
      puVar12 = puVar10 + -8;
      break;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      if (*(char *)((long)(*(int *)((long)local_20 + (long)((local_20[0] + -2) * 2)) + -0x3c85) +
                   0x100000) == '\0') {
        local_322 = local_322 + 1;
        *(undefined4 *)(puVar10 + -0xc) =
             *(undefined4 *)(&stack0xfffffffc + ((local_20[0] + -2) * 4 + -0x108));
        *(undefined2 *)(puVar10 + -0xe) = 1;
        __mac_toolbox(0xa963);
        *(undefined1 *)
         ((long)(*(int *)((long)local_20 + (long)((local_20[0] + -2) * 2)) + -0x3c85) + 0x100000) =
             1;
        puVar11 = puVar10 + -0x12;
        *(undefined4 *)(puVar10 + -0x12) =
             *(undefined4 *)(&stack0xfffffffc + ((local_20[0] + 3) * 4 + -0x108));
        __mac_toolbox(0xa957);
      }
      else {
        local_322 = local_322 + -1;
        *(undefined4 *)(puVar10 + -0xc) =
             *(undefined4 *)(&stack0xfffffffc + ((local_20[0] + -2) * 4 + -0x108));
        *(undefined2 *)(puVar10 + -0xe) = 0;
        __mac_toolbox(0xa963);
        *(undefined1 *)
         ((long)(*(int *)((long)local_20 + (long)((local_20[0] + -2) * 2)) + -0x3c85) + 0x100000) =
             0;
        puVar11 = puVar10 + -0x12;
        *(undefined4 *)(puVar10 + -0x12) =
             *(undefined4 *)(&stack0xfffffffc + ((local_20[0] + 3) * 4 + -0x108));
        __mac_toolbox(0xa958);
        if (iVar4 == local_20[0] + 5) {
          *(undefined4 *)(puVar10 + -0x16) =
               *(undefined4 *)(&stack0xfffffffc + ((iVar4 + -2) * 4 + -0x108));
          *(undefined2 *)(puVar10 + -0x18) = 0;
          __mac_toolbox(0xa963);
          *(long *)(puVar10 + -0x1c) = local_110[0xc];
          puVar11 = puVar10 + -0x1e;
          *(undefined2 *)(puVar10 + -0x1e) = 1;
          __mac_toolbox(0xa963);
          iVar4 = 0xd;
        }
      }
      *(undefined1 **)(puVar11 + -4) = &stack0xfffffffc;
      *(undefined4 *)(puVar11 + -8) = 0x41052;
      CODE4_0c64();
      puVar12 = puVar11 + -4;
      break;
    case 8:
    case 9:
    case 10:
    case 0xb:
    case 0xc:
    case 0xd:
      *(undefined4 *)(puVar10 + -0xc) =
           *(undefined4 *)(&stack0xfffffffc + ((iVar4 + -2) * 4 + -0x108));
      *(undefined2 *)(puVar10 + -0xe) = 0;
      __mac_toolbox(0xa963);
      *(undefined4 *)(puVar10 + -0x12) =
           *(undefined4 *)(&stack0xfffffffc + ((local_20[0] + -2) * 4 + -0x108));
      *(undefined2 *)(puVar10 + -0x14) = 1;
      __mac_toolbox(0xa963);
      puVar12 = puVar10 + -0x14;
      iVar4 = local_20[0];
    }
    puVar10 = puVar12;
  } while (!bVar1);
  if (iVar4 == 0xd) {
    *in_stack_00000004 = 0;
  }
  else {
    *in_stack_00000004 = *(int *)((long)local_20 + (long)((iVar4 + -7) * 2));
  }
  *(undefined4 *)(puVar12 + -4) = local_28;
  __mac_toolbox(0xa982);
  *(undefined4 *)(puVar12 + -8) = local_24;
  __mac_toolbox(0xa873);
  return in_stack_00000008;
}



/* CODE 4 + 0x10fc, synthetic address 0x000410fc */

/* Original CODE 4 resource offset 0x10fc (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_10fc(void)

{
  int iVar1;
  undefined1 *puVar2;
  undefined1 auStack_130 [18];
  undefined2 local_16;
  
  __mac_toolbox(0xa946);
  puVar2 = auStack_130;
  __mac_toolbox(0xa900);
  iVar1 = 1;
  do {
    *(undefined2 *)(puVar2 + -4) = local_16;
    *(undefined2 *)(puVar2 + -6) = *(undefined2 *)((long)(iVar1 * 2 + -0x6f6) + 0x100000);
    __mac_toolbox(0xa902);
    if (puVar2[-6] == '\0') {
      *(undefined4 *)(puVar2 + -8) = DAT_000fbe0a;
      *(int *)(puVar2 + -10) = iVar1;
      *(undefined2 *)(puVar2 + -0xc) = 0;
      __mac_toolbox(0xa942);
    }
    else {
      *(undefined4 *)(puVar2 + -8) = DAT_000fbe0a;
      *(int *)(puVar2 + -10) = iVar1;
      *(undefined2 *)(puVar2 + -0xc) = 8;
      __mac_toolbox(0xa942);
    }
    puVar2 = puVar2 + -0xc;
    iVar1 = iVar1 + 1;
  } while (iVar1 < 9);
  DAT_000fbdec = local_16;
  return;
}



/* CODE 4 + 0x1174, synthetic address 0x00041174 */

/* Original CODE 4 resource offset 0x1174 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_1174(void)

{
  char *pcVar1;
  undefined4 uVar2;
  uint3 uVar3;
  long *plVar4;
  byte bVar5;
  undefined2 *puVar6;
  undefined4 *puVar7;
  undefined2 *puVar8;
  undefined4 *puVar9;
  char *pcVar10;
  bool bVar11;
  undefined1 local_e2 [2];
  undefined2 local_e0;
  long *plStack_de;
  undefined2 local_da;
  undefined2 uStack_d8;
  undefined2 uStack_d6;
  undefined2 local_d4;
  byte bStack_d2;
  undefined1 uStack_d1;
  undefined1 uStack_d0;
  undefined1 uStack_cf;
  undefined2 local_ce;
  undefined2 uStack_cc;
  byte bStack_ca;
  undefined1 uStack_c9;
  undefined2 local_c8;
  undefined4 local_c6;
  undefined2 local_c2;
  undefined2 local_c0;
  undefined2 uStack_be;
  undefined2 local_bc;
  undefined4 local_ba;
  char local_b6;
  undefined1 uStack_b5;
  undefined2 uStack_b4;
  byte bStack_b2;
  undefined1 uStack_b1;
  undefined2 uStack_b0;
  undefined4 local_ae;
  byte local_aa;
  undefined1 uStack_a9;
  undefined2 uStack_a8;
  byte bStack_a6;
  undefined1 uStack_a5;
  undefined2 local_a4;
  undefined4 local_a2;
  char local_9e;
  undefined1 uStack_9d;
  undefined2 uStack_9c;
  undefined2 uStack_9a;
  undefined2 uStack_98;
  undefined2 uStack_96;
  undefined2 uStack_94;
  undefined2 local_92;
  undefined2 uStack_90;
  byte bStack_8e;
  undefined1 uStack_8d;
  undefined2 uStack_8c;
  undefined2 local_8a;
  undefined2 uStack_88;
  byte local_86;
  undefined1 uStack_85;
  undefined2 local_84;
  undefined2 uStack_82;
  undefined2 local_80;
  undefined2 local_7e;
  undefined2 local_7c;
  undefined4 local_7a;
  undefined2 local_76;
  undefined2 local_74;
  undefined2 uStack_72;
  undefined2 local_70;
  byte local_6e;
  undefined1 uStack_6d;
  undefined2 uStack_6c;
  undefined2 local_6a;
  undefined2 uStack_68;
  undefined4 local_66;
  undefined2 local_62;
  undefined2 uStack_60;
  undefined2 local_5e;
  undefined2 local_5c;
  undefined2 uStack_5a;
  byte local_58;
  undefined1 uStack_57;
  undefined2 local_56;
  undefined4 local_54;
  undefined2 local_50;
  undefined4 local_4e;
  long *local_4a;
  
  __mac_toolbox(0xa850);
  *(undefined1 *)(*DAT_000fc02a + 0x203) = 0;
  plVar4 = DAT_000fbdcc;
  DAT_000fbdb8 = 0;
  __mac_toolbox(0xa917);
  __mac_toolbox(0xa924);
  if (DAT_000fbdcc == (long *)0x0) {
    bVar11 = false;
  }
  else {
    bVar11 = *(int *)(DAT_000fbdcc + 0x1b) < 0;
  }
  local_4a = DAT_000fbdcc;
  __mac_toolbox(0xa873);
  pcVar1 = (char *)*DAT_000fbdcc;
  if ((DAT_000fbdd8 & 1) == 0) {
    DAT_000fc030 = (long *)0x0;
    DAT_000fbe2a = (long *)0x0;
    DAT_000fbdb6 = 0;
    DAT_000fbdb7 = 0;
    local_4e = DAT_000fbdfa;
    local_50 = 4;
    __mac_toolbox(0xa93a);
    local_54 = DAT_000fbdfa;
    local_56 = 5;
    __mac_toolbox(0xa93a);
    uStack_5a = (undefined2)((ulong)DAT_000fbdfa >> 0x10);
    local_58 = (byte)((ulong)DAT_000fbdfa >> 8);
    uStack_57 = (undefined1)DAT_000fbdfa;
    local_5c = 6;
    __mac_toolbox(0xa93a);
    local_5e = (undefined2)DAT_000fbdfa;
    local_62 = 7;
    __mac_toolbox(0xa93a);
    local_66 = DAT_000fbdfa;
    uStack_68 = 10;
    __mac_toolbox(0xa93a);
    uStack_6c = (undefined2)((ulong)DAT_000fbe0e >> 0x10);
    local_6a = (undefined2)DAT_000fbe0e;
    local_6e = 0;
    uStack_6d = 7;
    __mac_toolbox(0xa93a);
    uStack_72 = (undefined2)((ulong)DAT_000fbe12 >> 0x10);
    local_70 = (undefined2)DAT_000fbe12;
    local_74 = 0xc;
    local_76 = CONCAT11(DAT_000fbdcc != (long *)0x0,(undefined1)local_76);
    local_7a = 0x414d2;
    uStack_60 = uStack_5a;
    CODE4_014c();
    local_7a = DAT_000fbdfe;
    local_7c = 0;
    local_7e = CONCAT11(bVar11,(undefined1)local_7e);
    uStack_82 = 4;
    local_80 = 0x14de;
    CODE4_014c();
    uStack_82 = (undefined2)((ulong)DAT_000fbdfe >> 0x10);
    local_80 = (undefined2)DAT_000fbdfe;
    local_84 = 9;
    __mac_toolbox(0xa93a);
    local_86 = (byte)((ulong)DAT_000fbdfe >> 8);
    uStack_85 = (undefined1)DAT_000fbdfe;
    local_8a = 10;
    __mac_toolbox(0xa93a);
    bStack_8e = (byte)((ulong)DAT_000fbdfe >> 0x18);
    uStack_8d = (undefined1)((ulong)DAT_000fbdfe >> 0x10);
    uStack_90 = 0xc;
    __mac_toolbox(0xa93a);
    uStack_96 = 0xd;
    __mac_toolbox(0xa93a);
    uStack_9a = (undefined2)((ulong)DAT_000fbe02 >> 0x10);
    uStack_98 = (undefined2)DAT_000fbe02;
    uStack_9c = 0;
    local_9e = -(bVar11 - 1U & -(plVar4 != (long *)0x0));
    local_a2 = 0x4151e;
    uStack_94 = uStack_82;
    local_92 = local_80;
    uStack_8c = local_80;
    uStack_88 = uStack_82;
    CODE4_014c();
    local_a2 = DAT_000fbe06;
    local_a4 = 0;
    bStack_a6 = -(bVar11 - 1U & -(plVar4 != (long *)0x0));
    local_aa = 0;
    uStack_a9 = 4;
    uStack_a8 = 0x1536;
    CODE4_014c();
    local_aa = (byte)((ulong)DAT_000fbe0a >> 0x18);
    uStack_a9 = (undefined1)((ulong)DAT_000fbe0a >> 0x10);
    uStack_a8 = (undefined2)DAT_000fbe0a;
    uVar3 = (uint3)local_ae._0_2_;
    local_ae = CONCAT13(-(bVar11 - 1U & -(plVar4 != (long *)0x0)),uVar3 << 0x10);
    bStack_b2 = 0;
    uStack_b1 = 4;
    uStack_b0 = 0x154e;
    CODE4_014c();
    bStack_b2 = (byte)((ulong)DAT_000fbe0e >> 0x18);
    uStack_b1 = (undefined1)((ulong)DAT_000fbe0e >> 0x10);
    uStack_b0 = (undefined2)DAT_000fbe0e;
    uStack_b4 = 0;
    local_b6 = -(bVar11 - 1U & -(0 < DAT_000fbdf0) & -(plVar4 != (long *)0x0) | -(1 < DAT_000fbdf0))
    ;
    pcVar10 = &local_b6;
    local_ba = 0x4157a;
    CODE4_014c();
    if (*pcVar1 == '\x03' || *pcVar1 == '\x02') {
      __mac_toolbox(0xa029);
      pcVar10 = (char *)*DAT_000fc02a;
      local_ba = *(undefined4 *)(pcVar10 + 0x210);
      local_bc = 0xff;
      __mac_toolbox(0xa95d);
      local_c0 = (undefined2)((ulong)*(undefined4 *)(pcVar10 + 0x20c) >> 0x10);
      uStack_be = (undefined2)*(undefined4 *)(pcVar10 + 0x20c);
      local_c2 = 0xff;
      __mac_toolbox(0xa95d);
      if (*pcVar10 == '\x02') {
        local_c6 = *(undefined4 *)(pcVar10 + 0x214);
        local_c8 = 0xff;
        __mac_toolbox(0xa95d);
        uStack_cc = (undefined2)((ulong)plVar4 >> 0x10);
        bStack_ca = (byte)((ulong)plVar4 >> 8);
        uStack_c9 = SUB41(plVar4,0);
        local_ce = 1;
        pcVar10 = &uStack_d0;
        uStack_d0 = 0;
        local_d4 = 4;
        bStack_d2 = 0x15;
        uStack_d1 = 0xca;
        CODE4_0a3c();
      }
      else {
        local_c6 = *(undefined4 *)(pcVar10 + 0x214);
        local_c8 = 0xff;
        __mac_toolbox(0xa95d);
        uVar2 = *(undefined4 *)(pcVar10 + 0x218);
        uStack_cc = (undefined2)((ulong)uVar2 >> 0x10);
        bStack_ca = (byte)((ulong)uVar2 >> 8);
        uStack_c9 = (undefined1)uVar2;
        local_ce = 0xff;
        __mac_toolbox(0xa95d);
        uVar2 = *(undefined4 *)(pcVar10 + 0x21c);
        bStack_d2 = (byte)((ulong)uVar2 >> 0x18);
        uStack_d1 = (undefined1)((ulong)uVar2 >> 0x10);
        uStack_d0 = (undefined1)((ulong)uVar2 >> 8);
        uStack_cf = (undefined1)uVar2;
        local_d4 = 0xff;
        __mac_toolbox(0xa95d);
        uStack_d8 = (undefined2)((ulong)*(undefined4 *)(pcVar10 + 0x220) >> 0x10);
        uStack_d6 = (undefined2)*(undefined4 *)(pcVar10 + 0x220);
        local_da = 0xff;
        __mac_toolbox(0xa95d);
        plStack_de = plVar4;
        local_e0 = 1;
        pcVar10 = local_e2;
        local_e2[0] = 0;
        CODE4_0a3c();
      }
      *(long **)(pcVar10 + -4) = DAT_000fc02a;
      __mac_toolbox(0xa02a);
    }
    __mac_toolbox(0xa937);
    if (*pcVar1 == '\0') {
      *(undefined4 *)(pcVar10 + -4) = *(undefined4 *)(pcVar1 + 0x10);
      *(undefined2 *)(pcVar10 + -6) = 0xff;
      __mac_toolbox(0xa95d);
      *(undefined4 *)(pcVar10 + -10) = *(undefined4 *)(pcVar1 + 0xc);
      puVar8 = (undefined2 *)(pcVar10 + -0xc);
      pcVar10 = pcVar10 + -0xc;
      *puVar8 = 0xff;
      __mac_toolbox(0xa95d);
    }
    bVar5 = -(*pcVar1 == '\x01') | -(*pcVar1 == '\0');
    if (bVar5 != 0) {
      *(undefined4 *)(pcVar10 + -4) = *(undefined4 *)(pcVar1 + 2);
      __mac_toolbox(0xa9d9);
      puVar9 = (undefined4 *)(pcVar10 + -8);
      pcVar10 = pcVar10 + -8;
      *puVar9 = plVar4;
      __mac_toolbox(0xa904);
    }
  }
  else {
    DAT_000fc030 = DAT_000fbdcc;
    DAT_000fbe2a = DAT_000fbdcc;
    DAT_000fbdb6 = *pcVar1 == '\0';
    local_4e = DAT_000fbdfa;
    local_50 = 4;
    __mac_toolbox(0xa939);
    local_54 = DAT_000fbdfe;
    local_56 = 0;
    local_58 = bVar11 | DAT_000fbdb6;
    local_5c = 4;
    uStack_5a = 0x11f6;
    CODE4_014c();
    local_5c = (undefined2)((ulong)DAT_000fbe12 >> 0x10);
    uStack_5a = (undefined2)DAT_000fbe12;
    local_5e = 0xc;
    __mac_toolbox(0xa939);
    local_62 = (undefined2)((ulong)DAT_000fbe0e >> 0x10);
    uStack_60 = (undefined2)DAT_000fbe0e;
    uVar3 = (uint3)local_66._0_2_;
    local_66 = CONCAT13(DAT_000fbdb6 | 1 < DAT_000fbdf0,uVar3 << 0x10);
    local_6a = 4;
    uStack_68 = 0x121a;
    CODE4_014c();
    if (*pcVar1 == '\x03' || *pcVar1 == '\x02') {
      DAT_000fbdb7 = 1;
      local_6a = (undefined2)((ulong)DAT_000fbe2a >> 0x10);
      uStack_68 = SUB42(DAT_000fbe2a,0);
      local_6e = 0;
      uStack_6d = 4;
      uStack_6c = 0x123a;
      CODE4_0174();
      uVar2 = *(undefined4 *)(*DAT_000fc02a + 0x210);
      local_6e = (byte)((ulong)uVar2 >> 0x18);
      uStack_6d = (undefined1)((ulong)uVar2 >> 0x10);
      uStack_6c = (undefined2)uVar2;
      local_70 = 0;
      __mac_toolbox(0xa95d);
      local_74 = (undefined2)((ulong)*(undefined4 *)(*DAT_000fc02a + 0x20c) >> 0x10);
      uStack_72 = (undefined2)*(undefined4 *)(*DAT_000fc02a + 0x20c);
      local_76 = 0;
      __mac_toolbox(0xa95d);
      if (*pcVar1 == '\x02') {
        local_7a = DAT_000fbe32;
        __mac_toolbox(0xa97e);
      }
      else {
        local_7a = DAT_000fbe36;
        __mac_toolbox(0xa97e);
      }
      local_7c = 3;
      local_7e = 0;
      local_80 = 0x7fff;
      local_84 = (undefined2)((ulong)DAT_000fbdfa >> 0x10);
      uStack_82 = (undefined2)DAT_000fbdfa;
      local_86 = 0;
      uStack_85 = 5;
      __mac_toolbox(0xa93a);
      uStack_8c = 6;
      __mac_toolbox(0xa93a);
      bStack_8e = (byte)((ulong)DAT_000fbdfa >> 8);
      uStack_8d = (undefined1)DAT_000fbdfa;
      local_92 = 7;
      __mac_toolbox(0xa93a);
      uStack_98 = 10;
      __mac_toolbox(0xa93a);
      uStack_9c = (undefined2)((ulong)DAT_000fbe0e >> 0x10);
      uStack_9a = (undefined2)DAT_000fbe0e;
      local_9e = 0;
      uStack_9d = 7;
      __mac_toolbox(0xa93a);
      local_a2 = DAT_000fbdfe;
      local_a4 = 0;
      __mac_toolbox(0xa939);
      uStack_a8 = (undefined2)((ulong)DAT_000fbdfe >> 0x10);
      bStack_a6 = (byte)((ulong)DAT_000fbdfe >> 8);
      uStack_a5 = (undefined1)DAT_000fbdfe;
      local_aa = 0;
      uStack_a9 = 9;
      __mac_toolbox(0xa93a);
      local_ae = DAT_000fbdfe;
      uStack_b0 = 10;
      __mac_toolbox(0xa93a);
      local_b6 = '\0';
      uStack_b5 = 0xc;
      __mac_toolbox(0xa93a);
      local_ba = DAT_000fbdfe;
      local_bc = 0xd;
      __mac_toolbox(0xa93a);
      local_c0 = (undefined2)((ulong)DAT_000fbe02 >> 0x10);
      uStack_be = (undefined2)DAT_000fbe02;
      local_c2 = 0;
      __mac_toolbox(0xa93a);
      local_c6 = DAT_000fbe06;
      local_c8 = 0;
      __mac_toolbox(0xa93a);
      uStack_cc = (undefined2)((ulong)DAT_000fbe0a >> 0x10);
      bStack_ca = (byte)((ulong)DAT_000fbe0a >> 8);
      uStack_c9 = (undefined1)DAT_000fbe0a;
      puVar6 = &local_ce;
      local_ce = 0;
      __mac_toolbox(0xa93a);
      uStack_b4 = uStack_a8;
      bStack_b2 = bStack_a6;
      uStack_b1 = uStack_a5;
      uStack_96 = local_84;
      uStack_94 = uStack_82;
      uStack_90 = local_84;
      local_8a = local_84;
      uStack_88 = uStack_82;
    }
    else {
      local_6a = (undefined2)((ulong)DAT_000fbdfa >> 0x10);
      uStack_68 = (undefined2)DAT_000fbdfa;
      uStack_6c = 5;
      local_6e = -(pcVar1[0x14] != '\0') & pcVar1[10] & DAT_000fbdb6;
      uStack_72 = 4;
      local_70 = 0x131a;
      CODE4_014c();
      uStack_72 = (undefined2)((ulong)DAT_000fbdfa >> 0x10);
      local_70 = (undefined2)DAT_000fbdfa;
      local_74 = 6;
      local_76 = CONCAT11(DAT_000fbdb6,(undefined1)local_76);
      local_7a = 0x4132a;
      CODE4_014c();
      local_7a = DAT_000fbdfa;
      local_7c = 7;
      local_7e = CONCAT11(-(pcVar1[0x14] != '\0') & pcVar1[10] & DAT_000fbdb6,(undefined1)local_7e);
      uStack_82 = 4;
      local_80 = 0x1348;
      CODE4_014c();
      uStack_82 = (undefined2)((ulong)DAT_000fbdfa >> 0x10);
      local_80 = (undefined2)DAT_000fbdfa;
      local_84 = 10;
      local_86 = DAT_000fbdb6;
      local_8a = 4;
      uStack_88 = 0x1358;
      CODE4_014c();
      local_8a = (undefined2)((ulong)DAT_000fbe02 >> 0x10);
      uStack_88 = (undefined2)DAT_000fbe02;
      uStack_8c = 0;
      bStack_8e = DAT_000fbdb6;
      local_92 = 4;
      uStack_90 = 0x1366;
      CODE4_014c();
      local_92 = (undefined2)((ulong)DAT_000fbe02 >> 0x10);
      uStack_90 = (undefined2)DAT_000fbe02;
      uStack_94 = 6;
      __mac_toolbox(0xa939);
      uStack_9a = 5;
      __mac_toolbox(0xa939);
      local_9e = (char)((ulong)DAT_000fbe06 >> 0x18);
      uStack_9d = (undefined1)((ulong)DAT_000fbe06 >> 0x10);
      uStack_9c = (undefined2)DAT_000fbe06;
      uVar3 = (uint3)local_a2._0_2_;
      local_a2 = CONCAT13(DAT_000fbdb6,uVar3 << 0x10);
      bStack_a6 = 0;
      uStack_a5 = 4;
      local_a4 = 5000;
      uStack_98 = local_92;
      uStack_96 = uStack_90;
      CODE4_014c();
      bStack_a6 = (byte)((ulong)DAT_000fbe0a >> 0x18);
      uStack_a5 = (undefined1)((ulong)DAT_000fbe0a >> 0x10);
      local_a4 = (undefined2)DAT_000fbe0a;
      uStack_a8 = 0;
      local_aa = DAT_000fbdb6;
      local_ae = 0x41396;
      CODE4_014c();
      local_ae = DAT_000fbdfe;
      uStack_b0 = 9;
      bStack_b2 = DAT_000fbdb6;
      local_b6 = '\0';
      uStack_b5 = 4;
      uStack_b4 = 0x13a6;
      CODE4_014c();
      local_b6 = (char)((ulong)DAT_000fbdfe >> 0x18);
      uStack_b5 = (undefined1)((ulong)DAT_000fbdfe >> 0x10);
      uStack_b4 = (undefined2)DAT_000fbdfe;
      local_ba = CONCAT22(local_ba._0_2_,10);
      local_ba = CONCAT13(DAT_000fbdb6,local_ba._1_3_);
      uStack_be = 4;
      local_bc = 0x13b6;
      CODE4_014c();
      uStack_be = (undefined2)((ulong)DAT_000fbdfe >> 0x10);
      local_bc = (undefined2)DAT_000fbdfe;
      local_c0 = 0xc;
      local_c2 = CONCAT11(DAT_000fbdb6,(undefined1)local_c2);
      local_c6 = 0x413c6;
      CODE4_014c();
      local_c6 = DAT_000fbdfe;
      local_c8 = 0xd;
      bStack_ca = DAT_000fbdb6;
      local_ce = 4;
      uStack_cc = 0x13d6;
      CODE4_014c();
      local_ce = (undefined2)((ulong)DAT_000fbe0e >> 0x10);
      uStack_cc = (undefined2)DAT_000fbe0e;
      uStack_d0 = 0;
      uStack_cf = 7;
      bStack_d2 = DAT_000fbdb6;
      uStack_d6 = 4;
      local_d4 = 0x13e6;
      CODE4_014c();
      puVar6 = &uStack_d6;
      uStack_d6 = (undefined2)((ulong)*(undefined4 *)(pcVar1 + 2) >> 0x10);
      local_d4 = (undefined2)*(undefined4 *)(pcVar1 + 2);
      __mac_toolbox(0xa9d8);
    }
    *(undefined4 *)((long)puVar6 + -4) = 0x413f0;
    CODE4_0294();
    __mac_toolbox(0xa937);
    pcVar10 = (char *)puVar6;
    if (*pcVar1 == '\0') {
      *(undefined4 *)((long)puVar6 + -4) = *(undefined4 *)(pcVar1 + 0x10);
      *(undefined2 *)((long)puVar6 + -6) = 0;
      __mac_toolbox(0xa95d);
      *(undefined4 *)((long)puVar6 + -10) = *(undefined4 *)(pcVar1 + 0xc);
      *(undefined2 *)((long)puVar6 + -0xc) = 0;
      __mac_toolbox(0xa95d);
      *(undefined4 *)((long)puVar6 + -0x10) = DAT_000fbe06;
      *(undefined2 *)((long)puVar6 + -0x12) = DAT_000fbde8;
      *(undefined1 *)((long)puVar6 + -0x14) = 0;
      __mac_toolbox(0xa945);
      DAT_000fbde8 = *(undefined2 *)(pcVar1 + 0x116);
      *(undefined4 *)((long)puVar6 + -0x18) = DAT_000fbe06;
      *(undefined2 *)((long)puVar6 + -0x1a) = DAT_000fbde8;
      *(undefined1 *)((long)puVar6 + -0x1c) = 1;
      __mac_toolbox(0xa945);
      *(undefined4 *)((long)puVar6 + -0x20) = DAT_000fbe0a;
      *(int *)((long)puVar6 + -0x22) = DAT_000fbdea;
      *(undefined1 *)((long)puVar6 + -0x24) = 0;
      __mac_toolbox(0xa945);
      DAT_000fbdea = *(int *)(pcVar1 + 0x118);
      *(undefined4 *)((long)puVar6 + -0x28) = DAT_000fbe0a;
      *(int *)((long)puVar6 + -0x2a) = DAT_000fbdea;
      pcVar10 = (char *)((long)puVar6 + -0x2c);
      *(undefined1 *)((long)puVar6 + -0x2c) = 1;
      __mac_toolbox(0xa945);
      *(undefined4 *)((long)puVar6 + -0x30) = 0x4144a;
      CODE4_10fc();
      DAT_000fbdee = *(undefined2 *)((long)(DAT_000fbdea * 2 + -0x6f6) + 0x100000);
    }
    bVar5 = -(*pcVar1 == '\x01') | -(*pcVar1 == '\0');
    if (bVar5 != 0) {
      puVar7 = (undefined4 *)(pcVar10 + -4);
      pcVar10 = pcVar10 + -4;
      *puVar7 = plVar4;
      __mac_toolbox(0xa904);
    }
  }
  if (DAT_000fbdf2 < 2) {
    *(undefined4 *)(pcVar10 + -4) = DAT_000fbe12;
    *(undefined2 *)(pcVar10 + -6) = 1;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(pcVar10 + -10) = DAT_000fbe12;
    *(undefined2 *)(pcVar10 + -0xc) = 2;
    __mac_toolbox(0xa93a);
  }
  else {
    *(undefined4 *)(pcVar10 + -4) = DAT_000fbe12;
    *(undefined2 *)(pcVar10 + -6) = 1;
    __mac_toolbox(0xa939);
    *(undefined4 *)(pcVar10 + -10) = DAT_000fbe12;
    *(undefined2 *)(pcVar10 + -0xc) = 2;
    __mac_toolbox(0xa939);
  }
  return bVar5;
}



/* CODE 4 + 0x1674, synthetic address 0x00041674 */

/* Original CODE 4 resource offset 0x1674 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_1674(long *param_1)

{
  long lVar1;
  int *piVar2;
  ulong uVar3;
  int iVar4;
  int iVar5;
  undefined4 *puVar6;
  undefined4 local_3a;
  int local_36;
  undefined4 local_34;
  
  lVar1 = *param_1;
  piVar2 = (int *)**(long **)(lVar1 + 2);
  uVar3 = *(ulong *)(lVar1 + 0x10);
  local_34 = uVar3;
  __mac_toolbox(0xa960);
  puVar6 = (undefined4 *)((long)&local_34 + 2);
  local_34._0_2_ = (int)(uVar3 >> 0x10);
  local_36 = (piVar2[4] - *piVar2) - local_34._0_2_ * piVar2[0xc];
  if (local_36 != 0) {
    local_34 = uVar3 & 0xffff;
    puVar6 = &local_3a;
    local_3a = *(undefined4 *)(lVar1 + 2);
    __mac_toolbox(0xa9dd);
  }
  iVar4 = piVar2[5];
  iVar5 = piVar2[1];
  *(undefined4 *)((long)puVar6 + -6) = *(undefined4 *)(lVar1 + 0xc);
  __mac_toolbox(0xa960);
  iVar4 = (iVar4 - iVar5) + *(int *)((long)puVar6 + -6) * -8;
  if (iVar4 != 0) {
    *(int *)((long)puVar6 + -6) = iVar4;
    *(undefined2 *)((long)puVar6 + -8) = 0;
    *(undefined4 *)((long)puVar6 + -0xc) = *(undefined4 *)(lVar1 + 2);
    __mac_toolbox(0xa9dd);
  }
  return;
}



/* CODE 4 + 0x16de, synthetic address 0x000416de */

/* Original CODE 4 resource offset 0x16de (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_16de(int param_1,long param_2)

{
  long lVar1;
  int iVar2;
  int unaff_D7w;
  
  if (param_1 != 0) {
    lVar1 = *DAT_000fc030;
    if (param_2 == *(long *)(lVar1 + 0x10)) {
      iVar2 = *(int *)(lVar1 + 6) + -1;
    }
    else {
      iVar2 = *(int *)(lVar1 + 8) / 2;
    }
    if (param_1 == 0x14) {
      unaff_D7w = -1;
    }
    else if (param_1 == 0x15) {
      unaff_D7w = 1;
    }
    else if (param_1 == 0x16) {
      unaff_D7w = -iVar2;
    }
    else if (param_1 == 0x17) {
      unaff_D7w = iVar2;
    }
    __mac_toolbox(0xa960);
    __mac_toolbox(0xa963);
    CODE4_1674(DAT_000fc030,unaff_D7w + (int)((ulong)param_2 >> 0x10));
  }
  return;
}



/* CODE 4 + 0x175e, synthetic address 0x0004175e */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x175e (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_175e(void)

{
  long lVar1;
  int **ppiVar2;
  undefined2 local_36;
  undefined4 local_34;
  int *piStack_30;
  long lStack_2c;
  undefined4 local_28;
  int local_18 [10];
  
  __mac_toolbox(0xa8d8);
  __mac_toolbox(0xa87a);
  lStack_2c = DAT_000fbe2a + 0x10;
  __mac_toolbox(0xa87b);
  piStack_30 = local_18;
  ppiVar2 = &piStack_30;
  __mac_toolbox(0xa972);
  lVar1 = *DAT_000fc030;
  if (local_18[0] < *(int *)(**(long **)(lVar1 + 2) + 8)) {
    local_34 = *(undefined4 *)(lVar1 + 0x10);
    ppiVar2 = (int **)&local_36;
    local_36 = 0x14;
    CODE4_16de();
  }
  else if (*(int *)(**(long **)(lVar1 + 2) + 0xc) < local_18[0]) {
    local_34 = *(undefined4 *)(lVar1 + 0x10);
    ppiVar2 = (int **)&local_36;
    local_36 = 0x15;
    CODE4_16de();
  }
  *(undefined4 *)((long)ppiVar2 + -4) = local_28;
  __mac_toolbox(0xa879);
  *(undefined4 *)((long)ppiVar2 + -8) = local_28;
  __mac_toolbox(0xa8d9);
  return 1;
}



/* CODE 4 + 0x17d6, synthetic address 0x000417d6 */

/* Original CODE 4 resource offset 0x17d6 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_17d6(undefined4 param_1,int param_2,undefined4 param_3)

{
  if (param_2 == 0x81) {
    __mac_toolbox(0xa968);
    CODE4_1674((int)((ulong)DAT_000fc030 >> 0x10),(int)DAT_000fc030,0,param_1,param_3);
  }
  else {
    __mac_toolbox(0xa968);
  }
  return;
}



/* CODE 4 + 0x181c, synthetic address 0x0004181c */

/* Original CODE 4 resource offset 0x181c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_181c(void)

{
  CODE4_037e();
  __mac_toolbox(0xa965);
  return;
}



/* CODE 4 + 0x1852, synthetic address 0x00041852 */

/* Original CODE 4 resource offset 0x1852 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

uint CODE4_1852(undefined2 param_1,undefined2 param_2,undefined2 param_3)

{
  char *pcVar1;
  undefined4 *puVar2;
  int *piVar3;
  byte bVar4;
  long lVar5;
  uint uVar6;
  int unaff_D6w;
  long *plVar7;
  undefined1 *puVar8;
  undefined1 *puVar9;
  undefined1 *puVar10;
  undefined1 local_4c [2];
  undefined2 local_4a;
  undefined2 local_48;
  long local_46;
  long local_42;
  undefined4 *puStack_3e;
  undefined4 local_20;
  undefined4 uStack_1c;
  undefined4 local_18;
  
  lVar5 = DAT_000fbe2a;
  puStack_3e = &local_20;
  __mac_toolbox(0xa874);
  plVar7 = &local_42;
  local_42 = DAT_000fbe2a;
  __mac_toolbox(0xa873);
  if (param_1._0_1_ != '\x01') {
    local_46 = DAT_000fbe2a;
    local_48 = param_3;
    local_4a = param_2;
    plVar7 = (long *)local_4c;
    local_4c[0] = 1;
    __mac_toolbox(0xa91d);
  }
  puVar8 = (undefined1 *)((long)plVar7 + -4);
  *(long *)((long)plVar7 + -4) = DAT_000fbe2a + 0x10;
  __mac_toolbox(0xa928);
  pcVar1 = (char *)*DAT_000fc030;
  puVar2 = (undefined4 *)**(long **)(pcVar1 + 2);
  piVar3 = (int *)(DAT_000fbe2a + 0x10);
  uStack_1c = puVar2[2];
  local_18 = puVar2[3];
  if (*pcVar1 == '\0') {
    *(undefined4 *)((long)plVar7 + -10) = *(undefined4 *)(pcVar1 + 0x10);
    __mac_toolbox(0xa960);
    puVar8 = (undefined1 *)((long)plVar7 + -8);
    unaff_D6w = *(int *)((long)plVar7 + -10);
  }
  *(int *)(puVar2 + 3) = *(int *)(DAT_000fbe2a + 0x14) + -0x13;
  *(int *)((long)puVar2 + 0xe) = *(int *)(lVar5 + 0x16) + -0x10;
  *(int *)(pcVar1 + 6) = (*(int *)(puVar2 + 3) - *(int *)(puVar2 + 2)) / *(int *)(puVar2 + 6);
  *(int *)(puVar2 + 3) = *(int *)(puVar2 + 2) + *(int *)(pcVar1 + 6) * *(int *)(puVar2 + 6);
  *(int *)(pcVar1 + 8) = (*(int *)((long)puVar2 + 0xe) - *(int *)((long)puVar2 + 10)) / 8;
  *puVar2 = puVar2[2];
  puVar2[1] = puVar2[3];
  *(int *)((long)puVar2 + 6) = *(int *)((long)puVar2 + 6) + 2000;
  puVar9 = puVar8;
  if (*pcVar1 == '\0') {
    __mac_toolbox(0xa896);
    *(undefined4 *)(puVar8 + -4) = *(undefined4 *)(pcVar1 + 0x10);
    *(int *)(puVar8 + -6) = *(int *)(lVar5 + 0x16) + -0xf;
    *(undefined2 *)(puVar8 + -8) = 0xffff;
    __mac_toolbox(0xa959);
    *(undefined4 *)(puVar8 + -0xc) = *(undefined4 *)(pcVar1 + 0xc);
    *(undefined2 *)(puVar8 + -0xe) = 0xffff;
    *(int *)(puVar8 + -0x10) = *(int *)(lVar5 + 0x14) + -0xf;
    __mac_toolbox(0xa959);
    *(undefined4 *)(puVar8 + -0x14) = *(undefined4 *)(pcVar1 + 0x10);
    *(undefined2 *)(puVar8 + -0x16) = 0x10;
    *(int *)(puVar8 + -0x18) = (*(int *)(lVar5 + 0x14) - (*piVar3 + -1)) + -0xe;
    __mac_toolbox(0xa95c);
    *(undefined4 *)(puVar8 + -0x1c) = *(undefined4 *)(pcVar1 + 0xc);
    *(int *)(puVar8 + -0x1e) = (*(int *)(lVar5 + 0x16) - (*(int *)(lVar5 + 0x12) + -1)) + -0xe;
    *(undefined2 *)(puVar8 + -0x20) = 0x10;
    __mac_toolbox(0xa95c);
    *(long **)(puVar8 + -0x24) = DAT_000fc030;
    *(undefined4 *)(puVar8 + -0x28) = 0x4198e;
    CODE4_181c();
    puVar9 = puVar8 + -0x28;
    *(long **)(puVar8 + -0x28) = DAT_000fc030;
    *(undefined4 *)(puVar8 + -0x2c) = 0x41996;
    CODE4_1674();
    __mac_toolbox(0xa897);
  }
  if (*pcVar1 == '\0') {
    *(undefined4 *)(puVar9 + -6) = *(undefined4 *)(pcVar1 + 0x10);
    __mac_toolbox(0xa960);
    bVar4 = param_1._0_1_ - 1U & -(unaff_D6w == *(int *)(puVar9 + -6));
    uVar6 = (uint)bVar4;
    puVar10 = puVar9 + -4;
    if (bVar4 != 0) {
      uVar6 = *(uint *)(puVar2 + 3);
      *(undefined4 **)(puVar9 + -8) = &uStack_1c;
      __mac_toolbox(0xa92a);
      puVar10 = puVar9 + -8;
    }
  }
  else {
    uVar6 = (uint)(byte)(param_1._0_1_ - 1U);
    puVar10 = puVar9;
    if ((byte)(param_1._0_1_ - 1U) != 0) {
      uVar6 = *(uint *)(puVar2 + 3);
      puVar10 = puVar9 + -4;
      *(undefined4 **)(puVar9 + -4) = &uStack_1c;
      __mac_toolbox(0xa92a);
    }
  }
  *(undefined4 *)(puVar10 + -4) = local_20;
  __mac_toolbox(0xa873);
  return uVar6;
}



/* CODE 4 + 0x1a16, synthetic address 0x00041a16 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Original CODE 4 resource offset 0x1a16 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

undefined4 CODE4_1a16(long param_1)

{
  byte bVar1;
  
  bVar1 = -((DAT_000fbdd8 & 0x100) == 0x100) | -(DAT_000fbe2a == param_1);
  if (bVar1 == 0) {
    __mac_toolbox(0xa91f);
  }
  else {
    __mac_toolbox(0xa8a9);
    __mac_toolbox(0xa925);
  }
  return CONCAT31((int3)((ulong)DAT_000fbe2a >> 8),bVar1);
}



/* CODE 4 + 0x1a76, synthetic address 0x00041a76 */

/* Original CODE 4 resource offset 0x1a76 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_1a76(long *param_1)

{
  long lVar1;
  int iVar2;
  
  lVar1 = *param_1;
  iVar2 = 0;
  while (*(int *)(**(long **)(lVar1 + 2) + 0x60 + (long)(iVar2 * 2)) <=
         *(int *)(**(long **)(lVar1 + 2) + 0x20)) {
    iVar2 = iVar2 + 1;
  }
  __mac_toolbox(0xa963);
  CODE4_1674(param_1,iVar2 - *(int *)(lVar1 + 6) / 2,*(undefined4 *)(lVar1 + 0x10));
  return;
}



/* CODE 4 + 0x1ac4, synthetic address 0x00041ac4 */

/* Original CODE 4 resource offset 0x1ac4 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_1ac4(long *param_1)

{
  long lVar1;
  long lVar2;
  undefined2 uVar3;
  int iVar4;
  undefined2 uVar5;
  undefined2 uVar6;
  
  CODE4_181c(param_1);
  uVar6 = 0x1adc;
  CODE4_1674(param_1);
  lVar1 = *param_1;
  lVar2 = **(long **)(lVar1 + 2);
  iVar4 = (int)((ulong)*(undefined4 *)(lVar1 + 0x10) >> 0x10);
  uVar5 = (undefined2)*(undefined4 *)(lVar1 + 0x10);
  __mac_toolbox(0xa960);
  uVar3 = (undefined2)((ulong)param_1 >> 0x10);
  if (*(int *)(lVar2 + 0x20) < *(int *)(lVar2 + 0x60 + (long)(iVar4 * 2))) {
    CODE4_1a76(uVar3,(int)param_1,uVar5,uVar6);
  }
  else if (*(int *)(lVar2 + 0x60 + (long)((*(int *)(lVar1 + 6) + iVar4) * 2)) <=
           *(int *)(lVar2 + 0x20)) {
    CODE4_1a76(uVar3,(int)param_1,uVar5,uVar6);
  }
  return;
}



/* CODE 4 + 0x1b28, synthetic address 0x00041b28 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Original CODE 4 resource offset 0x1b28 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

long * CODE4_1b28(undefined2 param_1,undefined4 *param_2,undefined4 param_3,undefined2 param_4,
                 undefined4 *param_5,undefined4 *param_6)

{
  ulong uVar1;
  int iVar3;
  long *plVar2;
  undefined4 *puVar4;
  char *pcVar5;
  long *plVar6;
  int **ppiVar7;
  undefined1 *puVar8;
  undefined1 *puVar9;
  undefined1 uVar10;
  undefined2 local_2cc;
  undefined2 local_2ca;
  undefined2 local_2c8;
  undefined2 local_2c6;
  undefined1 local_2c4;
  undefined *puStack_2c2;
  int *piStack_2be;
  undefined4 local_2ba;
  int local_2b2;
  int local_2b0;
  int local_2ae;
  undefined2 local_2ac;
  int *local_2aa;
  undefined2 local_2a6;
  undefined2 local_2a4;
  undefined2 local_2a2;
  undefined2 local_2a0;
  undefined1 local_29e;
  undefined *puStack_29c;
  int *piStack_298;
  undefined4 local_294;
  int local_28c;
  int local_28a;
  undefined2 local_288;
  int local_286;
  long *local_284;
  int *piStack_280;
  undefined2 local_27c;
  undefined2 local_27a;
  undefined4 local_278;
  long *local_274;
  long *local_270;
  undefined4 local_26c;
  undefined1 local_268;
  undefined4 local_266;
  undefined2 local_262;
  undefined1 local_260;
  undefined4 *puStack_25e;
  undefined4 *puStack_25a;
  undefined4 local_256;
  undefined4 local_24e;
  int local_22c;
  int local_22a;
  int local_226;
  undefined4 local_224;
  int local_220;
  int local_21e;
  undefined4 auStack_21c [64];
  char local_11c [256];
  undefined4 uStack_1c;
  undefined4 uStack_18;
  
  iVar3 = 0x3f;
  puVar4 = auStack_21c;
  do {
    *puVar4 = *param_6;
    iVar3 = iVar3 + -1;
    param_6 = param_6 + 1;
    puVar4 = puVar4 + 1;
  } while (iVar3 != -1);
  iVar3 = 0x3f;
  pcVar5 = local_11c;
  do {
    *(undefined4 *)pcVar5 = *param_5;
    iVar3 = iVar3 + -1;
    param_5 = param_5 + 1;
    pcVar5 = pcVar5 + 4;
  } while (iVar3 != -1);
  uStack_1c = *param_2;
  uStack_18 = param_2[1];
  local_24e = *DAT_000fbdc6;
  __mac_toolbox(0xa851);
  if (DAT_000fbdb4 == '\0') {
    local_262 = 0;
    __mac_toolbox(0xa913);
  }
  else {
    local_262 = 8;
    __mac_toolbox(0xa913);
  }
  puStack_25a = &uStack_1c;
  puStack_25e = auStack_21c;
  local_256 = param_3;
  local_260 = 0;
  local_266 = 0xffffffff;
  local_268 = 1;
  local_26c = 0;
  if (param_1._0_1_ == '\0') {
    local_270 = (long *)&DAT_000022da;
    local_274 = (long *)0x41bc4;
    JT_CODE1_053a();
    plVar6 = local_270;
  }
  else {
    local_270 = (long *)0xa;
    local_274 = (long *)0x41bd2;
    JT_CODE1_053a();
    plVar6 = local_270;
  }
  plVar2 = plVar6;
  if (plVar6 != (long *)0x0) {
    local_270 = (long *)0x0;
    __mac_toolbox(0xa918);
    local_278 = 0;
    __mac_toolbox(0xa873);
    local_27a = DAT_000fbdec;
    __mac_toolbox(0xa887);
    local_27c = DAT_000fbdee;
    __mac_toolbox(0xa88a);
    if (param_1._0_1_ == '\0') {
      *(undefined2 *)(*plVar6 + 0x116) = DAT_000fbde8;
      *(undefined2 *)(*plVar6 + 0x118) = DAT_000fbdea;
    }
    piStack_280 = &local_22c;
    ppiVar7 = &piStack_280;
    __mac_toolbox(0xa88b);
    local_226 = local_226 + local_22a + local_22c;
    __mac_toolbox(0xa029);
    pcVar5 = (char *)*plVar6;
    local_284 = plVar6;
    if (param_1._0_1_ == '\0') {
      local_284 = &local_224;
      local_286 = iRam00000016 + -0xf;
      local_288 = 0xffff;
      local_28a = iRam00000016 + 1;
      local_28c = iRam00000014 + -0xe;
      __mac_toolbox(0xa8a7);
      local_294 = 0;
      piStack_298 = (int *)&local_224;
      puStack_29c = &DAT_00041e28;
      local_29e = 1;
      local_2a0 = 0;
      local_2a2 = 0;
      local_2a4 = 0;
      local_2a6 = 0x10;
      __mac_toolbox(0xa954);
      pcVar5[0x10] = '\0';
      pcVar5[0x11] = '\0';
      pcVar5[0x12] = '\0';
      pcVar5[0x13] = '\0';
      local_2aa = (int *)&local_224;
      local_2ac = 0xffff;
      local_2ae = iRam00000014 + -0xf;
      local_2b0 = iRam00000016 + -0xe;
      local_2b2 = iRam00000014 + 1;
      __mac_toolbox(0xa8a7);
      local_2ba = 0;
      piStack_2be = (int *)&local_224;
      puStack_2c2 = &DAT_00041e26;
      local_2c4 = 1;
      local_2c6 = 0;
      local_2c8 = 0;
      local_2ca = 0x200;
      ppiVar7 = (int **)&local_2cc;
      local_2cc = 0x10;
      __mac_toolbox(0xa954);
      pcVar5[0xc] = '\0';
      pcVar5[0xd] = '\0';
      pcVar5[0xe] = '\0';
      pcVar5[0xf] = '\0';
    }
    *(undefined4 **)((long)ppiVar7 + -4) = &local_224;
    *(undefined2 *)((long)ppiVar7 + -6) = 10;
    *(undefined2 *)((long)ppiVar7 + -8) = 4;
    *(int *)((long)ppiVar7 + -10) = iRam00000016 + -0x10;
    *(int *)((long)ppiVar7 + -0xc) = iRam00000014 + -0x13;
    __mac_toolbox(0xa8a7);
    *(int *)(pcVar5 + 6) = (local_220 - local_224._0_2_) / local_226;
    local_220 = local_224._0_2_ + *(int *)(pcVar5 + 6) * local_226;
    uVar1 = (long)(local_21e - local_224._2_2_) / 8;
    plVar2 = (long *)((long)(local_21e - local_224._2_2_) % 8 << 0x10 | uVar1 & 0xffff);
    *(int *)(pcVar5 + 8) = (int)uVar1;
    puVar9 = (undefined1 *)((long)ppiVar7 + -0x14);
    *(undefined4 **)((long)ppiVar7 + -0x14) = &local_224;
    *(undefined4 **)((long)ppiVar7 + -0x18) = &local_224;
    __mac_toolbox(0xa9d2);
    *(undefined4 *)(pcVar5 + 2) = *(undefined4 *)((long)ppiVar7 + -0x18);
    *(undefined2 *)(**(long **)(pcVar5 + 2) + 0x48) = 0xffff;
    *pcVar5 = param_1._0_1_;
    local_274 = plVar6;
    if (param_1._0_1_ == '\x01') {
      *(undefined4 *)((long)ppiVar7 + -0x18) = *(undefined4 *)(**(long **)(pcVar5 + 2) + 0x3e);
      __mac_toolbox(0xa023);
      *(undefined4 *)((long)ppiVar7 + -0x18) = _DAT_00000ab4;
      *(undefined4 *)(**(long **)(pcVar5 + 2) + 0x3e) = *(undefined4 *)((long)ppiVar7 + -0x18);
      *(undefined4 *)((long)ppiVar7 + -0x1c) = 0x41d60;
      plVar2 = (long *)JT_CODE1_0992();
      *(undefined2 *)(**(long **)(pcVar5 + 2) + 0x3c) = *(undefined2 *)((long)ppiVar7 + -0x16);
      puVar9 = (undefined1 *)((long)ppiVar7 + -0x18);
      *(undefined4 *)((long)ppiVar7 + -0x18) = *(undefined4 *)(pcVar5 + 2);
      __mac_toolbox(0xa9d0);
    }
    else if (param_1._0_1_ == '\0') {
      *(undefined1 **)((long)ppiVar7 + -0x18) = &JT_CODE4_175e;
      *(undefined4 *)((long)ppiVar7 + -0x1c) = *(undefined4 *)(pcVar5 + 2);
      *(undefined4 *)((long)ppiVar7 + -0x20) = 0x41d88;
      JT_CODE1_0a1a();
      pcVar5[10] = '\0';
      pcVar5[0x11a] = '\0';
      *(undefined2 *)((long)ppiVar7 + -0x1e) = 0xff;
      *(char **)((long)ppiVar7 + -0x22) = local_11c;
      *(char **)((long)ppiVar7 + -0x26) = pcVar5 + 0x14;
      *(undefined4 *)((long)ppiVar7 + -0x2a) = 0x41da0;
      plVar2 = (long *)JT_CODE1_03e2();
      *(undefined2 *)(pcVar5 + 0x114) = param_4;
      puVar8 = (undefined1 *)((long)ppiVar7 + -0x26);
      if (local_11c[0] != '\0') {
        *(undefined4 *)((long)ppiVar7 + -0x2a) = *(undefined4 *)(**(long **)(pcVar5 + 2) + 0x3e);
        __mac_toolbox(0xa023);
        *(undefined4 *)(**(long **)(pcVar5 + 2) + 0x3e) = DAT_000fbdde;
        *(undefined4 *)((long)ppiVar7 + -0x2e) = DAT_000fbdde;
        *(undefined4 *)((long)ppiVar7 + -0x32) = 0x41dd0;
        JT_CODE1_0544();
        *(undefined2 *)(**(long **)(pcVar5 + 2) + 0x3c) = *(undefined2 *)((long)ppiVar7 + -0x2c);
        *(undefined4 *)((long)ppiVar7 + -0x2e) = *(undefined4 *)(pcVar5 + 2);
        __mac_toolbox(0xa9d0);
        *(long **)((long)ppiVar7 + -0x32) = plVar6;
        uVar10 = plVar6 == (long *)0x0;
        *(undefined4 *)((long)ppiVar7 + -0x36) = 0x41de8;
        CODE4_181c();
        *(undefined4 **)((long)ppiVar7 + -0x36) = auStack_21c;
        *(char **)((long)ppiVar7 + -0x3a) = local_11c;
        *(undefined4 *)((long)ppiVar7 + -0x3e) = 0x41df4;
        plVar2 = (long *)JT_CODE1_028c();
        puVar8 = (undefined1 *)((long)ppiVar7 + -0x3a);
        if (!(bool)uVar10) {
          pcVar5[0x14] = '\0';
          puVar8 = (undefined1 *)((long)ppiVar7 + -0x3a);
        }
      }
      *(undefined4 *)(puVar8 + -4) = 0;
      __mac_toolbox(0xa915);
      puVar9 = puVar8 + -8;
      *(undefined4 *)(puVar8 + -8) = 0;
      __mac_toolbox(0xa91f);
    }
    *(undefined4 *)(puVar9 + -4) = 0;
    *(undefined4 *)(puVar9 + -8) = 0;
    *(undefined4 *)(puVar9 + -0xc) = *(undefined4 *)(pcVar5 + 2);
    __mac_toolbox(0xa9d1);
    *(long **)(puVar9 + -0x10) = plVar6;
    __mac_toolbox(0xa02a);
    DAT_000fbdb8 = 0;
    __mac_toolbox(0xa850);
  }
  return plVar2;
}



/* CODE 4 + 0x1e2a, synthetic address 0x00041e2a */

/* Original CODE 4 resource offset 0x1e2a (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_1e2a(void)

{
  __mac_toolbox(0xa917);
  __mac_toolbox(0xa92d);
  __mac_toolbox(0xa9cd);
  __mac_toolbox(0xa023);
  return;
}



/* CODE 4 + 0x1e56, synthetic address 0x00041e56 */

/* Original CODE 4 resource offset 0x1e56 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_1e56(undefined2 param_1)

{
  undefined1 local_28;
  
  __mac_toolbox(0xa83b);
  local_28 = (char)((uint)param_1 >> 8);
  if (local_28 != '\0') {
    __mac_toolbox(0xa8a3);
    __mac_toolbox(0xa83a);
    CODE4_1852();
  }
  return;
}



/* CODE 4 + 0x1e98, synthetic address 0x00041e98 */

/* Original CODE 4 resource offset 0x1e98 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_1e98(undefined2 param_1,long param_2,long *param_3)

{
  long lVar1;
  undefined4 *puVar2;
  undefined2 uVar3;
  undefined2 uVar4;
  undefined1 local_28 [12];
  int local_1c;
  int local_1a;
  int local_16;
  
  uVar4 = DAT_000fbdee;
  uVar3 = DAT_000fbdec;
  __mac_toolbox(0xa029);
  __mac_toolbox(0xa029);
  __mac_toolbox(0xa874);
  __mac_toolbox(0xa873);
  lVar1 = *param_3;
  puVar2 = (undefined4 *)**(long **)(lVar1 + 2);
  if (param_1._0_1_ == '\0') {
    __mac_toolbox(0xa88a);
    *(undefined2 *)(puVar2 + 0x14) = DAT_000fbdee;
    *(undefined2 *)(lVar1 + 0x118) = DAT_000fbdea;
  }
  else {
    __mac_toolbox(0xa887);
    *(undefined2 *)((long)puVar2 + 0x4a) = DAT_000fbdec;
    *(undefined2 *)(lVar1 + 0x116) = DAT_000fbde8;
    uVar4 = uVar3;
  }
  __mac_toolbox(0xa88b);
  *(int *)(puVar2 + 6) = local_16 + local_1a + local_1c;
  *(int *)((long)puVar2 + 0x1a) = local_1c;
  *(int *)(puVar2 + 3) = *(int *)(param_2 + 0x14) + -0x12;
  *(int *)(lVar1 + 6) = (*(int *)(puVar2 + 3) - *(int *)(puVar2 + 2)) / *(int *)(puVar2 + 6);
  *(int *)(puVar2 + 3) = *(int *)(puVar2 + 2) + *(int *)(lVar1 + 6) * *(int *)(puVar2 + 6);
  *puVar2 = puVar2[2];
  puVar2[1] = puVar2[3];
  *(int *)((long)puVar2 + 6) = *(int *)((long)puVar2 + 6) + 2000;
  CODE4_181c(param_3,&local_1c,uVar4,param_2,local_28);
  __mac_toolbox(0xa963);
  __mac_toolbox(0xa928);
  __mac_toolbox(0xa873);
  __mac_toolbox(0xa02a);
  __mac_toolbox(0xa02a);
  return;
}



/* CODE 4 + 0x1fc8, synthetic address 0x00041fc8 */

/* Original CODE 4 resource offset 0x1fc8 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_1fc8(void)

{
  undefined1 *puVar1;
  undefined1 *puVar2;
  undefined1 local_2c [4];
  undefined4 uStack_28;
  
  __mac_toolbox(0xa924);
  if (*(int *)(uStack_28 + 0x1b) < 0) {
    puVar1 = (undefined1 *)((long)&uStack_28 + 2);
    __mac_toolbox(0xa9b7);
  }
  else {
    __mac_toolbox(0xa917);
    if (*(char *)*uStack_28 == '\0') {
      DAT_000fbdf2 = DAT_000fbdf2 + -1;
    }
    puVar1 = local_2c;
    __mac_toolbox(0xa916);
  }
  DAT_000fbe2a = 0;
  DAT_000fc030 = 0;
  *(undefined4 *)(puVar1 + -4) = DAT_000fbdfa;
  *(undefined2 *)(puVar1 + -6) = 4;
  __mac_toolbox(0xa93a);
  *(undefined4 *)(puVar1 + -10) = DAT_000fbdfa;
  *(undefined2 *)(puVar1 + -0xc) = 5;
  __mac_toolbox(0xa93a);
  *(undefined4 *)(puVar1 + -0x10) = DAT_000fbdfa;
  *(undefined2 *)(puVar1 + -0x12) = 6;
  __mac_toolbox(0xa93a);
  *(undefined4 *)(puVar1 + -0x16) = DAT_000fbdfa;
  *(undefined2 *)(puVar1 + -0x18) = 10;
  __mac_toolbox(0xa93a);
  *(undefined4 *)(puVar1 + -0x1c) = DAT_000fbe0e;
  puVar2 = puVar1 + -0x1e;
  *(undefined2 *)(puVar1 + -0x1e) = 7;
  __mac_toolbox(0xa93a);
  if (DAT_000fbdf2 < 2) {
    *(undefined4 *)(puVar1 + -0x22) = DAT_000fbe12;
    *(undefined2 *)(puVar1 + -0x24) = 1;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar1 + -0x28) = DAT_000fbe12;
    puVar2 = puVar1 + -0x2a;
    *(undefined2 *)(puVar1 + -0x2a) = 2;
    __mac_toolbox(0xa93a);
  }
  __mac_toolbox(0xa924);
  if (*(long *)(puVar2 + -4) == 0) {
    *(undefined4 *)(puVar2 + -4) = DAT_000fbdfe;
    *(undefined2 *)(puVar2 + -6) = 0;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar2 + -10) = DAT_000fbe02;
    *(undefined2 *)(puVar2 + -0xc) = 0;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar2 + -0x10) = DAT_000fbe06;
    *(undefined2 *)(puVar2 + -0x12) = 0;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar2 + -0x16) = DAT_000fbe0a;
    *(undefined2 *)(puVar2 + -0x18) = 0;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar2 + -0x1c) = DAT_000fbe12;
    *(undefined2 *)(puVar2 + -0x1e) = 0xc;
    __mac_toolbox(0xa93a);
    __mac_toolbox(0xa937);
  }
  return;
}



/* CODE 4 + 0x2092, synthetic address 0x00042092 */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x2092 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE4_2092(void)

{
  int iStack00000004;
  int iStack00000006;
  
  return (((DAT_000ff90a - DAT_000fc372) + iStack00000004 * -0x16 + -4) / iStack00000004) *
         (iStack00000006 + -1) + DAT_000fc372 + iStack00000006 * 0x16;
}



/* CODE 4 + 0x20d4, synthetic address 0x000420d4 */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x20d4 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE4_20d4(void)

{
  int iStack00000004;
  undefined2 uStack_a;
  
  uStack_a = CODE4_2092();
  return uStack_a + ((DAT_000ff90a - DAT_000fc372) + iStack00000004 * -0x16 + -4) / iStack00000004;
}



/* CODE 4 + 0x2112, synthetic address 0x00042112 */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x2112 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE4_2112(void)

{
  int iStack00000004;
  int iStack00000006;
  
  return ((DAT_000ff908 + (iStack00000004 + 1) * -4) / iStack00000004) * (iStack00000006 + -1) +
         iStack00000006 * 4;
}



/* CODE 4 + 0x2144, synthetic address 0x00042144 */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x2144 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE4_2144(void)

{
  int iStack00000004;
  undefined2 uStack_6;
  
  uStack_6 = CODE4_2112();
  return uStack_6 + (DAT_000ff908 + (iStack00000004 + 1) * -4) / iStack00000004;
}



/* CODE 4 + 0x2176, synthetic address 0x00042176 */

/* Original CODE 4 resource offset 0x2176 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_2176(undefined4 param_1,undefined4 *param_2)

{
  short sVar1;
  short sStack_22;
  undefined4 local_1c;
  undefined4 local_18;
  
  if (param_1._2_2_ == 2) {
    sStack_22 = CODE4_2112();
    sVar1 = sStack_22;
    sStack_22 = CODE4_2092();
    local_1c = CONCAT22(sStack_22,sVar1);
    sStack_22 = CODE4_2144();
    sVar1 = sStack_22;
    sStack_22 = CODE4_20d4();
    local_18 = CONCAT22(sStack_22,sVar1);
  }
  else if (param_1._2_2_ == 3) {
    if (param_1._0_2_ == 1) {
      sStack_22 = CODE4_2112();
      sVar1 = sStack_22;
      sStack_22 = CODE4_2092();
      local_1c = CONCAT22(sStack_22,sVar1);
      sStack_22 = CODE4_2144();
      sVar1 = sStack_22;
      sStack_22 = CODE4_20d4();
      local_18 = CONCAT22(sStack_22,sVar1);
    }
    else {
      sStack_22 = CODE4_2112();
      sVar1 = sStack_22;
      sStack_22 = CODE4_2092();
      local_1c = CONCAT22(sStack_22,sVar1);
      sStack_22 = CODE4_2144();
      sVar1 = sStack_22;
      sStack_22 = CODE4_20d4();
      local_18 = CONCAT22(sStack_22,sVar1);
    }
  }
  else if (param_1._2_2_ == 4) {
    sStack_22 = CODE4_2112();
    sVar1 = sStack_22;
    sStack_22 = CODE4_2092();
    local_1c = CONCAT22(sStack_22,sVar1);
    sStack_22 = CODE4_2144();
    sVar1 = sStack_22;
    sStack_22 = CODE4_20d4();
    local_18 = CONCAT22(sStack_22,sVar1);
  }
  else if (param_1._2_2_ == 5) {
    if (param_1._0_2_ < 3) {
      sStack_22 = CODE4_2112();
      sVar1 = sStack_22;
      sStack_22 = CODE4_2092();
      local_1c = CONCAT22(sStack_22,sVar1);
      sStack_22 = CODE4_2144();
      sVar1 = sStack_22;
      sStack_22 = CODE4_20d4();
      local_18 = CONCAT22(sStack_22,sVar1);
    }
    else {
      sStack_22 = CODE4_2112();
      sVar1 = sStack_22;
      sStack_22 = CODE4_2092();
      local_1c = CONCAT22(sStack_22,sVar1);
      sStack_22 = CODE4_2144();
      sVar1 = sStack_22;
      sStack_22 = CODE4_20d4();
      local_18 = CONCAT22(sStack_22,sVar1);
    }
  }
  else {
    local_1c = DAT_000fbe16;
    local_18 = DAT_000fbe1a;
  }
  *param_2 = local_1c;
  param_2[1] = local_18;
  return;
}



/* CODE 4 + 0x23bc, synthetic address 0x000423bc */

void FUN_000423bc(void)

{
  CODE4_2410();
  return;
}



/* CODE 4 + 0x23c4, synthetic address 0x000423c4 */

void FUN_000423c4(void)

{
  CODE4_2410();
  return;
}



/* CODE 4 + 0x23ce, synthetic address 0x000423ce */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x23ce (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

long CODE4_23ce(void)

{
  char cVar1;
  long in_stack_00000004;
  
  cVar1 = '\0';
  while ((byte)(cVar1 - 1U & -(in_stack_00000004 != 0)) != 0) {
    if (*(char *)(in_stack_00000004 + 0x6e) == '\0' || *(int *)(in_stack_00000004 + 0x6c) < 0) {
      in_stack_00000004 = *(long *)(in_stack_00000004 + 0x90);
    }
    else {
      cVar1 = '\x01';
    }
  }
  return in_stack_00000004;
}



/* CODE 4 + 0x2410, synthetic address 0x00042410 */

/* WARNING: Type propagation algorithm not settling */
/* Original CODE 4 resource offset 0x2410 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

ulong CODE4_2410(undefined2 param_1)

{
  ulong uVar1;
  int iVar2;
  int iVar3;
  ulong *puVar4;
  undefined1 *puVar5;
  undefined1 *puVar6;
  ulong *puVar7;
  ulong auStack_803e [8176];
  ulong local_7e [3];
  undefined1 auStack_72 [2];
  undefined1 local_70 [4];
  undefined1 auStack_6c [2];
  undefined4 uStack_6a;
  ulong auStack_66 [2];
  undefined4 uStack_46;
  undefined4 uStack_42;
  ulong local_3e [7];
  undefined4 local_22;
  undefined4 local_1e;
  
  auStack_66[1] = *DAT_000fbdc6;
  puVar7 = auStack_66 + 1;
  __mac_toolbox(0xa851);
  iVar3 = 1;
  do {
    uVar1 = (ulong)(uint)(iVar3 << 2);
    *(undefined4 *)((long)local_3e + (long)(iVar3 << 2)) = 0;
    iVar3 = iVar3 + 1;
  } while (iVar3 < 6);
  iVar3 = 0;
  iVar2 = 0;
  __mac_toolbox(0xa924);
  if (auStack_66[0] != 0) {
    __mac_toolbox(0xa924);
    auStack_66[0] = CODE4_23ce();
    uVar1 = 0;
    while (auStack_66[0] != 0) {
      puVar7[0xfffffffe] = auStack_66[0];
      __mac_toolbox(0xa917);
      DAT_000fc030 = (undefined4 *)puVar7[0xfffffffe];
      if (*(char *)*DAT_000fc030 == '\0') {
        iVar3 = iVar3 + 1;
        iVar2 = iVar2 + 1;
        *(ulong *)((long)local_3e + (long)(iVar3 * 4)) = auStack_66[0];
      }
      else if (*(char *)*DAT_000fc030 == '\x01') {
        uVar1 = auStack_66[0];
      }
      puVar7[0xfffffffe] = auStack_66[0];
      *(undefined1 *)((long)puVar7 + -10) = 0;
      __mac_toolbox(0xa908);
      *(ulong *)((long)puVar7 + -0xe) = auStack_66[0];
      *(undefined1 *)(puVar7 + 0xfffffffc) = 0;
      __mac_toolbox(0xa91c);
      puVar7[0xfffffffa] = *(undefined4 *)(auStack_66[0] + 0x90);
      puVar7[0xfffffff9] = 0x4249a;
      CODE4_23ce();
      puVar4 = puVar7 + 0xfffffffb;
      puVar7 = puVar7 + 0xfffffffc;
      auStack_66[0] = *puVar4;
    }
    if (param_1._0_1_ == '\0') {
      local_22 = DAT_000fbe16;
      local_1e = DAT_000fbe1a;
    }
    else {
      puVar7[0xffffffff] = (ulong)&uStack_46;
      *(int *)((long)puVar7 + -6) = iVar2;
      *(int *)(puVar7 + 0xfffffffe) = iVar2;
      puVar7[0xfffffffd] = 0x424b0;
      CODE4_2176();
      puVar7 = puVar7 + 0xffffffff;
      local_22 = uStack_46;
      local_1e = uStack_42;
    }
    if (uVar1 != 0) {
      *(ulong *)((long)puVar7 + -4) = uVar1;
      puVar5 = (undefined1 *)((long)puVar7 + -6);
      puVar7 = (ulong *)((long)puVar7 + -6);
      *puVar5 = 1;
      __mac_toolbox(0xa908);
    }
    for (; 0 < iVar3; iVar3 = iVar3 + -1) {
      uVar1 = (ulong)(uint)(iVar3 << 2);
      puVar6 = (undefined1 *)puVar7;
      if (*(long *)((long)local_3e + (long)(iVar3 << 2)) != 0) {
        DAT_000fbe2a = *(undefined4 *)((long)local_3e + (long)(iVar3 << 2));
        *(undefined4 *)((long)puVar7 + -8) = DAT_000fbe2a;
        __mac_toolbox(0xa917);
        DAT_000fc030 = *(undefined4 **)((long)puVar7 + -8);
        *(int *)((long)puVar7 + -6) = local_1e._2_2_ - local_22._2_2_;
        *(int *)((long)puVar7 + -8) = local_1e._0_2_ - local_22._0_2_;
        *(undefined1 *)((long)puVar7 + -10) = 0;
        *(undefined4 *)((long)puVar7 + -0xe) = 0x4251a;
        CODE4_1852();
        *(undefined4 *)((long)puVar7 + -0xe) = *(undefined4 *)((long)local_3e + (long)(iVar3 << 2));
        *(int *)((long)puVar7 + -0x10) = local_22._2_2_;
        *(int *)((long)puVar7 + -0x12) = local_22._0_2_;
        *(undefined1 *)((long)puVar7 + -0x14) = 1;
        __mac_toolbox(0xa91b);
        uVar1 = (ulong)(uint)(iVar3 << 2);
        *(undefined4 *)((long)puVar7 + -0x18) = *(undefined4 *)((long)local_3e + (long)(iVar3 << 2))
        ;
        *(undefined1 *)((long)puVar7 + -0x1a) = 1;
        __mac_toolbox(0xa908);
        puVar6 = (undefined1 *)((long)puVar7 + -0x1a);
        if (1 < iVar3) {
          if (param_1._0_1_ == '\0') {
            local_22 = CONCAT22(local_22._0_2_ + 0x12,local_22._2_2_ + 0x12);
            uVar1 = (ulong)(local_1e._2_2_ + 0x12U);
            local_1e = CONCAT22(local_1e._0_2_,local_1e._2_2_ + 0x12U);
            puVar6 = (undefined1 *)((long)puVar7 + -0x1a);
          }
          else {
            *(undefined4 **)((long)puVar7 + -0x1e) = &uStack_46;
            *(int *)((long)puVar7 + -0x20) = iVar2;
            *(int *)((long)puVar7 + -0x22) = iVar3 + -1;
            *(undefined4 *)((long)puVar7 + -0x26) = 0x42558;
            uVar1 = CODE4_2176();
            local_22 = uStack_46;
            local_1e = uStack_42;
            puVar6 = (undefined1 *)((long)puVar7 + -0x1e);
          }
        }
      }
      puVar7 = (ulong *)puVar6;
    }
    __mac_toolbox(0xa924);
    *(undefined1 *)((long)puVar7 + -6) = 1;
    __mac_toolbox(0xa91c);
  }
  __mac_toolbox(0xa850);
  return uVar1;
}



/* CODE 4 + 0x25ae, synthetic address 0x000425ae */

/* Original CODE 4 resource offset 0x25ae (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_25ae(undefined2 param_1,undefined4 *param_2)

{
  int iVar1;
  undefined4 *puVar2;
  
  switch(param_1) {
  case 0xffc3:
    iVar1 = 10;
    puVar2 = &DAT_00042818;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  default:
    *(undefined1 *)param_2 = 0;
    break;
  case 0xffc5:
    iVar1 = 5;
    puVar2 = &DAT_00042844;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffc7:
    iVar1 = 5;
    puVar2 = &DAT_0004285a;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffc8:
    *param_2 = DAT_00042870;
    param_2[1] = DAT_00042874;
    param_2[2] = DAT_00042878;
    param_2[3] = DAT_0004287c;
    break;
  case 0xffc9:
    iVar1 = 0xb;
    puVar2 = (undefined4 *)((long)&DAT_0004287c + 2);
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffca:
    iVar1 = 9;
    puVar2 = &DAT_000428ae;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffcb:
    iVar1 = 4;
    puVar2 = &DAT_000428d6;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffcc:
    iVar1 = 5;
    puVar2 = &DAT_000428ea;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffcd:
    iVar1 = 0xe;
    puVar2 = &DAT_00042900;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffce:
    iVar1 = 5;
    puVar2 = &DAT_0004293a;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffcf:
    iVar1 = 0x13;
    puVar2 = &DAT_00042952;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffd0:
    iVar1 = 0xe;
    puVar2 = &DAT_000429a0;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffd1:
    iVar1 = 10;
    puVar2 = &DAT_000429dc;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffd2:
    iVar1 = 8;
    puVar2 = &DAT_00042a06;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffd3:
    *param_2 = DAT_00042a2a;
    param_2[1] = DAT_00042a2e;
    param_2[2] = DAT_00042a32;
    param_2[3] = DAT_00042a36;
    break;
  case 0xffd4:
    iVar1 = 9;
    puVar2 = &DAT_00042a3a;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffd5:
    *param_2 = DAT_00042a62;
    param_2[1] = DAT_00042a66;
    param_2[2] = DAT_00042a6a;
    param_2[3] = DAT_00042a6e;
    break;
  case 0xffd6:
    iVar1 = 4;
    puVar2 = (undefined4 *)((long)&DAT_00042a6e + 2);
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffd8:
    iVar1 = 10;
    puVar2 = &DAT_00042a84;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffd9:
    iVar1 = 0xc;
    puVar2 = &DAT_00042aae;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffda:
    *param_2 = DAT_00042ae0;
    param_2[1] = DAT_00042ae4;
    param_2[2] = DAT_00042ae8;
    param_2[3] = DAT_00042aec;
    break;
  case 0xffdb:
    iVar1 = 6;
    puVar2 = (undefined4 *)((long)&DAT_00042aec + 2);
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffdc:
    *param_2 = DAT_00042b0a;
    param_2[1] = DAT_00042b0e;
    param_2[2] = DAT_00042b12;
    break;
  case 0xffdd:
    iVar1 = 7;
    puVar2 = (undefined4 *)((long)&DAT_00042b12 + 2);
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffde:
    iVar1 = 0xb;
    puVar2 = &DAT_00042b32;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
    break;
  case 0xffdf:
    iVar1 = 4;
    puVar2 = &DAT_00042b60;
    do {
      *param_2 = *puVar2;
      iVar1 = iVar1 + -1;
      param_2 = param_2 + 1;
      puVar2 = puVar2 + 1;
    } while (iVar1 != -1);
  }
  return;
}



/* CODE 4 + 0x2b74, synthetic address 0x00042b74 */

/* Original CODE 4 resource offset 0x2b74 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_2b74(int param_1,undefined4 param_2)

{
  undefined1 auStack_114 [272];
  
  JT_CODE1_094e(auStack_114,(long)param_1);
  JT_CODE1_03e2(param_2,auStack_114,0xff);
  return;
}



/* CODE 4 + 0x2ba2, synthetic address 0x00042ba2 */

/* Original CODE 4 resource offset 0x2ba2 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

ulong CODE4_2ba2(undefined2 *param_1,undefined4 param_2,undefined4 *param_3,undefined2 param_4,
                undefined1 *param_5)

{
  int iVar2;
  ulong uVar1;
  undefined4 *puVar3;
  uint *puVar4;
  bool bVar5;
  undefined2 local_18e;
  char *pcStack_18c;
  uint local_188;
  undefined2 uStack_186;
  undefined4 *puStack_184;
  uint uStack_180;
  undefined4 *local_17e;
  char *pcStack_17a;
  undefined4 local_176;
  undefined4 local_172 [4];
  char local_162 [6];
  undefined2 local_15c;
  undefined1 auStack_158 [64];
  undefined4 local_118;
  undefined4 auStack_114 [68];
  
  iVar2 = 0x3f;
  puVar3 = auStack_114;
  do {
    *puVar3 = *param_3;
    iVar2 = iVar2 + -1;
    param_3 = param_3 + 1;
    puVar3 = puVar3 + 1;
  } while (iVar2 != -1);
  local_118 = 0x370050;
  local_172[0] = param_2;
  bVar5 = param_4._0_1_ != '\0';
  if (bVar5) {
    pcStack_17a = "\x11Save document as:";
    local_17e = auStack_114;
    uStack_186 = (undefined2)((ulong)local_162 >> 0x10);
    puStack_184 = (undefined4 *)((long)local_162 * 0x10000);
    puVar4 = &local_188;
    __mac_toolbox(0xa9ea);
  }
  else {
    pcStack_17a = "";
    local_17e = (undefined4 *)0x0;
    puStack_184 = local_172;
    uStack_186 = 0;
    pcStack_18c = local_162;
    puVar4 = &local_18e;
    local_18e = 2;
    __mac_toolbox(0xa9ea);
  }
  uStack_180 = (uint)!bVar5;
  local_188 = (uint)bVar5;
  local_176 = 0x370050;
  uVar1 = (ulong)CONCAT11(0xff,local_162[0] + -1);
  if ((char)(local_162[0] + -1) == '\0') {
    *(undefined2 *)((long)puVar4 + -2) = 0xff;
    *(undefined1 **)((long)puVar4 + -6) = auStack_158;
    *(undefined1 **)((long)puVar4 + -10) = param_5;
    *(undefined4 *)((long)puVar4 + -0xe) = 0x42c28;
    uVar1 = JT_CODE1_03e2();
    *param_1 = local_15c;
  }
  else {
    *param_5 = 0;
  }
  return uVar1;
}



/* CODE 4 + 0x2c4e, synthetic address 0x00042c4e */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x2c4e (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_2c4e(void)

{
  long lVar1;
  int iVar2;
  byte bVar3;
  undefined4 *puVar4;
  undefined1 *puVar5;
  byte bVar6;
  undefined4 *in_stack_00000004;
  long alStack_238 [5];
  undefined1 auStack_216 [258];
  undefined4 auStack_114 [68];
  
  iVar2 = 0x3f;
  puVar4 = auStack_114;
  do {
    *puVar4 = *in_stack_00000004;
    iVar2 = iVar2 + -1;
    in_stack_00000004 = in_stack_00000004 + 1;
    puVar4 = puVar4 + 1;
  } while (iVar2 != -1);
  iVar2 = 0;
  puVar5 = &stack0xfffffddc;
  bVar3 = 0;
  while ((byte)(bVar3 - 1 & -(iVar2 < 5)) != 0) {
    iVar2 = iVar2 + 1;
    lVar1 = (long)(iVar2 * 0xa6 + -0x4072);
    bVar6 = *(char *)(lVar1 + 0x100008) == '\0';
    if (!(bool)bVar6) {
      *(long *)(puVar5 + -4) = lVar1 + 0x10000a;
      *(undefined1 **)(puVar5 + -8) = auStack_216;
      __mac_toolbox(0xa919);
      *(undefined1 **)(puVar5 + -0xc) = auStack_216;
      *(undefined4 **)(puVar5 + -0x10) = auStack_114;
      *(undefined4 *)(puVar5 + -0x14) = 0x42c98;
      JT_CODE1_028c();
      puVar5 = puVar5 + -0x10;
      bVar3 = bVar6;
    }
  }
  return bVar3;
}



/* CODE 4 + 0x2cb8, synthetic address 0x00042cb8 */

/* Original CODE 4 resource offset 0x2cb8 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

undefined1 CODE4_2cb8(undefined4 *param_1,undefined1 *param_2)

{
  int iVar1;
  undefined1 uVar2;
  char cVar3;
  int iVar4;
  undefined4 *puVar5;
  undefined1 *puVar6;
  undefined4 local_21c;
  undefined4 uStack_218;
  undefined4 uStack_214;
  undefined4 uStack_210;
  undefined4 auStack_114 [68];
  
  iVar1 = 0x3f;
  puVar5 = auStack_114;
  do {
    *puVar5 = *param_1;
    iVar1 = iVar1 + -1;
    param_1 = param_1 + 1;
    puVar5 = puVar5 + 1;
  } while (iVar1 != -1);
  __mac_toolbox(0xa850);
  puVar6 = &stack0xfffffdd2;
  while( true ) {
    *(undefined2 *)(puVar6 + -4) = 0x40;
    *(undefined2 **)(puVar6 + -8) = &DAT_000fbdca;
    __mac_toolbox(0xa970);
    if (puVar6[-8] == '\0') break;
    *(undefined4 *)(puVar6 + -10) = 0x42cd8;
    CODE4_00e4();
    puVar6 = puVar6 + -6;
  }
  *(undefined4 **)(puVar6 + -10) = &local_21c;
  __mac_toolbox(0xa874);
  cVar3 = '\0';
  iVar1 = 0;
  while (iVar4 = iVar1, (byte)(-(iVar4 < 5) & cVar3 - 1U) != 0) {
    iVar1 = iVar4 + 1;
    if (*(char *)((long)(iVar1 * 0xa6 + -0x4072) + 0x100008) != '\x01') {
      if (iVar4 == 0) {
        uStack_218 = DAT_00042e0c;
        uStack_214 = DAT_00042e10;
        uStack_210 = DAT_00042e14;
      }
      else if (iVar4 == 1) {
        uStack_218 = DAT_00042e00;
        uStack_214 = DAT_00042e04;
        uStack_210 = DAT_00042e08;
      }
      else if (iVar4 == 2) {
        uStack_218 = DAT_00042df4;
        uStack_214 = DAT_00042df8;
        uStack_210 = DAT_00042dfc;
      }
      else if (iVar4 == 3) {
        uStack_218 = DAT_00042de8;
        uStack_214 = DAT_00042dec;
        uStack_210 = DAT_00042df0;
      }
      else if (iVar4 == 4) {
        uStack_218 = DAT_00042ddc;
        uStack_214 = DAT_00042de0;
        uStack_210 = DAT_00042de4;
      }
      cVar3 = '\x01';
    }
  }
  *(undefined4 **)(puVar6 + -0xe) = auStack_114;
  *(undefined4 **)(puVar6 + -0x12) = &uStack_218;
  *(undefined **)(puVar6 + -0x16) = &DAT_00042dda;
  *(undefined **)(puVar6 + -0x1a) = &DAT_00042dd8;
  __mac_toolbox(0xa98b);
  *(undefined2 *)(puVar6 + -0x1e) = 0x84;
  *(undefined4 *)(puVar6 + -0x22) = 0;
  __mac_toolbox(0xa985);
  *(undefined4 *)(puVar6 + -0x24) = local_21c;
  __mac_toolbox(0xa873);
  if (*(int *)(puVar6 + -0x22) == 1) {
    *(undefined2 *)(puVar6 + -0x26) = 0xff;
    *(undefined4 **)(puVar6 + -0x2a) = &uStack_218;
    *(undefined1 **)(puVar6 + -0x2e) = param_2;
    *(undefined4 *)(puVar6 + -0x32) = 0x42dc6;
    uVar2 = JT_CODE1_03e2();
  }
  else {
    *param_2 = 0;
    uVar2 = 0;
  }
  return uVar2;
}



/* CODE 4 + 0x2e18, synthetic address 0x00042e18 */

/* Original CODE 4 resource offset 0x2e18 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_2e18(long param_1,undefined4 *param_2)

{
  int iVar1;
  undefined4 *puVar2;
  undefined1 auStack_214 [256];
  undefined4 auStack_114 [68];
  
  iVar1 = 0x3f;
  puVar2 = auStack_114;
  do {
    *puVar2 = *param_2;
    iVar1 = iVar1 + -1;
    param_2 = param_2 + 1;
    puVar2 = puVar2 + 1;
  } while (iVar1 != -1);
  JT_CODE1_0004(4,auStack_114,&DAT_00042e72,param_1 + -0x110,&DAT_00042e78,auStack_214);
  CODE4_0ae6(auStack_214);
  *(undefined1 *)(param_1 + 0xe) = 0;
  JT_CODE1_02c2(4,0x2fc4,1);
  return;
}



/* CODE 4 + 0x2e94, synthetic address 0x00042e94 */

/* Original CODE 4 resource offset 0x2e94 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_2e94(undefined4 param_1,int param_2)

{
  undefined1 auStack_414 [256];
  undefined1 auStack_314 [256];
  undefined1 auStack_214 [256];
  undefined1 auStack_114 [272];
  
  if (param_2 != 0) {
    CODE4_2b74(param_2,auStack_314,&DAT_00042f00,auStack_214);
    CODE4_25ae(param_2,auStack_414,&DAT_00042efc,auStack_314);
    JT_CODE1_0004(4,auStack_414);
    JT_CODE1_03e2(auStack_114,auStack_214,0xff);
    CODE4_2e18(param_1,auStack_114);
  }
  return;
}



/* CODE 4 + 0x2f0c, synthetic address 0x00042f0c */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x2f0c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_2f0c(void)

{
  int iVar1;
  undefined4 *puVar2;
  undefined1 **ppuVar3;
  undefined2 in_stack_00000004;
  undefined4 *in_stack_00000006;
  undefined1 *puStack_158;
  undefined *puStack_154;
  undefined4 uStack_150;
  undefined1 auStack_14c [4];
  undefined2 uStack_148;
  undefined2 local_146;
  undefined4 *puStack_144;
  undefined2 local_11c;
  char local_119;
  long local_118;
  undefined4 auStack_114 [67];
  undefined1 *local_8;
  
  local_8 = &stack0xfffffec2;
  iVar1 = 0x3f;
  puVar2 = auStack_114;
  do {
    *puVar2 = *in_stack_00000006;
    iVar1 = iVar1 + -1;
    in_stack_00000006 = in_stack_00000006 + 1;
    puVar2 = puVar2 + 1;
  } while (iVar1 != -1);
  local_119 = 0;
  puStack_144 = auStack_114;
  unique0x00009380 = &local_11c;
  uStack_150._2_2_ = 4;
  auStack_14c._0_2_ = 0x2f3e;
  JT_CODE1_0580();
  uStack_148 = 4;
  local_146 = 0x2f44;
  puStack_144 = (undefined4 *)&stack0xfffffffc;
  CODE4_2e94();
  local_119 = '\x01';
  uStack_148 = local_11c;
  auStack_14c = (undefined1  [4])&local_118;
  uStack_150._0_2_ = 4;
  uStack_150._2_2_ = 0x2f58;
  JT_CODE1_0680();
  ppuVar3 = (undefined1 **)&uStack_150;
  puStack_154 = (undefined *)0x42f5e;
  uStack_150 = &stack0xfffffffc;
  CODE4_2e94();
  if (0x7fff < local_118) {
    puStack_154 = &DAT_00042fe4;
    ppuVar3 = &puStack_158;
    puStack_158 = &stack0xfffffffc;
    CODE4_2e18();
  }
  *(undefined2 *)((long)ppuVar3 + -4) = local_11c;
  *(undefined4 *)((long)ppuVar3 + -8) = 0x42f7c;
  JT_CODE1_05c0();
  *(long *)((long)ppuVar3 + -10) = local_118;
  *(undefined4 *)((long)ppuVar3 + -0xe) = 0x42f8a;
  JT_CODE1_053a();
  DAT_000fbdde = *(undefined4 **)((long)ppuVar3 + -10);
  *(undefined4 **)((long)ppuVar3 + -0xc) = auStack_114;
  *(undefined2 *)((long)ppuVar3 + -0xe) = in_stack_00000004;
  *(undefined2 **)((long)ppuVar3 + -0x12) = &local_11c;
  *(undefined4 *)((long)ppuVar3 + -0x16) = 0x42fa0;
  JT_CODE1_0580();
  *(undefined2 *)((long)ppuVar3 + -10) = local_11c;
  *(long **)((long)ppuVar3 + -0xe) = &local_118;
  *(undefined4 *)((long)ppuVar3 + -0x12) = *DAT_000fbdde;
  *(undefined4 *)((long)ppuVar3 + -0x16) = 0x42fb8;
  JT_CODE1_05da();
  *(undefined1 **)((long)ppuVar3 + -0x16) = &stack0xfffffffc;
  *(undefined4 *)((long)ppuVar3 + -0x1a) = 0x42fbe;
  CODE4_2e94();
  if (local_119 != '\0') {
    *(undefined2 *)((long)ppuVar3 + -0x1a) = local_11c;
    *(undefined4 *)((long)ppuVar3 + -0x1e) = 0x42fd4;
    JT_CODE1_05c0();
  }
  return 1;
}



/* CODE 4 + 0x2ffc, synthetic address 0x00042ffc */

/* Original CODE 4 resource offset 0x2ffc (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_2ffc(long param_1,int param_2)

{
  undefined1 auStack_304 [256];
  undefined1 auStack_204 [256];
  undefined1 auStack_104 [256];
  
  if (param_2 != 0) {
    CODE4_2b74(param_2,auStack_204,&DAT_00043074,param_1 + -0x110,&DAT_00043084,auStack_104);
    CODE4_25ae(param_2,auStack_304,&DAT_00043070,auStack_204);
    JT_CODE1_0004(6,auStack_304);
    CODE4_0ae6(auStack_104);
    *(undefined1 *)(param_1 + 0x12) = 0;
    JT_CODE1_02c2(4,0x314a,1);
  }
  return;
}



/* CODE 4 + 0x309e, synthetic address 0x0004309e */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x309e (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_309e(void)

{
  int iVar1;
  undefined4 *puVar2;
  undefined1 **ppuVar3;
  long *in_stack_00000004;
  undefined2 in_stack_00000008;
  undefined4 *in_stack_0000000a;
  undefined1 *local_150;
  undefined4 local_14c;
  undefined4 local_148;
  undefined4 *puStack_142;
  undefined2 local_11a;
  long local_118;
  undefined4 auStack_114 [67];
  undefined1 *local_8;
  
  local_8 = &stack0xfffffec4;
  iVar1 = 0x3f;
  puVar2 = auStack_114;
  do {
    *puVar2 = *in_stack_0000000a;
    iVar1 = iVar1 + -1;
    in_stack_0000000a = in_stack_0000000a + 1;
    puVar2 = puVar2 + 1;
  } while (iVar1 != -1);
  puStack_142 = auStack_114;
  local_148 = 0x52576172;
  local_14c = 0x54455854;
  local_150 = (undefined1 *)0x430d4;
  JT_CODE1_0642();
  ppuVar3 = (undefined1 **)((long)&local_14c + 2);
  if (local_14c._0_2_ != -0x30) {
    ppuVar3 = &local_150;
    local_150 = &stack0xfffffffc;
    CODE4_2ffc();
  }
  *(undefined4 **)((long)ppuVar3 + -6) = auStack_114;
  *(undefined2 *)((long)ppuVar3 + -8) = in_stack_00000008;
  *(undefined2 **)((long)ppuVar3 + -0xc) = &local_11a;
  *(undefined4 *)((long)ppuVar3 + -0x10) = 0x430fc;
  JT_CODE1_0580();
  *(undefined1 **)((long)ppuVar3 + -6) = &stack0xfffffffc;
  *(undefined4 *)((long)ppuVar3 + -10) = 0x43102;
  CODE4_2ffc();
  *(undefined2 *)((long)ppuVar3 + -10) = local_11a;
  *(undefined4 *)((long)ppuVar3 + -0xe) = 0;
  *(undefined4 *)((long)ppuVar3 + -0x12) = 0x4310e;
  JT_CODE1_06a2();
  *(undefined1 **)((long)ppuVar3 + -0x12) = &stack0xfffffffc;
  *(undefined4 *)((long)ppuVar3 + -0x16) = 0x43114;
  CODE4_2ffc();
  local_118 = (long)*(int *)(*in_stack_00000004 + 0x3c);
  *(undefined2 *)((long)ppuVar3 + -0x16) = local_11a;
  *(long **)((long)ppuVar3 + -0x1a) = &local_118;
  *(undefined4 *)((long)ppuVar3 + -0x1e) = **(undefined4 **)(*in_stack_00000004 + 0x3e);
  *(undefined4 *)((long)ppuVar3 + -0x22) = 0x4313e;
  JT_CODE1_05de();
  *(undefined1 **)((long)ppuVar3 + -0x22) = &stack0xfffffffc;
  *(undefined4 *)((long)ppuVar3 + -0x26) = 0x43144;
  CODE4_2ffc();
  *(undefined2 *)((long)ppuVar3 + -0x26) = local_11a;
  *(undefined4 *)((long)ppuVar3 + -0x2a) = 0x43154;
  JT_CODE1_05c0();
  *(undefined4 *)((long)ppuVar3 + -0x2a) = 0;
  *(undefined2 *)((long)ppuVar3 + -0x2c) = in_stack_00000008;
  *(undefined4 *)((long)ppuVar3 + -0x30) = 0x43164;
  JT_CODE1_0622();
  return 1;
}



/* CODE 4 + 0x3176, synthetic address 0x00043176 */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x3176 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE4_3176(void)

{
  long lVar1;
  int iVar2;
  char cVar3;
  int iVar4;
  undefined1 *puVar5;
  undefined1 *puVar6;
  undefined2 in_stack_00000004;
  char *in_stack_00000006;
  short in_stack_0000000a;
  
  puVar6 = &stack0xffffffdc;
  cVar3 = '\0';
  iVar2 = 0;
  while (iVar4 = iVar2, (byte)(-(iVar4 < 5) & cVar3 - 1U) != 0) {
    iVar2 = iVar4 + 1;
    lVar1 = (long)(iVar2 * 0xa6 + -0x4072);
    if (*(char *)(lVar1 + 0x100008) != '\x01') {
      puVar5 = puVar6;
      if (*in_stack_00000006 == '\0') {
        if (iVar4 == 0) {
          *(undefined2 *)(puVar6 + -2) = in_stack_00000004;
          *(undefined **)(puVar6 + -6) = &DAT_000432a8;
          puVar5 = puVar6 + -10;
          *(char **)(puVar6 + -10) = in_stack_00000006;
          *(undefined4 *)(puVar6 + -0xe) = 0x431c2;
          JT_CODE1_03e2();
        }
        else if (iVar4 == 1) {
          *(undefined2 *)(puVar6 + -2) = in_stack_00000004;
          *(undefined **)(puVar6 + -6) = &DAT_0004329c;
          puVar5 = puVar6 + -10;
          *(char **)(puVar6 + -10) = in_stack_00000006;
          *(undefined4 *)(puVar6 + -0xe) = 0x431d6;
          JT_CODE1_03e2();
        }
        else if (iVar4 == 2) {
          *(undefined2 *)(puVar6 + -2) = in_stack_00000004;
          *(undefined **)(puVar6 + -6) = &DAT_00043290;
          puVar5 = puVar6 + -10;
          *(char **)(puVar6 + -10) = in_stack_00000006;
          *(undefined4 *)(puVar6 + -0xe) = 0x431e8;
          JT_CODE1_03e2();
        }
        else if (iVar4 == 3) {
          *(undefined2 *)(puVar6 + -2) = in_stack_00000004;
          *(undefined **)(puVar6 + -6) = &DAT_00043284;
          puVar5 = puVar6 + -10;
          *(char **)(puVar6 + -10) = in_stack_00000006;
          *(undefined4 *)(puVar6 + -0xe) = 0x431fa;
          JT_CODE1_03e2();
        }
        else if (iVar4 == 4) {
          *(undefined2 *)(puVar6 + -2) = in_stack_00000004;
          *(undefined **)(puVar6 + -6) = &DAT_00043278;
          puVar5 = puVar6 + -10;
          *(char **)(puVar6 + -10) = in_stack_00000006;
          *(undefined4 *)(puVar6 + -0xe) = 0x4320c;
          JT_CODE1_03e2();
        }
      }
      *(undefined1 *)(lVar1 + 0x100008) = 1;
      DAT_000fbdf0 = DAT_000fbdf0 + 1;
      DAT_000fbdf2 = DAT_000fbdf2 + 1;
      *(undefined4 *)(puVar5 + -4) = DAT_000fbe12;
      *(int *)(puVar5 + -6) = iVar4 + 4;
      __mac_toolbox(0xa939);
      *(undefined4 *)(puVar5 + -10) = DAT_000fbe12;
      *(int *)(puVar5 + -0xc) = iVar4 + 4;
      puVar6 = puVar5 + -0x10;
      *(char **)(puVar5 + -0x10) = in_stack_00000006;
      __mac_toolbox(0xa947);
      cVar3 = '\x01';
      in_stack_0000000a = iVar2;
    }
  }
  return in_stack_0000000a;
}



/* CODE 4 + 0x32b4, synthetic address 0x000432b4 */

/* Original CODE 4 resource offset 0x32b4 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_32b4(long param_1)

{
  long lVar1;
  int iVar2;
  byte bVar3;
  char cVar4;
  int iVar5;
  undefined4 *puVar6;
  undefined1 *puVar7;
  
  puVar7 = &stack0xffffffd0;
  cVar4 = '\0';
  iVar2 = 0;
  while (iVar5 = iVar2, bVar3 = -(iVar5 < 5) & cVar4 - 1U, bVar3 != 0) {
    iVar2 = iVar5 + 1;
    lVar1 = (long)(iVar2 * 0xa6 + -0x4072);
    if (param_1 == lVar1 + 0x10000a) {
      *(long *)(puVar7 + -8) = param_1;
      __mac_toolbox(0xa917);
      DAT_000fbdf0 = DAT_000fbdf0 + -1;
      DAT_000fbdf2 = DAT_000fbdf2 + -1;
      *(undefined4 *)(puVar7 + -8) = DAT_000fbe12;
      *(int *)(puVar7 + -10) = iVar5 + 4;
      __mac_toolbox(0xa93a);
      *(undefined4 *)(puVar7 + -0xe) = DAT_000fbe12;
      *(int *)(puVar7 + -0x10) = iVar5 + 4;
      puVar6 = (undefined4 *)(puVar7 + -0x14);
      puVar7 = puVar7 + -0x14;
      *puVar6 = &DAT_00043334;
      __mac_toolbox(0xa947);
      *(undefined1 *)(lVar1 + 0x100008) = 0;
      cVar4 = '\x01';
    }
  }
  return bVar3;
}



/* CODE 4 + 0x333c, synthetic address 0x0004333c */

/* Original CODE 4 resource offset 0x333c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

undefined4 CODE4_333c(undefined4 *param_1,long param_2)

{
  int iVar1;
  int iVar2;
  byte bVar3;
  undefined2 uVar4;
  ulong uVar5;
  uint uVar6;
  char cVar7;
  int iVar8;
  undefined4 *puVar9;
  long *plVar10;
  undefined1 *puVar11;
  undefined1 local_130 [8];
  undefined4 auStack_114 [68];
  
  uVar5 = 0x3f;
  puVar9 = auStack_114;
  do {
    *puVar9 = *param_1;
    uVar6 = (int)uVar5 - 1;
    uVar5 = (ulong)uVar6;
    param_1 = param_1 + 1;
    puVar9 = puVar9 + 1;
  } while (uVar6 != 0xffff);
  cVar7 = '\0';
  puVar11 = local_130;
  __mac_toolbox(0xa91a);
  iVar1 = 0;
  while (iVar8 = iVar1, bVar3 = -(iVar8 < 5) & cVar7 - 1U, bVar3 != 0) {
    iVar1 = iVar8 + 1;
    iVar2 = (int)((long)iVar1 * 0xa6) + -0x4072;
    uVar4 = (undefined2)((ulong)((long)iVar1 * 0xa6) >> 0x10);
    uVar5 = CONCAT22(uVar4,iVar2);
    if (param_2 == (long)iVar2 + 0x10000a) {
      *(undefined4 *)(puVar11 + -4) = DAT_000fbe12;
      uVar5 = CONCAT22(uVar4,iVar8 + 4);
      *(int *)(puVar11 + -6) = iVar8 + 4;
      plVar10 = (long *)(puVar11 + -10);
      puVar11 = puVar11 + -10;
      *plVar10 = (long)auStack_114;
      __mac_toolbox(0xa947);
      cVar7 = '\x01';
    }
  }
  return CONCAT31((int3)(uVar5 >> 8),bVar3);
}



/* CODE 4 + 0x33aa, synthetic address 0x000433aa */

/* Original CODE 4 resource offset 0x33aa (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_33aa(undefined2 param_1,undefined4 *param_2,undefined2 param_3)

{
  long lVar1;
  undefined1 auVar2 [4];
  int iVar3;
  byte bVar4;
  undefined4 *puVar5;
  char *pcVar6;
  undefined1 *puVar7;
  undefined4 *puVar8;
  undefined1 *puVar9;
  char acStack_352 [16];
  undefined4 uStack_342;
  undefined1 auStack_33e [4];
  undefined2 local_33a;
  undefined4 local_338;
  undefined *puStack_334;
  undefined1 local_330;
  undefined1 *puStack_32e;
  undefined1 auStack_31a [260];
  char local_216 [258];
  char local_114 [272];
  
  puVar8 = (undefined4 *)&stack0xfffffcd6;
  iVar3 = 0x3f;
  puVar5 = param_2;
  pcVar6 = local_114;
  do {
    *(undefined4 *)pcVar6 = *puVar5;
    iVar3 = iVar3 + -1;
    puVar5 = puVar5 + 1;
    pcVar6 = pcVar6 + 4;
  } while (iVar3 != -1);
  if (param_3._0_1_ != 1) {
    local_216[0] = '\0';
    if (local_114[0] == '\0') {
      puStack_32e = auStack_31a;
      local_330 = 0;
      puStack_334 = &DAT_00043570;
      local_338 = 0x54455854;
      unique0x00009380 = &param_1;
      uStack_342._2_2_ = 4;
      auStack_33e._0_2_ = 0x33f0;
      CODE4_2ba2();
      local_33a = 0xff;
      auStack_33e = (undefined1  [4])auStack_31a;
      uStack_342 = local_114;
      puVar8 = &uStack_342;
      JT_CODE1_03e2();
    }
    if (local_114[0] != '\0') {
      *(char **)((long)puVar8 + -6) = local_114;
      *(undefined4 *)((long)puVar8 + -10) = 0x43414;
      CODE4_2c4e();
      if (*(char *)((long)puVar8 + -2) == '\x01') {
        *(undefined1 **)((long)puVar8 + -4) = auStack_31a;
        *(char **)((long)puVar8 + -8) = local_114;
        *(undefined4 *)((long)puVar8 + -0xc) = 0x43438;
        CODE4_2cb8();
        *(undefined2 *)((long)puVar8 + -6) = 0xff;
        *(undefined1 **)((long)puVar8 + -10) = auStack_31a;
        *(char **)((long)puVar8 + -0xe) = local_216;
        *(undefined4 *)((long)puVar8 + -0x12) = 0x4344a;
        JT_CODE1_03e2();
        puVar8 = (undefined4 *)((long)puVar8 + -0xe);
      }
      else {
        *(undefined2 *)((long)puVar8 + -2) = 0xff;
        *(char **)((long)puVar8 + -6) = local_114;
        *(char **)((long)puVar8 + -10) = local_216;
        *(undefined4 *)((long)puVar8 + -0xe) = 0x4342a;
        JT_CODE1_03e2();
        puVar8 = (undefined4 *)((long)puVar8 + -10);
      }
      if (local_216[0] != '\0') {
        *(char **)((long)puVar8 + -6) = local_114;
        *(undefined2 *)((long)puVar8 + -8) = param_1;
        *(undefined4 *)((long)puVar8 + -0xc) = 0x4345e;
        CODE4_2f0c();
        puVar7 = (undefined1 *)puVar8;
        auVar2 = auStack_33e;
        if (*(char *)((long)puVar8 + -2) == '\x01') {
          while( true ) {
            auStack_33e._0_2_ = (undefined2)((ulong)auVar2 >> 0x10);
            auStack_33e._2_2_ = SUB42(auVar2,0);
            *(undefined2 *)(puVar7 + -4) = 0x40;
            *(undefined2 **)(puVar7 + -8) = &DAT_000fbdca;
            __mac_toolbox(0xa970);
            puVar8 = (undefined4 *)(puVar7 + -6);
            if (puVar7[-8] == '\0') break;
            *(undefined4 *)(puVar7 + -10) = 0x43470;
            CODE4_00e4();
            auVar2 = (undefined1  [4])CONCAT22(auStack_33e._0_2_,auStack_33e._2_2_);
            puVar7 = puVar7 + -6;
          }
        }
        else {
          local_216[0] = '\0';
        }
      }
    }
  }
  bVar4 = param_3._0_1_ | local_216[0] != '\0';
  if (bVar4 != 0) {
    if (param_3._0_1_ != 0) {
      local_216[0] = '\0';
      local_114[0] = '\0';
      param_1 = 0;
    }
    *(char **)((long)puVar8 + -6) = local_216;
    *(undefined2 *)((long)puVar8 + -8) = 0xff;
    *(undefined4 *)((long)puVar8 + -0xc) = 0x434ac;
    CODE4_3176();
    iVar3 = *(int *)((long)puVar8 + -2);
    lVar1 = (long)(iVar3 * 0xa6 + -0x4072);
    *(char **)((long)puVar8 + -4) = local_216;
    *(char **)((long)puVar8 + -8) = local_114;
    *(undefined2 *)((long)puVar8 + -10) = param_1;
    *(long *)((long)puVar8 + -0xe) = lVar1 + 0x10000a;
    *(long *)((long)puVar8 + -0x12) = lVar1 + 0x100000;
    *(undefined1 *)((long)puVar8 + -0x14) = 0;
    *(undefined4 *)((long)puVar8 + -0x18) = 0x434d4;
    CODE4_1b28();
    *(int *)(**(long **)(&JT_CODE4_53fa + lVar1) + 0x22b4) = iVar3;
    if (iVar3 == DAT_000fbdb2) {
      DAT_000fbdb2 = 0;
    }
    (&DAT_000fc37b)[iVar3] = 1;
    *(undefined4 *)((long)puVar8 + -0x18) = DAT_000fbdfa;
    *(undefined2 *)((long)puVar8 + -0x1a) = 1;
    *(bool *)((long)puVar8 + -0x1c) = DAT_000fbdf0 < 5;
    *(undefined4 *)((long)puVar8 + -0x20) = 0x4350a;
    CODE4_014c();
    *(undefined4 *)((long)puVar8 + -0x20) = DAT_000fbdfa;
    *(undefined2 *)((long)puVar8 + -0x22) = 2;
    *(bool *)((long)puVar8 + -0x24) = DAT_000fbdf0 < 5;
    *(undefined4 *)((long)puVar8 + -0x28) = 0x43522;
    bVar4 = CODE4_014c();
    *(undefined4 *)((long)puVar8 + -0x28) = DAT_000fbdfa;
    *(undefined2 *)((long)puVar8 + -0x2a) = 4;
    __mac_toolbox(0xa939);
    *(undefined4 *)((long)puVar8 + -0x2e) = DAT_000fbdfa;
    puVar9 = (undefined1 *)((long)puVar8 + -0x30);
    *(undefined2 *)((long)puVar8 + -0x30) = 6;
    __mac_toolbox(0xa939);
    if (1 < DAT_000fbdf2) {
      *(undefined4 *)((long)puVar8 + -0x34) = DAT_000fbe12;
      *(undefined2 *)((long)puVar8 + -0x36) = 1;
      __mac_toolbox(0xa939);
      *(undefined4 *)((long)puVar8 + -0x3a) = DAT_000fbe12;
      puVar9 = (undefined1 *)((long)puVar8 + -0x3c);
      *(undefined2 *)((long)puVar8 + -0x3c) = 2;
      __mac_toolbox(0xa939);
    }
    if (1 < DAT_000fbdf0) {
      *(undefined4 *)(puVar9 + -4) = DAT_000fbe0e;
      *(undefined2 *)(puVar9 + -6) = 1;
      __mac_toolbox(0xa939);
    }
  }
  return bVar4;
}



/* CODE 4 + 0x3572, synthetic address 0x00043572 */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x3572 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_3572(void)

{
  long lVar1;
  char **ppcVar2;
  char **ppcVar3;
  undefined1 *puVar4;
  char in_stack_00000004;
  long *in_stack_00000006;
  undefined4 in_stack_0000000a;
  byte bVar5;
  char *pcStack_22c;
  undefined4 local_228;
  char *pcStack_224;
  long lStack_220;
  undefined2 local_21c;
  undefined1 auStack_216 [256];
  char local_116 [256];
  undefined2 local_16 [9];
  
  bVar5 = 0;
  local_16[0] = *(undefined2 *)(*in_stack_00000006 + 0x114);
  local_21c = 0xff;
  lStack_220 = *in_stack_00000006 + 0x14;
  pcStack_224 = local_116;
  ppcVar3 = &pcStack_224;
  local_228 = 0x4359e;
  JT_CODE1_03e2();
  if (in_stack_00000004 != '\0') {
    ppcVar2 = &pcStack_224;
    if (local_116[0] == '\0') {
      local_228 = in_stack_0000000a;
      pcStack_22c = local_116;
      __mac_toolbox(0xa919);
      ppcVar2 = &pcStack_22c;
    }
    while( true ) {
      *(undefined2 *)((long)ppcVar2 + -4) = 0x40;
      *(undefined2 **)((long)ppcVar2 + -8) = &DAT_000fbdca;
      __mac_toolbox(0xa970);
      if (*(char *)((long)ppcVar2 + -8) == '\0') break;
      *(undefined4 *)((long)ppcVar2 + -10) = 0x435ba;
      CODE4_00e4();
      ppcVar2 = (char **)((long)ppcVar2 + -6);
    }
    *(undefined1 **)((long)ppcVar2 + -10) = auStack_216;
    *(undefined1 *)((long)ppcVar2 + -0xc) = 1;
    *(char **)((long)ppcVar2 + -0x10) = local_116;
    *(undefined4 *)((long)ppcVar2 + -0x14) = 0x54455854;
    *(undefined2 **)((long)ppcVar2 + -0x18) = local_16;
    *(undefined4 *)((long)ppcVar2 + -0x1c) = 0x435e4;
    CODE4_2ba2();
    *(undefined2 *)((long)ppcVar2 + -0x16) = 0xff;
    *(undefined1 **)((long)ppcVar2 + -0x1a) = auStack_216;
    ppcVar3 = (char **)((long)ppcVar2 + -0x1e);
    *(char **)((long)ppcVar2 + -0x1e) = local_116;
    *(undefined4 *)((long)ppcVar2 + -0x22) = 0x435f6;
    JT_CODE1_03e2();
  }
  if (local_116[0] != '\0') {
    *(undefined4 *)((long)ppcVar3 + -4) = *DAT_000fbdc6;
    __mac_toolbox(0xa851);
    lVar1 = *in_stack_00000006;
    *(char **)((long)ppcVar3 + -10) = local_116;
    *(undefined2 *)((long)ppcVar3 + -0xc) = local_16[0];
    *(undefined4 *)((long)ppcVar3 + -0x10) = *(undefined4 *)(lVar1 + 2);
    *(undefined4 *)((long)ppcVar3 + -0x14) = 0x4361c;
    CODE4_309e();
    puVar4 = (undefined1 *)((long)ppcVar3 + -4);
    if (*(char *)((long)ppcVar3 + -6) != '\0') {
      bVar5 = 1;
      *(undefined1 *)(lVar1 + 10) = 0;
      *(undefined2 *)((long)ppcVar3 + -6) = 0xff;
      *(char **)((long)ppcVar3 + -10) = local_116;
      *(long *)((long)ppcVar3 + -0xe) = lVar1 + 0x14;
      *(undefined4 *)((long)ppcVar3 + -0x12) = 0x4363a;
      JT_CODE1_03e2();
      *(undefined2 *)(lVar1 + 0x114) = local_16[0];
      *(undefined4 *)((long)ppcVar3 + -0x12) = DAT_000fbdfa;
      *(undefined2 *)((long)ppcVar3 + -0x14) = 5;
      __mac_toolbox(0xa93a);
      *(undefined4 *)((long)ppcVar3 + -0x18) = DAT_000fbdfa;
      puVar4 = (undefined1 *)((long)ppcVar3 + -0x1a);
      *(undefined2 *)((long)ppcVar3 + -0x1a) = 7;
      __mac_toolbox(0xa93a);
      if (in_stack_00000004 != '\0') {
        *(undefined4 *)((long)ppcVar3 + -0x1e) = in_stack_0000000a;
        puVar4 = (undefined1 *)((long)ppcVar3 + -0x22);
        *(char **)((long)ppcVar3 + -0x22) = local_116;
        *(undefined4 *)((long)ppcVar3 + -0x26) = 0x43666;
        CODE4_333c();
      }
    }
    __mac_toolbox(0xa850);
    DAT_000fbdb8 = 0;
    *(undefined4 *)(puVar4 + -4) = 0x43670;
    CODE4_054e();
  }
  return bVar5;
}



/* CODE 4 + 0x367c, synthetic address 0x0004367c */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x367c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_367c(void)

{
  undefined1 *puVar1;
  undefined2 in_stack_00000004;
  long *in_stack_00000006;
  undefined4 in_stack_0000000a;
  byte bVar2;
  undefined4 local_11a;
  undefined1 auStack_114 [272];
  
  bVar2 = 1;
  if (((in_stack_00000006 != (long *)0x0) && (*(char *)*in_stack_00000006 == '\0')) &&
     (*(char *)(*in_stack_00000006 + 10) != '\0')) {
    __mac_toolbox(0xa850);
    puVar1 = &stack0xfffffeda;
    while( true ) {
      *(undefined2 *)(puVar1 + -4) = 0x40;
      *(undefined2 **)(puVar1 + -8) = &DAT_000fbdca;
      __mac_toolbox(0xa970);
      if (puVar1[-8] == '\0') break;
      *(undefined4 *)(puVar1 + -10) = 0x436b2;
      CODE4_00e4();
      puVar1 = puVar1 + -6;
    }
    *(undefined4 **)(puVar1 + -10) = &local_11a;
    __mac_toolbox(0xa874);
    *(undefined4 *)(puVar1 + -0xe) = in_stack_0000000a;
    *(undefined1 **)(puVar1 + -0x12) = auStack_114;
    __mac_toolbox(0xa919);
    *(undefined1 **)(puVar1 + -0x16) = auStack_114;
    *(undefined **)(puVar1 + -0x1a) = &DAT_00043738;
    *(undefined **)(puVar1 + -0x1e) = &DAT_00043736;
    *(undefined **)(puVar1 + -0x22) = &DAT_00043734;
    __mac_toolbox(0xa98b);
    *(undefined2 *)(puVar1 + -0x26) = in_stack_00000004;
    *(undefined4 *)(puVar1 + -0x2a) = 0;
    __mac_toolbox(0xa985);
    *(undefined4 *)(puVar1 + -0x2c) = local_11a;
    __mac_toolbox(0xa873);
    DAT_000fbdb8 = 0;
    if (*(int *)(puVar1 + -0x2a) == 1) {
      *(undefined4 *)(puVar1 + -0x32) = in_stack_0000000a;
      *(long **)(puVar1 + -0x36) = in_stack_00000006;
      puVar1[-0x38] = *(char *)(*in_stack_00000006 + 0x14) == '\0';
      *(undefined4 *)(puVar1 + -0x3c) = 0x43712;
      CODE4_3572();
      bVar2 = puVar1[-0x2e];
    }
    else if (*(int *)(puVar1 + -0x2a) == 3) {
      bVar2 = 0;
    }
  }
  return bVar2;
}



/* CODE 4 + 0x373a, synthetic address 0x0004373a */

/* Original CODE 4 resource offset 0x373a (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

ulong CODE4_373a(void)

{
  undefined4 uVar1;
  undefined2 uVar2;
  long lVar3;
  undefined1 *puVar4;
  ulong uVar5;
  byte bVar6;
  undefined4 *puVar7;
  byte *pbVar8;
  undefined1 auStack_a0 [64];
  undefined2 uStack_60;
  undefined4 local_5e;
  undefined2 uStack_5a;
  undefined4 local_58;
  undefined2 uStack_54;
  undefined4 local_52;
  undefined2 uStack_4e;
  undefined4 local_4c;
  undefined2 uStack_48;
  undefined4 local_46;
  undefined2 local_42;
  undefined4 uStack_40;
  undefined2 local_3c;
  undefined4 uStack_3a;
  undefined2 uStack_36;
  undefined2 uStack_34;
  undefined2 local_32;
  undefined2 local_30;
  undefined2 uStack_2e;
  byte local_2c;
  undefined1 uStack_2b;
  
  pbVar8 = &stack0xffffffd6;
  bVar6 = 0;
  __mac_toolbox(0xa924);
  if (CONCAT31(CONCAT21(uStack_2e,local_2c),uStack_2b) == DAT_000fbe2a) {
    uStack_2e = (undefined2)((ulong)DAT_000fbe2a >> 0x10);
    uVar2 = uStack_2e;
    if (DAT_000fbdb6 == '\x01') {
      uStack_2e = (undefined2)DAT_000fbe2a;
      uStack_34 = (undefined2)((ulong)DAT_000fc030 >> 0x10);
      local_32 = (undefined2)DAT_000fc030;
      uStack_36 = 0x82;
      uStack_3a = 0x4379c;
      local_30 = uVar2;
      local_2c = CODE4_367c();
      if (local_2c != 0) {
        uVar1 = *DAT_000fbdc6;
        uStack_2e = (undefined2)((ulong)uVar1 >> 0x10);
        local_2c = (byte)((ulong)uVar1 >> 8);
        uStack_2b = (undefined1)uVar1;
        __mac_toolbox(0xa851);
        local_32 = (undefined2)((ulong)DAT_000fbe2a >> 0x10);
        local_30 = (undefined2)DAT_000fbe2a;
        uStack_36 = 4;
        uStack_34 = 0x37b0;
        CODE4_32b4();
        uStack_36 = (undefined2)((ulong)DAT_000fbe2a >> 0x10);
        uStack_34 = (undefined2)DAT_000fbe2a;
        uStack_3a = 0x437b8;
        CODE4_1e2a();
        DAT_000fbe2a = 0;
        DAT_000fc030 = 0;
        uStack_3a = DAT_000fbdfa;
        local_3c = 1;
        __mac_toolbox(0xa939);
        uStack_40 = DAT_000fbdfa;
        local_42 = 2;
        __mac_toolbox(0xa939);
        local_46 = DAT_000fbdfa;
        uStack_48 = 4;
        __mac_toolbox(0xa93a);
        local_4c = DAT_000fbdfa;
        uStack_4e = 5;
        __mac_toolbox(0xa93a);
        local_52 = DAT_000fbdfa;
        uStack_54 = 6;
        __mac_toolbox(0xa93a);
        local_58 = DAT_000fbdfa;
        uStack_5a = 10;
        __mac_toolbox(0xa93a);
        local_5e = DAT_000fbe0e;
        pbVar8 = (byte *)&uStack_60;
        uStack_60 = 7;
        __mac_toolbox(0xa93a);
        __mac_toolbox(0xa850);
      }
    }
    else {
      pbVar8 = (byte *)&uStack_2e;
      local_2c = (byte)((ulong)DAT_000fbe2a >> 8);
      uStack_2b = (undefined1)DAT_000fbe2a;
      __mac_toolbox(0xa916);
      DAT_000fbe2a = 0;
      DAT_000fc030 = 0;
    }
  }
  else {
    __mac_toolbox(0xa924);
    lVar3 = CONCAT31(CONCAT21(uStack_2e,local_2c),uStack_2b);
    if (*(int *)(lVar3 + 0x6c) < 0) {
      uVar2 = *(undefined2 *)(lVar3 + 0x6c);
      pbVar8 = &local_2c;
      local_2c = (byte)((uint)uVar2 >> 8);
      uStack_2b = (undefined1)uVar2;
      __mac_toolbox(0xa9b7);
      bVar6 = 1;
    }
    else {
      pbVar8 = (byte *)&uStack_2e;
      __mac_toolbox(0xa916);
    }
  }
  if (DAT_000fbdf0 < 2) {
    *(undefined4 *)(pbVar8 + -4) = DAT_000fbe0e;
    *(undefined2 *)(pbVar8 + -6) = 1;
    __mac_toolbox(0xa93a);
    puVar4 = pbVar8 + -6;
    if (DAT_000fbdf2 < 2) {
      *(undefined4 *)(pbVar8 + -10) = DAT_000fbe12;
      *(undefined2 *)(pbVar8 + -0xc) = 1;
      __mac_toolbox(0xa93a);
      *(undefined4 *)(pbVar8 + -0x10) = DAT_000fbe12;
      *(undefined2 *)(pbVar8 + -0x12) = 2;
      __mac_toolbox(0xa93a);
      puVar4 = pbVar8 + -0x12;
    }
    pbVar8 = puVar4;
    if (DAT_000fbdf0 == 0) {
      *(undefined4 *)(pbVar8 + -4) = DAT_000fbe32;
      __mac_toolbox(0xa916);
      puVar7 = (undefined4 *)(pbVar8 + -8);
      pbVar8 = pbVar8 + -8;
      *puVar7 = DAT_000fbe36;
      __mac_toolbox(0xa916);
    }
  }
  __mac_toolbox(0xa924);
  uVar5 = (ulong)(bVar6 | *(long *)(pbVar8 + -4) == 0);
  if ((bVar6 | *(long *)(pbVar8 + -4) == 0) == 0) {
    __mac_toolbox(0xa924);
    uVar5 = *(ulong *)(pbVar8 + -4);
    if ((uVar5 != 0) && (*(int *)(uVar5 + 0x6c) < 0)) {
      *(undefined4 *)(pbVar8 + -4) = DAT_000fbdfe;
      *(undefined2 *)(pbVar8 + -6) = 0;
      __mac_toolbox(0xa939);
      *(undefined4 *)(pbVar8 + -10) = DAT_000fbe02;
      *(undefined2 *)(pbVar8 + -0xc) = 0;
      __mac_toolbox(0xa93a);
      *(undefined4 *)(pbVar8 + -0x10) = DAT_000fbe06;
      *(undefined2 *)(pbVar8 + -0x12) = 0;
      __mac_toolbox(0xa93a);
      *(undefined4 *)(pbVar8 + -0x16) = DAT_000fbe0a;
      *(undefined2 *)(pbVar8 + -0x18) = 0;
      __mac_toolbox(0xa93a);
      *(undefined4 *)(pbVar8 + -0x1c) = DAT_000fbe0e;
      *(undefined2 *)(pbVar8 + -0x1e) = 7;
      __mac_toolbox(0xa93a);
      *(undefined4 *)(pbVar8 + -0x22) = DAT_000fbe0e;
      *(undefined2 *)(pbVar8 + -0x24) = 0;
      pbVar8[-0x26] = 1 < DAT_000fbdf0;
      *(undefined4 *)(pbVar8 + -0x2a) = 0x438f2;
      uVar5 = CODE4_014c();
      __mac_toolbox(0xa937);
    }
  }
  else {
    *(undefined4 *)(pbVar8 + -4) = DAT_000fbdfe;
    *(undefined2 *)(pbVar8 + -6) = 0;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(pbVar8 + -10) = DAT_000fbe02;
    *(undefined2 *)(pbVar8 + -0xc) = 0;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(pbVar8 + -0x10) = DAT_000fbe06;
    *(undefined2 *)(pbVar8 + -0x12) = 0;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(pbVar8 + -0x16) = DAT_000fbe0a;
    *(undefined2 *)(pbVar8 + -0x18) = 0;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(pbVar8 + -0x1c) = DAT_000fbe12;
    *(undefined2 *)(pbVar8 + -0x1e) = 0xc;
    __mac_toolbox(0xa93a);
    __mac_toolbox(0xa924);
    if (*(long *)(pbVar8 + -0x22) == 0) {
      *(undefined4 *)(pbVar8 + -0x22) = DAT_000fbe0e;
      *(undefined2 *)(pbVar8 + -0x24) = 0;
      pbVar8[-0x26] = 1 < DAT_000fbdf0;
      *(undefined4 *)(pbVar8 + -0x2a) = 0x4389e;
      uVar5 = CODE4_014c();
    }
    __mac_toolbox(0xa937);
  }
  return uVar5;
}



/* CODE 4 + 0x38fc, synthetic address 0x000438fc */

/* Original CODE 4 resource offset 0x38fc (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_38fc(long *param_1,long param_2)

{
  long lVar1;
  undefined1 *puVar2;
  undefined1 *puVar3;
  undefined4 local_18 [5];
  
  __mac_toolbox(0xa850);
  puVar2 = &stack0xffffffda;
  while( true ) {
    *(undefined2 *)(puVar2 + -4) = 0x40;
    *(undefined2 **)(puVar2 + -8) = &DAT_000fbdca;
    __mac_toolbox(0xa970);
    if (puVar2[-8] == '\0') break;
    *(undefined4 *)(puVar2 + -10) = 0x43910;
    CODE4_00e4();
    puVar2 = puVar2 + -6;
  }
  *(long **)(puVar2 + -10) = param_1;
  __mac_toolbox(0xa029);
  lVar1 = *param_1;
  *(undefined4 **)(puVar2 + -10) = local_18;
  __mac_toolbox(0xa874);
  *(long *)(puVar2 + -0xe) = lVar1 + 0x14;
  *(undefined **)(puVar2 + -0x12) = &DAT_00043a06;
  *(undefined **)(puVar2 + -0x16) = &DAT_00043a04;
  *(undefined **)(puVar2 + -0x1a) = &DAT_00043a02;
  __mac_toolbox(0xa98b);
  *(undefined2 *)(puVar2 + -0x1e) = 0x8a;
  *(undefined4 *)(puVar2 + -0x22) = 0;
  __mac_toolbox(0xa985);
  puVar3 = puVar2 + -0x24;
  *(undefined4 *)(puVar2 + -0x24) = local_18[0];
  __mac_toolbox(0xa873);
  if (*(int *)(puVar2 + -0x22) == 1) {
    *(long *)(puVar2 + -0x2a) = lVar1 + 0x14;
    *(undefined2 *)(puVar2 + -0x2c) = *(undefined2 *)(lVar1 + 0x114);
    *(undefined4 *)(puVar2 + -0x30) = 0x43968;
    CODE4_2f0c();
    puVar3 = puVar2 + -0x24;
    if (puVar2[-0x26] != '\0') {
      *(undefined4 *)(puVar2 + -0x28) = *DAT_000fbdc6;
      __mac_toolbox(0xa851);
      *(undefined4 *)(puVar2 + -0x2c) = *(undefined4 *)(lVar1 + 2);
      __mac_toolbox(0xa9d9);
      *(undefined4 *)(puVar2 + -0x30) = *(undefined4 *)(**(long **)(lVar1 + 2) + 0x3e);
      __mac_toolbox(0xa023);
      *(undefined4 *)(**(long **)(lVar1 + 2) + 0x3e) = DAT_000fbdde;
      *(undefined4 *)(puVar2 + -0x34) = DAT_000fbdde;
      *(undefined4 *)(puVar2 + -0x38) = 0x439a0;
      JT_CODE1_0544();
      *(undefined2 *)(**(long **)(lVar1 + 2) + 0x3c) = *(undefined2 *)(puVar2 + -0x32);
      *(undefined4 *)(puVar2 + -0x34) = *(undefined4 *)(lVar1 + 2);
      __mac_toolbox(0xa9d0);
      *(long **)(puVar2 + -0x38) = param_1;
      *(undefined4 *)(puVar2 + -0x3c) = 0x439b8;
      CODE4_181c();
      *(undefined4 *)(puVar2 + -0x3c) = 0;
      *(undefined4 *)(puVar2 + -0x40) = 0;
      *(undefined4 *)(puVar2 + -0x44) = *(undefined4 *)(lVar1 + 2);
      __mac_toolbox(0xa9d1);
      *(long *)(puVar2 + -0x48) = param_2 + 0x10;
      __mac_toolbox(0xa928);
      *(long **)(puVar2 + -0x4c) = param_1;
      *(undefined4 *)(puVar2 + -0x50) = 0x439d2;
      CODE4_1ac4();
      *(undefined1 *)(lVar1 + 10) = 0;
      *(undefined1 *)(lVar1 + 0x11a) = 0;
      *(undefined4 *)(puVar2 + -0x50) = DAT_000fbdfa;
      *(undefined2 *)(puVar2 + -0x52) = 5;
      __mac_toolbox(0xa93a);
      *(undefined4 *)(puVar2 + -0x56) = DAT_000fbdfa;
      puVar3 = puVar2 + -0x58;
      *(undefined2 *)(puVar2 + -0x58) = 7;
      __mac_toolbox(0xa93a);
      __mac_toolbox(0xa850);
    }
  }
  *(long **)(puVar3 + -4) = param_1;
  __mac_toolbox(0xa02a);
  return;
}



/* CODE 4 + 0x3a08, synthetic address 0x00043a08 */

/* Original CODE 4 resource offset 0x3a08 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_3a08(undefined2 param_1)

{
  byte bVar1;
  byte bVar2;
  int iVar3;
  undefined1 *puVar4;
  undefined1 *puVar5;
  undefined4 uStack_40;
  undefined2 local_3c;
  undefined4 local_3a;
  undefined4 uStack_34;
  
  bVar2 = 1;
  puVar5 = &stack0xffffffd4;
  for (iVar3 = 1; bVar1 = bVar2 & -(iVar3 < 6), bVar1 != 0; iVar3 = iVar3 + 1) {
    puVar4 = puVar5;
    if (*(char *)((long)(iVar3 * 0xa6 + -0x406a) + 0x100000) != '\0') {
      puVar4 = puVar5 + -4;
      *(long *)(puVar5 + -8) = (long)(iVar3 * 0xa6 + -0x4068) + 0x100000;
      __mac_toolbox(0xa917);
      *(undefined **)(puVar5 + -10) = &DAT_000fbf98 + iVar3 * 0xa6;
      *(undefined4 *)(puVar5 + -0xe) = *(undefined4 *)(puVar5 + -8);
      *(undefined2 *)(puVar5 + -0x10) = param_1;
      *(undefined4 *)(puVar5 + -0x14) = 0x43a54;
      CODE4_367c();
      bVar2 = puVar5[-6];
    }
    puVar5 = puVar4;
  }
  DAT_000fbdb5 = bVar2;
  return bVar1;
}



/* CODE 4 + 0x3a72, synthetic address 0x00043a72 */

/* Original CODE 4 resource offset 0x3a72 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_3a72(void)

{
  if (DAT_000fbde2 != 0) {
    __mac_toolbox(0xa023);
    DAT_000fbde2 = 0;
  }
  return;
}



/* CODE 4 + 0x3a8e, synthetic address 0x00043a8e */

void FUN_00043a8e(void)

{
  JT_CODE1_099e();
  return;
}



/* CODE 4 + 0x3a98, synthetic address 0x00043a98 */

/* Original CODE 4 resource offset 0x3a98 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_3a98(void)

{
  __mac_toolbox(0xa9fc);
  JT_CODE1_09f4();
  return;
}



/* CODE 4 + 0x3ab4, synthetic address 0x00043ab4 */

/* Original CODE 4 resource offset 0x3ab4 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_3ab4(void)

{
  byte bVar1;
  long local_26;
  
  __mac_toolbox(0xa924);
  bVar1 = -(DAT_000fbe2a == 0) | -(local_26 == 0);
  if (bVar1 != 0) {
    CODE4_014c();
    __mac_toolbox(0xa93a);
    __mac_toolbox(0xa93a);
    __mac_toolbox(0xa93a);
    __mac_toolbox(0xa93a);
    CODE4_014c();
    CODE4_014c();
    CODE4_014c();
    CODE4_014c();
    CODE4_014c();
    __mac_toolbox(0xa93a);
    bVar1 = CODE4_014c();
  }
  return bVar1;
}



/* CODE 4 + 0x3b88, synthetic address 0x00043b88 */

/* Original CODE 4 resource offset 0x3b88 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_3b88(undefined2 param_1)

{
  long lVar1;
  long *plVar2;
  byte bVar3;
  undefined2 uStack_46;
  long lStack_3c;
  
  __mac_toolbox(0xa9f9);
  bVar3 = param_1._0_1_ | DAT_000fbdf4 != *(int *)(lStack_3c + 8);
  if (bVar3 != 0) {
    DAT_000fbdf4 = *(int *)(lStack_3c + 8);
    FUN_00043a8e();
    plVar2 = DAT_000fbe2e;
    bVar3 = *(byte *)((long)DAT_000fbe2e + 0x6e) | param_1._0_1_;
    if (bVar3 != 0) {
      __mac_toolbox(0xa874);
      __mac_toolbox(0xa873);
      __mac_toolbox(0xa917);
      __mac_toolbox(0xa029);
      lVar1 = *DAT_000fbe2e;
      bVar3 = JT_CODE1_0992();
      uStack_46 = SUB42(plVar2,0);
      *(undefined2 *)(**(long **)(lVar1 + 2) + 0x3c) = uStack_46;
      __mac_toolbox(0xa9d0);
      __mac_toolbox(0xa928);
      __mac_toolbox(0xa02a);
      __mac_toolbox(0xa873);
    }
  }
  return bVar3;
}



/* CODE 4 + 0x3c1c, synthetic address 0x00043c1c */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x3c1c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

long CODE4_3c1c(void)

{
  char cVar1;
  undefined4 *unaff_A3;
  undefined4 uStack_2e;
  
  __mac_toolbox(0xa924);
  cVar1 = '\0';
  while ((byte)(cVar1 - 1U & -(uStack_2e != 0)) != 0) {
    unaff_A3 = *(undefined4 **)(uStack_2e + 0x98);
    if (*(char *)*unaff_A3 == '\0') {
      cVar1 = '\x01';
    }
    else {
      uStack_2e = *(long *)(uStack_2e + 0x90);
    }
  }
  if (cVar1 == '\0') {
    unaff_A3 = (undefined4 *)0x0;
  }
  return (long)unaff_A3;
}



/* CODE 4 + 0x3c62, synthetic address 0x00043c62 */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x3c62 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE4_3c62(void)

{
  bool bVar1;
  int in_stack_00000004;
  
  bVar1 = in_stack_00000004 == 0;
  JT_CODE1_03a2(&DAT_00043c90);
  if (!bVar1) {
    in_stack_00000004 = in_stack_00000004 + -0x20;
  }
  return in_stack_00000004;
}



/* CODE 4 + 0x3cb0, synthetic address 0x00043cb0 */

/* Original CODE 4 resource offset 0x3cb0 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_3cb0(undefined4 *param_1,undefined4 param_2)

{
  int iVar1;
  byte *pbVar2;
  bool bVar3;
  byte abStackY_8114 [32750];
  short sVar4;
  byte local_114 [272];
  
  iVar1 = 0x3f;
  pbVar2 = local_114;
  do {
    *(undefined4 *)pbVar2 = *param_1;
    iVar1 = iVar1 + -1;
    param_1 = param_1 + 1;
    pbVar2 = pbVar2 + 4;
  } while (iVar1 != -1);
  iVar1 = 1;
  do {
    if ((int)(uint)local_114[0] < iVar1) break;
    sVar4 = CODE4_3c62();
    local_114[iVar1] = (byte)sVar4;
    bVar3 = SCARRY2(iVar1,1);
    iVar1 = iVar1 + 1;
  } while (!bVar3);
  JT_CODE1_03e2((int)((ulong)param_2 >> 0x10),(int)param_2,local_114,0xff);
  return;
}



/* CODE 4 + 0x3d14, synthetic address 0x00043d14 */

/* WARNING: Unknown calling convention */
/* Original CODE 4 resource offset 0x3d14 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_3d14(void)

{
  long lVar1;
  long lVar2;
  undefined3 extraout_var;
  undefined3 extraout_var_00;
  undefined3 uVar3;
  uint uVar4;
  uint uVar5;
  int unaff_D5w;
  byte unaff_D6b;
  int unaff_D7w;
  undefined4 *puVar6;
  undefined1 *puVar7;
  bool bVar8;
  char in_stack_00000004;
  long *in_stack_00000006;
  byte abStack_811e [32464];
  undefined4 local_24e;
  undefined1 auStack_22a [260];
  long *local_126;
  char local_11f;
  byte local_11e [256];
  int local_1e;
  uint local_1c;
  
  puVar6 = (undefined4 *)&stack0xfffffdb6;
  if (in_stack_00000004 != '\0') {
    local_24e = *DAT_000fbdc6;
    puVar6 = &local_24e;
    __mac_toolbox(0xa851);
  }
  puVar7 = (undefined1 *)puVar6;
  if (in_stack_00000006 != (long *)0x0) {
    *(long **)((long)puVar6 + -4) = in_stack_00000006;
    __mac_toolbox(0xa029);
    lVar1 = *in_stack_00000006;
    *(undefined4 *)((long)puVar6 + -4) = *(undefined4 *)(**(long **)(lVar1 + 2) + 0x3e);
    __mac_toolbox(0xa029);
    unaff_D6b = 0;
    *(undefined1 **)((long)puVar6 + -4) = auStack_22a;
    *(long *)((long)puVar6 + -8) = *DAT_000fc02a + 2;
    *(undefined4 *)((long)puVar6 + -0xc) = 0x43d5e;
    CODE4_3cb0();
    *(undefined2 *)((long)puVar6 + -6) = 0xff;
    *(undefined1 **)((long)puVar6 + -10) = auStack_22a;
    puVar7 = (undefined1 *)((long)puVar6 + -0xe);
    *(byte **)((long)puVar6 + -0xe) = local_11e;
    *(undefined4 *)((long)puVar6 + -0x12) = 0x43d70;
    JT_CODE1_03e2();
    local_1c = (uint)local_11e[0];
    local_126 = *(long **)(**(long **)(lVar1 + 2) + 0x3e);
    lVar2 = *local_126;
    local_1e = *(int *)(**(long **)(lVar1 + 2) + 0x3c);
    if (*(char *)(*DAT_000fc02a + 0x203) == '\0') {
      unaff_D7w = *(int *)(**(long **)(lVar1 + 2) + 0x20);
    }
    else {
      unaff_D7w = *(int *)(**(long **)(lVar1 + 2) + 0x20) + 1;
      puVar7 = (undefined1 *)((long)puVar6 + -0xe);
    }
    while ((byte)(unaff_D6b - 1 & -(unaff_D7w <= local_1e)) != 0) {
      if (unaff_D7w % 0xfa == 0) {
        __mac_toolbox(0xa9b4);
      }
      *(uint *)(puVar7 + -4) = (uint)*(byte *)(lVar2 + unaff_D7w);
      *(undefined4 *)(puVar7 + -8) = 0x43de0;
      CODE4_3c62();
      if ((uint)local_11e[1] == *(uint *)(puVar7 + -2)) {
        uVar3 = 0;
        if (*(char *)(*DAT_000fc02a + 0x202) == '\x01') {
          if (unaff_D7w < 2) {
            bVar8 = true;
          }
          else {
            uVar4 = (uint)*(byte *)(lVar2 + (unaff_D7w + -1));
            *(uint *)(puVar7 + -2) = uVar4;
            bVar8 = uVar4 == 0;
            *(undefined **)(puVar7 + -6) = &DAT_00043fb0;
            *(undefined4 *)(puVar7 + -10) = 0x43e1c;
            JT_CODE1_03a2();
            uVar3 = extraout_var;
            if (bVar8) {
              bVar8 = true;
              puVar7 = puVar7 + -6;
            }
            else {
              bVar8 = false;
              puVar7 = puVar7 + -6;
            }
          }
        }
        else {
          bVar8 = true;
        }
        if (bVar8) {
          uVar4 = 1;
          local_11f = '\0';
          unaff_D5w = unaff_D7w;
          while( true ) {
            *(ulong *)(puVar7 + -4) = CONCAT31(uVar3,-(unaff_D5w <= local_1e));
            *(uint *)(puVar7 + -8) = (uint)*(byte *)(lVar2 + unaff_D5w);
            *(undefined4 *)(puVar7 + -0xc) = 0x43e94;
            CODE4_3c62();
            uVar3 = (undefined3)((ulong)*(undefined4 *)(puVar7 + -4) >> 8);
            if ((byte)(local_11f - 1U &
                      unaff_D6b - 1 &
                      -(*(uint *)(puVar7 + -6) == (uint)local_11e[(int)uVar4]) &
                      (byte)*(undefined4 *)(puVar7 + -4)) == 0) break;
            if (uVar4 == local_1c) {
              if (*(char *)(*DAT_000fc02a + 0x202) == '\x01') {
                if (unaff_D5w < local_1e) {
                  uVar5 = (uint)*(byte *)(lVar2 + (unaff_D5w + 1));
                  *(uint *)(puVar7 + -2) = uVar5;
                  bVar8 = uVar5 == 0;
                  *(undefined **)(puVar7 + -6) = &DAT_00043f90;
                  *(undefined4 *)(puVar7 + -10) = 0x43e6a;
                  JT_CODE1_03a2();
                  if (bVar8) {
                    unaff_D6b = 1;
                    puVar7 = puVar7 + -6;
                    uVar3 = extraout_var_00;
                  }
                  else {
                    unaff_D6b = 0;
                    local_11f = '\x01';
                    puVar7 = puVar7 + -6;
                    uVar3 = extraout_var_00;
                  }
                }
                else {
                  unaff_D6b = 1;
                }
              }
              else {
                unaff_D6b = 1;
              }
            }
            else {
              unaff_D5w = unaff_D5w + 1;
              uVar4 = uVar4 + 1;
            }
          }
          if (unaff_D6b != 1) {
            unaff_D7w = unaff_D7w + 1;
          }
        }
        else {
          unaff_D7w = unaff_D7w + 1;
        }
      }
      else {
        unaff_D7w = unaff_D7w + 1;
      }
    }
    *(undefined4 *)(puVar7 + -4) = *(undefined4 *)(**(long **)(lVar1 + 2) + 0x3e);
    __mac_toolbox(0xa02a);
    *(long **)(puVar7 + -4) = in_stack_00000006;
    __mac_toolbox(0xa02a);
  }
  if (unaff_D6b == 0) {
    if (in_stack_00000004 != '\0') {
      *(undefined1 **)(puVar7 + -4) = auStack_22a;
      *(undefined **)(puVar7 + -8) = &DAT_00043f8e;
      *(long *)(puVar7 + -0xc) = *DAT_000fc02a + 2;
      *(undefined **)(puVar7 + -0x10) = &DAT_00043f72;
      *(undefined2 *)(puVar7 + -0x12) = 3;
      *(undefined4 *)(puVar7 + -0x16) = 0x43f50;
      JT_CODE1_0004();
      *(undefined1 **)(puVar7 + -0x12) = auStack_22a;
      *(undefined4 *)(puVar7 + -0x16) = 0x43f5a;
      CODE4_0ae6();
    }
  }
  else {
    *(undefined4 *)(puVar7 + -4) = *(undefined4 *)(*in_stack_00000006 + 2);
    __mac_toolbox(0xa9d9);
    *(int *)(**(long **)(*in_stack_00000006 + 2) + 0x20) = unaff_D7w;
    *(int *)(**(long **)(*in_stack_00000006 + 2) + 0x22) = unaff_D5w + 1;
    if (in_stack_00000004 != '\0') {
      *(undefined4 *)(puVar7 + -8) = *(undefined4 *)(*in_stack_00000006 + 2);
      __mac_toolbox(0xa9d8);
      *(long **)(puVar7 + -0xc) = in_stack_00000006;
      *(undefined4 *)(puVar7 + -0x10) = 0x43f2a;
      CODE4_1ac4();
    }
  }
  if (in_stack_00000004 != '\0') {
    __mac_toolbox(0xa850);
  }
  return unaff_D6b;
}



/* CODE 4 + 0x3fd0, synthetic address 0x00043fd0 */

/* Original CODE 4 resource offset 0x3fd0 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_3fd0(long *param_1)

{
  long lVar1;
  byte bVar2;
  int iVar3;
  bool bVar4;
  undefined1 auStack_8115 [32747];
  undefined1 auStack_115 [273];
  
  lVar1 = *DAT_000fc02a;
  bVar2 = *(byte *)(lVar1 + 0x102);
  iVar3 = 1;
  do {
    if ((int)(uint)bVar2 < iVar3) break;
    auStack_115[iVar3] = *(undefined1 *)(lVar1 + 0x102 + (long)iVar3);
    bVar4 = SCARRY2(iVar3,1);
    iVar3 = iVar3 + 1;
  } while (!bVar4);
  __mac_toolbox(0xa9d7);
  __mac_toolbox(0xa9de);
  *(undefined1 *)(*param_1 + 10) = 1;
  *(undefined1 *)(lVar1 + 0x203) = 0;
  return;
}



/* CODE 4 + 0x4044, synthetic address 0x00044044 */

/* Original CODE 4 resource offset 0x4044 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_4044(int param_1)

{
  if (param_1 == 1) {
    JT_CODE5_0376();
  }
  else {
    __mac_toolbox(0xa946);
    __mac_toolbox(0xa9b6);
    __mac_toolbox(0xa93a);
    __mac_toolbox(0xa939);
    __mac_toolbox(0xa939);
    __mac_toolbox(0xa93a);
    __mac_toolbox(0xa93a);
    __mac_toolbox(0xa93a);
    __mac_toolbox(0xa93a);
    __mac_toolbox(0xa93a);
    __mac_toolbox(0xa93a);
    __mac_toolbox(0xa93a);
    CODE4_014c();
    __mac_toolbox(0xa937);
  }
  return;
}



/* CODE 4 + 0x40ee, synthetic address 0x000440ee */

/* Original CODE 4 resource offset 0x40ee (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_40ee(undefined2 param_1)

{
  switch(param_1) {
  case 1:
    CODE4_33aa(0,4,0x41bc);
    break;
  case 2:
    CODE4_33aa(0,4,0x41ba);
    break;
  case 4:
    CODE4_373a();
    break;
  case 5:
    CODE4_3572();
    break;
  case 6:
    CODE4_3572();
    break;
  case 7:
    CODE4_38fc((int)((ulong)DAT_000fc030 >> 0x10),(int)DAT_000fc030,
               (int)((ulong)DAT_000fbe2a >> 0x10),(char)DAT_000fbe2a);
    break;
  case 9:
    JT_CODE5_0cb0();
    break;
  case 10:
    __mac_toolbox(0xa9f1);
    JT_CODE5_0958();
    break;
  case 0xc:
    CODE4_3a08(0x82);
  }
  return;
}



/* CODE 4 + 0x41be, synthetic address 0x000441be */

/* Original CODE 4 resource offset 0x41be (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

undefined4 CODE4_41be(int param_1)

{
  long lVar1;
  int iVar2;
  long lVar3;
  undefined4 in_D0;
  undefined4 uVar4;
  undefined4 *puVar5;
  char *pcVar6;
  undefined1 *puVar7;
  undefined4 local_3a;
  undefined1 local_36;
  undefined2 local_34;
  undefined2 uStack_32;
  undefined2 local_30;
  char cStack_2e;
  undefined1 uStack_2d;
  undefined2 local_2c;
  undefined4 local_2a;
  undefined1 auStack_26 [2];
  
  pcVar6 = auStack_26;
  iVar2 = param_1 + -1;
  local_2a = CONCAT22(local_2a._0_2_,iVar2);
  lVar3 = local_2a;
  __mac_toolbox(0xa9c2);
  local_2a._2_1_ = (char)((uint)iVar2 >> 8);
  uVar4 = CONCAT31((int3)(CONCAT22((int)((ulong)in_D0 >> 0x10),iVar2) >> 8),local_2a._2_1_ + -1);
  if ((char)(local_2a._2_1_ + -1) != '\0') {
    lVar1 = *DAT_000fc030;
    local_2a = lVar3;
    switch(param_1) {
    case 3:
      if (DAT_000fbdb7 == '\0') {
        *(undefined1 *)(lVar1 + 10) = 1;
        *(undefined1 *)(lVar1 + 0x11a) = 0;
        local_2a = DAT_000fbdfa;
        local_2c._0_1_ = 0;
        local_2c._1_1_ = 5;
        cStack_2e = *(char *)(lVar1 + 0x14) != '\0';
        uStack_32 = 4;
        local_30 = 0x4218;
        CODE4_014c();
        uStack_32 = (undefined2)((ulong)DAT_000fbdfa >> 0x10);
        local_30 = (undefined2)DAT_000fbdfa;
        local_34 = 7;
        local_36 = *(char *)(lVar1 + 0x14) != '\0';
        local_3a = 0x4422e;
        CODE4_014c();
        local_3a = *(undefined4 *)(lVar1 + 2);
        puVar5 = &local_3a;
        __mac_toolbox(0xa9d6);
      }
      else {
        puVar5 = &local_2a;
        local_2a = DAT_000fbe2a;
        cStack_2e = '\0';
        uStack_2d = 4;
        local_2c._0_1_ = 0x41;
        local_2c._1_1_ = 0xf6;
        JT_CODE1_0968();
      }
      *(undefined4 *)((long)puVar5 + -4) = 0x44238;
      CODE4_3a98();
      pcVar6 = (char *)((long)puVar5 + -2);
      *(undefined1 *)((long)puVar5 + -2) = 1;
      *(undefined4 *)((long)puVar5 + -6) = 0x44240;
      CODE4_3b88();
      break;
    case 4:
      if (DAT_000fbdb7 == '\0') {
        local_2a = *(long *)(lVar1 + 2);
        __mac_toolbox(0xa9d5);
      }
      else {
        local_2a = DAT_000fbe2a;
        cStack_2e = '\0';
        uStack_2d = 4;
        local_2c._0_1_ = 0x42;
        local_2c._1_1_ = 0x52;
        JT_CODE1_096e();
      }
      cStack_2e = '\0';
      uStack_2d = 4;
      local_2c._0_1_ = 0x42;
      local_2c._1_1_ = 0x5e;
      CODE4_3a98();
      pcVar6 = (char *)&local_2c;
      local_2c._0_1_ = 1;
      local_30 = 4;
      cStack_2e = 'B';
      uStack_2d = 0x66;
      CODE4_3b88();
      break;
    case 5:
      if (DAT_000fbdb7 == '\0') {
        local_2a = **(long **)(lVar1 + 2);
        uStack_32 = 4;
        local_30 = 0x42ba;
        JT_CODE1_0992();
        if (CONCAT31(CONCAT21(CONCAT11(cStack_2e,uStack_2d),local_2c._0_1_),(undefined1)local_2c) +
            (long)*(int *)(local_2a + 0x3c) < 0x8000) {
          *(undefined1 *)(lVar1 + 10) = 1;
          *(undefined1 *)(lVar1 + 0x11a) = 0;
          local_2a = DAT_000fbdfa;
          local_2c._0_1_ = 0;
          local_2c._1_1_ = 5;
          cStack_2e = *(char *)(lVar1 + 0x14) != '\0';
          uStack_32 = 4;
          local_30 = 0x42f8;
          CODE4_014c();
          uStack_32 = (undefined2)((ulong)DAT_000fbdfa >> 0x10);
          local_30 = (undefined2)DAT_000fbdfa;
          local_34 = 7;
          local_36 = *(char *)(lVar1 + 0x14) != '\0';
          local_3a = 0x4430e;
          CODE4_014c();
          local_3a = *(undefined4 *)(lVar1 + 2);
          pcVar6 = (char *)&local_3a;
          __mac_toolbox(0xa9db);
        }
        else {
          pcVar6 = (char *)((long)&local_2a + 2);
          local_2a = CONCAT22(local_2a._0_2_,5);
          __mac_toolbox(0xa9c8);
        }
      }
      else {
        local_2a = **(long **)(DAT_000fbe2a + 0xa0);
        uStack_32 = 4;
        local_30 = 0x4282;
        JT_CODE1_0992();
        if (CONCAT31(CONCAT21(CONCAT11(cStack_2e,uStack_2d),local_2c._0_1_),(undefined1)local_2c) +
            (long)*(int *)(local_2a + 0x3c) < 0x100) {
          pcVar6 = (char *)&local_2a;
          local_2a = DAT_000fbe2a;
          cStack_2e = '\0';
          uStack_2d = 4;
          local_2c._0_1_ = 0x42;
          local_2c._1_1_ = 0xa8;
          JT_CODE1_0960();
        }
        else {
          pcVar6 = (char *)((long)&local_2a + 2);
          local_2a = CONCAT22(local_2a._0_2_,5);
          __mac_toolbox(0xa9c8);
        }
      }
      break;
    case 6:
      if (DAT_000fbdb7 == '\0') {
        *(undefined1 *)(lVar1 + 10) = 1;
        *(undefined1 *)(lVar1 + 0x11a) = 0;
        local_2a = DAT_000fbdfa;
        local_2c._0_1_ = 0;
        local_2c._1_1_ = 5;
        cStack_2e = *(char *)(lVar1 + 0x14) != '\0';
        uStack_32 = 4;
        local_30 = 0x434a;
        CODE4_014c();
        uStack_32 = (undefined2)((ulong)DAT_000fbdfa >> 0x10);
        local_30 = (undefined2)DAT_000fbdfa;
        local_34 = 7;
        local_36 = *(char *)(lVar1 + 0x14) != '\0';
        local_3a = 0x44360;
        CODE4_014c();
        local_3a = *(undefined4 *)(lVar1 + 2);
        pcVar6 = (char *)&local_3a;
        __mac_toolbox(0xa9d7);
      }
      else {
        pcVar6 = (char *)&local_2a;
        local_2a = DAT_000fbe2a;
        cStack_2e = '\0';
        uStack_2d = 4;
        local_2c._0_1_ = 0x43;
        local_2c._1_1_ = 0x26;
        JT_CODE1_0974();
      }
      break;
    case 7:
      if (DAT_000fbdb7 == '\0') {
        local_2a = 0;
        cStack_2e = '\0';
        uStack_2d = 0;
        local_2c = 0x7fff;
        pcVar6 = (char *)&uStack_32;
        uStack_32 = (undefined2)((ulong)*(undefined4 *)(lVar1 + 2) >> 0x10);
        local_30 = (undefined2)*(undefined4 *)(lVar1 + 2);
        __mac_toolbox(0xa9d1);
      }
      else {
        local_2a = DAT_000fbe2a;
        local_2c = *(int *)(DAT_000fbe2a + 0xa4) + 1;
        cStack_2e = '\0';
        uStack_2d = 0;
        pcVar6 = (char *)&local_30;
        local_30 = 0x7fff;
        __mac_toolbox(0xa97e);
      }
      break;
    case 9:
      local_2a = *(long *)(*DAT_000fc030 + 2);
      pcVar6 = (char *)&local_2c;
      local_2c._0_1_ = 0;
      local_2c._1_1_ = 0x20;
      local_30 = 4;
      cStack_2e = 'C';
      uStack_2d = 0xb0;
      CODE4_0622();
      break;
    case 10:
      local_2a = *(long *)(*DAT_000fc030 + 2);
      pcVar6 = (char *)&local_2c;
      local_2c._0_1_ = 0;
      local_2c._1_1_ = 0x20;
      local_30 = 4;
      cStack_2e = 'C';
      uStack_2d = 0xc6;
      CODE4_0714();
      break;
    case 0xc:
      local_2a = *(long *)(*DAT_000fc030 + 2);
      pcVar6 = (char *)&local_2c;
      local_2c._0_1_ = 0;
      local_2c._1_1_ = 0x3b;
      local_30 = 4;
      cStack_2e = 'C';
      uStack_2d = 0xdc;
      CODE4_0714();
      break;
    case 0xd:
      local_2a = *(long *)(*DAT_000fc030 + 2);
      pcVar6 = (char *)&local_2c;
      local_2c._0_1_ = 0;
      local_2c._1_1_ = 0x3b;
      local_30 = 4;
      cStack_2e = 'C';
      uStack_2d = 0xf0;
      CODE4_0622();
      break;
    case 0xf:
      DAT_000fbdb9 = -(DAT_000fbdb9 + -1);
      local_2a = DAT_000fbdfe;
      local_2c = 0xf;
      pcVar6 = &cStack_2e;
      __mac_toolbox(0xa945);
      cStack_2e = DAT_000fbdb9;
    }
    puVar7 = pcVar6;
    if (param_1 != 0xf) {
      if (DAT_000fbdb7 == '\x01') {
        puVar7 = pcVar6 + -4;
        *(long *)(pcVar6 + -4) = DAT_000fbe2a;
        *(undefined4 *)(pcVar6 + -8) = 0x4445a;
        CODE4_0174();
      }
      else {
        puVar7 = pcVar6 + -4;
        *(long **)(pcVar6 + -4) = DAT_000fc030;
        *(undefined4 *)(pcVar6 + -8) = 0x44450;
        CODE4_1ac4();
      }
    }
    *(undefined4 *)(puVar7 + -4) = 0x4445e;
    uVar4 = CODE4_0294();
  }
  return uVar4;
}



/* CODE 4 + 0x446a, synthetic address 0x0004446a */

/* Original CODE 4 resource offset 0x446a (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_446a(int param_1)

{
  undefined1 *puVar1;
  long lVar2;
  undefined4 *puVar3;
  undefined4 *puVar4;
  byte local_a8 [30];
  undefined2 local_8a;
  undefined4 local_88;
  undefined2 local_84;
  undefined4 local_82;
  undefined1 *puStack_7e;
  undefined4 local_7a;
  undefined1 *puStack_76;
  undefined1 *puStack_72;
  undefined1 *puStack_6e;
  undefined2 local_6a;
  long local_68;
  undefined1 *puStack_64;
  undefined1 *puStack_60;
  undefined1 *puStack_5c;
  undefined2 local_58;
  long local_56;
  undefined1 *puStack_52;
  undefined1 *puStack_4e;
  undefined1 *puStack_4a;
  undefined2 local_46;
  long local_44;
  undefined4 uStack_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  undefined2 uStack_34;
  undefined1 local_32;
  undefined1 uStack_31;
  undefined2 uStack_30;
  undefined4 local_2e;
  undefined1 auStack_1e [8];
  undefined1 auStack_16 [18];
  
  if (param_1 == 1) {
    puVar3 = &local_2e;
    local_2e = (long *)DAT_000fbe36;
    __mac_toolbox(0xa916);
    if (*(char *)(DAT_000fbe32 + 0x6e) != '\x01') {
      __mac_toolbox(0xa029);
      puVar1 = (undefined1 *)*DAT_000fc02a;
      *puVar1 = 2;
      local_32 = (undefined1)((ulong)DAT_000fbe32 >> 0x18);
      uStack_31 = (undefined1)((ulong)DAT_000fbe32 >> 0x10);
      uStack_30 = (undefined2)DAT_000fbe32;
      uStack_34 = 3;
      uStack_38 = auStack_16;
      uStack_3c = puVar1 + 0x204;
      uStack_40 = auStack_1e;
      __mac_toolbox(0xa98d);
      local_44 = DAT_000fbe32;
      local_46 = 1;
      puStack_4a = auStack_16;
      puStack_4e = puVar1 + 0x214;
      puStack_52 = auStack_1e;
      __mac_toolbox(0xa98d);
      local_56 = DAT_000fbe32;
      local_58 = 4;
      puStack_5c = auStack_16;
      puStack_60 = puVar1 + 0x20c;
      puStack_64 = auStack_1e;
      __mac_toolbox(0xa98d);
      local_68 = DAT_000fbe32;
      local_6a = 5;
      puStack_6e = auStack_16;
      puStack_72 = puVar1 + 0x210;
      puStack_76 = auStack_1e;
      __mac_toolbox(0xa98d);
      local_7a = *(undefined4 *)(puVar1 + 0x204);
      puStack_7e = puVar1 + 2;
      __mac_toolbox(0xa98f);
      if (puVar1[0x202] == '\0') {
        local_82 = *(undefined4 *)(puVar1 + 0x20c);
        __mac_toolbox(0xa963);
        local_88 = *(undefined4 *)(puVar1 + 0x210);
        __mac_toolbox(0xa963);
      }
      else {
        local_82 = *(undefined4 *)(puVar1 + 0x210);
        __mac_toolbox(0xa963);
        local_88 = *(undefined4 *)(puVar1 + 0x20c);
        __mac_toolbox(0xa963);
      }
      local_84 = 0;
      local_8a = 1;
      puVar3 = (undefined4 *)&local_8a;
      __mac_toolbox(0xa02a);
    }
    *(long *)((long)puVar3 + -4) = DAT_000fbe32;
    *(undefined2 *)((long)puVar3 + -6) = 3;
    *(undefined2 *)((long)puVar3 + -8) = 0;
    *(undefined2 *)((long)puVar3 + -10) = 0x7fff;
    __mac_toolbox(0xa97e);
    *(long *)((long)puVar3 + -0xe) = DAT_000fbe32;
    *(undefined4 *)((long)puVar3 + -0x12) = 0x4454e;
    CODE4_0174();
    *(long *)((long)puVar3 + -0x12) = DAT_000fbe32;
    __mac_toolbox(0xa915);
    *(long *)((long)puVar3 + -0x16) = DAT_000fbe32;
    __mac_toolbox(0xa91f);
    *(long *)((long)puVar3 + -0x1a) = DAT_000fbe32;
    *(undefined2 *)((long)puVar3 + -0x1c) = 1;
    *(byte *)((long)puVar3 + -0x1e) = DAT_000fbdb7 & -(*(char *)(*DAT_000fc02a + 2) != '\0');
    *(undefined4 *)((long)puVar3 + -0x22) = 0x44578;
    CODE4_0a3c();
  }
  else if (param_1 == 2) {
    uStack_34 = 4;
    local_32 = 0x45;
    uStack_31 = 0x84;
    lVar2 = CODE4_3c1c();
    uStack_30 = (undefined2)((ulong)lVar2 >> 0x10);
    local_32 = 1;
    uStack_38._2_2_ = 4;
    uStack_34 = 0x458c;
    local_2e._2_1_ = CODE4_3d14();
    *(byte *)(*DAT_000fc02a + 0x203) = local_2e._2_1_;
  }
  else if (param_1 == 3) {
    puVar4 = &local_2e;
    local_2e = (long *)DAT_000fbe32;
    __mac_toolbox(0xa916);
    if (*(char *)(DAT_000fbe36 + 0x6e) != '\x01') {
      __mac_toolbox(0xa029);
      puVar1 = (undefined1 *)*DAT_000fc02a;
      *puVar1 = 3;
      local_32 = (undefined1)((ulong)DAT_000fbe36 >> 0x18);
      uStack_31 = (undefined1)((ulong)DAT_000fbe36 >> 0x10);
      uStack_30 = (undefined2)DAT_000fbe36;
      uStack_34 = 3;
      uStack_38 = auStack_16;
      uStack_3c = puVar1 + 0x204;
      uStack_40 = auStack_1e;
      __mac_toolbox(0xa98d);
      local_44 = DAT_000fbe36;
      local_46 = 1;
      puStack_4a = auStack_16;
      puStack_4e = puVar1 + 0x214;
      puStack_52 = auStack_1e;
      __mac_toolbox(0xa98d);
      local_56 = DAT_000fbe36;
      local_58 = 9;
      puStack_5c = auStack_16;
      puStack_60 = puVar1 + 0x20c;
      puStack_64 = auStack_1e;
      __mac_toolbox(0xa98d);
      local_68 = DAT_000fbe36;
      local_6a = 10;
      puStack_6e = auStack_16;
      puStack_72 = puVar1 + 0x210;
      puStack_76 = auStack_1e;
      __mac_toolbox(0xa98d);
      local_7a = *(undefined4 *)(puVar1 + 0x204);
      puStack_7e = puVar1 + 2;
      __mac_toolbox(0xa98f);
      if (puVar1[0x202] == '\0') {
        local_82 = *(undefined4 *)(puVar1 + 0x20c);
        __mac_toolbox(0xa963);
        local_88 = *(undefined4 *)(puVar1 + 0x210);
        __mac_toolbox(0xa963);
      }
      else {
        local_82 = *(undefined4 *)(puVar1 + 0x210);
        __mac_toolbox(0xa963);
        local_88 = *(undefined4 *)(puVar1 + 0x20c);
        __mac_toolbox(0xa963);
      }
      local_84 = 0;
      local_8a = 1;
      puVar4 = (undefined4 *)&local_8a;
      __mac_toolbox(0xa02a);
    }
    *(long *)((long)puVar4 + -4) = DAT_000fbe36;
    *(undefined2 *)((long)puVar4 + -6) = 3;
    *(undefined2 *)((long)puVar4 + -8) = 0;
    *(undefined2 *)((long)puVar4 + -10) = 0x7fff;
    __mac_toolbox(0xa97e);
    *(long *)((long)puVar4 + -0xe) = DAT_000fbe36;
    *(undefined4 *)((long)puVar4 + -0x12) = 0x4466e;
    CODE4_0174();
    *(long *)((long)puVar4 + -0x12) = DAT_000fbe36;
    __mac_toolbox(0xa915);
    *(long *)((long)puVar4 + -0x16) = DAT_000fbe36;
    __mac_toolbox(0xa91f);
    *(long *)((long)puVar4 + -0x1a) = DAT_000fbe36;
    *(undefined2 *)((long)puVar4 + -0x1c) = 1;
    *(byte *)((long)puVar4 + -0x1e) = DAT_000fbdb7 & -(*(char *)(*DAT_000fc02a + 2) != '\0');
    *(undefined4 *)((long)puVar4 + -0x22) = 0x44698;
    CODE4_0a3c();
  }
  else if (param_1 == 5) {
    local_2e = DAT_000fc030;
    local_32 = 0;
    uStack_31 = 4;
    uStack_30 = 0x46a2;
    CODE4_1ac4();
  }
  else if (param_1 == 6) {
    local_2e = (long *)0x0;
    local_32 = 0;
    uStack_31 = 0;
    uStack_30 = 0;
    uStack_38._2_2_ = (undefined2)((ulong)*(undefined4 *)(*DAT_000fc030 + 2) >> 0x10);
    uStack_34 = (undefined2)*(undefined4 *)(*DAT_000fc030 + 2);
    __mac_toolbox(0xa9d1);
    uStack_3c._2_2_ = (undefined2)((ulong)DAT_000fc030 >> 0x10);
    uStack_38._0_2_ = SUB42(DAT_000fc030,0);
    uStack_40._2_2_ = 4;
    uStack_3c._0_2_ = 0x46bc;
    CODE4_1ac4();
  }
  return;
}



/* CODE 4 + 0x46e4, synthetic address 0x000446e4 */

/* Original CODE 4 resource offset 0x46e4 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_46e4(undefined2 param_1,undefined2 param_2,undefined2 param_3,long *param_4)

{
  *(undefined2 *)(*param_4 + 0x116) = param_1;
  CODE4_1e98();
  return;
}



/* CODE 4 + 0x470e, synthetic address 0x0004470e */

/* Original CODE 4 resource offset 0x470e (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_470e(undefined2 param_1)

{
  int iVar1;
  undefined1 *puVar2;
  undefined1 *puVar3;
  undefined1 local_36 [2];
  undefined2 local_34;
  undefined4 local_32;
  undefined1 local_2e;
  undefined2 local_2c;
  undefined4 local_2a;
  
  local_2a = DAT_000fbe06;
  local_2c = DAT_000fbde8;
  local_2e = 0;
  __mac_toolbox(0xa945);
  DAT_000fbde8 = param_1;
  local_32 = DAT_000fbe06;
  local_34 = param_1;
  local_36[0] = 1;
  __mac_toolbox(0xa945);
  CODE4_10fc();
  if ((DAT_000fbdd8 & 0x800) == 0x800) {
    iVar1 = 1;
    puVar2 = local_36;
    do {
      puVar3 = puVar2;
      if (*(char *)((long)(iVar1 * 0xa6 + -0x406a) + 0x100000) != '\0') {
        *(long *)(puVar2 + -8) = (long)(iVar1 * 0xa6 + -0x4068) + 0x100000;
        __mac_toolbox(0xa917);
        *(undefined4 *)(puVar2 + -8) = *(undefined4 *)(puVar2 + -8);
        *(long *)(puVar2 + -0xc) = (long)(iVar1 * 0xa6 + -0x4068) + 0x100000;
        puVar3 = puVar2 + -0xe;
        *(undefined2 *)(puVar2 + -0xe) = param_1;
        *(undefined4 *)(puVar2 + -0x12) = 0x44786;
        CODE4_46e4();
      }
      iVar1 = iVar1 + 1;
      puVar2 = puVar3;
    } while (iVar1 < 6);
  }
  else {
    CODE4_46e4(param_1,DAT_000fbe2a,DAT_000fc030);
  }
  return;
}



/* CODE 4 + 0x47aa, synthetic address 0x000447aa */

/* Original CODE 4 resource offset 0x47aa (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_47aa(undefined2 param_1,undefined2 param_2,undefined2 param_3,long *param_4)

{
  *(undefined2 *)(*param_4 + 0x118) = param_1;
  CODE4_1e98();
  return;
}



/* CODE 4 + 0x47d2, synthetic address 0x000447d2 */

/* Original CODE 4 resource offset 0x47d2 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_47d2(int param_1)

{
  int iVar1;
  undefined1 *puVar2;
  undefined1 *puVar3;
  undefined1 local_36 [2];
  int local_34;
  undefined4 local_32;
  undefined1 local_2e;
  undefined2 local_2c;
  undefined4 local_2a;
  
  local_2a = DAT_000fbe0a;
  local_2c = DAT_000fbdea;
  local_2e = 0;
  __mac_toolbox(0xa945);
  DAT_000fbdea = param_1;
  local_32 = DAT_000fbe0a;
  local_34 = param_1;
  local_36[0] = 1;
  __mac_toolbox(0xa945);
  DAT_000fbdee = *(undefined2 *)((long)(param_1 * 2 + -0x6f6) + 0x100000);
  if ((DAT_000fbdd8 & 0x800) == 0x800) {
    iVar1 = 1;
    puVar2 = local_36;
    do {
      puVar3 = puVar2;
      if (*(char *)((long)(iVar1 * 0xa6 + -0x406a) + 0x100000) != '\0') {
        *(long *)(puVar2 + -8) = (long)(iVar1 * 0xa6 + -0x4068) + 0x100000;
        __mac_toolbox(0xa917);
        *(undefined4 *)(puVar2 + -8) = *(undefined4 *)(puVar2 + -8);
        *(long *)(puVar2 + -0xc) = (long)(iVar1 * 0xa6 + -0x4068) + 0x100000;
        puVar3 = puVar2 + -0xe;
        *(int *)(puVar2 + -0xe) = param_1;
        *(undefined4 *)(puVar2 + -0x12) = 0x44856;
        CODE4_47aa();
      }
      iVar1 = iVar1 + 1;
      puVar2 = puVar3;
    } while (iVar1 < 6);
  }
  else {
    CODE4_47aa(param_1,DAT_000fbe2a,DAT_000fc030);
  }
  return;
}



/* CODE 4 + 0x487a, synthetic address 0x0004487a */

/* Original CODE 4 resource offset 0x487a (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_487a(int param_1)

{
  short sVar1;
  
  if (param_1 == 1) {
    sVar1 = CODE4_0caa();
    if ((0 < sVar1) && (JT_CODE3_3e36((char)DAT_000fbdb2,(char)sVar1), DAT_000fbdb5 != '\0')) {
      CODE4_3a08(0x81);
    }
  }
  else if (param_1 == 7) {
    JT_CODE5_3d44();
  }
  else if (param_1 == 0xc) {
    CODE4_003c();
  }
  else if (param_1 == 0xd) {
    CODE4_0090();
  }
  else if ((((param_1 == 0xf) || (param_1 == 0x10)) || (param_1 == 0x11)) ||
          ((param_1 == 0x12 || (param_1 == 0x13)))) {
    CODE4_0004((char)param_1 + -0xf);
  }
  return;
}



/* CODE 4 + 0x4912, synthetic address 0x00044912 */

/* Original CODE 4 resource offset 0x4912 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

int CODE4_4912(int param_1)

{
  int iVar1;
  int iVar2;
  
  if (param_1 == 1) {
    iVar2 = FUN_000423bc();
  }
  else if (param_1 == 2) {
    iVar2 = FUN_000423c4();
  }
  else if (param_1 == 10) {
    __mac_toolbox(0xa915);
    __mac_toolbox(0xa91f);
    iVar2 = 0;
  }
  else if (param_1 == 0xc) {
    iVar2 = CODE4_1fc8();
  }
  else {
    iVar1 = (param_1 + -3) * 0xa6 + -0x4072;
    iVar2 = CONCAT11((char)((uint)iVar1 >> 8),(&DAT_00100078)[iVar1] + -1);
    if ((char)((&DAT_00100078)[iVar1] + -1) != '\0') {
      DAT_000fbdf2 = DAT_000fbdf2 + 1;
      iVar2 = DAT_000fbdf2;
    }
    __mac_toolbox(0xa915);
    __mac_toolbox(0xa91f);
  }
  return iVar2;
}



/* CODE 4 + 0x4992, synthetic address 0x00044992 */

/* Original CODE 4 resource offset 0x4992 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_4992(void)

{
  undefined4 uVar1;
  undefined2 uVar2;
  undefined2 *puVar3;
  undefined1 *puVar4;
  undefined2 local_24 [4];
  
  local_24[2] = 4;
  local_24[3] = 0x499c;
  CODE4_3ab4();
  if (DAT_000fbdca == 1) {
    puVar3 = local_24 + 2;
    __mac_toolbox(0xa93d);
    uVar1 = DAT_000fbdd4;
  }
  else {
    __mac_toolbox(0xa93e);
    puVar3 = local_24 + 3;
    uVar1 = CONCAT22(DAT_000fbdcc._2_2_,local_24[2]);
  }
  uVar2 = (undefined2)uVar1;
  puVar4 = (undefined1 *)puVar3;
  switch((int)((ulong)uVar1 >> 0x10)) {
  case 0x80:
    puVar4 = (undefined1 *)((long)puVar3 + -2);
    *(undefined2 *)((long)puVar3 + -2) = uVar2;
    *(undefined4 *)((long)puVar3 + -6) = 0x449c6;
    CODE4_4044();
    break;
  case 0x81:
    puVar4 = (undefined1 *)((long)puVar3 + -2);
    *(undefined2 *)((long)puVar3 + -2) = uVar2;
    *(undefined4 *)((long)puVar3 + -6) = 0x449ce;
    CODE4_40ee();
    break;
  case 0x82:
    puVar4 = (undefined1 *)((long)puVar3 + -2);
    *(undefined2 *)((long)puVar3 + -2) = uVar2;
    *(undefined4 *)((long)puVar3 + -6) = 0x449d6;
    CODE4_41be();
    break;
  case 0x83:
    puVar4 = (undefined1 *)((long)puVar3 + -2);
    *(undefined2 *)((long)puVar3 + -2) = uVar2;
    *(undefined4 *)((long)puVar3 + -6) = 0x449de;
    CODE4_446a();
    break;
  case 0x84:
    puVar4 = (undefined1 *)((long)puVar3 + -2);
    *(undefined2 *)((long)puVar3 + -2) = uVar2;
    *(undefined4 *)((long)puVar3 + -6) = 0x449e6;
    CODE4_470e();
    break;
  case 0x85:
    puVar4 = (undefined1 *)((long)puVar3 + -2);
    *(undefined2 *)((long)puVar3 + -2) = uVar2;
    *(undefined4 *)((long)puVar3 + -6) = 0x449ee;
    CODE4_47d2();
    break;
  case 0x86:
    puVar4 = (undefined1 *)((long)puVar3 + -2);
    *(undefined2 *)((long)puVar3 + -2) = uVar2;
    *(undefined4 *)((long)puVar3 + -6) = 0x449f6;
    CODE4_487a();
    break;
  case 0x87:
    puVar4 = (undefined1 *)((long)puVar3 + -2);
    *(undefined2 *)((long)puVar3 + -2) = uVar2;
    *(undefined4 *)((long)puVar3 + -6) = 0x449fe;
    CODE4_4912();
  }
  *(undefined2 *)(puVar4 + -2) = 0;
  __mac_toolbox(0xa938);
  return;
}



/* CODE 4 + 0x4a2e, synthetic address 0x00044a2e */

/* Original CODE 4 resource offset 0x4a2e (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_4a2e(void)

{
  long lVar1;
  char local_3c;
  int iStack_34;
  undefined1 local_1a [22];
  
  __mac_toolbox(0xa871);
  iStack_34 = (int)((ulong)local_1a >> 0x10);
  __mac_toolbox(0xa96c);
  if (iStack_34 == 0) {
    if (DAT_000fbdb6 != '\0') {
      lVar1 = *DAT_000fc030;
      if ((byte)(-(DAT_000fbdd4._0_2_ <= *(int *)(**(long **)(lVar1 + 2) + 0xc)) &
                -(*(int *)(**(long **)(lVar1 + 2) + 8) <= DAT_000fbdd4._0_2_) &
                -(DAT_000fbdd4._2_2_ < 10)) != 0) {
        DAT_000fbdd4 = CONCAT22(DAT_000fbdd4._0_2_,10);
      }
      local_3c = (char)((ulong)(**(long **)(lVar1 + 2) + 8) >> 0x18);
      __mac_toolbox(0xa8ad);
      if (local_3c != '\0') {
        __mac_toolbox(0xa9d4);
        CODE4_0294(*(undefined4 *)(lVar1 + 2));
      }
    }
  }
  else {
    CODE4_17d6((char)((ulong)DAT_000fbdd4 >> 0x10),DAT_000fbdd4._2_2_,iStack_34);
  }
  return;
}



/* CODE 4 + 0x4ae2, synthetic address 0x00044ae2 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Original CODE 4 resource offset 0x4ae2 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

ulong CODE4_4ae2(void)

{
  ulong uVar1;
  undefined2 local_52;
  char cStackY_50;
  undefined1 uStackY_4f;
  undefined2 in_stack_ffffffb6;
  undefined2 uVar2;
  uint uVar3;
  ulong local_26;
  undefined4 uStack_22;
  undefined4 uStack_1e;
  
  uVar3 = (uint)((ulong)&local_26 >> 0x10);
  __mac_toolbox(0xa92c);
  uVar1 = (ulong)uVar3;
  if (uVar3 != 0) {
    if (uVar3 == 1) {
      uVar1 = CODE4_4992((int)&local_26,DAT_000fbdd4);
    }
    else if (uVar3 == 2) {
      __mac_toolbox(0xa924);
      __mac_toolbox(0xa9b3);
      __mac_toolbox(0xa924);
      uVar1 = CONCAT31(CONCAT21(local_52,cStackY_50),uStackY_4f);
      if (uVar1 == 0) {
        uVar1 = CODE4_014c();
        __mac_toolbox(0xa93a);
        __mac_toolbox(0xa937);
      }
      else if (CONCAT22(in_stack_ffffffb6,2) != uVar1) {
        __mac_toolbox(0xa939);
        __mac_toolbox(0xa93a);
        __mac_toolbox(0xa93a);
        __mac_toolbox(0xa93a);
        __mac_toolbox(0xa937);
      }
    }
    else if (uVar3 == 4) {
      uVar1 = CODE4_1a16();
    }
    else {
      __mac_toolbox(0xa924);
      uVar1 = CONCAT22(in_stack_ffffffb6,uVar3);
      if (uVar1 == local_26) {
        if (DAT_000fbe2a != 0) {
          if (uVar3 == 3) {
            uVar1 = CODE4_4a2e();
          }
          else {
            uVar1 = (ulong)(uVar3 - 5);
            if (uVar3 - 5 == 0) {
              uStack_22 = *(undefined4 *)(*_DAT_000009ee + 2);
              uStack_1e = *(undefined4 *)(*_DAT_000009ee + 6);
              __mac_toolbox(0xa8a7);
              __mac_toolbox(0xa92b);
              if (&stack0x00000000 != (undefined1 *)0x22) {
                uVar1 = CODE4_1852();
              }
            }
            else {
              uVar1 = (ulong)(uVar3 - 6);
              if (uVar3 - 6 == 0) {
                cStackY_50 = (char)((ulong)DAT_000fbdd4 >> 0x18);
                __mac_toolbox(0xa91e);
                if (cStackY_50 != '\0') {
                  uVar1 = CODE4_373a((int)DAT_000fbdd4);
                }
              }
              else {
                uVar2 = (undefined2)((ulong)DAT_000fbe2a >> 0x10);
                if (uVar3 == 7) {
                  uVar1 = CODE4_1e56(7,uVar2,(int)DAT_000fbe2a);
                }
                else {
                  uVar1 = (ulong)(uVar3 - 8);
                  if (uVar3 - 8 == 0) {
                    uVar1 = CODE4_1e56(8,uVar2,(int)DAT_000fbe2a);
                  }
                }
              }
            }
          }
        }
      }
      else {
        __mac_toolbox(0xa91f);
      }
    }
  }
  return uVar1;
}



/* CODE 4 + 0x4c64, synthetic address 0x00044c64 */

/* Original CODE 4 resource offset 0x4c64 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

ulong CODE4_4c64(void)

{
  char *pcVar1;
  byte bVar2;
  undefined1 uVar3;
  uint uVar4;
  ulong uVar5;
  uint *puVar6;
  undefined2 local_34;
  undefined2 uStack_32;
  uint local_30;
  undefined1 local_2e;
  undefined2 local_2c;
  undefined4 local_2a;
  undefined4 local_26;
  undefined4 local_22;
  
  DAT_000fbdcc = DAT_000fbdcc & 0xff;
  uVar5 = (ulong)(DAT_000fbdd8 & 0x100);
  if ((DAT_000fbdd8 & 0x100) == 0x100) {
    local_22 = 0x44c8c;
    uVar5 = CODE4_4992();
  }
  else if (DAT_000fc030 == (long *)0x0) {
    __mac_toolbox(0xa9c8);
  }
  else {
    pcVar1 = (char *)*DAT_000fc030;
    uVar4 = DAT_000fbdcc._2_2_;
    if (*pcVar1 == '\x01') {
      __mac_toolbox(0xa9c8);
    }
    else {
      uVar3 = (undefined1)((DAT_000fbdd8 & 0x200) >> 8);
      if ((byte)(-(DAT_000fbdcc._2_2_ == DAT_000fbdbe) & -((DAT_000fbdd8 & 0x200) == 0x200)) == 0) {
        bVar2 = (-(DAT_000fbdcc._2_2_ < 0x20) & -(0x1b < DAT_000fbdcc._2_2_)) + 1U &
                -(DAT_000fbdcc._2_2_ != DAT_000fbdbe) &
                -(DAT_000fbdcc._2_2_ != DAT_000fbdbc) &
                -(DAT_000fbdcc._2_2_ != DAT_000fbdba) & -(DAT_000fbdcc._2_2_ < 0x20);
        uVar5 = (ulong)CONCAT11(uVar3,bVar2);
        if (bVar2 == 0) {
          bVar2 = -(DAT_000fbdcc._2_2_ != DAT_000fbdbc) &
                  -(*(int *)(**(long **)(pcVar1 + 2) + 0x3c) == 0x7fff);
          uVar5 = (ulong)CONCAT11(uVar3,bVar2);
          if (bVar2 == 0) {
            pcVar1[10] = '\x01';
            pcVar1[0x11a] = '\0';
            local_22 = DAT_000fbdfa;
            local_26 = (long *)CONCAT22(local_26._0_2_,5);
            local_26 = (long *)CONCAT13(pcVar1[0x14] != '\0',local_26._1_3_);
            local_2a = 0x44d64;
            CODE4_014c();
            local_2a = DAT_000fbdfa;
            local_2c = 7;
            local_2e = pcVar1[0x14] != '\0';
            uStack_32 = 4;
            local_30 = 0x4d7a;
            CODE4_014c();
            if (uVar4 == DAT_000fbdbe) {
              if (*(int *)(**(long **)(pcVar1 + 2) + 0x3c) + 4 < 0x7fff) {
                puVar6 = &uStack_32;
                uStack_32 = (undefined2)((ulong)*(undefined4 *)(pcVar1 + 2) >> 0x10);
                local_30 = (uint)*(undefined4 *)(pcVar1 + 2);
                local_34 = 0x4da2;
                CODE4_0814();
              }
              else {
                puVar6 = &local_30;
                local_30 = 5;
                __mac_toolbox(0xa9c8);
              }
            }
            else if ((DAT_000fbdb9 & -(uVar4 == DAT_000fbdba)) == 0) {
              local_30 = uVar4;
              puVar6 = &local_34;
              local_34 = (undefined2)((ulong)*(undefined4 *)(pcVar1 + 2) >> 0x10);
              uStack_32 = (undefined2)*(undefined4 *)(pcVar1 + 2);
              __mac_toolbox(0xa9dc);
            }
            else {
              puVar6 = &uStack_32;
              uStack_32 = (undefined2)((ulong)*(undefined4 *)(pcVar1 + 2) >> 0x10);
              local_30 = (uint)*(undefined4 *)(pcVar1 + 2);
              local_34 = 0x4db8;
              CODE4_0950();
            }
            *(long **)((long)puVar6 + -4) = DAT_000fc030;
            *(undefined4 *)((long)puVar6 + -8) = 0x44dca;
            CODE4_1ac4();
            *(undefined4 *)((long)puVar6 + -8) = 0x44dce;
            uVar5 = CODE4_0294();
          }
          else {
            __mac_toolbox(0xa9c8);
          }
        }
        else {
          __mac_toolbox(0xa9c8);
        }
      }
      else {
        local_22 = *(undefined4 *)(pcVar1 + 2);
        local_26 = (long *)0x44cda;
        CODE4_089c();
        local_26 = DAT_000fc030;
        local_2a = 0x44ce2;
        uVar5 = CODE4_1ac4();
      }
    }
  }
  return uVar5;
}



/* CODE 4 + 0x4dd6, synthetic address 0x00044dd6 */

/* Original CODE 4 resource offset 0x4dd6 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_4dd6(void)

{
  undefined2 uVar1;
  undefined2 uVar2;
  undefined2 uVar3;
  
  if (DAT_000fbdcc._0_2_ != 0) {
    uVar3 = 0x6e;
    uVar2 = 0x55;
    uVar1 = 0x4df0;
    JT_CODE1_0924(0x55,0x6e);
    JT_CODE1_0934((int)((ulong)DAT_000fbdcc >> 0x10),(int)DAT_000fbdcc,uVar2,uVar3,uVar1);
    JT_CODE1_092e();
  }
  return;
}



/* CODE 4 + 0x4e0a, synthetic address 0x00044e0a */

/* Original CODE 4 resource offset 0x4e0a (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_4e0a(void)

{
  char *pcVar1;
  bool bVar2;
  long lVar3;
  undefined2 uVar4;
  long lVar5;
  byte bVar6;
  undefined1 uVar7;
  undefined4 *puVar8;
  long *plVar9;
  undefined1 *puVar10;
  undefined4 *puVar11;
  undefined1 *puVar12;
  char acStack_56 [24];
  undefined4 local_3e;
  int local_1e;
  undefined4 local_1c [6];
  
  uVar7 = (undefined1)local_3e;
  bVar6 = local_3e._2_1_;
  uVar4 = local_3e._0_2_;
  puVar8 = (undefined4 *)&stack0xffffffc6;
  bVar2 = true;
  __mac_toolbox(0xa924);
  lVar3 = CONCAT31(CONCAT21(local_3e._0_2_,local_3e._2_1_),(undefined1)local_3e);
  local_3e = CODE4_3c1c();
  lVar5 = local_3e;
  if (DAT_000fbdca == 3 || DAT_000fbdca == 5) {
    DAT_000fbdcc = DAT_000fbdcc & 0xff;
    if ((DAT_000fbdd8 & 0x100) == 0x100) {
      local_3e._0_2_ = 4;
      local_3e._2_1_ = 0x4e;
      local_3e._3_1_ = 0x58;
      CODE4_4992();
      puVar8 = &local_3e;
      local_3e._0_2_ = uVar4;
      local_3e._2_1_ = bVar6;
      local_3e._3_1_ = uVar7;
      CODE4_0174();
      bVar2 = false;
    }
    else if ((byte)(-(DAT_000fbdcc._2_2_ != DAT_000fbdbe) &
                   -(DAT_000fbdcc._2_2_ != DAT_000fbdbc) & -(DAT_000fbdcc._2_2_ < 0x20)) == 0) {
      if ((byte)(-(DAT_000fbdcc._2_2_ != DAT_000fbdbc) &
                -(0xfe < *(int *)(**(long **)(lVar3 + 0xa0) + 0x3c))) != 0) {
        bVar2 = false;
        puVar8 = (undefined4 *)((long)&local_3e + 2);
        local_3e._2_1_ = 0;
        local_3e._3_1_ = 5;
        __mac_toolbox(0xa9c8);
      }
    }
    else {
      if ((byte)(-(*(char *)(*DAT_000fc02a + 2) != '\0') &
                (-(DAT_000fbdcc._2_2_ == DAT_000fbdc0) | -(DAT_000fbdcc._2_2_ == DAT_000fbdba))) ==
          0) {
        puVar8 = (undefined4 *)((long)&local_3e + 2);
        local_3e._2_1_ = 0;
        local_3e._3_1_ = 5;
        __mac_toolbox(0xa9c8);
      }
      else {
        local_3e._0_2_ = (undefined2)local_3e;
        local_3e._2_1_ = CODE4_3d14();
        *(byte *)(*DAT_000fc02a + 0x203) = local_3e._2_1_;
      }
      bVar2 = false;
    }
  }
  if (bVar2) {
    *(int **)((long)puVar8 + -6) = &DAT_000fbdca;
    *(undefined4 **)((long)puVar8 + -10) = local_1c;
    *(int **)((long)puVar8 + -0xe) = &local_1e;
    __mac_toolbox(0xa980);
    if (*(char *)((long)puVar8 + -0xe) == '\0') {
      if (DAT_000fbdca == 1) {
        *(undefined4 *)((long)puVar8 + -0x10) = 0x45072;
        CODE4_4ae2();
      }
      else if (DAT_000fbdca == 6) {
        if (DAT_000fbdb7 != '\0') {
          if (*(char *)*DAT_000fc02a == '\x02') {
            *(undefined4 *)((long)puVar8 + -0x10) = local_1c[0];
            *(undefined2 *)((long)puVar8 + -0x12) = 1;
            *(bool *)((long)puVar8 + -0x14) = *(char *)(*DAT_000fc02a + 2) != '\0';
            *(undefined4 *)((long)puVar8 + -0x18) = 0x450aa;
            CODE4_0a3c();
          }
          else {
            *(undefined4 *)((long)puVar8 + -0x10) = local_1c[0];
            *(undefined2 *)((long)puVar8 + -0x12) = 1;
            *(bool *)((long)puVar8 + -0x14) = *(char *)(*DAT_000fc02a + 2) != '\0';
            *(undefined4 *)((long)puVar8 + -0x18) = 0x450c8;
            CODE4_0a3c();
          }
        }
      }
      else if (DAT_000fbdca == 8) {
        *(undefined4 *)((long)puVar8 + -0x10) = 0x4507a;
        CODE4_1174();
      }
    }
    else {
      *(long **)((long)puVar8 + -0x10) = DAT_000fc02a;
      __mac_toolbox(0xa029);
      pcVar1 = (char *)*DAT_000fc02a;
      if (*pcVar1 == '\x02') {
        if (local_1e == 1) {
          *(long *)((long)puVar8 + -0x12) = lVar5;
          *(undefined1 *)((long)puVar8 + -0x14) = 1;
          *(undefined4 *)((long)puVar8 + -0x18) = 0x44f22;
          CODE4_3d14();
          pcVar1[0x203] = *(char *)((long)puVar8 + -0xe);
          puVar12 = (undefined1 *)((long)puVar8 + -0xc);
        }
        else if (local_1e == 4) {
          *(undefined4 *)((long)puVar8 + -0x10) = *(undefined4 *)(pcVar1 + 0x210);
          *(undefined2 *)((long)puVar8 + -0x12) = 0;
          __mac_toolbox(0xa963);
          *(undefined4 *)((long)puVar8 + -0x16) = *(undefined4 *)(pcVar1 + 0x20c);
          *(undefined2 *)((long)puVar8 + -0x18) = 1;
          __mac_toolbox(0xa963);
          pcVar1[0x202] = '\x01';
          puVar12 = (undefined1 *)((long)puVar8 + -0x18);
        }
        else {
          puVar12 = (undefined1 *)((long)puVar8 + -0xc);
          if (local_1e == 5) {
            *(undefined4 *)((long)puVar8 + -0x10) = *(undefined4 *)(pcVar1 + 0x20c);
            *(undefined2 *)((long)puVar8 + -0x12) = 0;
            __mac_toolbox(0xa963);
            *(undefined4 *)((long)puVar8 + -0x16) = *(undefined4 *)(pcVar1 + 0x210);
            *(undefined2 *)((long)puVar8 + -0x18) = 1;
            __mac_toolbox(0xa963);
            pcVar1[0x202] = '\0';
            puVar12 = (undefined1 *)((long)puVar8 + -0x18);
          }
        }
      }
      else {
        puVar12 = (undefined1 *)((long)puVar8 + -0xc);
        if (*pcVar1 == '\x03') {
          if (local_1e == 1) {
            *(long *)((long)puVar8 + -0x12) = lVar5;
            *(undefined1 *)((long)puVar8 + -0x14) = 1;
            *(undefined4 *)((long)puVar8 + -0x18) = 0x44f84;
            CODE4_3d14();
            pcVar1[0x203] = *(char *)((long)puVar8 + -0xe);
            puVar12 = (undefined1 *)((long)puVar8 + -0xc);
          }
          else if (local_1e == 6) {
            *(long *)((long)puVar8 + -0x10) = lVar5;
            *(undefined4 *)((long)puVar8 + -0x14) = 0x44f9c;
            CODE4_3fd0();
            *(long *)((long)puVar8 + -0x16) = lVar5;
            *(undefined1 *)((long)puVar8 + -0x18) = 1;
            *(undefined4 *)((long)puVar8 + -0x1c) = 0x44fa8;
            CODE4_3d14();
            pcVar1[0x203] = *(char *)((long)puVar8 + -0x12);
            puVar12 = (undefined1 *)((long)puVar8 + -0x10);
          }
          else if (local_1e == 7) {
            *(long *)((long)puVar8 + -0x10) = lVar5;
            *(undefined4 *)((long)puVar8 + -0x14) = 0x44f92;
            CODE4_3fd0();
            puVar12 = (undefined1 *)((long)puVar8 + -0x10);
          }
          else if (local_1e == 8) {
            puVar10 = (undefined1 *)((long)puVar8 + -0x10);
            *(undefined4 *)((long)puVar8 + -0x10) = *DAT_000fbdc6;
            __mac_toolbox(0xa851);
            while( true ) {
              *(long *)(puVar10 + -6) = lVar5;
              puVar11 = (undefined4 *)(puVar10 + -8);
              puVar10[-8] = 0;
              *(undefined4 *)(puVar10 + -0xc) = 0x44fca;
              CODE4_3d14();
              if (puVar10[-2] == '\0') break;
              plVar9 = (long *)(puVar10 + -4);
              puVar10 = puVar10 + -4;
              *plVar9 = lVar5;
              *puVar11 = 0x44fc0;
              CODE4_3fd0();
            }
            *(long *)(puVar10 + -4) = lVar5;
            *(undefined4 *)(puVar10 + -8) = 0x44fd4;
            CODE4_1ac4();
            __mac_toolbox(0xa850);
            puVar12 = puVar10 + -4;
          }
          else if (local_1e == 9) {
            *(undefined4 *)((long)puVar8 + -0x10) = *(undefined4 *)(pcVar1 + 0x210);
            *(undefined2 *)((long)puVar8 + -0x12) = 0;
            __mac_toolbox(0xa963);
            *(undefined4 *)((long)puVar8 + -0x16) = *(undefined4 *)(pcVar1 + 0x20c);
            *(undefined2 *)((long)puVar8 + -0x18) = 1;
            __mac_toolbox(0xa963);
            puVar12 = (undefined1 *)((long)puVar8 + -0x18);
            if (pcVar1[0x202] != '\x01') {
              pcVar1[0x203] = '\0';
              pcVar1[0x202] = '\x01';
              puVar12 = (undefined1 *)((long)puVar8 + -0x18);
            }
          }
          else {
            puVar12 = (undefined1 *)((long)puVar8 + -0xc);
            if (local_1e == 10) {
              *(undefined4 *)((long)puVar8 + -0x10) = *(undefined4 *)(pcVar1 + 0x20c);
              *(undefined2 *)((long)puVar8 + -0x12) = 0;
              __mac_toolbox(0xa963);
              *(undefined4 *)((long)puVar8 + -0x16) = *(undefined4 *)(pcVar1 + 0x210);
              *(undefined2 *)((long)puVar8 + -0x18) = 1;
              __mac_toolbox(0xa963);
              puVar12 = (undefined1 *)((long)puVar8 + -0x18);
              if (pcVar1[0x202] != '\0') {
                pcVar1[0x203] = '\0';
                pcVar1[0x202] = '\0';
                puVar12 = (undefined1 *)((long)puVar8 + -0x18);
              }
            }
          }
        }
      }
      *(long **)(puVar12 + -4) = DAT_000fc02a;
      __mac_toolbox(0xa02a);
      *(undefined4 *)(puVar12 + -4) = 0x4505e;
      CODE4_0294();
      *(long *)(puVar12 + -4) = lVar3;
      *(undefined4 *)(puVar12 + -8) = 0x45064;
      CODE4_0174();
    }
  }
  return;
}



/* CODE 4 + 0x50de, synthetic address 0x000450de */

/* Original CODE 4 resource offset 0x50de (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE4_50de(void)

{
  bool bVar1;
  byte bVar2;
  int iVar3;
  int iVar4;
  undefined4 unaff_A4;
  int **ppiVar5;
  undefined1 *puVar6;
  undefined1 *puVar7;
  undefined1 *puVar8;
  undefined1 *puVar9;
  int **ppiVar10;
  undefined4 local_366;
  undefined4 local_362;
  undefined4 local_35c;
  undefined4 local_358;
  undefined4 local_354;
  undefined4 uStack_350;
  int *piStack_34c;
  int *piStack_348;
  undefined1 auStack_330 [268];
  undefined2 local_224;
  undefined1 auStack_222 [256];
  undefined2 local_122;
  long local_120;
  undefined1 auStack_11a [258];
  int local_18;
  int local_16 [9];
  
  piStack_348 = local_16;
  piStack_34c = &local_18;
  ppiVar5 = &piStack_34c;
  uStack_350 = 0x450f2;
  JT_CODE1_087e();
  if (local_16[0] == 1) {
    bVar1 = 1 < local_18;
    if (bVar1) {
      local_354 = 0x78;
      local_358 = 0x45110;
      JT_CODE1_053a();
      unaff_A4 = local_354;
      local_354 = 0xc8000000;
      __mac_toolbox(0xa8fd);
      local_358 = unaff_A4;
      local_35c = 0x20040480;
      __mac_toolbox(0xa8fd);
      local_362 = unaff_A4;
      local_366 = 0x32040488;
      __mac_toolbox(0xa8fd);
      ppiVar5 = (int **)((long)&local_366 + 2);
    }
    puVar7 = (undefined1 *)ppiVar5;
    for (iVar3 = 1; !bVar1 && iVar3 <= local_18; iVar3 = iVar3 + 1) {
      *(int *)(puVar7 + -2) = iVar3;
      *(undefined2 **)(puVar7 + -6) = &local_122;
      *(undefined4 *)(puVar7 + -10) = 0x45148;
      JT_CODE1_08a2();
      if (local_120 == 0x54455854) {
        puVar7[-8] = 0;
        *(undefined1 **)(puVar7 + -0xc) = auStack_11a;
        puVar6 = puVar7 + -0xe;
        *(undefined2 *)(puVar7 + -0xe) = local_122;
        *(undefined4 *)(puVar7 + -0x12) = 0x45160;
        CODE4_33aa();
        if (1 < local_18) {
          *(undefined4 *)(puVar7 + -0x12) = unaff_A4;
          *(undefined4 *)(puVar7 + -0x16) = DAT_000ff924;
          *(undefined4 *)(puVar7 + -0x1a) = 0x5804089c;
          __mac_toolbox(0xa8fd);
          puVar6 = puVar7 + -0x1e;
          *(undefined4 *)(puVar7 + -0x1e) = 0xd0000000;
          __mac_toolbox(0xa8fd);
        }
        *(undefined4 **)(puVar6 + -8) = &DAT_000fc03e;
        __mac_toolbox(0xa917);
        *(undefined4 *)(puVar6 + -8) = *(undefined4 *)(puVar6 + -8);
        puVar6[-10] = local_18 == 1;
        *(undefined4 *)(puVar6 + -0xe) = 0x4519c;
        JT_CODE5_0958();
        *(int *)(puVar6 + -0xc) = iVar3;
        *(undefined4 *)(puVar6 + -0x10) = 0x451a2;
        JT_CODE1_08e8();
        puVar7 = puVar6 + -0xc;
        while( true ) {
          *(undefined2 *)(puVar7 + -4) = 0x100;
          *(undefined2 **)(puVar7 + -8) = &DAT_000fbdca;
          __mac_toolbox(0xa970);
          puVar8 = puVar7 + -6;
          if (puVar7[-8] == '\0') break;
          *(undefined4 *)(puVar7 + -10) = 0x451a8;
          CODE4_1174();
          puVar7 = puVar7 + -6;
        }
        *(undefined4 *)(puVar7 + -10) = 0x451bc;
        CODE4_373a();
      }
      else {
        local_224 = 0x122;
        *(undefined1 **)(puVar7 + -10) = auStack_330;
        *(undefined2 **)(puVar7 + -0xe) = &local_224;
        *(undefined1 **)(puVar7 + -0x12) = auStack_11a;
        *(undefined2 **)(puVar7 + -0x16) = &local_224;
        *(undefined **)(puVar7 + -0x1a) = &DAT_00045324;
        *(undefined2 *)(puVar7 + -0x1c) = 4;
        *(undefined4 *)(puVar7 + -0x20) = 0x451e0;
        JT_CODE1_0004();
        *(undefined2 *)(puVar7 + -0x1a) = 0xff;
        *(undefined1 **)(puVar7 + -0x1e) = auStack_330;
        *(undefined1 **)(puVar7 + -0x22) = auStack_222;
        *(undefined4 *)(puVar7 + -0x26) = 0x451f2;
        JT_CODE1_03e2();
        puVar8 = puVar7 + -0x26;
        *(undefined1 **)(puVar7 + -0x26) = auStack_222;
        *(undefined4 *)(puVar7 + -0x2a) = 0x451fa;
        CODE4_0ae6();
      }
      puVar7 = puVar8;
    }
    if (1 < local_18) {
      *(undefined4 *)(puVar7 + -4) = unaff_A4;
      __mac_toolbox(0xa023);
    }
    *(undefined2 *)(puVar7 + -2) = 0x81;
    *(undefined4 *)(puVar7 + -6) = 0x4521e;
    bVar2 = CODE4_3a08();
  }
  else {
    iVar3 = 0;
    ppiVar10 = &piStack_34c;
    for (iVar4 = 1; (byte)(-(iVar3 < 5) & -(iVar4 <= local_18)) != 0; iVar4 = iVar4 + 1) {
      *(int *)((long)ppiVar10 + -2) = iVar4;
      *(undefined2 **)((long)ppiVar10 + -6) = &local_122;
      *(undefined4 *)((long)ppiVar10 + -10) = 0x45234;
      JT_CODE1_08a2();
      if (local_120 == 0x54455854) {
        *(undefined1 *)((long)ppiVar10 + -8) = 0;
        *(undefined1 **)((long)ppiVar10 + -0xc) = auStack_11a;
        *(undefined2 *)((long)ppiVar10 + -0xe) = local_122;
        *(undefined4 *)((long)ppiVar10 + -0x12) = 0x4524c;
        CODE4_33aa();
        *(int *)((long)ppiVar10 + -0x10) = iVar4;
        *(undefined4 *)((long)ppiVar10 + -0x14) = 0x45252;
        JT_CODE1_08e8();
        iVar3 = iVar3 + 1;
        puVar7 = (undefined1 *)((long)ppiVar10 + -0x10);
        while( true ) {
          *(undefined2 *)(puVar7 + -4) = 0x100;
          *(undefined2 **)(puVar7 + -8) = &DAT_000fbdca;
          __mac_toolbox(0xa970);
          puVar9 = puVar7 + -6;
          if (puVar7[-8] == '\0') break;
          *(undefined4 *)(puVar7 + -10) = 0x4525a;
          CODE4_1174();
          puVar7 = puVar7 + -6;
        }
      }
      else {
        local_224 = 0x122;
        *(undefined1 **)((long)ppiVar10 + -10) = auStack_330;
        *(undefined2 **)((long)ppiVar10 + -0xe) = &local_224;
        *(undefined1 **)((long)ppiVar10 + -0x12) = auStack_11a;
        *(undefined2 **)((long)ppiVar10 + -0x16) = &local_224;
        *(undefined **)((long)ppiVar10 + -0x1a) = &DAT_0004530c;
        *(undefined2 *)((long)ppiVar10 + -0x1c) = 4;
        *(undefined4 *)((long)ppiVar10 + -0x20) = 0x4528e;
        JT_CODE1_0004();
        *(undefined2 *)((long)ppiVar10 + -0x1a) = 0xff;
        *(undefined1 **)((long)ppiVar10 + -0x1e) = auStack_330;
        *(undefined1 **)((long)ppiVar10 + -0x22) = auStack_222;
        *(undefined4 *)((long)ppiVar10 + -0x26) = 0x452a0;
        JT_CODE1_03e2();
        puVar9 = (undefined1 *)((long)ppiVar10 + -0x26);
        *(undefined1 **)((long)ppiVar10 + -0x26) = auStack_222;
        *(undefined4 *)((long)ppiVar10 + -0x2a) = 0x452a8;
        CODE4_0ae6();
      }
      ppiVar10 = (int **)puVar9;
    }
    bVar2 = -(5 < local_18) & -(iVar4 <= local_18);
    if (bVar2 != 0) {
      *(undefined **)((long)ppiVar10 + -4) = &DAT_000452de;
      *(undefined4 *)((long)ppiVar10 + -8) = 0x452d6;
      bVar2 = CODE4_0ae6();
    }
  }
  return bVar2;
}



/* CODE 4 + 0x533c, synthetic address 0x0004533c */

/* Original CODE 4 resource offset 0x533c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_533c(void)

{
  undefined1 *puVar1;
  undefined1 *puVar2;
  undefined1 local_2e [2];
  undefined *puStack_2c;
  undefined4 local_28;
  undefined2 local_24;
  undefined *puStack_22;
  undefined *puStack_1e;
  
  __mac_toolbox(0xa04b);
  puStack_1e = &DAT_000453f0;
  puStack_22 = &DAT_000453ee;
  local_24 = 0;
  local_28 = DAT_000fbe2e;
  puStack_2c = &DAT_000fbe1e;
  local_2e[0] = 1;
  CODE4_1b28();
  CODE4_50de();
  puVar1 = local_2e;
  do {
    puVar2 = puVar1;
    puVar2[-2] = 0;
    *(undefined4 *)(puVar2 + -6) = 0x4536e;
    CODE4_3b88();
    __mac_toolbox(0xa9b4);
    *(undefined4 *)(puVar2 + -6) = 0x45374;
    CODE4_054e();
    *(undefined2 *)(puVar2 + -6) = 0xffff;
    *(int **)(puVar2 + -10) = &DAT_000fbdca;
    __mac_toolbox(0xa970);
    *(int **)(puVar2 + -0xe) = &DAT_000fbdca;
    __mac_toolbox(0xa97f);
    if (puVar2[-0xe] == '\0') {
      if (puVar2[-10] != '\0') {
        if (DAT_000fbdca == 1) {
          *(undefined4 *)(puVar2 + -0x10) = 0x453a2;
          CODE4_4ae2();
        }
        else if ((DAT_000fbdca == 3) || (DAT_000fbdca == 5)) {
          *(undefined4 *)(puVar2 + -0x10) = 0x453a8;
          CODE4_4c64();
        }
        else if (DAT_000fbdca == 6) {
          *(undefined4 *)(puVar2 + -0x10) = 0x453b4;
          CODE4_00e4();
        }
        else if (DAT_000fbdca == 7) {
          *(undefined4 *)(puVar2 + -0x10) = 0x453ba;
          CODE4_4dd6();
        }
        else if (DAT_000fbdca == 8) {
          *(undefined4 *)(puVar2 + -0x10) = 0x453ae;
          CODE4_1174();
        }
      }
    }
    else {
      *(undefined4 *)(puVar2 + -0x10) = 0x45392;
      CODE4_4e0a();
    }
    puVar1 = puVar2 + -0xc;
  } while (DAT_000fbdb5 == '\0');
  *(undefined4 *)(puVar2 + -0x14) = 0x453e0;
  JT_CODE1_0992();
  if (0 < *(long *)(puVar2 + -0x10)) {
    *(undefined4 *)(puVar2 + -0x10) = 0x453e8;
    CODE4_3a98();
  }
  return;
}



/* CODE 4 + 0x53fa, synthetic address 0x000453fa */

void CODE4_53fa(void)

{
  JT_CODE1_0092();
  JT_CODE1_052e();
  JT_CODE1_015a();
  JT_CODE1_01d8();
  JT_CODE5_0d4c();
  JT_CODE2_0070();
  __mac_toolbox(0xa9f1);
  CODE4_533c(JT_CODE2_0070);
  JT_CODE5_0e2e();
                    /* WARNING: Subroutine does not return */
  JT_CODE1_007c();
}



/* CODE 4 + 0x540a, synthetic address 0x0004540a */

/* Original CODE 4 resource offset 0x540a (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE4_540a(void)

{
  JT_CODE5_0d4c();
  JT_CODE2_0070();
  __mac_toolbox(0xa9f1);
  CODE4_533c(JT_CODE2_0070);
  JT_CODE5_0e2e();
                    /* WARNING: Subroutine does not return */
  JT_CODE1_007c();
}


