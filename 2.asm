#Language: MIPS Assembler

.data
	#valores de entrada
	tam: .word 7  
	centro: .byte 50  
	entrada: .byte 47 45 45 52 54 53 49 
	
	contador: .byte 0
	#valores de salida (el tam será tres porque solo hay tres opciones), tres contadores uno para cada opción
	tam1: .word 3
	salida: .space 3
	cont1: .byte 0
	cont2: .byte 0
	cont3: .byte 0
.text
	#los registros $letra1 tendrán los vectores
	#carga de valores de entrada
	la $t1, entrada
	lw $t2, tam
	lb $t3, centro
	lb $t4, contador
	#carga de valores de salida
	la $a1, salida
	lw $a2, tam1
	lb $s3, cont1
	lb $s4, cont2
	lb $s5, cont3
	
	#esto es para el segundo if
	sub $t5, $t2, 1
		_for:
			bge $t4, $t2, _finfor
			#calculamos la diferencia aquí con los valores de $t1
			
			lb  $k0, ($t1)
			sub $k1, $k0, $t3
			   _if:
			
				ble $k1, $0, _elseif	
		
				addi $s3, $s3, 1
				j _fincond
			   _elseif:
				bne $k1, $0, _else
				
				addi $s4, $s4, 1
				j _fincond
			   _else:
			   	addi $s5, $s5, 1
			_fincond:
			
			#almacena los valores en el vector salida cuando ya no se va a entrar más al for
			_if2:
				bne $t5, $t4, _finif2
			
			sb $s3, ($a1)
			addi $a1, $a1, 1
			sb $s4, ($a1)
			addi $a1, $a1, 1
			sb $s5,($a1)
			
			_finif2:
			addi $t4, $t4, 1
			addi $t1, $t1, 1
			
		j _for
		
		_finfor:
			li $t4, 0
			sub $a1, $a1, 2
			#asignamos el registro $k0 para el valor del vector y restamos tres a la dirección de memoria de $a1
			#para que comience desde el principio
		_for2:
		bge $t4, $a2 _fin
			lb $k0, ($a1)
				
			
			addi $t4, $t4, 1
			addi $a1, $a1, 1
			
			li $v0, 1
			move $a0, $k0
			syscall
		j _for2
_fin:	
			li $v0, 10
			syscall
	
