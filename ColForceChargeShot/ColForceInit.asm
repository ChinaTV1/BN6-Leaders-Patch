@ChipTableAddr equ 0x8021AA4|1
@ChipStr equ 0x80109A4|1
@SpawnColn equ 0x80EA81C|1
@Finish equ 0x8011714|1
ColForceInit:
push r4,r6,r8,r14

ldr r2,=@SpawnColn
mov r8,r2


ldr r6,=@ChipTableAddr
ldr r0,=0x130
mov r14,r15
bx r6
mov r6,r0
ldr r0,=0x130
ldr r3,=@ChipStr
mov r1,0x0
mov r14,r15
bx r3

ldr r4,[r6,0x10]

ldrb r1,[r6,0xA]
lsl r1,r1,0x10
add r0,r0,r1

push r0
ldr r0,=0x80129E4
ldrb r1,[r6,0x4]
ldrb r2,[r6,0x6]
ldrb r0,[r0,r2]
orr r0,r1
mov r2,r0
pop r6
ldrb r0,[r5,0x12]
ldrb r1,[r5,0x13]
ldr r3,[r5,0x3C]


push r7
mov r7,r8
mov r14,r15
bx r7
pop r7

ldr r0,=@Finish
mov r14,r15
bx r0



pop r4,r6,r8,r15
.pool
