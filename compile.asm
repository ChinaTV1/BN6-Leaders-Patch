
.gba ;defines the architecture (unique to armips)

addr equ 0x8000000 



.if gamever == 0
.open "rom.gba","patchedrom.gba",addr 
.elseif gamever == 1
.open "rom.gba","patchedromfalzar.gba",addr 
.endif 

filesizerom equ filesize("rom.gba")
.relativeinclude on




.include "macros/importSprites.asm" ;(import asm code)
.include "macros/helpermacro.asm" ;
.include "Constants/IndexConstants.asm"

;.include "ColBeastCrossChargeShot/GregarAttack.asm" ;looks good

.include "addingnewcrosswindow/CrossWindow.asm" ;looks good
.include "EmotionWindowChanges/EmotionHooks.asm" ;looks good

.include "NewIndex/Index.asm" ; looks good
.include "ColForceChargeShot/ChargeSpeedHook.asm";looks good

.include "NewIndex/BeastIndexHooks.asm" ;looks good

.include "armchange/armHooks.asm"

;.include "Buster/BusterHook.asm" 

.include "soundFix/SoundHook.asm"

;.include "flyingattack/flyingMasterhook.asm"

.include "CrossSwordChange/CrossAnimationHook.asm"

.include "WindSword/AirRackHook.asm"


;.orga 0x29DE4
;.dw MapCrossWindow

.org 0x802786a  ;same for falzar
bl BackgroundCrossWindow





;collection of functions
.orga 0x1DE15C ; same for falzar
.area 0x564
.align 2 
.include "ColBeastCrossChargeShot/ChangeAttack.asm" ;looks good
.align 2
.include "ColBeastCrossChargeShot/LOCKON.asm" ;looks good
.align 2
.include "addingnewcrosswindow/BackgroundFor6.asm" ;looks good
.align 2
.include "addingnewcrosswindow/Scroll.asm" ;looks good
.align 2
.include "NewIndex/ReIndex.asm" ;looks good 
.align 2 
.include "SpriteColonelCrossIndex/ColonelAccessory.asm" ;looks good
.align 2
.include "EmotionWindowChanges/EmotionSelection.asm" ;looks good
;.align 2
;.include "ColForceChargeShot/ChargeSpeed.asm" ;looksgood
.align 2
.include "NewIndex/BeastReIndex.asm" ;looks good
.align 2
.include "ColBeastCrossChargeShot/SetChargeShotForBeastKernel.asm" ;looks good
.align 2
.include "BLeftSoldier/SetSoldier.asm" ;looks good
;.align 2
;.include "Buster/Buster.asm"
.align 2
.include "soundFix/sound.asm"
;.align 2
;.include "flyingattack/flyingMaster.asm"
.align 2
.include "CrossSwordChange/CrossAnimation.asm"
.align 2
.include "WindSword/AirRack.asm"
.endarea

.org 0x81DF420 
.area 0x88A5
.align 2
.include "armchange/ArmMaster.asm"

.align 2
.include "ColForceChargeShot/ChargeSpeed.asm" ;looksgood
.endarea

.vorga 0xBDEE6,0xBC676
.include "ChangingCrossSprite.asm"

.vorg 0x80ECE28,0x80EBAE8
.include "CrossSwordChange/CrossSwordJump.asm"




.orga filesizerom  ;0x18045A4

importsprite ColonelSprite,"Sprites/dumps/ColonelCross_Final.dmp"
importsprite BeastColonelSprite,"Sprites/dumps/ColonelBeast_Final.dmp"
importsprite Saber,"Sprites/dumps/bn6swordwithCol.DMP"
importsprite ColonelBusterSprite,"Sprites/dumps/Various_Buster_Tips_with_Colonels.DMP"
importsprite HeatBeast,"Sprites/dumps/HeatBeast.dmp"
importSprite KernelEmotion,"Sprites/bins/EmotionBeastAndCross.img.bin"
importSprite KernelTiredEmotion, "Sprites/bins/ColonelTired.img.bin"




