@Buster equ 0x08012642|1

ColonelCrossChargeAttackSet:
push r14
mov r0,0x28
mov r1,0xA
BXwithR11 @Buster 
strh r0,[r7,0x8]
mov r0,0x94
strh r0,[r7,0xA]
mov r0,0x0
strb r0,[r7,0x3]
bl Target
strb r0,[r7,0x16]
strb r1,[r7,0x17]
mov r0,0x5F

pop r15
.pool




@CalcEmDirSpd equ 0x0800E2CA|1
@Block equ 0x0800CC72|1
@BlockStatus equ 0x0800C8F8|1

Target: 
push r14
add sp,-0x10
BXwithR11 @CalcEmDirSpd
str r0,[sp,0x8]
ldrb r1,[r5,0x12]
add r0,r0,r1
str r0,[sp]
ldrb r0,[r5,0x13]
str r0,[sp,0x4]
ldrb r0,[r5,0x16]
ldr r1,=Constants
ldr r0,[r1,r0]
str r0,[sp,0xC]
BeginningOfLoop:
ldr r0,[sp]
ldr r1,[sp,0x4]
BXwithR11 @Block
beq EndLoop
ldr r0,[sp]
ldr r1,[sp,0x4]
BXwithR11 @BlockStatus
ldr r1,[sp,0xC]
tst r0,r1
bne AnotherEnd
ldr r0,[sp]
ldr r1,[sp,0x8]
add r0,r0,r1
str r0,[sp]
b BeginningOfLoop
EndLoop:
ldr r0,[sp,0x8]
mov r1,0x3
mul r1,r0
ldrb r0,[r5,0x12]
add r0,r0,r1
str r0,[sp]
ldr r1,[sp,0x4]
BXwithR11 @Block
bne AnotherEnd

mov r0,0
str r0,[sp]
AnotherEnd:

ldr r0,[sp]
ldr r1,[sp,0x4]
add sp,0x10


pop r15

.pool

.pool
Constants:
.dw 0x04000000
.dw 0x08000000



