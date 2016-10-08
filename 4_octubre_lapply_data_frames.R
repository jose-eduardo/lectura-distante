

###LAPPLY y do.call

#Una función es una serie de instrucciones que logran una tarea específica.
#Por ejemplo, en R una función simple puede ayudar a obtener la raiz cuadrada de un número

sqrt(4)

#Anteriormente hemos visto funciones como rbind y cbind que ayudan a crear matrices
#combinando por medio de filas y columnas.

#Dos funciones que se presentan en el capítulo 4 de Jockers: lapply y do.call
#toman como argumento otra función. Es decir, sirven para aplicar otra funcion.

#Para explicar mejor, veamos otra diferencia entre vectores y listas.


#Recordemos que una de las ventajas de un vector era la iteración, repitiendo automáticamente
#el mismo proceso en todos los elementos. 

vector_1<-c(4,16,25)

#Si quiero saber la raíz cuadrada de cada elemento sólo aplico la función "sqrt" al vector
sqrt(vector_1)

#si quiero multiplicar cada elmento por 3
vector_1*3


#En el caso de una lista podemos usar LAPPLY para obtener el mismo resultado
#Primero vamos a crear una lista compuesta de dos vectores

lista_4<-list(numeros=c(4,16,25), numeros2=c(9,18,50))

#LAPPLY aplica una funcion específica a la parte de la lista que queremos

#Si quiero la raíz cuadrada de los elementos en "números"

lapply(lista_4[["numeros"]], sqrt)


#Si quiero multiplicar por 3 

lapply(lista_4[["numeros"]], "*", 3)



#Jockers utiliza ambas lapply y do.call con el propósito de aplicar una función
#a un conjunto de datos guardados en una lista


#Usos de lapply

#Anteriormente hemos buscado las diez palabras más frecuentes de Amistad funesta
#Al final terminamos con una tabla de contingencia, que en mi caso
#se llamaba
amistad.frecuencia.ordenada[1:10]
##
#El resultado fue una tabla como esta
#de  que    y   la    a   en   el   no  los   se 
#2089 1462 1310 1245  964  964  625  594  545  514 
##(NOTA: si mis resultado es diferente del suyo es porque utilizo la versión de "Amistad funesta" 
##que tiene tildes y eso afecta palabras como "el", "que", "se")



#A esta tabla podemos aplicarle funciones

sum(amistad.frecuencia.ordenada) 
#[1] 36097


#nos da la suma total de todas las palabras en el texto (suma todas las palabras
#que aparacen en la fila que contiene la cantidad que existe de cada palabra)


length(amistad.frecuencia.ordenada)
#[1] 6048
# "length" por su parte, suma todos los tipos diferentes de palabras

#En otras palabras, con "length" la palabra "que" se cuenta una vez no importa
#cuantas veces aparezca

#Si quisieramos saber la media 

mean(amistad.frecuencia.ordenada)

#[1] 5.968419
#Es decir, cada palabra es usada un promedio de 5.9 veces

####  Estas funciones se pueden aplicar directamente, porque
## la tabla se refiere a toda la novela. Pero si como en el 
# capitulo 4 de Jockers, se ha creado una tabla para cada capítulo
# y se ha guardado esa tabla en una lista, entonces se aplica
# a cada miembro de la lista



##DATA FRAMES

columna_1 <- c(1,2,3,4,5,6)
columna_2 <- c(6,7,10,9,10,7)
columna_3<- c(21,2,30,45,10,9)
matriz2 <- cbind(columna_1,columna_2,columna_3)


#Puedo crear una matriz de numeros o de letras, pero no combinar ambos

#Puedo convertir la matriz a "data frame" o hoja o marco de datos

marco.datos<-as.data.frame(matriz2)

#Podemos ver las columnas y filas
marco.datos

#  columna_1 columna_2 columna_3
#1         1         6        21
#2         2         7         2
#3         3        10        30
#4         4         9        45
#5         5        10        10
#6         6         7         9
#También Rstudio te da una representación visual de ella (en la sección de "Environment")

#Como en el caso de las matrices
#Podemos ver el contenido de un lugar específico
marco.datos[2,3]

#pero tambien podemos cambiarlo y poner palabras
marco.datos[2,3]<-"ventana"

#Ahora miramos el resultado
marco.datos


#Podemos ver todos los elementos de la fila 2
marco.datos[2,]
#o podemos usar el nombre de la columna
marco.datos["columna_2"]


#Puedo ver dos columnas que me interen combinada
marco.datos[c("columna_1", "columna_3")] 

#Podemos cambiar los nombres de las filas

#primero creo un vector con los nombres deseados
nombres<-c("enero", "febrero", "marzo", "abril", "mayo", "junio")

#los aplico a mi marco de datos
row.names(marco.datos)<-nombres
#tambien podemos cambiar los nombres de las columnas con "colnames"


#verifica que comprendes lo que hace el código próximo

azuela.frecuencias<-c(1779, 870, 1293, 1117, 932, 725, 621, 618, 547)
palabras.frecuentes<-c("de", "que", "y", "la", "a", "el", "en", "los", "se")   
marti.frecuencias<-c(2089, 1462, 1310, 1245, 964, 625, 964, 545, 514) 
comparacion.df<-data.frame(palabras.frecuentes, azuela.frecuencias, marti.frecuencias, stringsAsFactors=FALSE)
colnames(comparacion.df)<-c("Palabras frecuentes", "Los de abajo", "Amistad funesta")

#Ahora podemos comparar ambas novelas
comparacion.df

############
#Comparemos con un “named vector”. Utiliza el siguiente formato para
#Dar un mobre a cada valor.
#x <- c(value1, value2, ...)
#names(x) <- c("name1", "name2", ...) 



#Sabemos crear un vector numérico. Usomos los siguientes valores:
vector1<-c(1779, 870, 1293, 1117, 932, 725, 621, 618, 547)


#Podemos poner “nombres” a esos valores, para identificarlos.
names(vector1)<-c("de", "que", "y", "la", "a", "el", "en", "los", "se")

#Vemos el vector:
vector1

#Ahora podemos tener acceso a la información, usando el índice o el nombre #asignado
vector1[1]
vector1["que"]
#El adjudicar un nombre no afecta el valor o la función del vector. Si sumamos por dos, tenemos
vector1["que"]+2

#Sin embargo. A pesar de que asignamos palabras para indetificar los valores, 
#el vector sigue siendo numérico. No podemos combinar valores de números 
#y de palabras como en el “data frame”.





