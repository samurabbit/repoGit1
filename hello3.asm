;this file is calculate the length of string.
;and set the write to screen
;the exit process with no error.
;changed for github test.

SECTION .data
msg	db	'Hello, brave new world!', 0ah

;code section
SECTION .text

global	_start

_start:
	mov	ebx,msg
	mov	eax,ebx

nextchar:
	cmp	byte[eax],0
	jz	finished
	inc	eax
	jmp	nextchar
finished:
	sub	eax,ebx		;get the length

;set the OPCODEs
	mov	edx,eax
	mov	ecx,msg
	mov	ebx,1
	mov	eax,4
	int	80h
;exit with no errors
	mov	ebx,0
	mov	eax,1
	int	80h
