BITS 32

;nasm -felf32 zad121x32.asm -o zad121x32.o && gcc -m32 -o zad121x32.o -c main121.c && gcc -m32 main121.o zad121x32.o -o zad121x32 && ./zad121x32
;nasm -felf32 zad121x32.asm -o zad121.o && gcc -m32 -o main121.o -c main121.c && gcc -m32 main121.o zad121.o -o zad121 && ./zad121
section .data

nans dd 0x7fffffff, 0x7fffffff, 0x7fffffff, 0x7fffffff
zeros dd 0.0, 0.0, 0.0, 0.0
infs dd 0x7f800000, 0x7f800000, 0x7f800000, 0x7f800000

section .text

global solve
; extern "C" void solve(int n, float * A, float * B, float * X);

solve:
 push rbp
 mov rbp, rsp

 ; rdi <- int n
 ; rsi <- float* a
 ; rdx <- float* b
 ; rcx <- float* x

 xor rax, rax


 myloop:
	movups xmm3, [nans] ; xmm3 - nans
	movups xmm4, [infs] ; xmm4 - infs
	movups xmm5, [zeros]; xmm5 - zeros
	movups xmm6, [rsi+rax] ; a
	movups xmm7, [rdx+rax] ; b
	movups xmm0, xmm7 ; xmm0 - b
	divps xmm0, xmm6 ; xmm0 - results
	; xmm1 - a==0
	movups xmm1, xmm6
	movups xmm2, xmm6
	cmpneqps xmm1, xmm5
	andps xmm0, xmm1
	; xmm0 - only true results, the rest is 0.0
	cmpeqps xmm2, xmm5
	; xmm2 - zeros in a
	movups xmm1, xmm7
	cmpeqps xmm1, xmm5
	; xmm1 - zeros in b
	andps xmm1, xmm2
	; xmm1 - zeros in a and b
	andps xmm4, xmm1
	orps xmm0, xmm4
	; xmm0 - updated results
	movups xmm1, xmm7
	cmpneqps xmm1, xmm5
	; xmm1 - not zeros in b
	andps xmm1, xmm2
	andps xmm3, xmm1
	orps xmm0, xmm3
	movups [rcx+rax], xmm0
	sub rdi, 4
	add rax, 16
	cmp rdi, 0
	jg myloop

 mov rsp, rbp
 pop rbp
 ret
