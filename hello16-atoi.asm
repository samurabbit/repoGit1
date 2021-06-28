;hello16-atoi.asm
;add input numbers return result

%include 'functions.asm'

SECTION .text
global _start
_start:
	;get the number of args
	pop	ecx
	pop	edx
	dec	ecx
	mov	edx,0

	;loop args atoi and add
.addArgs:
	cmp	ecx,0
	jz	.dispNum
	pop	eax
	call	atoi
	add	edx,eax
	dec	ecx
	jmp	.addArgs

	;display result
.dispNum:
	mov	eax,edx
	call	iprintLF
	call	quit
	;quit
