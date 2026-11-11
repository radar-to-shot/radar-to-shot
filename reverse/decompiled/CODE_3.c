/* Ghidra 11.3.2 decompiler output. Analysis aid, not reconstructed original source. */
/* Synthetic addresses: CODE n at n*0x10000; A5=0x100000. */
/* Original bytes retained. Pascal stack ABI and Toolbox calls may be unresolved. */


/* CODE 3 + 0x0004, synthetic address 0x00030004 */

/* WARNING: Unknown calling convention */
/* Original CODE 3 resource offset 0x0004 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE3_0004(void)

{
  int in_stack_00000004;
  short sVar1;
  
  if (in_stack_00000004 < 0) {
    sVar1 = -1;
  }
  else if (in_stack_00000004 < 1) {
    sVar1 = 0;
  }
  else {
    sVar1 = 1;
  }
  return sVar1;
}



/* CODE 3 + 0x0030, synthetic address 0x00030030 */

/* WARNING: Unknown calling convention */
/* Original CODE 3 resource offset 0x0030 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE3_0030(void)

{
  int iVar1;
  int in_stack_00000004;
  short sVar2;
  
  if (in_stack_00000004 < 0) {
    iVar1 = (int)((long)in_stack_00000004 % 0x168);
    if ((long)in_stack_00000004 % 0x168 << 0x10 < 0) {
      iVar1 = -iVar1;
    }
    in_stack_00000004 = 0x168 - iVar1;
  }
  else if (0x167 < in_stack_00000004) {
    in_stack_00000004 = in_stack_00000004 % 0x168;
  }
  if (in_stack_00000004 < 0xb4) {
    sVar2 = *(short *)((long)(in_stack_00000004 * 2 + -0x866) + 0x100000);
  }
  else {
    sVar2 = -*(int *)((long)((in_stack_00000004 + -0xb4) * 2 + -0x866) + 0x100000);
  }
  return sVar2;
}



/* CODE 3 + 0x009a, synthetic address 0x0003009a */

/* WARNING: Unknown calling convention */
/* Original CODE 3 resource offset 0x009a (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE3_009a(void)

{
  undefined2 uStack_6;
  
  uStack_6 = CODE3_0030();
  return uStack_6;
}



/* CODE 3 + 0x00ba, synthetic address 0x000300ba */

/* WARNING: Unknown calling convention */
/* Original CODE 3 resource offset 0x00ba (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE3_00ba(void)

{
  int iVar1;
  int iVar2;
  int iStack00000004;
  int iStack00000006;
  
  iVar2 = iStack00000006;
  if (iStack00000006 < 0) {
    iVar2 = -iStack00000006;
  }
  if (_iStack00000004 < 0) {
    iStack00000004 = -iStack00000004;
  }
  iVar1 = iStack00000004 + iVar2;
  if (iVar2 == iStack00000004) {
    iVar2 = (iVar2 * 0xe + 5) / 10;
  }
  else {
    iVar2 = iVar2 - iStack00000004;
    if (iVar2 < 0) {
      iVar2 = -iVar2;
    }
    iVar2 = (iVar1 * 10) / iVar2;
    if (iVar2 < 0x12) {
      if (iVar2 < 0xb) {
        iVar2 = (iVar1 * 0x3b + 0x1e) / 0x3c;
      }
      else if (iVar2 < 0xc) {
        iVar2 = (iVar1 * 0xf + 8) / 0x10;
      }
      else if (iVar2 < 0xe) {
        iVar2 = (iVar1 * 0x11 + 9) / 0x13;
      }
      else if (iVar2 < 0x10) {
        iVar2 = (iVar1 * 0x11 + 10) / 0x14;
      }
      else {
        iVar2 = (iVar1 * 9 + 6) / 0xb;
      }
    }
    else if (iVar2 < 0x14) {
      iVar2 = (iVar1 * 8 + 5) / 10;
    }
    else if (iVar2 < 0x1e) {
      iVar2 = (iVar1 * 0x10 + 10) / 0x15;
    }
    else if (iVar2 < 0x28) {
      iVar2 = (iVar1 * 0x19 + 0x11) / 0x22;
    }
    else {
      iVar2 = (iVar1 * 0x12 + 0xc) / 0x19;
    }
  }
  return iVar2;
}



/* CODE 3 + 0x01e0, synthetic address 0x000301e0 */

/* Original CODE 3 resource offset 0x01e0 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_01e0(int param_1,long *param_2)

{
  if (param_1 != 0) {
    DAT_000ff904 = 0;
  }
  *(int *)(*param_2 + 0x2284) = param_1 + *(int *)(*param_2 + 0x2284);
  *(int *)(*param_2 + 0x207a) = (*(int *)(*param_2 + 0x2284) * 100) / *(int *)(*param_2 + 0x227e);
  *(int *)(*param_2 + 0x2286) = *(int *)(*param_2 + 0x2286) + (param_1 + 1) / 2;
  return;
}



/* CODE 3 + 0x023e, synthetic address 0x0003023e */

/* WARNING: Unknown calling convention */
/* Original CODE 3 resource offset 0x023e (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

long CODE3_023e(void)

{
  long *plVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined1 *puVar5;
  undefined1 *puVar6;
  long *in_stack_00000004;
  int in_stack_00000008;
  int in_stack_0000000a;
  int in_stack_0000000c;
  undefined1 auStack_3a [10];
  int local_30;
  undefined1 auStack_2e [18];
  int local_1c;
  
  iVar3 = 0;
  iVar4 = 1;
  puVar5 = &stack0xffffffaa;
  do {
    puVar6 = puVar5;
    if ((&DAT_000fc375)[iVar4] != '\0') {
      plVar1 = *(long **)((long)(iVar4 * 0xa6 + -0x3fd0) + 0x100000);
      local_1c = *(int *)(*plVar1 + 0x2072) - in_stack_0000000c;
      if (local_1c < 0) {
        local_1c = -local_1c;
      }
      iVar2 = *(int *)(*plVar1 + 0x2074) - in_stack_0000000a;
      if (iVar2 < 0) {
        iVar2 = -iVar2;
      }
      if (iVar2 + local_1c < 0x18) {
        *(undefined1 **)(puVar5 + -8) = auStack_2e;
        local_30 = iVar2 * iVar2 + local_1c * local_1c;
        *(int **)(puVar5 + -0xc) = &local_30;
        *(undefined1 **)(puVar5 + -0x10) = auStack_3a;
        *(undefined2 *)(puVar5 + -0x12) = 0x200e;
        __mac_toolbox(0xa9eb);
        *(undefined1 **)(puVar5 + -0x16) = auStack_3a;
        *(undefined4 *)(puVar5 + -0x1a) = 0x302c2;
        JT_CODE1_01c0();
        *(undefined1 **)(puVar5 + -0x16) = auStack_2e;
        *(undefined4 *)(puVar5 + -0x1a) = 0x302cc;
        JT_CODE1_020a();
        iVar2 = *(int *)(puVar5 + -0x14);
        puVar6 = puVar5 + -0x12;
        if (iVar2 < 0x10) {
          if (iVar2 < 6) {
            iVar2 = 0x14;
          }
          else {
            iVar2 = 0x10 - iVar2;
          }
          *(long **)(puVar5 + -0x16) = plVar1;
          puVar6 = puVar5 + -0x18;
          *(int *)(puVar5 + -0x18) = iVar2;
          *(undefined4 *)(puVar5 + -0x1c) = 0x302ec;
          CODE3_01e0();
          if (in_stack_00000008 == *(int *)(*plVar1 + 0x22b4)) {
            *in_stack_00000004 = *in_stack_00000004 + (long)iVar2;
            puVar6 = puVar5 + -0x18;
          }
          else {
            iVar3 = iVar2 + iVar3;
          }
        }
      }
    }
    iVar4 = iVar4 + 1;
    puVar5 = puVar6;
  } while (iVar4 < 6);
  return (long)iVar3;
}



/* CODE 3 + 0x0324, synthetic address 0x00030324 */

/* Original CODE 3 resource offset 0x0324 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_0324(long param_1)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined2 local_16;
  
  **(undefined1 **)(param_1 + 10) = 0;
  local_16 = 1;
  do {
    if (*(char *)((long)(local_16 + -0x3c8b) + 0x100000) != '\0') {
      *(undefined4 *)(param_1 + -0x14) =
           *(undefined4 *)((long)(local_16 * 0xa6 + -0x3fd0) + 0x100000);
      *(undefined1 *)(**(long **)(param_1 + -0x14) + 0x22b6) = 0;
      if (*(int *)(**(long **)(param_1 + -0x14) + 0x120) == 0) {
        iVar6 = 2000;
        iVar3 = 200;
      }
      else {
        iVar6 = 4000;
        iVar3 = 400;
      }
      iVar1 = *(int *)(**(long **)(param_1 + -0x14) + 0x2272);
      iVar2 = *(int *)(**(long **)(param_1 + -0x14) + 0x2274);
      iVar5 = *(int *)(**(long **)(param_1 + -0x14) + 0x2276) - iVar1;
      if ((byte)(-(iVar1 != -iVar6 && SBORROW2(iVar1,-iVar6) == iVar1 + iVar6 < 0) & -(iVar5 < 0))
          == 0) {
        iVar4 = iVar1;
        if (((byte)(-(iVar1 < iVar6) & -(0 < iVar5)) != 0) &&
           (iVar4 = iVar3 + iVar1, iVar6 < iVar3 + iVar1)) {
          iVar4 = iVar6;
        }
      }
      else {
        iVar4 = iVar1 - iVar3;
        if (iVar1 - iVar3 < -iVar6) {
          iVar4 = -iVar6;
        }
      }
      iVar1 = *(int *)(**(long **)(param_1 + -0x14) + 0x2278) - iVar2;
      if ((byte)(-(iVar2 != -iVar6 && SBORROW2(iVar2,-iVar6) == iVar2 + iVar6 < 0) & -(iVar1 < 0))
          == 0) {
        iVar5 = iVar2;
        if (((byte)(-(iVar2 < iVar6) & -(0 < iVar1)) != 0) &&
           (iVar5 = iVar3 + iVar2, iVar6 < iVar3 + iVar2)) {
          iVar5 = iVar6;
        }
      }
      else {
        iVar5 = iVar2 - iVar3;
        if (iVar2 - iVar3 < -iVar6) {
          iVar5 = -iVar6;
        }
      }
      *(int *)(**(long **)(param_1 + -0x14) + 0x2272) = iVar4;
      *(int *)(**(long **)(param_1 + -0x14) + 0x2274) = iVar5;
      iVar3 = *(int *)(**(long **)(param_1 + -0x14) + 0x2080);
      iVar6 = *(int *)(**(long **)(param_1 + -0x14) + 0x207c);
      if (iVar6 < 0) {
        iVar6 = -iVar6;
      }
      *(int *)(param_1 + -0x24) = iVar3 - iVar6 / 10;
      if (*(int *)(**(long **)(param_1 + -0x14) + 0x2082) != 0) {
        *(int *)(param_1 + -0x24) = *(int *)(param_1 + -0x24) + -8;
      }
      if ((*(int *)(param_1 + -0x24) < 1) &&
         (*(undefined2 *)(param_1 + -0x24) = 0,
         *(char *)(**(long **)(param_1 + -0x14) + 0x22d8) != '\x01')) {
        *(undefined1 *)(**(long **)(param_1 + -0x14) + 0x22d8) = 1;
        *(undefined2 *)(**(long **)(param_1 + -0x14) + 0x2082) = 0;
        *(long *)(**(long **)(param_1 + -0x14) + 0x22d0) =
             *(long *)(**(long **)(param_1 + -0x14) + 0x22d0) + 1;
        *(undefined2 *)(**(long **)(param_1 + -0x14) + 0x207c) = 0;
        *(undefined2 *)(**(long **)(param_1 + -0x14) + 0x2276) = 0;
        *(undefined2 *)(**(long **)(param_1 + -0x14) + 0x2278) = 0;
      }
      if (*(int *)(param_1 + -0x24) != iVar3) {
        DAT_000ff904 = 0;
      }
      *(undefined2 *)(**(long **)(param_1 + -0x14) + 0x2080) = *(undefined2 *)(param_1 + -0x24);
    }
    local_16 = local_16 + 1;
  } while (local_16 < 6);
  return;
}



/* CODE 3 + 0x051c, synthetic address 0x0003051c */

/* WARNING: Unknown calling convention */
/* Original CODE 3 resource offset 0x051c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE3_051c(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  long in_stack_00000004;
  
  iVar1 = *(int *)(in_stack_00000004 + -0x2a) - *(int *)(in_stack_00000004 + -0x2e);
  iVar2 = *(int *)(in_stack_00000004 + -0x2c) - *(int *)(in_stack_00000004 + -0x30);
  iVar3 = *(int *)(**(long **)(in_stack_00000004 + -0x14) + 0x2072) -
          *(int *)(**(long **)(in_stack_00000004 + -0x18) + 0x2072);
  iVar4 = *(int *)(**(long **)(in_stack_00000004 + -0x14) + 0x2074) -
          *(int *)(**(long **)(in_stack_00000004 + -0x18) + 0x2074);
  return ((byte)(-(10 < iVar4) & -(-1 < iVar2)) == 0 && (byte)(-(iVar4 < -10) & -(iVar2 < 1)) == 0)
         && ((byte)(-(10 < iVar3) & -(-1 < iVar1)) == 0 &&
            (byte)(-(iVar3 < -10) & -(iVar1 < 1)) == 0);
}



/* CODE 3 + 0x05b0, synthetic address 0x000305b0 */

/* WARNING: Unknown calling convention */
/* Original CODE 3 resource offset 0x05b0 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE3_05b0(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  long in_stack_00000004;
  
  iVar2 = *(int *)(in_stack_00000004 + -0x2e);
  iVar5 = *(int *)(in_stack_00000004 + -0x30);
  if (*(char *)(**(long **)(in_stack_00000004 + -0x18) + 0x22b6) != '\0') {
    iVar2 = 0;
    iVar5 = 0;
  }
  iVar2 = *(int *)(in_stack_00000004 + -0x2a) - iVar2;
  iVar5 = *(int *)(in_stack_00000004 + -0x2c) - iVar5;
  iVar3 = *(int *)(**(long **)(in_stack_00000004 + -0x14) + 0x2072) -
          *(int *)(**(long **)(in_stack_00000004 + -0x18) + 0x2072);
  iVar4 = *(int *)(**(long **)(in_stack_00000004 + -0x14) + 0x2074) -
          *(int *)(**(long **)(in_stack_00000004 + -0x18) + 0x2074);
  iVar1 = iVar3;
  if (iVar3 < 0) {
    iVar1 = -iVar3;
  }
  if (iVar2 == 0 || iVar1 < 0xb) {
    iVar2 = 0;
  }
  else {
    if (iVar3 < 0) {
      iVar3 = -iVar3;
    }
    if (iVar2 < 0) {
      iVar2 = -iVar2;
    }
    iVar2 = ((iVar3 + -0xb) * 1000) / iVar2;
  }
  iVar3 = iVar4;
  if (iVar4 < 0) {
    iVar3 = -iVar4;
  }
  if (iVar5 == 0 || iVar3 < 0xb) {
    iVar5 = 0;
  }
  else {
    if (iVar4 < 0) {
      iVar4 = -iVar4;
    }
    if (iVar5 < 0) {
      iVar5 = -iVar5;
    }
    iVar5 = ((iVar4 + -0xb) * 1000) / iVar5;
  }
  if (iVar5 < iVar2) {
    *(undefined1 *)(in_stack_00000004 + -0x72) = 1;
    iVar5 = iVar2;
  }
  else {
    *(undefined1 *)(in_stack_00000004 + -0x72) = 0;
  }
  return iVar5;
}



/* CODE 3 + 0x06a2, synthetic address 0x000306a2 */

/* Original CODE 3 resource offset 0x06a2 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_06a2(undefined2 param_1,undefined2 param_2,long param_3)

{
  *(undefined2 *)(param_3 + 0x1f60) = 0;
  *(undefined2 *)(param_3 + 0x2156) = 0;
  *(undefined2 *)(param_3 + 0x2158) = 0;
  *(undefined2 *)(param_3 + 0x215a) = 0;
  *(undefined2 *)(param_3 + 0x215c) = 0;
  return;
}



/* CODE 3 + 0x06ca, synthetic address 0x000306ca */

/* Original CODE 3 resource offset 0x06ca (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

undefined4 CODE3_06ca(long param_1)

{
  int iVar1;
  undefined4 in_D0;
  int iVar3;
  undefined4 uVar2;
  int iVar4;
  undefined1 uStack_30;
  
  iVar1 = (int)((ulong)in_D0 >> 0x10);
  __mac_toolbox(0xa8aa);
  iVar3 = *(int *)(param_1 + -0x22) << 3;
  __mac_toolbox(0xa8a6);
  uStack_30 = (char)((ulong)(param_1 + -0x6e + (long)iVar3) >> 0x18);
  uVar2 = CONCAT31((int3)(CONCAT22(iVar1,iVar3) >> 8),uStack_30 + -1);
  if ((char)(uStack_30 + -1) != '\0') {
    *(undefined2 *)(param_1 + -0x28) = 0x7fff;
    if (*(int *)(param_1 + -0x6e + (long)(*(int *)(param_1 + -0x22) << 3)) < 0) {
      iVar3 = *(int *)(param_1 + -0x2c);
      if (iVar3 < 0) {
        iVar3 = -iVar3;
      }
      iVar1 = *(int *)(param_1 + -0x6e + (long)(*(int *)(param_1 + -0x22) << 3));
      if (iVar1 < 0) {
        iVar1 = -iVar1;
      }
      iVar3 = iVar3 - iVar1;
      if (iVar3 < 0) {
        iVar3 = -iVar3;
      }
      iVar4 = *(int *)(param_1 + -0x2c);
      if (iVar4 < 0) {
        iVar4 = -iVar4;
      }
      iVar1 = (iVar3 * 1000) % iVar4;
      *(int *)(param_1 + -0x28) = (iVar3 * 1000) / iVar4;
    }
    else if (*(int *)(DAT_000fbe26 + 0x14) <
             *(int *)(param_1 + -0x6a + (long)(*(int *)(param_1 + -0x22) << 3))) {
      iVar3 = *(int *)(param_1 + -0x2c);
      if (iVar3 < 0) {
        iVar3 = -iVar3;
      }
      iVar1 = *(int *)(param_1 + -0x6a + (long)(*(int *)(param_1 + -0x22) << 3)) -
              *(int *)(DAT_000fbe26 + 0x14);
      if (iVar1 < 0) {
        iVar1 = -iVar1;
      }
      iVar3 = iVar3 - iVar1;
      if (iVar3 < 0) {
        iVar3 = -iVar3;
      }
      iVar4 = *(int *)(param_1 + -0x2c);
      if (iVar4 < 0) {
        iVar4 = -iVar4;
      }
      iVar1 = (iVar3 * 1000) % iVar4;
      *(int *)(param_1 + -0x28) = (iVar3 * 1000) / iVar4;
    }
    if (*(int *)(param_1 + -0x28) < *(int *)(param_1 + -0x26)) {
      *(undefined2 *)(param_1 + -0x26) = *(undefined2 *)(param_1 + -0x28);
      *(undefined4 *)(param_1 + -0x1c) = *(undefined4 *)(param_1 + -0x14);
      *(undefined2 *)(param_1 + -0x36) = *(undefined2 *)(param_1 + -0x2a);
      *(undefined2 *)(param_1 + -0x3a) = *(undefined2 *)(param_1 + -0x2c);
      *(undefined4 *)(param_1 + -0x20) = 0;
    }
    *(undefined2 *)(param_1 + -0x28) = 0x7fff;
    if (*(int *)(param_1 + -0x6c + (long)(*(int *)(param_1 + -0x22) << 3)) < 0) {
      iVar3 = *(int *)(param_1 + -0x2a);
      if (iVar3 < 0) {
        iVar3 = -iVar3;
      }
      iVar1 = *(int *)(param_1 + -0x6c + (long)(*(int *)(param_1 + -0x22) << 3));
      if (iVar1 < 0) {
        iVar1 = -iVar1;
      }
      iVar3 = iVar3 - iVar1;
      if (iVar3 < 0) {
        iVar3 = -iVar3;
      }
      iVar4 = *(int *)(param_1 + -0x2a);
      if (iVar4 < 0) {
        iVar4 = -iVar4;
      }
      iVar1 = (iVar3 * 1000) % iVar4;
      *(int *)(param_1 + -0x28) = (iVar3 * 1000) / iVar4;
    }
    else if (*(int *)(DAT_000fbe26 + 0x16) <
             *(int *)(param_1 + -0x68 + (long)(*(int *)(param_1 + -0x22) << 3))) {
      iVar3 = *(int *)(param_1 + -0x2a);
      if (iVar3 < 0) {
        iVar3 = -iVar3;
      }
      iVar1 = *(int *)(param_1 + -0x68 + (long)(*(int *)(param_1 + -0x22) << 3)) -
              *(int *)(DAT_000fbe26 + 0x16);
      if (iVar1 < 0) {
        iVar1 = -iVar1;
      }
      iVar3 = iVar3 - iVar1;
      if (iVar3 < 0) {
        iVar3 = -iVar3;
      }
      iVar4 = *(int *)(param_1 + -0x2a);
      if (iVar4 < 0) {
        iVar4 = -iVar4;
      }
      iVar1 = (iVar3 * 1000) % iVar4;
      *(int *)(param_1 + -0x28) = (iVar3 * 1000) / iVar4;
    }
    uVar2 = CONCAT22(iVar1,*(int *)(param_1 + -0x28));
    if (*(int *)(param_1 + -0x28) < *(int *)(param_1 + -0x26)) {
      *(undefined2 *)(param_1 + -0x26) = *(undefined2 *)(param_1 + -0x28);
      *(undefined4 *)(param_1 + -0x1c) = *(undefined4 *)(param_1 + -0x14);
      *(undefined2 *)(param_1 + -0x36) = *(undefined2 *)(param_1 + -0x2a);
      *(undefined2 *)(param_1 + -0x3a) = *(undefined2 *)(param_1 + -0x2c);
      *(undefined4 *)(param_1 + -0x20) = 0;
    }
  }
  return uVar2;
}



/* CODE 3 + 0x0880, synthetic address 0x00030880 */

/* Original CODE 3 resource offset 0x0880 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_0880(undefined2 param_1,undefined1 *param_2)

{
  long lVar1;
  byte bVar2;
  undefined1 *puVar3;
  int unaff_D3w;
  int unaff_D4w;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined1 **ppuVar7;
  undefined1 *puVar8;
  undefined1 *puVar9;
  undefined4 auStack_8072 [8185];
  undefined1 *local_8e;
  char local_74;
  undefined4 auStack_72 [13];
  int local_3e;
  int local_3a;
  int local_34;
  int local_32;
  int local_30;
  int local_2e;
  int local_2c;
  int local_2a;
  int local_28;
  int local_26;
  long *local_24;
  long *local_20;
  long *local_1c;
  long *local_18;
  
  local_8e = &stack0xfffffffc;
  ppuVar7 = &local_8e;
  CODE3_0324();
  do {
    local_2a = 0x7fff;
    local_26 = 1;
    do {
      if ((*(char *)((long)(local_26 + -0x3c8b) + 0x100000) != '\0') &&
         (local_18 = *(long **)((long)(local_26 * 0xa6 + -0x3fd0) + 0x100000),
         *(char *)(*local_18 + 0x22b6) != '\x01')) {
        local_2e = (*(int *)(*local_18 + 0x2272) + *(int *)(*local_18 + 0x227a)) / 1000;
        *(int *)(*local_18 + 0x227a) =
             *(int *)(*local_18 + 0x2272) + *(int *)(*local_18 + 0x227a) + local_2e * -1000;
        local_30 = (*(int *)(*local_18 + 0x2274) + *(int *)(*local_18 + 0x227c)) / 1000;
        *(int *)(*local_18 + 0x227c) =
             *(int *)(*local_18 + 0x2274) + *(int *)(*local_18 + 0x227c) + local_30 * -1000;
        lVar1 = *local_18;
        iVar4 = local_26 << 3;
        *(undefined4 *)((long)auStack_72 + (long)iVar4) = *(undefined4 *)(lVar1 + 0x22a4);
        *(undefined4 *)((long)auStack_72 + (long)iVar4 + 4) = *(undefined4 *)(lVar1 + 0x22a8);
        *(long *)((long)ppuVar7 + -4) = (long)auStack_72 + (long)(local_26 << 3);
        *(int *)((long)ppuVar7 + -6) = local_2e;
        *(int *)((long)ppuVar7 + -8) = local_30;
        __mac_toolbox(0xa8a8);
        *(undefined1 **)((long)ppuVar7 + -0xc) = &stack0xfffffffc;
        *(undefined4 *)((long)ppuVar7 + -0x10) = 0x3098a;
        CODE3_06ca();
        local_28 = 1;
        ppuVar7 = (undefined1 **)((long)ppuVar7 + -0xc);
        do {
          if ((*(byte *)((long)(local_28 + -0x3c8b) + 0x100000) & -(local_26 != local_28)) != 0) {
            local_1c = *(long **)((long)(local_28 * 0xa6 + -0x3fd0) + 0x100000);
            local_32 = (*(int *)(*local_1c + 0x2272) + *(int *)(*local_1c + 0x227a)) / 1000;
            local_34 = (*(int *)(*local_1c + 0x2274) + *(int *)(*local_1c + 0x227c)) / 1000;
            *(long *)((long)ppuVar7 + -6) = (long)auStack_72 + (long)(local_26 << 3);
            *(long *)((long)ppuVar7 + -10) = *local_1c + 0x22a4;
            *(undefined4 **)((long)ppuVar7 + -0xe) = auStack_72;
            __mac_toolbox(0xa8aa);
            bVar2 = *(byte *)((long)ppuVar7 + -0xe);
            local_74 = '\0';
            puVar3 = (undefined1 *)((long)ppuVar7 + -0xc);
            if ((byte)(-(local_28 < local_26) & *(char *)(*local_1c + 0x22b6) - 1U) != 0) {
              *(long *)((long)ppuVar7 + -0x12) = (long)auStack_72 + (long)(local_26 << 3);
              *(long *)((long)ppuVar7 + -0x16) = (long)auStack_72 + (long)(local_28 << 3);
              *(undefined4 **)((long)ppuVar7 + -0x1a) = auStack_72;
              __mac_toolbox(0xa8aa);
              local_74 = *(char *)((long)ppuVar7 + -0x1a);
              puVar3 = (undefined1 *)((long)ppuVar7 + -0x18);
            }
            ppuVar7 = (undefined1 **)puVar3;
            *(long *)((long)ppuVar7 + -4) = *local_1c;
            *(undefined1 **)((long)ppuVar7 + -10) = &stack0xfffffffc;
            *(undefined4 *)((long)ppuVar7 + -0xe) = 0x30a66;
            CODE3_051c();
            if (local_74 != '\0' ||
                (bVar2 & (*(byte *)(*(long *)((long)ppuVar7 + -4) + 0x22b6) |
                         *(byte *)((long)ppuVar7 + -6))) != 0) {
              *(undefined1 **)((long)ppuVar7 + -6) = &stack0xfffffffc;
              *(undefined4 *)((long)ppuVar7 + -10) = 0x30a80;
              CODE3_05b0();
              local_2c = *(int *)((long)ppuVar7 + -2);
              if (local_2c < local_2a) {
                local_2a = local_2c;
                local_20 = local_18;
                local_3a = local_2e;
                local_3e = local_30;
                local_24 = local_1c;
                unaff_D3w = local_32;
                unaff_D4w = local_34;
              }
            }
          }
          local_28 = local_28 + 1;
        } while (local_28 < 6);
      }
      local_26 = local_26 + 1;
    } while (local_26 < 6);
    if (local_2a == 0x7fff) {
      local_26 = 1;
      do {
        if (*(char *)((long)(local_26 + -0x3c8b) + 0x100000) != '\0') {
          local_18 = *(long **)((long)(local_26 * 0xa6 + -0x3fd0) + 0x100000);
          if (*(char *)(*local_18 + 0x22b6) != '\x01') {
            lVar1 = *local_18;
            *(undefined4 *)(lVar1 + 0x22a4) =
                 *(undefined4 *)((long)auStack_72 + (long)(local_26 << 3));
            *(undefined4 *)(lVar1 + 0x22a8) =
                 *(undefined4 *)((long)auStack_72 + (long)(local_26 << 3) + 4);
          }
          *(int *)(*local_18 + 0x2072) = *(int *)(*local_18 + 0x22a6) + 5;
          *(int *)(*local_18 + 0x2074) = *(int *)(*local_18 + 0x22a4) + 5;
        }
        local_26 = local_26 + 1;
      } while (local_26 < 6);
    }
    else {
      *param_2 = 1;
      iVar4 = local_3a * local_2a;
      *(int *)((long)ppuVar7 + -4) = local_3a;
      *(undefined4 *)((long)ppuVar7 + -8) = 0x30afa;
      CODE3_0004();
      iVar4 = (*(int *)((long)ppuVar7 + -2) * 0x226 + iVar4) / 1000;
      iVar5 = local_3e * local_2a;
      *(int *)((long)ppuVar7 + -4) = local_3e;
      *(undefined4 *)((long)ppuVar7 + -8) = 0x30b1a;
      CODE3_0004();
      iVar5 = (*(int *)((long)ppuVar7 + -2) * 0x226 + iVar5) / 1000;
      *(long *)((long)ppuVar7 + -4) = *local_20 + 0x22a4;
      *(int *)((long)ppuVar7 + -6) = iVar4;
      *(int *)((long)ppuVar7 + -8) = iVar5;
      __mac_toolbox(0xa8a8);
      *(int *)(*local_20 + 0x2072) = iVar4 + *(int *)(*local_20 + 0x2072);
      *(int *)(*local_20 + 0x2074) = iVar5 + *(int *)(*local_20 + 0x2074);
      *(undefined1 *)(*local_20 + 0x22b6) = 1;
      *(int *)((long)ppuVar7 + -0xc) = *(int *)(*local_20 + 0x2272) / 100;
      *(int *)((long)ppuVar7 + -0xe) = *(int *)(*local_20 + 0x2274) / 100;
      *(undefined4 *)((long)ppuVar7 + -0x12) = 0x30b9a;
      CODE3_00ba();
      puVar9 = (undefined1 *)((long)ppuVar7 + -8);
      puVar8 = (undefined1 *)((long)ppuVar7 + -8);
      iVar4 = *(int *)((long)ppuVar7 + -10) / 6;
      if (local_24 != (long *)0x0) {
        if (*(char *)(*local_24 + 0x22b6) != '\x01') {
          iVar5 = unaff_D3w * local_2a;
          *(int *)((long)ppuVar7 + -0xc) = unaff_D3w;
          *(undefined4 *)((long)ppuVar7 + -0x10) = 0x30bc8;
          CODE3_0004();
          iVar5 = (*(int *)((long)ppuVar7 + -10) * 499 + iVar5) / 1000;
          iVar6 = unaff_D4w * local_2a;
          *(int *)((long)ppuVar7 + -0xc) = unaff_D4w;
          *(undefined4 *)((long)ppuVar7 + -0x10) = 0x30be4;
          CODE3_0004();
          iVar6 = (*(int *)((long)ppuVar7 + -10) * 499 + iVar6) / 1000;
          *(long *)((long)ppuVar7 + -0xc) = *local_24 + 0x22a4;
          *(int *)((long)ppuVar7 + -0xe) = iVar5;
          puVar8 = (undefined1 *)((long)ppuVar7 + -0x10);
          *(int *)((long)ppuVar7 + -0x10) = iVar6;
          __mac_toolbox(0xa8a8);
          *(int *)(*local_24 + 0x2072) = iVar5 + *(int *)(*local_24 + 0x2072);
          *(int *)(*local_24 + 0x2074) = iVar6 + *(int *)(*local_24 + 0x2074);
        }
        *(undefined1 *)(*local_24 + 0x22b6) = 1;
        *(int *)(puVar8 + -4) = *(int *)(*local_24 + 0x2272) / 100;
        *(int *)(puVar8 + -6) = *(int *)(*local_24 + 0x2274) / 100;
        *(undefined4 *)(puVar8 + -10) = 0x30c64;
        CODE3_00ba();
        iVar4 = *(int *)(puVar8 + -2) / 6 + iVar4;
        *(long **)(puVar8 + -4) = local_24;
        *(int *)(puVar8 + -6) = iVar4;
        *(undefined4 *)(puVar8 + -10) = 0x30c78;
        CODE3_01e0();
        *(long *)(*local_24 + 0x22cc) = *(long *)(*local_24 + 0x22cc) + (long)iVar4;
        *(long *)(puVar8 + -10) = *local_24 + 0x11c;
        puVar9 = puVar8 + -0xe;
        *(undefined1 **)(puVar8 + -0xe) = &stack0xfffffffc;
        *(undefined4 *)(puVar8 + -0x12) = 0x30ca0;
        CODE3_06a2();
      }
      *(long **)(puVar9 + -4) = local_20;
      *(int *)(puVar9 + -6) = iVar4;
      *(undefined4 *)(puVar9 + -10) = 0x30caa;
      CODE3_01e0();
      *(long *)(*local_20 + 0x22cc) = *(long *)(*local_20 + 0x22cc) + (long)iVar4;
      *(long *)(puVar9 + -10) = *local_20 + 0x11c;
      ppuVar7 = (undefined1 **)(puVar9 + -0xe);
      *(undefined1 **)(puVar9 + -0xe) = &stack0xfffffffc;
      *(undefined4 *)(puVar9 + -0x12) = 0x30cd2;
      CODE3_06a2();
    }
  } while (local_2a != 0x7fff);
  return;
}



/* CODE 3 + 0x0d70, synthetic address 0x00030d70 */

