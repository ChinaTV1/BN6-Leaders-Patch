.vdef sub2_setCommonSeqNo,0x800F2B6,0x800F2B6
.vdef NaviAccesoryReset,0x8011450,0x8011450
.vdef NaviCounterTimerSet,0x800FDb6,0x800FDb6
.vdef navi_sword_col_check,0x80ECEb8,0x80ECEb8
.vdef naviatk_navi_sword_arm_seq_check,0x80ECE28,0x80ECE28
.vdef navi_sword_arm_type_check,0x80ECE74,0x80ECE74
.vdef SetEm05, 0x80Ba6A0,0x80Ba6A0
battlehitflagon equ 0x801A152
soundplay equ 0x80005CC
dirsped equ 0x800E2CA
flyingstep03:
push r4,r6,r7,r14
ldrb r0,[r7,0x1]
tst r0,r0
bne @@NotInit
mov r0,0x5
ldrb r1,[r7,0x3]
cmp r1,0x10
beq @@DifferentChip
cmp r1,0x11
bne @@BunchofFunctions
@@DifferentChip:
mov r0,0xC
bl sub2_setCommonSeqNo
bl NaviAccesoryReset
bl NaviCounterTimerSet
mov r0,0xB0
r1,[r7,0x3]
cmp r1,0x5
beq @@soundThis
cmp r1,0xB
beq @@soundThis
cmp r1,0x12
beq @@soundThis
cmp r1, 0x6
bne @@playSound
@@soundThis:
mov r0,0xCE
@@playSound:
bl soundplay
r0,[r7,0x3]
cmp r0,0x10
beq @@Alt2
cmp r1,0x11
beq @@Alt2
cmp r0,0x12
bne @@Alt1
mov r0,0xB
@@Alt1
push r7
bl navi_sword_col_check
mov r4,r0
lsl r4,r4,0x10
bl naviatk_navi_sword_arm_seq_check
add r4,r4,r0
lsl r4,r4,0x8
bl navi_sword_arm_type_check
add r4,r4,r0
mov r7,0x4C
add r7,r7,r5
bl SetEm05
pop r7
@@Alt2:
mov r0,0x1
lsl r0,r0,0x16
bl battlehitflagon
mov r0,0x15
strh r0,[r7,0x10]
mov r0,0x4
strb r0,[r7,1]
@@NotInit:
ldrh r0,[r7,0x10]
mov r1,0xC
ldrb r0,[r7,0x3]
cmp r1,0x10
beq @@NotPossible
cmp r1,0x11
bne @@Possible
@@NotPossible:
mov r1,0x11
@@Possible:
ldrh r0,[r7,0x10]
cmp r0,r1
bne @@Timer
ldrb r4,[r7,0x3]
bl dirsped

ldrb r1,[r5,0x12]
add r0,r0,r1
ldrb r1,[r5,0x13]
ldrb r2,[r7,0x2]
ldr r6,[r7,0x8]
ldrh r3,[r7,0x8]
add r6,r6,r3
ldrh r3,[r7,0x6]
add r6,r6,r3
mov r3,0
push r0-r2
bl 


@@Timer:
ldrh r0,[r7,0x10]
sub r0,1
strh r0,[r7,0x10]
bge 


