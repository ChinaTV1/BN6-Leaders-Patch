.gba //defines the architecture (unique to armips)

@addr equ 0x8000000 

.open "rom.gba","patchedrom.gba", @addr 

//Emotion window location of HeatCross
.org 0x72BED0+@addr
.import "bins/EmotionBeastAndCross.img.bin"

//ColonelCross Palette
.org 0x72D0F0+@addr
.import "bins/EmotionColonelCross.pal.bin"

//ColonelBeast Palette
.org 0x72D230+@addr
.import "bins/EmotionColonelBeast.pal.bin"

//HeatTired adress
.org 0x72C3D0+@addr
.import "bins/ColonelTired.img.bin"

//Palette
.org 0x72D190+@addr
.import "bins/ColonelTired.pal.bin"


.close

