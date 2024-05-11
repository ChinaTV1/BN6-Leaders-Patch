changeElemental:
push r14
cmp r0,1
beq Heat
Other:
ldrb r0,[r4,r0]
b Escape4
Heat:
mov r0,0X40
b Escape4

Escape4:
bl 0x8019F9E
pop r15
