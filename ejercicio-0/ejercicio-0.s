.data
mensaje: .asciz "%ld \n"

.text
.global main
.extern printf          # Indico que quiero utilizar la funcion printf de libc

main:
	subq $8, %rsp   #Alineacion de datos
	xorq %rbx, %rbx         # rbx=0, rbx y no rax ya que printf usa rax y le asigna 3 al finalizar

dowhile:			# inicio del ciclo
	incq %rbx		# rbx++
	# Bloque de impresion
        # printf("%ld \n", rbx);
        #           rdi  , rsi
	movq $mensaje, %rdi
        movq %rbx, %rsi
	xorq %rax, %rax         # rax=0
	call printf
	cmpq $10, %rbx		# resta 10 con rbx pero no guarda el resultado en rbx
				# solo hace la operacion alterando el registro de banderas
				# para rbx < 10 activara el bit de CF en el registro eflags
				# para rbx = 10 significara 10-10=0 lo que activara ZF y no CF en este caso no salta
	JB dowhile		# salto al inicio del ciclo
	addq $8, %rsp   # Alineacion de datos original
        # Salir del sistema
	mov $60, %rax   # Indico que vamos a usar la funcion exit
        xor %rdi, %rdi  # Indico que el argumento tiene un valor de 0
        syscall         # No es parte de ensamblador pero llama a las funciones del sistema
