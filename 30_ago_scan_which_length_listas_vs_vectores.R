#Sucesión o Secuencia ('sequences')
#Estas se crean con el símbolo (:)

1:5 # sucesión
#el resultado será
#[1] 1 2 3 4 5

#Así que podemos asignarlas a una variable:

A <- 1:5
B <- 5:10
# El resultado para A será
# [1] 1 2 3 4 5
#El resultado para B será
# [1] 5 6 7 8 9 10


#Podemos concadenarlas:

c(A, B)

#El resultado será
# [1] 1 2 3 4 5 5 6 7 8 9 10

#Nótese la diferencia si las cambiamos de lugar
c(B, A)

#El resultado es diferente
#[1]  5  6  7  8  9 10  1  2  3  4  5

#¿Por qué ocurre esto?

#Recuerden estamos CONCADENANDO, no ordenando los números ni ejecutando 
#ninguna operación aritmética con ellos

#Las secuencias nos permiten ver varios elementops que estén dentro de un vector
#Por ejemplo, vamos a crear un vector concadenando varios apellidos

apellidos<-c("González", "Rodríguez", "Acevedo", "Ramírez", "Pérez", "García", "Avellano", "Cortés", "Ríos")

#Sé que puedo ver el cuarto elemento de este vector si escribo el "número" (conocido como índice) que indica la localización de ese elemento
apellidos[4]

#¿Qué necesito hacer para ver todos los elementos del 4 al 7?

##RESPUESTA
#Podría concadenar los índices de los elementos que quiero:
apellidos[c(4,5,6,7)]

#Pero es más eficaz (y fácil de recordar) usar una secuencia

apellidos[4:7]


#Puedo así crear un vector nuevo que contenga los elementos que yo quiero
apellidos_deseados<-apellidos[4:7]



##NOTAS SOBRE EL CAPITULO 2 de TAWR
#Jockers va a empezar leyendo un texto a un vector. 
# Utilizando el siguiente formato
text.v<-scan("~/SPAN991/TextAnalysisWithR/data/plainText/melville.txt", what="character", sep="\n")
#Al argumento "what" le explicamos que estamos leyendo un grupo de palabras y el "\n" del argumento "sep"
# indica que cada "nueva línea" del texto se debe colocar como un nuevo elemento del vector. Así, si el texto
#tiene 300 líneas (no oraciones, sino las líneas #en las que se haya dividido el texto al pasarlo a la manera digital)
#tendremos un vector de 300 elementos.
#En el ejemplo de Jockers, el libro de "Moby Dick" estará en un vector de ??? elementos. Por ejemplo, si queremos ver
#la línea 200 del texto escribiríamos text.v[200]


#Para hacer lo mismo con un texto en español, necesitamos hacer un pequeño cambio para
#lograr que las tildes sean reconocidas. Vamos a anadir  " fileEncoding='UTF-8' " lo
#cual ayuda a que R entienda el tipo de archivo que tenemos

#Antes de ejectutar la próxima línea, cambia el nombre de la localización del archivo
#de acuerdo al nombre que le hayas asignado a tu carpeta. De ser necesario
#utiliza el "set working directory" de Rstudio para esto.

poema.v<-scan("~/Documents/SPAN991/poema_dario.txt", fileEncoding='UTF-8', what="character", sep="\n")

#si queremos saber cuantas líneas tiene nuestro texto (o cuál es el tamaño de un vector)
length(poema.v)

#Así sé que la última línea del poema es 250 y si quiero leerla, sólo tengo que escribir
poema.v[250]

#Nótese que las lineas en blanco o sin información no son guardadas en el 
#vector. Si miramos el contenido del archivo con Notepad++ o Textwrangler (dependiendo de su sistema)
#veremos que la línea 2 está en blanco, por eso el vector no la reconoce. En lugar de una
#línea en blanco, saldrá la próxima linea que no este en blanco, si escribo
poema.v[2]



#Pero supongamos que no sé cuál es el índice de uno de los vectores, ¿qué hago?
#Por ejemplo, si sólo quiero ver la primera parte del poema
#antes que los personajes hablen, puedo escribir, usando una secuencia

poema.v[2:26]

#Pero ¿cómo sé sus índices para lograr esto?
#para esto podemos usar "which"

