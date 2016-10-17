BITS 32


section .data
One dd 1

section .text

global oblicz        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma

oblicz:
push   ebp                    ;KONWENCJA!!! - tworzymy ramkę stosu na początku funkcji
mov    ebp, esp

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.

%idefine a dword [ebp+8]
%idefine b dword [ebp+12]
%idefine x qword [ebp+16]
%idefine n dword [ebp+24]

; tu zaczyna się właściwy kod funkcji

; ax3+bx2+cx+d
;(a*x + b*x)
push ecx

mov ecx, n
finit

fild dword [One]
looper:

  fld a
  fld x
  fmulp st1
  fld b
  fld x
  fmulp st1
  faddp st1

  fmulp st1
loop looper

pop ecx

; tu kończy się właściwy kod funkcji

leave                            ; LEAVE = mov esp, ebp / pop ebp - konwencjonalne zakończenie procedury
ret
