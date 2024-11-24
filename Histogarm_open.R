library(ggplot2)
splot1 <-data

ggplot(splot1,aes(x=sma,y=Close))+
  geom_point(color="blue") 


hist(splot1$Open,probability = TRUE,
     main = "Histogram of Dependent Variable", 
     xlab = "Open", 
     ylab = "Frequency", 
     col = "lightblue", 
     border = "black", 
     breaks = 30)  
curve(dnorm(x, mean = mean(splot1$Open), sd = sd(splot1$Open)), 
     add = TRUE,           # Add to the existing plot
     col = "red",         # Color of the curve
     lwd = 1)             # Line width

summary(splot1$sma)