sound equ 0x80005CC
IndexToArmEffect equ 0x60

SelectArm:
push r6,r7,r14
ldrb r1,[r4]
cmp r1,ArmChangeIndex+1
bne @@BRANCH1
sub r4,0xC
@@BRANCH1:
ldrb r0,[r4,0x7]
cmp r0,0
bne @@Different 
mov r0,0x81
bl sound
mov r0,IndexToArmEffect
strb r0,[r5,0x1]
mov r0,0
strh r0,[r5,0x2]
mov r0,0

b @@FINISH

@@Different:
mov r0,0x69
bl sound
mov r0,0x1
@@FINISH:
pop r6,r7,r15