;test base running in dos
org	0100h
;jmp	LABEL_START

section .data
LABEL_DATA:
message1	db	"new data",0	;it 9 chars,with a 0

section .text
LABEL_START:
	mov	ax,cs
	mov	ds,ax
	mov	es,ax
	mov	ss,ax
	mov	sp,0100h

.1:
	mov	ax,01ffh
	jmp	.1

;=====end=====

