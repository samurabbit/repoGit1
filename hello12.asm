;hello12.asm
;add number and print

%include 'functions.asm'

SEGMENT .text
global _start
_start:
	mov	ecx,90
	mov	eax,9
	add	eax,ecx
	call	iprintLF

	mov	ebx,2
	mul	ebx
	call	iprintLF

	push	ebx
	mul	word[esp]
	call	iprintLF
	pop	eax

	call	quit

