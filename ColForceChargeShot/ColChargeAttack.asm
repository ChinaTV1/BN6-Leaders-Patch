@BattleHitStatusOn equ 0x801A152|1
@navi_sword_arm_type_check equ 0x80ECE74|1
@navi_sword_arm_seq_check equ 0x80ECE28|1
@setcommonseqNo equ 0x800F2B6|1
@setem05 equ 0x80BA6A0|1
@CounterTimerSeq equ 0x800FDB6|1
@SoundRQ equ 0x80005CC|1
@Parameters equ 0x8104CC0
@EFCSET equ 0x80E1932|1
@SetShl03 equ 0x80C6BDA|1
@FlipCheck equ 0x800E456|1
@GetBlockPos equ 0x0800E276|1
@BattleHitStatusFlagOff equ 0x801A15C|1 
@Finish equ 0x8011714|1

.align 2
ColonelSliceLoop:
push r14
ldr r1,=@@AttackPool
ldrb r0,[r7]
ldr r1,[r1,r0]
mov r14,r15
bx r1
pop r15
.align 4
@@AttackPool:
.dw ColonelSliceInit|1
.dw EndCrossDive|1



.align 2
ColonelSliceInit:
push r4,r6,r14
ldrb r0,[r7,0x1]
tst r0,r0
bne Jump
mov r0,0x1
lsl r0,r0,0x16
BXwithR11 @BattleHitStatusOn
mov r0,0x5
BXwithR11  @setcommonseqNo
push r7
BXwithR11 @navi_sword_arm_type_check
mov r4,r0
BXwithR11 @navi_sword_arm_seq_check
;mov r0,0xF
lsl r0,r0,0x8
add r4,r4,r0
mov r7,0x4C
add r7,r7,r5
BXwithR11 @setem05
pop r7
BXwithR11 @CounterTimerSeq 
mov r0,0xC7
BXwithR11 @SoundRQ 
mov r0,0x15
strh r0,[r7,0x10]
mov r0,0x4
strb r0,[r7,0x1]
Jump:
ldrh r0,[r7,0x10]
cmp r0,0x9
bne NextPhase
ldrb r0,[r7,0x3]
lsl r0,r0,0x2
ldr r4,=@Parameters
ldr r4,[r4]
ldrb r0,[r7,0x16]
ldrb r1,[r7,0x17]
mov r2,0x0
mov r3,0x0
ldr r6,[r7,0x8]
push r7
mov r7,0x3
BXwithR11 @SetShl03
pop r7
BXwithR11 @FlipCheck 
lsl r4,r0,0x8
ldrb r0,[r7,0x3]
add r0,0x48
add r4,r4,r0
ldrb r0,[r7,0x16]
ldrb r1,[r7,0x17]
BXwithR11 @GetBlockPos 
mov r2,r1
mov r1,r0
mov r3,0
mov r4,0x35
BXwithR11 @EFCSET
NextPhase:
ldrh r0,[r7,0x10]
sub r0,0x1
strh r0,[r7,0x10]
bgt Escape
mov r0,0x1
lsl r0,r0,0x16
BXwithR11 @BattleHitStatusFlagOff
mov r0,0x4
strh r0,[r7]
Escape:
pop r4,r6,r15
.pool

.align 2
EndCrossDive:
push r14
ldrb r0,[r7,0x1]
tst r0,r0
bne AnotherJump2
mov r0,0x5
strh r0,[r7,0x10]
mov r0,0x4
strb r0,[r7,0x1]
AnotherJump2:
ldrh r0,[r7,0x10]
sub r0,0x1
strh r0,[r7,0x10]
bgt Escape2
mov r0,0x0
str r0,[r5,0x4C]
ldr r1,[r5,0x58]
str r0,[r1,0x68]
BXwithR11 @Finish
Escape2:
pop r15
.pool





