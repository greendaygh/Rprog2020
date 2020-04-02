mymean <- function(input){
  cat("Input numbers are", input, "\n")
  numbers_mean <- sum(input)/length(input)
  out <- paste("The average is ", numbers_mean, ".\n", sep="")
  cat(out)
  return(numbers_mean)
}

mysd <- function(){
  
}


