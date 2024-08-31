

CompareForArmChange:
cmp r1,ArmChangeIndex
beq @@ArmChangeDrawThis
cmp r1,ArmChangeIndex+1 
beq @@ArmChangeDrawThis
cmp r1,0x9
beq @@GarbageChute
pop r15

@@GarbageChute:
bl 0x80284DA

@@ArmChangeDrawThis:
bl ChipPicDrawArm
pop r15




not_chip_comm_fill equ 0x80287D2
custom_sub_custom_fill_chipdata	equ 0x802869E
;memtrans256 equ 0x800AC8
ChipPicDrawArm:
push r14
bl not_chip_comm_fill
ldr r0,=ArmICON
ldr r1,=0x6009560
ldr r2,=0x540
bl memtrans256
ldr r0,=PalleteArm
ldr r1,=0x3001AA0
mov r2,0x20
bl memtrans256
bl custom_sub_custom_fill_chipdata
pop r15
.pool
