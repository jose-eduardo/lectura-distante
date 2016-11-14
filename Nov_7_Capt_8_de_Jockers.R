
##Lo primero es colocarnos en el directorio para el libro y los archivos de Jockers
setwd("/MINE/Dropbox/R-Stuff/TextAnalysisWithR")




#aquí usaremos una función ("dir") de R para mostrar lo que hay en un directorio

dir("/MINE/Dropbox/R-Stuff/TextAnalysisWithR/data/plainText")
dir("~")

#para presentarlo de manera más legible, el nombre de cada archivo por línea
#Jockers crea una función

#primero usa variables para que se pueda cambiar la info fácilmente más tarde


input.dir <- "data/plainText"
files.v <- dir(input.dir, "\\.txt$") #usa un patrón, como los que usamos con "gsub" para buscar sólo los archivos que terminan en .txt


#Crea la función, algo con lo que estamos ya familiarizados

show.files <- function(file.name.v){
  for(i in 1:length(file.name.v)){
    cat(i, file.name.v[i], "\n", sep=" ")
  }
}
#y la usamos
show.files(files.v)



#es lo mismo que decir
show.files(dir("/MINE/Dropbox/R-Stuff/TextAnalysisWithR/data/plainText", "\\.txt$"))



####Usamos el código que se creó en los capítulos 4 y 6 y ahora hacemos una función 


#
#Puedes copiar la función make.file.word.v.l del libro de Jockers



#algo nuevo en el libro de Jockers es la función "return", pero no para nosotros que ya sabemos que es una manera de enviar
#información de la variables locales afuera del "loop" 

return(text.word.vector.l)



###
#al aplicar la función a nuestro directorio, Jockers guarda el resultado en una lista
my.corpus.l <- make.file.word.v.l(files.v, input.dir)

#ahora el primer elemento de esa lista es el libro de Austen y el segundo el de Melville

my.corpus.l[[1]]

#por que el texto está en orden (no como el marco de datos de Nájera)
#podemos ver la primera oración de Pride and Prejudice
my.corpus.l[[1]][115:124]

#o la primera de "Moby Dick"
my.corpus.l[[2]][3924:3926]

#¿cómo encontrar la palabra que queremos?

positions.v <- which(my.corpus.l[[1]][]=="gutenberg")

#podemos guardar la posición que queremos
first.instance<-positions.v[1]

#y mirar las palabras que vienen antes o después
my.corpus.l[[1]][(first.instance-1):(first.instance+1)]


#o usar los números directamente
my.corpus.l[[1]][2:4]


##Este sistema no es muy eficaz--tendríamos que ir cambiando el índice para ver el contexto en que 
##la palabra aparece escrita. Una palabra como "view" puede aparecer hasta 20 veces.

######EJERCICIO:
#¿Podemos hacer una función que imprima todas
# las veces que aparece la palabra sin tener que ir
# una por una?




#primera versión de función
#se puede usar "cat" en lugar de "print" también

contexto <- function(palabra_a_buscar){
  posiciones <- which(my.corpus.l[[1]][]==palabra_a_buscar)
  for (x in posiciones) {
    print(my.corpus.l[[1]][(x-1):(x+1)])
  }
}
contexto("view")


#segunda versión

#dos parametros: numero de la novela, palabra a buscar
# Novelas: 1. Pride and Prejudice, 2. Moby Dick
#
contexto <- function(num_novela, palabra_a_buscar){
  num<-num_novela
  posiciones <- which(my.corpus.l[[num]][]==palabra_a_buscar)
  for (x in posiciones) {
    print(my.corpus.l[[num]][(x-1):(x+1)])
  }
}

  
contexto(1, "view")

  

























#####Clase 11??????





najera.df=read.csv("/MINE/Dropbox/Span 991-Lectura distante/najera.csv")

library("dplyr")

#usar "filter" para seleccionar la información por filas


#palabra que tenga frecuencia de 40 
filter(najera.df, Freq==40)

#frecuencia más de 13 en la fecha 1888
filter(najera.df, Freq > 13, date == 1888)
#más fácil que escribir
najera.df[najera.df$Freq > 13 & najera.df$date == 1888,]

