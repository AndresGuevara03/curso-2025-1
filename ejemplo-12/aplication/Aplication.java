package aplication;

import libcalculadora.JavaCalculadora;

public class Aplication{
	JavaCalculadora calculadora = null;

	static{
		System.loadLibrary("calc");
	}

	public Aplication(){
		this.calculadora = new JavaCalculadora();
		System.out.println("La suma de 3 + 5 es " + calculadora.sumar(3,5));
	}

	public static void main(String[] args){
		new Aplication();
	}
}
