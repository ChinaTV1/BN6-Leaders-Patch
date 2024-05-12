BackgroundCrossWindow:
push r14
ldrb r0,[r5,0x18]
cmp r0,0x6
bne OrginalCrossBackground
sub r0,1
OrginalCrossBackground:
sub r0,1
pop r15
.pool
BitTestWindow:
push r14
mov r0,0x1
lsl r0,r4
ldr r1,=0x56
ldrb r1,[r5,r1]
tst r0,r1 
pop r15
.pool

BitSetWindow:
push r14
mov r0,0x1
lsl r0,r4
ldr r1,=0x56
ldrb r1,[r5,r1]
ORR r0,r1
ldr r1,=0x56
strb r0,[r5,r1]
pop r15
.pool