/* Original CODE 3 resource offset 0x0d70 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_0d70(long param_1)

{
  int iVar1;
  
  iVar1 = 0;
  do {
    if ((byte)(-(iVar1 != 3) &
              -(iVar1 != 4) & -(iVar1 != 7) & -(iVar1 != 9) & -(iVar1 != 1) & -(iVar1 != 0)) != 0) {
      *(undefined2 *)(param_1 + (iVar1 * 2 + 0x1f56)) = 0;
    }
    iVar1 = iVar1 + 1;
  } while (iVar1 < 0x13);
  iVar1 = 0;
  do {
    *(undefined2 *)(param_1 + (iVar1 * 2 + 0x1f7c)) = 0;
    iVar1 = iVar1 + 1;
  } while (iVar1 < 0xc9);
  *(undefined2 *)(param_1 + 0x216c) = 0xffff;
  *(undefined2 *)(param_1 + 0x2112) = 1;
  *(undefined2 *)(param_1 + 0x210e) = 0;
  *(undefined2 *)(param_1 + 0x2110) = 0;
  *(undefined2 *)(param_1 + 0x2114) = 0;
  *(undefined1 *)(param_1 + 0x2116) = 0;
  *(undefined2 *)(param_1 + 0x2118) = 0;
  *(undefined2 *)(param_1 + 0x215a) = 0;
  *(undefined2 *)(param_1 + 0x215c) = 0;
  return;
}



/* CODE 3 + 0x0e08, synthetic address 0x00030e08 */

/* WARNING: Removing unreachable block (ram,0x00030e80) */
/* WARNING: Removing unreachable block (ram,0x00030e66) */
/* WARNING: Removing unreachable block (ram,0x00030e96) */
/* Original CODE 3 resource offset 0x0e08 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

undefined4 CODE3_0e08(int param_1,long param_2,int param_3)

{
  int iVar1;
  undefined2 uVar2;
  int iVar4;
  undefined4 uVar3;
  int unaff_D6w;
  int unaff_D7w;
  
  CODE3_0d70(param_2);
  if (param_1 == 1) {
    unaff_D7w = 7;
    unaff_D6w = 7;
  }
  else if (param_1 == 2) {
    unaff_D7w = 7;
    unaff_D6w = 0xa0;
  }
  else if (param_1 == 3) {
    unaff_D7w = 0x88;
    unaff_D6w = 7;
  }
  else if (param_1 == 4) {
    unaff_D7w = 0x104;
    unaff_D6w = 7;
  }
  else if (param_1 == 5) {
    unaff_D7w = 0x104;
    unaff_D6w = 0xa0;
  }
  __mac_toolbox(0xa861);
  if (param_1 == 3) {
    __mac_toolbox(0xa861);
    uVar2 = 0xc;
    iVar4 = 0xfe;
  }
  else {
    __mac_toolbox(0xa861);
    uVar2 = 0x1b;
    iVar4 = 0x68;
  }
  iVar4 = iVar4 + unaff_D6w;
  *(int *)(param_2 + 0x1f56) = unaff_D7w + 0x32;
  *(int *)(param_2 + 0x1f58) = iVar4;
  *(undefined2 *)(param_2 + 0x1f5e) = 0;
  *(undefined2 *)(param_2 + 0x1f5c) = 0;
  *(undefined2 *)(param_2 + 0x1f68) = 0;
  *(int *)(param_2 + 0x218a) = unaff_D7w + 0x2d;
  *(int *)(param_2 + 0x218e) = unaff_D7w + 0x38;
  *(int *)(param_2 + 0x2188) = iVar4 + -5;
  *(int *)(param_2 + 0x218c) = iVar4 + 6;
  *(undefined4 *)(param_2 + 0x2190) = *(undefined4 *)(param_2 + 0x2188);
  *(undefined4 *)(param_2 + 0x2194) = *(undefined4 *)(param_2 + 0x218c);
  *(undefined1 *)(param_2 + 0x216e) = 0;
  *(undefined1 *)(param_2 + 0x216f) = 0;
  *(undefined2 *)(param_2 + 0x2168) = 0;
  *(undefined2 *)(param_2 + 0x216a) = 0;
  *(undefined2 *)(param_2 + 0x2186) = 0;
  *(undefined2 *)(param_2 + 0x215e) = 0;
  *(undefined2 *)(param_2 + 0x2160) = 0;
  *(undefined2 *)(param_2 + 0x2156) = 0;
  *(undefined2 *)(param_2 + 0x2158) = 0;
  if (*(int *)(param_2 + 6) == 0) {
    *(undefined2 *)(param_2 + 0x2166) = 200;
  }
  else if (*(int *)(param_2 + 6) == 1) {
    *(undefined2 *)(param_2 + 0x2166) = 0x136;
  }
  else {
    *(undefined2 *)(param_2 + 0x2166) = 500;
  }
  iVar4 = *(int *)(param_2 + 0xc);
  if (iVar4 == 0) {
    *(undefined2 *)(param_2 + 0x2162) = 100;
  }
  else if (iVar4 == 1) {
    *(undefined2 *)(param_2 + 0x2162) = 0x73;
  }
  else if (iVar4 == 2) {
    *(undefined2 *)(param_2 + 0x2162) = 0x82;
  }
  else if (iVar4 == 3) {
    *(undefined2 *)(param_2 + 0x2162) = 0x91;
  }
  else if (iVar4 == 4) {
    *(undefined2 *)(param_2 + 0x2162) = 0xa5;
  }
  else {
    *(undefined2 *)(param_2 + 0x2162) = 200;
  }
  iVar4 = *(int *)(param_2 + 8);
  uVar3 = CONCAT22(uVar2,iVar4);
  if (iVar4 == 0) {
    *(undefined2 *)(param_2 + 0x2164) = 0x73a;
  }
  else {
    uVar3 = CONCAT22(uVar2,iVar4 + -1);
    if (iVar4 + -1 == 0) {
      *(undefined2 *)(param_2 + 0x2164) = 0x9c4;
    }
    else {
      *(undefined2 *)(param_2 + 0x2164) = 0xc80;
    }
  }
  *(undefined2 *)(param_2 + 0x1f64) = *(undefined2 *)(param_2 + 0x2164);
  *(undefined2 *)(param_2 + 0x219c) = 0;
  *(undefined1 *)(param_2 + 0x21bc) = 0;
  if (param_3 == 1) {
    *(undefined2 *)(param_2 + 0x219e) = 0;
    iVar4 = 0;
    do {
      iVar1 = iVar4 * 4 + 0x21a0;
      uVar3 = CONCAT22((int)((ulong)uVar3 >> 0x10),iVar1);
      *(undefined4 *)(param_2 + iVar1) = 0;
      iVar4 = iVar4 + 1;
    } while (iVar4 < 7);
  }
  return uVar3;
}



/* CODE 3 + 0x0fd2, synthetic address 0x00030fd2 */

/* Original CODE 3 resource offset 0x0fd2 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_0fd2(long param_1,int param_2)

{
  if (*(int *)(*(long *)(param_1 + 0xc) + 0x1f54) <= param_2) {
    *(long *)(*(long *)(param_1 + 0xc) + 0x21b8) = *(long *)(*(long *)(param_1 + 0xc) + 0x21b8) + 1;
  }
  CODE3_0d70(*(undefined4 *)(param_1 + 0xc));
  *(undefined2 *)(param_1 + -0x24) = 0;
  *(undefined2 *)(param_1 + -0x22) = 0;
  *(undefined2 *)(param_1 + -0x1a) = 0;
  *(undefined2 *)(param_1 + -0x1c) = 0;
  return;
}



/* CODE 3 + 0x1020, synthetic address 0x00031020 */

/* Original CODE 3 resource offset 0x1020 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_1020(undefined4 param_1)

{
  CODE3_0fd2(param_1,0x7fff);
  return;
}



/* CODE 3 + 0x1036, synthetic address 0x00031036 */

/* WARNING: Unknown calling convention */
/* Original CODE 3 resource offset 0x1036 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE3_1036(void)

{
  long *plVar1;
  int iVar2;
  long lVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  long *unaff_A2;
  undefined1 *puVar8;
  undefined1 *puVar9;
  int in_stack_00000008;
  long in_stack_0000000a;
  short sVar10;
  undefined1 auStack_54 [10];
  long local_4a;
  undefined1 auStack_46 [10];
  long local_3c;
  int local_2e;
  int local_24 [2];
  undefined4 local_20;
  
  iVar4 = 1000;
  iVar6 = 1;
  puVar8 = &stack0xffffff8c;
  do {
    puVar9 = puVar8;
    if ((((&DAT_000fc375)[iVar6] & -(iVar6 != *(int *)(in_stack_0000000a + 0x2198))) != 0) &&
       (plVar1 = *(long **)((long)(iVar6 * 0xa6 + -0x3fd0) + 0x100000),
       *(int *)(*plVar1 + 0x2082) == 0)) {
      iVar7 = *(int *)(*plVar1 + 0x22a4) + 5;
      iVar2 = *(int *)(*plVar1 + 0x22a6) + 5;
      local_20 = CONCAT22(iVar7,iVar2);
      *(long *)(puVar8 + -4) = in_stack_0000000a + 0x2188;
      *(undefined4 *)(puVar8 + -8) = local_20;
      *(int **)(puVar8 + -0xc) = local_24;
      __mac_toolbox(0xa8c3);
      iVar5 = in_stack_00000008 - local_24[0];
      if (iVar5 < 0) {
        iVar5 = -iVar5;
      }
      if (0xb4 < iVar5) {
        iVar5 = 0x168 - iVar5;
      }
      puVar9 = puVar8 + -0xc;
      if (iVar5 < 0x21) {
        local_2e = (*(int *)(in_stack_0000000a + 0x218a) + 5) - iVar2;
        iVar2 = *(int *)(in_stack_0000000a + 0x2188);
        *(int *)(puVar8 + -0x10) = local_2e;
        *(int *)(puVar8 + -0x12) = (iVar2 + 5) - iVar7;
        *(undefined4 *)(puVar8 + -0x16) = 0x310dc;
        CODE3_00ba();
        iVar7 = *(int *)(puVar8 + -0xe);
        if (iVar7 == 0) {
          iVar7 = 1;
        }
        puVar9 = puVar8 + -0xc;
        if ((iVar5 <= (int)(0x136 / (long)iVar7) + 1) &&
           (puVar9 = puVar8 + -0xc,
           (byte)(-(iVar7 < *(int *)(in_stack_0000000a + 0x2166)) & -(iVar7 < iVar4)) != 0)) {
          unaff_A2 = plVar1;
          puVar9 = puVar8 + -0xc;
          iVar4 = iVar7;
        }
      }
    }
    iVar6 = iVar6 + 1;
    puVar8 = puVar9;
  } while (iVar6 < 6);
  if (iVar4 == 1000) {
    sVar10 = -1;
  }
  else {
    lVar3 = (long)(*(int *)(*unaff_A2 + 0x22a4) - *(int *)(in_stack_0000000a + 0x2188));
    *(long *)(puVar9 + -4) = lVar3;
    *(long *)(puVar9 + -8) = lVar3;
    *(undefined4 *)(puVar9 + -0xc) = 0x31130;
    JT_CODE1_0316();
    local_3c = *(long *)(puVar9 + -8);
    *(undefined1 **)(puVar9 + -0xc) = auStack_46;
    lVar3 = (long)(*(int *)(*unaff_A2 + 0x22a6) - *(int *)(in_stack_0000000a + 0x218a));
    *(long *)(puVar9 + -0x10) = lVar3;
    *(long *)(puVar9 + -0x14) = lVar3;
    *(undefined4 *)(puVar9 + -0x18) = 0x3114e;
    JT_CODE1_0316();
    local_4a = local_3c + *(long *)(puVar9 + -0x14);
    *(long **)(puVar9 + -0x14) = &local_4a;
    *(undefined1 **)(puVar9 + -0x18) = auStack_54;
    *(undefined2 *)(puVar9 + -0x1a) = 0x280e;
    __mac_toolbox(0xa9eb);
    *(undefined1 **)(puVar9 + -0x1e) = auStack_54;
    *(undefined4 *)(puVar9 + -0x22) = 0x3116e;
    JT_CODE1_01c0();
    *(undefined1 **)(puVar9 + -0x1e) = auStack_46;
    *(undefined4 *)(puVar9 + -0x22) = 0x31178;
    JT_CODE1_020a();
    sVar10 = *(short *)(puVar9 + -0x1c);
  }
  return sVar10;
}



/* CODE 3 + 0x118c, synthetic address 0x0003118c */

/* Original CODE 3 resource offset 0x118c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_118c(long param_1,undefined2 param_2)

{
  if (*(int *)(*(long *)(param_1 + 0xc) + 0x2112) < 0x1e) {
    *(undefined2 *)
     (*(long *)(param_1 + 0xc) + (long)(*(int *)(*(long *)(param_1 + 0xc) + 0x2112) * 2 + 0x2118)) =
         param_2;
    *(int *)(*(long *)(param_1 + 0xc) + 0x2112) = *(int *)(*(long *)(param_1 + 0xc) + 0x2112) + 1;
  }
  else {
    CODE3_1020(param_1);
  }
  return;
}



/* CODE 3 + 0x11de, synthetic address 0x000311de */

/* Original CODE 3 resource offset 0x11de (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_11de(long param_1)

{
  CODE3_118c(param_1,*(undefined2 *)(param_1 + -0x1a));
  return;
}



/* CODE 3 + 0x11f8, synthetic address 0x000311f8 */

/* WARNING: Unknown calling convention */
/* Original CODE 3 resource offset 0x11f8 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE3_11f8(void)

{
  long in_stack_00000004;
  short sVar1;
  
  if (*(int *)(*(long *)(in_stack_00000004 + 0xc) + 0x2112) < 2) {
    CODE3_1020();
    sVar1 = 0;
  }
  else {
    *(int *)(*(long *)(in_stack_00000004 + 0xc) + 0x2112) =
         *(int *)(*(long *)(in_stack_00000004 + 0xc) + 0x2112) + -1;
    sVar1 = *(short *)(*(long *)(in_stack_00000004 + 0xc) +
                      (long)(*(int *)(*(long *)(in_stack_00000004 + 0xc) + 0x2112) * 2 + 0x2118));
  }
  return sVar1;
}



/* CODE 3 + 0x124c, synthetic address 0x0003124c */

/* WARNING: Unknown calling convention */
/* Original CODE 3 resource offset 0x124c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

short CODE3_124c(void)

{
  uint uVar1;
  long in_stack_00000004;
  short in_stack_00000008;
  undefined2 uStack_20;
  
  if (*(char *)(in_stack_00000004 + -0x13) == '\x01') {
    if (*(int *)(in_stack_00000004 + -0x12) < 0x10) {
      in_stack_00000008 =
           *(short *)(*(long *)(in_stack_00000004 + 0xc) +
                     (long)(*(int *)(in_stack_00000004 + -0x12) * 2 + 0x1f56));
    }
    else if (*(int *)(in_stack_00000004 + -0x12) == 0x11) {
      if (*(int *)(*(long *)(in_stack_00000004 + 0xc) + 0x1f78) == 0) {
        in_stack_00000008 = 0;
      }
      else {
        __mac_toolbox(0xa861);
        if (uStack_20 < 0) {
          uStack_20 = -uStack_20;
        }
        in_stack_00000008 = uStack_20 % *(int *)(*(long *)(in_stack_00000004 + 0xc) + 0x1f78);
      }
    }
    else if (*(int *)(in_stack_00000004 + -0x12) == 0x10) {
      in_stack_00000008 = *(short *)(*(long *)(in_stack_00000004 + 0xc) + 0x216c);
    }
    else if (*(int *)(in_stack_00000004 + -0x12) == 0x12) {
      uStack_20 = CODE3_11f8();
      in_stack_00000008 = uStack_20;
    }
  }
  else if (*(char *)(in_stack_00000004 + -0x13) == '\x04') {
    in_stack_00000008 =
         *(short *)(*(long *)(in_stack_00000004 + 0xc) +
                   (long)(*(int *)(in_stack_00000004 + -0x12) * 2 + 0x1f7c));
  }
  else if (*(char *)(in_stack_00000004 + -0x13) == '\x05') {
    uVar1 = *(uint *)(*(long *)(in_stack_00000004 + 0xc) + 0x1f7c +
                     (long)(*(int *)(in_stack_00000004 + -0x12) * 2));
    if (uVar1 < 0xc9) {
      in_stack_00000008 =
           *(short *)(*(long *)(in_stack_00000004 + 0xc) + (long)(int)(uVar1 * 2 + 0x1f7c));
    }
    else {
      CODE3_1020();
    }
  }
  else {
    in_stack_00000008 = *(short *)(in_stack_00000004 + -0x12);
  }
  return in_stack_00000008;
}



/* CODE 3 + 0x135c, synthetic address 0x0003135c */

