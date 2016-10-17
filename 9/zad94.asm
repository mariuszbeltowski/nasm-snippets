section .data

section .bss

section .text

extern _Znwm
extern _Znwj
extern malloc
extern _ZN6BigIntC1Ej

global _Z6kopiujPiS_j ; unsigned int
global _Z5zerujPij ; unsigned char
global _ZN6BigInt5dodajEi
global _ZN6BigInt6pomnozEi
global _ZN6BigInt14podzielZResztaEi
global _ZplRK6BigIntS1_
global _ZmiRK6BigIntS1_

;void kopiuj(int * cel, int * zrodlo, unsigned int n);
_Z6kopiujPiS_j:
 ;RDI, RSI, RDX, RCX, R8, R9
 cld
mov rcx, rdx
push rsi
push rdi
pop rsi
pop rdi

  ;petla:
    rep movsd
    ;loop petla
  ret


;void zeruj(int * tablica, unsigned int n);
_Z5zerujPij:
 ;RDI, RSI, RDX, RCX,
 cld
 mov rcx, rsi
 xor rax, rax

   ;petla2:
     rep stosd
     ;loop petla2
   ret

_ZN6BigInt5dodajEi:
;RDI - this
;RSI - n
  clc
  xor rcx, rcx
  xor rax, rax

  mov ecx, [rdi] ; tab length
  mov rdx, [rdi+8] ; tab

  mov r8d, ecx

  cmp ecx, dword 1
  je dodaj_one

  add [rdx], esi
  pushf
  dodaj_looper:
    xor r9, r9
    mov r9d, r8d
    sub r9d, ecx
    popf
    adc [rdx + r9*4 + 4], eax
    pushf
  loop dodaj_looper
  popf
  jmp dodaj_end

  dodaj_one:
  add [rdx], esi

  dodaj_end:
  setc al
  ret

_ZN6BigInt6pomnozEi:
;RDI - this
;RSI - n
  clc
  xor rax, rax
  mov ecx, [rdi] ; tab length
  mov r8, [rdi+8] ; tab

  mov r10d, ecx

  mov ebx, esi            ;EBX = multiplier
  mov eax, [r8]
  mul ebx                ;EDX:EAX = EAX*EBX
  mov [r8], eax	;save result
  mov r9d, edx           ;save carried part in ECX

  pomnoz_looper:
    xor edx, edx
    xor r11, r11
    mov r11d, r10d
    sub r11d, ecx

    mov eax, [r8+ r11*4 +4]
    mul ebx
    add eax, r9d           ;add carried part from previous multiplication
    mov [r8+ r11*4 +4], eax
    mov r9d, edx
    loop pomnoz_looper

  mov eax, edx
  ret

_ZN6BigInt14podzielZResztaEi:
;RDI - this
;RSI - n
  clc
  xor rax, rax
  mov ecx, [rdi] ; tab length
  mov r8, [rdi+8] ; tab

  mov ebx, esi   ;divisor
  mov edx, 0

  podziel_loop:
    mov eax, [r8+ rcx *4 -4]   ;EDX:EAX = number to divide
    div ebx
    mov [r8+ rcx *4 -4], eax
    loop podziel_loop

  mov eax, edx
 ;edx holds remainder from division
ret

_ZplRK6BigIntS1_: ; +
;RDI, RSI, RDX, RCX, R8, R9
  push	rbp		; function prologue
	mov	rbp, rsp

  xor rax, rax
  mov esi, [rsi]
  call _ZN6BigIntC1Ej



  mov	rsp, rbp	; function epilogue
	pop	rbp
ret

_ZmiRK6BigIntS1_: ; -
;RDI, RSI, RDX, RCX, R8, R9
  push	rbp		; function prologue
	mov	rbp, rsp
  xor rax, rax

  xor rax, rax
  mov esi, [rsi]
  call _ZN6BigIntC1Ej

  ; zainicjalizowana pamiec w pierwszym argumencie wywolac tylko konstruktor podajac miejsce w pamieci i rozmiar:)

  mov	rsp, rbp	; function epilogue
	pop	rbp
ret
