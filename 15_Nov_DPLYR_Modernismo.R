



#####Cómo usar DPLYR

##cambia lo siguiente al directorio donde tienes guardado el archivo de .csv
dario.df=read.csv("/MINE/Dropbox/Span 991-Lectura distante/Dario.Poesia.csv")



#con "head" podemos ver el comienzo de este marco de datos
head(dario.df)


#tenemos dos columnas que están vacías, la 1 y la 9. Las podemos eliminar:

dario.df<-dario.df[,c(-1, -9)]

#véamos el resultado
head(dario.df)

####DPLYR
#primero hay que incorporar la nuevas funciones
library("dplyr")

###FILTER
#usar "filter" para seleccionar la información por filas

#palabra que tenga frecuencia de 40 
filter(dario.df, counts==40)

#frecuencia mayor de 13 en la fecha 1900
filter(dario.df, counts > 13, date == 1900)
#usar "filter" es más fácil que escribir
dario.df[dario.df$counts > 13 & dario.df$date == 1900,]

#un problema más difícil, encontrar dos frecuencias diferentes. Filtra los que tengan los números 40 y 13 *en* la columna "counts" 
filter(dario.df, counts %in% c(40,23))


####PREGUNTA: ¿Cómo puedo encontrar las filas que contienen los tokens "rosas" y "sepulcros"?

####RESPUESTA:  ????





##SELECT nos ayuda a seleccionar columnas

#si quiero sólo tres columnas
select(dario.df, token, counts, date)

#si quiero todas las columnas menos el título de los poemas
select(dario.df, -title)

#si quiero de la columna dos a la cuatro
select(dario.df, 2:4)
#o, lo mismo, pero usando nombres
select(dario.df, token:title)






####SUMMARISE es útil para aplicar funciones y estadísticas
summarise(dario.df, mean(counts)) #la media de las frecuencias
summarise(dario.df, sum(counts)) #cuántas palabras en total


###PIPE operator
##Nos permite concadenar múltiples comandos
#usa el símbolo:     %>%

##en el siguiente código le aplico a mi marco de datos tres funciones para saber la media, el valor máximo y el mínimo
dario.df %>% summarise(mean(counts), max(counts), min(counts))


#se pueden hacer una serie de comandos en una sola línea
#por ejemplo: agrupo dario.df por grupos dando prioridad a "token" y sumo las frecuencias ("counts") para cada palabra de la columna "token"
  
dario.df %>% group_by(token) %>% summarise(sum(counts))


#ahora puedo saber cuántas veces se repite cada palabra en todo el corpus

#Es fácil entenderlo si lo separamos en dos pasos
total_corpus<-dario.df %>% group_by(token) %>% summarise(sum(counts))

filter(total_corpus, token=="amor")


#podía haber colocado todo en una línea con paréntesis en lugar de usar el "pipe operator"

total_corpus2<-summarise(group_by(dario.df, token), sum(counts))
filter(total_corpus2, token=="amor")

#pero es más difícil de leer con todos los paréntesis

###seguramente se están preguntando si podría incluir el "filter" y crear una sola línea larga...
dario.df %>% group_by(token) %>% summarise(sum(counts)) %>% filter(token=="amor")




####Ejercicio:¿Cuantas palabras usa Darío en sus poemas de 1887?
#¿Cómo podemos agrupar por fechas, sumar las frecuencias, y filtrar cuántas palabras Darío usó en 1887?

##RESPUESTA: ??????


#manera tradicional (con paréntesis, sin el "pipe operator"):
#para saber la cantidad total de tokens por año
tokens<-summarise(group_by(dario.df, date), sum(counts))
filter(tokens, date==1887)



#Algo más avanzado: 
#agrupar por palabra y fecha, para así sumar las frecuencias para los tokens por fecha!

#No es necesario "aggregate"!!!!!
dario_modificado.df<-dario.df %>% group_by(token, date) %>% summarise(sum(counts))
#arreglemos los nombres de las columnas
colnames(dario_modificado.df)<-c("token", "date", "counts")


#puedes ver cuantas veces se usa la palabra "azul" por año
filter(dario_modificado.df, token=="azul")


##Tradicional (sin "pipe operator"):
dario_modificado.df<-summarise(group_by(dario.df, token, date), sum(counts))






##para el gráfico
azul<-filter(dario_modificado.df, token=="azul")
#remove columna con 1000 (desconocido)
azul<-azul[-c(1), ] 
#ilustrar
plot(azul[,-1], type="h", xlab="La palabra azul", ylab="Menciones por año")