#Busco el índice de la primera línea que me interesa
which(poema.v=="En la isla en que detiene su esquife el argonauta")
#veo que el resultado es 2
#puedo guardar esa información enuna variable
primera_linea<-which(poema.v=="En la isla en que detiene su esquife el argonauta")
#hago lo mismo con la última línea que me interesa
ultima_linea<-which(poema.v=="La voz de los crinados cuadrúpedos divinos.")

#ahora puedo usar las variables para mostrar la parte del poema que me interesa
#en una secuencia
poema.v[primera_linea:ultima_linea]

#puedo guardar esta información en un vector diferente
comienzo_del_poema.v<-poema.v[primera_linea:ultima_linea]


#A Jockers le va interesar separar los metadatos del texto como tal.
#Los metadatos en un documento literario son toda aquella información que ayuda a identificar
#clasificar y describir el texto literario, como por ejemplo el título, editorial, año de
#publicación y cualquier otro material que no sea el texto literario mismo y que no queremos que 
#interfiera con nuestro análisis. 

#En el ejemplo del poema de Darío, los metadatos son sólo el título del poema y una oración al final que
#indica el "FIN DEL TEXTO"

#Ejercicio:
#¿Cuál sería el código para obtener todo el texto, excepto los metadatos?



#DIFERENCIA VECTORES y LISTAS

#Ya sabemos que en un vector podemos incluir un grupo de elementos y tener
#cada información en un "lugar" designado con índice diferente. 

numeros.v<-c(23, 34, 55, 44, 66, 67, 88, 90, 100, 10.5, 44, 56, 78, 99, 100, 24, 33)
#podemos usar el índice (o lugar en el órden en que fue guardado) para ver los que queremos
numeros.v[4:8]
#El vector puede ser de un tipo específico. Por ejemplo, puede ser numérico, o puede ser de palabras, 
#pero no podemos combinar números y palabras. Si intentamos combinar números y palabras.
#el lenguaje R convertirá todos los elementos a palabras.
numeros_y_palabras.v<-c(23, 34, "gonzález", "pérez")
#los "números" dejan de ser números, es decir, no podemos realizar operaciones
#aritméticas con ellos

#podemos escribir el comando "class" para ver qué tipo de elementos tenemos en un vector
class(numeros_y_palabras.v)


#Una lista es diferente porque podemos colocar diferentes tipos de elementos en ella
numeros_y_palabras.l<-list(23, 34, "gonzález", "pérez")

#si usamos el comando "str" y vemos la estructura de la lista que acabamos de crear
#y así podemos ver la diferencia con el vector

str(numeros_y_palabras.l)

#si sólo queremos ver un componente de la lista
numeros_y_palabras.l[[2]]
#notese el uso de dos pares de corchetes para accesar el contenido a diferencia de los vectores
#si usamos solo un par de corchetes, podriamos ver el contenido pero no manipularlo directamente


#Otra característica de la lista es que puede tener muchos elementos dentro de cada componente de la lista
#Por ejemplo, si creamos dos vectores


n = c(2, 3, 5) 
s = c("aa", "bb", "cc", "dd", "ee") 

# y los guardamos en una lista
una_lista.l = list(n, s)   
#cada vector es un componente de la lista x 
#el primer elemento de la lista 
una_lista.l[[1]]

#contiene 3 elementos
#y el segundo
una_lista.l[[2]]
#contiene cinco "palabras"

#En un vector no podemos hacer esto. Cada componente del vector es un elemento
#vamos a ver la diferencia
n2 = c(2, 3, 5) 
s2 = c("aa", "bb", "cc", "dd", "ee") 

un_vector.v<-c(n2,s2)

#si ejecutamos
un_vector.v[1]
un_vector.v[5]

#vemos sólo un elemento en cada una de ellas


###PROXIMA CLASE EN DOS SEMANAS
##Descarguen los archivos necesarios para seguir lo que dice Jockers en su capítulo 2
# de su página en la red: http://www.matthewjockers.net/wp-content/uploads/2014/05/TextAnalysisWithR.zip
# Lean en Capítulo 2 de Jockers y copien en Rstudio todos sus ejemplos. No se olviden de escribir
# comentarios para recordar lo que él ha explicado en cada paso.
 








