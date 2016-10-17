; nasm -felf64 zad2.asm -o zad2.o && ld -m elf_x86_64  zad2.o -o zad2 && ./zad2
; nasm -felf64 -F dwarf -g zad2.asm -o zad2.o && ld -m elf_x86_64  zad2.o -o zad2 && ./zad2
; break _start
; run user input
; stepi
; layout regs
; p $rax, info register rax

section .text

global _start

_start:
; read from keyboard
  mov rax, 0
  mov rdi, 0
  mov rsi, input1
  mov rdx, 2
  syscall

  xor r8, r8
  xor al, al
  mov r8, input1	; initialize the source index
  mov al, [r8] ; al is a 1 byte register
  sub al, 48 ; convert ascii do "digit"
  mov [liczba1], al

; read from keyboard
  mov rax, 0
  mov rdi, 0
  mov rsi, input2
  mov rdx, 2
  syscall

  xor r8, r8
  xor al, al
  mov r8, input2	; initialize the source index
  mov al, [r8] ; al is a 1 byte register
  sub al, 48 ; convert ascii do "digit"
  mov [liczba2], al


; add
  xor al, al
  mov al, 0
  add al, [liczba1]
  add al, [liczba2]
  mov [suma], al

;div
  xor edx, edx
  mov eax, [suma]
  mov ecx, 10

  div ecx
  mov [ldiv], eax
  mov [lmod], edx

;prepare to print
  xor r10, r10
  mov r10, [ldiv]
  add r10, 48
  mov [ldiv], r10

  xor r10, r10
  mov r10, [lmod]
  add r10, 48
  mov [lmod], r10

; print
  mov     rax, 1
  mov     rdi, 1
  mov     rsi, ldiv
  mov     rdx, 1
  syscall

; print
  mov     rax, 1
  mov     rdi, 1
  mov     rsi, lmod
  mov     rdx, 1
  syscall


  mov rax, 60
  syscall

section .bss
  	liczba1: resb 1
    liczba2: resb 1
    input1: resb 2
    input2: resb 2
    ldiv: resb 1
    lmod: resb 1
    suma: resb 2
    wynik: resb 2
