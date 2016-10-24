


nombre_de_funcion <- function (parametro) {
  # cualquier 
  # serie
  # de instrucciones
}



nombre_de_funcion(x)


#El parametro pasa la información que contiene "x"

##la próxima función suma cualquier número por sí mismo y lo divide por dos
suma_division <-function(n){
  n<-n*n
  n/2
}


suma_division(4)


#Podemos tener más de un parámetro

repetir<-function(x, y){
  resultado<-x
  for (i in 1:y) {
    print(resultado)
  }
}


repetir("hola", 5)

#Ejercicio 1
#convierte de F a celcius
# la fórmula es F -32 dividido por 5/9 (o 1.8)





convertir<-function(f){
  resultado<-(f-32)/1.8
  print(resultado)
}


convertir(100)
##37.77778
##o 37.8








#¿Como podemos convertir el siguiente código en una función para que podamos usar cualquier
#palabra, no sólo "es"?


texto<-c("el", "gato", "no", "es", "mio", "es", "de", "el")

 count <- 0
 palabra<-"es"
 
for (p in texto) {
	if (p == palabra) {
    count <- count + 1
    }
}

print(count)

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

count










#Repasen el capítulo 4 de Jockers

#En una clase anterior vimos como podemos encontrar los capítulos para _Amistad funesta_

lineas.de.novela.v<-scan("/MINE/Dropbox/Span 991-Lectura distante/amistad_funesta_clean.txt", what="character", sep="\n")
posicion.de.capitulos.v<-grep("Capitulo", lineas.de.novela.v)

#################
chap.positions.v<-grep("Capitulo", novel.lines.v)
novel.lines.v <- c(novel.lines.v, "END")
last.position.v <- length(novel.lines.v)
chap.positions.v <- c(chap.positions.v , last.position.v)

###########################

#Vamos al capítulo 6. La tarea es leer el capítulo 6 y crear el mismo gráfico
#que está en la figura 6.2 para _Amistad funesta_

