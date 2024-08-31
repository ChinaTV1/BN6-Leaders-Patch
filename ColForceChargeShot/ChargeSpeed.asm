ChargeSpeedCol:
ldrb r0,[r4,r7]
cmp r0,0x94
bne @@NotColChargeShot
mov r0,0x46
mov r15,r14
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
ldr r2,=0x8020404
ldrh r0,[r2,r1]
mov r15,r14
.pool