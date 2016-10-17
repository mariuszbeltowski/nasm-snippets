; nasm -felf64 -F dwarf -g zad4.asm -o zad4.o && ld -m elf_x86_64  zad4.o -o zad4 && ./zad4

section .text

global _start

_start:
  ; get sys time
  mov rax, 201
  mov rdi, time ; second from 01.01.1970
  syscall

  ; get 1 second
  xor edx, edx
  mov eax, [time]
  mov ecx, 10

  div ecx
  mov [time], eax
  mov [ls1], edx

  mov al, [ls1]
  add al, 48
  mov [format+format_size-2], al ; add to format

  ; get 2 second
  xor edx, edx
  mov eax, [time]
  mov ecx, 6

  div ecx
  mov [time], eax
  mov [ls1], edx

  mov al, [ls1]
  add al, 48
  mov [format+format_size-3], al ; add to format

  ; get 1 minute
  xor edx, edx
  mov eax, [time]
  mov ecx, 10

  div ecx
  mov [time], eax
  add dl, 48
  mov [format+format_size-5], dl ; add to format

  ; get 2 minute
  xor edx, edx
  mov eax, [time]
  mov ecx, 6

  div ecx
  mov [time], eax
  add dl, 48
  mov [format+format_size-6], dl ; add to format

  ; get 1 hour
  xor edx, edx
  mov eax, [time]
  mov ecx, 10

  div ecx
  mov [time], eax
  add dl, 48
  mov [format+format_size-8], dl ; add to format

  ; get 2 hour
  xor edx, edx
  mov eax, [time]
  mov ecx, 3

  div ecx
  mov [time], eax
  add dl, 48
  mov [format+format_size-9], dl ; add to format


  ; print format
  mov     rax, 1
  mov     rdi, 1
  mov     rsi, format
  mov     rdx, format_size
  syscall

  mov rax, 60
  syscall

section .bss
  time: resb 32
  ls1: resb 4

section .data
  format db "XX:XX:XX", 0ah
  format_size equ $ - format
