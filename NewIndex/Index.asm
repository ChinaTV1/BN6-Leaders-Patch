.org 0x80157FE ;good
bl NewWeakCheck



.org 0x801b03E ;good
nop 
nop

.vorg 0x80BA592,0x80B8D22
bl TESTFORCROSSANDBEASTFORGFXWEAPONS



.org 0x8029382
bl TESTFORBEASTAfterChoosingCross


.org 0x8029392
bl ReIndex

.org 0x8014A44
cmp r0,0x1A
bgt 0x8014AA8
bl NewCompForCross
.org 0x8014A58
bl TESTFORBEASTCROSS
.org 0x8014A72
bl TESTFOREGULARCROSS
.vorg 0x80BDF6E,0x80BC6FE
bl PaletteForColonel
.vorg 0x80F16F4,0x80F03B4
bl newTestSuperBeast

.vorg  0x802A592,0x802A596
bl TESTFORBEASTCrossWindow