; Made for Easy6502
; https://skilldrick.github.io/easy6502/

init:
ldx #$00
ldy #$0F
jsr lpclear
ldy #$7F
jsr wait
jmp fill

lpclear:
cpy #$00
beq endsub
tya
jsr clear
dey
jmp lpclear

clear:
cpx #$FF
beq reset
sta $0200,x
sta $0300,x
sta $0400,x
sta $0500,x
inx
jmp clear

fill:
adc #$ef
sta $0200,x
adc $ef
sta $0300,x
adc #$ef
sta $0400,x
sbc #$ef
sta $0500,x
inx
jmp fill

wait:
cpy #$00
beq endsub
dey
nop
nop
jmp wait

reset:
ldx #$00
clc
rts

endsub:
rts
