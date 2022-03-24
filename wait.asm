init_wait_sub:
ldx #$00
sty $fd

wait_sub:
inx
cpx $fd
beq wait_end
jmp wait_sub

wait_end:
rts