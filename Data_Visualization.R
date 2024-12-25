library(ggplot2)
library(dplyr)

data = read.csv("Dataset_SMA.csv")
data

sum(!is.finite(data$sma))
data_cleaned <- data[!is.na(data$sma) & !is.nan(data$sma) & !is.infinite(data$sma), ]
sum(!is.finite(data_cleaned$sma))


cor_test_result <- cor.test(data_cleaned$sma, data_cleaned$diff, method = "pearson")

print(cor_test_result)
