library(ggplot2)
head(iris)
str(iris)

ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width)) +
  geom_point(stat="identity")


ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width)) +
  geom_point()

ggplot(iris) +
  geom_point(aes(x=Petal.Length, y=Petal.Width))


ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) +
  geom_point(aes(color=Species, shape=Species)) +
  facet_wrap(~Species, nrow=1)


str(iris)
mycate <- factor(sample(c(0,1), nrow(iris), replace=T))
myiris <- data.frame(iris, mycate)
str(myiris)

ggplot(myiris, aes(x=Petal.Length, y=Petal.Width)) +
  geom_point(aes(color=Species, shape=Species)) +
  facet_grid(Species~mycate)

dat <- data.frame(x1=rnorm(100))
ggplot(dat, aes(x=x1)) +
  geom_bar()

ggplot(dat, aes(x=x1)) +
  geom_bar(stat="bin", bins=30)


x1 <- rnorm(10)
x2 <- rnorm(10)
dat <- data.frame(x1, x2)
ggplot(dat, aes(x=x1, y=x2)) +
  geom_bar(stat="identity") +
  geom_point(col="red", size=4)

x1 <- as.factor(1:3)
y1 <- tabulate(sample(x1, 100, replace=T))
dat <- data.frame(x1, y1)
ggplot(dat, aes(x=x1, y=y1, fill=x1)) +
  geom_bar(stat="identity") +
  guides(fill=FALSE) +
  xlab("Discrete cases") + 
  ylab("Value") +
  ylim(c(0,50))+
  ggtitle("Bar graph for x:discrete and y:value")


x1 <- c(12, 21, 40)
x2 <- c(33, 10, 82)
dat <- data.frame(x1, x2)
ggplot(dat, aes(x1, x2)) +
  geom_line() +
  geom_point() 

ggplot(dat, aes(x=x1, y=x2)) +
  geom_line(size=2) +
  geom_point(size=4, pch=21, fill="white") +
  guides(fill=FALSE) +
  ylim(c(0, 100)) +
  xlab("Continuous cases") + ylab("Value") +
  ggtitle("Line graph for x:continuous and y:continuous")

x1 <- as.factor(c(1:3))
y1 <- c(33, 10, 82)
dat <- data.frame(x1, y1)
str(dat)
ggplot(dat, aes(x=x1, y=y1, group=1)) +
  geom_line(stat="identity") +
  guides(fill=FALSE) +
  xlab("Discrete cases") + ylab("Value") +
  ylim(c(0,100))+
  ggtitle("Line plot for x:discrete and y:continuous")



# =====================================


head(airquality)
!is.na(airquality$Ozone)
ozone_complete1 <- airquality[!is.na(airquality$Ozone),]
ozone_complete2 <- filter(airquality, !is.na(airquality$Ozone))
ozone_complete3 <- subset(airquality, !is.na(Ozone))

ozone_complete4 <- subset(airquality, !is.na(Ozone), select=c(Ozone, Temp, Month, Day))
ozone_complete5 <- subset(airquality, !is.na(Ozone) & !is.na(Solar.R), select=c(-Month, -Day))







df1 <- data.frame(id=c(1,2,3,4,5,6), age=c(30, 41, 33, 56, 20, 17))
df2 <- data.frame(id=c(4,5,6,7,8,9), gender=c("f", "f", "m", "m", "f", "m"))

df_inner <- merge(df1, df2, by="id", all=F)
df_outer <- merge(df1, df2, by="id", all=T)
df_left_outer <- merge(df1, df2, by="id", all.x=T)
df_right_outer <- merge(df1, df2, by="id", all.y=T)



str(airquality)
g <- factor(airquality$Month)
airq_split <- split(airquality, g)
class(airq_split)
str(airq_split)

## without with
ozone_complete <- airquality[!is.na(airquality$Ozone),"Ozone"]
temp_complete <- airquality[!is.na(airquality$Temp),"Temp"]
print(mean(ozone_complete))
print(mean(temp_complete))

## with
with(airquality, {
  print(mean(Ozone[!is.na(Ozone)]))
  print(mean(Temp[!is.na(Temp)]))
})


newairquality <- within(airquality, {
  celsius = round((5*(Temp-32))/9, 2)
})
head(newairquality)

## data.frame
celsius <- round((5*(airquality$Temp-32))/9, 2)
newairquality <- data.frame(airquality, celsius)
head(newairquality)

library(UsingR)
library(ggplot2)
head(babies)
## a simple way to checkout the data
plot(babies$gestation)  
## or using ggplot...
ggplot(babies, aes(x=1:length(gestation), y=gestation)) + 
  geom_point()
babies$gestation[babies$gestation>900] <- NA
str(babies)

new_babies <- within(babies, {
  gestation[gestation==999] <- NA
  dwt[dwt==999] <- NA
})
str(new_babies)

str(babies$smoke)
new_babies <- within(babies, {
  gestation[gestation==999] <- NA
  dwt[dwt==999] <- NA
  smoke = factor(smoke)
  levels(smoke) = list(
    "never" = 0, 
    "smoke now" = 1, 
    "until current pregnancy" = 2,
    "once did, not now" = 3)
})
str(new_babies$smoke)

fit <- lm(gestation~smoke, new_babies)
summary(fit) ## t-test 결과 
anova(fit)


newdf <- subset(new_babies, (smoke=="smoke now" | smoke == "never") & age < 25, select=c(id, gestation, age, wt, smoke))
ggplot(newdf, aes(x=wt, y=gestation, color=smoke)) +
  geom_point(size=3, alpha=0.5, na.rm=T) +
  facet_grid(.~smoke) + 
  theme_bw()


