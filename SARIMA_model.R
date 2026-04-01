library(forecast)
library(tseries)
data("UKgas")
# Figure 1: plot the raw data 
plot(UKgas,
     main="Figure 1: UK quarterly gas consumption",
     ylab="Gas consumption (millions of therms)",
     xlab="Year")
# Figure 2: All data transformations
# Log transform and difference the UK gas series
log_gas <- log(UKgas)
diff_log_gas <- diff(log_gas)
diff_seasonal <- diff(log_gas, lag = 4)
diff_both <- diff(diff_seasonal)
# Figure plot
par(mfrow = c(2, 2))
plot(log_gas, main = "Fig 2A: Log-Transformed", ylab = "Log(Gas)")
plot(diff_log_gas, main = "Fig 2B: First Difference of Log", ylab = "Diff Log(Gas)")
plot(diff_seasonal, main = "Fig 2C: Seasonal Diff (lag=4)", ylab = "Seas. Diff Log(Gas)")
plot(diff_both, main = "Fig 2D: Seasonal + First Diff", ylab = "Diff Series")
par(mfrow = c(1, 1))
# ADF Tests
adf.test(diff_seasonal) # Fig 2C: Seasonal differenced
adf.test(diff_both) # Fig 2D: Seasonal + First differenced
# Figure 3: ACF and PACF for 2D data
par(mfrow = c(1, 2))
acf(diff_both, main = "Fig 3A: ACF - Seasonal + First Diff", lag.max = 40)
pacf(diff_both, main = "Fig 3B: PACF - Seasonal + First Diff", lag.max = 40)
par(mfrow = c(1, 1))
library(astsa)
# Fit all 5 candidate models 
m1 <- sarima(log_gas, p=1,d=1,q=1, P=0,D=1,Q=0, S=4)
m2 <- sarima(log_gas, p=1,d=1,q=0, P=0,D=1,Q=0, S=4)
m3 <- sarima(log_gas, p=0,d=1,q=1, P=0,D=1,Q=0, S=4)
m4 <- sarima(log_gas, p=2,d=1,q=0, P=0,D=1,Q=0, S=4)
m5 <- sarima(log_gas, p=0,d=1,q=2, P=0,D=1,Q=0, S=4)
# Summary table
model_names <- c("SARIMA(1,1,1)(0,1,0)4", "SARIMA(1,1,0)(0,1,0)4",
                 "SARIMA(0,1,1)(0,1,0)4", "SARIMA(2,1,0)(0,1,0)4",
                 "SARIMA(0,1,2)(0,1,0)4")
results <- data.frame(
  Model = model_names,
  AIC = c(m1$AIC, m2$AIC, m3$AIC, m4$AIC, m5$AIC),
  AICc = c(m1$AICc, m2$AICc, m3$AICc, m4$AICc, m5$AICc),
  BIC = c(m1$BIC, m2$BIC, m3$BIC, m4$BIC, m5$BIC)
)
results[order(results$AIC), ]

# Run diagnostics for all 5 models (Figure 4-8)
# sarima() automatically produces 4-panel diagnostic plots per model
cat("=== Fig 4A: SARIMA(0,1,2)(0,1,0)4 ===\n")
m5 <- sarima(log_gas, p=0,d=1,q=2, P=0,D=1,Q=0, S=4)
cat("=== Fig 4B: SARIMA(1,1,1)(0,1,0)4 ===\n")
m1 <- sarima(log_gas, p=1,d=1,q=1, P=0,D=1,Q=0, S=4)
cat("=== Fig 4C: SARIMA(0,1,1)(0,1,0)4 ===\n")
m3 <- sarima(log_gas, p=0,d=1,q=1, P=0,D=1,Q=0, S=4)
cat("=== Fig 4D: SARIMA(1,1,0)(0,1,0)4 ===\n")
m2 <- sarima(log_gas, p=1,d=1,q=0, P=0,D=1,Q=0, S=4)
cat("=== Fig 4E: SARIMA(2,1,0)(0,1,0)4 ===\n")
m4 <- sarima(log_gas, p=2,d=1,q=0, P=0,D=1,Q=0, S=4)
# Figure 9: Forecast Comparison
par(mfrow=c(2,1))
sarima.for(log_gas, n.ahead=8,
           p=0,d=1,q=2, P=0,D=1,Q=0, S=4,
           main="Fig 9A: Forecast - SARIMA(0,1,2)(0,1,0)4")
sarima.for(log_gas, n.ahead=8,
           p=1,d=1,q=1, P=0,D=1,Q=0, S=4,
           main="Fig 9B: Forecast - SARIMA(1,1,1)(0,1,0)4")
par(mfrow=c(1,1))
