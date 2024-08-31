.definelabel NaviStatusGet3,0x8013774

CheckForArm:
push r14
ldr r0,[r6,8]
ldrh r1,[r6,6]
bl ArmChangeFunc
ldr r0,[r7,8]
ldrh r1,[r7,6]
bl ArmChangeFunc
mov r4,0
ldrb r0,[r6,0x4]
pop r15


ArmChangeFunc:
push r4,r5,r7,r14
mov r5,r0
ldr r7,[r5,0x58]
mov r4,r1
mov r1,0x2C
bl NaviStatusGet3
cmp r0,Kernel
beq @@ChangeArm
b @@armChangeEscape
@@ChangeArm:
strh r4,[r7,0x3A]
mov r2,0x94
ldr r1,=0xFFFF
cmp r4,r1
beq @@ChangeChargeAttack


mov r2,0x97
@@ChangeChargeAttack:
strb r2,[r7,0x7] 
@@armChangeEscape:
pop r4,r5,r7,r15
.pool
