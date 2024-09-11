.vdef varswordinit,0x80F0988,0x80F0988
naviStatusGet equ 0x8013774
varDelay:
push r14
mov r1,0x2C
bl naviStatusGet
cmp r0,0x3
beq @@SlashRoute
cmp r0,0xF
beq @@SlashRoute
cmp r0,Kernel
beq @@SlashRoute
cmp r0,KernelBeastOut
bne @@StartVarSword

@@SlashRoute:
ldrh r0,[r7,0x12]
tst r0,r0
beq @@Init
sub r0,r0,1
strh r0,[r7,0x12]
tst r0,r0
bne @@Finish
@@StartVarSword:
bl varswordinit
b @@Finish

@@Init:
mov r0,5
strh r0,[r7,0x12]
@@Finish:
pop r15