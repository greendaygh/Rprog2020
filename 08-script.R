library(reshape2)
head(airquality)
myair <- airquality[1:5,]
myair
myair_mlt <- melt(myair, id.vars=c("Month", "Day"))
myair_mlt

x <- 1:5
x %>% paste("a", sep="")
paste(x, "a", sep="")


head(iris)
filter(iris, Species=="setosa", Species=="versicolor")
filter(iris, Species=="setosa" & Species=="versicolor")
filter(iris, Species=="setosa" | Species=="versicolor") %>% dim

iris %>% filter(Species=="setosa")
  

arrange(iris, Sepal.Length)
arrange(iris, desc(Sepal.Length))
arrange(iris, Sepal.Length, Sepal.Width)

iris %>% arrange( Sepal.Length) %>% head(10)


head(iris)
select(iris, Species, everything())
select(iris, -Species)
select(iris, starts_with('S')) %>% head(10)
select(iris, obs = starts_with('S'))  %>% head(10)
iris2 <- rename(iris, aavar = Petal.Length) %>% head(10)
select(iris2, matches("(.)\\1"))
tmp <-iris[,3:5]
colnames(iris)[grep("^S", colnames(iris))]
iris[,grep("^S", colnames(iris))]
tmp

iris2 <- mutate(iris, sepal_ratio = Sepal.Length/Sepal.Width)
head(iris2)


summarise(iris, mean(Sepal.Length), m=mean(Sepal.Width))
by_species <- group_by(iris, Species)
summarise(by_species, mean(Sepal.Width))
summarise_all(by_species, mean)
summarise_all(by_species, sd)


df1 <- data.frame(id=c(1,2,3,4,5,6), age=c(30, 41, 33, 56, 20, 17))
df2 <- data.frame(id=c(4,5,6,7,8,9), gender=c("f", "f", "m", "m", "f", "m"))

inner_join(df1, df2)
left_join(df1, df2)
right_join(df1, df2)
full_join(df1, df2)


iris_split <- split(iris, iris$Species)
iris_means <- lapply(iris_split, function(x){colMeans(x[,1:4])})
iris_means_df <- data.frame(iris_means)
iris_means_df


iris_means_df2 <- iris %>% 
  group_by(Species) %>% 
  summarise_all(mean)


ggplot(iris_means_df2) +
  geom_bar(aes(x=Species, y=Sepal.Length), stat="identity")


### ==================================

### 7.3

g <- factor(airquality$Month)
airq_split <- split(airquality, g)
df <- airq_split[[1]]

ozone_func <- function(df){
  oz_mean <- mean(df$Ozone, na.rm=T)
  return(oz_mean)
}

ozone_func(df)

ozone_means <- unlist(lapply(airq_split, ozone_func))


