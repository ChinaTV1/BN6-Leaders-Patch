.definelabel NaviStatusGet3,0x08013774

.org 0x82F9244+0x60

push r4,r5,r7,r14
mov r5,r0
ldr r7,[r5,0x58]
mov r4,r1
mov r1,0x2C
bl NaviStatusGet3
cmp r0,0x1
bne armChangeEscape
strh r4,[r7,0x32]
mov r2,0x14
ldr r1,=0xFFFF
cmp r4,r1
beq ChangeChargeAttack
mov r2,0x13
ChangeChargeAttack:
strb r2,[r7,0x7] 
armChangeEscape:
pop r4,45,r7,r15
.pool
