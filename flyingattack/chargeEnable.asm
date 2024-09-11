BattleNaviLvGet equ 0x800F49E
ChargeCheck:
cmp r6,Kernel
beq @@KernelChargeEnable
cmp r6,KernelBeastOut
bne @@Escape
@@KernelChargeEnable:
ldr r2,[sp]
cmp r2,0x4C
blt @@CheckType
cmp r2,0x4F
ble @@EnableCharge
@@CheckType:
cmp r4,0x5
bne @@Escape
@@EnableCharge:
mov r0,0x2
tst r0,r1
beq @@Escape
mov r0,0x1
tst r0,r1
bne @@Escape
bl 0x8013366

@@Escape:
push r14
bl BattleNaviLvGet 
pop r15