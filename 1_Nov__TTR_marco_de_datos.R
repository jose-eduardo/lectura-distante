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
filter(najera.df, Freq == 13, date == 1888)
najera.df[najera.df$Freq == 13 & najera.df$date == 1888,]



