.data

mensaje: .asciz "Numero1 %d Numero2 %d \r\n"

.text
.global main
.extern printf		#similar al include<stdio.h>

main:
_start:
	subq $8, %rsp	# Alineamos los datos

	movq $4, %rax
	movq $5, %rbx

	# printf("Numero1 %d Numero2 %d \r\n", rax, rbx)
	#			rdi	      %rsi, %rdx
	movq $mensaje, %rdi
	movq %rax, %rsi
	movq %rbx, %rdx
	xorq %rax, %rax	#RAX se pone en 0 para indicar que no se necesitan registros de punto flotante
	call printf
	addq $8, %rsp	# Alineacion normal

	# Llamamos la funcion salir

	call salir

salir:
	# Salir al sistema
	mov $60, %rax
	xor %rdi, %rdi
	syscall
	ret
