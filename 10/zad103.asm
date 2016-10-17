section .data

section .bss
helpmem resb 24
forths resb 16
section .text

global diff
global gradientSSE
global scaleSSE

; nasm -f elf64 zad103.asm -o zad103.o && g++ -m64 -o main103.o -c main103.cpp && g++ -m64 main103.o zad103.o -o zad103 && ./zad103

;void scaleSSE(float *,float *,int);

;OUT(i,j) = (IN(2*i,2*j) + IN(2*i +1,2*j) + IN(2*i,2*j + 1) + IN(2*i + 1,2*j + 1))/4
;inline void scaleSSE(float * dest,float * source,int);
;Na wyjściu: out[i] = (in[2*i] + in[2*i+1] + in[2*i+N] + in[2*i+N+1]) / 4

scaleSSE:
 push rbp
 mov rbp, rsp

 ; rdi <- float* dest
 ; rsi <- float* source
 ; rdx <- int N

 xor rcx, rcx
 mov r10, rdx
 and r10, -3
 mov r9, rdx
 shr r9, 1
 ; compare rcx with r9
 ; actual position <- r8

 ; let's create o vector of 4s
 ; 0x40800000 - float representation of 4
 mov eax, 0x40800000
 mov [helpmem], eax
 mov [helpmem+4], eax
 mov [helpmem+8], eax
 mov [helpmem+12], eax
 movdqu xmm5, [helpmem]

 myloop:

  mov r8, rcx
  shl r8, 1
  call mysuperfunc
  movups xmm1, [helpmem]
  ; xmm1 <- 1st vector
  ; in[2*i]
  add r8, 1
  call mysuperfunc
  movups xmm2, [helpmem]
  ; xmm2 <- 2nd vector
  ; in[2*i+1]
  sub r8, 1
  add r8, rdx
  call mysuperfunc
  movups xmm3, [helpmem]
  ; xmm3 <- 3rd vector
  ; in[2*i+N]
  inc r8
  call mysuperfunc
  movups xmm4, [helpmem]
  ; xmm4 <- 4th vector
  ; in[2*i+N+1]
  addps xmm1, xmm2
  addps xmm1, xmm3
  addps xmm1, xmm4

  divps xmm1, xmm5

  movups [rdi+rcx*4], xmm1

  add rcx, 4
  cmp rcx, r10
  jl myloop

 koncowka:
  cmp rcx, rdx
  jae koniec

  mov r8, rcx
  shl r8, 1
  movss xmm1, [rsi+r8*4]
  add r8, 1
  movss xmm2, [rsi+r8*4]
  sub r8, 1
  add r8, rdx
  movss xmm3, [rsi+r8*4]
  add r8, 1
  movss xmm4, [rsi+r8*4]
  addss xmm1, xmm2
  addss xmm1, xmm3
  addss xmm1, xmm4

  divss xmm1, xmm5

  movss [rdi+rcx*4], xmm1

  inc rcx
  jmp koncowka


 koniec:

 mov rsp, rbp
 pop rbp
 ret

 mysuperfunc:
  movups xmm0, [rsi+r8*4]
  movups [helpmem], xmm0
  mov eax, [helpmem+8]
  mov [helpmem+4], eax
  ; helpmem[0] - first needed number
  ; helpmem[1] - second
  add r8, 4
  movups xmm0, [rsi+r8*4]
  sub r8, 4
  movups [helpmem+8], xmm0
  mov eax, [helpmem+16]
  mov [helpmem+12], eax
 ret
