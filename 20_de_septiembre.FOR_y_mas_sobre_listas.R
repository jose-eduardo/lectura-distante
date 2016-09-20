
#Clase 4ta. En esta ocasion no coloco las tildes para evitar errores 
#en aquellos casos en que el estudiante todavia tiene problemas
#con la instalacion del programa



#LOOPs--el uso de FOR
#En algunas ocasiones un programa de computadora debe repetir un comando varias veces
#Ejemplo


print("Hola, Pedro")
print("Hola, Manuel")
print("Hola, Isabel")


#Cual es el patron que siguen los tres?

#La palabra "Hola"+nombre


#Podemos evitar tener que escribir los nombres si creamos un vector con todos ellos
nombres<-c("Pedro", "Manuel", "Isabel")

#Ahora solo necesitamos cambiar el numero del elemento que queremos en el vector
nombres[1]
nombres[2]
nombres[3]


#Si pudieramos hacer que el numero/indice cambiara, podriamos utilizar un vector
#y repetir el mismo patron, con solo un cambio en el numero-índice del vector

print(paste("Hola", nombres[1]))
print(paste("Hola", nombres[2]))
print(paste("Hola", nombres[3]))

#No es una solucion mejor. Necesitariamos que el número/indice del vector cambie automaticamente para no 
#tener que hacerlo manualmente. 

#Para lograr este objetivo puedo usar FOR. Como tengo tres nombres le pido a FOR que vaya cambiando el numero
#del 1 al 3

for (numero in 1:3){
  print(paste("Hola", nombres[numero]))
}

#Esto funciona bien si se que tengo 3 nombres en mi vector y necesito por lo tanto tres
# numeros, pero que pasaria si no se cuantos elementos hay dentro de mi vector?
#Empiezo mi "for" en 1 y le pido que mida el tamaño de mi vector para saber donde termina
#usando "length"

for (numero in 1:length(nombres)){
  print(paste("hola", nombres[numero]))
}



###Mas sobre listas 
##Sabemos la diferencia basica entre lista y vector (mira la leccion de la segunda clase)

#Una lista puede contener diferentes tipos de elementos (números, letras)

a<-(10:20) #creamos un vector de números
b<-c("agua", "casa", "camino", "perro") #y otro de palabras

lista_1 = list(a,b)

#así tenemos una lista con elementos diferentes
lista_1

#Podemos ver los vectores que componen esta lista por separado

lista_1[[2]]

#o podemos ver el cuarto elemento de ese vector

lista_1[[2]][4]


#pero usar número para nombrar los vectores que componen la lista puede ser
#confuso, así que puedo usar nombres

lista_2 = list(numeros=10:20, palabras=c("agua", "casa", "camino", "perro"))

#ahora puedo ver los elementos en "números" de la siguiente manera

lista_2[["numeros"]]

#o así

lista_2$numeros


#Si quisiera cambiar uno de los elementos en la lista puedo asignarle un valor nuevo
#Por ejemplo, el cuarto elemento en "palabras" es "perro" y quiero cambiarlo
# a "ventana"

lista_2[["palabras"]][4]<-"ventana"

#Ahora el resultado es diferente
lista_2[["palabras"]][4]

#Como hemos visto los nombres de las partes de una lista se asignan al momento de su creación.
#Jockers lo hace una manera diferente. El crea primero una lista vacía y luego asigna el nombre
#y los elementos

#Lista vacía

lista_3<-list()

#asignamos el nombre al componente de la lista y colocamos los elementos que van adentro

lista_3[["Amistad Funesta"]]<-c("una", "novela", "por", "Jose", "Marti")

#podemos ir aumentando la lista


lista_3[["La novela del tranvia"]]<-c("un", "cuento", "por", "Gutierrez", "Najera")


#Jockers va a utilizar este sistema en su capitulo 4, para asignar el titulo de libros o capitulos a las listas

















