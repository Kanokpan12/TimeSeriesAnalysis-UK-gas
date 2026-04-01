# UK Gas Consumption Time Series Analysis (SARIMA Forecasting)

**Skills:** R, `astsa`, `forecast`, `tseries`, SARIMA modeling, time series decomposition, forecasting  
** The R script for this analysis is available in the repository. Please refer to the separate script file for full details.**

---

## Project Overview

This project demonstrates a **complete time series analysis and forecasting workflow** using historical UK quarterly gas consumption data (1960 Q1 – 1986 Q4). The analysis applies **SARIMA modeling** to capture trend, seasonality, and short-term dynamics, producing accurate multi-quarter forecasts.

The workflow shows **real-world data forecasting processes**, emphasizing model selection, diagnostics, and robust forecasting for decision-making.

---

## Key Steps

### 1. Data Exploration & Preprocessing
- Visualized raw time series: strong **upward trend** and **seasonal pattern** observed.
- Applied **log transformation** to stabilize variance.
- Applied **seasonal differencing (lag=4)** and **first differencing** to achieve stationarity.
- Confirmed stationarity using the **Augmented Dickey-Fuller (ADF) test**.

### 2. Autocorrelation Analysis
- Used **ACF and PACF plots** to assess short-term dependence and guide SARIMA specification.

### 3. Model Selection
- Evaluated five SARIMA model candidates:
  - **SARIMA(0,1,2)(0,1,0)₄** ✅ Best (lowest AIC/BIC, σ², all residual diagnostics passed)
  - **SARIMA(1,1,1)(0,1,0)₄** ✅ Credible alternative
  - SARIMA(0,1,1), SARIMA(2,1,0), SARIMA(1,1,0) – inferior fit
- Compared models using **AIC, AICc, BIC**, and **residual diagnostics**.

### 4. Model Diagnostics
- Residuals checked for **white noise**, **normality**, and absence of autocorrelation.
- SARIMA(0,1,2)(0,1,0)₄ passed all criteria, confirming a robust model fit.

### 5. Forecasting
- Produced **8-quarter ahead forecasts** (1987 Q1 – 1988 Q4) for both top models.
- Forecasts preserved **seasonal patterns** (Q1 peaks, Q3 troughs).
- Forecast uncertainty increased appropriately over longer horizons.
- Maximum difference between top models: <0.015 log units, demonstrating forecast robustness.

---

## Skills Highlighted
- **Time Series Modeling & Forecasting:** SARIMA, differencing, log transformation, seasonal adjustment  
- **R Programming:** `astsa`, `forecast`, `tseries` for analysis, visualization, and diagnostics  
- **Statistical Analysis:** ADF test, ACF/PACF, residual diagnostics, Ljung-Box test  
- **Financial & Energy Forecasting Insight:** Trend + seasonality decomposition, multi-step forecasting, uncertainty evaluation  

---

## Visualization
- **Figure 1:** Raw quarterly gas consumption
  
  <img width="574" height="377" alt="image" src="https://github.com/user-attachments/assets/aae573a5-6f6d-43eb-9661-ce7a4b9746d1" />
 
- **Figure 2:** Data transformations (log, differencing, seasonal adjustments)
  <img width="650" height="438" alt="image" src="https://github.com/user-attachments/assets/10790e8c-6489-42df-a088-18c64df3d1d5" />
  
- **Figure 3:** ACF & PACF for stationary series
  <img width="951" height="267" alt="image" src="https://github.com/user-attachments/assets/29d0b263-96d6-42e9-88c3-9a3f5c71f090" />

- **Figures 4–8:** Model diagnostic plots : example
  <img width="811" height="598" alt="image" src="https://github.com/user-attachments/assets/8b8c4311-e8f6-4d56-9201-0a7a9d87eff5" />

- **Figure 9:** Forecast comparison (SARIMA(0,1,2) vs SARIMA(1,1,1))
  <img width="660" height="319" alt="image" src="https://github.com/user-attachments/assets/0246e50d-37e7-4f6d-8b02-e1749a81a5ed" />

---

## Conclusion
The **SARIMA(0,1,2)(0,1,0)₄** model provides an accurate, well-diagnosed forecast of UK gas consumption and demonstrates expertise in **time series forecasting workflows**.

---
