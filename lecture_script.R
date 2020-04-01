x <- seq(1, 5, by=1)
x <- seq(0, 100, length.out = 10)


rep(5, time=10)
rep(1:3, each=3)
rep(1:3, time=3)

is.na(1)
is.logical(TRUE)

x <- 1:20
x > 13
i <- which(x > 13)
x[i]


paste("X", "Y", "Z", sep=" ")
paste("X", "Y", "Z")
paste("X", 1:5, sep="")
paste(c("X","Y"), 1:10, sep="")
x <- c("X1", "Y2", "X3", "Y4", "X5")
paste(x[1], x[2], x[3], x[4], x[5])
paste(x, collapse=" ")
paste(x, collapse="")

strsplit("XYZ", split="")
strsplit("XYZ_ABC", split="_")

test_scores <- c(100, 90, 80)
names(test_scores) <- c("Alice", "Bob", "Shirley")
test_scores

z <- sample(1:10, size = 100, replace = T)
head(z)
sort(z)
order(z)
x <- c(2, 4, 3)
sort(x)
order(x)
table(z)
sum(z)
round(0.0123, 3)
round(0.16, 1)

class(z)
z2 <- as.character(z)
as.numeric(z2)




x <- c("Red", "Blue", "Yellow", "Green", "Blue", "Green")
y <- factor(x)
y

levels(y)
y[1] <- "Gold"

levels(y) <- c(levels(y), "Gold")
plot(y)
levels(y) <- c("Green", "Red", "Yellow","Gold", "Blue")



## ==================== lecture 4

numbers <- c(0.452, 1.474, 0.22, 0.545, 1.205, 3.55)
cat("Input numbers are", numbers, "\n")
numbers_mean <- sum(numbers)/length(numbers)
out <- paste("The average is ", numbers_mean, ".\n", sep="")
cat(out)


source("myscript.R")


my_sine <- function(x){
  y <- sin(x)
  return(y)
}

x <- 10
my_sine(x)


numbers <- c(0.452, 1.474, 0.22, 0.545, 1.205, 3.55, 2, 10, 5, 1)
mymean(numbers)

source("myscript.R")

z <- mymean(numbers)
z

mymean(1:10)
mymean(1:20)

?log
