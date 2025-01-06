library(TTR)
data = read.csv("005380.KS.csv")
data

data$sma = SMA(data$Close, n = 20) # Compute 20-period SMA of 'Close' and store it in 'sma' column
data$diff = data$High - data$Low # Compute 'High' - 'Low' and store in 'diff' column
data

write.csv(data, "Dataset_SMA.csv", row.names = FALSE)





