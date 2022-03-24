init:
clc
lda #$00
tax
tay
; Goal of program:
; 1. Have a form of interaction
; 2. Have a way to add and subtract 
; numbers
; 3. Test my knowledge of assembly
lda #%0 ; 0 for add, 1 for subtract
sta $a0 ; Store it here
jsr calc_st ; Go to a subroutune
ldx #0 ; Clear X
jsr print ; Print out "done"
brk ; END

calc_st: ; Calc-init
lda $a0 ; Load the add/sub flag
ldx #4 ; First number
stx $a1 ; Store it at A1
ldx #6 ; Second number
stx $a2 ; Store it at A2
cmp #%1 ; Compare it to 1
beq sub ; If it's 1, say it's 
;         subtraction
bne add ; Otherwise, just add
rts ; Return, just in case

add: ; Add subroutine
lda $a1 ; Load A with first number
adc $a2 ; Add the second number to it
sta $a3 ; Look at A3 for result
rts ; Go back

sub: ; Subtraction subroutine
lda $a1 ; Load A with first number
sbc $a2 ; Subtract the second number
sta $a3 ; Look at A3 for result
rts ; Go back

print: ; Print subroutine
cpx #4 ; Compare X to 4 (end loop)
beq end ; If it is 4, end loop
lda endtxt,x ; Load A with the value in
;             endtxt with an offset of x    
sta $a9,x ; Store A with an offset of x
inx ; Increment X
jmp print ; Loop!

end: ; it just does rts
rts

endtxt:
.byte $44, $6F, $6E, $65 ; ASCII values ;                          for the word ;                          "done"