##
## This is the file for the Quizz 1 exercises of the R Programming Course
##
## Author: Pedro A. Alonso Baigorri
##
## Date: 09/10/2015
##
##

# loading data into R
hw_data <- read.table("hw1_data.csv", header = TRUE, sep = ",")
head (hw_data)

# printing first 2 rows
hw_data[1:2,]

# getting the number of rows
number_rows<-nrow(hw_data)
print(number_rows)

##printing the last 2 rows
hw_data[(number_rows-1):number_rows,]

##What is the value of Ozone in the 47th row?
hw_data[47,"Ozone"]


##How many missing values are in the Ozone column of this data frame?
column_ozone <- hw_data[,"Ozone"]
column_ozone_na<-(is.na(column_ozone))
sum(column_ozone_na)
# another way to do it
nrow(hw_data[is.na(hw_data$Ozone),])

#What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
column_ozone_without_na<-column_ozone[!column_ozone_na]
mean(column_ozone_without_na)


#Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
subset18 <-hw_data[hw_data$Ozone >31 & hw_data$Temp > 90,]
column_solar <- subset18[,"Solar.R"]
column_solar_without_na<-column_solar[!is.na(column_solar)]
mean(column_solar_without_na)


#What is the mean of "Temp" when "Month" is equal to 6?
subset19 <-hw_data[hw_data$Month==6,]
column_temp <- subset19[,"Temp"]
column_temp_without_na<-column_temp[!is.na(column_temp)]
mean(column_temp_without_na)

#What was the maximum ozone value in the month of May (i.e. Month = 5)?
subset20 <-hw_data[hw_data$Month==5,]
column_ozone <- subset20[,"Ozone"]
max(column_ozone[!is.na(column_ozone)])

#printing  columns Ozone and Temp
hw_data[,c("Ozone","Temp")]
