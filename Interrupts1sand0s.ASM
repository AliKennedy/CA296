;Using the timer interrupt, fill the VDU from the top-left to
; the bottom-right alternatively with zeroes and ones 
;i.e filling the VDU with 01010101...etc. 
;The VDU should be filled at the rate of one character per second.



ORG 00
JMP start
DB 60

start:
	MOV AL, 30  ; want to start by putting 0 in VDU
	MOV CL, C0  ; start at top left of VDU
	
	

;---------------infinite loop-----------------------------
loop:
	STI   ; enable interrupts
	JMP loop




;-------------------------timer interrupt handler-------------------------------


ORG 60
main:
	CLI   ;disbale interrupts while handeling an interrupt

	MOV [CL], AL  ; move 0 or 1 into position in VDU

	INC CL    ;increment place in VDU
	CMP CL, 00  ; see if we've hit end of VDU
	JZ stopprogram  ;if we have, end the program

	CMP AL, 30   ;check if current digit is 0
	JZ increment  ; if it is increment it to 1

	JNZ decrement  ; if its not (ie its a 1) decrement it to 0

increment:
	INC AL
	JMP finish


decrement:
	DEC AL
	JMP finish

finish:
	IRET  ; return to where we were (infinite loop) before the interrupt happened



stopprogram:
	HALT

END



