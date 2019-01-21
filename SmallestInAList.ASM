;write a program that finds the smallest digit in a list
;and stores it in the BL register





;--------------Test Program------------------------

ORG A0 ; start placing our table at memory location A0
DB 9
DB 8
DB 7
DB 6
DB 9
DB 4
DB 3
DB 2
DB 1
DB 0
DB FF  ;end of table marked with FF

ORG 00
CALL 50 ; call the procedure
HALT

;------------Procedure to print the smallest in a list---------------------

;******BL keeps track of smallest number*********

ORG 50
initialize:
	MOV AL, A0 ; keeps track of memory location in table
	MOV BL, [AL] ; move the number stored in table into BL (current smallest)

	INC AL ; move to next location in table

loop:
	
	MOV CL, [AL]
	CMP CL, FF ; check if we've hit end of table
	JZ finish
	
	CMP CL, BL  ; check if number in CL is smaller than current smallest
	JS changeCurrentSmallest

	INC AL ; move to next location in table
	JMP loop


changeCurrentSmallest:
	
	PUSH CL
	POP BL  ; move smaller number into BL
	INC AL ; move on to next location in table
	JMP loop


finish:
	RET	


END
