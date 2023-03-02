#Autora: Valeria Bonilla Rojas(2018254434)

# Se define el número de iteraciones a realizar
Numerodeiteraciones <- 1000000 


# Se definen las variables involucradas en el cálculo 
# de la densidad a partir de los valores promedio de 
# cada medición respectiva

Masa = 543.096

Diametro = 120.0360

#Suponiendo los valores correspondientes a expansion termica en un
# caso general, para una esfera de polipropileno (PP)
alpha = 1.5*10^(-4)

#Para una variacion maxima de 2 °C
Delta_T = 2


#Partiendo de la definicion del cambio del diametro con por expansion termica:
Delta_Diametro= alpha*Diametro*Delta_T


# Se definen las incertidumbres relacionadas con las variables corresponientes

#Para la masa
res_m <- runif(Numerodeiteraciones, -0.01/2,0.01/2) #resolucion

rep_m <- rnorm(Numerodeiteraciones, 0, 0.009797959) #repetibilidad

cert_m <- rnorm(Numerodeiteraciones, 0, 0.01/2) #certificado 

#Para el diametro
res_d <- runif(Numerodeiteraciones, -0.01/2,0.01/2) #resolucion

rep_d <- rnorm(Numerodeiteraciones, 0,0.031717503) #repetibilidad

EMP_d <- runif(Numerodeiteraciones, -0.04,0.04) #certificado

delta_d <- runif(Numerodeiteraciones, -Delta_Diametro,Delta_Diametro) #cambio de temperatura


# Se definen los valores de masa y diámetro corregidos
Masa_corregida <- Masa + res_m + rep_m + cert_m 

Diametro_corregido <- Diametro + res_d + rep_d + EMP_d + delta_d


# Se define el cálculo de densidad 
Densidad <-((6*Masa_corregida)/(pi*(Diametro_corregido)^3)) 


#Resultado de la densidad con su respectiva incertidumbre
mean(Densidad)
sd(Densidad) 


hist(Densidad, main= "",ylab= 'Frecuencia', col = 'purple', breaks=200, xlab = 'Densidad')