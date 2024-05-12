BranchThis:
push r14
mov r2,r6
cmp r2,0x5
beq Done
mul r1,r2
ldr r2,=0x600A720
add r1,r1,r2
pop r15
Done:
ldr r1,=0x600D000
pop r15
.pool

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
