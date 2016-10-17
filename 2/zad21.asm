; nasm -felf64 -F dwarf -g zad4.asm -o zad4.o && ld -m elf_x86_64  zad4.o -o zad4 && ./zad4

%include "asm64_io.inc"

segment .data
textOk db "Liczba jest pierwsza",0
textWrong db "Liczba nie jest pierwsza",0

segment .bss
primary resq 1
primary1 resq 1

segment .text
global asm_main
asm_main:
  enter 0,0

; read from keyboard
  call read_int
  mov [primary], eax
  mov al, [primary]
  dec al
  mov [primary1], al

; if primary is 1 or 2 then ok
  mov r10d, [primary]
  cmp r10d, 1
  je end_ok
  cmp r10d, 2
  je end_ok


; main loop from 2 to primary-1
  mov ebx, 1 ; b=1
  mov eax, 1 ; suma=1
petla_start:
  add eax, ebx ; suma +=b
  ;call println_int
  mov r8d, eax ; suma

  ;div primary by suma
  mov r9d, r8d
  xor edx, edx
  mov eax, [primary]
  mov ecx, r9d
  div ecx
  ;mov [ldiv], eax
  ;mov [lmod], edx
  ; end of div

  ;print modulo
  ;mov eax, edx
  ;call println_int

  ; if edx == 0 jump to wrong
  cmp edx, 0
  je end_wrong


  mov eax, r8d
  cmp eax, [primary1]
  jne petla_start

end_ok:
  mov eax, textOk
  call println_string
  jmp end

end_wrong:
  mov eax, textWrong
  call println_string

end:

mov rax, 0 ; kod zwracany z funkcji
leave
ret
