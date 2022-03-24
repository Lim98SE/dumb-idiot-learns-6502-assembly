init:
lda #$20
sta $2000
jsr repinc
stx $ff

repinc: ; Always preserve X before 
        ; using!
cpx $2000
beq repend
inx
jmp repinc

repend:
rts