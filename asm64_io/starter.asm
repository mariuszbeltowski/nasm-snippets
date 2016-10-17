%include "asm64_io.inc"

segment .data
;
; dane zainicjalizowane
;

segment .bss
;
; dane niezainicjalizowane
;

segment .text
global asm_main
asm_main:
 enter 0,0 

; ----
; Właściwy kod wstawiamy tu. 
; Nie należy modyfikować kodu przed i po tym komentarzu

; ---

mov rax, 0 ; kod zwracany z funkcji
leave
ret

 
