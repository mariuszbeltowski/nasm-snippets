BITS 32

;nasm -felf32 zad121x32.asm -o zad121x32.o && gcc -m32 -o zad121x32.o -c main121.c && gcc -m32 main121.o zad121x32.o -o zad121x32 && ./zad121x32
;nasm -felf32 zad121x32.asm -o zad121.o && gcc -m32 -o main121.o -c main121.c && gcc -m32 main121.o zad121.o -o zad121 && ./zad121
section .data

section .text

global minmax        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma

;minmax(int n, int * tab, int * max, int * min);
;RDI, RSI, RDX, RCX
minmax:
push   ebp                    ;KONWENCJA!!! - tworzymy ramkę stosu na początku funkcji
mov    ebp, esp

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.

%idefine n dword [ebp+8]
%idefine tab dword [ebp+12]
%idefine max dword [ebp+16]
%idefine min dword [ebp+20]
;push ebx
;push edi
;push esi
;edx
; tu zaczyna się właściwy kod funkcji

mov edi, n
sub edi, 1
sub edi, 1
mov eax, tab
mov ebx, [eax];tab0
mov edx, [eax];tab0

xor ecx, ecx; counter
mov esi, tab
for:
  add ecx, 1

  mov eax, [esi+ecx*4]

  cmp eax, ebx
  cmovg ebx, eax
  cmp eax, edx
  cmovl edx, eax

  cmp ecx, edi
  jle for

mov eax, min
mov [eax], edx;min
mov eax, max
mov [eax], ebx;max

;pop esi
;pop edi
;pop ebx
pop ebp

;leave                            ; LEAVE = mov esp, ebp / pop ebp - konwencjonalne zakończenie procedury
ret
