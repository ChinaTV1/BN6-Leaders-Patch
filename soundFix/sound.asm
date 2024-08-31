soundRequestForBeast:
cmp r0,0x12
blt @@AltRoute
cmp r0,KernelBeastOut
beq @@AltRoute

mov r15,r14


@@AltRoute:
bl 0x8015008