#más difícil, encontrar dos frecuencias diferentes. Filtra los que tengan los números 40 y 13 *en* la columna "Freq" 
filter(najera.df, Freq %in% c(40,13))
####PREGUNTA: ¿Cómo puedo encontrar las filas que contienen los tokens "rosas" y "sepulcros"?

####RESPUESTA:
filter(najera.df, word.v %in% c("rosas", "sepulcro"))



##SELECT nos ayuda a seleccionar columnas

#si quiero sólo tres columnas
select(najera.df, word.v, Freq, date)

#si quiero todas las columnas menos el título de los poemas
select(najera.df, -title)

#si quiero de la columna dos a la cuatro
select(najera.df, 2:4)
#o, lo mismo, pero usando nombres
select(najera.df, word.v:title)






####SUMMARISE es útil para aplicar funciones y estadísticas
summarise(najera.df, mean(Freq)) #la media de las frecuencias
summarise(najera.df, sum(Freq)) #cuántas palabras en total


###PIPE operator
##Nos permite concadenar múltiples comandos
%>%

##en el siguiente le aplico a mi marco de datos tres funciones para saber la meadi, el valor máximo y el mínimo
najera.df %>% summarise(mean(Freq), max(Freq), min(Freq))


#se pueden hacer una serie de comandos en una sola línea
#por ejemplo: agrupo najera.df por grupos dando prioridad a word.v y sumo las frecuencias para cada palabra de word.v
  
najera.df %>% group_by(word.v) %>% summarise(sum(Freq))


#ahora puedo saber cuántas veces se repite cada palabra en todo el corpus
total_corpus<-najera.df %>% group_by(word.v) %>% summarise(sum(Freq))

filter(total_corpus, word.v=="amor")

#podía haber colocado todo en una línea con paréntesis

total_corpus2<-summarise(group_by(najera.df, word.v), sum(Freq))
filter(total_corpus2, word.v=="amor")

#pero es más difícil de leer con todos los paréntesis

###seguramente están pensando en si podía incluir el "filter" y crear una sola línea larga...
najera.df %>% group_by(word.v) %>% summarise(sum(Freq)) %>% filter(word.v=="amor")




####Ejercicio:
#¿Cómo podemos agrupar por fechas, sumar las frecuencias, y filtrar cuántas palabras Nájera usó en 1885?

##RESPUESTA
najera.df %>% group_by(date) %>% summarise(sum(Freq)) %>% filter(date==1885)


#manera tradicional:
#para saber la cantidad total de tokens por año
tokens<-summarise(group_by(najera.df, date), sum(Freq))
filter(tokens, date==1885)



#Algo más avanzado: agrupar por palabra y fecha, para así sumar las frecuencias para los tokens por fecha!

#No es necesario "aggregate"!!!!!
najera_modificado.df<-najera.df %>% group_by(word.v, date) %>% summarise(sum(Freq))

##Tradicional:
najera_modificado.df<-summarise(group_by(najera.df, word.v, date), sum(Freq))


#arreglemos los nombres de las columnas
colnames(najera_modificado.df)<-c("word.v", "date", "Freq")


filter(najera_modificado.df, Freq > 40)[1:5,]
filter(najera_modificado.df, date==1883)[1:10,]




##para el gráfico
amor<-filter(najera_modificado.df, word.v=="amor")
fechas<-sort(unique(najera_modificado.df$date))

#x[,-c(1)]
plot(amor[,-1])
plot(amor[,-1], type="h", xlab="La palabra amor", ylab="Menciones por año", xaxt ="n")
axis(1,1:17, labels=fechas)














############
#abajo de esto no funcionó

x$word.v[1:3]




b<-group_by(najera.df, word.v, date, Freq)


c<-summarize(b)




d<-group_by(c, date, Freq)






e<-summarize(d)



sum(c[c$word.v=="a"])

rowsum(najera.df[najera.df$word.v == "a",])

najera.df$word.v[1:10]
najera.df[which(najera.df$word.v=="a")]
najera.df
x<-which(najera.df$word.v=="a")
najera.df[x]
(inner_join(c, word.v))




d<-summarize(c,unique(word.v))



