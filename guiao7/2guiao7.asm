

	.data
str:	.asciiz "ITED - orievA ed edadisrevinU"
	.eqv print_string,4
	.text
	.globl main
	
#####  STRREV  #####

strrev:	addiu $sp,$sp,-16 #liberta espaço da stack
	sw $ra,0($sp) # salvaguarda o $ra 
	sw $s0,4($sp) # salvaguarda o *str
	sw $s1,8($sp) # salvaguarda o *p1
	sw $s2,12($sp) # salvaguarda o *p2
	
	move $s0,$a0 #*str
	move $s1,$a0 #*p1
	move $s2,$a0 #*p2
	
while1:	lb $t1,0($s2) #*p2 
	beq $t1,'\0',endw1 #*p2 != '\0'
	
	addi $s2,$s2,1 #p2++
	
	j while1
	
endw1:	addi $s2,$s2,-1 #p2--

while2:	bge $s1,$s2,endw2
	
	move $a0,$s1
	move $a1,$s2
	jal exchange
	
	addi $s1,$s1,1 #p1++
	addi $s2,$s2,-1 #p2--
	
	j while2
	
endw2:	move $v0,$s0 #return str
	
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	addiu $sp,$sp,16

	jr $ra
	
#####  EXCHANGE  #####

exchange:	lb $t0,0($a0)
		lb $t1,0($a1)
		sb $t0,0($a1)
		sb $t1,0($a0)
	
		jr $ra
#####  MAIN  #####

main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	
	la $a0,str
	jal strrev
	
	move $a0,$v0
	li $v0,print_string
	syscall
	
	li $v0,0
	
	lw $ra,0($sp)
	addiu $sp,$sp,4	
	
	jr $ra
	
	
	