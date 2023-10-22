.data
	
	tam: .word 5 
	vector1: .byte 60 68 -42 -27 -81  
 	
 	salida: .space 5
	contador: .byte 0
	
.text 
	#direcci�n de memoria del vector1, no nos da el primer valor, esto lo har� el lb $t3, ($t1), en los condicionales 
	#no se puede trabajar con la direcci�n sino con el valor.
	la $t1, vector1
	lw $t2, tam
	
	#carga contador y constantes
	lb $a1, contador 
	
	li $a2, 1
	li $a3, -1
	
	#carga vector salida
	la $s1, salida
	
	_for:
		lb $t3, ($t1)
		
		bge $a1, $t2 _fin
		
		
			_if:
			bge $0, $t3 _elseif
			
				
				sb $a2, ($s1)
			j _fincond

			_elseif:
				bge $t3, $0 _else
			
			
				sb $a3, ($s1)
				
			j _fincond
		
			_else:	
				sb $0, ($s1)
			
			_fincond:		
		lb $t4, ($s1)
		
		li $v0, 1
		move $a0, $t4
		syscall
		
		addi $s1, $s1, 1
		addi $a1, $a1, 1
		#sumamos uno a la direcci�n de memoria para que as� se mueva a la siguiente posici�n
		addi $t1, $t1, 1
	j _for
		li $v0, 10
		syscall
_fin:
#En conclusi�n, se puede ver que al no tener ning�n valor en el vector de salida, lo primero que hay que hacer es guardarlo en
#memoria para despu�s acceder a sus correspondientes valores