;hello9.asm
;get input from user

%include 'functions.asm'

SECTION .data
msg1	db	'Please input your name: ',0h
msg2	db	'Hello, ',0h

SECTION .bss
sinput	resb	255

SECTION .text
global _start
_start:
	mov	eax,msg1
	call	sprint

	mov	edx,255
	mov	ecx,sinput
	mov	ebx,0
	mov	eax,3
	int	80h		;input is end by a LF,so last char is LF

	mov	eax,msg2
	call	sprint

	mov	eax,sinput
	call	sprint		;the LF we input is also a char in string
				;when we print,LF is printed.

	call	quit
