
texto_lineas <- scan("https://raw.githubusercontent.com/jose-eduardo/lectura-distante/master/la_rosa_muerta.txt", what = "character", sep = "\n")

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



rosa.df<-as.data.frame(rosa.ordenada.frec, row.names = NULL)

rosa.df$Word<-rownames(rosa.df)
rownames(rosa.df) <- 1:nrow(rosa.df)
colnames(rosa.df)<-c("Freq", "Word")


