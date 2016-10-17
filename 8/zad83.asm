section .data
section .bss
section .text

global iloczyn
; [rbp+8] - ret
; [rbp+16] - 6

; rdi - n - counter !!
; rsi - 1
; rdx - 2
; rcx - 3
; r8 - 4
; r9 - 5

; int iloczyn (int n, ...);

iloczyn:
 push rbp
 mov rbp, rsp
 push rdx ; push because of imul
 xor rax, rax
 inc rax
 cmp rdi, 0 ; counter !!!
 je end
 imul rsi
 dec rdi
 pop rdx ; here is safe

 cmp rdi, 0
 je end
 imul rdx
 dec rdi

 cmp rdi, 0
 je end
 imul rcx
 dec rdi

 cmp rdi, 0
 je end
 imul r8
 dec rdi

 cmp rdi, 0
 je end
 imul r9
 dec rdi

 looper:
  cmp rdi, 0
  je end ; if counter == 0, end

  xor rcx, rcx
  mov ecx, [rbp + 8 * rdi + 8]
  imul rcx
  
  dec rdi
  jmp looper

end:
 mov rsp, rbp
 pop rbp
 ret
