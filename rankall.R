########################################################################################
##
## File: rankall.R
##
## This file contains the rankall function required for the program assigment 3
## of the R Programming course
##
## It gets the best hospital for each state that is the best according to the
## medical KPIs of the outcome parameter
##
## outcome possible values are: ""heart attack", "heart failure", "pneumonia"
##
## Author: https://github.com/pedrobaigorri
## Date: 24/10/2015
##
#########################################################################################


get_rank_list <- function(x, num) {
    
    # getting the N ranking required
    if (num == "best"){
        num = 1
    }
    else if (num == "worst"){

        ## taking out the NA to calculate the last row with data
        x <- x[complete.cases(x), ]
        num = nrow(x)    
        
    } 
    
    ## returning a vector of 2 values, the state and the hospital
    c(x$State[num], x$Hospital.Name[num])
    
    
}

rankall <- function(outcome, num = "best") {
    
    col_rate = 0
    
    ## Read outcome data
    f <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
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
    
    ## converting rate into numeric
    f[, col_rate] <- as.numeric(f[, col_rate])
    
    ## ordering the hospitals by all including state in the order (state, outcome, name)
    col_state <- 7
    output<- f[order(f[, col_state], f[,col_rate], f[,2]), ]
    
    
    ## split the output by state
    s_output <- split(output, output$State)
    
    ## get a list of vectors with the desired N ranking for each state
    l <- lapply(s_output, function (x) get_rank_list(x, num))
    
    ## create the output data frame
    df <- data.frame()
    
    ## copy the obtained ranked list in the output data frame
    for (i in 1:length(l)){
        
        ## temporal data frame
        x <- data.frame()
        
        ## setting the name of the hospital
        x[1,1] <- l[[i]][[2]]
        
        ## setting the name of the state
        x[1,2]<- names(l[i])
        
        ## adding the row to the output dataframe
        df <- rbind(df, x)
        
        
    }
    
    ## adding the colnames to the output data frame
    colnames(df) <- c("hospital", "state")
    
    ## returning the output data frame
    df

}

    
    
