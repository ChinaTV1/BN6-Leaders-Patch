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
.org 0x8029F60
.db 0x56
.org 0x8029F3A
cmp r4,6h
.org 0x8029EC0
.dw PalettesForCrossWindow


.org 0x8029F0A
nop

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