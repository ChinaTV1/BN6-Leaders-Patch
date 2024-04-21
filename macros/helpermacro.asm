.macro BXwithR11, jumpAddress

push r0
ldr  r0,=jumpAddress
mov r11,r0
pop r0
mov r14,r15
bx r11

.endmacro

.macro pointerrecur, file,offset,curr
Loop:
@@pointer equ readu32(file,offset+(curr<<2))
.if @@pointer>>24 == 0x8
    .dw @@pointer
    pointerrecur file,offset,(curr+1)
.endif

.endmacro 