.align 4
FirstArm:
.incbin "armchange/ARMBG/ARM.bin"
.incbin "armchange/ARMBG/ARM2.bin"

ArmICON:
.incbin "armchange/ARMBG/ARM3.bin"
PALLETEARM:
.incbin "armchange/ARMBG/ArmPalette.bin"

;falzar is 0x80EAC60
.align 4
PointerAttackList:
.if gamever == 0
pointerrecur "rom.gba",0xEBFA0,0
.elseif gamever == 1 
pointerrecur "rom.gba",0xEAC60,0
.endif
.dw ColonelSliceLoop|1
.dw NewChargeAttack|1


SoulInit2:
pointerrecur "rom.gba",0x146B8,0
.dw 0x801471D
.dw 0x8014754|1


AccessoryCrossList:
pointerrecur "rom.gba",0x1127C,0 ;same 
.dw ColonelAccessory|1

soulattri:
pointerrecur "rom.gba",0x14550,0 ;same 
.dw 0x080145b4|1
.dw 0x08014650|1

listofsprites:
pointercopy "rom.gba",0x31E00,0,0x69 ;same
.dw ColonelSprite

listofSpritesCategoryZero: ;same
pointercopy "rom.gba",0x31CEC,0,0xE
.dw BeastColonelSprite


BackgroundForCustomWindow:
pointerrecur "rom.gba",0x28370,0  ;same
.dw SetArmDraw|1 ; 13
.dw 0x80282AC|1 ;EmptyDraw

CursorsForBackgrounds:
pointerrecur "rom.gba",0x2886C,0 ;same
.dw 0
.dw 0
.dw 0
.dw 0x8028938|1
.dw 0x8028938|1

CursorSelect:
pointerrecur "rom.gba",0x28C9C,0 ;same
.dw 0
.dw 0
.dw 0
.dw SelectArm|1
.dw SelectArm|1

custom_movePointers:
pointerrecur "rom.gba",0x26AA4,0 ;same
.dw ARMEffectMain|1    ;24



Collesion:
.if gamever == 0
pointerrecur "rom.gba",0xC5B44,0
.dw 0x80C5AC8 ;0x13 newindex
.elseif gamever == 1 
pointerrecur "rom.gba",0xC42D4,0
.endif
.dw 0x80C5AC8 ;0x13 newindex


KillEm:
pointerrecur "rom.gba",0x11398,0 ;same
.dw 0x8011212|1

EnemyAccessoryList:
pointerrecur "rom.gba",0x10EA4,0 ;same
.dw ColonelAccessory|1
.dw 0x80114D4|1

EnemyAccessoryListKill:
pointerrecur "rom.gba",0x110F4,0 ;same
.dw 0x80113FD|1
.dw 0x80114D4|1



ChargeAttackList:
pointerrecur "rom.gba",0x117D4,0  ;same
.dw ColonelCrossChargeAttackSet|1
.dw ChargeShotKernelBeastSet|1
.dw KernelSetSoldier|1 ;Soldiers
.dw armBuster|1
;.dw FlySet|1

playercharpointers:

.if gamever == 0
.import "newenemylist/playerablecharpointersforgregar.bin"
.dw 0x80F1600
.elseif gamever == 1
.import "newenemylist/playerablecharpointersforfalzar.bin"
.dw 0x80F02C0
.endif
.dw ColonelBeastAttributes

SpriteIndexes:
.import "Sprites\bins\spriteindex.bin"
.db 0xC, 0x69
WindowConstants:
.import "EmotionWindowChanges\WindowConstants.bin"
.db Kernel,KernelBeastOut
.align 2
.include "HeatmanCrossSpriteChange/HeatManCrossSpriteChange.asm" ;okay
.align 2
.include "HeatmanCrossSpriteChange/ImprovedDeCompressObjTrans.asm" ;okay
.align 2
.include "ColForceChargeShot/ColChargeSettings.asm" ;okay
.align 2
.include "ColForceChargeShot/ColChargeAttack.asm" ;okay
.align 2
.include "CrossSwordChange/CrossSword.asm" ;okay

