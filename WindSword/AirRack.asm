AirRackChange:
push r14
cmp r0,0xF
beq @@ChangeSaber
b @@NormalRoute
@@ChangeSaber:
mov r0,0
@@NormalRoute:
lsl r0,r0,0x8
mov r4,0x2A


pop r15