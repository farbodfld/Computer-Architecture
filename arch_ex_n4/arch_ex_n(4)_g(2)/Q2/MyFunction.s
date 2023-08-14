	
	
	AREA RESET,CODE,READWRITE
	ENTRY
	
	MOV R4,R0; Store it somewhere safe 
	MOV R5,#0x40000000; Start address selected regarding to "Options for target panel
	
MAIN
	MOV R1,#0
	MOV R2,#0
FOR_ZERO ; Filling the array with zeros
	CMP R1 , #160
	BGE DONE_ZERO
	STR R2 , [R5,R1]
	ADD R1 , #4
	B FOR_ZERO
DONE_ZERO


	MOV R6, #39
FOR_ASLI
	CMP R6, #0
	MOV R7, #-1
	
	BLT DONE_ASLI; i >= 0
	
	BL MY_FUNCTION
	CMP R0, R4
	BLE DONE_ASLI
	
	SUB R6,R6,#1 ; i--
	B FOR_ASLI
	
DONE_BREAK
	MOV R1,R6
DONE_ASLI
	MOV R1,R6
	B TAMAM
	
	
	

MY_FUNCTION
	; If i <= 0
	CMP R6, #0
	BLE RETURN_ZERO
	
	;if i==1
	CMP R6, #1
	BEQ RETURN_ONE
	
	; if i == 2
	CMP R6, #2
	BEQ RETURN_TWO
	
	; if my_arr[i] != 0; return my_arr[i]
	LSL R1, R6, #2
	LDR R0, [R5,R1]
	CMP R0, #0
	MOVNE PC,LR
	
	; return my_arr[i] = ....
	
	PUSH {LR,R6}
	
	SUB R6,R6,#1
	BL MY_FUNCTION
	MOV R1,R0
	
	SUB R6,R6,#1
	BL MY_FUNCTION
	MOV R2,R0
	
	SUB R6,#1
	BL MY_FUNCTION
	MOV R3,R0
	
	POP {LR,R6}
	
	ADD R1, R1, R1
	ADD R3, R3, R3
	
	ADD R0, R3, R2
	SUB R0, R0, R1
	
	LSL R12,R6,#2
	STR R0,[R5,R12]
	
	MOV PC, LR
	
	
RETURN_ZERO
	MOV R0,#0
	MOV PC,LR
	
RETURN_ONE 
	MOV R0,#1
	MOV PC,LR
	
RETURN_TWO
	MOV R0, #2
	MOV PC, LR
	
	
TAMAM
	B TAMAM 
	
	
	END