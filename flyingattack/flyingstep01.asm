flyingstep01:
mov r0,1
ldrb r1,[r7,0x3]
cmp r1,0xB
bne @@Alternative
mov r0,0x2
@@Alternative:
strh r0,[r7,0x12]
mov r0,0
str r0,[r7,0x30]
mov r0 0x8
strh r0,[r7]
mov r15,r14
