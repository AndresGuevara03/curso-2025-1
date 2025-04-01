#include <stdio.h>
#include <stdlib.h>

extern float comparar_float(float, float);

int main(int numArgs, char** args){
	printf("Casos de prueba(1: verdadero, 0: falso)\r\n");
	float casos[][2] = {{-0.5F, -0.4F},{-0.5F, 0.4F},{0.5F, -0.4F},{0.5F, 0.4F},{-0.4F, -0.5F},{-0.4F, 0.5F},{0.4F, -0.5F},{0.4F, 0.5F}};
        float resultado;
	size_t n = sizeof(casos)/sizeof(casos[0]);
	for(int i = 0; i < n; i++){
		resultado = comparar_float(casos[i][0], casos[i][1]);
        	printf("\r\n%f > %f = %f \r\n", casos[i][0], casos[i][1], resultado);
	}
        return 0;
}
