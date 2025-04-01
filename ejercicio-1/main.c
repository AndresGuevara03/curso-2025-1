#include <stdio.h>
#include <stdlib.h>

double seno(double);
double toRadians(double degree);
int main(){
	double resultado = 0.0;
	double x;
	double flag = 1.0;
	scanf("%lf", &x);
	x = toRadians(x);
	resultado = seno(x);
	printf("%lf\r\n",resultado);
	return 0;
}

double toRadians(double degree){
	int factor = degree/360;
	degree -= (double) factor * 360.0;
	if(degree < -180)
		degree = - degree - 180.0;
	else if(degree > 180.0)
		degree = - degree + 180.0;
	return degree*3.141592654/180.0;
}
