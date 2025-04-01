negative: .double -1
uno: .double 1
dos: .double 2
tres: .double 3
limite: .double 13
.text
.global seno
.global factorial
.global potencia

seno:
	movsd tres(%rip), %xmm4			#xmm4 contador n
	movsd %xmm0, %xmm3			#xmm3 va guardar x
	movsd negative(%rip), %xmm7		#bandera que alterna el signo de los terminos
	for1:
                ucomisd limite(%rip), %xmm4
                JZ end1
		call factorial
		movsd %xmm1, %xmm2		#guardar el valor del factorial en el registro xmm2
		movsd %xmm3, %xmm1		#volvemos a poner a x en xmm1 para calcular la potencia
		call potencia
		divsd %xmm2, %xmm1		#(x^n)/n!
		mulsd %xmm7, %xmm1		#signo del termino
		addsd %xmm1, %xmm0		#xmm0 += xmm0
		mulsd negative(%rip), %xmm7	#xmm7 *= -1
		addsd dos(%rip), %xmm4		#n += 2
                JMP for1
        end1:
	ret

factorial:
	movsd uno(%rip), %xmm1			#xmm1 = 1 neutro multiplicativo
	movsd uno(%rip), %xmm5			#xmm5 = 1 primer valor del factorial (1,2,3,4,...,n)
	for2:
		ucomisd %xmm5, %xmm4
		JBE end2
		addsd uno(%rip), %xmm5
		mulsd %xmm5, %xmm1		#xmm1 *= xmm5
		JMP for2
	end2:
	ret

potencia:
	movsd %xmm1, %xmm5			#guardar el valor de x
	movsd uno(%rip), %xmm6			#contador
	for3:
                ucomisd %xmm6, %xmm4
                JBE end3
                mulsd %xmm5, %xmm1		#xmm1 *= xmm5
                addsd uno(%rip), %xmm6
                JMP for3
	end3:
	ret
