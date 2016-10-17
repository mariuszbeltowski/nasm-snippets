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

  mov eax, array
  call println_string

  mov r8d, 0

Next:
  lea rdx, [array + r8d]
  mov r9d, [array + r8d]
  ; print format
  ;mov     rax, 1
  ;mov     rdi, 1
  ;mov     rsi, rdx
  ;mov     rdx, 1
  ;syscall

  inc r8d

  cmp r9d, 0
  jne Next

; print string length
  dec r8
  mov rax, r8
  call println_int

; iterate from end
  mov rcx, r8 ; liczba elementów tablicy
  mov rbx, array             ; rbx = adres tablicy array2
fill:
  ;mov rax, rcx
  ;call println_int

  ;lea dx, [rbx + 1*rcx -1]   ; dodajemy elementy od ostatniego
  mov eax, [rbx + rcx -1]   ; signle character
  ;call println_char

  cmp al, 'f'
  je found

  loop fill

  mov rax, 0-1
  call println_int
  jmp end

found:
  dec rcx
  mov rax, rcx
  call println_int

end:

mov rax, 0
leave
ret
