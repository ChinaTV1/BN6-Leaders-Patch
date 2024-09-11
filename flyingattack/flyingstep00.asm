shiftenable equ 0x800E5FC
BattleHitStatusFlagOn equ 0x801A152
reverseSet equ 0x801BB1C
bluesoulswordFumi equ 0x8015B00
enemyflipcheck equ 0x800E456
GetCommonSeqNo equ 0x800F2AA
SetEFC28 equ 0x80E473A 
blockToPos equ 0x800E29C
BattleHitBlockPosSet equ 0x801A04C
SetCommonSeqNo equ 0x800F2B6

FlyingInit:
push r4,r6,r14
mov r0,0x4
strh r0,[r7]
bl shiftenablecheck2
tst r0,r0
beq @@FINISH
mov r0,0x40
bl BattleHitStatusFlagOn
ldrb r0,[r5,0x12]
strb r0,[r5,0x14]
ldrb r1,[r5,0x13]
strb r1,[r5,0x15]
bl reverseSet
bl bluesoulswordFumi
tst r0,r0 
beq @@ALT
push r0,r1,r4,r7
bl enemyflipcheck
mov r4,r0
lsl r4,r4,0x8
mov r0,0
bl GetCommonSeqNo
add r4,r4,r0
lsl r4,r4,0x10
add r4,0xFF
mov r0,34
add r0,r0,r5
ldmia [r0]!,r1-r3
ldr r6,=0x0FFE0
ldr r7,=0x1010014
bl SetEFC28
pop r0,r1,r4,r7
strb r0,[r5,0x12]
strb r1,[r5,0x13]
bl blockToPos 
bl BattleHitBlockPosSet
b @@FINISH
@@Alt:
mov r0,0x4
bl SetCommonSeqNo
mov r0,0xC
strh r0,[r7]
@@FINISH:
pop r4,r6,r15
.pool