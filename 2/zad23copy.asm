; nasm -felf64 -F dwarf -g zad4.asm -o zad4.o && ld -m elf_x86_64  zad4.o -o zad4 && ./zad4

%include "asm64_io.inc"

segment .data

segment .bss
liczba1 resq 1
liczba2 resq 1
tmp1 resq 1
tmp2 resq 1
iloczyn1 resq 1
iloczyn2 resq 1
div1 resq 1
div2 resq 1

segment .text
global asm_main
asm_main:
  enter 0,0

; read from keyboard
  call read_int
  mov [liczba1], eax

; read from keyboard
;  call read_int
;  mov [liczba2], eax

  mov al, 1
  mov [iloczyn1], al
  mov [iloczyn2], al

;; zew loop
petla_zew_start1:


;; main loop from 2 to liczba1
  mov r8d, 1 ; suma=1
petla_wew_start1:
  mov eax, r8d
  add eax, 1 ; suma += 1
  ;call println_int
  mov r8d, eax ; suma

  ;div primary by suma
  xor edx, edx
  mov eax, [liczba1]
  cmp eax, 1
  je petla_wew_exit1

  mov ecx, r8d
  div ecx
  ;mov [ldiv], eax
  ;mov [lmod], edx
  ; end of div
  mov [div1], eax
  mov [tmp1], r8d


  ; if mod != 0 jump to next iteration
  cmp edx, 0
  jne petla_wew_start1
petla_wew_exit1:
;; end wew loop



  ;set liczba as div result
  mov r10d, [div1]
  mov [liczba1], r10d

  mov eax, [tmp1]
  call println_int

  mov esi, [tmp1]
  mov eax, [iloczyn1]
  mul esi
  mov [iloczyn1], eax

  mov eax, [div1]
  ;call println_int

  mov r10d, [liczba1]
  cmp r10d, 1
  jne petla_zew_start1

  mov eax, [iloczyn1]
  call println_int

mov rax, 0 ; kod zwracany z funkcji
leave
ret
