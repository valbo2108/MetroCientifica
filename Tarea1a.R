#Autora: Valeria Bonilla Rojas(2018254434)

# Se define el número de iteraciones a realizar
Numerodeiteraciones <- 1000000 


# Se definen las variables involucradas en el calculo 
# de la densidad a partir de los valores promedio de 
# cada medición respectiva

Masa = 543.096

Diametro = 120.0360


# Se definen las incertidumbres relacionadas con las variables corresponientes

#Para la masa
res_m <- runif(Numerodeiteraciones, -0.01/2,0.01/2) #resolucion

rep_m <- rnorm(Numerodeiteraciones, 0, 0.009797959) #repetibilidad

cert_m <- rnorm(Numerodeiteraciones, 0, 0.01/2) #certificado 

#Para el diametro
res_d <- runif(Numerodeiteraciones, -0.01/2,0.01/2) #resolucion

rep_d <- rnorm(Numerodeiteraciones, 0,0.031717503) #repetibilidad

EMP_d <- runif(Numerodeiteraciones, -0.04,0.04) #certificado


# Se definen los valores de masa y diametro corregidos

Masa_corregida <- Masa + res_m + rep_m + cert_m 

Diametro_corregido <- Diametro + res_d + rep_d + EMP_d



# Se define el calculo de densidad 

Densidad <-((6*Masa_corregida)/(pi*(Diametro_corregido)^3)) 



#Resultado de la incertidumbre que otorga la masa


mean(Densidad)
sd(Densidad) 


hist(Densidad, main = "" ,ylab= 'Frecuencia', col = 'pink', breaks=200, xlab = 'Densidad')


