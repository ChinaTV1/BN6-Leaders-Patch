.definelabel BusterAttackStr, 0x8012642
ChargeShotKernelBeastSet:
push r14
mov r0,0x28
mov r1,0x1E
bl BusterAttackStr
strh r0,[r7,0x8]
mov r0,0x60
pop r15

