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

ggplot(data = data_cleaned, aes(x = sma, y = diff)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Scatterplot of 20-day SMA vs. Difference btw High and Low", x = "20-day SMA", y = "Difference btw High and Low") +
  theme_minimal()

cor_test_result <- cor.test(data_cleaned$sma, data_cleaned$diff, method = "pearson")

print(cor_test_result)
