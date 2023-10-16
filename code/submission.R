library(Mcomp)  # Load the library
library(ggplot2)

monthly_ts_list <- subset(M3, "monthly")  # Filter the monthly time series.
# This provides a list of monthly time series. Access the i-th time series with monthly_ts_list[[i]].
# The following uses the first time series as an example. For your project, choose a time series that interests you.
monthly_ts_list[[1]]  # Access the first time series object (it's a list).
monthly_ts_list[[1]]$x  # Training set of the first time series.
monthly_ts_list[[1]]$xx  # Test set of the first time series.
quarterly_ts_list <- subset(M3, "quarterly")  # Retrieve the list of quarterly time series.
yearly_ts_list <- subset(M3, "yearly")  # Retrieve the list of yearly time series.

chosen_ts <- monthly_ts_list[[1]]$x

autoplot(chosen_ts) + ggtitle("Time Series Plot") + xlab("Time") + ylab("Value")

acf(chosen_ts)
