.data
mensaje: .asciz "%ld \n"

.text
.global main
.extern printf          # Indico que quiero utilizar la funcion printf de libc

main:
	subq $8, %rsp   #Alineacion de datos
	xorq %rbx, %rbx         # rbx=0
        # Bloque de impresion
        # printf("%ld \n", rax);
        #           rdi  , rsi
dowhile:
	addq $1, %rbx
	movq $mensaje, %rdi
        movq %rbx, %rsi
	xorq %rax, %rax         # rax=0
	call printf
	cmpq $10, %rbx
	JL dowhile
	addq $8, %rsp   # Alineacion de datos original
        # Salir del sistema
	mov $60, %rax   # Indico que vamos a usar la funcion exit
        xor %rdi, %rdi  # Indico que el argumento tiene un valor de 0
        syscall         # No es parte de ensamblador pero llama a las funciones del sistema
