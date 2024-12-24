library(ggplot2)
library(dplyr)

data = read.csv("Dataset_SMA.csv")
data

summary(data)

sum(!is.finite(data$sma))
data_cleaned <- data[!is.na(data$sma) & !is.nan(data$sma) & !is.infinite(data$sma), ]
sum(!is.finite(data_cleaned$sma))


h <- hist(data_cleaned$diff
  
  , 12
  , main = "Hyundai Stock Frequency"
  , xlab = "Difference of High and Low"
  , ylab = "Frequency"
  , col  = "azure"
  )

y <- data_cleaned$diff
x <- data_cleaned$sma

plot(x,y,main = "Hyundai Stock" , xlab = "Difference btw High and Low" , ylab = "20-day SMA" , pch = 19, frame = T)
model <- lm(y ~ x, data = data_cleaned)
abline(model, col = "blue")

cor_test_result <- cor.test(x, y, method = "kendall")
print(cor_test_result)

cor_test_result <- cor.test(x, y, method = "spearman")
print(cor_test_result)