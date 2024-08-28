DetourGarbage:
push r14
bl chip_work_init_sub3
bl CheckKernelandSetArm
pop r15

CheckKernelandSetArm:
push r14
ldrb r0,[r5,0x10]
cmp r0,0
bne @@FINISH
cmp r7,Kernel
beq @@BRANCH2
cmp r7,KernelBeastOut
bne @@BRANCH3
@@BRANCH2:
mov r0,ArmChangeIndex
mov r1,0x60
add r1,r1,r4
strb r0,[r1]
mov r0,ArmChangeIndex+1
strb r0,[r1,0xC]
mov r0,0x1
ldr r2,[r5,0x30]
sub r0,r0,r2
strb r0,[r1,0x4]
mov r0,0x1
strb r0,[r1,0x7]
@@BRANCH3:
mov r0,0xB
strb r0,[r1,0x3]
mov r0,0x7
strb r0,[r1,0xE]

@@FINISH:
pop r15

