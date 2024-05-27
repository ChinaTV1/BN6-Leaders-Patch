
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

.include "NewIndex/BeastIndexHooks.asm"


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
.align 2
.include "NewIndex/BeastReIndex.asm"
.align 2
.include "ColBeastCrossChargeShot/SetChargeShotForBeastKernel.asm"
.align 2
.include "BLeftSoldier/SetSoldier.asm"
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
importSprite KernelTiredEmotion, "Sprites/bins/ColonelTired.img.bin"
.align 4
PointerAttackList:
pointerrecur "rom.gba",0xEBFA0,0
.dw ColonelSliceLoop|1
.dw NewChargeAttack|1
AccessoryCrossList:
pointerrecur "rom.gba",0x1127C,0
.dw ColonelAccessory|1
soulattri:
pointerrecur "rom.gba",0x14550,0
.dw 0x080145b4|1
.dw 0x08014650|1
listofsprites:
pointercopy "rom.gba",0x31E00,0,0x69
.dw ColonelSprite

listofSpritesCategoryZero:
pointercopy "rom.gba",0x31CEC,0,0xE
.dw BeastColonelSprite

Collesion:
pointerrecur "rom.gba",0xC5B44,0
.dw 0x80C5AC8 ;0x13 newindex

KillEm:
pointerrecur "rom.gba",0x11398,0
.dw 0x8011212|1

EnemyAccessoryList:
pointerrecur "rom.gba",0x10EA4,0
.dw 0x80114D4|1
.dw 0x80114D4|1

EnemyAccessoryListKill:
pointerrecur "rom.gba",0x110F4,0
.dw 0x80113FD|1
.dw 0x80114D4|1

ChargeAttackList:
pointerrecur "rom.gba",0x117D4,0
.dw ColonelCrossChargeAttackSet|1
.dw ChargeShotKernelBeastSet|1
.dw KernelSetSoldier|1 ;Soldiers

playercharpointers:
.import "newenemylist/playerablecharpointersforgregar.bin"
.dw 0x80F1600
.dw ColonelBeastAttributes

SpriteIndexes:
.import "Sprites\bins\spriteindex.bin"
.db 0xC, 0x69
WindowConstants:
.import "EmotionWindowChanges\WindowConstants.bin"
.db Kernel,KernelBeastOut
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
PaletteEmotionKernelCrossBeast:
.import "Sprites/bins/EmotionColonelBeast.pal.bin"
PaletteTiredKernelCross:
.import "Sprites/bins/ColonelTired.pal.bin"
MegamanNewPaletteIndex:
.import "Sprites/bins/paletteindex.bin"
.db 0x2B,0x0
CrossAttackSettings:
.import "ColForceChargeShot/CrossSettingsAttack.bin"
.db 0xFF,0xFF,0x00,0x94,0x96,0xFF ;ColonelCross
.db 0xFF, 0x05,0x04,0xFF,0x96,0x95 ;ColonelBeast
MegamanCharPosition:
.import "MegamanCharPosition/MegamanPos.bin"
.db 0x0,0xE
NewEnemyList:
.import "newenemylist/newenemyattributes.bin"
.db 0x0,0x2,0x31 ;ColonelCross
.db 0x0,0x2,0x32 ;ColonelCrossBeast

ColonelBeastAttributes:
.db 0x0,0xE,0x1,0x2,0x0

BeastOutAdjust:
.import "newenemylist/beastoutadjust.bin"
.db 0x1

SecondType:
.import "ElementalChange/SecondElements.bin"
.db 0x0 
.db 0x40 ;Kernel
.db 0x40 ;Kernel Beast



.orga 0x108B4
.dw SecondType

.org pointercopy_loop_00000000
.dw Saber

;.org pointerrecur_loop_00000025
;.dw NewChargeAttack|1;0x81055B8|1;0x80EB06A|1


.orga 0x188AC 
.dw BeastOutAdjust

.orga 0x10E14
.dw EnemyAccessoryList

.orga 0x11064
.dw EnemyAccessoryListKill

.orga 0xF238
.dw playercharpointers

.orga 0x182C0
.dw NewEnemyList

.orga 0x31CC4
.dw listofSpritesCategoryZero

.orga 0xFCB4 
.dw MegamanCharPosition


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

.orga 0x1454C
.dw soulattri

.org 0xBE0E0+addr
.dw Prologue|1



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