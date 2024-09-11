NewWeakCheck:
cmp r0,Kernel
beq @@ChooseMegamanType
cmp r0,0xA
ble @@ChooseMegamanType
mov r1,0xB
cmp r0,KernelBeastOut
beq @@ChooseMegamanType
cmp r0, 0x11
ble @@ChooseMegamanType
mov r1,0xC

@@ChooseMegamanType:
bl 0x0801580A




 .vdef FinishGFXWeapons,0x80BA596,0x80B8D36
TESTFORCROSSANDBEASTFORGFXWEAPONS:
ldr r2,=0x1C4
cmp r0,r2
beq @@RegularCross
cmp r0,r1
bgt @@BeastOut
@@RegularCross:
mov r15,r14
@@BeastOut:
bl FinishGFXWeapons
.pool

.vdef AltExitForCrossWIndow,0x802A598,0x802A59C


TESTFORBEASTCrossWindow:
cmp r1,Kernel
beq @@RegularOption
cmp r1,0xB
bge @@NoBeastOption
@@RegularOption:
mov r15,r14
@@NoBeastOption:
bl AltExitForCrossWIndow


TESTFORBEASTAfterChoosingCross:
cmp r1,Kernel
beq @@RegularCrossBranch
cmp r1,0xB
blt @@RegularCrossBranch
mov r15,r14
@@RegularCrossBranch:
bl 0x8029388

.vdef constantToSub,1,6

ReIndex:
cmp r0,5
bne @@OtherCrosses
mov r0,Kernel-constantToSub
cmp r4,0xD
beq @@KernelBeastOutSet
cmp r4,0x12
beq @@KernelBeastOutSet
@@OtherCrosses:
add r0,r0,r4
mov r1,0x0
mov r15,r14
@@KernelBeastOutSet:
mov r0,KernelBeastOut
mov r1,0x0
mov r15,r14

NewCompForCross:
cmp r0,Kernel
beq OGBRANCH
cmp r0,KernelBeastOut
beq OGBRANCH
cmp r0,0x17
blt OGBRANCH
mov r15,r14
OGBRANCH:
bl 0x8014A58

TESTFORBEASTCROSS:
cmp r0,Kernel
beq CheckForRegular
cmp r0,0xD
blt CheckForRegular
mov r15,r14
CheckForRegular:
bl 0x8014A72

TESTFOREGULARCROSS:
cmp r0,Kernel
beq RegularCross
cmp r0,0xB
blt RegularCross
mov r15,r14
RegularCross:
bl 0x8014A82

PaletteForColonel:
cmp r0,Kernel
bne PaletteBasic
mov r0,0x1
PaletteBasic:
lsl r0,r0,0x2
ldr r0,[r1,r0]
mov r15,r14

.vdef altnewTestSuperBeastEscape, 0x80F1712,0x80F03D2

newTestSuperBeast:
cmp r0,Kernel
beq NonSuperBeast
cmp r0,KernelBeastOut
beq NonSuperBeast
cmp r0,0x17
blt NonSuperBeast
mov r15,r14
NonSuperBeast:
bl altnewTestSuperBeastEscape


superBeastKeyboard:
cmp r0,Kernel
beq @@NonSuperBeast2
cmp r0,KernelBeastOut
beq @@NonSuperBeast2
cmp r0,0x17
blt @@NonSuperBeast2
mov r15,r14
@@NonSuperBeast2:
bl 0x8012E1E