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


x <- 2
x>0
if(x%%2==1 & x>0){
  cat("odd")
}else{
  cat("even")
}


if(x>0)
  cat("positive")

x <- 0
if(x > 0){
  print("Posive")
} else if(x < 0){
  print("Negative")
} else {
  print("Zero")
}

x <- c(1, 4, 5, 2, 3)
sort(x)
median(x)

mymedian <- function(x){
  x
}

x <- 1:10
x
for(i in x){
  cat(i, "\n")
  flush.console()
}

sum_of_i <- 0
for(i in 1:10000){
  sum_of_i <- sum_of_i + i
  if(i%%100==0){
    cat(i, " ", sum_of_i, "\n");flush.console()
  }
}

i <- 10
f <- 1
while(i>1){
  f <- i*f
  i <- i-1
  cat(i, f, "\n")
}
f
factorial(10)

x <- 1:1E7
sum(x)
system.time(sum(x))

st <- proc.time()
total <- 0
for(i in 1:length(x)){
  total <- total + x[i]
}
ed <- proc.time()
ed-st

x <- 1:10
y <- 5:15
i <- na.omit(match(x, y))
y[i]

i <- which(x %in% y)
x[i]

intersect(x, y)

z <- c(x, y)
unique(z)

x <- "Factors, raw vectors, and lists, are converted"
substr(x, 1, 6)
grep("raw", x)
grepl("raw", x)

x <- paste(LETTERS, 1:100, sep="")
grep("A", x)
x[grep("A", x)]

grepl("A", x)
r <- grepl("A", x)
sum(r)
if(4){
  cat("Yes, I found A")
}else{
  cat("No A")
}

x <- c("Factors, raw vectors, and lists, are converted", "vectors, or for, strings with")
y <- strsplit(x, split=", ")
unlist(y)

y <- strsplit(x, split="")
ychar <- unlist(y)
ycharup <- toupper(ychar)
ycount <- table(ycharup)
ycount_sort <- sort(ycount)
ycount_sort <- sort(ycount, decreasing = T)
ycount_top <- ycount_sort[1:5]
ycount_top_char <- names(ycount_top)

toupper(ycount_top_char)


x <- c(1,2,3,4)
y <- c(5,6,7,8)
xy <- data.frame(x, y)
write.table(xy, file="table_write.txt")
write.table(xy, file="table_write.txt", quote=F, row.names=F, sep=",")

mydata<-read.table(file="table_write.txt")
mydata<-read.table(file="table_write.txt", sep=",")
mydata<-read.table(file="table_write.txt", sep=",", header = T)

plot(x=mydata$x, y=mydata$y)
plot(mydata$x, mydata$y, col="red")

iris
library(readxl)
mydata <- read_excel("Rprog04-fl.xls", sheet=1, skip = 0, col_names=T)
mydf <- data.frame(well=mydata$Well, od=mydata$`595nm_kk (A)`, gfp=mydata$`EGFP_sulim (Counts)`)
head(mydf)
mydf$well
str(mydf)
well_labels <- as.character(mydf$well)
strsplit(well_labels, split="")
well_concentration <- substr(well_labels, 1, 1)
cell_number <- substr(well_labels, 2, 3)
mydf2 <- data.frame(well_concentration, cell_number, mydf$od, mydf$gfp)
str(mydf2)
mydf2 <- data.frame(well_concentration, cell_number, mydf$od, mydf$gfp, stringsAsFactors = F)

idx <- which(mydf2$cell_number == "01")
mydf2_01 <- mydf2[idx,]
mydf2_01$mydf.gfp

plot(mydf2_01$mydf.gfp)
barplot(mydf2_01$mydf.gfp)
barplot(mydf2_01$mydf.gfp, names.arg = mydf2_01$well_concentration)

barplot(sample1df$sample_means, names.arg=sample1df$conc, ylim=c(0, 80000))
arrows(0.7, sample_means[1], 0.7, sample_means[1]+sample_std[1], length=0.1, angle=90)
arrows(0.7, sample_means[1], 0.7, sample_means[1]-sample_std[1], length=0.1, angle=90)
lab <- paste("SD:", round(sample_means[1]+sample_std[1],1))
text(0.5, sample_means[1]+sample_std[1]*2, labels = lab)











