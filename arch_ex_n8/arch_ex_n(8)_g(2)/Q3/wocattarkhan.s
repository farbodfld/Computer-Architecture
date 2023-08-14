	mov r4, #0x5000
	mov r5, #0x10000
	
	mov r6, #0x8
	mov r7, #0x10
	
	mov r0, #0x0
OUTERFOR:
	cmp r0, #0x8 
	bge ENDOFOUTERLOOP
	
	mov r1, #0x0
INNERLOOP:
	cmp r1, #0x10
	bge ENDOFINNERLOOP
	
	mul r2, r1, r6
	add r2, r2, r0
	
	mul r3, r0, r7
	add r3, r3, r1
	
	ldr r12 , [r5,r3,lsl #0x2]
	str r12 , [r4,r2,lsl #0x2]
	
	add r1,#0x1
	b INNERLOOP
ENDOFINNERLOOP:
	add r0,#0x1
	b OUTERFOR
ENDOFOUTERLOOP:
	b ENDOFOUTERLOOP
