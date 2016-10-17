%include "asm64_io.inc"

segment .data
pytanie db "Podaj dwie liczby : ", 0  ; tekst musi kończyć się zerem
wynik   db "Suma = ", 0
segment .bss

segment .text
global asm_main
asm_main:
 enter 0,0 
; ----

dump_regs 1     ; pierwsze wypisanie zawartości rejestrów

mov rax, pytanie
call print_string

call read_int   ; wczytanie liczby int
mov ebx, eax
call read_int   ; wczytanie drugiej liczby
cmp eax, ebx
dump_regs 2     ; drugie wypisanie zawartości rejestrów 
call print_nl

add eax, ebx
call println_int  ; wypisanie liczby int z rax
call print_nl


; ---
mov rax, 0 ; powrót do C
leave
ret

 
