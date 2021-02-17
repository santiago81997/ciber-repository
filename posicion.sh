#!/bin/bash

#Cogemos la longitud del numero
longitud=$(wc  -m $1 | cut -d ' ' -f1)

#Cremoa contador para el while y le decimos que recorra el texto
i=1;
while [ $i != $longitud ]
do
	#Cogemos el bit de la posicion $i
	bit=$(cat $1 | cut -c $i)
	#Le dicemos que mire si el bit es un 0 y sino que meta la posicion en el $2
	if [ $bit == 0 ]; then
		echo -n "$i " >> $2;
	fi
	((i++))
done

echo -n "/ " >> $2
i=1;

#Repetimos el mismo proceso pero ahora con las posiciones del 1
while [ $i != $longitud ]
do
        bit=$(cat $1 | cut -c $i)
        if [ $bit == 1 ]; then
                echo -n "$i " >> $2;
        fi
        ((i++))
done
#Le metemos un salto de linea para que al visualizarlo se muestre bien
echo "" >> $2;
echo "Fin del programa";
