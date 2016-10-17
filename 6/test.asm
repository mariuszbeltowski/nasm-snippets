;a= 97 // 0x61
;b= 98 // 0x62
;c= c 99 // 0x63
;s = 1, s*c
;i = 0, i+1, i+1
;0,1,2

;Dump of assembler code for function f:
   0x080484bb <+0>:	push   ebp
   0x080484bc <+1>:	mov    ebp,esp
   0x080484be <+3>:	sub    esp,0x1c ; esp-28
=> 0x080484c1 <+6>:	mov    ecx,DWORD PTR [ebp+0x8] ; c
   0x080484c4 <+9>:	mov    edx,DWORD PTR [ebp+0xc] ; b
   0x080484c7 <+12>:	mov    eax,DWORD PTR [ebp+0x10] ; a
   0x080484ca <+15>:	mov    BYTE PTR [ebp-0x14],cl ; c
   0x080484cd <+18>:	mov    BYTE PTR [ebp-0x18],dl ; b
   0x080484d0 <+21>:	mov    BYTE PTR [ebp-0x1c],al ; a
   0x080484d3 <+24>:	mov    DWORD PTR [ebp-0x4],0x1 ; 1, 1*c, c*1*c
   0x080484da <+31>:	mov    BYTE PTR [ebp-0x5],0x0 ; 0, 1, 2
   0x080484de <+35>:	jmp    0x80484f7 <f+60>
   0x080484e0 <+37>:	movsx  eax,BYTE PTR [ebp-0x14] ; eax c, c
   0x080484e4 <+41>:	mov    edx,DWORD PTR [ebp-0x4] ; edx 1, 1*c
   0x080484e7 <+44>:	imul   eax,edx ; eax c*1, c*1*c
   0x080484ea <+47>:	mov    DWORD PTR [ebp-0x4],eax ; 1*c, c*1*c
   0x080484ed <+50>:	movzx  eax,BYTE PTR [ebp-0x5] ; eax 0, i
   0x080484f1 <+54>:	add    eax,0x1 ; eax 0+1, i+1
   0x080484f4 <+57>:	mov    BYTE PTR [ebp-0x5],al ; 1, 2
   0x080484f7 <+60>:	movzx  edx,BYTE PTR [ebp-0x5] ; edx 0, 1, 2
   0x080484fb <+64>:	movsx  eax,BYTE PTR [ebp-0x18] ; eax b, b, b
   0x080484ff <+68>:	cmp    edx,eax ; 0b, 1b, 2b
   0x08048501 <+70>:	jl     0x80484e0 <f+37> ;0<b, 1<b, 2<b
   0x08048503 <+72>:	mov    ecx,DWORD PTR [ebp-0x4] ; ecx i
   0x08048506 <+75>:	mov    edx,0x4ec4ec4f ; edx 1321528399
   0x0804850b <+80>:	mov    eax,ecx ; eax i
   0x0804850d <+82>:	mul    edx ; i*1321528399
   0x0804850f <+84>:	mov    eax,edx; i*1321528399
   0x08048511 <+86>:	shr    eax,0x3; eax = eax >>3
   0x08048514 <+89>:	imul   eax,eax,0x1a; eax = eax*26
   0x08048517 <+92>:	sub    ecx,eax ; i-= eax
   0x08048519 <+94>:	mov    eax,ecx; eax = i
   0x0804851b <+96>:	mov    edx,eax edx; = i
   0x0804851d <+98>:	movzx  eax,BYTE PTR [ebp-0x1c] ; eax = a
   0x08048521 <+102>:	add    eax,edx a += i
   0x08048523 <+104>:	leave
   0x08048524 <+105>:	ret
;End of assembler dump.
