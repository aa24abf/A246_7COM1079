library(TTR)
data = read.csv("005380.KS.csv") 
data

data$sma = SMA(data$Close, n = 20) # Calculation of 20-Day Simple Moving Average
data$pricevolatility = data$High - data$Low # Caculation of Price Volatility
data

write.csv(data, "Dataset_SMA.csv", row.names = FALSE) # Saving the modified dataset for further Visualisation and Analysis





