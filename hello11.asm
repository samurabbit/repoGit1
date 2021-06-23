;hello11.asm
;change number to ascii to print

%include 'functions.asm'

SECTION .text
global _start
_start:
	mov	ecx,0

nextNum:
	inc	ecx
	mov	eax,ecx
	call	iprintLF
	cmp	ecx,10
	jne	nextNum

	call	quit

