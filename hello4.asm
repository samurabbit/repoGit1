;CALL and RET to use subroutines. system do the job by stack.
;subroutine can be reused.

SECTION .data
msg	db	'Hello, brave new world!', 0ah

SECTION .text
global	_start

_start:
	mov	eax,msg
	call	strlen
	
	;set OPCODE
	mov	edx,eax
	mov	ecx,msg
	mov	ebx,1
	mov	eax,4
	int	80h

	;exit with no error
	mov	ebx,0
	mov	eax,1
	int	80h

strlen:		
	;the subroutine to calculate length
	;it use eax to get addr and return length to eax
		push	ebx
		mov	ebx,eax

	nextchar:
		cmp	byte[eax],0
		jz	finished
		inc	eax
		jmp	nextchar
	finished:
		sub	eax,ebx
		pop	ebx
		ret

