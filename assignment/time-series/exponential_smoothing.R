library(fpp2)
library(forecast)
library(Mcomp)

index <- 1123
monthly_ts_list <- subset(M3, 'monthly') # filters the monthly time series.
dataset <- monthly_ts_list[[index]]
train_data <- dataset$x
test_data <- dataset$xx

autoplot(train_data)

# Data has the following properties:
# Trend: increasing
# Seasonality: no
# This leads to a (A,N) model: Holt's linear trend with no seasonality

# fit the model
fit_holt <- holt(train_data, h = 20)

# plot the model
autoplot(fit_holt) + autolayer(fit_holt$fitted, series = "Holt's linear trend")

# summary of the model
# summary(fit_holt)

# test on the test data
acc_holt <- accuracy(fit_holt, test_data)

acc_holt

# check residuals
checkresiduals(fit_holt)
