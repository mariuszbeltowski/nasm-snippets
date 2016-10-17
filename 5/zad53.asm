BITS 32
section .text

global sortuj        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma

sortuj:
push   ebp                    ;KONWENCJA!!! - tworzymy ramkę stosu na początku funkcji
mov    ebp, esp

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.

%idefine    a    [ebp+8]
%idefine    b    [ebp+12]
%idefine    c    [ebp+16]

; tu zaczyna się właściwy kod funkcji

mov eax, a
mov ebx, b
mov ecx, c

; replace
; 1 2, 1 3, 2 3

; compare 1 to 2
mov esi, [eax]
mov edi, [ebx]
cmp esi, edi
jng step1
mov [eax], edi
mov [ebx], esi
step1:

mov esi, [eax]
mov edi, [ecx]
cmp esi, edi
jng step2
mov [eax], edi
mov [ecx], esi
step2:

mov esi, [ebx]
mov edi, [ecx]
cmp esi, edi
jng step3
mov [ebx], edi
mov [ecx], esi
step3:
; tu kończy się właściwy kod funkcji

leave                            ; LEAVE = mov esp, ebp / pop ebp - konwencjonalne zakończenie procedury
ret
