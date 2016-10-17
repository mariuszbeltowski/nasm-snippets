; nasm -felf64 -F dwarf -g zad4.asm -o zad4.o && ld -m elf_x86_64  zad4.o -o zad4 && ./zad4

%include "asm64_io.inc"

segment .data
tab dd 1,2,3,9,4,5,6,14,7,8,1
tab_length equ $ - tab
tab2 db "looool",00h
max db "this is max",00h

segment .bss


segment .text
global asm_main
asm_main:
  enter 0,0

  push tab
  push 11
  call get_max ; saving max to rax
  call println_int ; print max element

mov rax, 0
leave
ret

get_max:
  pop rax; return addr
  pop r8 ; tab elems
  pop r9 ; tab pointer
  push rax ; push return address

  mov r12, 0
  mov rcx, r8 ; liczba elementów tablicy
  iterate:
    mov eax, [r9 + 4*rcx - 4]

    cmp r12, rax
    jge iterate_end

    mov r12, rax ; move actual value to max

    iterate_end:
    loop iterate

    mov rax, r12
    ret; powrót do procedury wołającej
