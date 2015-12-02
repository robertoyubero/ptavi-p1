#examen Dic2014

.data
	cad_origen: .space 1024
	cad_destino: .space 1024
	max_chars: .byte 10		#numero maximo de caracteres que leo por teclado
	
	traza: .asciiz "\niteracion"
	fin: .asciiz "\nFin."

.text
main:

	la $a0, cad_origen	#guardamos la direccion de cad_origen en $a0
	la $a1, max_chars	#guardamos el numero max de caracteres a leer en $a1
	#leemos por teclado
	jal read_string
		
	move $a0, $v0		#guardo en $a0 la cad_origen
	la $a1, cad_destino	#guardo en $a1 cad_destino
	#copiamos la cadena almacenada
	jal copy_str	


#imprimo la cadena copiada		
	li $v0, 4
	syscall
	
	
	#fin programa		
	la $a0, fin		
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall

read_string:
	#no creo pila xq no modifico los valores ¿?

	#procedo a leer por teclado
	li $v0, 8
	syscall
	
	move $v0, $a0
	jr $ra
	

copy_str:	

	subu $sp, $sp, 32
	sw $a0, 20($sp)
	#calculo el numero de caracteres a copiar
	#jal str_len

	#copio los n caracteres que me devuelve stl_len, almacenado n en $v0
	#de momento suponemos n = 3
	move $t0, $a0	#guardo cad_origen en $s0
	move $t1, $a1	#guardo cad_destino en $s1	
	li $t7, 3	#n_chars
	li $t6, 0	#contador de posicions que copio

bucle:
	lb $t1, 0($t0)
	add $t0, $t0, 1
	add $t1, $t1, 1

	add $t6, $t6, 1		#sumo el contador	
	
	bgt $t6, $t7, return
	b bucle
		
return:
	move $a0, $a1
        li $v0, 4
	syscall



	move $v0, $a1
	jr $ra
