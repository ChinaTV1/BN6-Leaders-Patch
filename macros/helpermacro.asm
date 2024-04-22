.macro BXwithR11, jumpAddress

add sp,-0x8
str r0,[sp]
mov r0,r11
str r0,[sp,0x4]
ldr  r0,=jumpAddress
mov r11,r0
ldr r0,[sp]
mov r14,r15
bx r11
str r0,[sp]
ldr r0,[sp,0x4]
mov r11,r0
ldr r0,[sp]
add sp,0x8

.endmacro

.macro pointerrecur, file,offset,curr
Loop:
@@pointer equ readu32(file,offset+(curr<<2))
.if @@pointer>>24 == 0x8
    .dw @@pointer
    pointerrecur file,offset,(curr+1)
.endif

.endmacro 