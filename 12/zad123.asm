BITS 32

;nasm -felf32 zad121x32.asm -o zad121x32.o && gcc -m32 -o zad121x32.o -c main121.c && gcc -m32 main121.o zad121x32.o -o zad121x32 && ./zad121x32
;nasm -felf32 zad121x32.asm -o zad121.o && gcc -m32 -o main121.o -c main121.c && gcc -m32 main121.o zad121.o -o zad121 && ./zad121
section .data

section .text

global sortuj        ;KONWENCJA!!! - funkcja suma ma być widziana w innych modułach aplikacji
                   ; pod Windowsem należy dodać podkreślenie przed suma

%idefine n dword [ebp+8]
%idefine tab dword [ebp+12]

;void sortuj(int n, float * tab)
;RDI, RSI, RDX, RCX
sort:
 push ebp
 mov ebp, esp

 ; rdi <- int n
 ; rsi <- int* a

 sortfunc:
	; STOS: ...[RET][liczba elementow][pierwszy]
	; tu bedzie sortowanie
	; rsi <- adres na pierwszy element tablicy
	; rdi <- ilosc elementow w tablicy
	push rbx
	mov r9, rsi
	mov rcx, rdi

	xor rbx, rbx
	outersortloop:
		; rbx <- outerindex
		; rsi <- temp index
		; rdi <- min value index
		; ax <- temp value
		; dx <- min value
		mov rdi, rbx
		mov edx, [r9+rbx*4]
		mov rsi, rbx
		inc rsi
		cmp rsi, rcx
		je sortfuncend
		innerloop:
			mov eax, [r9+rsi*4]
			cmp eax, edx
			jge continueinnerloop
			mov edx, eax
			mov rdi, rsi
			continueinnerloop:
			inc rsi
			cmp rsi, rcx
			je endoutersortloop
			jmp innerloop

		endoutersortloop:
		; found min
		mov eax, [r9+rbx*4]
		mov [r9+rbx*4], edx
		mov [r9+rdi*4], eax
		inc rbx
		jmp outersortloop

	sortfuncend:
	pop ebx
  
 mov esp, ebp
 pop ebp
 ret
