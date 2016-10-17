BITS 32

section .data
napis: db "Min to: %d, Max to: %d", 10, 0
debug: db "int: %d   ", 0

section .bss
  struct resb 2

section .text

extern printf
global minmax        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma

minmax:
push   ebp                    ;KONWENCJA!!! - tworzymy ramkę stosu na początku funkcji
mov    ebp, esp

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.

%idefine    struct   [ebp+8] ; struct address
%idefine    count    [ebp+12] ; first argument
%idefine    a        [ebp+16]

; tu zaczyna się właściwy kod funkcji

mov ecx, count ; tab count
mov esi, a ;max
mov ebx, a ;min

looper:
  mov edx, [ebp + 4*ecx + 12]

  ;find max
  cmp edx, esi
  jng notgreater
  mov esi, edx
  notgreater:

  ;find min
  cmp edx, ebx
  jnl notlesser
  mov ebx, edx
  notlesser:
  loop looper

mov eax, struct ; get struct address
mov [eax], ebx ; save min to struct
mov [eax+4], esi ; save max to struct

leave                            ; LEAVE = mov esp, ebp / pop ebp - konwencjonalne zakończenie procedury
ret
