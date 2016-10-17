; nasm -felf64 -F dwarf -g zad4.asm -o zad4.o && ld -m elf_x86_64  zad4.o -o zad4 && ./zad4

%include "asm64_io.inc"

segment .data

segment .bss
liczba1 resq 1
liczba2 resq 1
iloczyn resq 1

segment .text
global asm_main
asm_main:
  enter 0,0

; read from keyboard
  call read_int
  mov [liczba1], eax

; read from keyboard
  call read_int
  mov [liczba2], eax

; iloczyn
  mov esi, [liczba1]
  mov eax, [liczba2]
  mul esi
  mov [iloczyn], eax

; print
  ;mov eax, [iloczyn]
  ;call println_int

loop:
  ; if liczba1>liczba2 then liczba1-=liczba2
  mov r8d, [liczba1]
  mov r9d, [liczba2]
  cmp r8d, r9d
  ja if
  jbe else

  if:
  sub r8d, r9d
  mov [liczba1], r8d
  jmp end_if

  else:
  sub r9d, r8d
  mov [liczba2], r9d
  jmp end_if

  end_if:
  ; while
  mov r8d, [liczba1]
  mov r9d, [liczba2]
  cmp r8d, r9d
  jne loop

  ;mov eax, r8d
  ;call println_int

  ;mov eax, [iloczyn]
  ;call println_int

; div iloczyn by liczba1
  xor edx, edx
  mov eax, [iloczyn]

  mov ecx, r8d
  div ecx
  ;mov [ldiv], eax
  ;mov [lmod], edx

  call println_int

mov rax, 0 ; kod zwracany z funkcji
leave
ret
