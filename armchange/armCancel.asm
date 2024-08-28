CustomChipWorkAdrs equ 0x8027E1C 
drawPaintchip	equ 0x80281D4 
select_enable_chip equ	0x8028E32
custom_paint_datawindow equ 0x8028476
lamp equ 0x8029CD4
sounds equ 0x80005CC
CancelChip equ 0x8029032

cancelRoutine:
push r14
mov r0,0x8
bl CustomChipWorkAdrs

ldrb r1,[r0]
cmp r1,ArmChangeIndex
beq @@CancelArmCheck
bl CancelChip
pop r15


@@CancelArmCheck:
bl CancelArm
pop r15

CancelArm:
push r4,r14
mov r0,0x8
bl CustomChipWorkAdrs
mov r4,r0
ldrb r1,[r4]
cmp r1,ArmChangeIndex
bne @@FINISH
ldrb r1,[r4,0x7]
cmp r1,0x2
bne @@FINISH
ldrb r0,[r5,0x8]
ldrb r1,[r4,0x5]
cmp r0,r1
bne @@FINISH
mov r1,0x48
add r1,r1,r0
ldrb r2,[r4,4]
strb r2,[r5,r1]
add r1,r0,1
strb r1,[r5,8]
mov r1,r0
ldr r0,[r4,0x8]
bl drawPaintchip
ldrb r0,[r5,0x8]
sub r0,1
mov r1,1
mov r2,0
bl lamp
mov r0,0
strb r0,[r4,7]
bl select_enable_chip
bl custom_paint_datawindow
mov r0,0x83
bl sounds
pop r4,r15
@@FINISH:
bl CancelChip
pop r4, r15 