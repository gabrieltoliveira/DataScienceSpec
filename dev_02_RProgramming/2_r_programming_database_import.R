# Reading Tabular Data
setwd(dir = "C:/Users/ITDP-BRASIL/Dropbox/Pesquisa/DataScienceSpec/")
setwd(dir = "C:/Users/ITDP-BRASIL/Dropbox/Pesquisa/DataScienceSpec/dev_02_RProgramming/")
getwd()
dir()
help(ls)
initial <- read.csv(file = "PNT_research_database.csv", sep = ";",dec = ",", nrows = 100)
initial
classes <- sapply(initial, class)

classes[c("Cod_setor_txt","Cod_municipio", "Cod_subdistrito", "Cod_bairro")] = "character"
classes[c("rt_1km", "rt_3km")] = "numeric"
classes[13:29] = "integer"
classes
PNT_db <- read.table(file = "PNT_research_database.csv", header = 1, sep = ";", na.strings = c("X", "FALSO"), quote="\"", dec = ",")
PNT_db



# Dput and Dget
y <- data.frame (a = 1, b= "a")
dput(y,file = "output.R")
new.y <- dget("output.R")
new.y
?dir.create

