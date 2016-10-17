section .data
Twelve dd 12
Zero dd 0
Two dd 2

section .bss
  struct resb 2

section .text

global iloczyn

iloczyn:

  ; rdi - a
  ; rsi - tab

  mov rcx, rdi ; counter
  mov rax, 1
looper:

  mov r9, rcx ; counter
  dec r9 ; counter-1
  mov r8, [rsi + r9*4]
  mul r8

  loop looper

  ret
