complete <- function(directory, id = 1:332) {
  df <- data.frame(id) # create data frame with id column
  nobs <- c() # create empty vector nobs to add later as a column to df
  sid <- sprintf("%03d", id) # Convert id to a character vector with 3 characters for each integer
  for (i in sid) {
    
    fname <- paste(directory, "/", i, ".csv", sep = "")
    read.csv(file = fname) -> ytemp
    
    nobs <- c(nobs, nrow(ytemp[complete.cases(ytemp), ])) # add values to the vector nobs
  } 
  df$nobs <- nobs # add nobs vector as a column to df
  print(df)
}
  

