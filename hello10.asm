;hello10.asm
;count 0 to 10
;use stack save data and top addr is to int
;ascii '0'is 48,'A'is 65,'a'is 97

%include 'functions.asm'

SECTION .text
global _start

_start:
	mov	ecx,0
nextNum:
	inc	ecx

	mov	eax,ecx
	add	eax,'0'
	push	eax
	mov	eax,esp
	call	sprintLF

	pop	eax
	cmp	ecx,10
	jne	nextNum

	call	quit

