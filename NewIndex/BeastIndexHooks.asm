.org 0x8029362
bl BeastNewIndex

.org 0x8014A62
bl BeastoutTime

.org 0x8015A5E
bl UpdateTurnCount

.org 0x8015A62
cmp r0,0x1A

.org 0x80159F6
bl BeastCheckForRelease
nop
nop

.org 0x8012F74
bl BeastChargeTime
nop 
nop


.org 0x8016868
bl BeastCommonMatchless
nop
nop

.org 0x80158E6
bl NewFatigueSet

.org 0x80158EA
bl NewExtremeFatigueSet

.org 0x8015464
bl NewBeastCrossSet

.org 0x8013294
bl BeastChargeShot

.org 0x800FC08
bl BeastLockOn

.org 0x80E28C4
bl BeastLockIcon

;.org 0x80150CA
;nop

.org 0x8015B22
push r14

.org 0x8015B24
bl CompareForMegaman

.org 0x8015B30
pop r15

.org 0x8015B2A
bl AdjustmentForCrosses

.org 0x80150C2
nop
nop

.org 0x8015552
nop
nop

.org 0x8014C6A
nop
nop