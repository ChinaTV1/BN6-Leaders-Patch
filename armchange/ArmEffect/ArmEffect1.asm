memTrans256 equ 0x8000AC8
AddressOfVRAM equ 0x6016EC0
custom_sub_custom_paint_selchip equ 0x080281D4 
custom_sub_custom_set_lamp equ 0x8029CD4
custom_check_select_enable_chip	equ 0x08028E32
custom_set_navi_mark equ 0x8029C08 



ARMEffectMain:
push r4,r14
mov r0,0x8
bl GetCustomChipWorkAdrs 
mov r4,r0
ldr r1,=ARMPOOL
ldrb r0,[r5,0x2]
ldr r1,[r1,r0]
mov r14,r15
bx r1
bl custom_set_navi_mark
bl custom_sub_custom_set_reg
pop r4,r15
.pool
ARMPOOL:
.dw ARMEffect1|1
.dw ARMEFFECT2|1

ArmEffect1:
push r14
ldrb r1,[r5,0x8]
sub r1,0x1
strb r1,[r5,0x8]
ldr r0,[r4,0x8]
bl ChipTableAdrsGet
ldr r0,[r0,0x20]
ldr r1,=AddressOfVRAM
mov r2,0x80
bl memTrans256
mov r0,0x1E
str r0,[r5,0x40]
mov r0,0x2
strb r0,[r4,0x7]
mov r0,0x4
strh r0,[r5,0x2]
pop r15
.pool

ARMEFFECT2:
push r14
ldr r0,[r5,0x40]
mov r1,0x1
cmp r0,0x14
bgt @@BRANCH1
mov r1,0x2
@@BRANCH1:
tst r0,r1
bne @@BRANCH2
cmp r1,0x2
bne @@BRANCH3
bl setarmchip
@@BRANCH3:
mov r0,0
sub r0,0x1
b @@BRANCH4
@@BRANCH2:
ldr r0,[r4,0x8]

@@BRANCH4:
ldrb r1,[r5,0x8]
bl custom_sub_custom_paint_selchip
ldrb r0,[r5,0x8]
mov r1,0
mov r2,0
bl custom_sub_custom_set_lamp 
ldr r0,[r5,0x40]
sub r0,1
str r0,[r5,0x40]
bne @@FINISH

mov r0,0x0
str r0,[r5,0x40]
mov r0,0x8
strh r0,[r5,0x2]
bl custom_check_select_enable_chip
mov r0,0x4
strb r0,[r5,0x1]
mov r0,0x0
strh r0,[r5,0x2]

@@FINISH:
pop r15