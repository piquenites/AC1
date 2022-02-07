

	.data
str1:	.asciiz "Arquitetura de Computadores I"
	.eqv print_int10,1
	.text
	.globl main
	
#####  STRLEN  #####

strlen:	li $t0,0 #len=0
	
while:	lb $t1,0($a0)

	beq $t1,'\0',endw #*s++ != '\0'
	addi $a0,$a0,1 #*s++
	addi $t0,$t0,1 #len++
	
	j while
	
endw:	move $v0,$t0 #return len
	jr $ra
	
#####  MAIN  #####

main:	addiu $sp,$sp,-4 #criar espaco na stack
	sw $ra,0($sp) 	 #salvaguardar o $ra
	
	la $a0,str1
	jal strlen	#(strlen(str))
	
	move $a0,$v0
	li $v0,print_int10 #print_int10(strlen(str))
	syscall
	
	li $v0,0	#return 0;
	
	lw $ra,0($sp)	#repor o valor do $ra
	addiu $sp,$sp,4 #report o espaço na stack



