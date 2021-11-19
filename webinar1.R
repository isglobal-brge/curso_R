# cargar librerias
library(summarytools)
library(tidyverse)

# directorio de trabajo (ojo cambiar!!!!)
setwd("c:/juan/cursos/R_Zaragoza/material_curso_online/datos")
  
# cargar datos
riscar <- read.delim("riscar.txt")

head(riscar)

table(riscar$estado)
summary(riscar$peso)
summary(riscar$clase)


# hacemos un resumen
dfSummary(riscar)

# transformamos la variable creatinina
riscar <- mutate(riscar, log(creatinina))
riscar <- mutate(riscar, log_creat = log(creatinina))
head(riscar)

# como eliminar una variable: log(creatinina)
riscar <- select(riscar, -`log(creatinina)`)
head(riscar)

# veamos si la variable transformada es normal
dfSummary(riscar)

# veamos una descriptiva según vivo o no a 30 días

# variables continuas
stby(riscar, INDICES = riscar$estado, FUN = descr, stats = "common", transpose = TRUE)

# variables categóricas

summarytools::freq(riscar)



