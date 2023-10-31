library(fpp2)
library(forecast)
library(Mcomp)

index <- 1123
monthly_ts_list <- subset(M3, 'monthly') # filters the monthly time series.
dataset <- monthly_ts_list[[index]]
train_data <- dataset$x
test_data <- dataset$xx

fitEts <- ets(train_data)
summary(fitEts)
fcEts <- forecast(fitEts, h = 20)

# ets model: ETS(M,A,N): Multiplicative error, Additive trend, No seasonality
# AIC = 1564.055

fitArima <- auto.arima(train_data)
summary(fitArima)
fcArima <- forecast(fitArima, h = 20)

# arima model: ARIMA(0,1,0)(1,0,0)[12] with drift
# AIC = 1311.64

autoplot(train_data) +
  autolayer(fitEts$fitted, series = 'ETS(M,A,N)', color = 'blue') +
  autolayer(fcEts, series = 'ETS(M,A,N)') +
  autolayer(fitArima$fitted, series = 'ARIMA(0,1,0)(1,0,0)[12]', color = 'red') +
  autolayer(fcArima, series = 'ARIMA(0,1,0)(1,0,0)[12]')

acc_ets <- accuracy(fcEts, test_data)
acc_arima <- accuracy(fcArima, test_data)

acc_ets
acc_arima
