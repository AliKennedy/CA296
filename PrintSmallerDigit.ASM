;--------------Test Program------------------------

testProgram:
	MOV AL, 05
	MOV BL, 06  ;use 0x05 and 0x06 as test cases

	CALL 50   ;call the procedure in memory location 50
	HALT


;------------Procedure to print the smaller of AL and BL ---------------------
ORG 50
MOV CL, C0  ; top left of VDU
CMP AL, BL  ;check which is smaller
JS ALisSmaller
JNS BLisSmaller


ALisSmaller:
	ADD AL, 30 ; convert to ascii so as to display correctly in VDU
	MOV [CL], AL ; move into place in VDU
	JMP finish


BLisSmaller:
	ADD BL, 30 ; convert to ascii so as to display correctly in VDU
	MOV [CL], BL ; move into place in VDU
	JMP finish

finish:
	RET ; return to where we left off before procedure was executed

END