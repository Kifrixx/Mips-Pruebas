.data
	.data 
	tam: .word 7  
	centro: .byte -12  
	entrada: .byte -18 -11 -12 -14 -14 -10 -13 
	contador: .byte 0
	salida: .space 1
	
	suma: .byte 0
	media: .byte 0
.text
	#vector 1
	la $t1, entrada
	lw $t2, tam
	lb $t3, centro
	lb $t4, contador
	#vector 2
	la $k0, salida
	
	lb $s0, suma
	lb $s1, media
	_for: bge $t4, $t2, _finfor
	
		lb $t5, ($t1)
		add $s0, $s0, $t5 
	
		
	addi $t4, $t4, 1
	addi $t1, $t1, 1
	j _for
_finfor:
	div $s1, $s0, $t2
	sub $s2, $s1, $t3
	
	sb $s2, ($k0)
	
	li $v0, 1
	move $a0, $s1
	syscall

	li $v0, 10
	syscall
		