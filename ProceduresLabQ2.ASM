
;write a procedure to read the number stored at memory location [30]
;and display a whatevers in memory location [31]
;on the vdu at that position


;----- start of code
MOV AL, C0  ; display in top left of VDU (parameter)
MOV BL, 31
CALL 50   

MOV AL, FF  ; display in bottom right of VDU (parameter)
MOV BL, 32
CALL 50


HALT
;------ end of code

ORG 50

MOV [30], AL  ; whatevers stored in location 30
MOV [31], BL  ; whatevers stored in location 31
MOV CL, [30] ; move whatever's in memory location 30 into CL
MOV[CL], BL
RET


END