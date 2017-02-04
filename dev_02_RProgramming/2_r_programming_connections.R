# Reading Tabular Data
setwd(dir = "C:/Users/ITDP-BRASIL/Dropbox/Pesquisa/DataScienceSpec/")
setwd(dir = "C:/Users/ITDP-BRASIL/Dropbox/Pesquisa/DataScienceSpec/dev_02_RProgramming/")
getwd()
dir()

con <- url("http://www.itdpbrasil.org.br")
x <- readLines(con)
head(x)
