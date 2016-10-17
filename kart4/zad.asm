section .data

section .bss

section .text

global oblicz

; nasm -f elf64 zad.asm -o zad.o && g++ -m64 -o main.o -c main.cpp && g++ -m64 main.o zad.o -o zad && ./zad

;extern "C" void oblicz(int n, float *wynik, float x, float * a);
;wynik[i] = (dane[i]-x)*(x*x);
; void diff(char *out,char *wiersz1,char *wiersz2,int n);
oblicz:
;rdi - n
;rsi - wyniki
;rdx - x
;rcx - dane

  push rdi
  push rcx
  pop rdi
  pop rcx

  looper:
    movups xmm0, [rdi+rcx]
    movups [rsi+rcx], xmm0
  loop looper

  ;xor rax, rax
  ;xor r8, r8
  ;mov rax, rcx
  ;mov r8, rcx ;count
  ;and rax, -3
  ;mov rcx, 0

  ;.vector:
  ;  movdqu xmm0, [rsi+rcx] ;row1
  ;  movdqu xmm1, [rdx+rcx] ;row2
  ;  psubb xmm0, xmm1
  ;  movdqu [rdi+rcx], xmm0 ;save
  ;  add rcx, 16 ;repeat
  ;  cmp rcx, rax
  ;  jl .vector

;  .scalar:
;    cmp rcx, r8
;    jae .end
;    movdqu xmm0, [rsi+rcx] ;row1
;    movdqu xmm1, [rdx+rcx] ;row2
;    psubb xmm0, xmm1
;    movss [rdi+rcx], xmm0
;    inc rcx
  ;  jmp .scalar

  ;.end:
  ;xor rax, rax
  ret
