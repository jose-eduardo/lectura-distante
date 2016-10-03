
#En los capítulos 2 y 3 de Jockers, se convirtió el contenido de la novela Moby Dick a una tabla de contingencia
#que se veía de la siguiente manera

#> sorted.moby.freqs.t[1:10]
#  the    of   and     a    to    in  that    it   his     i 
#14175  6469  6325  4636  4539  4077  3045  2497  2495  2114 

#En una de las filas estaban las palabras, en la otra el número de veces que la
#palabra era usada en la novela. Cada columna estaba compuesta de la palabra y su frecuencia
#Era facil ver cuántas veces se uso una palabra con sólo buscar su nombre en la primera fila
sorted.moby.freqs.t["whale"]

#El propósito del capítulo 4 es tener una tabla de contingencia individual para cada uno de los 
#capítulos y así poder medir la frecuencia con que aparece una palabra en relación a la narración

#Para prepararnos para ese capítulo, veamos algunas de las funciones y términos que Jockers va a utilizar.

##Matrices

#Hasta ahora hemos trabajado con vectores y listas, y hemos ordenado los
#datos en una fila simple. Así hemos visto como en un vector podemos guardar
#una lista de elementos:
#vector1<-c(4,6,7,10,34)




#Una matriz ordena datos de manera rectangular, con dos dimensiones

#Por ejemplo, en R, lo veríamos representado de la siguiente manera:


     [,1] [,2] [,3] 
[1,]    2    4    3 
[2,]    1    5    7 



#Hay muchas maneras de crear matrices pero Jockers va a ultilizar dos funciones para 
#ordenar la informacion que tiene almacenada en vectores. 

#La función "rbind" une dos vectores diferentes por filas ("rows", de ahi "rbind")

#Digamos que tenemos los vectores "fila_1" y "fila_2"

fila_1 <- c(1,2,3,4,5)
fila_2 <- c(6,7,8,9,10)

matriz1<-rbind(fila_1,fila_2)

#Pidamos a Rstudio que imprima el resultado:

matriz1
#se ve de la siguiente manera:
#       [,1] [,2] [,3] [,4] [,5]
#fila_1    1    2    3    4    5
#fila_2    6    7    8    9   10

#Podemos ver el contenido de un lugar específico de la matriz
matriz1[2,5]

#Podemos ver todos los elementos de la fila 2
matriz1[2,]

#Podemos ver los elementos de la columna 4
matriz1[,4]


#La función "cbind"

#Esta función también presentada en el capítulo, es similar a la anterior
#pero en lugar de combinar la información en una matriz usando filas,
#utiliza columnas

#Veamos el siguiente ejemplo. Creamos tres vectores (es importante 
#que tengamos la misma cantidad de elementos en todos)

columna_1 <- c(1,2,3,4,5,6)
columna_2 <- c(6,7,10,9,10,7)
columna_3<- c(21,2,30,45,10,9)
matriz2 <- cbind(columna_1,columna_2,columna_3)

#Ahora imprimimos el resultado

matriz2

#El resultado es el siguiente (nótese que la información se organiza
#por columnas, no filas)

#     columna_1 columna_2 columna_3
#[1,]         1         6        21
#[2,]         2         7         2
#[3,]         3        10        30
#[4,]         4         9        45
#[5,]         5        10        10
#[6,]         6         7         9



#Como señalé al principio, el propósito de este capítulo 4 es obtener
#una tabla de contingencia para cada capítulo de la novela Moby Dick
#Una vez logrado ese propósito, Jockers necesita sacar los datos que quiere
#de los capítulos (por ejemplo, cuantas veces se usa la palabra "whale")
#y ordenarlos en una matriz para analizarlos y visualizarlos.  




###Grep

#La función "grep" sirve para buscar una palabra o palabras en un texto. 

novel.lines<-scan("/MINE/Dropbox/Span 991-Lectura distante/amistad_funesta_clean.txt", what="character", sep="\n")
grep("Capitulo", novel.lines)
#El resultado serán tres índices (ya que _Amistad funesta_ sólo tiene tres capítulos)
#si usamos el índice para saber en qué oración está la palabra, podemos escribir
novel.lines[2773]

#Es mejor guardar los índices en un vector

capitulos<-grep("Capitulo", novel.lines)

#y escribir un código que imprima cada resultado automáticamente


##¿Podrías escribir el código para que se impriman los tres capítulos de _Amistad funesta_?

#Solución

for (x in 1:length(capitulos)){
  print(novel.lines[capitulos[x]])
}



