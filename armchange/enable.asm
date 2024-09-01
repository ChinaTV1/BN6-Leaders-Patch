custom_sub_custom_check_select_enable_chip_sub_03 equ 0x8028F84 
.vdef custom_sub_custom_check_chip_id_2, 0x802A54A,0x802A54E 

DetourForArmChange:
push r14
bl ArmChangeSet
bl custom_sub_custom_check_select_enable_chip_sub_03
pop r15

ArmChangeIndex equ 13
;GetCustomChipWorkAdrs equ 0x8027E1C
;custom_sub_custom_check_chip_id2 equ 0x802A54A
ChipTableAdrsGet equ 0x8021AA4 

custom_sub_custom_set_reg equ 0x802899C

ArmChangeSet:
push r4,r6,r7,r14
mov r0,8
bl GetCustomChipWorkAdrs
mov r4,r0
ldrb r0,[r4]
cmp r0,ArmChangeIndex
bne @@FINISH
ldrb r0,[r4,0x7]
cmp r0,0x2
beq @@FINISH
ldrb r0,[r5,0x8] ;counter for num of chips
cmp r0,0
beq @@BRANCH1
add r0,0x47 ;0x47 is the index of chips
ldrb r0,[r5,r0]
mov r7,r0
bl GetCustomChipWorkAdrs
ldrb r1,[r0]
cmp r1,0
bne @@BRANCH1
ldr r0,[r0,0x8]
ldrh r0,[r0]
bl custom_sub_custom_check_chip_id_2
lsl r0,r0,0x17
lsr r0,r0,0x17
mov r6,r0
bl ChipTableAdrsGet
ldrb r1,[r0,0x7]
cmp r1,0 
bne @@BRANCH1
ldrb r1,[r0,0x6]
cmp r1,0xA
bne @@BRANCH1
ldrb r1,[r0,0x9]
mov r2,0x2
tst r1,r2
beq @@BRANCH1
mov r2,0x20
tst r1,r2
bne @@BRANCH1
str r6,[r4,0x8]
strb r7,[r4,0x4]
ldrb r0,[r5,0x8]
sub r0,0x1
strb r0,[r4,0x5]
mov r0,0
strb r0,[r4,0x7]
b @@FINISH

@@BRANCH1:
mov r0,0x1
strb r0,[r4,0x7]


@@FINISH:
pop r4,r6,r7,r15