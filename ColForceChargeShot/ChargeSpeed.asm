ChargeSpeedCol:
ldrb r0,[r4,r7]
cmp r0,0x94
bne @@NotColChargeShot
;mov r0,0x46
mov r1,r3
ldr r2,=KernelSwordSpeed
b @@LoadChargeShotInfo
@@NotColChargeShot:
cmp r0,0x95
bne @@NotColForceChargeShot
mov r0,0x20
mov r15,r14
@@NotColForceChargeShot:
cmp r0,0x97
bne @@NotColForceChargeShot2
mov r0,0x78
mov r15,r14
@@NotColForceChargeShot2:
cmp r0,0x98
bne @@NotFlyingAttack
mov r0,0x1E
mov r15,r14
@@NotFlyingAttack:
ldr r2,=0x8020404
@@LoadChargeShotInfo:
ldrh r0,[r2,r1]
mov r15,r14
.pool
KernelSwordSpeed:
.dh 0x46,0x41,0x3C,0x37,0x32 