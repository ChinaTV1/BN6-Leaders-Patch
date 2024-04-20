@TempObjType1DecompressandAlloc equ 0x8002B30|1

UncompressColonel:
.align 2
push r0-r12,r14
mov r0,0x8 ;navi flag
mov r1,0x12 ;colonelID
ldr r2,=@TempObjType1DecompressandAlloc
mov r14,r15
bx r2
pop r0-r12,r15
.pool