/* Original CODE 3 resource offset 0x135c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

uint CODE3_135c(long param_1)

{
  int iVar1;
  byte bVar2;
  long lVar3;
  long lVar4;
  long lVar5;
  long lVar6;
  long lVar7;
  uint uVar8;
  uint uVar9;
  int unaff_D7w;
  int iVar10;
  undefined1 *puVar11;
  undefined1 *puVar12;
  undefined1 local_6e [4];
  undefined1 auStack_6a [4];
  undefined4 uStack_66;
  undefined4 uStack_62;
  undefined2 local_5e;
  undefined4 local_5c;
  undefined1 auStack_58 [4];
  int iStack_54;
  undefined4 *local_52;
  undefined4 local_4e;
  undefined4 local_4a;
  int iStack_46;
  short local_44;
  undefined1 auStack_32 [4];
  undefined4 uStack_2e;
  undefined2 uStack_2a;
  undefined4 local_28;
  undefined1 auStack_24 [32];
  
  lVar7 = CONCAT22(local_4e._0_2_,local_4e._2_2_);
  lVar6 = CONCAT22(local_4e._0_2_,local_4e._2_2_);
  lVar5 = CONCAT22(local_4e._0_2_,local_4e._2_2_);
  lVar4 = CONCAT22(local_4e._0_2_,local_4e._2_2_);
  lVar3 = CONCAT22(local_4e._0_2_,local_4e._2_2_);
  puVar11 = &stack0xffffffbe;
  if (*(char *)(param_1 + -0x13) == '\x04') {
    uVar9 = *(int *)(param_1 + -0x12) * 2 + 0x1f7c;
    *(undefined2 *)(*(long *)(param_1 + 0xc) + (long)(int)uVar9) = *(undefined2 *)(param_1 + -0x1c);
  }
  else {
    local_4e._2_2_ = (short)param_1;
    iStack_46 = local_4e._2_2_;
    local_4e._0_2_ = (int)((ulong)param_1 >> 0x10);
    if (*(char *)(param_1 + -0x13) == '\x01') {
      uVar9 = *(uint *)(param_1 + -0x12);
      if (uVar9 < 0x13) {
        uVar8 = *(uint *)((long)&switchD_000319a0::switchdataD_000319a4 + (long)(int)(uVar9 * 2));
        switch(uVar9) {
        case 0:
        case 1:
          uVar9 = uVar8;
          break;
        case 2:
          uVar9 = *(uint *)(param_1 + -0x1c);
          if ((int)uVar9 < 0) {
            iVar10 = (int)((long)(int)uVar9 % 0x168);
            if ((long)(int)uVar9 % 0x168 << 0x10 < 0) {
              iVar10 = -iVar10;
            }
            uVar9 = 0x168 - iVar10;
            uVar8 = uVar9;
          }
          else if (0x167 < (int)uVar9) {
            uVar9 = (int)uVar9 % 0x168;
          }
          *(uint *)(*(long *)(param_1 + 0xc) + 0x1f5a) = uVar9;
          uVar9 = uVar8;
          break;
        case 3:
          uVar9 = uVar8;
          if (*(int *)(*(long *)(param_1 + 0xc) + 0x1f5c) == 0) {
            *(undefined1 *)(*(long *)(param_1 + 0xc) + 0x216e) = 1;
            *(undefined1 *)(*(long *)(param_1 + 0xc) + 0x216f) = 0;
            iStack_46 = *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x1f5a);
            local_4a._0_2_ = 3;
            local_4a._2_2_ = 0x1404;
            local_44 = CODE3_0030();
            local_4a._2_2_ = *(int *)(param_1 + -0x1c);
            iStack_46 = local_44 >> 0xf;
            local_4a._0_2_ = local_4a._2_2_ >> 0xf;
            local_4e._0_2_ = 3;
            local_4e._2_2_ = 0x1416;
            JT_CODE1_0316();
            local_4e._0_2_ = 0;
            local_4e._2_2_ = 0x640;
            local_52 = (undefined4 *)0x31420;
            JT_CODE1_02ec();
            *(short *)(*(long *)(param_1 + 0xc) + 0x217a) = local_4e._2_2_;
            local_4e._0_2_ = *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x1f5a);
            local_52 = (undefined4 *)0x31438;
            local_4e._2_2_ = CODE3_009a();
            local_52 = (undefined4 *)(long)*(int *)(param_1 + -0x1c);
            local_4e._0_2_ = local_4e._2_2_ >> 0xf;
            auStack_58._2_2_ = 3;
            iStack_54 = 0x144a;
            JT_CODE1_0316();
            auStack_58._2_2_ = 0;
            iStack_54 = 0x640;
            local_5c._2_2_ = 3;
            auStack_58._0_2_ = 0x1454;
            JT_CODE1_02ec();
            *(int *)(*(long *)(param_1 + 0xc) + 0x217c) = -iStack_54;
            *(int *)(*(long *)(param_1 + 0xc) + 0x2174) =
                 *(int *)(*(long *)(param_1 + 0xc) + 0x1f56) +
                 *(int *)(*(long *)(param_1 + 0xc) + 0x217a);
            *(int *)(*(long *)(param_1 + 0xc) + 0x2172) =
                 *(int *)(*(long *)(param_1 + 0xc) + 0x1f58) +
                 *(int *)(*(long *)(param_1 + 0xc) + 0x217c);
            iVar10 = *(int *)(param_1 + -0x1c);
            if (iVar10 < 0) {
              iVar10 = -iVar10;
            }
            *(int *)(*(long *)(param_1 + 0xc) + 0x2176) = iVar10 / 0x12 + 1;
            *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x2178) = 0;
            *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x2180) =
                 *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x1f56);
            *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x217e) =
                 *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x1f58);
            *(int *)(param_1 + -0x18) = *(int *)(param_1 + -0x18) + 10;
            *(undefined4 *)(*(long *)(param_1 + 0xc) + 0x2182) =
                 *(undefined4 *)(*(long *)(param_1 + 0xc) + 0x217e);
            iVar10 = *(int *)(*(long *)(param_1 + 0xc) + 2);
            if (iVar10 == 0) {
              unaff_D7w = 0x1c;
              uVar9 = 0;
            }
            else if (iVar10 == 1) {
              unaff_D7w = 0x14;
              uVar9 = 0;
            }
            else if (iVar10 == 2) {
              unaff_D7w = 0xf;
              uVar9 = 0;
            }
            else if (iVar10 == 3) {
              unaff_D7w = 0xb;
              uVar9 = 0;
            }
            else {
              uVar9 = iVar10 - 4;
              if (uVar9 == 0) {
                unaff_D7w = 7;
              }
            }
            if (unaff_D7w < *(int *)(*(long *)(param_1 + 0xc) + 0x2176)) {
              unaff_D7w = *(int *)(*(long *)(param_1 + 0xc) + 0x2176);
            }
            *(int *)(*(long *)(param_1 + 0xc) + 0x1f5c) = unaff_D7w;
          }
          break;
        case 4:
          uVar9 = uVar8;
          break;
        case 5:
          uVar9 = uVar8;
          if (0 < *(int *)(*(long *)(param_1 + 0xc) + 0x1f64)) {
            iVar10 = *(int *)(param_1 + -0x1c);
            if (iVar10 < 0) {
              iVar10 = 0;
            }
            else {
              uVar8 = *(uint *)(*(long *)(param_1 + 0xc) + 4);
              if (uVar8 == 0) {
                if (0x14 < iVar10) {
                  iVar10 = 0x14;
                }
              }
              else if (0x28 < iVar10) {
                iVar10 = 0x28;
              }
            }
            *(int *)(*(long *)(param_1 + 0xc) + 0x1f60) = iVar10;
            uVar9 = uVar8;
          }
          break;
        case 6:
          uVar9 = *(uint *)(param_1 + -0x1c);
          if ((int)uVar9 < 0) {
            iVar10 = (int)((long)(int)uVar9 % 0x168);
            if ((long)(int)uVar9 % 0x168 << 0x10 < 0) {
              iVar10 = -iVar10;
            }
            uVar9 = 0x168 - iVar10;
            uVar8 = uVar9;
          }
          else if (0x167 < (int)uVar9) {
            uVar9 = (int)uVar9 % 0x168;
          }
          *(uint *)(*(long *)(param_1 + 0xc) + 0x1f62) = uVar9;
          uVar9 = uVar8;
          break;
        case 7:
          uVar9 = uVar8;
          break;
        case 8:
          bVar2 = -(0 < *(int *)(*(long *)(param_1 + 0xc) + 0x1f64)) &
                  -(0 < *(int *)(*(long *)(param_1 + 0xc) + 10));
          uVar9 = CONCAT11((char)(uVar8 >> 8),bVar2);
          if (bVar2 != 0) {
            *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x1f66) = *(undefined2 *)(param_1 + -0x1c);
          }
          break;
        case 9:
          uVar9 = uVar8;
          break;
        default:
          uVar9 = *(int *)(param_1 + -0x12) * 2 + 0x1f56;
          *(undefined2 *)(*(long *)(param_1 + 0xc) + (long)(int)uVar9) =
               *(undefined2 *)(param_1 + -0x1c);
          break;
        case 0xd:
          *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x1f70) = *(undefined2 *)(param_1 + -0x1c);
          iVar10 = *(int *)(param_1 + -0x1c);
          iVar1 = *(int *)(*(long *)(param_1 + 0xc) + 0x1f6e);
          if (iVar10 == 0 || iVar1 == 0) {
            if ((byte)(-(iVar10 == 0) & -(iVar1 == 0)) == 0) {
              if (iVar1 == 0) {
                if (iVar10 < 1) {
                  iVar10 = 0;
                  unique0x1000069c = (undefined1 *)CONCAT22(local_6e._2_2_,auStack_6a._0_2_);
                  uStack_66 = (undefined1 *)CONCAT22(uStack_66._0_2_,uStack_66._2_2_);
                  local_5c = (undefined1 *)CONCAT22(local_5c._0_2_,local_5c._2_2_);
                  unique0x100006cc = (undefined1 *)CONCAT22(auStack_58._2_2_,iStack_54);
                  local_4e = lVar5;
                  puVar12 = (undefined1 *)CONCAT22(local_4a._0_2_,local_4a._2_2_);
                }
                else {
                  iVar10 = 0xb4;
                  unique0x10000698 = (undefined1 *)CONCAT22(local_6e._2_2_,auStack_6a._0_2_);
                  uStack_66 = (undefined1 *)CONCAT22(uStack_66._0_2_,uStack_66._2_2_);
                  local_5c = (undefined1 *)CONCAT22(local_5c._0_2_,local_5c._2_2_);
                  unique0x100006c8 = (undefined1 *)CONCAT22(auStack_58._2_2_,iStack_54);
                  local_4e = lVar4;
                  puVar12 = (undefined1 *)CONCAT22(local_4a._0_2_,local_4a._2_2_);
                }
              }
              else if (iVar1 < 1) {
                iVar10 = 0x10e;
                local_4e = lVar7;
                puVar12 = (undefined1 *)CONCAT22(local_4a._0_2_,local_4a._2_2_);
              }
              else {
                iVar10 = 0x5a;
                unique0x100006a0 = (undefined1 *)CONCAT22(local_6e._2_2_,auStack_6a._0_2_);
                uStack_66 = (undefined1 *)CONCAT22(uStack_66._0_2_,uStack_66._2_2_);
                local_5c = (undefined1 *)CONCAT22(local_5c._0_2_,local_5c._2_2_);
                unique0x100006d0 = (undefined1 *)CONCAT22(auStack_58._2_2_,iStack_54);
                local_4e = lVar6;
                puVar12 = (undefined1 *)CONCAT22(local_4a._0_2_,local_4a._2_2_);
              }
            }
            else {
              iVar10 = 0;
              unique0x10000694 = (undefined1 *)CONCAT22(local_6e._2_2_,auStack_6a._0_2_);
              uStack_66 = (undefined1 *)CONCAT22(uStack_66._0_2_,uStack_66._2_2_);
              local_5c = (undefined1 *)CONCAT22(local_5c._0_2_,local_5c._2_2_);
              unique0x100006c4 = (undefined1 *)CONCAT22(auStack_58._2_2_,iStack_54);
              local_4e = lVar3;
              puVar12 = (undefined1 *)CONCAT22(local_4a._0_2_,local_4a._2_2_);
            }
          }
          else {
            local_28._0_2_ = iVar10;
            local_28._2_2_ = iVar10;
            if (iVar10 < 1) {
              if (iVar1 < 1) {
                local_4a = auStack_24;
                local_4e = (long)&local_28 + 2;
                local_52 = &local_28;
                unique0x00009380 = auStack_32;
                auStack_58._0_2_ = 0x200e;
                __mac_toolbox(0xa9eb);
                local_5c = auStack_32;
                local_5e = 0x2006;
                __mac_toolbox(0xa9eb);
                uStack_62 = auStack_32;
                uStack_66._0_2_ = 3;
                uStack_66._2_2_ = 0x17a4;
                local_28._2_2_ = iVar1;
                JT_CODE1_01a0();
                uStack_62 = &DAT_00031a38;
                uStack_66 = auStack_24;
                auStack_6a._2_2_ = 4;
                __mac_toolbox(0xa9eb);
                unique0x00009380 = auStack_24;
                local_6e._0_2_ = 0x17bc;
                JT_CODE1_020a();
                puVar11 = auStack_6a + 2;
                iVar10 = auStack_6a._0_2_ + 0x10e;
                puVar12 = local_4a;
              }
              else {
                local_4a = auStack_24;
                local_4e = (long)&local_28 + 2;
                local_52 = &local_28;
                unique0x00009380 = auStack_32;
                auStack_58._0_2_ = 0x200e;
                __mac_toolbox(0xa9eb);
                local_5c = auStack_32;
                local_5e = 0x2006;
                __mac_toolbox(0xa9eb);
                uStack_62 = auStack_32;
                uStack_66._2_2_ = 0xd;
                __mac_toolbox(0xa9eb);
                unique0x00009380 = auStack_32;
                local_6e._2_2_ = 3;
                auStack_6a._0_2_ = 0x1754;
                local_28._0_2_ = iVar1;
                JT_CODE1_01a0();
                auStack_6a._2_2_ = 3;
                uStack_66._0_2_ = 0x1a42;
                unique0x00009380 = auStack_24;
                local_6e._0_2_ = 4;
                __mac_toolbox(0xa9eb);
                puVar11 = auStack_24;
                JT_CODE1_020a((int)((ulong)puVar11 >> 0x10));
                iVar10 = (int)puVar11;
                puVar11 = local_6e;
                puVar12 = local_4a;
              }
            }
            else if (iVar1 < 1) {
              local_4a = auStack_24;
              local_4e = (long)&local_28 + 2;
              local_52 = &local_28;
              unique0x00009380 = auStack_32;
              auStack_58._0_2_ = 0x200e;
              __mac_toolbox(0xa9eb);
              local_5c = auStack_32;
              local_5e = 0x2006;
              __mac_toolbox(0xa9eb);
              uStack_62 = auStack_32;
              uStack_66._2_2_ = 0xd;
              __mac_toolbox(0xa9eb);
              unique0x00009380 = auStack_32;
              local_6e._2_2_ = 3;
              auStack_6a._0_2_ = 0x16f0;
              local_28._0_2_ = iVar1;
              JT_CODE1_01a0();
              auStack_6a._2_2_ = 3;
              uStack_66._0_2_ = 0x1a4c;
              unique0x00009380 = auStack_24;
              local_6e._0_2_ = 4;
              __mac_toolbox(0xa9eb);
              puVar12 = auStack_24;
              JT_CODE1_020a();
              puVar11 = local_6e;
              iVar10 = (int)puVar12 + 0xb4;
              puVar12 = local_4a;
            }
            else {
              local_4a = auStack_24;
              local_4e = (long)&local_28 + 2;
              local_52 = &local_28;
              unique0x00009380 = auStack_32;
              auStack_58._0_2_ = 0x200e;
              __mac_toolbox(0xa9eb);
              local_5c = auStack_32;
              local_5e = 0x2006;
              __mac_toolbox(0xa9eb);
              uStack_62 = auStack_32;
              uStack_66._0_2_ = 3;
              uStack_66._2_2_ = 0x1694;
              local_28._2_2_ = iVar1;
              JT_CODE1_01a0();
              uStack_62 = &DAT_00031a56;
              uStack_66 = auStack_24;
              auStack_6a._2_2_ = 4;
              __mac_toolbox(0xa9eb);
              unique0x00009380 = auStack_24;
              local_6e._0_2_ = 0x16ac;
              JT_CODE1_020a();
              puVar11 = auStack_6a + 2;
              iVar10 = auStack_6a._0_2_ + 0x5a;
              puVar12 = local_4a;
            }
          }
          local_4a._0_2_ = (int)((ulong)puVar12 >> 0x10);
          local_4a._2_2_ = (int)puVar12;
          *(int *)(*(long *)(param_1 + 0xc) + 0x1f72) = iVar10;
          *(undefined1 **)(puVar11 + -8) = auStack_24;
          iVar10 = *(int *)(param_1 + -0x1c);
          *(long *)(puVar11 + -0xc) = (long)*(int *)(param_1 + -0x1c);
          *(long *)(puVar11 + -0x10) = (long)iVar10;
          *(undefined4 *)(puVar11 + -0x14) = 0x317e6;
          JT_CODE1_0316();
          *(long *)(puVar11 + -0x14) = (long)iVar1;
          *(long *)(puVar11 + -0x18) = (long)iVar1;
          *(undefined4 *)(puVar11 + -0x1c) = 0x317f6;
          JT_CODE1_0316();
          local_28 = *(long *)(puVar11 + -0x14) + *(long *)(puVar11 + -0x18);
          *(undefined4 **)(puVar11 + -0x14) = &local_28;
          *(undefined1 **)(puVar11 + -0x18) = auStack_32;
          *(undefined2 *)(puVar11 + -0x1a) = 0x280e;
          __mac_toolbox(0xa9eb);
          *(undefined1 **)(puVar11 + -0x1e) = auStack_32;
          *(undefined4 *)(puVar11 + -0x22) = 0x31814;
          JT_CODE1_01c0();
          *(undefined1 **)(puVar11 + -0x1e) = auStack_24;
          *(undefined4 *)(puVar11 + -0x22) = 0x3181e;
          JT_CODE1_020a();
          *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x1f74) = *(undefined2 *)(puVar11 + -0x1c);
          uVar9 = *(int *)(param_1 + -0x18) + 0x32;
          *(uint *)(param_1 + -0x18) = uVar9;
          break;
        case 0xe:
          *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x1f72) = *(undefined2 *)(param_1 + -0x1c);
          uVar9 = uVar8;
          break;
        case 0xf:
          *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x1f74) = *(undefined2 *)(param_1 + -0x1c);
          local_4a = auStack_24;
          local_4e = *(long *)(param_1 + 0xc) + 0x1f72;
          local_52 = &uStack_2e;
          uStack_2e = DAT_00031a2e;
          uStack_2a = (undefined2)((ulong)DAT_00031a32 >> 0x10);
          local_28._0_2_ = (int)DAT_00031a32;
          local_28._2_2_ = DAT_00031a36;
          iStack_54 = 0x2004;
          __mac_toolbox(0xa9eb);
          auStack_58 = (undefined1  [4])&uStack_2e;
          local_5c._0_2_ = 3;
          local_5c._2_2_ = 0x187c;
          JT_CODE1_0198();
          auStack_58 = (undefined1  [4])(param_1 + -0x1c);
          local_5c = auStack_24;
          local_5e = 0x2004;
          __mac_toolbox(0xa9eb);
          uStack_62 = auStack_24;
          uStack_66._0_2_ = 3;
          uStack_66._2_2_ = 0x1894;
          JT_CODE1_020a();
          *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x1f6e) = uStack_62._2_2_;
          uStack_66 = auStack_24;
          auStack_6a = (undefined1  [4])(*(long *)(param_1 + 0xc) + 0x1f72);
          local_6e = (undefined1  [4])&uStack_2e;
          uStack_2e = DAT_00031a24;
          uStack_2a = (undefined2)((ulong)DAT_00031a28 >> 0x10);
          local_28._0_2_ = (int)DAT_00031a28;
          local_28._2_2_ = DAT_00031a2c;
          __mac_toolbox(0xa9eb);
          JT_CODE1_019c(&uStack_2e,0x2004);
          __mac_toolbox(0xa9eb);
          __mac_toolbox(0xa9eb);
          puVar11 = auStack_24;
          JT_CODE1_020a(puVar11,0xd,auStack_24,0x2004,auStack_24,param_1 + -0x1c);
          *(int *)(*(long *)(param_1 + 0xc) + 0x1f70) = (int)puVar11;
          uVar9 = *(int *)(param_1 + -0x18) + 0x32;
          *(uint *)(param_1 + -0x18) = uVar9;
          break;
        case 0x10:
          local_4a._0_2_ = *(int *)(param_1 + -0x1c);
          if (local_4a._0_2_ < 0) {
            iVar10 = (int)((long)local_4a._0_2_ % 0x168);
            if ((long)local_4a._0_2_ % 0x168 << 0x10 < 0) {
              iVar10 = -iVar10;
            }
            local_4a._0_2_ = 0x168 - iVar10;
          }
          else if (0x167 < local_4a._0_2_) {
            local_4a._0_2_ = local_4a._0_2_ % 0x168;
          }
          *(int *)(*(long *)(param_1 + 0xc) + 0x1f76) = local_4a._0_2_;
          local_4a._2_2_ = (int)((ulong)*(undefined4 *)(param_1 + 0xc) >> 0x10);
          iStack_46 = (int)*(undefined4 *)(param_1 + 0xc);
          local_52 = (undefined4 *)0x3194c;
          local_44 = CODE3_1036();
          *(short *)(*(long *)(param_1 + 0xc) + 0x216c) = local_44;
          uVar9 = *(int *)(param_1 + -0x18) + 0x28;
          *(uint *)(param_1 + -0x18) = uVar9;
          *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x2186) = 1;
          break;
        case 0x11:
          uVar9 = *(int *)(param_1 + -0x12) * 2 + 0x1f56;
          *(undefined2 *)(*(long *)(param_1 + 0xc) + (long)(int)uVar9) =
               *(undefined2 *)(param_1 + -0x1c);
          break;
        case 0x12:
          local_44 = *(undefined2 *)(param_1 + -0x1c);
          local_4e._2_2_ = 3;
          local_4a._0_2_ = 0x1990;
          local_4a._2_2_ = local_4e._0_2_;
          uVar9 = CODE3_118c();
        }
      }
    }
    else if (*(char *)(param_1 + -0x13) == '\x05') {
      uVar9 = *(uint *)(*(long *)(param_1 + 0xc) + 0x1f7c + (long)(*(int *)(param_1 + -0x12) * 2));
      if (uVar9 < 0xc9) {
        uVar9 = uVar9 * 2 + 0x1f7c;
        *(undefined2 *)(*(long *)(param_1 + 0xc) + (long)(int)uVar9) =
             *(undefined2 *)(param_1 + -0x1c);
      }
      else {
        local_4a._0_2_ = 3;
        local_4a._2_2_ = 0x19fa;
        iStack_46 = local_4e._0_2_;
        local_44 = local_4e._2_2_;
        uVar9 = CODE3_1020();
      }
    }
    else {
      local_44 = 0x7fff;
      local_4e._2_2_ = 3;
      local_4a._0_2_ = 0x1a1a;
      local_4a._2_2_ = local_4e._0_2_;
      uVar9 = CODE3_0fd2();
    }
  }
  return uVar9;
}



/* CODE 3 + 0x1a60, synthetic address 0x00031a60 */

/* WARNING: Unknown calling convention */
/* Original CODE 3 resource offset 0x1a60 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE3_1a60(void)

{
  bool bVar1;
  long in_stack_00000004;
  int in_stack_00000008;
  
  bVar1 = in_stack_00000008 <= *(int *)(*(long *)(in_stack_00000004 + 0xc) + 0x1f54);
  if (!bVar1 || -1 >= in_stack_00000008) {
    CODE3_1020();
  }
  return bVar1 && -1 < in_stack_00000008;
}



/* CODE 3 + 0x1a9c, synthetic address 0x00031a9c */

/* Original CODE 3 resource offset 0x1a9c (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_1a9c(long param_1)

{
  byte bVar1;
  
  bVar1 = CODE3_1a60();
  if (bVar1 != 0) {
    CODE3_11de(param_1);
    *(undefined2 *)(param_1 + -0x1a) = *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x1f6c);
    *(undefined2 *)(*(long *)(param_1 + 0xc) + 0x2118) = *(undefined2 *)(param_1 + -0x1c);
    *(undefined1 *)(*(long *)(param_1 + 0xc) + 0x2116) = 1;
    *(int *)(param_1 + -0x18) = *(int *)(param_1 + -0x18) + 1;
  }
  return;
}



/* CODE 3 + 0x1af0, synthetic address 0x00031af0 */

/* WARNING: Unknown calling convention */
/* Original CODE 3 resource offset 0x1af0 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE3_1af0(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  byte bVar5;
  undefined1 **ppuVar6;
  char in_stack_00000004;
  int in_stack_00000006;
  long in_stack_00000008;
  undefined1 *local_42;
  uint local_20;
  int local_1e;
  int local_1c;
  undefined1 local_18;
  
  ppuVar6 = (undefined1 **)&stack0xffffffc2;
  bVar5 = 0;
  *(int *)(in_stack_00000008 + 0x1f68) = DAT_000fc382 + -1;
  local_1e = *(int *)(in_stack_00000008 + 0x210e);
  local_20 = *(uint *)(in_stack_00000008 + 0x2114);
  local_1c = 0;
  iVar2 = *(int *)(in_stack_00000008 + 0x1f60);
  iVar3 = *(int *)(in_stack_00000008 + 0x1f62);
  if (in_stack_00000004 != '\0') {
    if ((0 < *(int *)(in_stack_00000008 + 0x1f5c)) &&
       (*(int *)(in_stack_00000008 + 0x1f5c) = *(int *)(in_stack_00000008 + 0x1f5c) + -1,
       *(int *)(in_stack_00000008 + 0x1f5c) < 1)) {
      if ((byte)(*(char *)(in_stack_00000008 + 0x216f) - 1U &
                *(char *)(in_stack_00000008 + 0x216e) - 1U) == 0) {
        *(undefined2 *)(in_stack_00000008 + 0x1f5c) = 1;
      }
      else {
        *(undefined2 *)(in_stack_00000008 + 0x1f5c) = 0;
      }
    }
    if ((byte)(*(char *)(in_stack_00000008 + 0x2116) - 1U &
              -(*(int *)(in_stack_00000008 + 0x1f6a) != 0)) != 0) {
      ppuVar6 = &local_42;
      local_42 = &stack0xfffffffc;
      CODE3_1a9c();
    }
  }
  for (; (byte)(bVar5 - 1 & -(local_1c < in_stack_00000006)) != 0; local_1c = local_1c + 1) {
    iVar4 = local_1e + 1;
    local_18 = (undefined1)
               ((ulong)*(undefined4 *)(in_stack_00000008 + 0x10 + (long)(local_1e << 2)) >> 0x18);
    switch(local_18) {
    case 0:
      break;
    case 1:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31be8;
      CODE3_124c();
      local_20 = *(uint *)((long)ppuVar6 + -2);
      break;
    case 2:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31bf8;
      CODE3_124c();
      local_20 = local_20 + *(int *)((long)ppuVar6 + -2);
      break;
    case 3:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31c0e;
      CODE3_124c();
      local_20 = local_20 - *(int *)((long)ppuVar6 + -2);
      break;
    case 4:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31c24;
      CODE3_124c();
      local_20 = *(int *)((long)ppuVar6 + -2) * local_20;
      break;
    case 5:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31c3a;
      CODE3_124c();
      if (*(int *)((long)ppuVar6 + -2) == 0) {
        if ((int)local_20 < 1) {
          local_20 = 0x8001;
        }
        else {
          local_20 = 0x7fff;
        }
      }
      else {
        local_20 = (int)local_20 / *(int *)((long)ppuVar6 + -2);
      }
      break;
    case 6:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31c72;
      CODE3_124c();
      if (*(int *)((long)ppuVar6 + -2) == 0) {
        local_20 = 0;
      }
      else {
        local_20 = (int)local_20 % *(int *)((long)ppuVar6 + -2);
      }
      break;
    case 7:
      *(long *)((long)ppuVar6 + -4) = (long)(int)local_20;
      *(undefined1 **)((long)ppuVar6 + -10) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -0xe) = 0x31ca2;
      CODE3_124c();
      local_20 = *(uint *)((long)ppuVar6 + -6) & (uint)*(undefined4 *)((long)ppuVar6 + -4);
      break;
    case 8:
      *(long *)((long)ppuVar6 + -4) = (long)(int)local_20;
      *(undefined1 **)((long)ppuVar6 + -10) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -0xe) = 0x31cc2;
      CODE3_124c();
      local_20 = *(uint *)((long)ppuVar6 + -6) | (uint)*(undefined4 *)((long)ppuVar6 + -4);
      break;
    case 9:
      *(long *)((long)ppuVar6 + -4) = (long)(int)local_20;
      *(undefined1 **)((long)ppuVar6 + -10) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -0xe) = 0x31ce2;
      CODE3_124c();
      local_20 = (uint)*(undefined4 *)((long)ppuVar6 + -4) ^ *(uint *)((long)ppuVar6 + -6);
      break;
    case 10:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31cfa;
      CODE3_124c();
      if (*(uint *)((long)ppuVar6 + -2) != local_20) {
        iVar4 = local_1e + 2;
      }
      break;
    case 0xb:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31d1a;
      CODE3_124c();
      if ((int)local_20 <= *(int *)((long)ppuVar6 + -2)) {
        iVar4 = local_1e + 2;
      }
      break;
    case 0xc:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31d5a;
      CODE3_124c();
      if (*(int *)((long)ppuVar6 + -2) <= (int)local_20) {
        iVar4 = local_1e + 2;
      }
      break;
    case 0xd:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31d3a;
      CODE3_124c();
      if ((int)local_20 < *(int *)((long)ppuVar6 + -2)) {
        iVar4 = local_1e + 2;
      }
      break;
    case 0xe:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31d7a;
      CODE3_124c();
      if (*(int *)((long)ppuVar6 + -2) < (int)local_20) {
        iVar4 = local_1e + 2;
      }
      break;
    case 0xf:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31d9a;
      CODE3_124c();
      if (*(uint *)((long)ppuVar6 + -2) == local_20) {
        iVar4 = local_1e + 2;
      }
      break;
    case 0x10:
      *(undefined1 **)((long)ppuVar6 + -4) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -8) = 0x31db8;
      CODE3_135c();
      ppuVar6 = (undefined1 **)((long)ppuVar6 + -4);
      break;
    case 0x11:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31dc4;
      CODE3_124c();
      iVar1 = *(int *)((long)ppuVar6 + -2);
      *(int *)((long)ppuVar6 + -4) = iVar1;
      *(undefined1 **)((long)ppuVar6 + -8) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -0xc) = 0x31dd0;
      CODE3_1a60();
      if (*(char *)((long)ppuVar6 + -2) != '\0') {
        *(undefined1 **)((long)ppuVar6 + -4) = &stack0xfffffffc;
        *(undefined4 *)((long)ppuVar6 + -8) = 0x31ddc;
        CODE3_11de();
        ppuVar6 = (undefined1 **)((long)ppuVar6 + -4);
        iVar4 = iVar1;
      }
      break;
    case 0x12:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31dec;
      CODE3_124c();
      iVar1 = *(int *)((long)ppuVar6 + -2);
      *(int *)((long)ppuVar6 + -4) = iVar1;
      *(undefined1 **)((long)ppuVar6 + -8) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -0xc) = 0x31df8;
      CODE3_1a60();
      if (*(char *)((long)ppuVar6 + -2) != '\0') {
        iVar4 = iVar1;
      }
      break;
    case 0x13:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31e0e;
      CODE3_11f8();
      iVar4 = *(int *)((long)ppuVar6 + -2);
      *(int *)((long)ppuVar6 + -4) = iVar4;
      *(undefined1 **)((long)ppuVar6 + -8) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -0xc) = 0x31e1e;
      CODE3_1a60();
      break;
    case 0x14:
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31e2c;
      CODE3_11f8();
      iVar4 = *(int *)((long)ppuVar6 + -2);
      *(int *)((long)ppuVar6 + -4) = iVar4;
      *(undefined1 **)((long)ppuVar6 + -8) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -0xc) = 0x31e3c;
      CODE3_1a60();
      if (*(char *)((long)ppuVar6 + -2) != '\0') {
        local_20 = *(uint *)(in_stack_00000008 + 0x2118);
        *(undefined1 *)(in_stack_00000008 + 0x2116) = 0;
      }
      break;
    case 0x15:
      local_1c = local_1c + -1;
      bVar5 = DAT_000fc02e;
      break;
    case 0x16:
      *(int *)((long)ppuVar6 + -2) = iVar4;
      *(undefined1 **)((long)ppuVar6 + -6) = &stack0xfffffffc;
      *(undefined4 *)((long)ppuVar6 + -10) = 0x31e70;
      CODE3_0fd2();
      ppuVar6 = (undefined1 **)((long)ppuVar6 + -6);
    }
    local_1e = iVar4;
  }
  *(int *)(in_stack_00000008 + 0x2110) = local_1c - in_stack_00000006;
  *(int *)(in_stack_00000008 + 0x210e) = local_1e;
  *(uint *)(in_stack_00000008 + 0x2114) = local_20;
  if (iVar3 != *(int *)(in_stack_00000008 + 0x1f62) || iVar2 != *(int *)(in_stack_00000008 + 0x1f60)
     ) {
    *(long *)((long)ppuVar6 + -4) = in_stack_00000008;
    *(undefined2 *)((long)ppuVar6 + -8) = *(undefined2 *)(in_stack_00000008 + 0x1f62);
    *(undefined4 *)((long)ppuVar6 + -0xc) = 0x31f24;
    CODE3_0030();
    *(int *)(in_stack_00000008 + 0x215a) =
         ((*(int *)((long)ppuVar6 + -6) / 4) * *(int *)(*(long *)((long)ppuVar6 + -4) + 0x1f60)) / 4
    ;
    *(long *)((long)ppuVar6 + -4) = in_stack_00000008;
    *(undefined2 *)((long)ppuVar6 + -8) = *(undefined2 *)(in_stack_00000008 + 0x1f62);
    *(undefined4 *)((long)ppuVar6 + -0xc) = 0x31f54;
    CODE3_009a();
    *(int *)(in_stack_00000008 + 0x215c) =
         ((*(int *)((long)ppuVar6 + -6) / 4) * *(int *)(*(long *)((long)ppuVar6 + -4) + 0x1f60)) /
         -4;
  }
  return bVar5;
}



/* CODE 3 + 0x1f80, synthetic address 0x00031f80 */

/* Original CODE 3 resource offset 0x1f80 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_1f80(long param_1,undefined4 *param_2)

{
  undefined4 uVar1;
  int local_22;
  undefined2 local_20;
  undefined2 uStack_1e;
  undefined2 local_1c;
  undefined2 uStack_1a;
  
  local_22 = (int)((ulong)*param_2 >> 0x10);
  local_20 = (undefined2)*param_2;
  uStack_1e = (undefined2)((ulong)param_2[1] >> 0x10);
  local_1c = (undefined2)param_2[1];
  uStack_1a = (undefined2)((ulong)param_2[2] >> 0x10);
  uVar1 = *(undefined4 *)((long)param_2 + 10);
  if ((DAT_000ff91c != '\0') &&
     (*(int *)(param_1 + -0x40a) <= local_22 || *(char *)(param_1 + -0x40b) != '\x01')) {
    JT_CODE1_07d4();
    JT_CODE1_06c2(0,CONCAT22(local_1c,uStack_1a),uVar1);
    __mac_toolbox(0xa975);
    *(long *)(param_1 + -0x408) = CONCAT22(local_20,uStack_1e) + 0x31fc5;
    *(int *)(param_1 + -0x40a) = local_22;
    *(undefined1 *)(param_1 + -0x40b) = 1;
  }
  return;
}



/* CODE 3 + 0x1fec, synthetic address 0x00031fec */

