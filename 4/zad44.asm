; nasm -felf64 -F dwarf -g zad4.asm -o zad4.o && ld -m elf_x86_64  zad4.o -o zad4 && ./zad4

%include "asm64_io.inc"

segment .data
hex db "0123456789ABCDEF", 00h

segment .bss

segment .text
global asm_main
asm_main:
  enter 0,0

  push 123
  call dec_to_hex
  pop rcx ; liczba elementow tablicy

  petla:
    pop rax
    call print_char
    loop petla
  call print_nl

mov rax, 0
leave
ret


dec_to_hex:
  pop r8; return addr
  pop rax ; tab dec integer

  xor r9, r9
  loop:
    xor rdx, rdx ; modulo
    mov rbx, 16
    idiv rbx

    mov ecx, [hex+rdx]
    push rcx
    inc r9

    cmp rax, 0
    jne loop
    push r9
    push r8 ; push return address
  ret; powrót do procedury wołającej
