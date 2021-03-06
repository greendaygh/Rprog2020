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

well_labels  <- as.character(mydf$well)
substr(well_labels[1], 2, 3)
cell_number <- substr(well_labels, 2, 3)
mydf2 <- data.frame(well_concentration, cell_number, mydf$od, mydf$gfp)
str(mydf2)
mydf2 <- data.frame(well_concentration, cell_number, mydf$od, mydf$gfp, stringsAsFactors = F)
str(mydf2)

idx <- which(mydf2$cell_number=="01")
mydf2_01 <- mydf2[idx,]

plot(mydf2_01$mydf.gfp)
barplot(mydf2_01$mydf.gfp)
barplot(mydf2_01$mydf.gfp, names.arg = mydf2_01$well_concentration)


idx <- which(mydf2$cell_number=="01")
sample1 <- mydf2[idx,]
idx <- which(mydf2$cell_number=="02")
sample2 <- mydf2[idx,]

sample_means <- (sample1$mydf.gfp + sample2$mydf.gfp)/2
sample_std <- sqrt(((sample1$mydf.gfp-sample_means)^2+(sample2$mydf.gfp-sample_means)^2)/(2-1))
sd(c(sample1$mydf.gfp[1], sample2$mydf.gfp[1]))
sample1df <- data.frame(conc=sample1$well_concentration, sample_means, sample_std)
sample1df

barplot(sample1df$sample_means, names.arg=sample1df$conc, ylim=c(0, 80000))
arrows(0.7, sample_means[1], 0.7, sample_means[1]+sample_std[1], length=0.1, angle=90)
arrows(0.7, sample_means[1], 0.7, sample_means[1]-sample_std[1], length=0.1, angle=90)
lab <- paste("SD:", round(sample_means[1],1))
text(0.5, sample_means[1]+sample_std[1]*2, labels = lab, adj = 0)


x <- 1:100
y <- x*2 + rnorm(100)
myxy <- data.frame(x,y )
plot(myxy)
plot(x=x, y=y)
rm(x, y)
plot(y~x)
plot(y~x, data=myxy)

z <- 100:1
points(x=x, y=z)
points(x=x, y=z, col="red")

?par
x <- rnorm(100)
hist(x, br=20, xlim=c(-3,3), main="Main text", xlab="X label")


x <- rnorm(100)
boxplot(x)
boxplot(myxy)

x <- sample(1:12, 200, replace = T)
tab_x <- table(x)
y <- sample(1:12, 200, replace = T)
tab_y <- table(y)
barplot(tab_x)
tab_xy <- rbind(tab_x, tab_y)
barplot(tab_xy)

barplot(tab_xy, beside = T, col=c("darkblue","red"), xlab="Month")


### ================= 

x <- rnorm(500, 0, 1)
hist(x, br=100)
y <- 2*x + rnorm(500, 5, 1)
hist(y, br=100)
z <- c(x, y)
hist(z, br=100)
zd <- density(z)
lines(zd)

hist(z, br=100, probability = T)
lines(zd)
plot(x=zd$x, y=zd$y)
plot(x=zd$x, y=zd$y, type="l")


plot(x, y, xlim=c(-5, 5), ylim=c(-5, 15), pch=3)
idx <- which(x<0)
points(x=x[idx], y=y[idx], pch=3, col="red")
plot(x, y, xlim=c(-5, 5), ylim=c(-5, 15), pch=3)
points(x=x[idx], y=y[idx], pch=15, col="blue")
fit <- lm(y~x)
abline(fit)
fit








library(readxl)
mydata <- read_excel("Exp_data.xls", sheet=1, skip = 0, col_names=T)
mydf <- data.frame(well=mydata$Well, 
                   od=mydata$`595nm_kk (A)`, 
                   gfp=mydata$`EGFP_sulim (Counts)`)
head(mydf)

designdata <- read_excel("Exp_design.xlsx", sheet=1, 
                         skip = 0, col_names=F)
designdata


library(reshape2)
labeldat <- melt(designdata, measure.vars=1:12)
labnum <- formatC(rep(1:12, each=8), width=2, format="d", flag="0")
## add a new variable
labeldat$well <- paste(LETTERS[1:8], labnum, sep="")
labeldat

labeldat_sel <- labeldat[labeldat$value!="-",]

labeldat_sel$value[2]
strsplit(labeldat_sel$value[2], split=";")
mylab_list <- strsplit(labeldat_sel$value, split=";")

mylab_df <- do.call(rbind, mylab_list) 
colnames(mylab_df) <- c("Name", "Rep", "Chem", "Conc")
## binding, selection
mylab_df2 <- data.frame(well = labeldat_sel$well, 
                        mylab_df, stringsAsFactors = F)
str(mylab_df2)
head(mylab_df2)
head(mydf)

mydf2 <- merge(mydf, mylab_df2, by='well')
mydf2_sub <- subset(mydf2, Name=="A")
a_mean <- aggregate(mydf2_sub$gfp, by=list(mydf2_sub$Conc), FUN=mean)
a_sd <-  aggregate(mydf2_sub$gfp, by=list(mydf2_sub$Conc), FUN=sd)
mydf2_merge <- merge(a_mean, a_sd, by="Group.1")
colnames(mydf2_merge) <- c("Conc", "mean", "sd")
barplot(mydf2_merge$mean, names.arg = mydf2_merge$Conc)

mydf_mean <- aggregate(mydf2$gfp, 
                       by=list(mydf2$Name, mydf2$Conc), 
                       FUN=mean)
colnames(mydf_mean) <- c("Name", "Conc", "mean")
mydf_mean


tmpdf <- rbind(mydf_mean[1:6,"mean"], 
               mydf_mean[7:12,"mean"], 
               mydf_mean[13:18,"mean"],
               mydf_mean[19:24,"mean"],
               mydf_mean[25:30,"mean"],
               mydf_mean[31:36,"mean"]
)
colnames(tmpdf) <- c("A", "B", "C", "D", "E", "F")
rownames(tmpdf) <- c("0", "0.1", "1", "10", "100", "1000")
tmpdf
barplot(tmpdf, beside = T)

library(RColorBrewer)
display.brewer.all()
mycol <- brewer.pal(6, "RdBu")
barplot(tmpdf, beside = T, col=mycol)
legend('topleft', 
       title = 'Conc', 
       legend = rownames(tmpdf), 
       fill=mycol, bty="n") 
