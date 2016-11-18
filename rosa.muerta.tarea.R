#puedes usar scan
texto_lineas <- scan("https://raw.githubusercontent.com/jose-eduardo/lectura-distante/master/la_rosa_muerta.txt", what = "character", sep = "\n")
#o descargar el texto de La rosa muerta a tu computadora

#Ya vimos lo siguiente en el capítulo2 de Jockers
texto_lineas <- scan("/MINE/Dropbox/Span 991-Lectura distante/la_rosa_muerta.txt", what = "character", sep = "\n")
novela <- paste(texto_lineas, collapse = " ")
novela.minuscula <- tolower(novela)
rosa.palabras <- strsplit(novela.minuscula, "\\W")
rosa.palabras.unlist <- unlist(rosa.palabras)
no.en.blanco <- which(rosa.palabras.unlist !="")
rosa.palabras.unlist <-rosa.palabras.unlist[no.en.blanco]
rosa.frec <- table(rosa.palabras.unlist)
rosa.ordenada.frec<- sort(rosa.frec, decreasing=TRUE)
rosa.ordenada.frec[1:10]


#lo convertimos es un marco de datos
rosa.df<-as.data.frame(rosa.ordenada.frec, row.names = NULL)

rosa.df$Word<-rownames(rosa.df)
rownames(rosa.df) <- 1:nrow(rosa.df)


#Antes de comenzar hagamos los siguientes cambios:
#Asegúrense que los nombres de las columnas están correctos
colnames(rosa.df)<-c("Word", "Freq")
rosa.df<-rosa.df[,-3]

#Llamemos a "Dplyr"
library("dplyr")
#La próxima línea añadirá frecuencias relativas a tu marco de datos
rosa.df<-rosa.df %>% mutate(RelFreq = Freq / sum(Freq))

##########TAREA



#Usa el marco de datos preparado arriba (rosa.df)
#yo aconsejaría también usar el "pipe operator" pero eso lo dejo como
#una opción para ustedes.

#Da el código para las siguientes preguntas

#En rosa.df ....

#Cuántas palabras/tokens en total tiene el texto "La rosa muerta"


#Cuántas palabras/tokens únicas hay




#Muestra las palabras que poseen frecuencias mayor de 300 y una frecuencia relativa mayor de 0.01





#Muestra las palabras que poseen frecuencias entre 13 y 15
 




#Suma todas las frecuencias entre 13 y 15




#Cuantas palabras palabras hay con frecuencuias entre 13 y 15




#filtra todas las palabras relacionadas con el cuerpo ojos: manos, cuello, cabello, labios, brazos, brazo, piernas, pecho, rostro, cabeza) que encuentres en una sola línea de código


#suma todas las frecuencias



#¿cuál es la frecuencia relativa de todas esas palabras del cuerpo juntas?



#Consideras que es una frecuencia alta? ¿Por qué?


#Encuentra Type-Token Ratio (capítulo 6 de Jockers)




