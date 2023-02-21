#Autora: Valeria Bonilla Rojas(2018254434)

# Se define el número de iteraciones a realizar
Numerodeiteraciones <- 1000000 


# Se definen las variables involucradas en el cálculo 
# de la densidad a partir de los valores promedio de 
# cada medición respectiva

Masa = 543.096

Diametro = 120.0360

Gamma = 40*10^(-6)


# Se definen las incertidumbres relacionadas con las variables corresponientes

#Para la masa
res_m <- runif(Numerodeiteraciones, -0.01/2,0.01/2) #resolución

rep_m <- rnorm(Numerodeiteraciones, 0,0.021908902) #repetibilidad

cert_m <- rnorm(Numerodeiteraciones, 0,0.01) #certificado 

#Para el diámetro
res_d <- runif(Numerodeiteraciones, -0.01/2,0.01/2) #resolución

rep_d <- rnorm(Numerodeiteraciones, 0,0.070922493) #repetibilidad

cert_d <- runif(Numerodeiteraciones, -0.04,0.04) #certificado

temp_d <- runif(Numerodeiteraciones, -1,1) #cambio de temperatura


# Se definen los valores de masa y diámetro corregidos

Masa_corregida <- Masa + res_m + rep_m + cert_m 

Diametro_corregido <- Diametro + res_d + rep_d + cert_d + Gamma*(1-temp_d)



# Se define el cálculo de densidad 

Densidad <-((6*Masa_corregida)/(pi*(Diametro_corregido)^3)) 



#Resultado de la incertidumbre que otorga la masa


mean(Densidad)
sd(Densidad) 


hist(Densidad, main= "",ylab= 'Frecuencia', col = 'purple', breaks=200, xlab = 'Densidad')