.macro BXwithR11, jumpAddress

push r0
ldr  r0,=jumpAddress
mov r11,r0
pop r0
mov r14,r15
bx r11

.endmacro 