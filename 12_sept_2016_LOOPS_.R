
#REPASO DE LOS RESULTADOS OBTENIDOS EN EL CAPITULO 2 de Jockers.

#Al final de ese capítulo Jockers puede contar cuantas veces ocurre la palabra "whale"
# en la novela Moby Dick y los guarda en whale.hits.v

whale.hits.v<-length(moby.word.v[which(moby.word.v=="whale")])

# Obtiene el total de palabras en la novela usando "length"
total.words.v<-length(moby.word.v)
# y puede dividirlo para saber la relación entre el número de veces que se usa la palabra y el total
#de palabras usadas en la novela
whale.hits.v/total.words.v


#EL proceso no sería muy práctico dada la enorme cantidad de palabras en el texto, así que Jockers
#utiliza la función "table" para crear una tabla de contingencia que nos muestre cuantas
#veces se usa cada palabra en Moby Dick, es decir su frecuencia

moby.freqs.t<-table(moby.word.v)

#Como en el caso de los vectores, podemos ver los primeros 10 elementos con una secuencia
moby.freqs.t[1:10]

#pero para verlos en orden según su frecuencia tenemos que reordenar la tabla, colocandolos de
#mayor a menor, es decir de la palabra más usada a la menos frecuente

sorted.moby.freqs.t<-sort(moby.freqs.t , decreasing=T)


#Así podemos ver las primeras 10 en la lista
sorted.moby.freqs.t[1:10]


#Un dato interesante del uso de la tabla es que ya no necesitamos usar "which" como haciamos con
#las listas para encontrar la palabra que queríamos. Podemos usar la palabra que queremos 
# en lugar del índice y obtener su frecuencia

sorted.moby.freqs.t["whale"]


###LOOPS

#En un "loop" se prueba la validez lógica de una condición y se ejecuta 
#una expresión si la condición es verdadera

# if (condition) {
#   se ejecuta si la condicion es verdadera
# }
#ejemplo:



primera_variable<-6
segunda_variable<-5

if (primera_variable > segunda_variable) {
  print("la condicion es cierta")
}



#Operadores lógicos

# < 	menor
# <= 	menor o igual  
# > 	mayor
# >= 	mayor o igual
# == 	igual
# != 	no es igual
# !a 	no es A
# a | b 	Z o W
# a & b 	A y B


#También podemos tener una segunda expresión si la condición es falsa
#Ejemplo

una_variable<-"sol"
otra_variable<-"rosa"


if (una_variable == otra_variable) {
  print("las dos variables son iguales")
} else {
  print("las dos variables no son iguales")
}

#Otra versión, nótese el cambio en el operador:

if (una_variable != "rosa") {
  print("esa variable no contiene la palabra 'rosa' ")
} else {
  print("esa variable sí contiene la palabra 'rosa' ")
}


##ELSE IF- Cuando queremos verificar la validez de más de una condición
if (condition1) {
  # se ejecuta si la condición 1 es verdadera
} else if (condition2) {
  # se ejecuta si la condición 1 es falsa
  # pero la condición 2 es verdadera
} else {
  # se ejecuta si ninguna de las anteriores aplica
}
#############


#LOOP con FOR --para repetir una expresión varias veces

#En un FOR la x va cambiando de valor según la cantoda de elementos
#en el "vector1". En este caso hay tres elementos y va a ir
#multiplicando el valor de cada uno por dos



vector1<- c(4, 9, 16)

for (x in vector1) {
  print("si multiplicamos")
  print(x)
  print("por 2 el resultado es:")
  print(2*x)
}

#La disponibilidad de vectores en R, hace que en muchos casos
# el uso de un "loop" sea innecesario.
#El resultado en el ejemplo anterior, se puede obtener más fácilmente
# con tan sólo multiplicar el vector1 por 2

vector1*2













