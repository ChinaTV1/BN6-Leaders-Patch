custom_select_chip_del equ 0x80293F8
armDetourDelete:
push r14
bl custom_select_chip_del
bl armDeleteChip
pop r15


CustomChipAddrI equ 0x8027E1C 

armDeleteChip:
push r7,r14
mov r7,0
sub r7,1
mov r0,0x8
bl CustomChipAddrI
ldrb r1,[r0,0x7]
cmp r1,0x2
bne @@FINISH
ldrb r0,[r0,0x4]
bl CustomChipAddrI 
ldr r0,[r0,8]
strh r7,[r0]

@@FINISH:
pop r7,r15

