;--------------------------------------
;hello8.asm
;trans args to proc
;as stack in revers,top 2 is name of prog and top is count of args

%include 'functions.asm'

SECTION .data
msg1	db	'the count of your args is:'
msgLF	db	0ah

SECTION .text
global _start
_start:

	pop	ecx	;get the count of args to ecx
	mov	eax,msg1
	call	sprint

	mov	eax,ecx
	add	eax,'0'
	push	eax
	mov	eax,esp
	call	sprint
	pop	eax

	mov	eax,msgLF
	call	sprint

nextArg:
	cmp	ecx,0
	jz	noMoreArgs
	pop	eax
	call	sprintLF
	dec	ecx
	jmp	nextArg

noMoreArgs:
	call	quit

