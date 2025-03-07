
.globl _start

.text

_start:

        mov $0x3f, %al
        mov $0xf3, %ah



        # Salir al sistema
        mov  $60, %rax # 60 es la funcion exit
        xor %rdi, %rdi # rdi = 0

        syscall
