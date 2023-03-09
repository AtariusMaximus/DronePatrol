; --------------------------------------------------------------------------
; Blocks code provided by RevEng (Mike Saarna)
;   
;   allows enabling, disabling, setting palette, or graphic for any object
;   in the display lists, given the zone number (Y) and the number of the 
;   object in that zone. (X)
;   
; 20210328 - added options to shift zone objects (MS)
;
; 20200618 - updated to match most of Mike's updateobjects.asm
; changes (excluding SetBlockImage)
;
; 20200301 - update to support full extended screen height, and up
; to 40 objects in the zone. extend the x5table if you need more objects, 
; but really, Maria won't be able to likely draw more than 40.
; -------------------------------------------------------------------------- 

; SetZoneImage - A=blockX Y=blockY temp3=gfx
SetBlockImage
 jsr SetBlockPointer
 ldy #0 ; Low Address of graphics
 lda temp3
 sta (temp1),y
 rts
 
; SetBlockPalette - A=blockX Y=blockY temp3=palette
SetBlockPalette
 jsr SetBlockPointer
 ldy #3 ; palette+width is the 4th byte in the dl object
 lda (temp1),y
 and #%00011111
 ldx temp3
 ora x32table,x
 sta (temp1),y
 rts

; EnableBlock - A=blockX Y=blockY
EnableBlock
 jsr SetBlockPointer
 ldy #2 ; High Address of graphics
 lda (temp1),y
 if WZONEHEIGHT = 8
     and #%11110111
 endif
 if WZONEHEIGHT = 16
     and #%11101111
 endif
 sta (temp1),y
 rts
  
; DisableBlock - A=blockX Y=blockY
DisableBlock
 jsr SetBlockPointer
 ldy #2 ; High Address of graphics
 lda (temp1),y
 if WZONEHEIGHT = 8
     ora #%00001000
 endif
 if WZONEHEIGHT = 16
     ora #%00010000
 endif
 sta (temp1),y
 rts

; ShiftBlockTo - A=blockX Y=blockY temp3=location
ShiftBlockTo
 jsr SetBlockPointer
 ldy #4 ; object x-coordinate is the 5th byte in the dl object
 lda temp3
 sta (temp1),y
 rts

; ShiftBlockLeft - A=blockX Y=blockY temp3=distance
ShiftBlockLeft
 jsr SetBlockPointer
 ldy #4                        ; object x-coordinate is the 5th byte in the dl object
 lda (temp1),y
 sec
 sbc temp3
 sta (temp1),y
 rts

; ShiftBlockRight - A=blockX Y=blockY temp3=distance
ShiftBlockRight
 jsr SetBlockPointer
 ldy #4                       ; object x-coordinate is the 5th byte in the dl object
 lda (temp1),y
 ;clc
 adc temp3
 sta (temp1),y
 rts

; called with A=maxobjects Y=blockY temp3=distance
; left 0-127 right 255-128?
ShiftZone
 sta temp4                    ;store maxobjects (A)
 sty temp5                    ;store blockY (Y)
ShiftZoneLoop
 jsr SetBlockPointer
 ldy #4                       ;object x-coordinate is the 5th byte in the dl object
 lda (temp1),y              
 sec                          ;increases scroll speed+1 unless we set carry
 sbc temp3                    ;reduce x by required distance
 sta (temp1),y                ;and store
 
 dec temp4                    ;decrement to next object in zone
 bmi ShiftZoneExit            ;reached end of objects in zone?

 lda temp4                    ;load A & Y for block pointer
 ldy temp5                    

 jmp ShiftZoneLoop            ;continue
ShiftZoneExit
 rts

; called with A=blockX Y=blockY
SetBlockPointer
 tax
 clc
 lda ZONESTARTLO,y
 adc x5table,x
 sta temp1 
 lda ZONESTARTHI,y
 adc #0
 sta temp2
 rts

x5table ; enough entries to support 40 objects per dl
MULT5IDX SET 0
 REPEAT 40
 .byte MULT5IDX
MULT5IDX SET (MULT5IDX+5)
 REPEND

x32table ; 32 multiplaction for palette values
MULT32IDX SET 0
 REPEAT 8
 .byte MULT32IDX
