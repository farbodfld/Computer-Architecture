	
	
	AREA RESET,CODE,READWRITE
	ENTRY
	
MAIN
	MOV R5,#0x40000000; Start address selected regarding to "Options for target panel
	
	; Initializing array in memory
	MOV R2,#5
	STR R2, [R5,#0]
	
	MOV R2,#2
	STR R2, [R5,#4]
	
	MOV R2,#10
	STR R2, [R5,#8]
	
	MOV R2,#6
	STR R2, [R5,#12]
	
	MOV R2,#8
	STR R2, [R5,#16]
	
	MOV R2,#4
	STR R2, [R5,#20]
	
	MOV R2,#10
	STR R2, [R5,#24]
	
	MOV R2,#8
	STR R2, [R5,#28]
	
	; Stuff to be done before for loop
	MOV R6,#0; i=0
FOR
	CMP R6,#32
	BGE DONE; if i >= 8 break
	LDR R2,[R5,R6]; Load the word to R2 for Comb to do it's stuff
	ADD R12,R6,#4; One word jelo i's address
	LDR R3,[R5,R12]; Load the i+1 index
	BL COMB
	STR R0,[R5,R6]; Store the result to the index i of the array
	ADD R6,R6,#8; i+=2
	B FOR
DONE
	B DONE
	
	
	
COMB
	CMP R2, #1; N==1
	BEQ RETONE; GOTO RETURN ONE
	CMP R3, #0; M==0
	BEQ RETONE; GOTO RETURN ONE
	CMP R2, R3; M==N
	BEQ RETONE; GOTO RETURN ONE
	; If we reached here it means that
	; none of the above conditions are
	; met, hence it's somehow our else
	; of or of all the aboce conditions
	SUB R2,R2,#1; n=n-1
	PUSH {R2,R3,LR}; store shits needed
	BL COMB; recurse : comb(n-1,m)
	POP {R2,R3,LR} ; restore needed shits
	SUB R3,R3,#1; m=m-1
	PUSH {R0,LR}; store needed shits specifically
				; the last shit returned
	BL COMB ; recurse : comb(n-1,m-1)
	POP {R1,LR}; restore needed shits
	ADD R0,R0,R1; add two answers
	MOV PC,LR; return
RETONE
	MOV R0,#1; ; Return one as the result
	MOV PC,LR; Return to caller

	END