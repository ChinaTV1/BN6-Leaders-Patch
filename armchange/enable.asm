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
bl @@ArmChipExceptions
b @@BRANCH1
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
mov r2,0x1
tst r1,r2
bne @@BRANCH1
@@AddArmChip:
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

@@ArmChipExceptions:

mov r2,0
@@LoopBegin:
ldr r1,=ChipExceptions
ldrh r3,[r1,r2]
ldr r1,=0xFFFF
cmp r3,r1
beq @@Escape
cmp r3,r0
beq @@ThisIsanException
add r2,4
b @@LoopBegin
@@Escape:
mov r15,r14
@@ThisIsanException:
bl @@AddArmChip

.pool
ChipExceptions:
;.dh 0x43,0x46,0x9A,0x9B,0x9C,0x9D,0xFFFF
.dh 0x1,20 ; cannon
.dh 0x2, 40 ; highcannon
.dh 0x3, 60 ; m-cannon
.dh 0x5, 20; vulcan-1
.dh 0x6, 40 ;vulcan-2
.dh 0x7, 50 ; vulcan-3
.dh 0x9, 20; spreader1
.dh 0xA, 40 ;spreader2
.dh 0xB, 60; spreader3
.dh 0xC, 60; TankCannon1
.dh 0xD, 70; TankCannon2
.dh 0xE, 80;TankCannon3
.dh 0xF, 90; GunSol1
.dh 0x10, 120; GunSol2
.dh 0x36, 20; minibomb
.dh 0x13, 50; yoyo
.dh 0x37, 30; energybomb 
.dh 0x38, 40; megaenergybomb
.dh 0xCA, 70; bigbomb
.dh 0x46, 60; poisonseed
.dh 0x3A, 150; flashbomb2
.dh 0x43, 40;bugbomb
.dh 0x39, 100; flashbomb1
.dh 0x56, 90;mechsword
.dh 0x57, 90;elemsword
.dh 0x58, 90;AssnSword
.dh 0x5B, 50;tripleshot
.dh 0x5A, 40;doubleshot
.dh 0x59, 20;crackshot
.dh 0x84, 70;rflectr2
.dh 0x83, 60;reflectr1
.dh 0x85, 80;reflectr3
.dh 0x5C, 70;wavearm1
.dh 0x5D, 80;wavearm2
.dh 0x5E, 90;wavearm3
.dh 0x65, 60;sandworm1
.dh 0x66, 70;sandworm2
.dh 0x67, 80;sandwrm3
.dh 0xC6, 20;colarmy
.dh 0x4C, 40;firesword
.dh 0x14, 60;fireburn1
.dh 0x15, 90;fireburn2
.dh 0x6C, 80;firehit2
.dh 0x6D, 90;firehit3
.dh 0x6B, 70;firehit1
.dh 0x16, 120;fireburn3
.dh 0x3C, 90;blkbomb
.dh 0x1E, 90;thunder
.dh 0x45, 60;iceseed
.dh 0x18, 50;trnarrw1
.dh 0x4D, 50;aquaswod
.dh 0x1F, 60;dollthunder1
.dh 0x1B, 150;bubblestar1
.dh 0x3D, 60;aquaneedle1
.dh 0x17, 70; wideshot
.dh 0x20, 80;dollthunder2
.dh 0x41, 60; cornsht2
.dh 0x22, 90; elecpuls1
.dh 0x40, 40; cornsht1
.dh 0x4E, 90;elecsword
.dh 0x27, 120;riskyhny3
.dh 0x25, 80;riskyhny1
.dh 0x26, 90;riskyhny2
.dh 0x44, 60;grassseed
.dh 0x47, 20;sword
.dh 0x48, 40;widesword
.dh 0x28, 40;rlnglog1
.dh 0x29, 50;rlnglog2
.dh 0x74, 40;boomer
.dh 0x75, 60;hiboomer
.dh 0x54, 40;moonblade
.dh 0x49, 40;longblade
.dh 0x7F, 70;airspin2
.dh 0x4,20; airshot
.dh 0x52,90;varsword
.dh 0x51,60;stepsword
.dh 0x7E,60; AirSpin1
.dh 0x4F,40; bamsword
.dh 0x7B,40; ironshl1
.dh 0x34,40; tornado
.dh 0x2B,60; machgun1
.dh 0x35,80; static
.dh 0x50,50;windrack
.dh 0x2C,80;machgun2
.dh 0x7C,50;ironshl2
.dh 0x7D,60;ironshl3
.dh 0x78,60;golemhit1
.dh 0x32,60;airhocky
.dh 0x5F,50;aurahead1
.dh 0x79,80;golmhit2
.dh 0x60,60;aurahead2
.dh 0x33,60;drillarm
.dh 0xFFFF,0xFFFF;end