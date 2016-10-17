BITS 32
section .data
Two dw 2

section .text

global prostopadloscian

prostopadloscian:
push   ebp
mov    ebp, esp

%define a dword [ebp+8]
%define b dword [ebp+12]
%define c dword [ebp+16]
%define objetosc dword [ebp+20]
%define pole dword [ebp+24]

fld a
fld b
fld c ; a, b, c
fmulp st1
fmulp st1 ; abc
mov eax, objetosc ; ładuję adres objetosc do rejestru
fstp dword [eax] ; ściągam ze stosu do *objetosc

fild word [Two]
fld a
fld b
fmulp st1
fmulp st1 ; 2ab

fild word [Two]
fld b
fld c
fmulp st1
fmulp st1 ; 2ab, 2bc
faddp st1 ; 2ab + 2bc

fild word [Two]
fld a
fld c
fmulp st1
fmulp st1 ; 2ab + 2bc, 2ac
faddp st1 ; 2ab + 2bc + 2ac
mov eax, pole ; ładuję adres objetosc do rejestru
fstp dword [eax]

leave                            ; LEAVE = mov esp, ebp / pop ebp - konwencjonalne zakończenie procedury
ret