MULT32IDX SET (MULT32IDX+32)
 REPEND

ZONESTARTLO
 .byte <ZONE0ADDRESS
 .byte <ZONE1ADDRESS
 .byte <ZONE2ADDRESS
 .byte <ZONE3ADDRESS
 .byte <ZONE4ADDRESS
 .byte <ZONE5ADDRESS
 .byte <ZONE6ADDRESS
 .byte <ZONE7ADDRESS
 .byte <ZONE8ADDRESS
 .byte <ZONE9ADDRESS
 .byte <ZONE10ADDRESS
 .byte <ZONE11ADDRESS
 ifconst ZONE12ADDRESS
   .byte <ZONE12ADDRESS
 endif
 ifconst ZONE13ADDRESS
   .byte <ZONE13ADDRESS
 endif
 ifconst ZONE14ADDRESS
   .byte <ZONE14ADDRESS
 endif
 ifconst ZONE15ADDRESS
   .byte <ZONE15ADDRESS
 endif
 ifconst ZONE16ADDRESS
   .byte <ZONE16ADDRESS
 endif
 ifconst ZONE17ADDRESS
   .byte <ZONE17ADDRESS
 endif
 ifconst ZONE18ADDRESS
   .byte <ZONE18ADDRESS
 endif
 ifconst ZONE19ADDRESS
   .byte <ZONE19ADDRESS
 endif
 ifconst ZONE20ADDRESS
   .byte <ZONE20ADDRESS
 endif
 ifconst ZONE21ADDRESS
   .byte <ZONE21ADDRESS
 endif
 ifconst ZONE22ADDRESS
   .byte <ZONE22ADDRESS
 endif
 ifconst ZONE23ADDRESS
   .byte <ZONE23ADDRESS
 endif
 ifconst ZONE24ADDRESS
   .byte <ZONE24ADDRESS
 endif
 ifconst ZONE25ADDRESS
   .byte <ZONE25ADDRESS
 endif
 ifconst ZONE26ADDRESS
   .byte <ZONE26ADDRESS
 endif
 ifconst ZONE27ADDRESS
   .byte <ZONE27ADDRESS
 endif

ZONESTARTHI
 .byte >ZONE0ADDRESS
 .byte >ZONE1ADDRESS
 .byte >ZONE2ADDRESS
 .byte >ZONE3ADDRESS
 .byte >ZONE4ADDRESS
 .byte >ZONE5ADDRESS
 .byte >ZONE6ADDRESS
 .byte >ZONE7ADDRESS
 .byte >ZONE8ADDRESS
 .byte >ZONE9ADDRESS
 .byte >ZONE10ADDRESS
 .byte >ZONE11ADDRESS
 ifconst ZONE12ADDRESS
   .byte >ZONE12ADDRESS
 endif
 ifconst ZONE13ADDRESS
   .byte >ZONE13ADDRESS
 endif
 ifconst ZONE14ADDRESS
   .byte >ZONE14ADDRESS
 endif
 ifconst ZONE15ADDRESS
   .byte >ZONE15ADDRESS
 endif
 ifconst ZONE16ADDRESS
   .byte >ZONE16ADDRESS
 endif
 ifconst ZONE17ADDRESS
   .byte >ZONE17ADDRESS
 endif
 ifconst ZONE18ADDRESS
   .byte >ZONE18ADDRESS
 endif
 ifconst ZONE19ADDRESS
   .byte >ZONE19ADDRESS
 endif
 ifconst ZONE20ADDRESS
   .byte >ZONE20ADDRESS
 endif
 ifconst ZONE21ADDRESS
   .byte >ZONE21ADDRESS
 endif
 ifconst ZONE22ADDRESS
   .byte >ZONE22ADDRESS
 endif
 ifconst ZONE23ADDRESS
   .byte >ZONE23ADDRESS
 endif
 ifconst ZONE24ADDRESS
   .byte >ZONE24ADDRESS
 endif
 ifconst ZONE25ADDRESS
   .byte >ZONE25ADDRESS
 endif
 ifconst ZONE26ADDRESS
   .byte >ZONE26ADDRESS
 endif
 ifconst ZONE27ADDRESS
   .byte >ZONE27ADDRESS
 endif