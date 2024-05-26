.definelabel navistatus_NaviStatusGet3, 0x08013774
.definelabel naviatk_sub_setattack_workchip_id,0x80126E4

KernelSetSoldier:
push r14
mov r0,0xC6
bl naviatk_sub_setattack_workchip_id
push r0
mov r1,0x2C
bl navistatus_NaviStatusGet3 
cmp r0,KernelBeastOut
bne @@NotKernelBeastOut
ldrb r0,[r7,0x8]
add r0,0x1E
strb r0,[r7,0x8]
@@NotKernelBeastOut:
pop r0
pop r15