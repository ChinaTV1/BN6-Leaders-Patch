naviinfoget equ 0x8013774
.vdef swordAnimation2,0x80ECEA4,0x80EBB64
RedirectSwordAnimation:
push r14
mov r1,0x2C
bl naviinfoget
cmp r0,Kernel
beq @@LoadKernelAnim
ldrb r0,[r7,0x3]
ldr r7,=swordAnimation2 
ldrb r7,[r7,r0]
b @@Escape
@@LoadKernelAnim:
mov r7,3
@@Escape:
pop r15
.pool