BackgroundCrossWindow:
push r14
ldrb r0,[r5,0x18]
cmp r0,0x6
bne OrginalCrossBackground
sub r0,1
OrginalCrossBackground:
sub r0,1
pop r15
.pool


