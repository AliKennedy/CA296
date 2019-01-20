
;Write a procedure to read the number stored at memory location [30] and display a * on the VDU at that position




;----- start of code
MOV AL, C0
MOV BL, 30
MOV [BL], AL  ; put the number C0 at memory location [30]

CALL 50  ;call the procedure
	; put an asterisk at the top left of VDU [C0]

MOV AL, FF  ;bottom right of VDU
MOV [BL], AL ; put FF at memory location [30]

CALL 50 ; call the procedure again


HALT


;------ end of code


;-----------start of procedure
ORG 50

MOV CL, [30] ; move whatever's in memory location 30 into CL
MOV DL, 2A   ;2A = ascii for an asterisk
MOV [CL], DL
RET

;-----------end of procedure

END