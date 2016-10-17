;KOMPILACJA:  plik źródłowy c_asm.asm
;nasm -o zad51.obj -felf32 zad51.asm && gcc -m32 zad51.obj -o zad51
;gcc -m32 zad51.obj -o zad51
section .data
napis: db "Wynik to: %d", 10, 0
napis_scanf: db "%d", 0

segment .bss
inta: resd 1
intb: resd 1


section .text

extern printf          ; definicja funkcji printf znajduje się w bibliotece standardowej C
extern scanf

global main
main:                  ; punkt wejścia - funkcja main


push dword inta
push dword napis_scanf
call scanf
add esp, 2*4

push dword intb
push dword napis_scanf
call scanf
add esp, 2*4

mov eax, [inta]
mov edx, [intb]

mul edx
                        ; printf("Liczba jeden to: %d\n", 1);
push   dword eax          ; drugi argument
push   dword napis      ; pierwszy argument - UWAGA na właściwą kolejność argumentów wołanej funkcji
                        ; pierwszy argument funkcji dodajemy na stos jako ostatni!!!

call   printf          ; uruchomienie funkcji
add    esp, 2*4         ; posprzątanie stosu - rejestr ESP wskazuje to samo, co przed wywołaniem
                        ; funkcji printf

xor    eax, eax         ; return 0;
ret                     ; wyjście z programu
