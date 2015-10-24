

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations
## NOTE: Do not round the result!

corr <- function(directory, threshold = 0) {

  
  corr.vector <- vector("numeric")
  id <- 1:332
  
  ## opening the files
  for (i in id) {
    
    my.file <- sprintf("%s/%03d.csv", directory, i)
    
    pollutant.data.frame <- read.csv(my.file)
    
    sulfate.vector <- pollutant.data.frame[,"sulfate"]
    nitrate.vector <- pollutant.data.frame[,"nitrate"]
    
    ## calculating the complete cases
    good <- complete.cases(sulfate.vector, nitrate.vector)
    sulfate.vector <- sulfate.vector[good]
    nitrate.vector <- nitrate.vector[good]
    occurrences <- length(sulfate.vector[good])
    
    ## checking the threshold
    if (occurrences < threshold ){
      next
    }
    
    x <- cor(sulfate.vector, nitrate.vector)
    
    corr.vector <- append(corr.vector, x)
    
  }
  
  
  corr.vector <- corr.vector[!is.na(corr.vector)]

}
