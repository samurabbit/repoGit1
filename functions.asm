;--------------------------------
;int slen(string message)
;string length calculation function
;input:EAX as addr of string
;output:EAX as length of string

slen:
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

;------------------------------------
;void sprint(string message)
;String pring function
;input:EAX as addr of string
;output:I/O

sprint:
	push	edx
	push	ecx
	push	ebx
	push	eax
	
	mov	ecx,eax

	call	slen

	mov	edx,eax
	mov	ebx,1
	mov	eax,4
	int	80h

	pop	eax
	pop	ebx
	pop	ecx
	pop	edx
	ret

;--------------------------------------
;void exit()
;Exit program and restore resources

quit:
	push	ebx
	push	eax

	mov	ebx,0
	mov	eax,1
	int	80h

	pop	eax
	pop	ebx

	ret

