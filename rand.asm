init:
lda $200
randloop:
jsr random
jmp randloop

random:
tsx
txa
ora $200
ror $200
eor $200
sta $200
rts