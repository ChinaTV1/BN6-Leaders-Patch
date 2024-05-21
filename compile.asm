
.gba ;defines the architecture (unique to armips)

addr equ 0x8000000 

.open "rom.gba","patchedrom.gba",addr 

.relativeinclude on

;.include "Sprites/EmotionCompilerColonel.asm"
.include "macros/importSprites.asm" ;(import asm code)
.include "macros/helpermacro.asm" ;
.include "Constants/IndexConstants.asm"

.include "ColBeastCrossChargeShot/GregarAttack.asm"
.include "addingnewcrosswindow/CrossWindow.asm"
.include "EmotionWindowChanges/EmotionHooks.asm"

.include "NewIndex/Index.asm"
.include "ColForceChargeShot/ChargeSpeedHook.asm"

;.orga 0x29DE4
;.dw MapCrossWindow

.org 0x802786a
bl BackgroundCrossWindow





;collection of functions
.orga 0x1DE15C
.area 0x564
.align 2 
.include "ColBeastCrossChargeShot/ChangeAttack.asm"
.align 2
.include "ColBeastCrossChargeShot/LOCKON.asm"
.align 2
.include "addingnewcrosswindow/BackgroundFor6.asm"
.align 2
.include "addingnewcrosswindow/Scroll.asm"
.align 2
.include "NewIndex/ReIndex.asm"
.align 2 
.include "SpriteColonelCrossIndex/ColonelAccessory.asm"
.align 2
.include "EmotionWindowChanges/EmotionSelection.asm"
.align 2
.include "ColForceChargeShot/ChargeSpeed.asm"
.endarea

;.include "ElementalChange/changingType.asm"


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



.orga 0x18045A4
importsprite ColonelSprite,"Sprites/dumps/ColonelCross_Final.dmp"
importsprite BeastColonelSprite,"Sprites/dumps/ColonelBeast_Final.dmp"
importsprite Saber,"Sprites/dumps/bn6swordwithCol.DMP"
importsprite ColonelBusterSprite,"Sprites/dumps/ColonelBusterMerged.dmp"
importSprite KernelEmotion,"Sprites/bins/EmotionBeastAndCross.img.bin"
.align 4
PointerAttackList:
pointerrecur "rom.gba",0xEBFA0,0
.dw ColonelSliceLoop|1
AccessoryCrossList:
pointerrecur "rom.gba",0x1127C,0
.dw ColonelAccessory|1
soulattri:
pointerrecur "rom.gba",0x14550,0
.dw 0x080145b5
listofsprites:
pointercopy "rom.gba",0x31E00,0,0x69
.dw ColonelSprite
Collesion:
pointerrecur "rom.gba",0xC5B44,0
.dw 0x80C5AC8 ;0x13 newindex

KillEm:
pointerrecur "rom.gba",0x11398,0
.dw 0x8011212|1

ChargeAttackList:
pointerrecur "rom.gba",0x117D4,0
.dw ColonelCrossChargeAttackSet|1

SpriteIndexes:
.import "Sprites\bins\spriteindex.bin"
.db 0xC, 0x69
WindowConstants:
.import "EmotionWindowChanges\WindowConstants.bin"
.db Kernel
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
MegamanNewPalette:
.import "Sprites/palette/megaman.pal.bin"
.import "Sprites/bins/BaseMegaman.pal.bin"
PaletteEmotionColonelCross:
.import "Sprites/bins/EmotionColonelCross.pal.bin"
MegamanNewPaletteIndex:
.import "Sprites/bins/paletteindex.bin"
.db 0x2B
CrossAttackSettings:
.import "ColForceChargeShot/CrossSettingsAttack.bin"
.db 0xFF,0xFF,0x00,0x94,0xFF,0xFF

.org pointerrecur_loop_00000025
.dw NewChargeAttack|1;0x81055B8|1;0x80EB06A|1


.orga 0x117D0
.dw ChargeAttackList

.orga 0xFFE0
.dw CrossAttackSettings

.orga 0x11394
.dw KillEm

.orga 0x1E6FC
.dw WindowConstants

.orga 0x32794
.dw ColonelBusterSprite

;.orga 0x117EC
;.dw ColonelCrossChargeAttackSet|1

.orga 0x1454C
.dw soulattri

.orga 0x31CF0
.dw BeastColonelSprite

.orga 0x3286C
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

.orga 0x11278
.dw AccessoryCrossList

.orga 0x31CD0
.dw listofsprites

.orga 0xC5C30
.dw Collesion

.orga 0xC5C2C
.dw SpriteIndexes

.orga 0x10224
.dw MegamanNewPaletteIndex


.definelabel newPaletteAddress,MegamanNewPalette-0x81D8004

pointerrecurSpritePalette 0x14,0x1D8068,0x1D866C,newPaletteAddress

.close