library(Mcomp) # loads the library

monthly_ts_list <- subset(M3, 'monthly') # filters the monthly time series.
monthly_ts_list

# for each monthly_ts_list entry print the name, type and index
# for (i in seq_along(monthly_ts_list)) {
  # print(paste(i, monthly_ts_list[[i]]$sn, monthly_ts_list[[i]]$type))
# }

# MICRO: 1 - 474
# INDUSTRY: 475 - 808
# MACRO: 809 - 1120
# FINANCE: 1121 - 1265
# DEMOGRAPHIC: 1266 - 1376
# OTHER: 1377 - 1428

# We choose a time series about finance within the indexes 1121 - 1265
index <- 1123

monthly_ts_list[[index]]
# monthly_ts_list[[1]]$sn # plot the name of the time series

autoplot(monthly_ts_list[[index]])
