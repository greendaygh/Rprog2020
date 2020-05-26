library(ggplot2)
ggplot(mtcars, aes(x=mpg, y=hp)) +
  geom_point() +
  geom_smooth(span=0.8)


weights <- rnorm(200, 75, 5)
heights <- weights + rnorm(200, 100, 5)
classes <- sample(c("A", "B", "C", "D"), size=length(heights), replace = T)
mydata <- data.frame(heights, weights, classes)
str(mydata)

ggplot(mydata, aes(x=weights, y=heights, color=classes)) +
  geom_point() +
  geom_smooth()

ggplot(mydata, aes(x=weights, y=heights)) +
  geom_point(aes(color=classes)) +
  geom_smooth()

ggplot(mydata, aes(x=heights)) +
  geom_histogram(bins=10)

bloodtype <- sample(c("A", "B", "O", "AB"), nrow(mydata), replace=T)
mynewdata <- data.frame(mydata, bloodtype)
str(mynewdata)

ggplot(mynewdata, aes(x=classes, fill=bloodtype)) +
  geom_bar(position="dodge") +
  coord_polar()

myplot <- ggplot(mynewdata, aes(x=classes, fill=bloodtype)) +
  geom_bar(position="dodge") +
  labs(x='Four classes',
       y='Number of students',
       title='Blood type distribution',
       subtitle = 'Blood type distribution from the 200 students',
       fill='Blood Types') +
  scale_fill_discrete(name=element_blank(), labels=c("A type", "AB type", "B type", "O type"))

myplot + theme_bw()

myplot + 
  theme(
    panel.background = element_rect(fill="gray"),
    plot.background = element_rect(fill="gray")
  )

myplot + 
  theme(
    axis.line = element_line(arrow = arrow(angle = 15, length = unit(.15,"inches"))),
    axis.text = element_text(face = "bold", size = 12, angle = 30),
    axis.text.x = element_text(color="blue", size=18)
  )

myplot + 
  theme(
    plot.title=element_text(size=18, face = "bold", color="red", hjust=0.5),
    plot.subtitle = element_text(size=18, face = "bold", color="gray")
  )

mydf <- data.frame(x=rlnorm(1000, log(10), log(2.5)))
p <- ggplot(mydf, aes(x=x)) +
  geom_histogram()
p
p + scale_x_log10()


library(reshape2)
mydf <- data.frame(displ=mpg$displ, cty=mpg$cty, hwy=mpg$hwy)
mydf_mlt <- melt(mydf, id.vars="displ")
str(mydf_mlt)
