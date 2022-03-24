playsnd:
lda #$00
sta $d405
lda #$f0
sta $d406
lda #%01000001
sta $d404
ldx #$ff
jsr wait
lda #%01000000
sta $d404
ldx #$ff
jsr wait
jmp playsnd

wait:
cpx #0
beq endsub
dex
jmp wait

endsub:
rts