;count down from FF using left and right 7SD



ORG 7F ; 7SD left hand side
DB 00 ; start of table
DB FA
DB A
DB B6
DB 9E
DB 4E
DB DC
DB 7C
DB 8A
DB FE
DB CE
DB EE
DB FE
DB F0
DB FA
DB F4
DB E4


ORG 9F ; 7SD right hand side
DB 00  ; 7SD
DB FB
DB B
DB B7
DB 9F
DB 4F
DB DD
DB 7D
DB 8B
DB FF
DB CF
DB EF
DB FF
DB F1
DB FB
DB F5
DB E5



ORG 00
MOV BL, 8F ; left hand side
MOV CL, AF  ; right hand side

MOV AL, [BL]
OUT 2

MOV AL, [CL]
OUT 2        ; start with F in both



LOOP:

	DEC CL ; decrement RHS
	MOV AL, [CL]  ;move into AL
	CMP AL, 00  ;make sure its not end of table
	JZ DECLHS  ; decrement LHS if it is

	OUT 2   ;if its not put digit into RHS
	JMP LOOP

DECLHS:
	DEC BL
	MOV AL, [BL]
	CMP AL, 00  ; make sure we haven't hit end of table
	JZ LOOPEND  ; if we have, finish

	OUT 2    ; if we havent put digit in LHS

	MOV CL, B0  ; restart CL (RHS) at F
	JMP LOOP
	


LOOPEND:

	END