/* Original CODE 3 resource offset 0x1fec (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_1fec(long param_1,long *param_2)

{
  int iVar1;
  long *plVar2;
  long *plVar3;
  long lStack_46;
  undefined2 local_42;
  undefined2 local_40;
  undefined2 local_3e;
  undefined2 local_3c;
  long lStack_3a;
  undefined4 local_36;
  undefined2 local_32;
  undefined2 local_30;
  undefined2 local_2e;
  undefined2 local_2c;
  
  local_2c = 0;
  local_2e = 0xca;
  __mac_toolbox(0xa893);
  local_30 = 0x78;
  local_32 = 0xca;
  __mac_toolbox(0xa891);
  *(undefined2 *)(param_1 + -0x7ca) = 0xffff;
  *(undefined2 *)(param_1 + -0x7cc) = 0xffff;
  *(undefined2 *)(param_1 + -0x7ce) = 0;
  local_36 = *(undefined4 *)(param_1 + -0x13c);
  __mac_toolbox(0xa873);
  lStack_3a = param_1 + -0x154;
  local_3c = 0;
  local_3e = 0x47;
  local_40 = 0x78;
  local_42 = 0xc6;
  __mac_toolbox(0xa8a7);
  lStack_46 = param_1 + -0x154;
  plVar2 = &lStack_46;
  __mac_toolbox(0xa8a3);
  iVar1 = 0;
  do {
    *(undefined2 *)((long)plVar2 + -2) = *(undefined2 *)(param_1 + (iVar1 * 0x18 + -0x7c4));
    *(undefined2 *)((long)plVar2 + -4) = *(undefined2 *)(param_1 + (iVar1 * 0x18 + -0x7c6));
    __mac_toolbox(0xa893);
    *(long *)((long)plVar2 + -8) = param_1 + (iVar1 * 0x18 + -0x7c2);
    __mac_toolbox(0xa884);
    *(long *)((long)plVar2 + -0xc) = (long)iVar1 * 0x18;
    *(long *)((long)plVar2 + -0x12) = param_1 + (iVar1 * 0x18 + -0x7c2);
    __mac_toolbox(0xa88c);
    *(int *)(param_1 + (iVar1 * 0x18 + -0x7b0)) =
         *(int *)(param_1 + ((int)*(undefined4 *)((long)plVar2 + -0x10) + -0x7c4)) +
         *(int *)((long)plVar2 + -0x12);
    *(undefined2 *)((long)plVar2 + -0xe) = *(undefined2 *)(param_1 + (iVar1 * 0x18 + -0x7b0));
    *(undefined2 *)((long)plVar2 + -0x10) = *(undefined2 *)(param_1 + (iVar1 * 0x18 + -0x7c6));
    __mac_toolbox(0xa893);
    *(long *)((long)plVar2 + -0x14) = (long)*(int *)(*param_2 + (long)(iVar1 * 2 + 0x2072));
    *(long *)((long)plVar2 + -0x18) = param_1 + -0x2f2;
    *(undefined4 *)((long)plVar2 + -0x1c) = 0x320dc;
    JT_CODE1_094e();
    plVar3 = (long *)((long)plVar2 + -0x1c);
    plVar2 = (long *)((long)plVar2 + -0x1c);
    *plVar3 = param_1 + -0x2f2;
    __mac_toolbox(0xa884);
    *(undefined2 *)(param_1 + (iVar1 * 0x18 + -0x7b2)) =
         *(undefined2 *)(*param_2 + (long)(iVar1 * 2 + 0x2072));
    iVar1 = iVar1 + 1;
  } while (iVar1 < 0x13);
  return;
}



/* CODE 3 + 0x2114, synthetic address 0x00032114 */

/* WARNING: Type propagation algorithm not settling */
/* Original CODE 3 resource offset 0x2114 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_2114(long param_1,long *param_2)

{
  int *piVar1;
  ulong unaff_D5;
  int iVar2;
  int iVar3;
  long *plVar4;
  long *plVar5;
  bool bVar6;
  long alStack_6a [3];
  int local_5e [2];
  long lStack_5a;
  int local_56 [4];
  long alStack_4e [3];
  
  alStack_4e[2] = param_1 + -300;
  __mac_toolbox(0xa874);
  alStack_4e[1] = *(undefined4 *)(param_1 + -0x13c);
  plVar5 = alStack_4e + 1;
  __mac_toolbox(0xa873);
  iVar3 = 0;
  do {
    if (0x12 < iVar3) {
      return;
    }
    if (iVar3 == 0x10) {
      iVar2 = *(int *)(*param_2 + 0x2288);
    }
    else if (iVar3 == 0x12) {
      iVar2 = *(int *)(*param_2 + 0x2230);
      unaff_D5 = (long)(*(int *)(param_1 + -0x7c8) * 3) / 2 & 0xffff;
    }
    else {
      iVar2 = *(int *)(*param_2 + 0x2072 + (long)(iVar3 * 2));
      unaff_D5 = (ulong)*(uint *)(param_1 + -0x7c8);
    }
    if (iVar2 != *(int *)(param_1 + (iVar3 * 0x18 + -0x7b2))) {
      piVar1 = (int *)(param_1 + (iVar3 * 0x18 + -0x7c6));
      plVar5[0xffffffff] = param_1 + -0x154;
      *(int *)((long)plVar5 + -6) = piVar1[0xb] + -1;
      *(int *)(plVar5 + 0xfffffffe) = *piVar1 + -7;
      *(int *)((long)plVar5 + -10) = (int)unaff_D5 + piVar1[0xb];
      *(int *)(plVar5 + 0xfffffffd) = *piVar1 + 1;
      __mac_toolbox(0xa8a7);
      plVar5[0xfffffffc] = param_1 + -0x154;
      __mac_toolbox(0xa8a3);
      *(int *)((long)plVar5 + -0x12) = piVar1[0xb];
      *(int *)(plVar5 + 0xfffffffb) = *piVar1;
      __mac_toolbox(0xa893);
      plVar5[0xfffffffa] = (long)iVar2;
      plVar5[0xfffffff9] = param_1 + -0x2f2;
      plVar5[0xfffffff8] = 0x321d8;
      JT_CODE1_094e();
      plVar4 = plVar5 + 0xfffffff8;
      plVar5 = plVar5 + 0xfffffff8;
      *plVar4 = param_1 + -0x2f2;
      __mac_toolbox(0xa884);
      *(int *)(param_1 + (iVar3 * 0x18 + -0x7b2)) = iVar2;
    }
    bVar6 = SCARRY2(iVar3,1);
    iVar3 = iVar3 + 1;
  } while (!bVar6);
  return;
}



/* CODE 3 + 0x2204, synthetic address 0x00032204 */

/* Original CODE 3 resource offset 0x2204 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_2204(long param_1,long *param_2)

{
  long lVar1;
  int iVar2;
  undefined1 *puVar3;
  int iVar4;
  char *pcVar5;
  int *piVar6;
  undefined1 *puVar8;
  undefined1 *puVar9;
  bool bVar10;
  undefined1 auStack_7e [16];
  undefined1 local_6e [4];
  int local_2a;
  int local_20;
  int local_1e;
  int local_1c;
  undefined1 *puVar7;
  
  puVar9 = local_6e;
  puVar8 = local_6e;
  __mac_toolbox(0xa88e);
  iVar2 = *(int *)(&DAT_000fe7f8 + *(int *)(*param_2 + 0x222a) * 2);
  if (iVar2 != *(int *)(param_1 + -0x7ce)) {
    if (0 < *(int *)(param_1 + -0x7ce)) {
      __mac_toolbox(0xa8a7);
      puVar8 = auStack_7e;
      __mac_toolbox(0xa8a3);
    }
    if (*(int *)(param_1 + -0x7cc) < iVar2 || iVar2 < *(int *)(param_1 + -0x7ca)) {
      *(long *)(puVar8 + -4) = param_1 + -0x154;
      *(undefined2 *)(puVar8 + -6) = 0;
      *(undefined2 *)(puVar8 + -8) = 0xcb;
      *(undefined2 *)(puVar8 + -10) = 0x78;
      *(undefined2 *)(puVar8 + -0xc) = 0x144;
      __mac_toolbox(0xa8a7);
      *(long *)(puVar8 + -0x10) = param_1 + -0x154;
      __mac_toolbox(0xa8a3);
      if (iVar2 < 2) {
        local_1e = 0;
      }
      else {
        local_1e = iVar2 + -1;
      }
      if (iVar2 < *(int *)(**(long **)(*param_2 + 2) + 0x5e) + -8) {
        local_20 = iVar2 + 8;
      }
      else {
        local_20 = *(int *)(**(long **)(*param_2 + 2) + 0x5e) + -1;
      }
      *(int *)(param_1 + -0x7ca) = local_1e;
      *(int *)(param_1 + -0x7cc) = local_20;
      lVar1 = **(long **)(**(long **)(*param_2 + 2) + 0x3e);
      local_1c = 0;
      puVar3 = puVar8 + -0x10;
      do {
        puVar8 = puVar3;
        if (local_20 < local_1e) break;
        if (local_1e + -1 < *(int *)(**(long **)(*param_2 + 2) + 0x5e)) {
          local_2a = *(int *)(**(long **)(*param_2 + 2) + 0x60 + (long)((local_1e + 1) * 2)) -
                     *(int *)(**(long **)(*param_2 + 2) + 0x60 + (long)(local_1e * 2));
        }
        else {
          local_2a = *(int *)(**(long **)(*param_2 + 2) + 0x3c) -
                     *(int *)(**(long **)(*param_2 + 2) + 0x60 + (long)(local_1e * 2));
        }
        if (0x28 < local_2a) {
          local_2a = 0x28;
        }
        *(undefined2 *)(puVar8 + -2) = 3;
        *(int *)(puVar8 + -4) = local_1c * 0xb + 0xd3;
        __mac_toolbox(0xa893);
        iVar4 = 0;
        for (pcVar5 = (char *)(lVar1 + *(int *)(**(long **)(*param_2 + 2) + 0x60 +
                                               (long)(local_1e * 2))); *pcVar5 == ' ';
            pcVar5 = pcVar5 + 1) {
          iVar4 = iVar4 + 1;
        }
        if (0 < iVar4) {
          pcVar5 = pcVar5 + -1;
          iVar4 = iVar4 + -1;
        }
        *(char **)(puVar8 + -8) = pcVar5;
        *(undefined2 *)(puVar8 + -10) = 0;
        piVar6 = (int *)(puVar8 + -0xc);
        puVar7 = puVar8 + -0xc;
        puVar8 = puVar8 + -0xc;
        *piVar6 = local_2a - iVar4;
        __mac_toolbox(0xa885);
        local_1c = local_1c + 1;
        bVar10 = SCARRY2(local_1e,1);
        local_1e = local_1e + 1;
        puVar3 = puVar7;
      } while (!bVar10);
    }
    iVar4 = (iVar2 - *(int *)(param_1 + -0x7ca)) * 0xb;
    *(long *)(puVar8 + -4) = param_1 + -0x154;
    *(undefined2 *)(puVar8 + -6) = 0;
    *(int *)(puVar8 + -8) = iVar4 + 0xce;
    *(undefined2 *)(puVar8 + -10) = 3;
    *(int *)(puVar8 + -0xc) = iVar4 + 0xd1;
    __mac_toolbox(0xa8a7);
    puVar9 = puVar8 + -0x10;
    *(long *)(puVar8 + -0x10) = param_1 + -0x154;
    __mac_toolbox(0xa8a1);
    *(int *)(param_1 + -0x7ce) = iVar2;
  }
  *(undefined4 *)(puVar9 + -4) = 0;
  __mac_toolbox(0xa88e);
  *(undefined4 *)(puVar9 + -8) = *(undefined4 *)(param_1 + -300);
  __mac_toolbox(0xa873);
  return;
}



/* CODE 3 + 0x2422, synthetic address 0x00032422 */

/* Original CODE 3 resource offset 0x2422 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

ulong CODE3_2422(ulong param_1)

{
  uint uVar1;
  uint uVar2;
  bool bVar3;
  long lVar4;
  undefined1 uVar5;
  ulong *puVar6;
  ulong uVar7;
  undefined1 auVar8 [4];
  undefined2 uVar9;
  undefined2 uVar10;
  ulong uVar11;
  int iVar12;
  ulong unaff_D6;
  int iVar13;
  ulong *puVar14;
  undefined1 *puVar15;
  char *pcVar16;
  undefined4 *puVar17;
  undefined4 *puVar18;
  undefined4 *puVar19;
  undefined4 *puVar20;
  undefined4 *puVar21;
  undefined4 *puVar22;
  undefined4 *puVar23;
  undefined4 *puVar24;
  char acStack_16a [4];
  ulong auStack_166 [3];
  undefined4 local_15a;
  undefined1 auStack_156 [4];
  undefined4 uStack_152;
  undefined4 uStack_14e;
  undefined4 local_12c [2];
  undefined1 auStack_122 [262];
  ulong local_1c [6];
  
  uVar10 = uStack_14e._2_2_;
  uVar9 = uStack_14e._0_2_;
  uVar11 = DAT_000fbdcc;
  puVar24 = (undefined4 *)&stack0xfffffeb6;
  bVar3 = false;
  if (DAT_000fbdca == 1) {
    uStack_152._2_2_ = (undefined2)(DAT_000fbdd4 >> 0x10);
    uStack_14e._0_2_ = (undefined2)DAT_000fbdd4;
    puVar6 = local_1c;
    auStack_156._2_2_ = (undefined2)((ulong)puVar6 >> 0x10);
    uStack_152._0_2_ = SUB42(puVar6,0);
    __mac_toolbox(0xa92c);
    uVar11 = (ulong)(uint)auStack_156._2_2_;
    puVar24 = &uStack_152;
    if (auStack_156._2_2_ != 0) {
      uVar11 = (ulong)(auStack_156._2_2_ - 1);
      if (auStack_156._2_2_ - 1 == 0) {
        bVar3 = true;
        puVar24 = (undefined4 *)auStack_156;
        local_15a = DAT_000fbdd4;
        __mac_toolbox(0xa93d);
        unaff_D6 = DAT_000fbdd4;
      }
      else {
        uVar11 = (ulong)(auStack_156._2_2_ - 2);
        if (auStack_156._2_2_ - 2 == 0) {
          auStack_156._0_2_ = 0xf;
          auStack_156._2_2_ = 0xbdca;
          puVar6 = (ulong *)CONCAT22(0xbdca,uStack_152._0_2_);
          puVar24 = &local_15a;
          local_15a = local_1c[0];
          __mac_toolbox(0xa9b3);
        }
        else {
          uVar11 = (ulong)(auStack_156._2_2_ - 4);
          puVar24 = &uStack_152;
          if (auStack_156._2_2_ - 4 != 0) {
            __mac_toolbox(0xa924);
            uVar11 = CONCAT22(auStack_156._0_2_,auStack_156._2_2_);
            puVar24 = &uStack_152;
            if (uVar11 != local_1c[0]) {
              puVar24 = (undefined4 *)auStack_156;
              auStack_156._0_2_ = (undefined2)(local_1c[0] >> 0x10);
              auStack_156._2_2_ = (undefined2)local_1c[0];
              puVar6 = (ulong *)CONCAT22(auStack_156._2_2_,uStack_152._0_2_);
              __mac_toolbox(0xa91f);
            }
          }
        }
      }
    }
  }
  else if ((DAT_000fbdca == 3) || (DAT_000fbdca == 5)) {
    DAT_000fbdcc = DAT_000fbdcc & 0xff;
    uVar11 = (ulong)(DAT_000fbdd8 & 0x100);
    puVar6 = (ulong *)CONCAT22(auStack_156._2_2_,uStack_152._0_2_);
    if ((DAT_000fbdd8 & 0x100) == 0x100) {
      bVar3 = true;
      uStack_152._2_2_ = DAT_000fbdcc._2_2_;
      __mac_toolbox(0xa93e);
      unaff_D6 = CONCAT22(DAT_000fbdcc._2_2_,uStack_14e._0_2_);
      puVar24 = (undefined4 *)((long)&uStack_14e + 2);
      puVar6 = (ulong *)CONCAT22(auStack_156._2_2_,uStack_152._0_2_);
    }
  }
  else if (DAT_000fbdca == 6) {
    local_1c[0] = DAT_000fbdcc;
    uStack_14e._0_2_ = (undefined2)((ulong)local_12c >> 0x10);
    __mac_toolbox(0xa874);
    uStack_152._0_2_ = (undefined2)(DAT_000fbdcc >> 0x10);
    uStack_152._2_2_ = (undefined2)DAT_000fbdcc;
    __mac_toolbox(0xa873);
    puVar14 = (ulong *)auStack_156;
    __mac_toolbox(0xa922);
    uStack_14e = local_12c;
    if (DAT_000fbdcc == *(ulong *)(param_1 - 0x13c)) {
      iVar12 = 1;
      do {
        *(undefined2 *)(param_1 + (long)(iVar12 * 2 + -0x1bc)) = 0;
        iVar12 = iVar12 + 1;
      } while (iVar12 < 6);
      puVar14 = &local_15a;
      local_15a = param_1;
      auStack_166[2] = 0x32576;
      uStack_152 = uVar11;
      auStack_156 = (undefined1  [4])uVar11;
      uVar11 = CODE3_3874();
      puVar24 = uStack_14e;
      uVar7 = uStack_152;
      auVar8 = auStack_156;
    }
    else {
      puVar24 = local_12c;
      uVar7 = DAT_000fbdcc;
      auVar8 = (undefined1  [4])DAT_000fbdcc;
      if (DAT_000fbdcc == DAT_000fbe26) {
        local_15a._2_2_ = (uint)(byte)local_15a;
        local_15a = CONCAT13(1,local_15a._1_3_);
        puVar14 = auStack_166 + 2;
        auStack_166[2] = param_1;
        uStack_152 = DAT_000fbdcc;
        auStack_156 = (undefined1  [4])DAT_000fbdcc;
        uVar11 = CODE3_3062();
        puVar24 = uStack_14e;
        uVar7 = uStack_152;
        auVar8 = auStack_156;
      }
    }
    auStack_156._0_2_ = (undefined2)((ulong)auVar8 >> 0x10);
    auStack_156._2_2_ = SUB42(auVar8,0);
    uStack_152._0_2_ = (undefined2)(uVar7 >> 0x10);
    uStack_152._2_2_ = (undefined2)uVar7;
    uStack_14e._0_2_ = (undefined2)((ulong)puVar24 >> 0x10);
    uStack_14e._2_2_ = SUB42(puVar24,0);
    *(ulong *)((long)puVar14 + -4) = local_1c[0];
    __mac_toolbox(0xa923);
    *(undefined4 *)((long)puVar14 + -8) = local_12c[0];
    __mac_toolbox(0xa873);
    puVar24 = (undefined4 *)((long)puVar14 + -8);
    puVar6 = (ulong *)CONCAT22(auStack_156._2_2_,uStack_152._0_2_);
  }
  else {
    uVar11 = (ulong)(DAT_000fbdca - 8U);
    puVar6 = (ulong *)CONCAT22(auStack_156._2_2_,uStack_152._0_2_);
    if (DAT_000fbdca - 8U == 0) {
      __mac_toolbox(0xa924);
      lVar4 = CONCAT22(uStack_14e._0_2_,uStack_14e._2_2_);
      uStack_14e._2_2_ = (undefined2)DAT_000fbdfe;
      uStack_14e._0_2_ = (undefined2)((ulong)DAT_000fbdfe >> 0x10);
      if (lVar4 == 0) {
        if (*(char *)(param_1 - 0x3fe) != '\0') {
          puVar24 = (undefined4 *)((long)&uStack_152 + 2);
          uStack_152._2_2_ = 0;
          __mac_toolbox(0xa93a);
          __mac_toolbox(0xa937);
          *(undefined1 *)(param_1 - 0x3fe) = 0;
          uVar9 = uStack_14e._0_2_;
          uVar10 = uStack_14e._2_2_;
        }
      }
      else if ((byte)(*(char *)(param_1 - 0x3fe) - 1U & -(*(int *)(lVar4 + 0x6c) < 0)) == 0) {
        if (*(char *)(param_1 - 0x3fe) != '\0') {
          puVar24 = (undefined4 *)((long)&uStack_152 + 2);
          uStack_152._2_2_ = 0;
          __mac_toolbox(0xa93a);
          __mac_toolbox(0xa937);
          *(undefined1 *)(param_1 - 0x3fe) = 0;
          uVar9 = uStack_14e._0_2_;
          uVar10 = uStack_14e._2_2_;
        }
      }
      else {
        puVar24 = (undefined4 *)((long)&uStack_152 + 2);
        uStack_152._2_2_ = 0;
        __mac_toolbox(0xa939);
        __mac_toolbox(0xa937);
        *(undefined1 *)(param_1 - 0x3fe) = 1;
        uVar9 = uStack_14e._0_2_;
        uVar10 = uStack_14e._2_2_;
      }
      uStack_14e._2_2_ = uVar10;
      uStack_14e._0_2_ = uVar9;
      uVar11 = (ulong)DAT_000fbdd8 & 0xffff0001;
      puVar6 = (ulong *)CONCAT22(auStack_156._2_2_,uStack_152._0_2_);
      if ((DAT_000fbdd8 & 1) != 0) {
        *(ulong *)((long)puVar24 + -4) = DAT_000fbdcc;
        __mac_toolbox(0xa873);
        puVar24 = (undefined4 *)((long)puVar24 + -4);
        puVar6 = (ulong *)CONCAT22(auStack_156._2_2_,uStack_152._0_2_);
      }
    }
  }
  if (!bVar3) goto LAB_00032798;
  iVar12 = (int)(unaff_D6 >> 0x10);
  uVar11 = (ulong)(iVar12 - 0x80U);
  iVar13 = (int)unaff_D6;
  unique0x100003bf = puVar6;
  if (iVar12 - 0x80U == 0) {
    if (iVar13 == 1) {
      *(undefined4 *)((long)puVar24 + -4) = 0x325d2;
      uVar11 = JT_CODE5_0376();
    }
    else {
      *(undefined4 *)((long)puVar24 + -4) = DAT_000fbdf6;
      *(int *)((long)puVar24 + -6) = iVar13;
      *(undefined1 **)((long)puVar24 + -10) = auStack_122;
      __mac_toolbox(0xa946);
      *(undefined1 **)((long)puVar24 + -0x10) = auStack_122;
      __mac_toolbox(0xa9b6);
      puVar24 = (undefined4 *)((long)puVar24 + -0xe);
    }
    goto LAB_00032798;
  }
  if (iVar12 == 0x81) {
    uVar11 = (ulong)(iVar13 - 0xcU);
    if (iVar13 - 0xcU == 0) {
      DAT_000fbdb5 = 1;
      DAT_000ffefa = 1;
    }
    goto LAB_00032798;
  }
  if (iVar12 == 0x82) {
    puVar15 = (undefined1 *)((long)puVar24 + -2);
    uVar11 = (ulong)(iVar13 - 1U);
    pcVar16 = (char *)((long)puVar24 + -4);
    *(uint *)((long)puVar24 + -4) = iVar13 - 1U;
    __mac_toolbox(0xa9c2);
    puVar24 = (undefined4 *)((long)puVar24 + -2);
    if (*pcVar16 != '\0') {
      puVar24 = (undefined4 *)puVar15;
    }
    goto LAB_00032798;
  }
  uVar11 = (ulong)(iVar12 - 0x86U);
  if (iVar12 - 0x86U != 0) goto LAB_00032798;
  uVar2 = iVar13 - 2;
  uVar11 = (ulong)uVar2;
  if (uVar2 < 0x12) {
    uVar1 = *(uint *)((long)&switchD_00032754::switchdataD_00032758 + (long)(int)(uVar2 * 2));
    uVar11 = (ulong)uVar1;
    uVar5 = (undefined1)(uVar1 >> 8);
    switch(uVar2) {
    case 0:
      DAT_000ffefb = -(DAT_000ffefb + -1);
      uVar11 = (ulong)CONCAT11(uVar5,DAT_000ffefb);
      if (DAT_000ffefb == '\0') {
        *(undefined4 *)((long)puVar24 + -4) = DAT_000fbe0e;
        *(undefined2 *)((long)puVar24 + -6) = 2;
        puVar18 = (undefined4 *)((long)puVar24 + -10);
        puVar24 = (undefined4 *)((long)puVar24 + -10);
        *puVar18 = &DAT_0003280a;
        __mac_toolbox(0xa947);
      }
      else {
        *(undefined4 *)((long)puVar24 + -4) = DAT_000fbe0e;
        *(undefined2 *)((long)puVar24 + -6) = 2;
        puVar17 = (undefined4 *)((long)puVar24 + -10);
        puVar24 = (undefined4 *)((long)puVar24 + -10);
        *puVar17 = &DAT_00032810;
        __mac_toolbox(0xa947);
      }
      break;
    default:
      goto switchD_00032754_caseD_1;
    case 2:
      uVar11 = (ulong)*(uint *)(param_1 - 0x3f8);
      if (*(uint *)(param_1 - 0x3f8) == *(uint *)(param_1 + 10)) {
        DAT_000ffefa = 1;
      }
      else {
        iVar12 = 1;
        do {
          (&DAT_000fc375)[iVar12] = 0;
          iVar12 = iVar12 + 1;
        } while (iVar12 < 6);
        DAT_000fc382 = 0;
        *(undefined2 *)(param_1 - 0x3fa) = 0;
      }
      break;
    case 3:
      DAT_000ffefa = 1;
      break;
    case 6:
      DAT_000ffefc = -(DAT_000ffefc + -1);
      uVar11 = (ulong)CONCAT11(uVar5,DAT_000ffefc);
      if (DAT_000ffefc == '\0') {
        *(undefined4 *)((long)puVar24 + -4) = DAT_000fbe0e;
        *(undefined2 *)((long)puVar24 + -6) = 8;
        puVar20 = (undefined4 *)((long)puVar24 + -10);
        puVar24 = (undefined4 *)((long)puVar24 + -10);
        *puVar20 = &DAT_000327e6;
        __mac_toolbox(0xa947);
      }
      else {
        *(undefined4 *)((long)puVar24 + -4) = DAT_000fbe0e;
        *(undefined2 *)((long)puVar24 + -6) = 8;
        puVar19 = (undefined4 *)((long)puVar24 + -10);
        puVar24 = (undefined4 *)((long)puVar24 + -10);
        *puVar19 = &DAT_000327f8;
        __mac_toolbox(0xa947);
      }
      break;
    case 7:
      DAT_000fc02e = -(DAT_000fc02e + -1);
      uVar11 = (ulong)CONCAT11(uVar5,DAT_000fc02e);
      if (DAT_000fc02e == '\0') {
        *(undefined4 *)((long)puVar24 + -4) = DAT_000fbe0e;
        *(undefined2 *)((long)puVar24 + -6) = 9;
        puVar22 = (undefined4 *)((long)puVar24 + -10);
        puVar24 = (undefined4 *)((long)puVar24 + -10);
        *puVar22 = &DAT_000327b0;
        __mac_toolbox(0xa947);
      }
      else {
        *(undefined4 *)((long)puVar24 + -4) = DAT_000fbe0e;
        *(undefined2 *)((long)puVar24 + -6) = 9;
        puVar21 = (undefined4 *)((long)puVar24 + -10);
        puVar24 = (undefined4 *)((long)puVar24 + -10);
        *puVar21 = &DAT_000327ca;
        __mac_toolbox(0xa947);
      }
      break;
    case 8:
      uVar11 = (ulong)CONCAT11(uVar5,DAT_000ffefb + -1);
      if ((char)(DAT_000ffefb + -1) != '\0') {
        DAT_000ffefb = '\x01';
        *(undefined4 *)((long)puVar24 + -4) = DAT_000fbe0e;
        *(undefined2 *)((long)puVar24 + -6) = 2;
        puVar23 = (undefined4 *)((long)puVar24 + -10);
        puVar24 = (undefined4 *)((long)puVar24 + -10);
        *puVar23 = &DAT_000327a6;
        __mac_toolbox(0xa947);
      }
      *(undefined1 *)(param_1 - 0x7d3) = 1;
      break;
    case 10:
      *(undefined4 *)((long)puVar24 + -4) = 0x32730;
      uVar11 = JT_CODE4_003c();
      break;
    case 0xb:
      *(undefined4 *)((long)puVar24 + -4) = 0x32736;
      uVar11 = JT_CODE4_0090();
      break;
    case 0xd:
    case 0xe:
    case 0xf:
    case 0x10:
    case 0x11:
      *(int *)((long)puVar24 + -2) = iVar13 + -0xf;
      *(undefined4 *)((long)puVar24 + -6) = 0x32744;
      uVar11 = JT_CODE4_0004();
      puVar24 = (undefined4 *)((long)puVar24 + -2);
    }
  }
  else {
switchD_00032754_caseD_1:
  }
LAB_00032798:
  *(undefined2 *)((long)puVar24 + -2) = 0;
  __mac_toolbox(0xa938);
  return uVar11;
}



/* CODE 3 + 0x281a, synthetic address 0x0003281a */

/* Original CODE 3 resource offset 0x281a (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_281a(long param_1)

{
  DAT_000ffefc = 1;
  __mac_toolbox(0xa947);
  DAT_000ffefb = 1;
  __mac_toolbox(0xa947);
  *(undefined1 *)(param_1 + -0x7d3) = 1;
  return;
}



/* CODE 3 + 0x2872, synthetic address 0x00032872 */

/* WARNING: Removing unreachable block (ram,0x00032888) */
/* Original CODE 3 resource offset 0x2872 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_2872(void)

{
  __mac_toolbox(0xa9b4);
  __mac_toolbox(0xa970);
  return;
}



/* CODE 3 + 0x28a0, synthetic address 0x000328a0 */

