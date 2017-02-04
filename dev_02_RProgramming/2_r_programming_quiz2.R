# Quiz 2
old_dir <- getwd()
main_dir <- setwd("C:/Users/Gabriel Oliveira/Dropbox/Pesquisa/DataScienceSpec/dev_02_RProgramming")

# Part 1 ###
# Write a function named 'pollutantmean' that calculates the mean of a pollutant
# (sulfate or nitrate) across a specified list of monitors. The function
# 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'.
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors'
# particulate matter data from the directory specified in the 'directory'
# argument and returns the mean of the pollutant across all of the monitors,
# ignoring any missing values coded as NA. A prototype of the function is as
# follows

pollutantmean <- function(directory, pollutant, id = 1:332) {
  # 1. Directory of the function is defined
  main_dir <- "C:/Users/Gabriel Oliveira/Dropbox/Pesquisa/DataScienceSpec/dev_02_RProgramming"
  # main_dir <- "C:/Users/ITDP-BRASIL/Dropbox/Pesquisa/DataScienceSpec/dev_02_RProgramming"

  # 2. Vector id is formatted to the proper 3-character-with-leading-zeros format
  id <- sprintf("%03d", id)

  # 3. Loop through all ids in the vector
  for(i in id){
    
    # 3.1. Definition of the file which will be read through file.path function
    file_to_be_read <- file.path(main_dir, directory, paste(i, ".csv", sep = ""))
    
    # 3.2. CSV data importing
    dt <- read.csv(file_to_be_read)
    
    # 3.3. If this is not the first dataset imported, bind it to the total dataset
    if(i == id[1]){
      dt_tot <- dt
    } else {
      dt_tot <- rbind(dt_tot, dt)
    }
    
    # 3.4. print of total rows imported
    cat("Imported", nrow(dt), "rows. Total of:", nrow(dt_tot), "rows.\n")
  }

  # 4. Mean is calculated through all dataset, excluding the NAs and considering only the pollutant of interest
  cat("Mean", mean(dt_tot[!is.na(dt_tot[, pollutant]), pollutant]))
}

# Testing the values to be tested:

pollutantmean("specdata", "sulfate", id = 1:10)
pollutantmean("specdata", "nitrate", id = 70:72)
pollutantmean("specdata", "nitrate", id = 23)
pollutantmean("specdata", "sulfate", id = 34)
pollutantmean("specdata", "nitrate")

### RESULTS ARE OK ! ###

# Part 2 ###

# Write a function that reads a directory full of files and reports the number
# of completely observed cases in each data file. The function should return a
# data frame where the first column is the name of the file and the second
# column is the number of complete cases. A prototype of this function follows

complete <- function(directory, id = 1:332) {
  # 1. Directory of the function is defined
  main_dir <- "C:/Users/Gabriel Oliveira/Dropbox/Pesquisa/DataScienceSpec/dev_02_RProgramming"
  # main_dir <- "C:/Users/ITDP-BRASIL/Dropbox/Pesquisa/DataScienceSpec/dev_02_RProgramming"
  
  # 2. Vector id is formatted to the proper 3-character-with-leading-zeros format
  id <- sprintf("%03d", id)
  nobs <- vector(length = length(id))
  
  # 3. Loop through files inside the folder 
  for (i in seq_along(id)) {

    # 3.1. Definition of the file which will be read through file.path function
    file_to_be_read <- file.path(main_dir, directory, paste(id[i], ".csv", sep = ""))
    
    # 3.2. CSV data importing
    dt <- read.csv(file_to_be_read)
    
    # 3.3. Calculate the number of complete cases of the monitor 
    nobs[i] <- sum(complete.cases(dt))

  }

  # 4. Final answer in a data.frame format
  answer <- data.frame(id, nobs)
  answer
  
}

# Testing the values to be tested:

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
complete("specdata")

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)
set.seed(42)

cc <- complete("specdata", 332:1)
use <- sample(332, 10)
use
print(cc[use, "nobs"])

### RESULTS ARE OK ! ###


# Part 3 ###

# Write a function that takes a directory of data files and a threshold for
# complete cases and calculates the correlation between sulfate and nitrate for
# monitor locations where the number of completely observed cases (on all
# variables) is greater than the threshold. The function should return a vector
# of correlations for the monitors that meet the threshold requirement. If no
# monitors meet the threshold requirement, then the function should return a
# numeric vector of length 0. A prototype of this function follows

corr <- function(directory, threshold = 0){
  # 1. Directory of the function is defined
  main_dir <- "C:/Users/Gabriel Oliveira/Dropbox/Pesquisa/DataScienceSpec/dev_02_RProgramming"
  # main_dir <- "C:/Users/ITDP-BRASIL/Dropbox/Pesquisa/DataScienceSpec/dev_02_RProgramming"
  
  # 2. Vector id is formatted to the proper 3-character-with-leading-zeros format
  # id <- sprintf("%03d", id)
  
  # 3. Call function complete to locate the number of complete cases in each monitor
  complete_cases <- complete(directory)
  
  # 4. Check whether the complete cases are greater than the threshold
  threshold_check <- complete_cases[complete_cases$nobs >= threshold, ]
  answer <- vector()
  
  # 3. Loop through all ids in the vector
  for(i in seq_along(threshold_check$id)) {

    # 3.1. Definition of the file which will be read through file.path function
    file_to_be_read <- file.path(main_dir, directory, paste(threshold_check$id[i], ".csv", sep = ""))
    
    # 3.2. CSV data importing
    dt <- read.csv(file_to_be_read)
    
    # 3.3. Correlates and assigns to the appropriate vector the values
    if(sum(complete.cases(dt)) != 0) {
      if(is.null(answer)) {
        answer[1] <- cor(x = dt[complete.cases(dt), "nitrate"], y = dt[complete.cases(dt), "sulfate"])
      } else {
        answer <- c(answer, cor(x = dt[complete.cases(dt), "nitrate"], y = dt[complete.cases(dt), "sulfate"]))
      }
    }

    # 4. Devolução do valor final da resposta
    answer
}

corr(directory = "specdata", threshold = 600)
?head
cr <- corr("specdata", 150)
head(cr)
summary(cr$answer)
?summary
cr <- corr("specdata", 400)
head(cr)
summary(cr$answer)
length(cr)
cr <- corr("specdata", 100000)
cr <- corr("specdata")
length(cr)
summary(cr)


cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)


cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))