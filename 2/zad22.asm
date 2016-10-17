; nasm -felf64 -F dwarf -g zad4.asm -o zad4.o && ld -m elf_x86_64  zad4.o -o zad4 && ./zad4

%include "asm64_io.inc"

segment .data

segment .bss
liczba resq 1

segment .text
global asm_main
asm_main:
  enter 0,0

; read from keyboard
  call read_int
  mov [liczba], eax

; main loop from 2 to primary-1
  mov ebx, 1 ; b=1
  mov eax, 0 ; suma=1
petla_start:
  add eax, ebx ; suma +=b
  ;call println_int
  mov r8d, eax ; suma

  ;div primary by suma
  mov r9d, r8d
  xor edx, edx
  mov eax, [liczba]
  mov ecx, r9d
  div ecx
  ;mov [ldiv], eax
  ;mov [lmod], edx
  ; end of div

  ;print modulo
  ;mov eax, edx
  ;call println_int
  cmp edx, 0
  jne .loop_end

  mov eax, r8d
  call println_int

.loop_end:
  mov eax, r8d
  cmp eax, [liczba]
  jne petla_start


mov rax, 0 ; kod zwracany z funkcji
leave
ret
