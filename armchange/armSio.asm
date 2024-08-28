setUpTheArm:
strb r1,[r5]
strb r1,[r5,0x4]
strb r1,[r5,0x6]
strb r1,[r5,0x7]
mov r15,r14

ColonelUnionSetArm:
push r0-r3,r15
ldr r0,[r0,0x8]
ldr r1,=0x203CED0
strh r0,[r1,0x6]

pop r0-r3,r15

.pool

GetCustomData equ 0x8027E1C

KernelSendSio:
push r14
mov r0,0x8
bl GetCustomData
ldrb r1,[r0]
cmp r1,ArmChangeIndex
bne @@FINISH
ldrb r1,[r0,0x7]
cmp r1,0x2
bne @@FINISH
bl ColonelUnionSetArm
@@FINISH:
pop r15

sio_sendData equ 0x8029110

DetourForSendData:
push r14
bl sio_sendData
bl KernelSendSio
pop r15