BITS 32


section .data
MinusFour dw -4

section .text

global wartosc        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma

wartosc:
push   ebp                    ;KONWENCJA!!! - tworzymy ramkę stosu na początku funkcji
mov    ebp, esp

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.

%idefine a qword [ebp+8]
%idefine b qword [ebp+16]
%idefine c qword [ebp+24]
%idefine d qword [ebp+32]
%idefine x qword [ebp+40]

; tu zaczyna się właściwy kod funkcji

; ax3+bx2+cx+d

fld d ; d
fld x ; d x
fld c ; d x c
fmulp st1 ; d x*c
faddp st1 ; cx + d
fld x ; cx + d, x
fld x ;  cx + d, x, x
fld b ;  cx + d, x, x, b
fmulp st1 ; cx+d, x, xb
fmulp st1 ; cx + d, x^2b
faddp st1 ; x^2b+cx+d
fld a ; x^2b+cx+d, a
fld x ; x^2b+cx+d, a, x
fld x ; x^2b+cx+d, a, x, x
fld x ; x^2b+cx+d, a, x, x, x
fmulp st1 ; x^2b+cx+d, a, x, x^2
fmulp st1 ; x^2b+cx+d, a, x^3
fmulp st1 ; x^2b+cx+d, ax^3
faddp st1 ; ax^3+x^2b+cx+d

; tu kończy się właściwy kod funkcji

leave                            ; LEAVE = mov esp, ebp / pop ebp - konwencjonalne zakończenie procedury
ret
