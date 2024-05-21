ChargeSpeedCol:
ldrb r0,[r4,r7]
cmp r0,0x94
bne NotColChargeShot
mov r0,0x46
mov r15,r14
NotColChargeShot:
ldr r2,=0x8020404
ldrh r0,[r2,r1]
mov r15,r14
.pool