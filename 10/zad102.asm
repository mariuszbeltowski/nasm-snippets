section .data

section .bss

section .text

global diff
global gradientSSE

; nasm -f elf64 zad102.asm -o zad102.o && g++ -m64 -o main102.o -c main102.cpp && g++ -m64 main102.o zad102.o -o zad102 && ./zad102

; void gradientSSE(float *grad, float * data, int N);
gradientSSE:
; rdi - grad
; rsi - data
; rdx - n
  push	rbp
  mov	rbp, rsp
  xor rax, rax

  mov rax, rdx ;n
  sub rax, 2 ;n-2

  and rax, -3
  xor rcx, rcx

  ;grad[i] = sqrt( (data[i+1] - data[i-1])^2 + (data[i+N] - data[i-N])^2)
  looper:
    movups xmm0, [rsi + rcx*4 + 4] ;data[i+1]
    movups xmm1, [rsi + rcx*4 - 4] ;data[i-1]
    subps xmm0, xmm1 ;xmm0=xmm0-xmm1
    mulps xmm0, xmm0 ;xmm0=xmm0^2

    xor r8, r8
    mov r8, rcx
    xor r9, r9
    mov r9, rcx
    add r8, rdx ;i+n
    sub r9, rdx ;i-n

    ;grad[i] = sqrt( (data[i+1] - data[i-1])^2 + (data[i+N] - data[i-N])^2)
    movups xmm1, [rsi + r8*4] ;data[i+n]
    movups xmm2, [rsi + r9*4] ;data[i-n]
    subps xmm1, xmm2
    mulps xmm1, xmm1

    addps xmm0, xmm1
    sqrtps xmm0, xmm0
    movups [rdi + rcx*4], xmm0

    inc rcx
    cmp rcx, rax
    jl looper ;rcx<n-2

  koniec:
  xor rax, rax
  leave
  ret
