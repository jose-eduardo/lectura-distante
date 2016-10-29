#En la clase anterior queríamos convertir el siguiente código en una funcióm
#para automatizar el proceso de buscar cuántas veces se repetía una palabra


texto<-c("el", "gato", "no", "es", "mio", "es", "de", "el")

count <- 0
palabra<-"es"
for (p in texto) {
  if (p == palabra) {
    count <- count + 1
  }
}

print(count)



###La primera versión nos dio problemas porque la variable "count" no nos devolvía el resultado
###esperado. 


texto<-c("el", "gato", "no", "es", "mio", "es", "de", "el")
count<-0

buscar<-function(palabra){
  for (p in texto) {
    if (p == palabra) {
      count <- count + 1
    }
  }
}

buscar("es")
print(count)

##Finalmente lo resolvimos moviendo "print" adentro de la función


##########Resultado


texto<-c("el", "gato", "no", "es", "mio", "es", "de", "el")


buscar<-function(palabra){
  count <- 0   #se inicializa a cero cada vez que empieza la función
  for (p in texto) {
    if (p == palabra) {
      count <- count + 1
    }
  }
  print(count)   #si no imprimimos adentro de la función, el valor de "count" se perderá
}



buscar("mio")

########¿Por qué pasó esto?

####Variables globales vs locales

x<-"es una global"


variableslocales<-function(parametro) {
  if (parametro %in% texto){
  x<-"esto es local"
  print(x)
}
}

variableslocales("es")
 
print(x)



##Lo mejor es 1) tener variables con nombres diferentes para local y globa
##y 2) utilizar el comando "return" para asegurar que la local envía el resultado al
##código principal


funcion_con_return<-function(parametro) {
  if (parametro %in% texto){
    y<-"esta es la informacion que se devuelve"
    return(y)
  }
}

funcion_con_return("el")
##el resultado se imprime inmkediatamente

##################
#Un marco de datos: poemas de Gutiérrez Nájera
#Revisa lo que aprendimos en una clase anterior sobre marcos de datos (data frames)

#Vamos a utilizar los datos provistos por el profesor sobre los poemas de Gutiérrez Nájera
najera.df=read.csv("/MINE/Dropbox/Span 991-Lectura distante/najera.csv")

##¿Cómo podemos buscar las palabras que tienen una frecuencia específica?
najera.df$word.v[test["Freq"]==5]

##¿Cómo podemos saber la frecuencia del token "a" en todo el marco de datos (todos los poemas juntos)?

#¿podrías crear un "loop", como los que hemos hecho antes?

#Solución:

count<-0
for (p in 1:length(najera.df$word.v)) {
  if (najera.df$word.v[p] == "a"){
    count=count+najera.df$Freq[p]
  }
}
print(count)

#resultado: 450



#Una solución más fácil:
sum(najera.df$Freq[(najera.df$word.v == "a")])

#podemos reducir el marco de datos a un tamaño más pequeño. Supongamos que sólo
#nos interesa el año 1883
nuevo.df <- subset(najera.df, date == ("1883"), select = c("word.v", "Freq", "title", "date"))
sum(nuevo.df$Freq[(nuevo.df$word.v == "a")]) ##cuántas veces se usa "a" en 1883
length(unique(nuevo.df$word.v)) #cuántas palabras únicas
sum(nuevo.df$Freq) #palabras en total ese año

##en lugar de separar el 1883 y después buscar info sobre ese año, una manera más simple es
##utilizar najera.df y obtener la información directamente de ahí

sum(najera.df$Freq[najera.df$word.v == "a" & najera.df$date =="1883"])


#Tarea:

#Crear un "loop" que guarde en una lista cuántas veces se usa la palabra "amor" en cada uno de los años.
#Mira el capítulo 4 de Jockers y su uso de listas allí. 
#Una de las claves para lograr esta función es modificar la siguiente fórmula:
sum(test$Freq[test$word.v == "amor" & test$date ==1883])



#Reto:
#Investiga cómo se puede usar la función "aggregate" para transformar el marco de datos najera.df en uno 
#que contenga la información de las frecuencias por año (no por poema como está ahora).
#Usa los foros en la red o libros sobre R para buscar tu respuesta.









