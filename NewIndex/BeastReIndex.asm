BEASTOUTBLEFT:
cmp r0,KernelBeastOut
beq @@BLEFT
cmp r0,0x14
beq @@BLEFT
mov r15,r14
@@BLEFT:
bl 0x801319C

UpdateTurnCount:
cmp r0, Kernel
beq @@REGULARCROSS
cmp r0,0xB
blt @@REGULARCROSS
mov r15,r14
@@REGULARCROSS:
bl 0x8015A66

.vdef beastAdd,0xD,0x12
.vdef constToSub,0x1,0x6
BeastNewIndex:
mov r4,beastADD
cmp r1,Kernel
beq @@KernelBeastOut
sub r1,constToSub
mov r15,r14
@@KernelBeastOut:
mov r4,0x1
mov r15,r14

BeastoutTime:
cmp r0,Kernel
beq @@BeastoutTime
cmp r0,0xA
bgt @@NoBeastoutTime
@@BeastoutTime:
mov r15,r14
@@NoBeastoutTime:
bl 0x8014A8E

BeastCheckForRelease:
cmp r0,Kernel
beq @@RegularCross
cmp r0,0xB
blt @@RegularCross
mov r15,r14
@@RegularCross:
bl 0x8015A12

BeastChargeTime:
cmp r0,Kernel
beq @@RegularCross
cmp r0,0xB
blt @@RegularCross
mov r15,r14
@@RegularCross:
bl 0x8012F90

BeastCommonMatchless:
cmp r0,Kernel
beq @@NonSuperBeast
cmp r0,KernelBeastOut
beq @@NonSuperBeast
cmp r0,0x17
blt @@NonSuperBeast
mov r15,r14
@@NonSuperBeast:
bl 0x8016870

NewFatigueSet:
cmp r0,Kernel
beq @@RegularCross
cmp r0,0xB
blt @@RegularCross
mov r15,r14
@@RegularCross:
bl 0x80158F8

NewExtremeFatigueSet:
cmp r0,KernelBeastOut
beq @@RegularBeastOut
cmp r0,0x16
ble @@RegularBeastOut
bl 0x80158F4
@@RegularBeastOut:
mov r15,r14

NewBeastCrossSet:
cmp r0,KernelBeastOut
beq @@NewKernelBeastOut
sub r0,0xC
mov r4,r0
mov r15,r14
@@NewKernelBeastOut:
mov r4,Kernel
mov r15,r14

BeastChargeShot:
cmp r6,KernelBeastOut
bne @@OtherBeasts
mov r15,r14
@@OtherBeasts:
cmp r6,0x16
bgt @@SuperBeast
mov r15,r14
@@SuperBeast:
bl 0x801329E

BeastLockOn:
cmp r0,KernelBeastOut
beq @@RealBeast
cmp r0, 0x18
ble @@RealBeast
bl 0x800FC18
@@RealBeast:
mov r15,r14

.vdef BeastLockIconEscape,0x80E28DA,0x80E159A
BeastLockIcon:
cmp r0,KernelBeastOut
beq @@RealBeast
cmp r0, 0x18
ble @@RealBeast
bl BeastLockIconEscape
@@RealBeast:
mov r15,r14

AdjustmentForCrosses:
cmp r0,Kernel
bge @@KernelCross
add r1,0xAD
add r1,0xFF
mov r15,r14
@@KernelCross:
sub r0,Kernel
ldr r1,=0x1C4
add r1,r1,r0
mov r15,r14
.pool

CompareForMegaman:
ldr r1,=0x1A0
cmp r0,0x0
beq @@MegamanBranch
mov r15,r14
@@MegamanBranch:
bl 0x8015B2E
.pool

BeastBoostNormalAttack:
cmp r0, KernelBeastOut
beq @@NormalBeastOut
cmp r0, 0x16
ble @@NormalBeastOut
bl 0x800F090
@@NormalBeastOut:
mov r15,r14

