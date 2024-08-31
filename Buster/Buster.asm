

BusterAlt:
cmp r0,Kernel
beq @@KernelTime
cmp r0,KernelBeastOut
beq @@KernelBeastTime

@@KernelTime:
mov r0,29
mov r15,r14

@@KernelBeastTime:
mov r0,30
mov r15,r14

@@Finish:
mov r15,r14