	.file	"main93.cpp"
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.text._ZSt4setwi,"axG",@progbits,_ZSt4setwi,comdat
	.weak	_ZSt4setwi
	.type	_ZSt4setwi, @function
_ZSt4setwi:
.LFB986:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE986:
	.size	_ZSt4setwi, .-_ZSt4setwi
	.section	.text._ZN6BigIntC2Ej,"axG",@progbits,_ZN6BigIntC5Ej,comdat
	.align 2
	.weak	_ZN6BigIntC2Ej
	.type	_ZN6BigIntC2Ej, @function
_ZN6BigIntC2Ej:
.LFB990:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, (%rax)
	movl	-12(%rbp), %eax
	movabsq	$2287828610704211968, %rdx
	cmpq	%rdx, %rax
	ja	.L4
	salq	$2, %rax
	jmp	.L5
.L4:
	movq	$-1, %rax
.L5:
	movq	%rax, %rdi
	call	_Znam
	movq	-8(%rbp), %rdx
	movq	%rax, 8(%rdx)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_Z5zerujPij
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE990:
	.size	_ZN6BigIntC2Ej, .-_ZN6BigIntC2Ej
	.weak	_ZN6BigIntC1Ej
	.set	_ZN6BigIntC1Ej,_ZN6BigIntC2Ej
	.section	.text._ZN6BigIntD2Ev,"axG",@progbits,_ZN6BigIntD5Ev,comdat
	.align 2
	.weak	_ZN6BigIntD2Ev
	.type	_ZN6BigIntD2Ev, @function
_ZN6BigIntD2Ev:
.LFB997:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L6
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	_ZdaPv
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE997:
	.size	_ZN6BigIntD2Ev, .-_ZN6BigIntD2Ev
	.weak	_ZN6BigIntD1Ev
	.set	_ZN6BigIntD1Ev,_ZN6BigIntD2Ev
	.text
	.globl	_ZlsRSoRK6BigInt
	.type	_ZlsRSoRK6BigInt, @function
_ZlsRSoRK6BigInt:
.LFB999:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	subl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.L9
.L10:
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %ebx
	movl	$10, %edi
	call	_ZSt4setwi
	movl	%eax, %r12d
	movl	$48, %edi
	call	_ZSt7setfillIcESt8_SetfillIT_ES1_
	movl	%eax, %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St8_SetfillIS3_E
	movl	%r12d, %esi
	movq	%rax, %rdi
	call	_ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St5_Setw
	movl	%ebx, %esi
	movq	%rax, %rdi
	call	_ZNSolsEj
	subl	$1, -20(%rbp)
.L9:
	cmpl	$0, -20(%rbp)
	jns	.L10
	movq	-40(%rbp), %rax
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE999:
	.size	_ZlsRSoRK6BigInt, .-_ZlsRSoRK6BigInt
	.globl	main
	.type	main, @function
main:
.LFB1000:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA1000
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$64, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	leaq	-64(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
.LEHB0:
	call	_ZN6BigIntC1Ej
.LEHE0:
	leaq	-64(%rbp), %rax
	movl	$2147483647, %esi
	movq	%rax, %rdi
.LEHB1:
	call	_ZN6BigInt5dodajEi
	movl	%eax, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	leaq	-64(%rbp), %rax
	movl	$2147483647, %esi
	movq	%rax, %rdi
	call	_ZN6BigInt5dodajEi
	movl	%eax, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	leaq	-64(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	_ZN6BigInt5dodajEi
	movl	%eax, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	leaq	-64(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
	call	_ZN6BigInt6pomnozEi
	movl	%eax, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	leaq	-64(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
	call	_ZN6BigInt14podzielZResztaEi
	movl	%eax, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZlsRSoRK6BigInt
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	leaq	-48(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
	call	_ZN6BigIntC1Ej
.LEHE1:
	leaq	-48(%rbp), %rax
	movl	$30, %esi
	movq	%rax, %rdi
.LEHB2:
	call	_ZN6BigInt5dodajEi
	movl	%eax, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZlsRSoRK6BigInt
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	leaq	-32(%rbp), %rax
	leaq	-48(%rbp), %rdx
	leaq	-64(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZplRK6BigIntS1_
.LEHE2:
	movl	$16, %edi
.LEHB3:
	call	_Znwm
.LEHE3:
	movq	%rax, %rbx
	movl	$1, %esi
	movq	%rbx, %rdi
.LEHB4:
	call	_ZN6BigIntC1Ej
.LEHE4:
	movq	%rbx, -80(%rbp)
	movl	$16, %edi
.LEHB5:
	call	_Znwm
.LEHE5:
	movq	%rax, %rbx
	movl	$1, %esi
	movq	%rbx, %rdi
.LEHB6:
	call	_ZN6BigIntC1Ej
.LEHE6:
	movq	%rbx, -72(%rbp)
	movl	$0, %ebx
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN6BigIntD1Ev
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN6BigIntD1Ev
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN6BigIntD1Ev
	movl	%ebx, %eax
	jmp	.L24
.L22:
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	_ZdlPv
	movq	%r12, %rbx
	jmp	.L15
.L23:
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	_ZdlPv
	movq	%r12, %rbx
	jmp	.L15
.L21:
	movq	%rax, %rbx
.L15:
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN6BigIntD1Ev
	jmp	.L17
.L20:
	movq	%rax, %rbx
.L17:
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN6BigIntD1Ev
	jmp	.L18
.L19:
	movq	%rax, %rbx
.L18:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN6BigIntD1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB7:
	call	_Unwind_Resume
.LEHE7:
.L24:
	addq	$64, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1000:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA1000:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1000-.LLSDACSB1000
.LLSDACSB1000:
	.uleb128 .LEHB0-.LFB1000
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB1000
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L19-.LFB1000
	.uleb128 0
	.uleb128 .LEHB2-.LFB1000
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L20-.LFB1000
	.uleb128 0
	.uleb128 .LEHB3-.LFB1000
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L21-.LFB1000
	.uleb128 0
	.uleb128 .LEHB4-.LFB1000
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L22-.LFB1000
	.uleb128 0
	.uleb128 .LEHB5-.LFB1000
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L21-.LFB1000
	.uleb128 0
	.uleb128 .LEHB6-.LFB1000
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L23-.LFB1000
	.uleb128 0
	.uleb128 .LEHB7-.LFB1000
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
.LLSDACSE1000:
	.text
	.size	main, .-main
	.section	.text._ZSt7setfillIcESt8_SetfillIT_ES1_,"axG",@progbits,_ZSt7setfillIcESt8_SetfillIT_ES1_,comdat
	.weak	_ZSt7setfillIcESt8_SetfillIT_ES1_
	.type	_ZSt7setfillIcESt8_SetfillIT_ES1_, @function
_ZSt7setfillIcESt8_SetfillIT_ES1_:
.LFB1001:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movzbl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1001:
	.size	_ZSt7setfillIcESt8_SetfillIT_ES1_, .-_ZSt7setfillIcESt8_SetfillIT_ES1_
	.text
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB1012:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L27
	cmpl	$65535, -8(%rbp)
	jne	.L27
	movl	$_ZStL8__ioinit, %edi
	call	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, %edx
	movl	$_ZStL8__ioinit, %esi
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	call	__cxa_atexit
.L27:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1012:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I__ZlsRSoRK6BigInt, @function
_GLOBAL__sub_I__ZlsRSoRK6BigInt:
.LFB1013:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1013:
	.size	_GLOBAL__sub_I__ZlsRSoRK6BigInt, .-_GLOBAL__sub_I__ZlsRSoRK6BigInt
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__ZlsRSoRK6BigInt
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