/* Original CODE 3 resource offset 0x28a0 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_28a0(undefined2 param_1,undefined2 param_2,int param_3,int param_4,int param_5)

{
  int iVar1;
  undefined1 auStack_326 [266];
  undefined1 auStack_21c [8];
  undefined1 auStack_214 [256];
  undefined1 auStack_114 [272];
  
  iVar1 = (param_5 + -1) * 0x3d;
  __mac_toolbox(0xa8a7);
  __mac_toolbox(0xa8a3);
  JT_CODE1_094e(auStack_114,(long)param_4,auStack_21c,iVar1 + 0x20,0x78,iVar1 + 0x17,0x20,
                auStack_21c);
  JT_CODE1_094e(auStack_214,(long)param_3);
  __mac_toolbox(0xa893);
  JT_CODE1_0004(4,auStack_214,&DAT_0003292c,auStack_114,&DAT_00032938,auStack_326,iVar1 + 0x1e,0xf);
  __mac_toolbox(0xa884);
  return;
}



/* CODE 3 + 0x2940, synthetic address 0x00032940 */

/* Original CODE 3 resource offset 0x2940 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

ulong CODE3_2940(long param_1)

{
  undefined4 *puVar1;
  undefined4 uVar2;
  long *plVar3;
  int iVar4;
  byte bVar5;
  ulong uVar6;
  ulong in_D0;
  long lVar7;
  int iVar8;
  undefined4 *puVar9;
  undefined4 *puVar10;
  undefined4 *puVar11;
  undefined4 local_50;
  undefined4 *puStack_4c;
  undefined4 local_28 [2];
  undefined2 uStack_1e;
  int local_1c;
  undefined4 uStack_1a;
  
  puStack_4c = local_28;
  __mac_toolbox(0xa874);
  local_50 = *(undefined4 *)(param_1 + -0x13c);
  puVar11 = &local_50;
  __mac_toolbox(0xa873);
  iVar8 = 1;
  do {
    iVar4 = iVar8 * 2 + -0x162;
    bVar5 = (&DAT_000fc37b)[iVar8] & -(0 < *(int *)(param_1 + iVar4));
    in_D0 = CONCAT31((int3)(CONCAT22((int)(in_D0 >> 0x10),iVar4) >> 8),bVar5);
    if (bVar5 != 0) {
      iVar4 = (int)((long)iVar8 * 0xa6) + -0x3fd0;
      in_D0 = CONCAT22((int)((ulong)((long)iVar8 * 0xa6) >> 0x10),iVar4);
      plVar3 = *(long **)((long)iVar4 + 0x100000);
      if (*(char *)(param_1 + -0x3f5) != '\0') {
        *(undefined2 *)((long)puVar11 + -2) = *(undefined2 *)(param_1 + (iVar8 * 2 + -0x162));
        *(undefined2 *)((long)puVar11 + -4) = *(undefined2 *)(*plVar3 + 0x22b8);
        *(undefined2 *)((long)puVar11 + -6) = *(undefined2 *)(*plVar3 + 0x22ba);
        *(long *)((long)puVar11 + -10) = param_1;
        *(undefined4 *)((long)puVar11 + -0xe) = 0x329a6;
        in_D0 = CODE3_28a0();
        puVar11 = (undefined4 *)((long)puVar11 + -10);
      }
      if ((&DAT_000fc375)[iVar8] != '\0') {
        if (*(int *)(*plVar3 + 0x207a) != *(int *)(param_1 + (iVar8 * 2 + -0x1bc))) {
          *(int *)(param_1 + (iVar8 * 2 + -0x1bc)) = *(int *)(*plVar3 + 0x207a);
          *(undefined2 **)((long)puVar11 + -4) = &uStack_1e;
          puVar9 = (undefined4 *)((long)puVar11 + -8);
          puVar11 = (undefined4 *)((long)puVar11 + -8);
          *puVar9 = &DAT_000fffba;
          __mac_toolbox(0xa8a5);
        }
        iVar4 = *(int *)(*plVar3 + 0x2080);
        puVar1 = (undefined4 *)(param_1 + (*(int *)(param_1 + (iVar8 * 2 + -0x162)) * 8 + -0x1b8));
        uVar2 = *puVar1;
        uStack_1a = puVar1[1];
        *(undefined2 **)((long)puVar11 + -4) = &uStack_1e;
        *(undefined2 *)((long)puVar11 + -6) = 1;
        *(undefined2 *)((long)puVar11 + -8) = 1;
        __mac_toolbox(0xa8a9);
        local_1c = (int)uVar2;
        lVar7 = (long)((uStack_1a._2_2_ - local_1c) *
                      (100 - iVar4 / (*(int *)(*plVar3 + 0x2280) / 100)));
        uVar6 = lVar7 / 100;
        in_D0 = lVar7 % 100 << 0x10 | uVar6 & 0xffff;
        _uStack_1e = CONCAT22((int)((ulong)uVar2 >> 0x10),uStack_1a._2_2_ - (int)uVar6);
        *(undefined2 **)((long)puVar11 + -0xc) = &uStack_1e;
        puVar10 = (undefined4 *)((long)puVar11 + -0x10);
        puVar11 = (undefined4 *)((long)puVar11 + -0x10);
        *puVar10 = &DAT_000fffc2;
        __mac_toolbox(0xa8a5);
      }
    }
    iVar8 = iVar8 + 1;
  } while (iVar8 < 6);
  *(undefined1 *)(param_1 + -0x3f5) = 0;
  *(undefined4 *)((long)puVar11 + -4) = *(undefined4 *)(param_1 + -0x460);
  __mac_toolbox(0xa873);
  *(undefined4 *)((long)puVar11 + -8) = local_28[0];
  __mac_toolbox(0xa873);
  return in_D0;
}



/* CODE 3 + 0x2aa4, synthetic address 0x00032aa4 */

/* Original CODE 3 resource offset 0x2aa4 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_2aa4(long param_1,int param_2)

{
  __mac_toolbox(0xa873);
  __mac_toolbox(0xa8a3);
  __mac_toolbox(0xa893);
  __mac_toolbox(0xa884);
  *(undefined4 *)(param_1 + -0x14a) =
       *(undefined4 *)((long)(*(int *)(param_1 + -0x132) * 0xa6 + -0x3fd0) + 0x100000);
  __mac_toolbox(0xa8a7);
  __mac_toolbox(0xa8a3);
  __mac_toolbox(0xa893);
  __mac_toolbox(0xa919);
  __mac_toolbox(0xa884);
  *(int *)(param_1 + -0x136) = (*(int *)(param_1 + (param_2 * 2 + -0x162)) + -1) * 0x3d;
  __mac_toolbox(0xa8a7);
  __mac_toolbox(0xa89d);
  __mac_toolbox(0xa8a1);
  __mac_toolbox(0xa89e);
  __mac_toolbox(0xa8a9);
  __mac_toolbox(0xa8a8);
  __mac_toolbox(0xa8a3);
  __mac_toolbox(0xa873);
  return;
}



/* CODE 3 + 0x2c1a, synthetic address 0x00032c1a */

/* Original CODE 3 resource offset 0x2c1a (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_2c1a(long param_1,int param_2)

{
  long lVar1;
  
  lVar1 = *(long *)(param_1 + 8);
  *(undefined1 *)(lVar1 + -0x3f5) = 1;
  (&DAT_000fc375)[param_2] = 0;
  DAT_000fc382 = DAT_000fc382 + -1;
  CODE3_1f80(lVar1,lVar1 + -0x430);
  *(undefined2 *)(lVar1 + (*(int *)(param_1 + -0x12) * 6 + -0x1de)) = 1;
  *(undefined2 *)(lVar1 + (*(int *)(param_1 + -0x12) * 6 + -0x1da)) =
       *(undefined2 *)(**(long **)(param_1 + -0x16) + 0x2072);
  *(undefined2 *)(lVar1 + (*(int *)(param_1 + -0x12) * 6 + -0x1dc)) =
       *(undefined2 *)(**(long **)(param_1 + -0x16) + 0x2074);
  if (0 < *(int *)(lVar1 + (param_2 * 2 + -0x162))) {
    CODE3_2aa4((int)((ulong)lVar1 >> 0x10),(int)lVar1,param_2);
  }
  return;
}



/* CODE 3 + 0x2cb8, synthetic address 0x00032cb8 */

/* Original CODE 3 resource offset 0x2cb8 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

ulong CODE3_2cb8(long param_1,undefined2 param_2,undefined2 param_3)

{
  long lVar1;
  long *plVar2;
  int iVar3;
  uint uVar4;
  byte bVar5;
  ulong uVar6;
  byte bVar7;
  ulong uVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  undefined1 *puVar12;
  int *piVar13;
  undefined2 *puVar14;
  undefined2 local_60;
  undefined2 local_5e;
  undefined4 local_38;
  undefined4 local_34;
  int local_1e;
  int local_1c;
  int local_16;
  
  local_5e = 2;
  puVar14 = &local_60;
  local_60 = 2;
  __mac_toolbox(0xa89b);
  local_16 = 1;
  do {
    uVar8 = (ulong)(local_16 + 0xc37bU);
    if (*(char *)((long)(int)(local_16 + 0xc37bU) + 0x100000) != '\0') {
      iVar11 = local_16 * 0xa6 + -0x3fd0;
      plVar2 = *(long **)((long)iVar11 + 0x100000);
      bVar7 = (byte)((uint)iVar11 >> 8);
      bVar5 = *(byte *)((long)(local_16 + -0x3c8b) + 0x100000) & -(99 < *(int *)(*plVar2 + 0x207a));
      uVar8 = (ulong)CONCAT11(bVar7,bVar5);
      if (bVar5 == 0) {
        if (*(char *)(*plVar2 + 0x228a) != '\0') {
          iVar11 = *(int *)(*plVar2 + 0x2294);
          iVar3 = *(int *)(*plVar2 + 0x2292);
          iVar9 = *(int *)(*plVar2 + 0x2296);
          iVar10 = *(int *)(*plVar2 + 0x2298);
          uVar8 = (ulong)bVar7 << 8;
          if (param_3._0_1_ == 1) {
            if (iVar11 == 0) {
              *(long *)((long)puVar14 + -4) = param_1 + -0x458;
              puVar12 = (undefined1 *)((long)puVar14 + -8);
              *(long *)((long)puVar14 + -8) = param_1;
              *(undefined4 *)((long)puVar14 + -0xc) = 0x32dbe;
              uVar8 = CODE3_1f80();
            }
            else {
              local_38 = *(undefined4 *)(*plVar2 + 0x229e);
              puVar12 = (undefined1 *)puVar14;
            }
            iVar11 = iVar11 + 1;
            if (iVar11 == iVar3) {
              lVar1 = *(long *)(*plVar2 + 0x228e);
              *(undefined1 *)(*plVar2 + 0x228b) = 1;
              local_34._2_2_ = (int)lVar1;
              local_34._0_2_ = (int)((ulong)lVar1 >> 0x10);
              local_34 = lVar1;
              if (iVar3 == 1) {
                iVar9 = local_34._2_2_ - *(int *)(*plVar2 + 0x229c);
                iVar10 = local_34._0_2_ - *(int *)(*plVar2 + 0x229a);
              }
              else {
                iVar9 = local_34._2_2_ - local_38._2_2_;
                iVar10 = local_34._0_2_ - local_38._0_2_;
              }
            }
            else {
              uVar4 = *(int *)(*plVar2 + 0x229c) + (iVar9 * iVar11) / iVar3;
              uVar8 = (ulong)uVar4;
              local_34 = CONCAT22(*(int *)(*plVar2 + 0x229a) + (iVar10 * iVar11) / iVar3,uVar4);
              iVar9 = iVar9 / iVar3;
              iVar10 = iVar10 / iVar3;
            }
            *(long *)(puVar12 + -6) = local_34;
            *(long *)(puVar12 + -10) = DAT_000fbe26 + 0x10;
            __mac_toolbox(0xa8ad);
            uVar8 = uVar8 & 0xffffff00;
            puVar14 = (undefined2 *)(puVar12 + -8);
            if (puVar12[-10] != '\x01') {
              local_1c = 0;
              local_1e = 0;
              if (iVar10 != 0) {
                if (local_34 < 0) {
                  local_1e = (local_34._0_2_ * 0x14) / iVar10;
                  if (local_1e < 0) {
                    local_1e = -local_1e;
                  }
                }
                else if ((*(int *)(DAT_000fbe26 + 0x14) < local_34._0_2_) &&
                        (local_1e = ((local_34._0_2_ - *(int *)(DAT_000fbe26 + 0x14)) * 0x14) /
                                    iVar10, local_1e < 0)) {
                  local_1e = -local_1e;
                }
              }
              if (iVar9 != 0) {
                if (local_34._2_2_ < 0) {
                  local_1c = (local_34._2_2_ * 0x14) / iVar9;
                  if (local_1c < 0) {
                    local_1c = -local_1c;
                  }
                }
                else if ((*(int *)(DAT_000fbe26 + 0x16) < local_34._2_2_) &&
                        (local_1c = ((local_34._2_2_ - *(int *)(DAT_000fbe26 + 0x16)) * 0x14) /
                                    iVar9, local_1c < 0)) {
                  local_1c = -local_1c;
                }
              }
              if (local_1c < local_1e) {
                local_1c = local_1e;
              }
              uVar6 = (long)(iVar10 * local_1c) / 0x14;
              uVar8 = uVar6 & 0xffff;
              local_34 = CONCAT22(local_34._0_2_ - (int)uVar6,
                                  local_34._2_2_ - (iVar9 * local_1c) / 0x14);
              *(undefined1 *)(*plVar2 + 0x228b) = 1;
              puVar14 = (undefined2 *)(puVar12 + -8);
            }
          }
          else {
            uVar4 = *(int *)(*plVar2 + 0x229c) + (iVar9 * iVar11) / iVar3;
            uVar8 = (ulong)uVar4;
            local_34 = CONCAT22(*(int *)(*plVar2 + 0x229a) + (iVar10 * iVar11) / iVar3,uVar4);
          }
          bVar5 = param_3._0_1_ & *(byte *)(*plVar2 + 0x228b);
          uVar8 = CONCAT31((int3)(uVar8 >> 8),bVar5);
          if (bVar5 == 0) {
            if (param_2._0_1_ != '\0') {
              *(undefined **)((long)puVar14 + -4) = &DAT_000fffba;
              __mac_toolbox(0xa89d);
              *(int *)((long)puVar14 + -6) = local_34._2_2_;
              *(int *)((long)puVar14 + -8) = local_34._0_2_;
              __mac_toolbox(0xa893);
              *(int *)((long)puVar14 + -10) = local_34._2_2_;
              piVar13 = (int *)((long)puVar14 + -0xc);
              puVar14 = (undefined2 *)((long)puVar14 + -0xc);
              *piVar13 = local_34._0_2_;
              __mac_toolbox(0xa891);
            }
            *(long *)(*plVar2 + 0x229e) = local_34;
            *(int *)(*plVar2 + 0x2294) = iVar11;
          }
          else {
            *(undefined2 *)(*plVar2 + 0x228c) = 0;
            *(long *)((long)puVar14 + -4) = *plVar2;
            *(long *)((long)puVar14 + -0xc) = local_34;
            *(int *)((long)puVar14 + -0xe) = local_16;
            *(long *)((long)puVar14 + -0x12) = *plVar2 + 0x22c8;
            *(undefined4 *)((long)puVar14 + -0x16) = 0x32f8c;
            CODE3_023e();
            *(long *)(*plVar2 + 0x22c0) =
                 *(long *)(*(long *)((long)puVar14 + -4) + 0x22c0) + *(long *)((long)puVar14 + -8);
            *(long *)((long)puVar14 + -4) = param_1 + -0x41e;
            *(long *)((long)puVar14 + -8) = param_1;
            *(undefined4 *)((long)puVar14 + -0xc) = 0x32fa8;
            uVar8 = CODE3_1f80();
            *(long *)(*plVar2 + 0x228e) = local_34;
            *(undefined1 *)(*plVar2 + 0x228a) = 0;
            puVar12 = (undefined1 *)((long)puVar14 + -8);
            if (param_2._0_1_ != '\0') {
              *(long *)((long)puVar14 + -0xc) = param_1 + -0x154;
              *(int *)((long)puVar14 + -0xe) = local_34._2_2_ + -9;
              *(int *)((long)puVar14 + -0x10) = local_34._0_2_ + -9;
              *(int *)((long)puVar14 + -0x12) = local_34._2_2_ + 9;
              uVar8 = (ulong)(local_34._0_2_ + 9U);
              *(uint *)((long)puVar14 + -0x14) = local_34._0_2_ + 9U;
              __mac_toolbox(0xa8a7);
              *(long *)((long)puVar14 + -0x18) = param_1 + -0x154;
              *(undefined **)((long)puVar14 + -0x1c) = &DAT_000fffb2;
              __mac_toolbox(0xa8bb);
              puVar12 = (undefined1 *)((long)puVar14 + -0x1c);
            }
            puVar14 = (undefined2 *)puVar12;
            *(undefined1 *)(*plVar2 + 0x228b) = 0;
          }
        }
      }
      else {
        *(undefined2 *)(*plVar2 + 0x207a) = 100;
        *(int *)((long)puVar14 + -2) = local_16;
        *(undefined1 **)((long)puVar14 + -6) = &stack0xfffffffc;
        *(undefined4 *)((long)puVar14 + -10) = 0x32d28;
        uVar8 = CODE3_2c1a();
        puVar14 = (undefined2 *)((long)puVar14 + -6);
      }
    }
    local_16 = local_16 + 1;
  } while (local_16 < 6);
  *(undefined2 *)((long)puVar14 + -2) = 1;
  *(undefined2 *)((long)puVar14 + -4) = 1;
  __mac_toolbox(0xa89b);
  return uVar8;
}



/* CODE 3 + 0x3062, synthetic address 0x00033062 */

