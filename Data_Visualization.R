library(ggplot2)
library(dplyr)

data = read.csv("Dataset_SMA.csv")
data

sum(!is.finite(data$sma))
data_cleaned <- data[!is.na(data$sma) & !is.nan(data$sma) & !is.infinite(data$sma), ]
sum(!is.finite(data_cleaned$sma))

binwidth_value <- (max(data_cleaned$diff) - min(data_cleaned$diff)) / 50
ggplot(data = data_cleaned, aes(x = diff)) +
  geom_histogram(aes(y = after_stat(density)), binwidth = binwidth_value, fill = "blue", color = "white", alpha = 0.7) +
  geom_density(color = "red", size = 1) +
  labs(title = "Difference between High and Low with Density Curve", 
       x = "Difference (High - Low)", 
       y = "Density") +
  theme_minimal()

ggplot(data = data_cleaned, aes(x = sma, y = diff)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Scatterplot of 20-day SMA vs. Difference btw High and Low", x = "20-day SMA", y = "Difference btw High and Low") +
  theme_minimal()

cor_test_result <- cor.test(data_cleaned$sma, data_cleaned$diff, method = "pearson")

print(cor_test_result)
