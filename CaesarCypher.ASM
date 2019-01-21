ORG C0
DB "somestring"
DB 00

ORG 90
DB "nopqrstuvwxyzabcdefghijklm"

;--------main program ---------
ORG 00
MOV CL, C0  ; CL points to position in string

LOOP:
	MOV BL, [CL]  ; get next character from string into BL
	CMP BL, 00  ; is it the end of the string?
	JZ LOOPEND

	SUB BL, 41 ; ascii for 'A' is 41 : A == 0, B == 1 etc
	ADD BL, 90 ; add 90 to get position in encryption table
	MOV AL, [BL]; put it into AL
	MOV [CL], AL ; replace character on screen with encryption

	INC CL
	JMP LOOP


LOOPEND:
	END