/* Original CODE 3 resource offset 0x3062 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_3062(long param_1,undefined2 param_2,undefined2 param_3)

{
  long *plVar1;
  undefined4 uVar2;
  int iVar3;
  int iVar4;
  undefined1 *puVar5;
  undefined2 *puVar6;
  undefined2 *puVar7;
  undefined2 *puVar8;
  undefined2 *puVar9;
  long *plVar10;
  undefined1 *puVar11;
  long lStack_7e;
  undefined4 local_7a;
  undefined4 *puStack_76;
  undefined4 local_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  undefined4 local_30;
  
  puStack_76 = &local_3c;
  __mac_toolbox(0xa874);
  local_7a = *(undefined4 *)(param_1 + -0x460);
  plVar10 = &local_7a;
  __mac_toolbox(0xa873);
  if (param_2._0_1_ != '\0') {
    lStack_7e = *(long *)(param_1 + -0x460) + 8;
    plVar10 = &lStack_7e;
    __mac_toolbox(0xa8a3);
  }
  iVar4 = 1;
  do {
    if ((&DAT_000fc37b)[iVar4] != '\0') {
      plVar1 = *(long **)((long)(iVar4 * 0xa6 + -0x3fd0) + 0x100000);
      if ((&DAT_000fc375)[iVar4] == '\0') {
        iVar3 = *(int *)(param_1 + -0x1de + (long)(iVar4 * 6));
        if (0 < iVar3) {
          uVar2 = local_30;
          if (param_2._0_1_ != '\0') {
            uVar2 = *(undefined4 *)(param_1 + (iVar4 * 6 + -0x1dc));
            __mac_toolbox(0xa89e);
            local_30._2_2_ = (int)uVar2;
            local_30._0_2_ = (int)((ulong)uVar2 >> 0x10);
            if (iVar3 == 1) {
              *(int *)((long)plVar10 + -2) = local_30._2_2_;
              *(int *)((long)plVar10 + -4) = local_30._0_2_;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -6) = 0;
              *(undefined2 *)((long)plVar10 + -8) = 5;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -10) = local_30._2_2_;
              *(int *)((long)plVar10 + -0xc) = local_30._0_2_;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0xe) = 5;
              *(undefined2 *)((long)plVar10 + -0x10) = 5;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x12) = local_30._2_2_;
              *(int *)((long)plVar10 + -0x14) = local_30._0_2_;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x16) = 5;
              *(undefined2 *)((long)plVar10 + -0x18) = 0;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x1a) = local_30._2_2_;
              *(int *)((long)plVar10 + -0x1c) = local_30._0_2_;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x1e) = 5;
              *(undefined2 *)((long)plVar10 + -0x20) = 0xfffb;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x22) = local_30._2_2_;
              *(int *)((long)plVar10 + -0x24) = local_30._0_2_;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x26) = 0;
              *(undefined2 *)((long)plVar10 + -0x28) = 0xfffb;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x2a) = local_30._2_2_;
              *(int *)((long)plVar10 + -0x2c) = local_30._0_2_;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x2e) = 0xfffb;
              *(undefined2 *)((long)plVar10 + -0x30) = 0xfffb;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x32) = local_30._2_2_;
              *(int *)((long)plVar10 + -0x34) = local_30._0_2_;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x36) = 0xfffb;
              *(undefined2 *)((long)plVar10 + -0x38) = 0;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x3a) = local_30._2_2_;
              *(int *)((long)plVar10 + -0x3c) = local_30._0_2_;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x3e) = 0xfffb;
              puVar6 = (undefined2 *)((long)plVar10 + -0x40);
              plVar10 = (long *)((long)plVar10 + -0x40);
              *puVar6 = 5;
              __mac_toolbox(0xa892);
            }
            else if (iVar3 == 2) {
              *(int *)((long)plVar10 + -2) = local_30._2_2_;
              *(int *)((long)plVar10 + -4) = local_30._0_2_ + 4;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -6) = 0;
              *(undefined2 *)((long)plVar10 + -8) = 3;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -10) = local_30._2_2_ + 2;
              *(int *)((long)plVar10 + -0xc) = local_30._0_2_ + 2;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0xe) = 4;
              *(undefined2 *)((long)plVar10 + -0x10) = 4;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x12) = local_30._2_2_ + 4;
              *(int *)((long)plVar10 + -0x14) = local_30._0_2_;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x16) = 3;
              *(undefined2 *)((long)plVar10 + -0x18) = 0;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x1a) = local_30._2_2_ + 2;
              *(int *)((long)plVar10 + -0x1c) = local_30._0_2_ + -2;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x1e) = 4;
              *(undefined2 *)((long)plVar10 + -0x20) = 0xfffc;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x22) = local_30._2_2_;
              *(int *)((long)plVar10 + -0x24) = local_30._0_2_ + -4;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x26) = 0;
              *(undefined2 *)((long)plVar10 + -0x28) = 0xfffd;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x2a) = local_30._2_2_ + -2;
              *(int *)((long)plVar10 + -0x2c) = local_30._0_2_ + -2;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x2e) = 0xfffc;
              *(undefined2 *)((long)plVar10 + -0x30) = 0xfffc;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x32) = local_30._2_2_ + -4;
              *(int *)((long)plVar10 + -0x34) = local_30._0_2_;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x36) = 0xfffd;
              *(undefined2 *)((long)plVar10 + -0x38) = 0;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x3a) = local_30._2_2_ + -2;
              *(int *)((long)plVar10 + -0x3c) = local_30._0_2_ + 2;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x3e) = 0xfffc;
              puVar7 = (undefined2 *)((long)plVar10 + -0x40);
              plVar10 = (long *)((long)plVar10 + -0x40);
              *puVar7 = 4;
              __mac_toolbox(0xa892);
            }
            else if (iVar3 == 3) {
              *(int *)((long)plVar10 + -2) = local_30._2_2_;
              *(int *)((long)plVar10 + -4) = local_30._0_2_ + 8;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -6) = 0;
              *(undefined2 *)((long)plVar10 + -8) = 1;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -10) = local_30._2_2_ + 4;
              *(int *)((long)plVar10 + -0xc) = local_30._0_2_ + 4;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0xe) = 3;
              *(undefined2 *)((long)plVar10 + -0x10) = 3;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x12) = local_30._2_2_ + 8;
              *(int *)((long)plVar10 + -0x14) = local_30._0_2_;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x16) = 1;
              *(undefined2 *)((long)plVar10 + -0x18) = 0;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x1a) = local_30._2_2_ + 4;
              *(int *)((long)plVar10 + -0x1c) = local_30._0_2_ + -4;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x1e) = 3;
              *(undefined2 *)((long)plVar10 + -0x20) = 0xfffd;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x22) = local_30._2_2_;
              *(int *)((long)plVar10 + -0x24) = local_30._0_2_ + -8;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x26) = 0;
              *(undefined2 *)((long)plVar10 + -0x28) = 0xffff;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x2a) = local_30._2_2_ + -4;
              *(int *)((long)plVar10 + -0x2c) = local_30._0_2_ + -4;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x2e) = 0xfffd;
              *(undefined2 *)((long)plVar10 + -0x30) = 0xfffd;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x32) = local_30._2_2_ + -8;
              *(int *)((long)plVar10 + -0x34) = local_30._0_2_;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x36) = 0xffff;
              *(undefined2 *)((long)plVar10 + -0x38) = 0;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x3a) = local_30._2_2_ + -4;
              *(int *)((long)plVar10 + -0x3c) = local_30._0_2_ + 4;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x3e) = 0xfffd;
              puVar8 = (undefined2 *)((long)plVar10 + -0x40);
              plVar10 = (long *)((long)plVar10 + -0x40);
              *puVar8 = 3;
              __mac_toolbox(0xa892);
            }
            else if (iVar3 == 4) {
              *(int *)((long)plVar10 + -2) = local_30._2_2_ + 8;
              *(int *)((long)plVar10 + -4) = local_30._0_2_ + 8;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -6) = 1;
              *(undefined2 *)((long)plVar10 + -8) = 1;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -10) = local_30._2_2_ + 8;
              *(int *)((long)plVar10 + -0xc) = local_30._0_2_ + -8;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0xe) = 1;
              *(undefined2 *)((long)plVar10 + -0x10) = 0xffff;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x12) = local_30._2_2_ + -8;
              *(int *)((long)plVar10 + -0x14) = local_30._0_2_ + -8;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x16) = 0xffff;
              *(undefined2 *)((long)plVar10 + -0x18) = 0xffff;
              __mac_toolbox(0xa892);
              *(int *)((long)plVar10 + -0x1a) = local_30._2_2_ + -8;
              *(int *)((long)plVar10 + -0x1c) = local_30._0_2_ + 8;
              __mac_toolbox(0xa893);
              *(undefined2 *)((long)plVar10 + -0x1e) = 0xffff;
              puVar9 = (undefined2 *)((long)plVar10 + -0x20);
              plVar10 = (long *)((long)plVar10 + -0x20);
              *puVar9 = 1;
              __mac_toolbox(0xa892);
            }
          }
          local_30 = uVar2;
          iVar3 = iVar3 + 1;
          if (4 < iVar3) {
            iVar3 = 0;
          }
          *(int *)(param_1 + (iVar4 * 6 + -0x1de)) = iVar3;
        }
      }
      else {
        puVar5 = (undefined1 *)plVar10;
        if (param_2._0_1_ != '\0') {
          uStack_38 = *(undefined4 *)(*plVar1 + 0x22a4);
          uStack_34 = *(undefined4 *)(*plVar1 + 0x22a8);
          if (*(int *)(*plVar1 + 0x22a2) < 1) {
            iVar3 = *(int *)(param_1 + (iVar4 * 2 + -0x162));
            if (iVar3 < 0) {
              iVar3 = -iVar3;
            }
            *(long *)((long)plVar10 + -4) = (long)(iVar3 * 0x24 + -0x3c98) + 0x100000;
            *(long *)((long)plVar10 + -8) = *(long *)(param_1 + -0x460) + 2;
            *(undefined4 **)((long)plVar10 + -0xc) = &DAT_000fc392;
            *(undefined4 **)((long)plVar10 + -0x10) = &uStack_38;
            *(undefined2 *)((long)plVar10 + -0x12) = 0;
            *(undefined4 *)((long)plVar10 + -0x16) = 0;
            __mac_toolbox(0xa8ec);
          }
          else {
            *(int *)(param_1 + -0x134) = ((*(int *)(*plVar1 + 0x2092) + 7) / 0xf) % 0x18;
            if (param_3._0_1_ != '\0') {
              *(int *)(*plVar1 + 0x22a2) = *(int *)(*plVar1 + 0x22a2) + -1;
            }
            iVar3 = *(int *)(param_1 + (iVar4 * 2 + -0x162));
            if (iVar3 < 0) {
              iVar3 = -iVar3;
            }
            *(long *)((long)plVar10 + -4) =
                 (long)(*(int *)(param_1 + -0x134) * 0x24 + iVar3 * 0x360 + -0x3f20) + 0x100000;
            *(long *)((long)plVar10 + -8) = *(long *)(param_1 + -0x460) + 2;
            *(undefined4 **)((long)plVar10 + -0xc) = &DAT_000fc392;
            *(undefined4 **)((long)plVar10 + -0x10) = &uStack_38;
            *(undefined2 *)((long)plVar10 + -0x12) = 0;
            *(undefined4 *)((long)plVar10 + -0x16) = 0;
            __mac_toolbox(0xa8ec);
          }
          puVar5 = (undefined1 *)((long)plVar10 + -0x16);
          if (*(int *)(*plVar1 + 0x2082) != 0) {
            *(undefined **)((long)plVar10 + -0x1a) = &DAT_000fffc2;
            __mac_toolbox(0xa89d);
            puVar5 = (undefined1 *)((long)plVar10 + -0x1e);
            *(undefined4 **)((long)plVar10 + -0x1e) = &uStack_38;
            __mac_toolbox(0xa8a1);
            __mac_toolbox(0xa89e);
          }
        }
        plVar10 = (long *)puVar5;
        if (0 < *(int *)(*plVar1 + 0x2286)) {
          *(long *)(puVar5 + -4) = *plVar1 + 0x22a4;
          __mac_toolbox(0xa8a4);
          plVar10 = (long *)(puVar5 + -4);
          if (param_3._0_1_ != '\0') {
            *(int *)(*plVar1 + 0x2286) = *(int *)(*plVar1 + 0x2286) + -1;
            plVar10 = (long *)(puVar5 + -4);
          }
        }
      }
    }
    iVar4 = iVar4 + 1;
  } while (iVar4 < 6);
  *(char *)((long)plVar10 + -2) = param_3._0_1_;
  *(char *)((long)plVar10 + -4) = param_2._0_1_;
  puVar11 = (undefined1 *)((long)plVar10 + -8);
  *(long *)((long)plVar10 + -8) = param_1;
  *(undefined4 *)((long)plVar10 + -0xc) = 0x334cc;
  CODE3_2cb8();
  if (param_2._0_1_ != '\0') {
    *(long *)((long)plVar10 + -0xc) = param_1 + -0x4ca;
    *(long *)((long)plVar10 + -0x10) = DAT_000fbe26 + 2;
    *(long *)((long)plVar10 + -0x14) = param_1 + -0x4bc;
    *(long *)((long)plVar10 + -0x18) = DAT_000fbe26 + 0x10;
    *(undefined2 *)((long)plVar10 + -0x1a) = 0;
    puVar11 = (undefined1 *)((long)plVar10 + -0x1e);
    *(undefined4 *)((long)plVar10 + -0x1e) = *(undefined4 *)(DAT_000fbe26 + 0x18);
    __mac_toolbox(0xa8ec);
  }
  *(undefined4 *)(puVar11 + -4) = local_3c;
  __mac_toolbox(0xa873);
  return;
}



/* CODE 3 + 0x3506, synthetic address 0x00033506 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Original CODE 3 resource offset 0x3506 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

void CODE3_3506(long param_1)

{
  long lVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  undefined4 *puVar5;
  undefined4 *puVar6;
  undefined1 *puVar7;
  long *plVar8;
  long *plVar9;
  long local_ee;
  int local_ea [2];
  long alStack_e6 [11];
  long lStack_ba;
  undefined2 local_b6;
  undefined2 local_b4;
  long lStack_b2;
  undefined2 local_ae;
  undefined2 local_ac;
  long lStack_aa;
  undefined2 local_a6;
  undefined2 local_a4;
  long lStack_a2;
  undefined2 local_9e;
  undefined2 local_9c;
  long lStack_9a;
  undefined2 local_96;
  undefined2 local_94;
  long lStack_92;
  undefined2 local_8e;
  undefined2 local_8c;
  long lStack_8a;
  undefined2 local_86;
  undefined2 local_84;
  long lStack_82;
  undefined2 local_7e;
  undefined2 local_7c;
  undefined2 local_7a;
  undefined2 local_78;
  long lStack_76;
  undefined2 local_72;
  int local_70;
  undefined2 uStack_6e;
  long lStack_6a;
  undefined2 local_66;
  int local_64;
  undefined2 uStack_62;
  undefined2 local_5e;
  undefined2 local_5c;
  long lStack_5a;
  long local_56;
  undefined4 local_52;
  long local_4e;
  int local_20;
  
  lVar1 = DAT_000fbe26;
  local_4e = DAT_000fbe26;
  __mac_toolbox(0xa873);
  local_52 = *(undefined4 *)(param_1 + -0x13c);
  __mac_toolbox(0xa920);
  local_56 = DAT_000fbe26;
  __mac_toolbox(0xa920);
  lStack_5a = DAT_000fbe26 + 0x10;
  __mac_toolbox(0xa8a3);
  local_5c = 0;
  __mac_toolbox(0xa887);
  local_5e = 0xc;
  __mac_toolbox(0xa88a);
  *(undefined4 *)(param_1 + -0x110) = DAT_0003386a;
  *(undefined4 *)(param_1 + -0x10c) = DAT_0003386e;
  *(undefined4 *)(param_1 + -0x108) = _DAT_00033872;
  __mac_toolbox(0xa88c);
  local_64 = (int)((ulong)(param_1 + -0x110) >> 0x10);
  _local_64 = CONCAT22(((*(int *)(lVar1 + 0x16) - *(int *)(lVar1 + 0x12)) - local_64) / 2,
                       (int)(param_1 + -0x110));
  local_66 = 0x23;
  __mac_toolbox(0xa893);
  lStack_6a = param_1 + -0x110;
  __mac_toolbox(0xa884);
  iVar2 = 4;
  puVar5 = &DAT_00033858;
  puVar6 = (undefined4 *)(param_1 + -0x110);
  do {
    *puVar6 = *puVar5;
    iVar2 = iVar2 + -1;
    puVar5 = puVar5 + 1;
    puVar6 = puVar6 + 1;
  } while (iVar2 != -1);
  __mac_toolbox(0xa88c);
  local_70 = (int)((ulong)(param_1 + -0x110) >> 0x10);
  _local_70 = CONCAT22(((*(int *)(lVar1 + 0x16) - *(int *)(lVar1 + 0x12)) - local_70) / 2,
                       (int)(param_1 + -0x110));
  local_72 = 0x46;
  __mac_toolbox(0xa893);
  lStack_76 = param_1 + -0x110;
  __mac_toolbox(0xa884);
  local_78 = 3;
  __mac_toolbox(0xa887);
  local_7a = 9;
  __mac_toolbox(0xa88a);
  *(undefined4 *)(param_1 + -0x110) = DAT_0003384c;
  *(undefined4 *)(param_1 + -0x10c) = DAT_00033850;
  *(undefined4 *)(param_1 + -0x108) = DAT_00033854;
  local_7c = 4;
  local_7e = 0x62;
  __mac_toolbox(0xa893);
  lStack_82 = param_1 + -0x110;
  __mac_toolbox(0xa884);
  *(undefined4 *)(param_1 + -0x110) = DAT_00033840;
  *(undefined4 *)(param_1 + -0x10c) = DAT_00033844;
  *(undefined4 *)(param_1 + -0x108) = DAT_00033848;
  local_84 = 4;
  local_86 = 0x78;
  __mac_toolbox(0xa893);
  lStack_8a = param_1 + -0x110;
  __mac_toolbox(0xa884);
  iVar2 = 5;
  puVar5 = &DAT_00033828;
  puVar6 = (undefined4 *)(param_1 + -0x110);
  do {
    *puVar6 = *puVar5;
    iVar2 = iVar2 + -1;
    puVar5 = puVar5 + 1;
    puVar6 = puVar6 + 1;
  } while (iVar2 != -1);
  local_8c = 4;
  local_8e = 0x8e;
  __mac_toolbox(0xa893);
  lStack_92 = param_1 + -0x110;
  __mac_toolbox(0xa884);
  iVar2 = 5;
  puVar5 = &DAT_00033812;
  puVar6 = (undefined4 *)(param_1 + -0x110);
  do {
    *puVar6 = *puVar5;
    iVar2 = iVar2 + -1;
    puVar5 = puVar5 + 1;
    puVar6 = puVar6 + 1;
  } while (iVar2 != -1);
  local_94 = 4;
  local_96 = 0xa4;
  __mac_toolbox(0xa893);
  lStack_9a = param_1 + -0x110;
  __mac_toolbox(0xa884);
  iVar2 = 5;
  puVar5 = &DAT_000337fc;
  puVar6 = (undefined4 *)(param_1 + -0x110);
  do {
    *puVar6 = *puVar5;
    iVar2 = iVar2 + -1;
    puVar5 = puVar5 + 1;
    puVar6 = puVar6 + 1;
  } while (iVar2 != -1);
  local_9c = 4;
  local_9e = 0xba;
  __mac_toolbox(0xa893);
  lStack_a2 = param_1 + -0x110;
  __mac_toolbox(0xa884);
  iVar2 = 4;
  puVar5 = &DAT_000337ea;
  puVar6 = (undefined4 *)(param_1 + -0x110);
  do {
    *puVar6 = *puVar5;
    iVar2 = iVar2 + -1;
    puVar5 = puVar5 + 1;
    puVar6 = puVar6 + 1;
  } while (iVar2 != -1);
  local_a4 = 4;
  local_a6 = 0xd0;
  __mac_toolbox(0xa893);
  lStack_aa = param_1 + -0x110;
  __mac_toolbox(0xa884);
  iVar2 = 4;
  puVar5 = &DAT_000337d6;
  puVar6 = (undefined4 *)(param_1 + -0x110);
  do {
    *puVar6 = *puVar5;
    iVar2 = iVar2 + -1;
    puVar5 = puVar5 + 1;
    puVar6 = puVar6 + 1;
  } while (iVar2 != -1);
  local_ac = 4;
  local_ae = 0xe6;
  __mac_toolbox(0xa893);
  lStack_b2 = param_1 + -0x110;
  __mac_toolbox(0xa884);
  iVar2 = 4;
  puVar5 = &DAT_000337c4;
  puVar6 = (undefined4 *)(param_1 + -0x110);
  do {
    *puVar6 = *puVar5;
    iVar2 = iVar2 + -1;
    puVar5 = puVar5 + 1;
    puVar6 = puVar6 + 1;
  } while (iVar2 != -1);
  local_b4 = 4;
  local_b6 = 0xfc;
  __mac_toolbox(0xa893);
  plVar9 = &lStack_ba;
  lStack_ba = param_1 + -0x110;
  __mac_toolbox(0xa884);
  iVar2 = 0;
  iVar4 = 1;
  do {
    if ((&DAT_000fc37b)[iVar4] != '\0') {
      iVar2 = iVar2 + 1;
      iVar3 = (iVar2 % 2) * -10;
      *(undefined4 *)(param_1 + -0x14a) = *(undefined4 *)((long)(iVar4 * 0xa6 + -0x3fd0) + 0x100000)
      ;
      *(long *)((long)plVar9 + -4) = (long)(iVar4 * 0xa6 + -0x4068) + 0x100000;
      *(long *)((long)plVar9 + -8) = param_1 + -0x110;
      __mac_toolbox(0xa919);
      *(long *)((long)plVar9 + -0xe) = param_1 + -0x110;
      __mac_toolbox(0xa88c);
      local_20 = (iVar2 * 0x37 + 0x3d) - *(int *)((long)plVar9 + -0xe) / 2;
      if (local_20 < 0x37) {
        local_20 = 0x37;
      }
      *(long *)((long)plVar9 + -0x10) = param_1 + -0x154;
      *(int *)((long)plVar9 + -0x12) = local_20 + -3;
      *(int *)((long)plVar9 + -0x14) = iVar3 + 0x62;
      *(int *)((long)plVar9 + -0x16) = *(int *)((long)plVar9 + -0xe) + local_20 + 3;
      *(int *)((long)plVar9 + -0x18) = iVar3 + 0x6a;
      __mac_toolbox(0xa8a7);
      *(long *)((long)plVar9 + -0x1c) = param_1 + -0x154;
      __mac_toolbox(0xa8a3);
      *(int *)((long)plVar9 + -0x1e) = local_20;
      *(int *)((long)plVar9 + -0x20) = iVar3 + 0x68;
      __mac_toolbox(0xa893);
      puVar7 = (undefined1 *)((long)plVar9 + -0x24);
      *(long *)((long)plVar9 + -0x24) = param_1 + -0x110;
      __mac_toolbox(0xa884);
      iVar3 = 0;
      do {
        *(undefined4 *)(puVar7 + -4) =
             *(undefined4 *)(**(long **)(param_1 + -0x14a) + (long)(iVar3 * 4 + 0x22bc));
        *(long *)(puVar7 + -8) = param_1 + -0x110;
        *(undefined4 *)(puVar7 + -0xc) = 0x33786;
        JT_CODE1_094e();
        *(int *)(puVar7 + -10) = iVar2 * 0x37 + 0x3a;
        *(int *)(puVar7 + -0xc) = (iVar3 + 1) * 0x16 + 0x62;
        __mac_toolbox(0xa893);
        plVar8 = (long *)(puVar7 + -0x10);
        plVar9 = (long *)(puVar7 + -0x10);
        puVar7 = puVar7 + -0x10;
        *plVar8 = param_1 + -0x110;
        __mac_toolbox(0xa884);
        iVar3 = iVar3 + 1;
      } while (iVar3 < 7);
    }
    iVar4 = iVar4 + 1;
  } while (iVar4 < 6);
  return;
}



/* CODE 3 + 0x3874, synthetic address 0x00033874 */

/* Original CODE 3 resource offset 0x3874 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE3_3874(long param_1)

{
  undefined4 *puVar1;
  long *plVar2;
  undefined4 uVar3;
  byte bVar4;
  uint uVar5;
  int unaff_D6w;
  int iVar6;
  int iVar7;
  int *piVar8;
  int *piVar9;
  undefined1 *puVar10;
  undefined1 *puVar11;
  undefined1 local_186 [6];
  undefined *puStack_180;
  long lStack_17c;
  undefined *puStack_178;
  undefined1 *puStack_174;
  undefined4 local_170;
  long lStack_16c;
  long local_168;
  long lStack_164;
  long local_160;
  undefined4 local_15c;
  undefined4 *puStack_158;
  undefined1 auStack_140 [254];
  undefined1 local_42;
  char acStack_29 [7];
  undefined4 local_22 [7];
  
  puStack_158 = local_22;
  __mac_toolbox(0xa874);
  local_15c = *(undefined4 *)(param_1 + -0x13c);
  __mac_toolbox(0xa873);
  uVar5 = (uint)(0 < DAT_000ffefe);
  local_160 = (long)*(int *)(param_1 + -0x3f8);
  lStack_164 = param_1 + -0x2f2;
  local_168 = 0x338a6;
  JT_CODE1_094e();
  local_168 = (long)*(int *)(param_1 + 10);
  lStack_16c = param_1 + -0x3f2;
  local_170 = 0x338b6;
  JT_CODE1_094e();
  local_170 = 0x8000f;
  __mac_toolbox(0xa893);
  puStack_174 = auStack_140;
  puStack_178 = &DAT_00033c52;
  lStack_17c = param_1 + -0x2f2;
  puStack_180 = &DAT_00033c48;
  local_186._2_4_ = param_1 + -0x3f2;
  local_186._0_2_ = 4;
  JT_CODE1_0004();
  local_186._0_4_ = auStack_140;
  puVar10 = local_186;
  __mac_toolbox(0xa884);
  iVar7 = 1;
  do {
    acStack_29[iVar7] = '\0';
    iVar7 = iVar7 + 1;
  } while (iVar7 < 6);
  iVar7 = 1;
  do {
    if (*(int *)(param_1 + -0x14c) == 0) {
      *(long *)(puVar10 + -4) = param_1 + (iVar7 * 8 + -0x1b8);
      *(undefined2 *)(puVar10 + -6) = 8;
      *(int *)(puVar10 + -8) = (iVar7 + -1) * 0x3d + 0x3e;
      *(undefined2 *)(puVar10 + -10) = 100;
      *(int *)(puVar10 + -0xc) = (iVar7 + -1) * 0x3d + 0x44;
      __mac_toolbox(0xa8a7);
      *(long *)(puVar10 + -0x10) = param_1 + (iVar7 * 8 + -400);
      *(undefined2 *)(puVar10 + -0x12) = 8;
      *(int *)(puVar10 + -0x14) = (iVar7 + -1) * 0x3d + 0x2c;
      *(undefined2 *)(puVar10 + -0x16) = 100;
      piVar8 = (int *)(puVar10 + -0x18);
      puVar10 = puVar10 + -0x18;
      *piVar8 = (iVar7 + -1) * 0x3d + 0x32;
      __mac_toolbox(0xa8a7);
      (&DAT_000fc375)[iVar7] = 0;
    }
    if ((&DAT_000fc37b)[iVar7] != '\0') {
      puVar11 = puVar10;
      if (*(int *)(param_1 + -0x14c) == 0) {
        (&DAT_000fc375)[iVar7] = 1;
        DAT_000fc382 = DAT_000fc382 + 1;
        plVar2 = *(long **)((long)(iVar7 * 0xa6 + -0x3fd0) + 0x100000);
        *(long **)(puVar10 + -4) = plVar2;
        __mac_toolbox(0xa029);
        do {
          __mac_toolbox(0xa861);
          iVar6 = *(int *)(puVar10 + -2);
          if (iVar6 < 0) {
            iVar6 = -iVar6;
          }
          unaff_D6w = iVar6 % 5 + 1;
        } while (acStack_29[unaff_D6w] != '\0');
        acStack_29[unaff_D6w] = '\x01';
        *(undefined2 *)(puVar10 + -2) = *(undefined2 *)(param_1 + -0x3f8);
        *(long *)(puVar10 + -6) = *plVar2 + 0x11c;
        puVar11 = puVar10 + -8;
        *(int *)(puVar10 + -8) = unaff_D6w;
        *(undefined4 *)(puVar10 + -0xc) = 0x339d0;
        CODE3_0e08();
        *(long **)(puVar10 + -0xc) = plVar2;
        __mac_toolbox(0xa02a);
        *(undefined2 *)(param_1 + (iVar7 * 2 + -0x1bc)) = 0;
      }
      puVar10 = puVar11;
      if (iVar7 == *(int *)(param_1 + 8)) {
        uVar3 = *(undefined4 *)((long)(DAT_000ffefe * 0xa6 + -0x3fd0) + 0x100000);
        if (*(int *)(param_1 + -0x14c) == 0) {
          *(undefined4 *)(puVar11 + -4) = uVar3;
          puVar10 = puVar11 + -8;
          *(long *)(puVar11 + -8) = param_1;
          *(undefined4 *)(puVar11 + -0xc) = 0x33a06;
          CODE3_1fec();
        }
        else {
          *(undefined4 *)(puVar11 + -4) = uVar3;
          *(long *)(puVar11 + -8) = param_1;
          *(undefined4 *)(puVar11 + -0xc) = 0x33a10;
          CODE3_1fec();
          *(undefined4 *)(puVar11 + -0xc) = uVar3;
          *(long *)(puVar11 + -0x10) = param_1;
          *(undefined4 *)(puVar11 + -0x14) = 0x33a18;
          CODE3_2114();
          *(undefined4 *)(puVar11 + -0x14) = uVar3;
          puVar10 = puVar11 + -0x18;
          *(long *)(puVar11 + -0x18) = param_1;
          *(undefined4 *)(puVar11 + -0x1c) = 0x33a20;
          CODE3_2204();
        }
      }
      if ((byte)(-(iVar7 != DAT_000ffefe) & -(0 < DAT_000ffefe)) == 0) {
        if (DAT_000ffefe < 1) {
          uVar5 = uVar5 + 1;
          *(uint *)(param_1 + (iVar7 * 2 + -0x162)) = uVar5;
        }
        else {
          *(undefined2 *)(param_1 + (iVar7 * 2 + -0x162)) = 1;
        }
        *(undefined2 *)(param_1 + -0x156) = *(undefined2 *)(param_1 + (iVar7 * 2 + -0x162));
        unaff_D6w = (*(int *)(param_1 + -0x156) + -1) * 0x3d;
        *(undefined2 *)(puVar10 + -2) = 0x10;
        *(int *)(puVar10 + -4) = unaff_D6w + 0x13;
        __mac_toolbox(0xa893);
        *(undefined2 *)(puVar10 + -6) = 1;
        __mac_toolbox(0xa888);
        *(long *)(puVar10 + -10) = (long)(iVar7 * 0xa6 + -0x4068) + 0x100000;
        *(long *)(puVar10 + -0xe) = param_1 + -0x2f2;
        __mac_toolbox(0xa919);
        *(long *)(puVar10 + -0x12) = param_1 + -0x2f2;
        __mac_toolbox(0xa884);
        local_42 = 0;
        *(undefined2 *)(puVar10 + -0x14) = 0;
        __mac_toolbox(0xa888);
        *(long *)(puVar10 + -0x18) = param_1 + -0x154;
        *(undefined2 *)(puVar10 + -0x1a) = 2;
        *(int *)(puVar10 + -0x1c) = unaff_D6w + 0xb;
        *(undefined2 *)(puVar10 + -0x1e) = 0xd;
        *(int *)(puVar10 + -0x20) = unaff_D6w + 0x16;
        __mac_toolbox(0xa8a7);
        *(long *)(puVar10 + -0x24) = (long)(*(int *)(param_1 + -0x156) * 0x24 + -0x3c98) + 0x100000;
        *(long *)(puVar10 + -0x28) = *(long *)(param_1 + -0x128) + 2;
        *(long *)(puVar10 + -0x2c) = (long)(*(int *)(param_1 + -0x156) * 0x24 + -0x3c92) + 0x100000;
        *(long *)(puVar10 + -0x30) = param_1 + -0x154;
        *(undefined2 *)(puVar10 + -0x32) = 0;
        *(undefined4 *)(puVar10 + -0x36) = 0;
        __mac_toolbox(0xa8ec);
        *(long *)(puVar10 + -0x3a) = param_1 + (*(int *)(param_1 + -0x156) * 8 + -400);
        __mac_toolbox(0xa8a1);
        *(undefined2 *)(puVar10 + -0x3c) = 9;
        *(int *)(puVar10 + -0x3e) = unaff_D6w + 0x29;
        __mac_toolbox(0xa893);
        *(undefined **)(puVar10 + -0x42) = &DAT_00033c32;
        __mac_toolbox(0xa884);
        puVar1 = (undefined4 *)(param_1 + (*(int *)(param_1 + -0x156) * 8 + -0x1b8));
        *(undefined4 *)(param_1 + -0x154) = *puVar1;
        *(undefined4 *)(param_1 + -0x150) = puVar1[1];
        *(long *)(puVar10 + -0x46) = param_1 + -0x154;
        __mac_toolbox(0xa8a1);
        *(undefined2 *)(puVar10 + -0x48) = 9;
        *(int *)(puVar10 + -0x4a) = unaff_D6w + 0x3c;
        __mac_toolbox(0xa893);
        *(undefined **)(puVar10 + -0x4e) = &DAT_00033c1a;
        __mac_toolbox(0xa884);
        *(long *)(puVar10 + -0x52) = param_1 + -0x154;
        *(undefined2 *)(puVar10 + -0x54) = 1;
        *(undefined2 *)(puVar10 + -0x56) = 1;
        __mac_toolbox(0xa8a9);
        *(long *)(puVar10 + -0x5a) = param_1 + -0x154;
        *(undefined **)(puVar10 + -0x5e) = &DAT_000fffb2;
        __mac_toolbox(0xa8a5);
        *(undefined2 *)(puVar10 + -0x60) = 0;
        *(int *)(puVar10 + -0x62) = unaff_D6w + 9;
        __mac_toolbox(0xa893);
        *(undefined2 *)(puVar10 + -100) = 0x78;
        piVar9 = (int *)(puVar10 + -0x66);
        puVar10 = puVar10 + -0x66;
        *piVar9 = unaff_D6w + 9;
        __mac_toolbox(0xa891);
      }
      else {
        uVar5 = uVar5 + 1;
        *(uint *)(param_1 + (iVar7 * 2 + -0x162)) = -uVar5;
      }
    }
    iVar7 = iVar7 + 1;
  } while (iVar7 < 6);
  *(undefined2 *)(puVar10 + -2) = 0;
  *(int *)(puVar10 + -4) = unaff_D6w + 0x46;
  __mac_toolbox(0xa893);
  *(undefined2 *)(puVar10 + -6) = 0x78;
  *(int *)(puVar10 + -8) = unaff_D6w + 0x46;
  __mac_toolbox(0xa891);
  *(undefined1 *)(param_1 + -0x3f5) = 1;
  *(long *)(puVar10 + -0xc) = param_1;
  *(undefined4 *)(puVar10 + -0x10) = 0x33bd2;
  bVar4 = CODE3_2940();
  iVar7 = 1;
  puVar10 = puVar10 + -0xc;
  do {
    puVar11 = puVar10;
    if ((&DAT_000fc37b)[iVar7] != '\0') {
      bVar4 = (-(iVar7 == DAT_000ffefe) | -(DAT_000ffefe < 1)) & (&DAT_000fc375)[iVar7] - 1;
      if (bVar4 != 0) {
        *(int *)(puVar10 + -2) = iVar7;
        puVar11 = puVar10 + -6;
        *(long *)(puVar10 + -6) = param_1;
        *(undefined4 *)(puVar10 + -10) = 0x33c02;
        bVar4 = CODE3_2aa4();
      }
    }
    iVar7 = iVar7 + 1;
    puVar10 = puVar11;
  } while (iVar7 < 6);
  *(undefined4 *)(puVar11 + -4) = local_22[0];
  __mac_toolbox(0xa873);
  return bVar4;
}



/* CODE 3 + 0x3c58, synthetic address 0x00033c58 */

/* Original CODE 3 resource offset 0x3c58 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

ulong CODE3_3c58(long param_1)

{
  byte bVar1;
  ulong uVar2;
  uint uVar3;
  undefined4 *puVar4;
  undefined1 *puVar5;
  undefined1 *puVar6;
  undefined4 local_90;
  undefined2 local_8c;
  undefined2 local_8a;
  undefined1 *puStack_88;
  undefined2 local_84;
  undefined2 local_82;
  undefined2 local_80;
  undefined2 local_7e;
  undefined1 *puStack_7c;
  undefined4 local_78;
  undefined2 local_74;
  undefined2 local_72;
  undefined2 local_70;
  undefined2 local_6e;
  undefined1 local_6c;
  undefined *puStack_6a;
  undefined1 *puStack_66;
  ulong local_62;
  undefined2 local_5a;
  undefined2 local_58;
  undefined2 local_56;
  undefined2 local_54;
  undefined1 *puStack_52;
  ulong local_4e;
  long lStack_4a;
  undefined1 auStack_2a [12];
  undefined4 local_1e [6];
  
  lStack_4a = param_1 + -0x130;
  __mac_toolbox(0xa874);
  local_4e = DAT_000fbe26;
  __mac_toolbox(0xa873);
  puStack_52 = auStack_2a;
  local_54 = 0x9b;
  local_56 = 0x118;
  local_58 = 0x109;
  local_5a = 300;
  __mac_toolbox(0xa8a7);
  local_62 = DAT_000fbe26;
  puStack_66 = auStack_2a;
  puStack_6a = &DAT_00033df8;
  local_6c = 1;
  local_6e = 0;
  local_70 = 0;
  local_72 = 1;
  local_74 = 0;
  uVar2 = 99;
  __mac_toolbox(0xa954);
  local_78 = 99;
  __mac_toolbox(0xa957);
  puStack_7c = auStack_2a;
  local_7e = 0xfffc;
  local_80 = 0xfffc;
  __mac_toolbox(0xa8a9);
  local_82 = 3;
  local_84 = 3;
  __mac_toolbox(0xa89b);
  puStack_88 = auStack_2a;
  local_8a = 0x10;
  local_8c = 0x10;
  __mac_toolbox(0xa8b0);
  local_90 = *(undefined4 *)(param_1 + -0x130);
  __mac_toolbox(0xa873);
  *(undefined1 *)(param_1 + -0x3fd) = 0;
  puVar4 = &local_90;
  do {
    __mac_toolbox(0xa9b4);
    *(undefined2 *)((long)puVar4 + -4) = 0x14a;
    *(int **)((long)puVar4 + -8) = &DAT_000fbdca;
    __mac_toolbox(0xa970);
    puVar6 = (undefined1 *)((long)puVar4 + -6);
    if (*(char *)((long)puVar4 + -8) != '\0') {
      uVar2 = (ulong)(DAT_000fbdca - 1U);
      if (DAT_000fbdca - 1U == 0) {
        local_1e[0] = DAT_000fbdd4;
        *(undefined4 **)((long)puVar4 + -10) = local_1e;
        __mac_toolbox(0xa871);
        *(undefined4 *)((long)puVar4 + -0x10) = DAT_000fbdd4;
        *(undefined1 **)((long)puVar4 + -0x14) = auStack_2a;
        __mac_toolbox(0xa8ad);
        puVar6 = (undefined1 *)((long)puVar4 + -0x12);
        if (*(char *)((long)puVar4 + -0x14) != '\0') {
          *(undefined4 *)((long)puVar4 + -0x18) = 99;
          *(undefined4 *)((long)puVar4 + -0x1c) = DAT_000fbdd4;
          *(undefined4 *)((long)puVar4 + -0x20) = 0;
          __mac_toolbox(0xa968);
          puVar6 = (undefined1 *)((long)puVar4 + -0x1e);
          if (0 < *(int *)((long)puVar4 + -0x20)) {
            *(undefined1 *)(param_1 + -0x3fd) = 1;
            puVar6 = (undefined1 *)((long)puVar4 + -0x1e);
          }
        }
      }
      else if (DAT_000fbdca == 3) {
        uVar3 = (uint)DAT_000fbdcc & 0xff;
        bVar1 = -(uVar3 == DAT_000fbdc0) | -(uVar3 == DAT_000fbdba);
        uVar2 = (ulong)bVar1;
        puVar6 = (undefined1 *)((long)puVar4 + -6);
        if (bVar1 != 0) {
          *(undefined4 *)((long)puVar4 + -10) = 99;
          *(undefined2 *)((long)puVar4 + -0xc) = 1;
          __mac_toolbox(0xa95d);
          *(undefined1 *)(param_1 + -0x3fd) = 1;
          puVar6 = (undefined1 *)((long)puVar4 + -0xc);
        }
      }
      else if (DAT_000fbdca == 6) {
        *(undefined4 *)(param_1 + -0x140) = DAT_000fbdcc;
        *(long *)((long)puVar4 + -10) = param_1 + -0x130;
        __mac_toolbox(0xa874);
        *(undefined4 *)((long)puVar4 + -0xe) = *(undefined4 *)(param_1 + -0x140);
        __mac_toolbox(0xa873);
        puVar5 = (undefined1 *)((long)puVar4 + -0x12);
        *(undefined4 *)((long)puVar4 + -0x12) = *(undefined4 *)(param_1 + -0x140);
        __mac_toolbox(0xa922);
        if (*(long *)(param_1 + -0x140) == *(long *)(param_1 + -0x13c)) {
          puVar5 = (undefined1 *)((long)puVar4 + -0x16);
          *(long *)((long)puVar4 + -0x16) = param_1;
          *(undefined4 *)((long)puVar4 + -0x1a) = 0x33d8a;
          uVar2 = CODE3_3874();
        }
        else {
          uVar2 = *(ulong *)(param_1 + -0x140);
          if (uVar2 == DAT_000fbe26) {
            *(long *)((long)puVar4 + -0x16) = param_1;
            *(undefined4 *)((long)puVar4 + -0x1a) = 0x33d9c;
            uVar2 = CODE3_3506();
            *(ulong *)((long)puVar4 + -0x1a) = DAT_000fbe26;
            __mac_toolbox(0xa969);
            *(undefined1 **)((long)puVar4 + -0x1e) = auStack_2a;
            *(undefined2 *)((long)puVar4 + -0x20) = 0x10;
            puVar5 = (undefined1 *)((long)puVar4 + -0x22);
            *(undefined2 *)((long)puVar4 + -0x22) = 0x10;
            __mac_toolbox(0xa8b0);
          }
        }
        *(undefined4 *)(puVar5 + -4) = *(undefined4 *)(param_1 + -0x140);
        __mac_toolbox(0xa923);
        *(undefined4 *)(puVar5 + -8) = *(undefined4 *)(param_1 + -0x130);
        __mac_toolbox(0xa873);
        puVar6 = puVar5 + -8;
      }
      else {
        uVar2 = (ulong)(DAT_000fbdca - 8U);
        puVar6 = (undefined1 *)((long)puVar4 + -6);
        if (DAT_000fbdca - 8U == 0) {
          *(undefined4 *)(param_1 + -0x140) = DAT_000fbdcc;
          *(undefined4 *)((long)puVar4 + -10) = *(undefined4 *)(param_1 + -0x140);
          __mac_toolbox(0xa873);
          puVar6 = (undefined1 *)((long)puVar4 + -10);
        }
      }
    }
    puVar4 = (undefined4 *)puVar6;
  } while (*(char *)(param_1 + -0x3fd) == '\0');
  *(ulong *)(puVar6 + -4) = DAT_000fbe26;
  __mac_toolbox(0xa956);
  return uVar2;
}



/* CODE 3 + 0x3e0a, synthetic address 0x00033e0a */

