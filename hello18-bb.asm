;hello18-bb.asm
;count 1 to 100
;3mul show FIZZ,5mul show BUZZ

%include 'functions.asm'

SEGMENT .data
fizz	db	'FIZZ',0h
buzz	db	'BUZZ',0h

SEGMENT .text
global _start
_start:
	;initial
	mov	eax,0
	mov	ebx,eax
	mov	ecx,eax
	mov	edx,eax
	mov	esi,eax
	mov	edi,eax

	;loop to count number
.getNum:
	inc ecx
	;div 3 to check fizz
.checkfizz:
	mov	edx,0
	mov	eax,ecx
	mov	ebx,3
	div	ebx
	mov	edi,edx
	cmp	edx,0
	jne	.checkbuzz
	mov	eax,fizz
	call	sprint

.checkbuzz:
	;div 5 to check buzz
	mov	edx,0
	mov	eax,ecx
	mov	ebx,5
	div	ebx
	mov	esi,edx
	cmp	edx,0
	jne	.checkNum
	mov	eax,buzz
	call	sprint

.checkNum:
	;check num
	cmp	edi,0
	je	.pLF
	cmp	esi,0
	je	.pLF
	mov	eax,ecx
	call	iprint

.pLF:
	;printLF
	mov	eax,0ah
	push	eax
	mov	eax,esp
	call	sprint
	pop	eax
	cmp	ecx,100
	jne	.getNum

	call	quit

