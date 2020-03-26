corr <- function(directory, threshold = 0) {
  corrs <- c()
  id = 1:332
  sid <- sprintf("%03d", id) # Convert id to a character vector with 3 characters for each integer
  for (i in sid) {
    
    fname <- paste(directory, "/", i, ".csv", sep = "")
    read.csv(file = fname) -> ytemp
    nobs <- nrow(ytemp[complete.cases(ytemp), ])
    
    if (nobs > threshold) {
      corrs <- c(corrs, cor(ytemp$sulfate, ytemp$nitrate, use = "complete.obs"))
    }
  } 
  return(corrs)
}




