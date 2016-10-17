; wersja NASM na system 64-bitowy (x86-64)
; kompilacja: nasm -felf64 hello.asm -o hello.o
; linkowanie: ld hello.o -o hello
; linkowanie: ld -m elf_x86_64  hello.o -o hello

section .text            ; początek sekcji kodu.

global _start            ; linker ld domyślnie rozpoczyna
                         ; wykonywanie programu od etykiety _start
                         ; musi ona być widoczna na zewnątrz (global)
_start:                   ; punkt startu programu
  mov rdi, 0  ; czytanie z klawiatury
  mov rsi, imie
  mov rdx, dlugoscimie
  syscall
  
  mov r9, rax
  sub r9, 1

  mov     rax, 1          ; numer funkcji systemowej:
                          ; 1=sys_write - zapisz do pliku
  mov     rdi, 1          ; numer pliku, do którego piszemy.
                          ; 1 = standardowe wyjście = ekran
  mov     rsi, tekst      ; RSI = adres tekstu
  mov     rdx, dlugosc    ; RDX = długość tekstu
  syscall                 ; wywołujemy funkcję systemową
  
  mov     rax, 1 
  mov     rdi, 1 
  mov     rsi, imie      ; RSI = adres tekstu
  mov     rdx, r9    	; RDX = długość tekstu
  syscall   

  mov     rax, 60         ; numer funkcji systemowej
                          ; (60=sys_exit - wyjdź z programu)
  syscall                 ; wywołujemy funkcję systemową

section .data                   ; początek sekcji danych.
  tekst db "Czesc "    	; nasz napis, który wyświetlimy
  dlugosc equ $ - tekst   ; długość napisu
  imie db "                    "
  dlugoscimie equ $ - imie 

  
