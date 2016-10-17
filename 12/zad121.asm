section .data
one dd 1.0
zero dd 0.0
x dd 0.0

;nasm -f elf64 zad121.asm -o zad121.o && g++ -m64 -o main121.o -c main121.cpp && g++ -m64 main121.o zad121.o -o zad121 && ./zad121

section .text
global minmax
;minmax(int n, int * tab, int * max, int * min);
;RDI, RSI, RDX, RCX
minmax:
enter 0, 0

xor r9, r9
xor r10, r10
mov r9d, [rsi]
mov r10d, [rsi]

xor r8, r8
for:
  inc r8

  mov eax, [rsi+r8*4]

  cmp eax, r9d
  cmovg r9d, eax
  cmp eax, r10d
  cmovl r10d, eax

  cmp r8, rdi
  jle for

mov [rdx], r9d
mov [rcx], r10d

leave
ret
