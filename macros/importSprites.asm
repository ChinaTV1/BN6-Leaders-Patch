.macro importsprite,spriteName,path
.align 4 ;align by 4 bytes
spriteName:
.import path
.endmacro 