library(fpp2)
library(forecast)
library(Mcomp)
library(tseries)

index <- 1123
monthly_ts_list <- subset(M3, 'monthly') # filters the monthly time series.
dataset <- monthly_ts_list[[index]]
train_data <- dataset$x
test_data <- dataset$xx


adf_result <- adf.test(train_data)
print(adf_result)

fitEts_simple <- ets(diff_train_data, model = "AAN") # Simple Model
fitEts_AAA <- ets(train_data, model = "AAA")  # Additive error, trend, and seasonality
fitEts_MAM <- ets(train_data, model = "MAM")  # Multiplicative error, Additive trend, Multiplicative seasonality

# Choose the model with the best AIC:
best_ets_model <- which.min(c(AIC(fitEts_simple), AIC(fitEts_AAA), AIC(fitEts_MAM)))
ets_models <- list(fitEts_simple, fitEts_AAA, fitEts_MAM)
fitEts <- ets_models[[best_ets_model]]
print(summary(fitEts))

# ets model: ETS(M,A,N): Multiplicative error, Additive trend, No seasonality
# AIC = 1564.055

fitArima <- auto.arima(train_data, max.p = 5, max.q = 5, max.P = 2, max.Q = 2, D = 1)
print(summary(fitArima))

# arima model: ARIMA(0,1,0)(1,0,0)[12] with drift
# AIC = 1311.64

checkresiduals(fitEts)
checkresiduals(fitArima)

fcEts <- forecast(fitEts, h = 20)
fcArima <- forecast(fitArima, h = 20)

acc_ets <- accuracy(fcEts, test_data)
acc_arima <- accuracy(fcArima, test_data)

print(acc_ets)
print(acc_arima)


autoplot(train_data) +
  autolayer(fitEts$fitted, series = 'Refined ETS', color = 'blue') +
  autolayer(fcEts, series = 'Refined ETS Forecast') +
  autolayer(fitArima$fitted, series = 'Refined ARIMA', color = 'red') +
  autolayer(fcArima, series = 'Refined ARIMA Forecast')
