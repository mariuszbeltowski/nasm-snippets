BITS 32
section .data
Twelve dw 12
Zero dw 0
One dw 1

section .text

global iloczyn_skalarny        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma

iloczyn_skalarny:
push   ebp                    ;KONWENCJA!!! - tworzymy ramkę stosu na początku funkcji
mov    ebp, esp

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.

%idefine   count    [ebp+8]
%idefine   vectorx  [ebp+12]
%idefine   vectory  [ebp+16]

push ebx
push esi

mov ecx, count
mov ebx, vectorx
mov esi, vectory

cmp ecx, 0
je end

fldz
looper:

  ;set address vector to eax
  mov eax, ecx
  mul dword [Twelve]
  sub eax, 12

  ;push values from two vectors
  fld tword [ebx+eax]
  fld tword [esi+eax]

  ;mul them
  fmulp st1
  ;add them
  faddp st1

  loop looper
;eax, ecx, edx

end:
pop esi
pop ebx

leave                            ; LEAVE = mov esp, ebp / pop ebp - konwencjonalne zakończenie procedury
ret
