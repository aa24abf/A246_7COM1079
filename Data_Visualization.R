library(ggplot2)
library(dplyr)

data = read.csv("Dataset_SMA.csv")
data

sum(!is.finite(data$sma))
data_cleaned <- data[!is.na(data$sma) & !is.nan(data$sma) & !is.infinite(data$sma), ]
sum(!is.finite(data_cleaned$sma))

binwidth_value <- (max(data_cleaned$sma) - min(data_cleaned$sma)) / 50
ggplot(data = data_cleaned, aes(x = sma)) +
  geom_histogram(binwidth = binwidth_value, fill = "blue", color = "white", alpha = 0.7) +
  labs(title = "Histogram of 20-day SMA", x = "20-day SMA", y = "Frequency") +
  theme_minimal()

ggplot(data = data_cleaned, aes(x = sma, y = diff)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Scatterplot of 20-day SMA vs. Difference btw High and Low", x = "20-day SMA", y = "Difference btw High and Low") +
  theme_minimal()

summary(data_cleaned$sma)
summary(data_cleaned$diff)

range(data_cleaned$sma)
range(data_cleaned$diff)

data_cleaned$logSMA = log10(data_cleaned$sma)
data_cleaned$logdiff = log10(data_cleaned$diff)

sum(!is.finite(data_cleaned$logdiff))
data_cleaned <- data_cleaned[!is.na(data_cleaned$logdiff) & !is.nan(data_cleaned$logdiff) & !is.infinite(data_cleaned$logdiff), ]
sum(!is.finite(data_cleaned$logdiff))

sum(!is.finite(data_cleaned$logSMA))
data_cleaned <- data_cleaned[!is.na(data_cleaned$logSMA) & !is.nan(data_cleaned$logSMA) & !is.infinite(data_cleaned$logSMA), ]
sum(!is.finite(data_cleaned$logSMA))

ggplot(data = data_cleaned, aes(x = log10(sma), y = log10(diff))) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +  # Add trend line
  labs(
    title = "Log-transformed Scatterplot of 20-day SMA vs. Difference btw High and Low",
    x = "Log10 of 20-day SMA",
    y = "Log10 of Volume"
  ) +
  theme_minimal()

cor_raw <- cor(data_cleaned$sma, data_cleaned$diff, use = "complete.obs")
cat("Correlation between SMA20 and Difference:", cor_raw, "\n")

# Calculate correlation after log transformation
cor_log <- cor(log10(data_cleaned$sma), log10(data_cleaned$diff + 1), use = "complete.obs")
cat("Correlation after log transformation:", cor_log, "\n")
