naviatkChipSet equ 0x80127C0
FlySet:
push r4,r14
mov r0,0
bl naviatkChipSet
mov r0,1
strb r0,[r7,0xC]
ldrh r0,[r7,0x8]
add r0,r0,r0
strh r0,[r7,0x8]
mov r0,0x13
pop r4,r14
