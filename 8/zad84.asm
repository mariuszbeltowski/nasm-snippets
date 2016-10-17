extern printf

section .data
printf_string dd "Faktura %d : obrot %f podatek %f", 0xa, 0x0

section .bss

section .text

global podatek
global wypisz

%idefine tmp [rbp-8]

; ret - [rbp+8]
; rdi - id + obrot
; xmm0 - podatekNaliczony + stawkaPodatku
; podatek = (obrót - podatekNaliczony) * stawkaPodatku

; float podatek(Faktura f);
; podatek = (obrót - podatekNaliczony) * stawkaPodatku
podatek:
 push rbp
 mov rbp, rsp
 sub rsp, 8 ; ramka stosu

 movlps tmp, xmm0
 mov rdx, tmp
 shr rdx, 32 ; stawka podatku
 mov rcx, tmp
 shl rcx, 32
 shr rcx, 32 ; podatekNaliczony

 mov rax, rdi
 shr rax, 32 ; obrot
 mov tmp, rax
 movlps xmm0, tmp
 mov tmp, rcx
 movlps xmm1, tmp
 subps xmm0, xmm1
 mov tmp, rdx
 movlps xmm1, tmp
 mulps xmm0, xmm1

 add rsp, 8
 mov rsp, rbp
 pop rbp
 ret


; [rdi] - id
; [rdi+4] - obrot
; [rdi+8] - podatekNaliczony
; [rdi+12] - stawka podatku
; void wypisz(const Faktura & f);
wypisz:
 push rbp
 mov rbp, rsp
 sub rsp, 8
 mov esi, dword [rdi]

 xor rax, rax
 mov eax, dword [rdi+4] ; obrot
 mov tmp, rax
 movlps xmm0, tmp
 cvtss2sd xmm0, xmm0 ; obrot
 xor rax, rax
 mov eax, dword [rdi+8]
 mov tmp, rax
 movlps xmm1, [rbp-8]
 cvtss2sd xmm1, xmm1

 add rsp, 8
 mov rdi, printf_string
 mov eax, 2
 call printf

 mov rsp, rbp
 pop rbp
 ret
