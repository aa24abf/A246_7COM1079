library(TTR)
data = read.csv("005380.KS.csv")
data

data$sma = SMA(data$Close, n = 20) # Compute 20-period SMA
data$diff = data$High - data$Low # Calculate 'High' - 'Low' and store in 'diff'

data

write.csv(data, "Dataset_SMA.csv", row.names = FALSE) # Save 'data' to 'Dataset_SMA.csv' without row names







