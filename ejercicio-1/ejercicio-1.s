negative: .double -1
cero: .double 0
uno: .double 1
dos: .double 2
tres: .double 3
limite: .double 13
.text
.global taylor
.global factorial
.global potencia

taylor:
	movsd tres(%rip), %xmm4		#xmm4 contador
	movsd %xmm0, %xmm3		#xmm3 va guardar x
	movsd negative(%rip), %xmm7
	for1:
                ucomisd limite(%rip), %xmm4
                JZ end1
		call factorial
		movsd %xmm1, %xmm2
		movsd %xmm3, %xmm1
		call potencia
		divsd %xmm2, %xmm1
		mulsd %xmm7, %xmm1
		addsd %xmm1, %xmm0
		mulsd negative(%rip), %xmm7
		addsd dos(%rip), %xmm4
                JMP for1
        end1:
	ret

factorial:
	movsd uno(%rip), %xmm1
	movsd uno(%rip), %xmm5
	for2:
		ucomisd %xmm5, %xmm4
		JZ end2
		addsd uno(%rip), %xmm5
		mulsd %xmm5, %xmm1
		JMP for2
	end2:
	ret

potencia:
	movsd %xmm1, %xmm5
	movsd uno(%rip), %xmm6
	for3:
                ucomisd %xmm6, %xmm4
                JZ end3
                mulsd %xmm5, %xmm1
                addsd uno(%rip), %xmm6
                JMP for3
	end3:
	ret
