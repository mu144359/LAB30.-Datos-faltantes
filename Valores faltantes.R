####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Selene Muñoz Ortega (UAEH)

# LABORATORIO - Tidy data: VALORES FALTANTES

# Objetivo: Introducción práctica a los datos ordenados (o tidy data) y a las herramientas que provee el paquete tidyr.
# --------------------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar datos (tibbles)
# 2. LLENAR LOS VALORES FALTANTES 

#Un valor faltante explícito es la presencia de una ausencia;
#un valor faltante implícito es la ausencia de una presencia.

#############################################
#LABORATORIO: Tidy data (datos faltantes)   #
#############################################
#Prerrequisitos
#instalar paquete tidyverse
#install.packages("tidyverse")



#Cargar paquete tidyverse
library(tidyverse)

#Cargar paquete tidyr
library (tidyr)

#Cargar paquete tibble
library (tibble)

#Cargar paquete dplyr
library(dplyr)


#cargar datos
acciones <- tibble(
  anio = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  trimestre = c(1, 2, 3, 4, 2, 3, 4),
  retorno = c(1.88, 0.59, 0.35, NA, 0.92, 0.17, 2.66))

#DF1
#convertir en dataframe
Df1 = acciones

#DF2
# VER EXPLICITOS LOS VALORES FALTANTES
Df2 = Df1 %>% 
  spread(anio, retorno)


#DF3
#ELIMINAR LOS VALORES FALTANTES (EXPLICITOS E IMPLICITOS)
Df3 = acciones %>% 
  pivot_wider(names_from = anio, values_from = retorno) %>% 
  pivot_longer(cols = c("2015", "2016"),
  names_to = "anio", 
  values_to = "retorno",
  values_drop_na = TRUE)


#DF4
#OTRA HERRAMIENTA PARA HACER EXPLICITOS LOS VALORES FALTANTES (CONSERVANDO LA ESTRUCTURA ORIGINAL)
Df4 = Df1  %>% 
  complete(anio, trimestre)

