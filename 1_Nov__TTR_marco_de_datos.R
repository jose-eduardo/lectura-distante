#Token es una palabra, letra.
#La oración “Ese perro es grande pero no es  tan listo como ese otro perro”
#Contiene 13 tokens
#“Token type” se refiere a la cantidad de palabras únicas que aparecen en el texto.
#La misma oración vista anterior mente, contiene 9 token types, si eliminamos las palabras repetidas.
#TTR (o radio del type-token) indica la complejidad o falta de complejidad en un texto. 
#Si el autor utiliza las mismas palabras con frecuencia su TTR es alto, es decir, no es un complejo o “rico”.
#Si el autor utiliza más variedad en su vocabulario, y por lo tanto menos frecuentes, esto indica un lenguaje más complicado, menos repetitivo.



#El resultado de aplicar el código del capítulo 6 a “Amistad funesta”
#Nos muestra un dato interesante: el autor puso más cuidado en los primeros
#dos capítulos que en el tercero. Su lenguaje es más variado en los primeros dos que en el último. ¿Por qué habrá pasado esto? 


#Regremos a utilizar los datos que teníamos de Nájera.

najera.df=read.csv("~/Dropbox/Span 991-Lectura distante/najera.csv")

#La tarea decía 
#Crear un "loop" que guarde en una lista cuántas veces se usa la palabra 
#"amor" en cada uno de los años. 
#Mira el capítulo 4 de Jockers y su uso 
#de listas allí. Una de las claves para lograr esta función es modificar 
#la siguiente fórmula:
sum(najera.df$Freq[najera.df$word.v == "amor" & najera.df$date ==1883])

#La solución es la siguiente:

amor<-list()
date<-as.vector(unique(najera.df$date))
param1<-"amor"

for (p in 1:length(date)) {  
  fecha<-date[p]
  cantidad<-sum(najera.df$Freq[najera.df$word.v == param1 & najera.df$date ==fecha])
  amor[[fecha]]<-cantidad  }

#podemos ver la lista con la cantidad de usos de "amor" para cada
#año
amor

#convertirla en matrix para aplicar funciones fácilmente
amor.m <- do.call(cbind, amor)
#Cuántas veces se usa la palbara amor po0r Nájera
sum(amor.m)
#86


#Otra manera de crear el "loop" es usar algo que hemos aprendido antes, un "named vector"
#Contrasta la diferencia entre estas dos líneas que producen el mismo resultado:

amor<-vector()

date<-as.vector(unique(najera.df$date))
param1<-"amor"
for (p in 1:length(date)) {  
  fecha<-date[p]
  cantidad<-sum(najera.df$Freq[najera.df$word.v == param1 & najera.df$date ==fecha])
  amor[fecha]<-cantidad  }

#Podemos visualizar el resultado para ver la distribución por año
plot(amor[sort(names(amor))], type="h", xlab="La palabra amor", ylab="Menciones por año", xaxt ="n")
axis(1,1:17, labels=sort(names(amor)))

#Otra cosa que hicimos en la clase anterior fue
#reducir el marco de datos a sólamente el año 1883

nuevo.df <- subset(najera.df, date == ("1883"), select = c("word.v", "Freq", "title", "date"))
sum(nuevo.df$Freq[(nuevo.df$word.v == "amor")]) ##cuántas veces se usa "amor" en 1883
length(unique(nuevo.df$word.v)) #cuántas palabras únicas
sum(nuevo.df$Freq) #palabras en total ese año

#Podemos buscar el Type-Token Ratio que Jockers usaba en el capítulo 6
# a este año de la poesía de Nájera


poesias_83<-sum(nuevo.df$Freq)  #cuántas palabras en total
unicas_83<-length(unique(nuevo.df$word.v))  #cuántas palabras únicas
poesias_83/unicas_83
#o en lugar de usar variables, podemos obtener el resultado con una sola línea
sum(nuevo.df$Freq)/length(unique(nuevo.df$word.v))


#También les había asignado un "reto": buscar
#información sobre la función "aggregate" y usarla para modificar el marco de datos
#y obtener las frecuencias por año (no por poemas individuales, como estaba inicialmente)

#la siguiente línea de código une los tokens y saca la cantidad
najera_reorganizado.df<- aggregate(Freq ~ word.v +date, FUN = "sum", data = najera.df)

#Busquemos el TTR
#Usamos una versión de “apply” que funciona con los marcos
ttr<-tapply(najera_reorganizado.df$Freq, najera_reorganizado.df$date, mean)

#el gráfico
plot(ttr, type="h", xlab="Producción por año", ylab="TTR", xaxt ="n")
axis(1,1:17, labels=sort(names(tty)))

#Para la próxima clase instalemos en paquete "dplyr"

install.packages("dplyr")


#Nos ayudará a utilizar los marcos de datos con más facilidad
#Compárese

filter(najera.df, Freq == 13, date == 1888)
najera.df[najera.df$Freq == 13 & najera.df$date == 1888,]