section .data
one dd 1.0
zero dd 0.0
x dd 0.0

;nasm -f elf64 zad.asm -o zad.o && g++ -m64 -o main.o -c main.cpp && g++ -m64 main.o zad.o -o zad && ./zad

section .text
global sumuj
;RDI, RSI, RDX, RCX, R8, R9
sumuj:
	enter 0, 0
	;xmm0 - x
	;rsi - tab
	;rdi - n
  mov rcx, 0 ; i = 0
  movss xmm2, dword [one]  ; xmm2 = 1
  movss xmm3, dword [zero]  ; xmm2 = 1

  looper:
    movss xmm1, dword[rsi + rcx*4] ; xmm1 - tab[0]
    mulss xmm1, xmm2				; xmm1 = xmm1 * xmm2
    addss xmm3, xmm1
    inc rcx  ; rcx ++
    addss xmm2, dword[one]
    ;mov [x], rcx
    ;mulss xmm2, dword[x]

    ;mulss xmm1, xmm2
    ;addss xmm0, xmm1

  cmp rcx, rdi
  jl looper

  divss xmm3, xmm0
  movss xmm0, xmm3

  leave
  ret
