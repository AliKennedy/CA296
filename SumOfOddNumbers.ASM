;procedure for getting the sum of all the odd numbers in a range of memory addresses. The
;procedure should accept the range in registers AL and BL (where AL <=BL). Your procedure should find
;the sum of the odd numbers in [AL], [AL+1]....[BL-1],[BL] (where [X] represents the contents of
;memory location X) and return the answer in CL.
;Test the procedure by using the assembler to put some (at least 10) numbers into a region of memory. Call
;the procedure and make sure it returns the correct answer in CL.





;place numbers for testing at C0 onwards

ORG C0
DB 1
DB 2
DB 3
DB 4
DB 5
DB 6
DB 7
DB 8
DB 9
DB B

;----------start of code---------

ORG 00
MOV AL, C0
MOV BL, C9
MOV CL, 0
CALL 50
HALT

;----------end of code------------


;---------------procedure----------------
ORG 50

start:
	INC BL  ; so as JZ will work
	

loop:
	CMP AL, BL
	JZ finish  ;check if we've hit the end of our test data
	
	MOV DL, [AL]
	PUSH DL  ;take a copy of the number we're currently testing and back it up using stack
	
	MOD DL, 2 ; see if it divides evenly by 2
	JNZ isODD

	INC AL
	JMP loop
	
	

isODD:

	POP DL  ; take the original number we were testing with before it was altered by MOD instruction
	ADD CL, DL ; add it to running total in CL

	INC AL ; move up memory location in test data
	JMP loop

	
	
	
finish:
	RET

END
