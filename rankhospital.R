########################################################################################
##
## File: rankhospital.R
##
## This file contains the rankhospital function required for the program assigment 3
## of the R Programming course
##
## It gets the rank "num" hospital in a given state that is the best according to the
## medical KPIs of the outcome parameter
##
## outcome possible values are: ""heart attack", "heart failure", "pneumonia"
##
## Author: https://github.com/pedrobaigorri
## Date: 24/10/2015
##
#########################################################################################

rankhospital <- function(state, outcome, num = "best") {
    
    col_rate = 0
    
    ## Read outcome data
    f <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Checking if the state is valid
    file_state <- f[f[,"State"] == state,]
    
    if (nrow(file_state)== 0){
        stop("invalid state")
    }
    
    ## Cheking if the outcome is valid
    if (outcome == "heart attack"){
        col_rate = 11
    }
    
    if (outcome == "heart failure"){
        col_rate = 17
    }
    
    if (outcome == "pneumonia"){
        col_rate = 23
    }
    
    if (col_rate == 0){
        stop ("invalid outcome")
    }
    
    ## ordering the hospitals
    file_state[, col_rate] <- as.numeric(file_state[, col_rate])
    
    output<- file_state[ order(file_state[,col_rate], file_state[,2]), ]
    
    ## getting only the required columns
    output_simple <- output[, c(2, col_rate)]
    
    ## removing NAs
    x <- complete.cases(output_simple)
    output_simple <- output_simple[x, ]
    
    # getting the N ranking required
    if (num == "best") num = 1
    
    if (num == "worst") num = nrow(output_simple)
    
    ## Return hospital name in that state with N rank of the outcome rate
    output_simple[num, 1]
    
}
