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

ggplot(data = data_cleaned, aes(x = sma, y = Volume)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Scatterplot of 20-day SMA vs. Volume", x = "20-day SMA", y = "Volume") +
  theme_minimal()

summary(data_cleaned$sma)
summary(data_cleaned$Volume)

range(data_cleaned$sma)
range(data_cleaned$Volume)

data_cleaned$logSMA = log10(data_cleaned$sma)
data_cleaned$logVol = log10(data_cleaned$Volume)

sum(!is.finite(data_cleaned$logVol))
data_cleaned <- data_cleaned[!is.na(data_cleaned$logVol) & !is.nan(data_cleaned$logVol) & !is.infinite(data_cleaned$logVol), ]
sum(!is.finite(data_cleaned$logVol))

sum(!is.finite(data_cleaned$logSMA))
data_cleaned <- data_cleaned[!is.na(data_cleaned$logSMA) & !is.nan(data_cleaned$logSMA) & !is.infinite(data_cleaned$logSMA), ]
sum(!is.finite(data_cleaned$logSMA))

ggplot(data = data_cleaned, aes(x = log10(sma), y = log10(Volume))) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +  # Add trend line
  labs(
    title = "Log-transformed Scatterplot of 20-day SMA vs. Volume",
    x = "Log10 of 20-day SMA",
    y = "Log10 of Volume"
  ) +
  theme_minimal()

cor_raw <- cor(data_cleaned$sma, data_cleaned$Volume, use = "complete.obs")
cat("Correlation between SMA20 and Volume:", cor_raw, "\n")

# Calculate correlation after log transformation
cor_log <- cor(log10(data_cleaned$sma), log10(data_cleaned$Volume + 1), use = "complete.obs")
cat("Correlation after log transformation:", cor_log, "\n")
