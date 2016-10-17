; nasm -felf64 -F dwarf -g zad4.asm -o zad4.o && ld -m elf_x86_64  zad4.o -o zad4 && ./zad4

%include "asm64_io.inc"

segment .data
s1 dw "abcdefghijklmnopqrstuvwxyz", 00h
s1_length equ $ - s1
s2 dw "zyxwvutsrqponmlkjihgfedcba", 00h
s2_length equ $ - s2
compare db "Comparing: ", 00h
founds db "found", 00h
notfound db "not found", 00h
;input db "                    ", 00h

segment .bss
input resb 100
inputLength resb 1

segment .text
global asm_main
asm_main:
  enter 0,0


  mov rax, 0
  mov rdi, 0
  mov rsi, input
  mov rdx, 100
  syscall

  dec eax
  mov [inputLength], eax

; print string length
  mov eax,  [inputLength]
  call println_int


; iterate over input
  xor r8d, r8d
Next:
  ; input char
  ;lea rdx, [input + r8d]
  mov r9d, [input + r8d]

  mov eax, r9d
  ;call println_char
  ; iterate and replace
  mov rcx, s1_length ; liczba elementów tablicy
  dec rcx
  mov r11, s1
  iterate:
    mov al, [r11 + rcx -2]
    ;call print_char

    cmp al, r9b
    je found

    loop iterate


  ; not found
  ;mov eax, notfound
  ;call println_string
  mov eax, r9d
  call print_char
  jmp iterator_exit

  found:
  ;mov eax, founds
  ;call println_string
  mov r11, s2
  mov r12, s2_length
  mov al, [r11 + rcx - 2]
  call print_char


  iterator_exit:
  inc r8d
  cmp r8d, [inputLength]
  jne Next



end:

call print_nl

mov rax, 0
leave
ret
