BITS 32             ;( 1)
section .text       ;( 2)
global wylicz       ;( 3)
wylicz:             ;( 4)
  enter 8, 0        ;( 5)
  push ebx          ;( 6)
  mov  ecx, 5       ;( 7)
  lea  ebx, [ebp+8] ;( 8)
  fld1              ;( 9)
petla:              ;(10)
  fld  qword [ebx]  ;(11)
  fcomi st0, st1    ;(12)
  jae nieZmieniaj   ;(13)
  fxch st1          ;(14)
nieZmieniaj:        ;(15)
  add  ebx, 8       ;(16)
  loop petla        ;(17)
  fxch st5          ;(18)
  mov ecx, 4        ;(19)
petla2: fmulp       ;(20)
  loop petla2       ;(21)
  fxch st1          ;(22)
  mov ebx, [ebx]    ;(23)
  fstp qword [ebx]  ;(24)
  pop ebx           ;(25)
  leave             ;(26)
  ret               ;(27)
