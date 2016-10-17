BITS 32

section .data
Twelve dd 12
Zero dd 0
Two dd 2

section .bss
  struct resb 2

section .text

extern printf
global tablicuj        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma

tablicuj:
push   ebp                    ;KONWENCJA!!! - tworzymy ramkę stosu na początku funkcji
mov    ebp, esp

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.
%idefine a        qword [ebp+8]
%idefine b        qword [ebp+16]
%idefine p        qword [ebp+24]
%idefine q        qword [ebp+32]
%idefine xmin     qword [ebp+40]
%idefine xmax     qword [ebp+48]
%idefine k        dword [ebp+56]
%idefine wartosci dword [ebp+60] ;*wartosci
%idefine ppi2    tword [ebp-12] ;2*p*pi
%idefine qpi2    tword [ebp-24] ;2*q*pi
%idefine ppixn2   tword [ebp-36] ;2*p*pi*xn
%idefine qpixn2   tword [ebp-48] ;2*q*pi*xn

;y=a*(sin(P*2*pi*x))^2 + b*(sin(Q*2*pi*x))^2
sub esp, 48
push ebx
push esi
finit

fld qword xmax
fld qword xmin
fsubp ; xmax-xmin
fild dword k
fld1
fsubp
fdivp ; diff = dlp/(k-1)
; diff
fldpi ; pi
fmulp ; pi*diff

fild dword [Two] ; 2, pi*diff
fmulp ; 2*pi*diff

; calculate ppi2 qpi2
fld p
fmul st1 ; 2*p*pi*diff, 2*pi*diff
fstp tword ppi2 ; ppi2 = 2*p*pi*diff
; 2*pi*diff
fld q
fmulp
fstp tword qpi2 ; qpi2 = 2*q*pi*diff
; empty stack

; calculate x0
fldpi ; pi
fild dword [Two] ; 2, pi
fmulp ; 2*pi
fld xmin
fmulp ; 2*pi*xmin

fld p
fmul st1 ; 2*pi*xmin*p, 2*pi*xmin
fstp tword ppixn2 ; 2*pi*xmin

fld q
fmulp ; 2*pi*xmin*q, 2*pi*xmin
fstp tword qpixn2
; empty stack

; prepare loop
mov ecx, k
mov ebx, wartosci
for:
  fld ppixn2
  fsin ; sin(ppixn2)
  fmul st0, st0 ; sin(ppixn2)^2
  fld a ; a, sin(ppixn2)^2
  fmulp ; a*(sin(ppixn2)^2)

  fld qpixn2
  fsin ; sin(qpixn2), a*(sin(ppixn2)^2)
  fld qpixn2
  fsin
  fmulp ; sin(qpixn2)^2, a*(sin(ppixn2)^2)
  fld b ; b, sin(qpixn2)^2, a*(sin(ppixn2)^2)
  fmulp ; b*(sin(qpixn2)^2), a*(sin(ppixn2)^2)
  faddp ; a*(sin(ppixn2)^2) + b*(sin(qpixn2)^2)

  fstp qword [ebx] ; wartosci[i] = a*(sin(ppixn2)^2) + b*(sin(qpixn2)^2)
  ; empty stack
  add ebx, 8 ; ebx = wartosci[i+1]

  ;; new vars
  fld ppixn2 ; ppixn2, ppi2
  fld ppi2 ; ppi2

  faddp ; ppixn2+ppi2
  fstp tword ppixn2 ; ppixn2 = ppixn2+ppi2
  ; empty stack
  fld qpixn2 ; qpixn2, qpi2
  fld qpi2 ; qpi2
  faddp ; qpixn2+qpi2
  fstp tword qpixn2 ; qpixn2 = qpixn2+qpi2
  ; empty stack
  loop for ; ecx-- i jpm for

end:
finit
pop esi
pop ebx
mov esp, ebp
pop ebp
ret
