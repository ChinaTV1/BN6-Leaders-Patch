;0x40 up 0x80 down
Scroll:
push r4-r7,r14
mov r7,0x1B
ldrb r6,[r5,0x18] ;r6 will be the number of slots
sub r6,1
ldr r3,=0x50
cmp r4,r6
beq Up
add r3,r3,1
b TimeToBegin
Up:
add r3,r6,r3


TimeToBegin:
ldrb r4,[r5,r3]
add r6,r6,2
mov r7,0

BeginLoopForScroll:
ldr r3,=0x20349A0
ldr r3,[r3]
mov r0,0x1
lsl r0,r4
and r3,r0
bne LOOP
mov r0,0
mov r1,0x17
bl 0x80137B6
mov r1,1
add r1,r1,r4
cmp r0,r1
beq LOOP
ldr r2,=0x50
add r2,r2,r7
strb r4,[r5,r2]
add r7,1

LOOP:
add r4,1
cmp r4,6
bne NotMod
mov r4,0 
NotMod:

cmp r6,r7
bne BeginLoopForScroll
ldrb r0,[r5,0x18]

pop r4-r7,r15
.pool




