#ASIGNACION DE VALOR


#Se le puede asignar un valor a una variable con el signo (<) y el guión (-):
numero <- 300

#Los valores pueden ser numéricos ("numeric")

miembros.de.familia_1 <- 5

#letras ("character")

apellido_paterno <- "González"

#o lógico ("logical")

miembro_vive_en_eeuu <- FALSE

#Se puede usar cualquier combinación de letras y números para el nombre de una variable 
#(pero el nombre no se puede empezar con un número). También se puede usar el (.) y (_)  

#El valor de la variable puede cambiar según las operaciones a la derecha

#primero recordemos cuál es el valor que teníamos para miembros.de.familia
miembros.de.familia_1

#podemos multiplicarlo por 4

miembros.de.familia_1 <- miembros.de.familia_1 * 4

#podemos sumarle dos más

miembros.de.familia_1 <- miembros.de.familia_1 + 2
#¿Cuántas personas hay en la familia ahora? (mira la ventana de valores o selecciona la palbra
#miembros.de.familia y ejecuta con ctr+entrar)


#sumar y dividir
miembros.de.familia_1 <- (miembros.de.familia_1 + 4) / 2 
#¿Y ahora, cuántos tenemos?  



#IMPORTANTE: 
#Nótese que si sólo multiplico 
miembros.de.familia_1 * 4
#el valor se multiplica PERO cambia de manera permanente
#tengo que pedir que el nuevo valor sea asignado de manera
#permanente con la siguiente expresión

miembros.de.familia_1 <- miembros.de.familia_1 * 4





#VECTORES

#En lugar de tener información similar en diferentes variables, podemos asignarlas a un vector

#Así en lugar de tener 
miembros.de.familia_1 <-3

miembros.de.familia_2 <-5

miembros.de.familia_3 <- 7

#Podemos combinarlos: 

miembros.de.familia <- c(3, 5, 7)   

#La letra "c" indica concadenar/concatenar todos los valores  

#Si entramos 
miembros.de.familia
#vemos que el resultado es
#[1] 3 5 7
#Tenemos tres valores. 


#Si queremos ver sólo el valor de la familia 1, escribimos:

miembros.de.familia[1] 
#[1] 3

#Lo mismo con las otras familias:
miembros.de.familia[2]
#[1] 5
miembros.de.familia[3]
#[1] 7

#Pregunta: Siguiendo el modelo anterior, ¿cómo se puede hacer un vector que 
#contenga los apellidos paternos de tres diferentes familias?











