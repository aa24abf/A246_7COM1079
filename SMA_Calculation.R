data = read.csv("005380.KS.csv")
data

x = c()
for (i in 1:length(data$Close)){
  sma = sum(tail(data$Close[0:i+1],20))/20
  x = append(x,sma)
}

data$sma = x
data$diff = data$High - data$Low
data
write.csv(data, "Dataset_SMA.csv", row.names = FALSE)