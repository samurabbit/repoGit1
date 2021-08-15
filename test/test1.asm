;test new functions

org	0100h
	jmp short LABEL_START

[section .data1]
;string
LABEL_DATA:
MsgBuffer	db	10h dup(00h)
Message1	db	"input a string: ",0h
Message2	db	"Message2",0h
Message3	db	"Message3",0h
Message4	db	"same",0h
Message5	db	"different",0h

;end of data

[section .s1]
LABEL_START:
	mov	ax,cs
	mov	ds,ax
	mov	es,ax
	mov	ss,ax
	mov	sp,0100h
	
.begin:	
	call	DispLF
	mov	ax,Message1
	call	DispStr

	call	Label_Clear_MsgBuffer
	mov	ax,MsgBuffer
	call	StrInput

	;cmp strings
	mov	si,MsgBuffer
	mov	di,Message2
	call	CmpStrs
	cmp	ax,1
	jz	.diff
	mov	ax,Message4
	jmp	.show_cmp
	
	;cmp string and inputbuffer
;	mov	bx,ax	;now count of buffer is in ax
;	mov	ax,Message2	;cmp str
;	call	StrLength	;first is length?
;	cmp	ax,bx
;	jnz	.diff
;	
;	mov	cx,ax
;	mov	si,MsgBuffer
;	mov	di,Message2
;	cld
;.cmp_str:
;	lodsb			;load char from buffer
;	cmp	al,byte[es:di]	;cmp char to message
;	jnz	.diff		;not z is diff
;	inc	di		;goto next char
;	loop	.cmp_str
;	mov	ax,Message4	;all same
;	jmp	.show_cmp

.diff:
	mov	ax,Message5

.show_cmp:
	call	DispLF
	call	DispStr
	jmp	.begin		;end here

;-------------------------------
Label_Clear_MsgBuffer:
	push	cx
	push	bx

	mov	cx,0fh
	mov	bx,MsgBuffer
.1:
	mov	byte[bx],00h
	inc	bx
	loop	.1

	pop	bx
	pop	cx
	ret

;code included before the main code will exceed entrance.
%include "tfunc.asm"
