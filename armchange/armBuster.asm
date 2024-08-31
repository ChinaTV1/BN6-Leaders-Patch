setAtkWorkChipId2 equ 0x80126EA
armBuster:
push r14
ldr r0,[r5,0x58]
ldrh r0,[r0,0x3A]
bl setAtkWorkChipId2
pop r15