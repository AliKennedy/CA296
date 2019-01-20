;check if numbers 0x02 as far as 0x32 are prime
;store your answers in memory location [72] onwards
;if the number is prime leave it as it is
;if its not, change it to FF
  
  
  
  MOV AL, 2
	MOV BL, 72
	MOV CL, 2   ; to be used in modulus function



LOOP:

	PUSH AL
	POP DL   ; take a copy of AL to experiment with

	CMP AL, CL  ; if divisor hits the number itself it is a prime
	JZ ISPRIME


	CMP AL, 21  ;stop at decimal 33
	JZ LOOPEND
	

	MOD DL, CL
	CMP DL , 0   ; check if modulus is 0
	JZ NOTPRIME
	
	
	INC CL   ;increase what we're dividing by (modulus)
	JMP LOOP


ISPRIME:
	MOV [BL], AL  ; move AL into memory location
	INC AL   ;increment AL
	INC BL   ; increment memory location
	MOV CL, 2  ; reset number we're dividing by (modulus) to 2
	JMP LOOP

NOTPRIME:
	MOV DL, FF  ; mov FF into DL
	MOV [BL], DL  ; move into memory
	INC AL  ; increment AL
	INC BL   ; increment memory location
	MOV CL, 2  ; reset number we're dividing by (modulus) to 2
	JMP LOOP


LOOPEND:
	END
