setReg equ 0x0802899C
GetCustomChipWorkAdrs equ 0x08027E1C 
ArmChangeIndex2 equ 0xD
Detour1:
push r14
bl setReg
bl setarmchip
pop r15


BattlePRIMADD equ 0x8009FF8
setarmchip:
push r14
mov r0,0x8
bl GetCustomChipWorkAdrs
ldrb r1,[r0]
cmp r1, ArmChangeIndex2
bne @@FINISH
ldrb r1,[r0,0x7]
cmp r1, 0x2
bne @@FINISH
ldr r0,=0x40450084
ldr r1,=0xA776
mov r2,0x1
mov r3,0
bl BattlePRIMADD
@@FINISH:
pop r15