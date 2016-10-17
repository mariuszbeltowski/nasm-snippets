section .data

section .bss

section .text

global _Z6rotateji ; unsigned int
global _Z6rotatehi ; unsigned char


_Z6rotateji:
;  rdi, rsi
  xor rax, rax
  mov rcx, rsi
  ror edi, cl
  mov eax, edi
  ret


_Z6rotatehi:
  xor rax, rax
  mov rcx, rsi
  ror dil, cl
  mov al, dil
  ret
