; nasm -felf64 -F dwarf -g zad4.asm -o zad4.o && ld -m elf_x86_64  zad4.o -o zad4 && ./zad4
%include "asm64_io.inc"

segment .data

segment .bss
input1 resd 1
input2 resd 1

segment .text
global asm_main
asm_main:
  enter 0,0

;sum
  mov ebx, input1             ; ładujemy adres input1 do ebx
  mov ecx, ret1               ; łądujemy adres etykiety ret1 do ecx - do tej etykiety nastąpi powrót z procedury
  jmp short get_int           ; wywołanie procedury get_int

  ret1:

  mov ebx, input2
  mov ecx, $ + 7               ; ecx = adres bieżący + 7
                               ; jest to adres pierwszego bajtu instrukcji do której wracamy z procedury get_int
                                                                 ;  musimy znać ilość bajtów ile zajmie na danej maszynie kod maszynowy instrukcji jmp co czyni ten kod nieprzenaszalnym
  jmp short get_int

  mov r8, [input1]
  mov r9, [input2]
  add r8, r9

  mov rax, r8
  call println_int
  jmp end


  ; subprogram get_int
  ; Parametry:
  ; ebx - adres podwójnego słowa,w którym przechowywana będzie wczytana liczba
  ; ecx - adres instrukcji powrotu
  get_int:
  call read_int
  mov [ebx], eax                  ; zapisujemy dane wejściowe do pamięci
  jmp rcx                         ; powrót do procedury wołającej


  end:
mov rax, 0
leave
ret
