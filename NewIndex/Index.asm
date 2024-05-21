.org 0x8029382
bl TESTFORBEASTAfterChoosingCross


.org 0x8029392
bl ReIndex
.org 0x8014A44
cmp r0,0x19
bgt 0x8014AA8
bl NewCompForCross
.org 0x8014A58
bl TESTFORBEASTCROSS
.org 0x8014A72
bl TESTFOREGULARCROSS
.org 0x80BDF6E
bl PaletteForColonel
.org 0x80F16F4
bl newTestSuperBeast
