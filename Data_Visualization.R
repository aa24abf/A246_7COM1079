library(ggplot2)
library(dplyr)

data = read.csv("Dataset_SMA.csv")
data

summary(data)

# Data Cleaning - Removing Null values

sum(!is.finite(data$sma))
data_cleaned <- data[!is.na(data$sma) & !is.nan(data$sma) & !is.infinite(data$sma), ]
sum(!is.finite(data_cleaned$sma))

y <- data_cleaned$pricevolatility
x <- data_cleaned$sma

# Histogram of Price Volatility

h <- hist(y
  , 12
  , main = "Histogram of Price Volatility"
  , xlab = "Price Volatility (in KRW)"
  , ylab = "Frequency"
  , col  = "blue"
  )
xfit <- seq(min(y), max(y), length = 40) 
yfit <- dnorm(xfit, mean = mean(y), sd = sd(y)) 
yfit <- yfit * diff(h$mids[1:2]) * length(y) 

lines(xfit, yfit, col = "black", lwd = 2)

# Scatterplot of Price Volatility vs. 20-Day Simple Moving Average

plot(x,y,main = "Scatterplot of Price Volatility vs. 20-Day Simple Moving Average" , xlab = "Price Volatility (in KRW)" , ylab = "20-day SMA (in KRW)" , pch = 19, frame = T)
model <- lm(y ~ x, data = data_cleaned)
abline(model, col = "blue")

# Kendall Statistical Test

cor_test_result <- cor.test(x, y, method = "kendall")
print(cor_test_result)

# Spearman Statistical Test

cor_test_result <- cor.test(x, y, method = "spearman")
print(cor_test_result)