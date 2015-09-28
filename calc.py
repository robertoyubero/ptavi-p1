#!/usr/bin/python3
# -*- coding: utf-8 -*-

# Vamos a programar una calculadora

import sys                          #importamos el paquete sys para leer del teclado!

def main():
    pass;

#definimos la suma
def suma(sumando1, sumando2):
    return sumando1 + sumando2
    
#definimos la division
def division(dividendo, divisor):
    return dividendo / divisor
    
#definimos la division


if __name__ == "__main__":

    try:
        print("\n1) OPERACION SUMA:\n"+ "Introduce el sumando a = ", end = "")
        operando1 = int(input())
        print("Introduce el sumando b = ", end = "")
        operando2 = int(input())

    except ValueError:
        sys.exit("¡Tienen que ser enteros!")
    print("El resultado de la suma es = " + str(suma(operando1, operando2)))


    try:
        print("\n2) OPERACION DIVISION:\n"+ "Introduce el dividendo D = ", end = "")
        dividendo = float(input())
        print("Introduce el divisor d = ", end = "")
        divisor = float(input())        
        
    except ZeroDivisionError: 
        sys.exit("No puedes dividir por 0")    
    print("El resultado de la division es = " + str(division(dividendo,divisor)))
    
    
