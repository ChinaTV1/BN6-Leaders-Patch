CheckForBeastinWindow:
cmp r1,Kernel
beq @@Normal
cmp r1,0xB
blt @@Normal
mov r15,r14
@@Normal:
bl 0x802A0b2

theWindowCheck:
ldr r5,=0x2035280
cmp r6,0x6
beq @@SelectedKernel
mov r0,r6
mov r15,r14
@@SelectedKernel:
mov r0,Kernel
mov r15,r14
.pool

CheckForBeast:
cmp r4,Kernel
beq @@CheckForTired
cmp r4,0xA
bgt @@BeastOutWindow
@@CheckForTired:
mov r15,r14
@@BeastOutWindow:
bl 0x801E6EA

CheckForBeastCustomScreen:
cmp r4,Kernel
beq @@CheckForTired
cmp r4,0xA
bgt @@BeastOutWindow
@@CheckForTired:
mov r15,r14
@@BeastOutWindow:
bl 0x801E696

NewWindowEmotionSelection:
cmp r4,Kernel
beq KernelEmotionSelect
ldr r1,=0x801CD08
ldr r0,[r1,r0]
mov r15,r14
KernelEmotionSelect:
ldr r0,=KernelEmotion
mov r15,r14
.pool

NewPaletteEmotionSelection:
cmp r4,Kernel
beq KernelPalette
ldr r1,=0x872D050
add r0,r0,r1
mov r15,r14
KernelPalette:
ldr r0,=PaletteEmotionColonelCross
mov r15,r14
.pool