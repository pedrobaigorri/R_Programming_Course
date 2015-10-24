########################################################################################
##
## File: progAssigment3.R
##
## This file contains the first function required for the program assigment 3
## of the R Programming course
##
## Author: https://github.com/pedrobaigorri
## Date: 24/10/2015
##
#########################################################################################

## Plot the 30-day mortality rates from heart attack

mortalityPlot <- function ()
{
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    head(outcome)
    
    ## getting the rates from hear attack
    outcome[, 11] <- as.numeric(outcome[, 11])
 
    
    rates <- outcome[, 11]  
    rates <- rates[!is.na(rates)]

    ## plotting the histogram of the rates
    hist(rates)

    ## the mean of rates        
    mean(rates)
    
}