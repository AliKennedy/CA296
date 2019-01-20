;Write a program to get a digit (0-9) from the simple keyboard. If the character entered is not a
;digit, the character should be read again, until a digit is entered. A second digit should then be
;read into your program in the same way. When both digits have been read in, the two numbers
;should be multiplied and the result left in AL when the program halts.




GETFIRSTDIGIT:
	IN 00  ; read in from simple keyboard into AL register
	
	CMP AL, 3A  ;check its less than hex 3A
	JNS GETFIRSTDIGIT ;if its not jump back to beginning

	CMP AL, 30  ;see if its less than hex 30 (ascii for 0)
	JS GETFIRSTDIGIT  ;if it is, jump back to beginning

	PUSH AL
	POP BL  ; store first digit in BL register
	
GETSECONDDIGIT:
	
	IN 00  ; read in from simple keyboard into AL register
	
	CMP AL, 3A  ;check its less than hex 3A
	JNS GETFIRSTDIGIT ;if its not jump back to beginning

	CMP AL, 30  ;see if its less than hex 30 (ascii for 0)
	JS GETFIRSTDIGIT  ;if it is, jump back to beginning

MULTIPLY:

	SUB BL, 30
	SUB AL, 30  ;convert hex to decimal

	MUL AL, BL

END
	
