library(fpp2)
library(forecast)
library(Mcomp)

index <- 1123
monthly_ts_list <- subset(M3, 'monthly') # filters the monthly time series.
dataset <- monthly_ts_list[[index]]
time_series <- dataset$x

dataset

time_series

autoplot(dataset)

ggseasonplot(time_series, year.labels = TRUE, year.labels.left = TRUE) +
  ylab("$ million") +
  ggtitle("Commercial paper outstanding, financial companies")

# autoplot(dataset)

# ggAcf(time_series)
