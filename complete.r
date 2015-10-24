## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases

complete <- function(directory, id = 1:332) {

  firstTime = TRUE
  
  n <- 0
  
  ## opening the files
  for (i in id) {
    
    n <- n + 1
    my.file <- sprintf("%s/%03d.csv", directory, i)
    
    pollutant.data.frame <- read.csv(my.file)
    
    sulfate.vector <- pollutant.data.frame[,"sulfate"]
    nitrate.vector <- pollutant.data.frame[,"nitrate"]
    
    ## removing all the NAs
    good <- complete.cases(sulfate.vector, nitrate.vector)
    output.value <- length(sulfate.vector[good])
    
   if (firstTime) {
      firstTime = FALSE
      output.data.frame <- data.frame(id = id[n], nobs = output.value)
    }
    else
    {
      temp.data.frame <- data.frame(id = id[n], nobs = output.value)
      output.data.frame <- rbind(output.data.frame, temp.data.frame)
      
    }
    
  
    
  }
  
  output.data.frame

}