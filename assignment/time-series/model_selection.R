library(fpp2)
library(forecast)
library(Mcomp)

index <- 1123
monthly_ts_list <- subset(M3, 'monthly') # filters the monthly time series.
dataset <- monthly_ts_list[[index]]
train_data <- dataset$x
test_data <- dataset$xx

fit_holt_damped <- holt(train_data, damped = TRUE, h = 20)
fit_holt <- holt(train_data, h = 20)
fit_mean <- meanf(train_data, h = 20)
fit_naive <- naive(train_data, h = 20)
fit_seasonal <- snaive(train_data, h = 20)
fit_rw <- rwf(train_data, h = 20)
fit_rwd <- rwf(train_data, drift = TRUE, h = 20)

# test on the test data
acc_holt_damped <- accuracy(fit_holt_damped, test_data)
acc_holt <- accuracy(fit_holt, test_data)
acc_mean <- accuracy(fit_mean ,test_data)
acc_naive <- accuracy(fit_naive, test_data)
acc_seasonal <- accuracy(fit_seasonal, test_data)
acc_rw <- accuracy(fit_rw, test_data)
acc_rwd <- accuracy(fit_rwd, test_data)

time_series_plot <- autoplot(train_data)
fit_holt_damped_plot <- autoplot(fit_holt_damped)

autoplot(fit_holt_damped) + autolayer(fit_holt_damped$fitted, series = "Holt's linear trend (damped)")

summary(fit_holt_damped)

autoplot(test_data)

acc_holt_damped
acc_holt
acc_mean
acc_naive
acc_seasonal
acc_rw
acc_rwd

checkresiduals(fit_holt_damped)

residuals(fit_holt_damped)