/* Original CODE 3 resource offset 0x3e0a (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

byte CODE3_3e0a(long param_1)

{
  byte bVar1;
  long lStack_c;
  
  __mac_toolbox(0xa975);
  bVar1 = *(byte *)(param_1 + -0x40b) & -(*(long *)(param_1 + -0x408) < lStack_c);
  if (bVar1 != 0) {
    bVar1 = JT_CODE1_07d4();
    *(undefined1 *)(param_1 + -0x40b) = 0;
  }
  return bVar1;
}



/* CODE 3 + 0x3e36, synthetic address 0x00033e36 */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Original CODE 3 resource offset 0x3e36 (includes four-byte resource header). Candidate from LINK
   A6 instruction; verify code/data boundary. */

ulong CODE3_3e36(undefined4 param_1)

{
  int *piVar1;
  undefined4 uVar2;
  undefined2 *puVar3;
  byte bVar4;
  int iVar5;
  ulong uVar6;
  undefined4 uVar7;
  long *unaff_D3;
  long *unaff_D4;
  char cVar8;
  char cVar9;
  byte bVar10;
  long lVar11;
  undefined4 *puVar12;
  undefined1 *puVar13;
  undefined1 *puVar14;
  undefined2 *puVar15;
  long *plVar16;
  undefined2 *puVar17;
  undefined1 *puVar18;
  undefined1 *puVar19;
  undefined1 *puVar20;
  undefined1 *puVar21;
  undefined1 *puVar22;
  undefined1 *puVar23;
  undefined4 *puVar24;
  undefined4 *puVar25;
  undefined1 *puVar26;
  undefined1 *puVar27;
  bool bVar28;
  undefined4 local_828;
  undefined4 *puStack_824;
  undefined4 local_4e2;
  int local_4de;
  undefined4 uStack_4dc;
  undefined4 local_4d8;
  undefined4 *local_4d4;
  undefined1 auStack_4d0 [108];
  undefined1 *local_464;
  long *local_460;
  undefined2 local_45c;
  undefined4 uStack_45a;
  undefined4 local_456;
  undefined2 *local_452;
  undefined2 local_448;
  undefined4 uStack_446;
  undefined4 local_442;
  undefined2 *local_43e;
  char local_439 [5];
  undefined2 local_434;
  undefined4 uStack_432;
  undefined4 local_42e;
  undefined2 *local_42a;
  long *local_426;
  undefined2 local_422;
  long local_420;
  undefined4 local_41c;
  undefined2 *local_418;
  undefined1 local_40f;
  long local_408;
  undefined1 local_402;
  undefined1 local_400;
  int local_3fe;
  int local_3fc;
  int local_3f8;
  undefined1 auStack_2f6 [256];
  long local_1f6;
  long alStack_1f2 [5];
  undefined2 local_1de;
  undefined1 auStack_158 [8];
  int local_150;
  long *local_14e;
  long local_140;
  int local_13c;
  int local_13a;
  int local_138;
  int local_136;
  long local_12c;
  undefined4 local_128;
  undefined4 local_124;
  undefined4 uStack_120;
  undefined4 uStack_11c;
  undefined4 uStack_118;
  
  puStack_824 = &local_128;
  __mac_toolbox(0xa874);
  local_828 = *DAT_000fbdc6;
  __mac_toolbox(0xa851);
  puVar12 = &local_828;
  while( true ) {
    *(undefined2 *)((long)puVar12 + -4) = 0x40;
    *(undefined2 **)((long)puVar12 + -8) = &DAT_000fbdca;
    __mac_toolbox(0xa970);
    if (*(char *)((long)puVar12 + -8) == '\0') break;
    *(undefined4 *)((long)puVar12 + -10) = 0x33e52;
    JT_CODE4_00e4();
    puVar12 = (undefined4 *)((long)puVar12 + -6);
  }
  local_136 = 1;
  bVar10 = 1;
  *(undefined1 **)((long)puVar12 + -10) = auStack_158;
  *(undefined2 *)((long)puVar12 + -0xc) = 0x1e;
  *(undefined2 *)((long)puVar12 + -0xe) = 0x23;
  *(undefined2 *)((long)puVar12 + -0x10) = 200;
  *(undefined2 *)((long)puVar12 + -0x12) = 0x4b;
  __mac_toolbox(0xa8a7);
  puVar14 = (undefined1 *)((long)puVar12 + -0x12);
  for (; (bVar10 & -(local_136 < 6)) != 0; local_136 = local_136 + 1) {
    puVar13 = puVar14;
    if (*(char *)((long)(local_136 * 0xa6 + -0x406a) + 0x100000) != '\0') {
      puVar13 = puVar14 + -4;
      *(long *)(puVar14 + -8) = (long)(local_136 * 0xa6 + -0x4068) + 0x100000;
      __mac_toolbox(0xa917);
      DAT_000fc030 = *(long **)(puVar14 + -8);
      if ((*(byte *)((long)(*(int *)(*DAT_000fc030 + 0x22b4) + -0x3c85) + 0x100000) &
          (*(byte *)(*DAT_000fc030 + 0x12a) | -(*(char *)(*DAT_000fc030 + 0x11a) + -1)) &
          -(param_1._0_2_ != local_136)) == 0) {
        bVar10 = 1;
      }
      else {
        *(undefined **)(puVar14 + -8) = &DAT_000350a2;
        *(undefined4 *)(puVar14 + -0xc) = 0x33ef4;
        JT_CODE4_0b4a();
        *(undefined1 **)(puVar14 + -0xc) = auStack_158;
        __mac_toolbox(0xa8a3);
        *(undefined2 *)(puVar14 + -0xe) = 0x1e;
        *(undefined2 *)(puVar14 + -0x10) = 0x32;
        __mac_toolbox(0xa893);
        *(long *)(puVar14 + -0x14) = (long)(local_136 * 0xa6 + -0x4068) + 0x100000;
        *(undefined1 **)(puVar14 + -0x18) = auStack_2f6;
        __mac_toolbox(0xa919);
        *(undefined1 **)(puVar14 + -0x1c) = auStack_2f6;
        __mac_toolbox(0xa884);
        puVar14[-0x20] = 0;
        puVar14[-0x22] = 0;
        *(undefined4 *)(puVar14 + -0x26) = 0x33f2a;
        JT_CODE5_3d44();
        puVar13 = puVar14 + -0x1c;
        bVar10 = puVar14[-0x1e];
      }
    }
    puVar14 = puVar13;
  }
  puVar13 = puVar14;
  if ((bVar10 & -(0 < param_1._0_2_)) != 0) {
    puVar13 = puVar14 + -4;
    *(long *)(puVar14 + -8) = (long)(param_1._0_2_ * 0xa6 + -0x4068) + 0x100000;
    __mac_toolbox(0xa917);
    DAT_000fc030 = *(long **)(puVar14 + -8);
    if (*(char *)(*DAT_000fc030 + 0x12a) != '\x01' || *(char *)(*DAT_000fc030 + 0x11a) != '\x01') {
      *(undefined **)(puVar14 + -8) = &DAT_00035094;
      *(undefined4 *)(puVar14 + -0xc) = 0x33f92;
      JT_CODE4_0b4a();
      *(undefined1 **)(puVar14 + -0xc) = auStack_158;
      __mac_toolbox(0xa8a3);
      *(undefined2 *)(puVar14 + -0xe) = 0x1e;
      *(undefined2 *)(puVar14 + -0x10) = 0x32;
      __mac_toolbox(0xa893);
      *(long *)(puVar14 + -0x14) = (long)(param_1._0_2_ * 0xa6 + -0x4068) + 0x100000;
      *(undefined1 **)(puVar14 + -0x18) = auStack_2f6;
      __mac_toolbox(0xa919);
      *(undefined1 **)(puVar14 + -0x1c) = auStack_2f6;
      __mac_toolbox(0xa884);
      puVar14[-0x20] = 0;
      puVar14[-0x22] = 1;
      *(undefined4 *)(puVar14 + -0x26) = 0x33fca;
      JT_CODE5_3d44();
      puVar13 = puVar14 + -0x1c;
      bVar10 = puVar14[-0x1e];
    }
  }
  *(undefined4 *)(puVar13 + -4) = 0x33fd0;
  JT_CODE4_0bc8();
  __mac_toolbox(0xa850);
  uVar6 = 100;
  DAT_000fff4c = 100;
  puVar14 = puVar13;
  if (bVar10 != 0) {
    bVar10 = 0;
    *(undefined4 *)(puVar13 + -8) = 0x736e6420;
    *(undefined4 **)(puVar13 + -0xc) = &DAT_0003508a;
    __mac_toolbox(0xa9a1);
    local_426 = *(long **)(puVar13 + -0xc);
    *(long **)(puVar13 + -0xc) = *(long **)(puVar13 + -0xc);
    __mac_toolbox(0xa029);
    puVar14 = puVar13 + -8;
    if (local_426 != (long *)0x0) {
      piVar1 = (int *)*local_426;
      bVar4 = -(piVar1[5] == 1) & -(piVar1[1] == 1) & -(*piVar1 == 1);
      uVar6 = (ulong)bVar4;
      puVar14 = puVar13 + -8;
      if (bVar4 != 0) {
        bVar10 = 1;
        lVar11 = *local_426;
        puVar3 = (undefined2 *)(lVar11 + 0x24);
        *puVar3 = 0;
        *(undefined4 *)(puVar13 + -0x10) = *(undefined4 *)(piVar1 + 0xe);
        *(undefined4 *)(puVar13 + -0x14) = 0x10000;
        *(undefined4 *)(puVar13 + -0x18) = 0x34044;
        JT_CODE1_02ec();
        *(undefined2 *)(puVar13 + -0x14) = 0x56f1;
        __mac_toolbox(0xa869);
        *(undefined4 *)(lVar11 + 0x26) = *(undefined4 *)(puVar13 + -0x14);
        local_41c = *(undefined4 *)(piVar1 + 0xc);
        *(undefined4 *)(puVar13 + -0x14) = *(undefined4 *)(piVar1 + 0xc);
        *(undefined4 *)(puVar13 + -0x18) = 0x3c;
        *(undefined4 *)(puVar13 + -0x1c) = 0x34062;
        JT_CODE1_0316();
        *(undefined4 *)(puVar13 + -0x18) = *(undefined4 *)(piVar1 + 0xe);
        *(undefined4 *)(puVar13 + -0x1c) = 0x10000;
        *(undefined4 *)(puVar13 + -0x20) = 0x34074;
        uVar7 = JT_CODE1_02ec();
        uVar2 = *(undefined4 *)(puVar13 + -0x1c);
        *(undefined4 *)(puVar13 + -0x1c) = uVar7;
        *(undefined4 *)(puVar13 + -0x20) = uVar2;
        *(undefined4 *)(puVar13 + -0x24) = 0x3407e;
        JT_CODE1_02ec();
        puVar14 = puVar13 + -0x1c;
        local_420 = *(long *)(puVar13 + -0x20);
        if (0x32 < *(long *)(puVar13 + -0x20)) {
          local_420 = 0x32;
        }
        uVar6 = 0x32;
        local_418 = puVar3;
        local_422 = 2;
      }
    }
  }
  puVar13 = puVar14;
  if (bVar10 != 0) {
    bVar10 = 0;
    *(undefined4 *)(puVar14 + -8) = 0x736e6420;
    *(undefined4 **)(puVar14 + -0xc) = &DAT_00035084;
    __mac_toolbox(0xa9a1);
    unaff_D3 = *(long **)(puVar14 + -0xc);
    *(long **)(puVar14 + -0xc) = unaff_D3;
    __mac_toolbox(0xa029);
    puVar13 = puVar14 + -8;
    if (unaff_D3 != (long *)0x0) {
      piVar1 = (int *)*unaff_D3;
      bVar4 = -(piVar1[5] == 1) & -(piVar1[1] == 1) & -(*piVar1 == 1);
      uVar6 = (ulong)bVar4;
      puVar13 = puVar14 + -8;
      if (bVar4 != 0) {
        bVar10 = 1;
        lVar11 = *unaff_D3;
        puVar3 = (undefined2 *)(lVar11 + 0x24);
        *puVar3 = 0;
        *(undefined4 *)(puVar14 + -0x10) = *(undefined4 *)(piVar1 + 0xe);
        *(undefined4 *)(puVar14 + -0x14) = 0x10000;
        *(undefined4 *)(puVar14 + -0x18) = 0x340fc;
        JT_CODE1_02ec();
        *(undefined2 *)(puVar14 + -0x14) = 0x56f1;
        __mac_toolbox(0xa869);
        *(undefined4 *)(lVar11 + 0x26) = *(undefined4 *)(puVar14 + -0x14);
        local_42e = *(undefined4 *)(piVar1 + 0xc);
        *(undefined4 *)(puVar14 + -0x14) = *(undefined4 *)(piVar1 + 0xc);
        *(undefined4 *)(puVar14 + -0x18) = 0x3c;
        *(undefined4 *)(puVar14 + -0x1c) = 0x3411a;
        JT_CODE1_0316();
        *(undefined4 *)(puVar14 + -0x18) = *(undefined4 *)(piVar1 + 0xe);
        *(undefined4 *)(puVar14 + -0x1c) = 0x10000;
        *(undefined4 *)(puVar14 + -0x20) = 0x3412c;
        uVar7 = JT_CODE1_02ec();
        uVar2 = *(undefined4 *)(puVar14 + -0x1c);
        *(undefined4 *)(puVar14 + -0x1c) = uVar7;
        *(undefined4 *)(puVar14 + -0x20) = uVar2;
        *(undefined4 *)(puVar14 + -0x24) = 0x34136;
        uVar6 = JT_CODE1_02ec();
        puVar13 = puVar14 + -0x1c;
        uStack_432 = *(undefined4 *)(puVar14 + -0x20);
        local_42a = puVar3;
        local_434 = 4;
      }
    }
  }
  puVar14 = puVar13;
  if (bVar10 != 0) {
    bVar10 = 0;
    *(undefined4 *)(puVar13 + -8) = 0x736e6420;
    *(undefined4 **)(puVar13 + -0xc) = &DAT_0003507a;
    __mac_toolbox(0xa9a1);
    unaff_D4 = *(long **)(puVar13 + -0xc);
    *(long **)(puVar13 + -0xc) = unaff_D4;
    __mac_toolbox(0xa029);
    puVar14 = puVar13 + -8;
    if (unaff_D4 != (long *)0x0) {
      piVar1 = (int *)*unaff_D4;
      bVar4 = -(piVar1[5] == 1) & -(piVar1[1] == 1) & -(*piVar1 == 1);
      uVar6 = (ulong)bVar4;
      puVar14 = puVar13 + -8;
      if (bVar4 != 0) {
        bVar10 = 1;
        lVar11 = *unaff_D4;
        puVar3 = (undefined2 *)(lVar11 + 0x24);
        *puVar3 = 0;
        *(undefined4 *)(puVar13 + -0x10) = *(undefined4 *)(piVar1 + 0xe);
        *(undefined4 *)(puVar13 + -0x14) = 0x10000;
        *(undefined4 *)(puVar13 + -0x18) = 0x341a6;
        JT_CODE1_02ec();
        *(undefined2 *)(puVar13 + -0x14) = 0x56f1;
        __mac_toolbox(0xa869);
        *(undefined4 *)(lVar11 + 0x26) = *(undefined4 *)(puVar13 + -0x14);
        local_442 = *(undefined4 *)(piVar1 + 0xc);
        *(undefined4 *)(puVar13 + -0x14) = *(undefined4 *)(piVar1 + 0xc);
        *(undefined4 *)(puVar13 + -0x18) = 0x3c;
        *(undefined4 *)(puVar13 + -0x1c) = 0x341c4;
        JT_CODE1_0316();
        *(undefined4 *)(puVar13 + -0x18) = *(undefined4 *)(piVar1 + 0xe);
        *(undefined4 *)(puVar13 + -0x1c) = 0x10000;
        *(undefined4 *)(puVar13 + -0x20) = 0x341d6;
        uVar7 = JT_CODE1_02ec();
        uVar2 = *(undefined4 *)(puVar13 + -0x1c);
        *(undefined4 *)(puVar13 + -0x1c) = uVar7;
        *(undefined4 *)(puVar13 + -0x20) = uVar2;
        *(undefined4 *)(puVar13 + -0x24) = 0x341e0;
        uVar6 = JT_CODE1_02ec();
        puVar14 = puVar13 + -0x1c;
        uStack_446 = *(undefined4 *)(puVar13 + -0x20);
        local_43e = puVar3;
        local_448 = 3;
      }
    }
  }
  puVar13 = puVar14;
  if (bVar10 != 0) {
    bVar10 = 0;
    *(undefined4 *)(puVar14 + -8) = 0x736e6420;
    *(undefined4 *)(puVar14 + -0xc) = 0x35074;
    __mac_toolbox(0xa9a1);
    local_460 = *(long **)(puVar14 + -0xc);
    *(long **)(puVar14 + -0xc) = *(long **)(puVar14 + -0xc);
    __mac_toolbox(0xa029);
    puVar13 = puVar14 + -8;
    if (local_460 != (long *)0x0) {
      piVar1 = (int *)*local_460;
      bVar4 = -(piVar1[5] == 1) & -(piVar1[1] == 1) & -(*piVar1 == 1);
      uVar6 = (ulong)bVar4;
      puVar13 = puVar14 + -8;
      if (bVar4 != 0) {
        bVar10 = 1;
        lVar11 = *local_460;
        puVar3 = (undefined2 *)(lVar11 + 0x24);
        *puVar3 = 0;
        *(undefined4 *)(puVar14 + -0x10) = *(undefined4 *)(piVar1 + 0xe);
        *(undefined4 *)(puVar14 + -0x14) = 0x10000;
        *(undefined4 *)(puVar14 + -0x18) = 0x3425a;
        JT_CODE1_02ec();
        *(undefined2 *)(puVar14 + -0x14) = 0x56f1;
        __mac_toolbox(0xa869);
        *(undefined4 *)(lVar11 + 0x26) = *(undefined4 *)(puVar14 + -0x14);
        local_456 = *(undefined4 *)(piVar1 + 0xc);
        *(undefined4 *)(puVar14 + -0x14) = *(undefined4 *)(piVar1 + 0xc);
        *(undefined4 *)(puVar14 + -0x18) = 0x3c;
        *(undefined4 *)(puVar14 + -0x1c) = 0x34278;
        JT_CODE1_0316();
        *(undefined4 *)(puVar14 + -0x18) = *(undefined4 *)(piVar1 + 0xe);
        *(undefined4 *)(puVar14 + -0x1c) = 0x10000;
        *(undefined4 *)(puVar14 + -0x20) = 0x3428a;
        uVar7 = JT_CODE1_02ec();
        uVar2 = *(undefined4 *)(puVar14 + -0x1c);
        *(undefined4 *)(puVar14 + -0x1c) = uVar7;
        *(undefined4 *)(puVar14 + -0x20) = uVar2;
        *(undefined4 *)(puVar14 + -0x24) = 0x34294;
        uVar6 = JT_CODE1_02ec();
        puVar13 = puVar14 + -0x1c;
        uStack_45a = *(undefined4 *)(puVar14 + -0x20);
        local_452 = puVar3;
        local_45c = 2;
      }
    }
  }
  if (0 < param_1._0_2_) {
    local_136 = 0;
    puVar14 = puVar13;
    do {
      local_138 = 1;
      switch(local_136) {
      case 0:
        local_13a = 0xb;
        local_124 = 0x2783a08;
        break;
      case 1:
        local_138 = 0x34;
        local_13a = 0xb;
        local_124 = 0x2793a08;
        break;
      case 2:
        local_13a = 0x16;
        local_124 = CONCAT22(DAT_0003506c._2_2_,_UNK_00035070);
        uStack_120 = DAT_00035072;
        break;
      case 3:
        local_138 = 0x34;
        local_13a = 0x16;
        local_124 = DAT_00035068;
        uStack_120 = CONCAT22(DAT_0003506c._0_2_,DAT_0003506c._2_2_);
        break;
      case 4:
        local_13a = 0x2c;
        local_124 = DAT_00035060;
        uStack_120 = DAT_00035064;
        break;
      case 5:
        local_13a = 0x21;
        local_124 = DAT_00035058;
        uStack_120 = DAT_0003505c;
        break;
      case 6:
        local_138 = 0x36;
        local_13a = 0x21;
        local_124 = CONCAT22(DAT_0003504e._2_2_,_UNK_00035052);
        uStack_120 = DAT_00035054;
        break;
      case 7:
        local_138 = 0x42;
        local_13a = 0x37;
        local_124 = DAT_0003504a;
        uStack_120 = CONCAT22(DAT_0003504e._0_2_,DAT_0003504e._2_2_);
        break;
      case 8:
        local_138 = 0x3e;
        local_13a = 0x2c;
        local_124 = DAT_00035042;
        uStack_120 = DAT_00035046;
        break;
      case 9:
        local_13a = 0x42;
        local_124 = DAT_00035036;
        uStack_120 = DAT_0003503a;
        uStack_11c = DAT_0003503e;
        break;
      case 10:
        local_13a = 99;
        local_124 = DAT_00035026;
        uStack_120 = DAT_0003502a;
        uStack_11c = DAT_0003502e;
        uStack_118 = DAT_00035032;
        break;
      case 0xb:
        local_13a = 0x58;
        local_124 = DAT_00035016;
        uStack_120 = DAT_0003501a;
        uStack_11c = DAT_0003501e;
        uStack_118 = DAT_00035022;
        break;
      case 0xc:
        local_13a = 0x6e;
        local_124 = DAT_0003500e;
        uStack_120 = DAT_00035012;
        break;
      case 0xd:
        local_138 = 0x3b;
        local_13a = 0x6e;
        local_124 = DAT_00035006;
        uStack_120 = DAT_0003500a;
        break;
      case 0xe:
        local_13a = 0x79;
        local_124 = DAT_00034ffe;
        uStack_120 = DAT_00035002;
        break;
      case 0xf:
        local_138 = 0x3b;
        local_13a = 0x79;
        local_124 = DAT_00034ff6;
        uStack_120 = DAT_00034ffa;
        break;
      case 0x10:
        local_13a = 0x37;
        local_124 = DAT_00034fee;
        uStack_120 = DAT_00034ff2;
        break;
      case 0x11:
        local_13a = 0x4d;
        local_124 = CONCAT22(DAT_00034fe4._2_2_,_UNK_00034fe8);
        uStack_120 = DAT_00034fea;
        break;
      default:
        if (local_136 == 0x12) {
          local_13a = 0x84;
          local_124 = DAT_00034fd8;
          uStack_120 = DAT_00034fdc;
          uStack_11c = DAT_00034fe0;
          uStack_118 = CONCAT22(DAT_00034fe4._0_2_,DAT_00034fe4._2_2_);
        }
      }
      *(int *)(&stack0xfffffffc + (local_136 * 0x18 + -0x7c4)) = local_138;
      *(int *)(&stack0xfffffffc + (local_136 * 0x18 + -0x7c6)) = local_13a + 0x45;
      *(undefined2 *)(puVar14 + -2) = 0xf;
      *(undefined4 **)(puVar14 + -6) = &local_124;
      puVar13 = puVar14 + -10;
      *(undefined1 **)(puVar14 + -10) = &stack0xfffffffc + (local_136 * 0x18 + -0x7c2);
      *(undefined4 *)(puVar14 + -0xe) = 0x3450a;
      uVar6 = JT_CODE1_03e2();
      local_136 = local_136 + 1;
      puVar14 = puVar14 + -10;
    } while (local_136 < 0x13);
  }
  if (bVar10 != 0) {
    DAT_000ffefa = '\0';
    DAT_000ffefb = 0 < param_1._0_2_;
    DAT_000ffefe = param_1._0_2_;
    local_136 = 1;
    do {
      *(undefined4 *)(&stack0xfffffffc + (local_136 * 4 + -0x1f2)) = 0;
      local_136 = local_136 + 1;
    } while (local_136 < 6);
    local_1f6 = 0;
    local_136 = 0;
    __mac_toolbox(0xa924);
    lVar11 = *(long *)(puVar13 + -4);
    while (lVar11 != 0) {
      if (*(int *)(lVar11 + 0x6c) < 0) {
        puVar15 = (undefined2 *)(puVar13 + -2);
        puVar13 = puVar13 + -2;
        *puVar15 = *(undefined2 *)(lVar11 + 0x6c);
        __mac_toolbox(0xa9b7);
      }
      else {
        *(long *)(puVar13 + -8) = lVar11;
        __mac_toolbox(0xa917);
        DAT_000fc030 = *(long **)(puVar13 + -8);
        if ((byte)(-(*(char *)(lVar11 + 0x6e) == '\x01') & -(*(char *)*DAT_000fc030 == '\0')) == 0)
        {
          if ((byte)(-(*(char *)(lVar11 + 0x6e) == '\x01') & -(*(char *)*DAT_000fc030 == '\x01')) !=
              0) {
            local_1f6 = lVar11;
          }
        }
        else {
          local_136 = local_136 + 1;
          *(long *)(&stack0xfffffffc + (local_136 * 4 + -0x1f2)) = lVar11;
        }
        plVar16 = (long *)(puVar13 + -8);
        puVar13 = puVar13 + -8;
        *plVar16 = lVar11;
        __mac_toolbox(0xa916);
      }
      __mac_toolbox(0xa924);
      lVar11 = *(long *)(puVar13 + -4);
    }
    local_136 = 0x81;
    do {
      if ((byte)(-(local_136 != 0x81) & -(local_136 != 0x86)) != 0) {
        *(undefined4 *)(puVar13 + -4) = *(undefined4 *)((long)(local_136 * 4 + -0x440a) + 0x100000);
        puVar17 = (undefined2 *)(puVar13 + -6);
        puVar13 = puVar13 + -6;
        *puVar17 = 0;
        __mac_toolbox(0xa93a);
      }
      local_136 = local_136 + 1;
    } while (local_136 < 0x88);
    *(undefined4 *)(puVar13 + -4) = DAT_000fbdfa;
    *(undefined2 *)(puVar13 + -6) = 1;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar13 + -10) = DAT_000fbdfa;
    *(undefined2 *)(puVar13 + -0xc) = 2;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar13 + -0x10) = DAT_000fbdfa;
    *(undefined2 *)(puVar13 + -0x12) = 4;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar13 + -0x16) = DAT_000fbdfa;
    *(undefined2 *)(puVar13 + -0x18) = 5;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar13 + -0x1c) = DAT_000fbdfa;
    *(undefined2 *)(puVar13 + -0x1e) = 6;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar13 + -0x22) = DAT_000fbdfa;
    *(undefined2 *)(puVar13 + -0x24) = 7;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar13 + -0x28) = DAT_000fbdfa;
    *(undefined2 *)(puVar13 + -0x2a) = 9;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar13 + -0x2e) = DAT_000fbdfa;
    *(undefined2 *)(puVar13 + -0x30) = 10;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar13 + -0x34) = DAT_000fbe0e;
    *(undefined2 *)(puVar13 + -0x36) = 1;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar13 + -0x3a) = DAT_000fbe0e;
    *(undefined2 *)(puVar13 + -0x3c) = 2;
    __mac_toolbox(0xa939);
    *(undefined4 *)(puVar13 + -0x40) = DAT_000fbe0e;
    *(undefined2 *)(puVar13 + -0x42) = 4;
    __mac_toolbox(0xa939);
    *(undefined4 *)(puVar13 + -0x46) = DAT_000fbe0e;
    *(undefined2 *)(puVar13 + -0x48) = 5;
    __mac_toolbox(0xa939);
    *(undefined4 *)(puVar13 + -0x4c) = DAT_000fbe0e;
    *(undefined2 *)(puVar13 + -0x4e) = 7;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar13 + -0x52) = DAT_000fbe0e;
    *(undefined2 *)(puVar13 + -0x54) = 10;
    __mac_toolbox(0xa939);
    *(undefined4 *)(puVar13 + -0x58) = DAT_000fbdfe;
    *(undefined2 *)(puVar13 + -0x5a) = 3;
    __mac_toolbox(0xa939);
    *(undefined4 *)(puVar13 + -0x5e) = DAT_000fbdfe;
    *(undefined2 *)(puVar13 + -0x60) = 4;
    __mac_toolbox(0xa939);
    *(undefined4 *)(puVar13 + -100) = DAT_000fbdfe;
    *(undefined2 *)(puVar13 + -0x66) = 5;
    __mac_toolbox(0xa939);
    *(undefined4 *)(puVar13 + -0x6a) = DAT_000fbdfe;
    *(undefined2 *)(puVar13 + -0x6c) = 6;
    __mac_toolbox(0xa939);
    *(undefined4 *)(puVar13 + -0x70) = DAT_000fbdfe;
    *(undefined2 *)(puVar13 + -0x72) = 7;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar13 + -0x76) = DAT_000fbdfe;
    *(undefined2 *)(puVar13 + -0x78) = 9;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar13 + -0x7c) = DAT_000fbdfe;
    *(undefined2 *)(puVar13 + -0x7e) = 10;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar13 + -0x82) = DAT_000fbdfe;
    *(undefined2 *)(puVar13 + -0x84) = 0xc;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar13 + -0x88) = DAT_000fbdfe;
    *(undefined2 *)(puVar13 + -0x8a) = 0xd;
    __mac_toolbox(0xa93a);
    local_402 = 0;
    if ((bool)DAT_000ffefb) {
      *(undefined4 *)(puVar13 + -0x8e) = DAT_000fbe0e;
      *(undefined2 *)(puVar13 + -0x90) = 8;
      __mac_toolbox(0xa939);
      *(undefined4 *)(puVar13 + -0x94) = DAT_000fbe0e;
      *(undefined2 *)(puVar13 + -0x96) = 8;
      *(undefined **)(puVar13 + -0x9a) = &DAT_00034fc6;
      __mac_toolbox(0xa947);
      *(undefined4 *)(puVar13 + -0x9e) = DAT_000fbe0e;
      *(undefined2 *)(puVar13 + -0xa0) = 9;
      __mac_toolbox(0xa939);
      DAT_000fc02e = 1;
      *(undefined4 *)(puVar13 + -0xa4) = DAT_000fbe0e;
      *(undefined2 *)(puVar13 + -0xa6) = 9;
      *(undefined **)(puVar13 + -0xaa) = &DAT_00034faa;
      __mac_toolbox(0xa947);
      *(undefined4 *)(puVar13 + -0xae) = DAT_000fbe0e;
      *(undefined2 *)(puVar13 + -0xb0) = 2;
      puVar18 = puVar13 + -0xb4;
      *(undefined **)(puVar13 + -0xb4) = &DAT_00034fa0;
      __mac_toolbox(0xa947);
    }
    else {
      *(undefined4 *)(puVar13 + -0x8e) = DAT_000fbe0e;
      *(undefined2 *)(puVar13 + -0x90) = 8;
      puVar18 = puVar13 + -0x94;
      *(undefined **)(puVar13 + -0x94) = &DAT_00034f8e;
      __mac_toolbox(0xa947);
    }
    __mac_toolbox(0xa937);
    *(undefined2 *)(puVar18 + -6) = 0x80;
    *(undefined4 *)(puVar18 + -10) = 0;
    *(undefined4 *)(puVar18 + -0xe) = 0xffffffff;
    __mac_toolbox(0xa9bd);
    DAT_000fbe26 = *(long *)(puVar18 + -0xe);
    *(long *)(puVar18 + -0xe) = DAT_000fbe26;
    *(undefined2 *)(puVar18 + -0x10) = 0;
    *(undefined2 *)(puVar18 + -0x12) = 0x17;
    puVar18[-0x14] = 0;
    __mac_toolbox(0xa91b);
    *(long *)(puVar18 + -0x18) = DAT_000fbe26;
    __mac_toolbox(0xa873);
    *(long *)(puVar18 + -0x1c) = DAT_000fbe26;
    __mac_toolbox(0xa915);
    local_1de = 0;
    *(long *)(puVar18 + -0x24) =
         (long)((((*(int *)(DAT_000fbe26 + 0x16) - *(int *)(DAT_000fbe26 + 0x12)) + 7) / 8) *
               (*(int *)(DAT_000fbe26 + 0x14) - *(int *)(DAT_000fbe26 + 0x10)));
    *(undefined4 *)(puVar18 + -0x28) = 0x347c4;
    DAT_000ffefc = DAT_000ffefb;
    JT_CODE1_053a();
    puVar19 = puVar18 + -0x20;
    local_4d4 = *(undefined4 **)(puVar18 + -0x24);
    if (local_4d4 != (undefined4 *)0x0) {
      *(undefined4 **)(puVar18 + -0x24) = local_4d4;
      __mac_toolbox(0xa029);
      local_464 = auStack_4d0;
      *(undefined1 **)(puVar18 + -0x24) = auStack_4d0;
      __mac_toolbox(0xa86f);
      local_4de = ((*(int *)(DAT_000fbe26 + 0x16) - *(int *)(DAT_000fbe26 + 0x12)) + 7) / 8;
      uStack_4dc = *(undefined4 *)(DAT_000fbe26 + 0x10);
      local_4d8 = *(undefined4 *)(DAT_000fbe26 + 0x14);
      *(undefined4 **)(puVar18 + -0x28) = &uStack_4dc;
      *(int *)(puVar18 + -0x2a) = -*(int *)(DAT_000fbe26 + 0x12);
      *(int *)(puVar18 + -0x2c) = -*(int *)(DAT_000fbe26 + 0x10);
      __mac_toolbox(0xa8a8);
      local_4e2 = *local_4d4;
      *(undefined4 **)(puVar18 + -0x30) = &local_4e2;
      __mac_toolbox(0xa875);
      *(undefined2 *)(puVar18 + -0x32) = local_4d8._2_2_;
      *(undefined2 *)(puVar18 + -0x34) = local_4d8._0_2_;
      __mac_toolbox(0xa876);
      *(undefined2 *)(puVar18 + -0x3a) = 0x87;
      *(undefined4 *)(puVar18 + -0x3e) = 0;
      *(undefined4 *)(puVar18 + -0x42) = 0xffffffff;
      __mac_toolbox(0xa9bd);
      local_140 = *(long *)(puVar18 + -0x42);
      local_12c = local_140;
      *(long *)(puVar18 + -0x42) = local_140;
      __mac_toolbox(0xa873);
      *(long *)(puVar18 + -0x46) = local_140;
      __mac_toolbox(0xa915);
      *(undefined2 *)(puVar18 + -0x48) = 3;
      __mac_toolbox(0xa887);
      *(undefined2 *)(puVar18 + -0x4a) = 9;
      __mac_toolbox(0xa88a);
      *(undefined2 *)(puVar18 + -0x4c) = 0;
      __mac_toolbox(0xa938);
      *(undefined **)(puVar18 + -0x52) = &DAT_00034f88;
      __mac_toolbox(0xa88c);
      __mac_toolbox(0xa975);
      DAT_000fff4c = *(undefined4 *)(puVar18 + -0x54);
      local_3fc = 1;
      puVar14 = puVar18 + -0x50;
      while ((byte)(DAT_000ffefa - 1U & -(local_3fc <= param_1._2_2_)) != 0) {
        local_40f = 0;
        local_3fe = 0x32;
        DAT_000ff904 = 0;
        DAT_000fc382 = 0;
        *(long *)(puVar14 + -4) = DAT_000fbe26;
        __mac_toolbox(0xa873);
        *(long *)(puVar14 + -8) = DAT_000fbe26 + 0x10;
        __mac_toolbox(0xa8a3);
        *(long *)(puVar14 + -0xc) = local_140;
        __mac_toolbox(0xa873);
        *(long *)(puVar14 + -0x10) = local_140 + 0x10;
        __mac_toolbox(0xa8a3);
        local_150 = 0;
        *(undefined1 **)(puVar14 + -0x14) = &stack0xfffffffc;
        *(undefined4 *)(puVar14 + -0x18) = 0x348d6;
        CODE3_3874();
        local_150 = 1;
        puVar14[-0x16] = 1;
        puVar14[-0x18] = 1;
        puVar23 = puVar14 + -0x1c;
        *(undefined1 **)(puVar14 + -0x1c) = &stack0xfffffffc;
        *(undefined4 *)(puVar14 + -0x20) = 0x348ea;
        CODE3_3062();
        *(undefined2 *)(puVar14 + -0x1e) = 0x17e;
        *(undefined2 *)(puVar14 + -0x20) = 0;
        __mac_toolbox(0xa032);
        cVar8 = '\0';
        __mac_toolbox(0xa975);
        local_408 = *(long *)(puVar14 + -0x20);
        do {
          *(undefined1 **)(puVar23 + -4) = &stack0xfffffffc;
          *(undefined4 *)(puVar23 + -8) = 0x34908;
          CODE3_2872();
          iVar5 = DAT_000ff906;
          local_3f8 = DAT_000fc382;
          local_136 = 1;
          puVar14 = puVar23;
          do {
            puVar23 = puVar14 + -4;
            if (iVar5 < local_136) break;
            puVar23 = puVar14 + -8;
            *(undefined1 **)(puVar14 + -8) = &stack0xfffffffc;
            *(undefined4 *)(puVar14 + -0xc) = 0x34922;
            CODE3_2872();
            local_138 = 1;
            do {
              if (DAT_000ff906 * 7000 + 3000 < local_138) break;
              local_13a = local_136 + local_138;
              bVar28 = SCARRY2(local_138,1);
              local_138 = local_138 + 1;
            } while (!bVar28);
            bVar28 = SCARRY2(local_136,1);
            local_136 = local_136 + 1;
            puVar14 = puVar14 + -4;
          } while (!bVar28);
          if (DAT_000ff906 == 4) {
            do {
              __mac_toolbox(0xa975);
            } while (*(long *)(puVar23 + -4) + -10 <= local_408);
          }
          __mac_toolbox(0xa975);
          local_408 = *(long *)(puVar23 + -4);
          if (DAT_000ffefb != '\x01') {
            cVar9 = '\0';
            local_136 = 1;
            puVar14 = puVar23;
            do {
              puVar13 = puVar14;
              if (*(char *)((long)(local_136 + -0x3c8b) + 0x100000) != '\0') {
                puVar13 = puVar14 + -4;
                *(undefined1 **)(puVar14 + -4) = &stack0xfffffffc;
                *(undefined4 *)(puVar14 + -8) = 0x349b2;
                CODE3_3e0a();
                local_14e = *(long **)((long)(local_136 * 0xa6 + -0x3fd0) + 0x100000);
                *(long **)(puVar14 + -8) = local_14e;
                __mac_toolbox(0xa029);
                local_13a = *(int *)((long)(*(int *)(*local_14e + 0x11c) * 2 + -0x3c7c) + 0x100000)
                            - *(int *)(*local_14e + 0x222c);
                if ((DAT_000ffefc & -(DAT_000ffefe == local_136)) == 0) {
                  *(long *)(puVar14 + -10) = *local_14e + 0x11c;
                  *(int *)(puVar14 + -0xc) = local_13a;
                  puVar14[-0xe] = 1;
                  *(undefined4 *)(puVar14 + -0x12) = 0x34af8;
                  CODE3_1af0();
                  cVar9 = puVar14[-6];
                  puVar13 = puVar14 + -4;
                  if (cVar9 != '\0') {
                    *(int *)(*local_14e + 0x222c) = *(int *)(*local_14e + 0x222c) + local_13a;
                    local_136 = local_136 + -1;
                    *(undefined1 **)(puVar14 + -8) = &stack0xfffffffc;
                    *(undefined4 *)(puVar14 + -0xc) = 0x34b26;
                    CODE3_281a();
                    *(long **)(puVar14 + -0xc) = local_14e;
                    *(undefined1 **)(puVar14 + -0x10) = &stack0xfffffffc;
                    *(undefined4 *)(puVar14 + -0x14) = 0x34b30;
                    CODE3_2114();
                    *(long **)(puVar14 + -0x14) = local_14e;
                    puVar13 = puVar14 + -0x18;
                    *(undefined1 **)(puVar14 + -0x18) = &stack0xfffffffc;
                    *(undefined4 *)(puVar14 + -0x1c) = 0x34b3a;
                    CODE3_2204();
                  }
                }
                else {
                  if (cVar9 == '\0') {
                    local_400 = 1;
                  }
                  else {
                    local_400 = 0;
                    cVar9 = '\0';
                    puVar13 = puVar14 + -4;
                  }
                  while ((byte)(cVar8 - 1U & DAT_000ffefa - 1U & -(0 < local_13a)) != 0) {
                    *(long *)(puVar13 + -6) = *local_14e + 0x11c;
                    *(undefined2 *)(puVar13 + -8) = 1;
                    puVar13[-10] = local_400;
                    *(undefined4 *)(puVar13 + -0xe) = 0x34a34;
                    CODE3_1af0();
                    cVar9 = puVar13[-2];
                    puVar14 = puVar13;
                    if (cVar9 != '\0') {
                      puVar14 = puVar13 + -4;
                      *(undefined1 **)(puVar13 + -4) = &stack0xfffffffc;
                      *(undefined4 *)(puVar13 + -8) = 0x34a40;
                      CODE3_281a();
                      cVar9 = '\0';
                    }
                    *(long **)(puVar14 + -4) = local_14e;
                    *(undefined1 **)(puVar14 + -8) = &stack0xfffffffc;
                    *(undefined4 *)(puVar14 + -0xc) = 0x34a4c;
                    CODE3_2114();
                    *(long **)(puVar14 + -0xc) = local_14e;
                    *(undefined1 **)(puVar14 + -0x10) = &stack0xfffffffc;
                    *(undefined4 *)(puVar14 + -0x14) = 0x34a56;
                    CODE3_2204();
                    local_13a = local_13a + -1;
                    puVar14 = puVar14 + -0x10;
                    do {
                      puVar20 = puVar14;
                      *(undefined1 **)(puVar20 + -4) = &stack0xfffffffc;
                      *(undefined4 *)(puVar20 + -8) = 0x34a66;
                      CODE3_3e0a();
                      puVar21 = puVar20 + -8;
                      *(undefined1 **)(puVar20 + -8) = &stack0xfffffffc;
                      *(undefined4 *)(puVar20 + -0xc) = 0x34a6c;
                      CODE3_2872();
                      puVar14 = puVar20 + -8;
                    } while (cVar8 == '\0' && (DAT_000ffefa == '\0' && DAT_000ffefb == '\x01'));
                    local_400 = 0;
                    puVar13 = puVar20 + -8;
                    if (DAT_000ffefc != 1) {
                      *(long *)(puVar20 + -0xe) = *local_14e + 0x11c;
                      *(int *)(puVar20 + -0x10) = local_13a;
                      puVar20[-0x12] = 0;
                      *(undefined4 *)(puVar20 + -0x16) = 0x34aa2;
                      CODE3_1af0();
                      cVar9 = puVar20[-10];
                      if (cVar9 != '\0') {
                        *(undefined1 **)(puVar20 + -0xc) = &stack0xfffffffc;
                        *(undefined4 *)(puVar20 + -0x10) = 0x34aae;
                        CODE3_281a();
                        *(long **)(puVar20 + -0x10) = local_14e;
                        *(undefined1 **)(puVar20 + -0x14) = &stack0xfffffffc;
                        *(undefined4 *)(puVar20 + -0x18) = 0x34ab8;
                        CODE3_2114();
                        *(long **)(puVar20 + -0x18) = local_14e;
                        puVar21 = puVar20 + -0x1c;
                        *(undefined1 **)(puVar20 + -0x1c) = &stack0xfffffffc;
                        *(undefined4 *)(puVar20 + -0x20) = 0x34ac2;
                        CODE3_2204();
                      }
                      local_13a = 0;
                      puVar13 = puVar21;
                    }
                  }
                }
                *(long **)(puVar13 + -4) = local_14e;
                __mac_toolbox(0xa02a);
              }
              local_136 = local_136 + 1;
              puVar14 = puVar13;
            } while (local_136 < 6);
            local_150 = local_150 + 1;
            *(char **)(puVar13 + -4) = local_439;
            puVar22 = puVar13 + -6;
            *(int *)(puVar13 + -6) = local_150;
            *(undefined4 *)(puVar13 + -10) = 0x34b66;
            CODE3_0880();
            if (local_439[0] != '\0') {
              *(undefined2 **)(puVar13 + -10) = &local_448;
              puVar22 = puVar13 + -0xe;
              *(undefined1 **)(puVar13 + -0xe) = &stack0xfffffffc;
              *(undefined4 *)(puVar13 + -0x12) = 0x34b76;
              CODE3_1f80();
            }
            puVar22[-2] = 1;
            puVar22[-4] = -(-(local_150 % 8 == 0) | DAT_000ff91d - 1U);
            puVar23 = puVar22 + -8;
            *(undefined1 **)(puVar22 + -8) = &stack0xfffffffc;
            *(undefined4 *)(puVar22 + -0xc) = 0x34b9c;
            CODE3_3062();
            if (local_3f8 != DAT_000fc382) {
              local_13c = 1;
              do {
                if (*(char *)((long)(local_13c + -0x3c8b) + 0x100000) != '\0') {
                  local_14e = *(long **)((long)(local_13c * 0xa6 + -0x3fd0) + 0x100000);
                  *(int *)(*local_14e + 0x22b8) =
                       (local_3f8 + *(int *)(*local_14e + 0x22b8)) - DAT_000fc382;
                  *(int *)(*local_14e + 0x22ba) =
                       (local_3f8 + *(int *)(*local_14e + 0x22ba)) - DAT_000fc382;
                }
                local_13c = local_13c + 1;
              } while (local_13c < 6);
            }
            if ((byte)((-(local_150 % 0x18 == 0) | DAT_000ff91d - 1U) & -(local_150 % 4 == 0)) != 0)
            {
              puVar23 = puVar22 + -0xc;
              *(undefined1 **)(puVar22 + -0xc) = &stack0xfffffffc;
              *(undefined4 *)(puVar22 + -0x10) = 0x34c42;
              CODE3_2940();
            }
            if (32000 < local_150) {
              local_150 = 1;
            }
            DAT_000ff904 = DAT_000ff904 + 1;
            if (300 < DAT_000ff904) {
              cVar8 = '\x01';
            }
            if (DAT_000fc382 < 2) {
              if (local_3fe == 0x32) {
                local_136 = 1;
                do {
                  if (*(char *)((long)(local_136 + -0x3c8b) + 0x100000) != '\0') {
                    local_14e = *(long **)((long)(local_136 * 0xa6 + -0x3fd0) + 0x100000);
                    *(long *)(*local_14e + 0x22bc) = *(long *)(*local_14e + 0x22bc) + 1;
                  }
                  local_136 = local_136 + 1;
                } while (local_136 < 6);
              }
              local_3fe = local_3fe + -1;
              if (local_3fe < 1) {
                cVar8 = '\x01';
              }
            }
          }
        } while (cVar8 == '\0' && DAT_000ffefa == '\0');
        local_3fc = local_3fc + 1;
        local_136 = 1;
        do {
          if (*(char *)((long)(local_136 + -0x3c85) + 0x100000) != '\0') {
            local_14e = *(long **)((long)(local_136 * 0xa6 + -0x3fd0) + 0x100000);
            *(long *)(*local_14e + 0x22c4) =
                 *(long *)(*local_14e + 0x22c4) + (long)*(int *)(*local_14e + 0x207a);
          }
          local_136 = local_136 + 1;
          puVar14 = puVar23;
        } while (local_136 < 6);
      }
      if (param_1._2_2_ < local_3fc) {
        local_3fc = param_1._2_2_;
      }
      local_136 = 1;
      do {
        if (*(char *)((long)(local_136 + -0x3c85) + 0x100000) != '\0') {
          local_14e = *(long **)((long)(local_136 * 0xa6 + -0x3fd0) + 0x100000);
          *(undefined4 *)(puVar14 + -4) = *(undefined4 *)(*local_14e + 0x22c4);
          puVar24 = (undefined4 *)(puVar14 + -8);
          *(long *)(puVar14 + -8) = (long)local_3fc;
          *(undefined4 *)(puVar14 + -0xc) = 0x34d96;
          JT_CODE1_02ec();
          puVar14 = puVar14 + -4;
          *(undefined4 *)(*local_14e + 0x22c4) = *puVar24;
        }
        local_136 = local_136 + 1;
      } while (local_136 < 6);
      puVar13 = puVar14;
      if (DAT_000fbdb5 != '\x01') {
        *(undefined1 **)(puVar14 + -4) = &stack0xfffffffc;
        *(undefined4 *)(puVar14 + -8) = 0x34dba;
        CODE3_3506();
        puVar13 = puVar14 + -8;
        *(undefined1 **)(puVar14 + -8) = &stack0xfffffffc;
        *(undefined4 *)(puVar14 + -0xc) = 0x34dc0;
        CODE3_3c58();
      }
      *(long *)(puVar13 + -4) = local_140;
      __mac_toolbox(0xa92d);
      *(undefined1 **)(puVar13 + -8) = local_464;
      __mac_toolbox(0xa87d);
      *(undefined4 **)(puVar13 + -0xc) = local_4d4;
      __mac_toolbox(0xa02a);
      *(undefined4 **)(puVar13 + -0xc) = local_4d4;
      __mac_toolbox(0xa023);
      *(undefined4 *)(puVar13 + -0xc) = 0x34de0;
      JT_CODE1_07d4();
      *(long **)(puVar13 + -0xc) = local_426;
      __mac_toolbox(0xa9a3);
      *(long **)(puVar13 + -0x10) = unaff_D3;
      __mac_toolbox(0xa9a3);
      *(long **)(puVar13 + -0x14) = unaff_D4;
      __mac_toolbox(0xa9a3);
      puVar19 = puVar13 + -0x18;
      *(long **)(puVar13 + -0x18) = local_460;
      __mac_toolbox(0xa9a3);
    }
    *(undefined2 *)(puVar19 + -2) = 0x3e;
    *(undefined2 *)(puVar19 + -4) = 0;
    __mac_toolbox(0xa032);
    *(long *)(puVar19 + -4) = DAT_000fbe26;
    __mac_toolbox(0xa92d);
    puVar26 = puVar19 + -8;
    *(undefined4 *)(puVar19 + -8) = local_128;
    __mac_toolbox(0xa873);
    if (local_1f6 != 0) {
      puVar26 = puVar19 + -0xc;
      *(long *)(puVar19 + -0xc) = local_1f6;
      __mac_toolbox(0xa915);
    }
    local_138 = 5;
    do {
      if (*(long *)(&stack0xfffffffc + (local_138 * 4 + -0x1f2)) != 0) {
        *(undefined4 *)(puVar26 + -4) = *(undefined4 *)(&stack0xfffffffc + (local_138 * 4 + -0x1f2))
        ;
        __mac_toolbox(0xa920);
        puVar25 = (undefined4 *)(puVar26 + -8);
        puVar26 = puVar26 + -8;
        *puVar25 = *(undefined4 *)(&stack0xfffffffc + (local_138 * 4 + -0x1f2));
        __mac_toolbox(0xa915);
      }
      local_138 = local_138 + -1;
    } while (0 < local_138);
    __mac_toolbox(0xa924);
    if (*(long *)(puVar26 + -4) != 0) {
      puVar26 = puVar26 + -4;
      __mac_toolbox(0xa924);
      __mac_toolbox(0xa91f);
    }
    local_136 = 0x80;
    puVar14 = puVar26;
    do {
      puVar27 = puVar14;
      *(undefined4 *)(puVar27 + -4) = *(undefined4 *)((long)(local_136 * 4 + -0x440a) + 0x100000);
      *(undefined2 *)(puVar27 + -6) = 0;
      __mac_toolbox(0xa939);
      local_136 = local_136 + 1;
      puVar14 = puVar27 + -6;
    } while (local_136 < 0x88);
    *(undefined4 *)(puVar27 + -10) = DAT_000fbdfa;
    *(undefined2 *)(puVar27 + -0xc) = 1;
    puVar27[-0xe] = DAT_000fbdf0 < 5;
    *(undefined4 *)(puVar27 + -0x12) = 0x34ea2;
    JT_CODE4_014c();
    *(undefined4 *)(puVar27 + -0x12) = DAT_000fbdfa;
    *(undefined2 *)(puVar27 + -0x14) = 2;
    puVar27[-0x16] = DAT_000fbdf0 < 5;
    *(undefined4 *)(puVar27 + -0x1a) = 0x34eba;
    JT_CODE4_014c();
    *(undefined4 *)(puVar27 + -0x1a) = DAT_000fbdfa;
    *(undefined2 *)(puVar27 + -0x1c) = 9;
    __mac_toolbox(0xa939);
    *(undefined4 *)(puVar27 + -0x20) = DAT_000fbdfa;
    *(undefined2 *)(puVar27 + -0x22) = 10;
    __mac_toolbox(0xa939);
    *(undefined4 *)(puVar27 + -0x26) = DAT_000fbe0e;
    *(undefined2 *)(puVar27 + -0x28) = 1;
    __mac_toolbox(0xa939);
    *(undefined4 *)(puVar27 + -0x2c) = DAT_000fbe0e;
    *(undefined2 *)(puVar27 + -0x2e) = 2;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar27 + -0x32) = DAT_000fbe0e;
    *(undefined2 *)(puVar27 + -0x34) = 4;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar27 + -0x38) = DAT_000fbe0e;
    *(undefined2 *)(puVar27 + -0x3a) = 5;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar27 + -0x3e) = DAT_000fbe0e;
    *(undefined2 *)(puVar27 + -0x40) = 2;
    *(undefined **)(puVar27 + -0x44) = &DAT_00034f82;
    __mac_toolbox(0xa947);
    *(undefined4 *)(puVar27 + -0x48) = DAT_000fbe0e;
    *(undefined2 *)(puVar27 + -0x4a) = 8;
    *(undefined **)(puVar27 + -0x4e) = &DAT_00034f70;
    __mac_toolbox(0xa947);
    *(undefined4 *)(puVar27 + -0x52) = DAT_000fbe0e;
    *(undefined2 *)(puVar27 + -0x54) = 8;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar27 + -0x58) = DAT_000fbe0e;
    *(undefined2 *)(puVar27 + -0x5a) = 9;
    *(undefined **)(puVar27 + -0x5e) = &DAT_00034f54;
    __mac_toolbox(0xa947);
    *(undefined4 *)(puVar27 + -0x62) = DAT_000fbe0e;
    *(undefined2 *)(puVar27 + -100) = 9;
    __mac_toolbox(0xa93a);
    *(undefined4 *)(puVar27 + -0x68) = DAT_000fbe0e;
    *(undefined2 *)(puVar27 + -0x6a) = 10;
    __mac_toolbox(0xa93a);
    __mac_toolbox(0xa937);
    *(undefined2 *)(puVar27 + -0x6c) = 0x3e;
    *(undefined2 *)(puVar27 + -0x6e) = 0;
    uVar6 = *(ulong *)(puVar27 + -0x6e);
    __mac_toolbox(0xa032);
  }
  return uVar6;
}