CrossWindows:
.align 4
.if gamever==0
.import "Sprites/bins/GregarCrossWindow.bin"
.import "Sprites/bins/ColonelSelection.img.bin"
.import "Sprites/bins/GregarCrossGrayScaleWindow.bin"
.import "Sprites/bins/ColonelGray.img.bin"
.elseif gamever==1
.import "Sprites/bins/FalzarCrossWindow.bin"
.import "Sprites/bins/ColonelSelection.img.bin"
.import "Sprites/bins/FalzarCrossWindowsGrayScale.bin"
.import "Sprites/bins/ColonelGray.img.bin"
.endif
PalettesForCrossWindow:
.if gamever==0
.import "Sprites/bins/CrossPalettes.bin"
.import "Sprites/bins/ColonelSelection.pal.bin"
.import "Sprites/bins/CrossPalettesBlueScale.bin"
.import "Sprites/bins/ColonelSelect2.pal.bin"
.elseif gamever==1
.import "Sprites/bins/CrossPalettesFalzar.bin"
.import "Sprites/bins/ColonelSelection.pal.bin"
.import "Sprites/bins/CrossPalettesFalzarBlueScale.bin"
.import "Sprites/bins/ColonelSelect2.pal.bin"

.endif
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
.db 0xFF, 0x05,0x04,0xFF,0x96,0x95 ;ColonelBeast ;0x05 to put everything back
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


.orga 0x188AC  ;okay
.dw BeastOutAdjust

.orga 0x10E14  ;okay
.dw EnemyAccessoryList

.orga 0x11064 ;okay
.dw EnemyAccessoryListKill

.orga 0xF238 ;okay
.dw playercharpointers

.orga 0x182C0 ;okay
.dw NewEnemyList

.orga 0x31CC4 ;okay
.dw listofSpritesCategoryZero

.orga 0xFCB4 ;okay
.dw MegamanCharPosition


.orga 0x117D0 ;okay
.dw ChargeAttackList

.orga 0xFFE0 ;okay
.dw CrossAttackSettings

.orga 0x11394 ;okay
.dw KillEm

.orga 0x1E6FC ;okay
.dw WindowConstants

;.orga 0x32794
;.dw ColonelBusterSprite

.orga 0x1454C ;okay
.dw soulattri

.vorga 0xBE0E0,0xBC870
.dw Prologue|1

.orga 0x2836C ;same
.dw BackgroundForCustomWindow

.orga 0x1BB10 ;same for both
.dw PointerAttackList 

.vorga 0xEC384,0xEB044 ;different for both
.dw PointerAttackList

.orga 0x28868 ;same
.dw CursorsForBackgrounds

.orga 0x28C98 ;same
.dw CursorSelect


.orga 0x11278
.dw AccessoryCrossList

.orga 0x31CD0 ;same
.dw listofsprites

.vorga 0xC5C30,0xC43C0
.dw Collesion

.vorga 0xC5C2C,0xC43BC
.dw SpriteIndexes

.orga 0x10224 ;same
.dw MegamanNewPaletteIndex


.vorga 0xEF5DC,0xEE29C
.dh 0x1B06 ;elecbuster

.orga 0x146B4
.dw SoulInit2

.orga 0x26AA0
.dw custom_movePointers

.org listofSpritesCategoryZero+0x4
.dw HeatBeast

.org listofsprites +0xC
.dw ColonelBusterSprite

.definelabel newPaletteAddress,MegamanNewPalette-0x81D8004

pointerrecurSpritePalette 0x14,0x1D8068,0x1D866C,newPaletteAddress

.close