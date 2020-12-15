	            .data
w1: .float 0.000000
w2: .float 0.800000
zero: .float 0.000000
um: .float 1.0
p1: .float 1.0
p2: .float 2.0
p3: .float 3.0
p4: .float 4.0
p5: .float 5.0
txaprend: .float 0.05
msgpeso3: .asciiz "\nNOVO VALOR DO PRIMEIRO PESO:\n "
msgpeso4: .asciiz "\nNOVO VALOR DO SEGUNDO PESO:\n "
msgerro: .asciiz "\nERRO: \n "
rep1: .asciiz "\n\n========== PRIMEIRO TESTE ==========\n "
rep2: .asciiz "\n\n========== SEGUNDO TESTE ==========\n "
rep3: .asciiz "\n\n========== TERCEIRO TESTE ==========\n "
rep4: .asciiz "\n\n========== QUARTO TESTE ==========\n "
rep5: .asciiz "\n\n========== QUINTO TESTE ==========\n "
fin1: .asciiz "\n\n========== RESULTADO PARA O VALOR 1 ========== \n "
fin2: .asciiz "\n\n========== RESULTADO PARA O VALOR 2 ========== \n "
fin3: .asciiz "\n\n========== RESULTADO PARA O VALOR 3 ========== \n "
fin4: .asciiz "\n\n========== RESULTADO PARA O VALOR 4 ========== \n "
fin5: .asciiz "\n\n========== RESULTADO PARA O VALOR 5 ========== \n "
desejado: .asciiz "\n\nVALOR DESEJADO: \n "
obtido: .asciiz "\n\nVALOR OBTIDO: \n "
diferenca: .asciiz "\n\nDIFERENCA: \n "
inicial: .asciiz "\n\nVAMOS ENSINAR NOSSA I.A. A SOMAR OS VALORES 1, 2, 3, 4 E 5 -> TUDO ISSO EM UMA EPOCA! \n "

	.text
	
