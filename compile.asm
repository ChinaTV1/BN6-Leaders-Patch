
.gba ;defines the architecture (unique to armips)

addr equ 0x8000000 

.open "rom.gba","patchedrom.gba",addr 

.relativeinclude on

.include "Sprites/EmotionCompilerColonel.asm"
.include "macros/importSprites.asm" ;(import asm code)
.include "macros/helpermacro.asm" ;


.include "ColBeastCrossChargeShot/ChangeAttack.asm"
.include "addingnewcrosswindow/CrossWindow.asm"

.include "ElementalChange/ChangingType.asm"


.orga 0x29DE4
.dw MapCrossWindow

.org 0x802786a
bl BackgroundCrossWindow



.org 0x82F9244
.area 0x200
.include "ColBeastCrossChargeShot/LOCKON.asm"
.include "ElementalChange/newType.asm"
.include "addingnewcrosswindow/BackgroundFor6.asm"
.endarea

.include "ElementalChange/changingType.asm"

.orga 0x1DE1A0
.import "Sprites/bins/BaseMegaMan.pal.bin"

.orga 0x6E73D0
.import "Sprites/bins/ColonelSelection.pal.bin"

.orga 0x6E5D50
.import "Sprites/bins/ColonelSelection.img.bin"

.orga 0x6E6890
.import "Sprites/bins/ColonelGray.img.bin"

.orga 0x6E7470
.import "Sprites/bins/ColonelSelect2.pal.bin"

.orga 0xBDEE6
.include "ChangingCrossSprite.asm"

.org 0x80ECE28
.include "CrossSwordChange/CrossSwordJump.asm"



.org 0x18045A4+addr
importsprite ColonelSprite,"Sprites/dumps/ColonelCross_Final.dmp"
importsprite BeastColonelSprite,"Sprites/dumps/ColonelBeast_Final.dmp"
importsprite Saber,"Sprites/dumps/bn6swordwithCol.DMP"
.align 4
PointerAttackList:
pointerrecur "rom.gba",0xEBFA0,0
.dw ColonelSliceLoop|1
.align 2
.include "HeatmanCrossSpriteChange/HeatManCrossSpriteChange.asm"
.align 2
.include "HeatmanCrossSpriteChange/ImprovedDeCompressObjTrans.asm"
.align 2
.include "ColForceChargeShot/ColChargeSettings.asm"
.align 2
.include "ColForceChargeShot/ColChargeAttack.asm"
.align 2
.include "CrossSwordChange/CrossSword.asm"

CrossWindows:
.align 4
.import "Sprites/bins/GregarCrossWindow.bin"
.import "Sprites/bins/ColonelSelection.img.bin"
.import "Sprites/bins/GregarCrossGrayScaleWindow.bin"
.import "Sprites/bins/ColonelGray.img.bin"
PalettesForCrossWindow:
.import "Sprites/bins/CrossPalettes.bin"
.import "Sprites/bins/ColonelSelection.pal.bin"
.import "Sprites/bins/CrossPalettesBlueScale.bin"
.import "Sprites/bins/ColonelSelect2.pal.bin"
MapCrossWindow:
.import "Sprites/maps/CrossMaps.bin"




.org pointerrecur_loop_00000025
.dw 0x81055B8|1;0x80EB06A|1

.orga 0x117EC
.dw ColonelCrossChargeAttackSet|1

.org 0x31CF0+addr
.dw BeastColonelSprite

.org 0x3286C+addr
.dw BeastColonelSprite

.org 0xBE0E0+addr
.dw Prologue|1

.orga 0x31E00
.dw Saber

.orga 0x1BB10
.dw PointerAttackList 

.orga 0xEC384
.dw PointerAttackList

;.orga 0xEBFFC
;.dw ColonelSliceLoop|1

.org 0x3284C+addr
.dw ColonelSprite

.org 0x31E10+addr
.dw ColonelSprite




.close