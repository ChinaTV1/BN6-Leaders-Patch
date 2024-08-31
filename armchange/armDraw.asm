MemSet equ 0x8000AC8



SetArmDraw:
push r14
ldr r0,=FirstArm
ldr r2,=0x180
ldrb r3,[r4,0x7]
cmp r3,1
bne @@setMem
add r0,r0,r2
@@setMem:
bl MemSet
add r1,0xC0
add r1,0xC0
pop r15

.pool
