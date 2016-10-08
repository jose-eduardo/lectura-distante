###En la última clase, exploramos el ejercicio de usar 
###una combinación de FOR/IF para determinar cuántas veces
###se repetía una palabra
## EL ejercicio pedía que usaramos la siguiente información

texto<-c("el", "gato", "no", "es", "mio", "es", "de", "el")
count<-0

##El objetivo era lograr que se contara cuántas veces aparecía la palabra
###"es" y que guardaramos esa en información en la variable "count". 
###"count" debía terminar en 2
###
###Solucionar este tipo de problemas requiere revisar lo que hemos
###estudiado antes. En la clase sobre LOOPS (12 de sept)
###estudiamos los operadores lógicos y creamos el siguiente 
##código:

una_variable<-"sol"
otra_variable<-"rosa"

if (una_variable == otra_variable) {
  print("las dos variables son iguales")
} else {
  print("las dos variables no son iguales")
}


##Esto nos indica que el operador == nos permite verificar si
##dos palabras se parecen

#La solución final es la siguiente:

texto<-c("el", "gato", "no", "es", "mio", "es", "de", "el")
count<-0


for (x in 1:length(texto)) {
  if (texto[x]=="es"){
    count<-count+1
  }
}


##Hay una manera más facil de hacerlo
##si usamos "x" para representar palabras directamente
##en lugar de números. Es otra opción que nos da R


count2 <- 0

for (p in texto) {
  if (p == "es") {
    count2 <- count2 + 1
  }
}

##Escrito el FOR de esta manera, la "p" viene a representar
##directamente cada palabra en "texto"


##He aquí un nuevo ejercico. Basado en lo anterior, ¿cómo podemos
##lograr que se cuente no sólo las palabras que son iguales a "es"
##sino también las que no lo son?

##Podemos tener dos variables para contar:
countSI<-0
countNO<-0

##Rescriben el código de arriba, guardando la información
##obtenida en la variable correspondiente






