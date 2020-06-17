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



str(iris)
iris %>% filter(Species=="virginica") %>% str

iris2 <- mutate(iris, sepal_ratio = Sepal.Length/Sepal.Width)
iris %>% mutate(sepal_ratio = Sepal.Length/Sepal.Width) %>% head
head(iris2)
iris$Sepal.Length



airquality %>% str
airquality %>% 
  group_by(Month) %>% 
  summarise(ozone_mean=mean(Ozone, na.rm=T), temp_mean=mean(Temp, na.rm=T))

airquality %>% 
  group_by(Month) %>% 
  summarise_all(mean, na.rm=T)

aq_mean <- airquality %>% 
  group_by(Month) %>% 
  dplyr::select(-Day) %>% 
  summarise_all(mean, na.rm=T)

aq_sd <- airquality %>% 
  group_by(Month) %>% 
  dplyr::select(-Day) %>% 
  summarise_all(sd, na.rm=T)

## 
aq_mean_mlt <- aq_mean %>% melt(id.var="Month") 
aq_sd_mlt <- aq_sd %>% melt(id.var="Month") 
aq_join <- inner_join(aq_mean_mlt, aq_sd_mlt, by=c("Month", "variable"))
aq_join %>% head
data.frame(aq_mean_mlt, aq_sd_mlt$value) %>% head

ggplot(aq_join, aes(x=Month, y=value.x, fill=variable)) +
  geom_bar(stat="identity", position="dodge") +
  geom_errorbar(aes(ymax=value.x+value.y, ymin=value.x-value.y),
                position=position_dodge(0.9),
                width=0.4)

head(babies)

babies %>% dplyr::select(wt, gestation, smoke) %>% 
  ggplot(aes(x=wt, y=gestation)) +
  geom_point()

# levels(smoke) = list(
#     "never" = 0, 
#     "smoke now" = 1, 
#     "until current pregnancy" = 2,
#     "once did, not now" = 3)
#   })

b1 <- babies %>% dplyr::select(wt, gestation, smoke) %>% 
  filter(gestation!=999 & smoke!=9) %>% 
  mutate(smokef=factor(smoke, labels = c("naver", 
                                         "smoke now",
                                         "until current pre",
                                         "once did, not now")))

b1 %>% str


plot(b1$smoke)

ggplot(b1, aes(x=wt, y=gestation, color=smokef)) +
  geom_point() +
  facet_wrap(.~smokef, nrow=2) +
  geom_smooth(method="lm", color="black") +
  theme_bw()

# average gestation in each smoke group 
b1 %>%  head
b1 %>% group_by(smokef) %>% summarise(mean(gestation))

# correlation between gestation and wt in each smoke group
b1 %>% group_by(smokef) %>% summarise(cor(gestation, wt))
