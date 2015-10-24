## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
## NOTE: Do not round the result!
##

pollutantmean <- function(directory, pollutant, id = 1:332) {

  firstTime = TRUE

  ## opening the files
  for (i in id) {
    
    my.file <- sprintf("%s/%03d.csv", directory, i)

    pollutant.data.frame <- read.csv(my.file)
    
    ## create the vector with the desired data
    if (firstTime){
      pollution_data <- pollutant.data.frame[, pollutant]
      firstTime = FALSE
    }
    else{
      pollution_data <- append(pollution_data, pollutant.data.frame[, pollutant])
      
    }
    
    
  }
  
  mean(pollution_data, na.rm = TRUE)

}


