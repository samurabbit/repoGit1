;***function list***
;DispStr
;DispLF
;StrLength
;StrInput
;CmpStrs
;***end***


;--------------------------------------
;name:	DispStr
;func:显示字符串，每个字符串以/0结尾
;input: AX = as addr of string
;output:AX = length of string
DispStr:
	push	bp
	push	es
	push	cx
	push	bx
	push	dx

	mov	bp,ax
	call	StrLength
	mov	cx,ax		;get length
	mov	ax,ds
	mov	es,ax
	
	push	cx
	mov	ah,03h
	mov	bh,00h
	int	10h		;get the point of cursor go DHDL
	pop	cx

	mov	ax,01301h
	mov	bx,0007h
	;mov	dl,0		;use cursor position in DHDL
	int	10h
	
	pop	dx
	pop	bx
	pop	cx
	pop	es
	pop	bp
	ret
;end=============================

;--------------------------
;name:	DispLF
;func:output a LF
;in:no
;out:no
DispLF:
	push	dx
	push	ax

	mov	dl,0dh	;CR
	mov	ah,02h
	int	21h
	mov	dl,0ah	;LF
	mov	ah,02h
	int	21h

	pop	ax
	pop	dx
	ret
;==DispLF===end===========


;---------------
;name:	StrLength
;func:	return length of string.str is end by 0.
;input: AX=addr of string
;output:AX=length
StrLength:
	push	si
	push	es
	push	cx

	mov	si,ax
	mov	ax,ds
	mov	es,ax
	xor	cx,cx
	cld
.load:	lodsb
	inc	cx
	cmp	al,0
	jnz	.load
	dec	cx
	mov	ax,cx
	
	pop	cx
	pop	es
	pop	si
	ret
;end================================

;-------------------------------
;name:	StrInput
;func:get input from std, end by LF
;in:	AX=addr of buffer
;out:	AX=count of word
StrInput:
	push	di
	push	cx

	mov	di,ax
	mov	ah,01h
	xor	cx,cx
	cld
.in:	
	cmp	cx,0fh
	jz	.end
	int	21h
	cmp	al,0dh	;LF is 0ah,CR is 0dh
	jz	.end
	stosb
	inc	cx
	jmp	.in
.end:
	mov	ax,cx	;get count of input

	pop	cx
	pop	di
	ret
;===StrInput===end==================

;------------------------------
;name:	CmpStrs
;func:cmp tow strings
;in:AX,BX=as addr of strings
;out:AX,equ=1,ne=0
CmpStrs:
	;move ax to si,then lodsb to al and cmp to bx,if same =0
	;else return 1.
.cmp:
	mov	al,[di]
	mov	ah,[si]
	cmp	ah,al
	jnz	.diff
	cmp	ah,0
	jz	.end
	inc	di
	inc	si
	jmp	.cmp
.diff:
	mov	ax,1
.end:
	ret
