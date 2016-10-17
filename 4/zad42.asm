; nasm -felf64 -F dwarf -g zad4.asm -o zad4.o && ld -m elf_x86_64  zad4.o -o zad4 && ./zad4

%include "asm64_io.inc"

segment .data
array db 'afbcfdefghijk', 00h

segment .bss
elementsCount resb 1

segment .text
global asm_main
asm_main:
  enter 0,0

  mov rax, 0

  petla1:
    push rax

    call read_int

    cmp rax, 0
    jne petla1

  ; read higher
  call read_int
  mov r8, rax

  ; counter
  mov r9, 0

  petla2:
    pop rax

    cmp rax, r8
    jle petla2_end ; if not higher then max, jump
    inc r9  ; else inc counter

    petla2_end:
    cmp rax, 0
    jne petla2


end:
  mov rax, r9
  call println_int

mov rax, 0
leave
ret
