section .data

section .bss

section .text

global diff

; nasm -f elf64 zad101.asm -o zad101.o && g++ -m64 -o main101.o -c main101.cpp && g++ -m64 main101.o zad101.o -o zad101 && ./zad101

; void diff(char *out,char *wiersz1,char *wiersz2,int n);
diff:
;rdi - out
;rsi - row1
;rdx - row2
;rcx - n
  xor rax, rax
  xor r8, r8

  mov rax, rcx
  mov r8, rcx ;count

  and rax, -3
  mov rcx, 0

  .vector:
    movdqu xmm0, [rsi+rcx] ;row1
    movdqu xmm1, [rdx+rcx] ;row2
    psubb xmm0, xmm1
    movdqu [rdi+rcx], xmm0 ;save
    add rcx, 16 ;repeat
    cmp rcx, rax
    jl .vector

  .scalar:
    cmp rcx, r8
    jae .end
    movdqu xmm0, [rsi+rcx] ;row1
    movdqu xmm1, [rdx+rcx] ;row2
    psubb xmm0, xmm1
    movss [rdi+rcx], xmm0
    inc rcx
    jmp .scalar

  .end:
  xor rax, rax
  ret
