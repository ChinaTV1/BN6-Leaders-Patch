;.org 0x802794C
;bl Scroll
.org 0x8028AAA
bl Scroll
;.org 0x8029DAE
;bl BranchThis
;nop 
;nop


.org 0x8029DA0
mov r0,6h  ;crosswindow grayscale 
.org 0x8029DD8
.dw CrossWindows
.org 0x802797C
mov r2,6h ;selection color
.org 0x802910C
.db 0x56
 
.org 0x8028B70
.db 0x56
.org 0x80279C4
.db 0x56
.vorg 0x8029F60,0x8029F64
.db 0x56

.vorg 0x8029F30,0x8029F34
nop

.org 0x8029EC0
.dw PalettesForCrossWindow


.vorg 0x8029F0A,0x8029F0C
nop

;.org 0x08029F3A
;cmp r4,0x6

.org 0x8028AD0
bl BitTestWindow
bne 0x8028AF8

.org 0x8028AD6
bl BitSetWindow

.org 0x802904C
nop

.org 0x8027976
bl BitTestWindow
beq 0x802797E

.vorg 0x8029F3A,0x8029F3E
cmp r4,0x6

.vorg 0x8029F3E,0x8029F42
bl setToMaxValue

