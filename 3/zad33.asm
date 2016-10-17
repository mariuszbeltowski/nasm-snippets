; nasm -felf64 -F dwarf -g zad4.asm -o zad4.o && ld -m elf_x86_64  zad4.o -o zad4 && ./zad4

%include "asm64_io.inc"

segment .data
liczba db "456", 00h
liczba_length equ $ - liczba
string db "000", 00h
string_length equ $ - string
napis db 00h

segment .bss


segment .text
global asm_main
asm_main:
  enter 0,0

  ; int to string
  mov r9, 123
  mov rcx, string_length
  dec rcx
  stringer:
    xor rdx, rdx
    mov rax, r9
    mov rbx, 10
    idiv rbx
    add rdx, 48 ; convert to ascii
    mov byte [string+rcx], dl
    mov r9, rax
    loop stringer

  mov rax, string
  call println_string


  ; string to int
  mov r8, 0
  mov rbx, liczba
  mov rcx, liczba_length
  dec rcx
  xor rax, rax
  integer:
    xor rdx,rdx
	  mov dl, [rbx + r8]
    sub edx, 48 ; convert to int from ascii
    imul eax, 10 ; result *10
    add eax, edx
    inc r8
		loop integer

  call println_int

mov rax, 0
leave
ret
