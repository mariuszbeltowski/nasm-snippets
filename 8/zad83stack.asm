section .data
section .bss
section .text

global iloczyn

; po wykonaniu push ebp i mov ebp, esp:
; w [ebp]    znajduje się stary EBP
; w [ebp+4]  znajduje się adres powrotny z procedury
; w [ebp+8]  znajduje się pierwszy parametr,
; w [ebp+12] znajduje się drugi parametr
; itd.
iloczyn:
push   rbp                    ;KONWENCJA!!! - tworzymy ramkę stosu na początku funkcji
mov    rbp, rsp

  sub rsp, 20
  mov [rbp-4], esi ;first
  mov [rbp-8], edx
  mov [rbp-12], ecx
  mov [rbp-16], r8
  mov [rbp-20], r9 ; last

  ; rdi -- count!!!
  mov rax, 1

  mov rcx, rdi ; counter
  mov rcx, -5
  looper:
    mov r8, [rbp+rcx]
    add rax, r8


    loop looper


  ;mov rcx, rdi ; counter
  ;mov rax, 1
;looper:

  ;mov r9, rcx ; counter
  ;dec r9 ; counter-1
  ;mov r8, [rsi + r9*4]
  ;mul r8

  ;loop looper


  mov rsp, rbp       ; zwolnienie pamiÄ™ci na stosie
  pop rbp
  ret
