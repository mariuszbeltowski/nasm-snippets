; nasm -felf64 -F dwarf -g zad3.asm -o zad3.o && ld -m elf_x86_64  zad3.o -o zad3

section .text

global _start

_start:
  ; open file
  mov rax, 2
  mov rdi, filename
  mov rsi, 101o ; writeonly, create file if not exists
  mov rdx, 7777o ; all rights for all
  syscall 
  mov [file_handle], rax ;save file handle - 1 byte (?)

  ; save to file
  mov rdi, [file_handle]
  mov rax, 1
  mov rsi, name
  mov rdx, name_size
  syscall

  ; close file
  mov rax, 3
  mov rdi, [file_handle]
  syscall

  mov rax, 60
  syscall

section .bss
  file_handle: resq 1 ; not sure about the fize of filehandle, better set to 8 bytes

section .data
  filename db "zad3testfile", 00h
  name db "Mariusz Beltowski"
  name_size equ $ - name
