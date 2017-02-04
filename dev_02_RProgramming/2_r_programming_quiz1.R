# Start
dir()

# Use the Week 1 Quiz Data Set to answer questions 11-20.
data <- read.csv("hw1_data.csv")

# In the dataset provided for this Quiz, what are the column names of the dataset?
colnames(data)

# Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
data[1:2,]

# How many observations (i.e. rows) are in this data frame?
nrow(data)

# Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
data[(nrow(data)-1):nrow(data), ]

# What is the value of Ozone in the 47th row?
data$Ozone[47]

# How many missing values are in the Ozone column of this data frame?
sum(is.na(data$Ozone))

# What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(data$Ozone[!is.na(data$Ozone)])

# Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
data_ext <- data$Ozone > 31 & data$Temp > 90
data_ext <- data[data_ext, ]
data_ext <- data_ext[!is.na(data_ext$Ozone), ]
data_ext
mean(data_ext$Solar.R)

# What is the mean of "Temp" when "Month" is equal to 6?
mean(data$Temp[data$Month == 6])


# What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
max(data$Ozone[data$Month == 5 & !is.na(data$Ozone)])

