section .data

section .bss

section .text

global _Z6kopiujPiS_j ; unsigned int
global _Z5zerujPij ; unsigned char

;void kopiuj(int * cel, int * zrodlo, unsigned int n);
_Z6kopiujPiS_j:
 ;RDI, RSI, RDX, RCX, R8, R9
mov rcx, rdx
push rsi
push rdi
pop rsi
pop rdi

  ;petla:
    rep movsd
    ;loop petla
  ret


;void zeruj(int * tablica, unsigned int n);
_Z5zerujPij:
 ;RDI, RSI, RDX, RCX,
 mov rcx, rsi
 xor rax, rax

   petla2:
     stosd
     loop petla2
   ret
