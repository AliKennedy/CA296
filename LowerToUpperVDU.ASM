;write a program that reads in a lowercase character from the keyboard
;and displays it in uppercase in the VDU







;--------------Main Program------------------------

mainProgram:
	IN 00 ; read character in from simple keyboard
	CMP AL, 61 ;check if ascii is less than 41 (i.e not lower case)
	JS mainProgram

	CMP AL, 7B ; check if ascii is less than 5B (i.e is lower case)
	JNS mainProgram

	CALL 50
	HALT


;------------procedure to display upper case in VDU---------------------
ORG 50
SUB AL, 20
MOV CL, C0
MOV [CL], AL
RET

END