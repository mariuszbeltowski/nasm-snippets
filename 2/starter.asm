%include "asm64_io.inc"

segment .data
;
; dane zainicjalizowane
;
tekst db "OK",0

segment .bss
;
; dane niezainicjalizowane
;

segment .text
global asm_main
asm_main:
 enter 0,0


; petla for
mov rcx, 5 ; ole razy ccemy wykonac
.for:
  mov rax, rcx
  call println_int

  loop .for  ; kropka przed etykieta oznacza ze jest lokalna

;sumowanie
mov rcx, 8 ; ole razy ccemy wykonac
mov rbx, 0
for2:
  mov rax, rcx
  call println_int
  add rbx, rcx
  cmp rbx, 20 ; odejmowanie dwoch liczb
  ja koniec ; jump above

  loop for2
koniec:

cmp rbx, 21
jnz else ; jezeli nie jest rowne
mov eax, tekst
call println_string

jmp koniec2
else:
mov rax, rbx
call println_int

koniec2:
; ----
; Właściwy kod wstawiamy tu.
; Nie należy modyfikować kodu przed i po tym komentarzu

; ---

mov rax, 0 ; kod zwracany z funkcji
leave
ret
