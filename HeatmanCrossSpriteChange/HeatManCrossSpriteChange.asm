@Navi_Char_Id_Get equ 0x800FC9E+1
;9F FC 00 08
Prologue:
push r14
ldr r1,=0x1A0
cmp r0,0x19
bne NotColonel 
ldr r0,=0x16A
b Common
NotColonel:
add r0,r0,r1
Common:
strh r0,[r5,28h]
ldrb r0,[r5,4h]
ldr r2,=@Navi_Char_id_Get
mov r1,0
mov r14,r15
bx r2
cmp r0,0x19
bne Finished
bl UncompressColonel
mov r2,0x12
Finished:
pop r15


.pool