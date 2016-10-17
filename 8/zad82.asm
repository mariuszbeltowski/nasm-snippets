section .data
section .bss
section .text

global wartosc

wartosc:
;= a*x+b
  ; xmm0 -a
  ; xmm1 -b
  ; xmm2 -x
  mulsd xmm0, xmm2
  addsd xmm0, xmm1

 mov rax, 1

ret
