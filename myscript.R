mymean <- function(x){
  cat("Input numbers are", x, "\n")
  numbers_mean <- sum(x)/length(x)
  out <- paste("The average is ", numbers_mean, ".\n", sep="")
  cat(out)
  return(numbers_mean)
}

mysd <- function(x){
  numbers_sd <- sqrt(sum((x - mean(x))^2)/(length(x)-1))
  return(numbers_sd)
}