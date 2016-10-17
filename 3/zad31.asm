; nasm -felf64 -F dwarf -g zad4.asm -o zad4.o && ld -m elf_x86_64  zad4.o -o zad4 && ./zad4

%include "asm64_io.inc"

segment .data
array times 100 dw 0

segment .bss
elementsCount resb 1

segment .text
global asm_main
asm_main:
  enter 0,0

; read from keyboard
  call read_int
  mov [elementsCount], eax


; add to array
  mov rcx, [elementsCount] ; liczba elementów tablicy
  mov rbx, array             ; rbx = adres tablicy array2
  xor rdx, rdx                ; zerujemy dx
  fill:
  call read_int
  mov [rbx + 2*rcx -2], ax   ; dodajemy elementy od ostatniego
  loop fill


; count iloczyn
  mov rbx, array             ; rbx = adres tablicy array2
  mov rcx, [elementsCount]                  ; liczba elementów tablicy
  mov rdx, 1                ; zerujemy dx
  iloczyn:
  mov ax, [rbx + 2*rcx - 2]

  mov esi, edx
  ;mov eax, ax
  mul esi
  mov edx, eax

  ;add dx, [rbx + 2*rcx - 2]   ; dodajemy elementy od ostatniego
  loop iloczyn

  mov eax, edx
  call println_int


mov rax, 0
leave
ret
