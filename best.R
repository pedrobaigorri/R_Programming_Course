########################################################################################
##
## File: best.R
##
## This file contains the best function required for the program assigment 3
## of the R Programming course
##
## It gets the best hospital in a given state that is the best according to the
## medical KPIs of the outcome parameter
##
## outcome possible values are: ""heart attack", "heart failure", "pneumonia"
##
## Author: https://github.com/pedrobaigorri
## Date: 24/10/2015
##
#########################################################################################

best <- function(state, outcome) {

    ##state <- "pp"
    ##outcome <- "xx"
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
    
    ## Return hospital name in that state with lowest outcome rate
    output[1,2]

}
