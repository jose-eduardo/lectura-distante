library("dplyr")
library("ggplot2")


##Usa el marco de datos sobre la tesis doctorales
##He cambiado el archivo para ponerle nombres de las columnas en inglés para los que continúan
#con problemas con las palabras en español
tesis.df=read.csv("/MINE/Dropbox/Span 991-Lectura distante/tesis_06-08-English.csv")

##si el URL no funciona en tu versión de R, descarga el archivo y utilizalo como hemos
##hecho con los poemas de Darío o de Najera

tesis.df=read.csv("/MINE/Dropbox//Span 991-Lectura distante/tesis_06-08-English.csv")



##A diferencia de otros marcos de datos que hemos usado, aquí no poseemos
##información numerica, sólo una clasificación de las tesis

#¿Qué hacer cuando no hay números? 
#podemos usar "length" para contar cuántas tesis hay por universidad

tesis.df %>% group_by(university, year) %>% summarize(length(author)) 

#Dplyr nos provee tambien con una nueva función que hace eso: n()
#busquemos las diez primeras
tesis_universidad<-tesis.df %>% group_by(university) %>% summarize(author=n()) %>% top_n(10, author)


#Busquemos la cantidad de tesis producidas por año, entre 2006 al 2008
tesis_fecha <- tesis.df %>% group_by(year) %>% summarize(author=n()) 

#Algunos elementos de la visualización
#Mapa estético (AES)
#Transformación estadística (stat)-opcional
#Objeto geométrico (geom)-barra, punto, línea
#Posición de los objetos en el gráfico
#Una escala para las variables graficadas
#Un sistema de coordenadas

#podemos visualizar los resultados de "tesis_universidad"
p <- ggplot(tesis_universidad, aes(x=university, y=author)) 
p + geom_point()


#podemos añadir capas que nos dan más información

# etiquetas de los ejes
p + geom_point() + xlab("Universidades") + ylab ("Número de tesis doctorales")

#titulo
p + geom_point()+ xlab("Universidades") + ylab ("Número de tesis doctorales")+ ggtitle("Gráfico 1")


#Algunos tipos de geom()

#geom_line líneas que conectan las observaciones
#geom_bar barras
#geom_boxplot diagrama de caja

#Y otros ...

#barra


p <-ggplot(tesis_universidad, aes(x=university,y=author)) 
p+geom_bar(stat="identity")

#podemos modificar, el tamaño, el color los bordes de las barras, llenarlas de otro color
p+geom_bar(stat="identity", width=0.5, colour="blue", fill="red")

#podemos cambiar el fondo a blanco
p+geom_bar(stat="identity", width=0.5, colour="blue", fill="red")+ggtitle("Número de tesis") + theme_bw()



#ejemplo de gráfico circular
ggplot(tesis_universidad,aes(x="",y=author,fill=university)) +geom_bar(width=1,stat="identity") +coord_polar(theta="y")


#línea
ggplot(tesis_universidad,aes(x=university,y=author,group=1)) +geom_line()
