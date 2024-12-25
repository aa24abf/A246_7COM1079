library(TTR)
data = read.csv("005380.KS.csv")
data

data$sma = SMA(data$Close, n = 20)
data$diff = data$High - data$Low
data

write.csv(data, "Dataset_SMA.csv", row.names = FALSE)





