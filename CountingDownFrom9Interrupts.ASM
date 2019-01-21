JMP start
DB 5A

start:
	MOV AL, 39
	JMP mainProgram

mainProgram:
	STI   ; enables interrupts
	MOV [C0], AL
	CMP AL, 30
	JZ finish

	JMP mainProgram

finish:
	HALT

ORG 5A  ; ISR at location 5A
CLI  ; ignore interrupts

DEC AL
IRET

END