main:	
	li $v0, 4
	la $a0, inicial
	syscall



	lwc1 $f0, w1 #carrega o valor do peso1
	lwc1 $f2, w2 #carrega o valor do peso2

	######################################################################################################################## PRIMEIRA EXECUÇÃO
	
	li $v0, 4
	la $a0, rep1
	syscall
	

	lwc1 $f1, zero #carrega um valor padrao zerado
	lwc1 $f4, p1 #carrega o primeiro valor
	

	
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	mul.s $f6, $f4, $f0 #multiplica o primeiro valor pelo peso 1
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	mul.s $f8, $f4, $f2 #multiplica o segundo valor pelo peso 2
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	add.s $f10, $f4, $f4 #calcula o valor esperado
	add.s $f14, $f6, $f8 #calcula o valor obtido
	sub.s $f16, $f10, $f14 #calcula o erro
	sub.s $f12, $f10, $f14 #salva no f12 para imprimir

	li $v0, 4
	la $a0, msgerro
	syscall

	li $v0, 2
	syscall
	############################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	mul.s $f20, $f18, $f16 
	mul.s $f22, $f20, $f4
	add.s $f0, $f0, $f22
	lwc1 $f24, um #carrega a taxa de aprendizado
	mul.s $f12, $f0, $f24
	
	
	li $v0, 4
	la $a0, msgpeso3
	syscall
	
	li $v0, 2
	syscall
	############################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	sub.s $f20, $f1, $f1 #zera o valor de f20
	sub.s $f22, $f1, $f1 #zera o valor de f22
	mul.s $f20, $f18, $f16 
	mul.s $f22, $f20, $f4
	add.s $f2, $f2, $f22
	lwc1 $f24, um #carrega um valor um
	mul.s $f12, $f2, $f24
	
	
	li $v0, 4
	la $a0, msgpeso4
	syscall
	
	li $v0, 2
	syscall
	############################################################################
	
	
	
	######################################################################################################################## SEGUNDA EXECUÇÃO
	
	li $v0, 4
	la $a0, rep2
	syscall
	
	lwc1 $f1, zero #carrega um valor padrao zerado
	lwc1 $f4, p2 #carrega o segundo valor
	

	
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	mul.s $f6, $f4, $f0 #multiplica o primeiro valor pelo peso 1
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	mul.s $f8, $f4, $f2 #multiplica o segundo valor pelo peso 2
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	add.s $f10, $f4, $f4 #calcula o valor esperado
	add.s $f14, $f6, $f8 #calcula o valor obtido
	sub.s $f16, $f10, $f14 #calcula o erro
	sub.s $f12, $f10, $f14 #salva no f12 para imprimir

	li $v0, 4
	la $a0, msgerro
	syscall

	li $v0, 2
	syscall
	############################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	mul.s $f20, $f18, $f16 
	mul.s $f22, $f20, $f4
	add.s $f0, $f0, $f22
	lwc1 $f24, um #carrega a taxa de aprendizado
	mul.s $f12, $f0, $f24
	
	
	li $v0, 4
	la $a0, msgpeso3
	syscall
	
	li $v0, 2
	syscall
	############################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	sub.s $f20, $f1, $f1 #zera o valor de f20
	sub.s $f22, $f1, $f1 #zera o valor de f22
	mul.s $f20, $f18, $f16 
	mul.s $f22, $f20, $f4
	add.s $f2, $f2, $f22
	lwc1 $f24, um #carrega um valor um
	mul.s $f12, $f2, $f24
	
	
	li $v0, 4
	la $a0, msgpeso4
	syscall
	
	li $v0, 2
	syscall
	############################################################################
	
	######################################################################################################################## TERCEIRA EXECUÇÃO
	
	li $v0, 4
	la $a0, rep3
	syscall
	
	lwc1 $f1, zero #carrega um valor padrao zerado
	lwc1 $f4, p3 #carrega o terceiro valor
	

	
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	mul.s $f6, $f4, $f0 #multiplica o primeiro valor pelo peso 1
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	mul.s $f8, $f4, $f2 #multiplica o segundo valor pelo peso 2
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	add.s $f10, $f4, $f4 #calcula o valor esperado
	add.s $f14, $f6, $f8 #calcula o valor obtido
	sub.s $f16, $f10, $f14 #calcula o erro
	sub.s $f12, $f10, $f14 #salva no f12 para imprimir

	li $v0, 4
	la $a0, msgerro
	syscall

	li $v0, 2
	syscall
	############################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	mul.s $f20, $f18, $f16 
	mul.s $f22, $f20, $f4
	add.s $f0, $f0, $f22
	lwc1 $f24, um #carrega a taxa de aprendizado
	mul.s $f12, $f0, $f24
	
	
	li $v0, 4
	la $a0, msgpeso3
	syscall
	
	li $v0, 2
	syscall
	############################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	sub.s $f20, $f1, $f1 #zera o valor de f20
	sub.s $f22, $f1, $f1 #zera o valor de f22
	mul.s $f20, $f18, $f16 
	mul.s $f22, $f20, $f4
	add.s $f2, $f2, $f22
	lwc1 $f24, um #carrega um valor um
	mul.s $f12, $f2, $f24
	
	
	li $v0, 4
	la $a0, msgpeso4
	syscall
	
	li $v0, 2
	syscall
	############################################################################
	
	######################################################################################################################## QUARTA EXECUÇÃO
	
	li $v0, 4
	la $a0, rep4
	syscall
	
	lwc1 $f1, zero #carrega um valor padrao zerado
	lwc1 $f4, p4 #carrega o quarto valor
	

	
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	mul.s $f6, $f4, $f0 #multiplica o primeiro valor pelo peso 1
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	mul.s $f8, $f4, $f2 #multiplica o segundo valor pelo peso 2
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	add.s $f10, $f4, $f4 #calcula o valor esperado
	add.s $f14, $f6, $f8 #calcula o valor obtido
	sub.s $f16, $f10, $f14 #calcula o erro
	sub.s $f12, $f10, $f14 #salva no f12 para imprimir

	li $v0, 4
	la $a0, msgerro
	syscall

	li $v0, 2
	syscall
	############################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	mul.s $f20, $f18, $f16 
	mul.s $f22, $f20, $f4
	add.s $f0, $f0, $f22
	lwc1 $f24, um #carrega a taxa de aprendizado
	mul.s $f12, $f0, $f24
	
	
	li $v0, 4
	la $a0, msgpeso3
	syscall
	
	li $v0, 2
	syscall
	############################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	sub.s $f20, $f1, $f1 #zera o valor de f20
	sub.s $f22, $f1, $f1 #zera o valor de f22
	mul.s $f20, $f18, $f16 
	mul.s $f22, $f20, $f4
	add.s $f2, $f2, $f22
	lwc1 $f24, um #carrega um valor um
	mul.s $f12, $f2, $f24
	
	
	li $v0, 4
	la $a0, msgpeso4
	syscall
	
	li $v0, 2
	syscall
	############################################################################
	
	######################################################################################################################## QUINTA EXECUÇÃO
	
	li $v0, 4
	la $a0, rep5
	syscall
	
	lwc1 $f1, zero #carrega um valor padrao zerado
	lwc1 $f4, p5 #carrega o quinto valor
	

	
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	mul.s $f6, $f4, $f0 #multiplica o primeiro valor pelo peso 1
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	mul.s $f8, $f4, $f2 #multiplica o segundo valor pelo peso 2
	###########################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	add.s $f10, $f4, $f4 #calcula o valor esperado
	add.s $f14, $f6, $f8 #calcula o valor obtido
	sub.s $f16, $f10, $f14 #calcula o erro
	sub.s $f12, $f10, $f14 #salva no f12 para imprimir

	li $v0, 4
	la $a0, msgerro
	syscall

	li $v0, 2
	syscall
	############################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	mul.s $f20, $f18, $f16 
	mul.s $f22, $f20, $f4
	add.s $f0, $f0, $f22
	lwc1 $f24, um #carrega a taxa de aprendizado
	mul.s $f12, $f0, $f24
	
	
	li $v0, 4
	la $a0, msgpeso3
	syscall
	
	li $v0, 2
	syscall
	############################################################################
	sub.s $f12, $f1, $f1 #zera o valor de f12
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	sub.s $f20, $f1, $f1 #zera o valor de f20
	sub.s $f22, $f1, $f1 #zera o valor de f22
	mul.s $f20, $f18, $f16 
	mul.s $f22, $f20, $f4
	add.s $f2, $f2, $f22
	lwc1 $f24, um #carrega um valor um
	mul.s $f12, $f2, $f24
	
	
	li $v0, 4
	la $a0, msgpeso4
	syscall
	
	li $v0, 2
	syscall
	############################################################################
	
	######################################################################################################################## RESULTADO TESTE FINAL 1
	li $v0, 4
	la $a0, fin1
	syscall
	
	lwc1 $f4, p1 #carrega o primeiro valor
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	sub.s $f12, $f1, $f1 #zera o valor de f12
	sub.s $f20, $f1, $f1 #zera o valor de f20
	sub.s $f22, $f1, $f1 #zera o valor de f22
	mul.s $f26, $f0, $f4
	mul.s $f28, $f2, $f4
	add.s $f30, $f26, $f28
	
	sub.s $f10, $f1, $f1 #zera o valor de f22
	li $v0, 4
	la $a0, desejado
	syscall
	add.s $f10, $f4, $f4
	add.s $f12, $f4, $f4
	li $v0, 2
	syscall
	
	
	li $v0, 4
	la $a0, obtido
	syscall
	sub.s $f12, $f1, $f1 #zera o valor de f12
	add.s $f12, $f26, $f28
	li $v0, 2
	syscall
	
	
	
	li $v0, 4
	la $a0, diferenca
	syscall
	
	sub.s $f12, $f10, $f30
	li $v0, 2
	syscall
	
	######################################################################################################################## RESULTADO TESTE FINAL 2
	li $v0, 4
	la $a0, fin2
	syscall
	
	lwc1 $f4, p2 #carrega o primeiro valor
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	sub.s $f12, $f1, $f1 #zera o valor de f12
	sub.s $f20, $f1, $f1 #zera o valor de f20
	sub.s $f22, $f1, $f1 #zera o valor de f22
	mul.s $f26, $f0, $f4
	mul.s $f28, $f2, $f4
	add.s $f30, $f26, $f28
	
	sub.s $f10, $f1, $f1 #zera o valor de f22
	li $v0, 4
	la $a0, desejado
	syscall
	add.s $f10, $f4, $f4
	add.s $f12, $f4, $f4
	li $v0, 2
	syscall
	
	
	li $v0, 4
	la $a0, obtido
	syscall
	sub.s $f12, $f1, $f1 #zera o valor de f12
	add.s $f12, $f26, $f28
	li $v0, 2
	syscall
	
	
	
	li $v0, 4
	la $a0, diferenca
	syscall
	
	sub.s $f12, $f10, $f30
	li $v0, 2
	syscall
	
	######################################################################################################################## RESULTADO TESTE FINAL 3
	li $v0, 4
	la $a0, fin3
	syscall
	
	lwc1 $f4, p3 #carrega o primeiro valor
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	sub.s $f12, $f1, $f1 #zera o valor de f12
	sub.s $f20, $f1, $f1 #zera o valor de f20
	sub.s $f22, $f1, $f1 #zera o valor de f22
	mul.s $f26, $f0, $f4
	mul.s $f28, $f2, $f4
	add.s $f30, $f26, $f28
	
	sub.s $f10, $f1, $f1 #zera o valor de f22
	li $v0, 4
	la $a0, desejado
	syscall
	add.s $f10, $f4, $f4
	add.s $f12, $f4, $f4
	li $v0, 2
	syscall
	
	
	li $v0, 4
	la $a0, obtido
	syscall
	sub.s $f12, $f1, $f1 #zera o valor de f12
	add.s $f12, $f26, $f28
	li $v0, 2
	syscall
	
	
	
	li $v0, 4
	la $a0, diferenca
	syscall
	
	sub.s $f12, $f10, $f30
	li $v0, 2
	syscall
	
	######################################################################################################################## RESULTADO TESTE FINAL 4
	li $v0, 4
	la $a0, fin4
	syscall
	
	lwc1 $f4, p4 #carrega o primeiro valor
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	sub.s $f12, $f1, $f1 #zera o valor de f12
	sub.s $f20, $f1, $f1 #zera o valor de f20
	sub.s $f22, $f1, $f1 #zera o valor de f22
	mul.s $f26, $f0, $f4
	mul.s $f28, $f2, $f4
	add.s $f30, $f26, $f28
	
	sub.s $f10, $f1, $f1 #zera o valor de f22
	li $v0, 4
	la $a0, desejado
	syscall
	add.s $f10, $f4, $f4
	add.s $f12, $f4, $f4
	li $v0, 2
	syscall
	
	
	li $v0, 4
	la $a0, obtido
	syscall
	sub.s $f12, $f1, $f1 #zera o valor de f12
	add.s $f12, $f26, $f28
	li $v0, 2
	syscall
	
	
	
	li $v0, 4
	la $a0, diferenca
	syscall
	
	sub.s $f12, $f10, $f30
	li $v0, 2
	syscall
	
	######################################################################################################################## RESULTADO TESTE FINAL 5
	li $v0, 4
	la $a0, fin5
	syscall
	
	lwc1 $f4, p5 #carrega o primeiro valor
	lwc1 $f18, txaprend #carrega a taxa de aprendizado
	sub.s $f12, $f1, $f1 #zera o valor de f12
	sub.s $f20, $f1, $f1 #zera o valor de f20
	sub.s $f22, $f1, $f1 #zera o valor de f22
	mul.s $f26, $f0, $f4
	mul.s $f28, $f2, $f4
	add.s $f30, $f26, $f28
	
	sub.s $f10, $f1, $f1 #zera o valor de f22
	li $v0, 4
	la $a0, desejado
	syscall
	add.s $f10, $f4, $f4
	add.s $f12, $f4, $f4
	li $v0, 2
	syscall
	
	
	li $v0, 4
	la $a0, obtido
	syscall
	sub.s $f12, $f1, $f1 #zera o valor de f12
	add.s $f12, $f26, $f28
	li $v0, 2
	syscall
	
	
	
	li $v0, 4
	la $a0, diferenca
	syscall
	
	sub.s $f12, $f10, $f30
	li $v0, 2
	syscall
	
	
	jr $ra