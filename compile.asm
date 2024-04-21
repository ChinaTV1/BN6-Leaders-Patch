
.gba ;defines the architecture (unique to armips)

@addr equ 0x8000000 

.open "rom.gba","patchedrom.gba",@addr 

.relativeinclude on

.include "Sprites/EmotionCompilerColonel.asm"
.include "macros/importSprites.asm" ;(import asm code)
.include "macros/helpermacro.asm" ;

.org 0x1DE1A0+@addr
.import "Sprites/bins/BaseMegaMan.pal.bin"

.org 0x6E73D0+@addr
.import "Sprites/bins/ColonelSelection.pal.bin"

.org 0x6E5D50+@addr
.import "Sprites/bins/ColonelSelection.img.bin"

.org 0x6E6890+@addr
.import "Sprites/bins/ColonelGray.img.bin"

.org 0x6E7470+@addr
.import "Sprites/bins/ColonelSelect2.pal.bin"

.org 0xBDEE6+@addr
.include "ChangingCrossSprite.asm"

;.org 0xEC034+@addr
;.dw ColForceInit|1
 

.org 0x18045A4+@addr
importsprite ColonelSprite,"Sprites/dumps/ColonelCross_Final.dmp"
importsprite BeastColonelSprite,"Sprites/dumps/ColonelBeast_Final.dmp"

.align 4
PointerAttackList:
.import "Sprites/bins/pointerattacklist.bin"
.dw ColonelSliceLoop|1

.align 2
.include "HeatmanCrossSpriteChange/HeatManCrossSpriteChange.asm"
.align 2
.include "HeatmanCrossSpriteChange/ImprovedDeCompressObjTrans.asm"
.align 2
.include "ColForceChargeShot/ColForceInit.asm"
.align 2
.include "ColForceChargeShot/ColChargeSettings.asm"
.align 2
.include "ColForceChargeShot/ColChargeAttack.asm"




.orga 0x117EC
.dw ColonelCrossChargeAttackSet|1

.org 0x31CF0+@addr
.dw BeastColonelSprite

.org 0x3286C+@addr
.dw BeastColonelSprite

.org 0xBE0E0+@addr
.dw Prologue|1

;.orga 0x31E00
;.dw Saber

.orga 0x1BB10
.dw PointerAttackList 

;.orga 0xEBFFC
;.dw ColonelSliceLoop|1

.org 0x3284C+@addr
.dw ColonelSprite

.org 0x31E10+@addr
.dw ColonelSprite




.close