;test2.asm
org	0100h
jmp	Label_Start

%include "tfunc.asm"

Label_Data:
	Msg1	db	"A test Message",00h
	MsgLF	db	0ah,0dh,00h

Label_Start:
	;init
	mov	ax,cs
	mov	ds,ax
	mov	es,ax
	mov	ss,ax
	mov	sp,0100h

	;test printLF
	mov	ax,Msg1
	call	DispStr
	call	DispLF
	mov	ax,Msg1
	call	DispStr
