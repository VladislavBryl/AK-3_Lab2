.global lab1

.syntax unified

#define A1 #8
#define B1 #7
#define C1 #3

#define A2 #5
#define B2 #15
#define C2 #2

lab1:

	push {lr}

	mov r0, A1
	mov r1, B1
	mov r2, C1
	bl calculate

        mov r0, A2
        mov r1, B2
        mov r2, C2
        bl calculate

	pop {pc}

calculate:

	push { r0, r1, r2, r3, lr }

	sub r3, r0, r1
	cmp r3, #0
	it ge
	addge r3, r1, r0
	sdiv r3, r2

	pop { r0, r1, r2, r3, pc }
