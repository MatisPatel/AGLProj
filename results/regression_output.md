# Beta‑Regression Model Selection Report

*Generated on: 2025‑07‑23 13:05 *

## Candidate models

We fit eight nested or semi‑nested models, progressively adding interaction terms and/or a quadratic effect of `inputsize`.

Fitting the following models for model selection (with logit links)…

 M0: Brier_Skill_Score ~ recurrence + laminations + inputsize + grammartype +     neurons + layers

M1: Brier_Skill_Score ~ recurrence + laminations + inputsize + grammartype +     neurons + layers | recurrence + laminations + inputsize +     grammartype + neurons + layers

M2: Brier_Skill_Score ~ recurrence * grammartype + recurrence + laminations +     inputsize + grammartype + neurons + layers | recurrence +     laminations + inputsize + grammartype + neurons + layers

M3: Brier_Skill_Score ~ laminations * grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     recurrence + laminations + inputsize + grammartype + neurons +         layers

M4: Brier_Skill_Score ~ recurrence + laminations + poly(inputsize,     2) + grammartype + neurons + layers | recurrence + laminations +     inputsize + grammartype + neurons + layers

M5: Brier_Skill_Score ~ recurrence * laminations + recurrence + laminations +     inputsize + grammartype + neurons + layers | recurrence +     laminations + inputsize + grammartype + neurons + layers

M6: Brier_Skill_Score ~ recurrence * grammartype + laminations *     grammartype + recurrence + laminations + inputsize + grammartype +     neurons + layers | recurrence + laminations + inputsize +     grammartype + neurons + layers

M7: Brier_Skill_Score ~ recurrence * grammartype + laminations *     grammartype + recurrence + laminations + poly(inputsize,     2) + grammartype + neurons + layers | recurrence + laminations +     inputsize + grammartype + neurons + layers 
<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Fit statistics for all candidate models</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Model </th>
   <th style="text-align:right;"> logLik </th>
   <th style="text-align:right;"> df.residual </th>
   <th style="text-align:right;"> AIC </th>
   <th style="text-align:right;"> BIC </th>
   <th style="text-align:right;"> pseudo.r.squared </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> M0 </td>
   <td style="text-align:right;"> 805427.6 </td>
   <td style="text-align:right;"> 500946 </td>
   <td style="text-align:right;"> -1610827 </td>
   <td style="text-align:right;"> -1610672 </td>
   <td style="text-align:right;"> 0.259 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 </td>
   <td style="text-align:right;"> 843932.3 </td>
   <td style="text-align:right;"> 500934 </td>
   <td style="text-align:right;"> -1687813 </td>
   <td style="text-align:right;"> -1687523 </td>
   <td style="text-align:right;"> 0.131 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M2 </td>
   <td style="text-align:right;"> 847684.5 </td>
   <td style="text-align:right;"> 500922 </td>
   <td style="text-align:right;"> -1695293 </td>
   <td style="text-align:right;"> -1694870 </td>
   <td style="text-align:right;"> 0.134 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M3 </td>
   <td style="text-align:right;"> 844033.4 </td>
   <td style="text-align:right;"> 500928 </td>
   <td style="text-align:right;"> -1688003 </td>
   <td style="text-align:right;"> -1687647 </td>
   <td style="text-align:right;"> 0.131 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M4 </td>
   <td style="text-align:right;"> 869374.9 </td>
   <td style="text-align:right;"> 500933 </td>
   <td style="text-align:right;"> -1738696 </td>
   <td style="text-align:right;"> -1738395 </td>
   <td style="text-align:right;"> 0.168 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M5 </td>
   <td style="text-align:right;"> 844065.0 </td>
   <td style="text-align:right;"> 500932 </td>
   <td style="text-align:right;"> -1688074 </td>
   <td style="text-align:right;"> -1687763 </td>
   <td style="text-align:right;"> 0.131 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M6 </td>
   <td style="text-align:right;"> 847804.2 </td>
   <td style="text-align:right;"> 500916 </td>
   <td style="text-align:right;"> -1695520 </td>
   <td style="text-align:right;"> -1695031 </td>
   <td style="text-align:right;"> 0.134 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 </td>
   <td style="text-align:right;"> 872829.1 </td>
   <td style="text-align:right;"> 500915 </td>
   <td style="text-align:right;"> -1745568 </td>
   <td style="text-align:right;"> -1745068 </td>
   <td style="text-align:right;"> 0.172 </td>
  </tr>
</tbody>
</table>

## Likelihood Ratios between nested models

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Stepwise Likelihood Ratios (Wilks Tests)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Comparison </th>
   <th style="text-align:right;"> Δdf </th>
   <th style="text-align:right;"> Δloglik </th>
   <th style="text-align:right;"> Chisq </th>
   <th style="text-align:right;"> p‑value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> M0 vs. M1 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 38504.6401 </td>
   <td style="text-align:right;"> 77009.2802 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M0 vs. M2 </td>
   <td style="text-align:right;"> 24 </td>
   <td style="text-align:right;"> 42256.8413 </td>
   <td style="text-align:right;"> 84513.6827 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M0 vs. M3 </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 38605.7754 </td>
   <td style="text-align:right;"> 77211.5508 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M0 vs. M4 </td>
   <td style="text-align:right;"> 13 </td>
   <td style="text-align:right;"> 63947.2526 </td>
   <td style="text-align:right;"> 127894.5051 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M0 vs. M5 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 38637.3897 </td>
   <td style="text-align:right;"> 77274.7794 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M0 vs. M6 </td>
   <td style="text-align:right;"> 30 </td>
   <td style="text-align:right;"> 42376.5427 </td>
   <td style="text-align:right;"> 84753.0855 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M0 vs. M7 </td>
   <td style="text-align:right;"> 31 </td>
   <td style="text-align:right;"> 67401.4630 </td>
   <td style="text-align:right;"> 134802.9260 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M2 </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 3752.2012 </td>
   <td style="text-align:right;"> 7504.4025 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M3 </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 101.1353 </td>
   <td style="text-align:right;"> 202.2707 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M4 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 25442.6125 </td>
   <td style="text-align:right;"> 50885.2249 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M5 </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 132.7496 </td>
   <td style="text-align:right;"> 265.4993 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M6 </td>
   <td style="text-align:right;"> 18 </td>
   <td style="text-align:right;"> 3871.9027 </td>
   <td style="text-align:right;"> 7743.8053 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M7 </td>
   <td style="text-align:right;"> 19 </td>
   <td style="text-align:right;"> 28896.8229 </td>
   <td style="text-align:right;"> 57793.6458 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M6 vs. M7 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 25024.9202 </td>
   <td style="text-align:right;"> 50049.8405 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table>

**Model M7** has the lowest AIC/BIC overall, so we
 treat it as the *current best* specification:

Brier_Skill_Score ~ recurrence * grammartype + laminations *      grammartype + recurrence + laminations + poly(inputsize,      2) + grammartype + neurons + layers | recurrence + laminations +      inputsize + grammartype + neurons + layers
Now let's check if the link function is appropriate. 
 Cribari-Neto and Lima (2007; A Misspecification Test for Beta Regressions)  suggest that loglog link can be better for handling extreme values close to 0 or 1, which we have in this data.<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Link‑function comparison for M7</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Model </th>
   <th style="text-align:left;"> Link </th>
   <th style="text-align:right;"> logLik </th>
   <th style="text-align:right;"> AIC </th>
   <th style="text-align:right;"> BIC </th>
   <th style="text-align:right;"> pseudo.r.squared </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> M7 </td>
   <td style="text-align:left;"> logit </td>
   <td style="text-align:right;"> 872829.1 </td>
   <td style="text-align:right;"> -1745568 </td>
   <td style="text-align:right;"> -1745068 </td>
   <td style="text-align:right;"> 0.172 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 </td>
   <td style="text-align:left;"> loglog </td>
   <td style="text-align:right;"> 872419.5 </td>
   <td style="text-align:right;"> -1744749 </td>
   <td style="text-align:right;"> -1744248 </td>
   <td style="text-align:right;"> 0.169 </td>
  </tr>
</tbody>
</table>

The logit link appears to allow for a better fit, both on AIC/BIC and R^2.
### Dispersion (phi-model) Tests

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Dispersion vs equi‑dispersion</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Model </th>
   <th style="text-align:right;"> logLik </th>
   <th style="text-align:right;"> AIC </th>
   <th style="text-align:right;"> BIC </th>
   <th style="text-align:right;"> pseudo.r.squared </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> M7 (dispersion φ sub-model) </td>
   <td style="text-align:right;"> 872829.1 </td>
   <td style="text-align:right;"> -1745568 </td>
   <td style="text-align:right;"> -1745068 </td>
   <td style="text-align:right;"> 0.172 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 (φ constant) </td>
   <td style="text-align:right;"> 826369.5 </td>
   <td style="text-align:right;"> -1652673 </td>
   <td style="text-align:right;"> -1652306 </td>
   <td style="text-align:right;"> 0.317 </td>
  </tr>
</tbody>
</table>

While the pseudo-R^2 is much higher without modelling phi, the AIC/BIC is improved. We can use a likelihood-ratio test to confirm.
A likelihood‑ratio test confirms the dispersion sub‑model is warranted (higher log-likelihood):

```Likelihood ratio test

Model 1: Brier_Skill_Score ~ recurrence * grammartype + laminations * 
    grammartype + poly(inputsize, 2) + recurrence + laminations + 
    grammartype + neurons + layers
Model 2: Brier_Skill_Score ~ recurrence * grammartype + laminations * 
    grammartype + recurrence + laminations + poly(inputsize, 
    2) + grammartype + neurons + layers | recurrence + laminations + 
    inputsize + grammartype + neurons + layers
  #Df LogLik Df Chisq Pr(>Chisq)    
1  33 826369                        
2  45 872829 12 92919  < 2.2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```

Let's check whether including interaction terms in the phi model improves fit:

Fitting the following models for model selection (with logit links)...

 M7a: Brier_Skill_Score ~ recurrence * grammartype + laminations *     grammartype + poly(inputsize, 2) + recurrence + laminations +     grammartype + neurons + layers | recurrence * grammartype +     recurrence + laminations + inputsize + grammartype + neurons +     layers

M7b: Brier_Skill_Score ~ recurrence * grammartype + laminations *     grammartype + poly(inputsize, 2) + recurrence + laminations +     grammartype + neurons + layers | laminations * grammartype +     recurrence + laminations + inputsize + grammartype + neurons +     layers

M7c: Brier_Skill_Score ~ recurrence * grammartype + laminations *     grammartype + poly(inputsize, 2) + recurrence + laminations +     grammartype + neurons + layers | recurrence + laminations +     poly(inputsize, 2) + grammartype + neurons + layers

M7d: Brier_Skill_Score ~ recurrence * grammartype + laminations *     grammartype + poly(inputsize, 2) + recurrence + laminations +     grammartype + neurons + layers | recurrence * grammartype +     laminations * grammartype + recurrence + laminations + inputsize +     grammartype + neurons + layers

M7e: Brier_Skill_Score ~ recurrence * grammartype + laminations *     grammartype + poly(inputsize, 2) + recurrence + laminations +     grammartype + neurons + layers | recurrence * grammartype +     laminations * grammartype + recurrence + laminations + poly(inputsize,     2) + grammartype + neurons + layers 
<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Fit statistics for all candidate models</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Model </th>
   <th style="text-align:right;"> logLik </th>
   <th style="text-align:right;"> df.residual </th>
   <th style="text-align:right;"> AIC </th>
   <th style="text-align:right;"> BIC </th>
   <th style="text-align:right;"> pseudo.r.squared </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> M7a </td>
   <td style="text-align:right;"> 877214.3 </td>
   <td style="text-align:right;"> 500903 </td>
   <td style="text-align:right;"> -1754315 </td>
   <td style="text-align:right;"> -1753680 </td>
   <td style="text-align:right;"> 0.177 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7b </td>
   <td style="text-align:right;"> 872849.1 </td>
   <td style="text-align:right;"> 500909 </td>
   <td style="text-align:right;"> -1745596 </td>
   <td style="text-align:right;"> -1745029 </td>
   <td style="text-align:right;"> 0.172 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7c </td>
   <td style="text-align:right;"> 881318.9 </td>
   <td style="text-align:right;"> 500914 </td>
   <td style="text-align:right;"> -1762546 </td>
   <td style="text-align:right;"> -1762034 </td>
   <td style="text-align:right;"> 0.160 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7d </td>
   <td style="text-align:right;"> 877242.9 </td>
   <td style="text-align:right;"> 500897 </td>
   <td style="text-align:right;"> -1754360 </td>
   <td style="text-align:right;"> -1753659 </td>
   <td style="text-align:right;"> 0.177 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7e </td>
   <td style="text-align:right;"> 885272.5 </td>
   <td style="text-align:right;"> 500896 </td>
   <td style="text-align:right;"> -1770417 </td>
   <td style="text-align:right;"> -1769705 </td>
   <td style="text-align:right;"> 0.166 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 </td>
   <td style="text-align:right;"> 872829.1 </td>
   <td style="text-align:right;"> 500915 </td>
   <td style="text-align:right;"> -1745568 </td>
   <td style="text-align:right;"> -1745068 </td>
   <td style="text-align:right;"> 0.172 </td>
  </tr>
</tbody>
</table>
M7e is much improved on AIC/BIC. The higher R^2 on the other models may indicate overfitting with no predictive gain. Hence, we proceed with M7e as the best model specification.


### Residual fan plots  
*(Plot saved separately as PNG file: `plots/resid_dispersion.png`

There is still heteroskedasticity in the model, as indicated by the fan shape of the residuals. This should be noted, but also beta regression doesn't have well-defined residual checks.


## Five‑fold cross‑validation (RMSE in Brier Skill Score units)

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> Fold </th>
   <th style="text-align:right;"> RMSE </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.3849446 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.3884009 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.3880148 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.3857730 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 0.3844355 </td>
  </tr>
</tbody>
</table>

Mean RMSE:** 0.3863 **


# Final model
 M7e with dispersion modelling with interactions and logit link

```
Call:
betareg::betareg(formula = .x, data = df, link = "logit")

Quantile residuals:
    Min      1Q  Median      3Q     Max 
-5.0826 -0.6252  0.1354  0.7442  4.3539 

Coefficients (mean model with logit link):
                                       Estimate Std. Error  z value Pr(>|z|)    
(Intercept)                           3.242e+00  2.300e-02  140.987  < 2e-16 ***
recurrenceRNN                        -5.740e-01  2.226e-02  -25.779  < 2e-16 ***
recurrenceGRU                        -2.812e-01  2.218e-02  -12.679  < 2e-16 ***
grammartypeLT                        -1.193e+00  2.756e-02  -43.294  < 2e-16 ***
grammartypeLTT                       -1.198e+00  2.610e-02  -45.891  < 2e-16 ***
grammartypeLTTO                      -8.396e-01  2.728e-02  -30.779  < 2e-16 ***
grammartypeMSO                       -9.142e-01  2.616e-02  -34.952  < 2e-16 ***
grammartypeCS                        -6.870e-01  2.273e-02  -30.225  < 2e-16 ***
grammartypeCF                        -2.422e-01  2.298e-02  -10.539  < 2e-16 ***
laminationsLaminated                 -7.114e-02  9.774e-03   -7.279 3.37e-13 ***
poly(inputsize, 2)1                   6.061e+01  9.253e-01   65.504  < 2e-16 ***
poly(inputsize, 2)2                  -2.123e+02  8.387e-01 -253.174  < 2e-16 ***
neurons                               9.324e-04  8.987e-06  103.753  < 2e-16 ***
layers                               -5.820e-02  2.521e-03  -23.091  < 2e-16 ***
recurrenceRNN:grammartypeLT           2.563e-01  2.820e-02    9.086  < 2e-16 ***
recurrenceGRU:grammartypeLT           4.118e-01  2.804e-02   14.686  < 2e-16 ***
recurrenceRNN:grammartypeLTT          3.761e-01  2.667e-02   14.099  < 2e-16 ***
recurrenceGRU:grammartypeLTT          4.768e-01  2.650e-02   17.994  < 2e-16 ***
recurrenceRNN:grammartypeLTTO         1.862e-01  2.786e-02    6.683 2.34e-11 ***
recurrenceGRU:grammartypeLTTO         1.659e-01  2.765e-02    6.000 1.97e-09 ***
recurrenceRNN:grammartypeMSO         -2.256e-01  2.645e-02   -8.528  < 2e-16 ***
recurrenceGRU:grammartypeMSO         -2.269e-01  2.630e-02   -8.627  < 2e-16 ***
recurrenceRNN:grammartypeCS           4.481e-01  2.285e-02   19.613  < 2e-16 ***
recurrenceGRU:grammartypeCS           6.938e-01  2.276e-02   30.477  < 2e-16 ***
recurrenceRNN:grammartypeCF          -1.982e-01  2.307e-02   -8.593  < 2e-16 ***
recurrenceGRU:grammartypeCF          -7.805e-02  2.298e-02   -3.396 0.000683 ***
grammartypeLT:laminationsLaminated    4.853e-02  1.322e-02    3.672 0.000241 ***
grammartypeLTT:laminationsLaminated   2.118e-02  1.257e-02    1.684 0.092103 .  
grammartypeLTTO:laminationsLaminated  3.030e-02  1.287e-02    2.353 0.018612 *  
grammartypeMSO:laminationsLaminated  -5.002e-04  1.178e-02   -0.042 0.966127    
grammartypeCS:laminationsLaminated   -6.102e-02  1.021e-02   -5.976 2.29e-09 ***
grammartypeCF:laminationsLaminated   -1.896e-02  1.020e-02   -1.859 0.063080 .  

Phi coefficients (precision model with log link):
                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)           1.222e+00  1.764e-02  69.270  < 2e-16 ***
recurrenceRNN        -4.386e-01  1.048e-02 -41.859  < 2e-16 ***
recurrenceGRU         4.641e-02  1.048e-02   4.427 9.54e-06 ***
laminationsLaminated -2.822e-02  4.245e-03  -6.649 2.96e-11 ***
inputsize             7.039e-02  6.029e-04 116.753  < 2e-16 ***
grammartypeLT         6.736e-01  1.224e-02  55.054  < 2e-16 ***
grammartypeLTT        1.081e+00  1.216e-02  88.844  < 2e-16 ***
grammartypeLTTO       9.882e-01  1.226e-02  80.637  < 2e-16 ***
grammartypeMSO        2.026e-01  1.077e-02  18.823  < 2e-16 ***
grammartypeCS         1.480e+00  9.946e-03 148.748  < 2e-16 ***
grammartypeCF         1.406e+00  9.920e-03 141.735  < 2e-16 ***
neurons               7.715e-04  1.404e-05  54.954  < 2e-16 ***
layers               -8.478e-02  4.006e-03 -21.163  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

Type of estimator: ML (maximum likelihood)
Log-likelihood: 8.728e+05 on 45 Df
Pseudo R-squared: 0.1721
Number of iterations: 61 (BFGS) + 9 (Fisher scoring) 
```


## Estimated marginal means (EMMs)

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Recurrence × grammar‑type EMMs</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> recurrence </th>
   <th style="text-align:left;"> grammartype </th>
   <th style="text-align:right;"> emmean </th>
   <th style="text-align:right;"> SE </th>
   <th style="text-align:right;"> df </th>
   <th style="text-align:right;"> asymp.LCL </th>
   <th style="text-align:right;"> asymp.UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9639467 </td>
   <td style="text-align:right;"> 0.00122892 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9615380 </td>
   <td style="text-align:right;"> 0.9663553 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9613784 </td>
   <td style="text-align:right;"> 0.00047411 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9604491 </td>
   <td style="text-align:right;"> 0.9623076 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9780942 </td>
   <td style="text-align:right;"> 0.00025416 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9775961 </td>
   <td style="text-align:right;"> 0.9785924 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9360647 </td>
   <td style="text-align:right;"> 0.00127076 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9335740 </td>
   <td style="text-align:right;"> 0.9385553 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9058797 </td>
   <td style="text-align:right;"> 0.00071732 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9044738 </td>
   <td style="text-align:right;"> 0.9072856 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9395411 </td>
   <td style="text-align:right;"> 0.00045969 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9386401 </td>
   <td style="text-align:right;"> 0.9404421 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9398052 </td>
   <td style="text-align:right;"> 0.00087535 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9380895 </td>
   <td style="text-align:right;"> 0.9415208 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9074173 </td>
   <td style="text-align:right;"> 0.00065084 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9061417 </td>
   <td style="text-align:right;"> 0.9086929 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9443502 </td>
   <td style="text-align:right;"> 0.00034256 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9436788 </td>
   <td style="text-align:right;"> 0.9450216 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9541753 </td>
   <td style="text-align:right;"> 0.00090245 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9524065 </td>
   <td style="text-align:right;"> 0.9559441 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9211618 </td>
   <td style="text-align:right;"> 0.00061717 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9199521 </td>
   <td style="text-align:right;"> 0.9223714 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9455730 </td>
   <td style="text-align:right;"> 0.00037023 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9448473 </td>
   <td style="text-align:right;"> 0.9462986 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9682684 </td>
   <td style="text-align:right;"> 0.00029069 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9676987 </td>
   <td style="text-align:right;"> 0.9688382 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9003378 </td>
   <td style="text-align:right;"> 0.00057522 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8992104 </td>
   <td style="text-align:right;"> 0.9014652 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9217248 </td>
   <td style="text-align:right;"> 0.00047697 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9207900 </td>
   <td style="text-align:right;"> 0.9226597 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9620715 </td>
   <td style="text-align:right;"> 0.00028654 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9615099 </td>
   <td style="text-align:right;"> 0.9626331 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9525127 </td>
   <td style="text-align:right;"> 0.00017547 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9521688 </td>
   <td style="text-align:right;"> 0.9528566 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9747797 </td>
   <td style="text-align:right;"> 0.00009509 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9745933 </td>
   <td style="text-align:right;"> 0.9749661 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9756762 </td>
   <td style="text-align:right;"> 0.00022755 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9752302 </td>
   <td style="text-align:right;"> 0.9761222 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9349589 </td>
   <td style="text-align:right;"> 0.00023728 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9344939 </td>
   <td style="text-align:right;"> 0.9354240 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9644615 </td>
   <td style="text-align:right;"> 0.00011530 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9642355 </td>
   <td style="text-align:right;"> 0.9646875 </td>
  </tr>
</tbody>
</table>

### Pairwise contrasts (recurrence within each grammar)  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> contrast </th>
   <th style="text-align:left;"> grammartype </th>
   <th style="text-align:right;"> estimate </th>
   <th style="text-align:right;"> SE </th>
   <th style="text-align:right;"> df </th>
   <th style="text-align:right;"> z.ratio </th>
   <th style="text-align:right;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.00256830 </td>
   <td style="text-align:right;"> 0.00131078 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.959375 </td>
   <td style="text-align:right;"> 0.12241971 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.01414756 </td>
   <td style="text-align:right;"> 0.00125104 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.308606 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.01671586 </td>
   <td style="text-align:right;"> 0.00053343 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -31.336327 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.03018500 </td>
   <td style="text-align:right;"> 0.00143771 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 20.995146 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.00347644 </td>
   <td style="text-align:right;"> 0.00133565 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.602809 </td>
   <td style="text-align:right;"> 0.02506639 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.03366144 </td>
   <td style="text-align:right;"> 0.00083702 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -40.215916 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.03238790 </td>
   <td style="text-align:right;"> 0.00106427 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 30.432058 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.00454504 </td>
   <td style="text-align:right;"> 0.00092044 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -4.937892 </td>
   <td style="text-align:right;"> 0.00000236 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.03693295 </td>
   <td style="text-align:right;"> 0.00072006 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -51.291374 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.03301354 </td>
   <td style="text-align:right;"> 0.00107538 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 30.699302 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.00860236 </td>
   <td style="text-align:right;"> 0.00096109 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 8.950603 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.02441118 </td>
   <td style="text-align:right;"> 0.00070606 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -34.573895 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.06793058 </td>
   <td style="text-align:right;"> 0.00061855 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 109.822770 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.04654361 </td>
   <td style="text-align:right;"> 0.00053423 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 87.122133 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.02138696 </td>
   <td style="text-align:right;"> 0.00072382 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -29.547286 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.00955877 </td>
   <td style="text-align:right;"> 0.00030459 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 31.382315 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.01270822 </td>
   <td style="text-align:right;"> 0.00028291 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -44.920355 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.02226699 </td>
   <td style="text-align:right;"> 0.00018412 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -120.938447 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.04071721 </td>
   <td style="text-align:right;"> 0.00030100 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 135.273108 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.01121466 </td>
   <td style="text-align:right;"> 0.00023462 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 47.798841 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.02950255 </td>
   <td style="text-align:right;"> 0.00024230 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -121.759083 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

### Pairwise contrasts (grammar within each recurrence)  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> contrast </th>
   <th style="text-align:left;"> recurrence </th>
   <th style="text-align:right;"> estimate </th>
   <th style="text-align:right;"> SE </th>
   <th style="text-align:right;"> df </th>
   <th style="text-align:right;"> z.ratio </th>
   <th style="text-align:right;"> p.value </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.02788198 </td>
   <td style="text-align:right;"> 0.00174655 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 15.963988 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.02414148 </td>
   <td style="text-align:right;"> 0.00148525 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 16.254131 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.00977133 </td>
   <td style="text-align:right;"> 0.00150670 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.485235 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.00432177 </td>
   <td style="text-align:right;"> 0.00124760 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -3.464068 </td>
   <td style="text-align:right;"> 0.00959284 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.00187519 </td>
   <td style="text-align:right;"> 0.00124376 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.507675 </td>
   <td style="text-align:right;"> 0.74038197 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.01172951 </td>
   <td style="text-align:right;"> 0.00123792 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.475142 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.00374050 </td>
   <td style="text-align:right;"> 0.00150313 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.488476 </td>
   <td style="text-align:right;"> 0.16332374 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.01811065 </td>
   <td style="text-align:right;"> 0.00152814 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.851457 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.03220375 </td>
   <td style="text-align:right;"> 0.00127803 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -25.197978 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.02600679 </td>
   <td style="text-align:right;"> 0.00127224 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -20.441749 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.03961148 </td>
   <td style="text-align:right;"> 0.00127106 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -31.164066 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.01437015 </td>
   <td style="text-align:right;"> 0.00122139 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.765430 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.02846325 </td>
   <td style="text-align:right;"> 0.00088792 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -32.056187 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.02226630 </td>
   <td style="text-align:right;"> 0.00087995 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -25.304043 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.03587099 </td>
   <td style="text-align:right;"> 0.00087739 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -40.883637 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.01409310 </td>
   <td style="text-align:right;"> 0.00092235 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -15.279525 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.00789615 </td>
   <td style="text-align:right;"> 0.00091613 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.618985 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.02150084 </td>
   <td style="text-align:right;"> 0.00091046 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -23.615299 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.00619696 </td>
   <td style="text-align:right;"> 0.00035561 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 17.426092 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.00740773 </td>
   <td style="text-align:right;"> 0.00033188 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -22.320450 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.01360469 </td>
   <td style="text-align:right;"> 0.00032070 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -42.422308 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.05549867 </td>
   <td style="text-align:right;"> 0.00084928 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 65.347796 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.05396108 </td>
   <td style="text-align:right;"> 0.00079427 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 67.938281 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.04021657 </td>
   <td style="text-align:right;"> 0.00076829 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 52.345521 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.06104050 </td>
   <td style="text-align:right;"> 0.00073240 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 83.343691 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.00886565 </td>
   <td style="text-align:right;"> 0.00049598 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 17.874874 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.02641940 </td>
   <td style="text-align:right;"> 0.00051799 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 51.004177 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.00153759 </td>
   <td style="text-align:right;"> 0.00094951 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.619348 </td>
   <td style="text-align:right;"> 0.66978699 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.01528210 </td>
   <td style="text-align:right;"> 0.00092914 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -16.447506 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.00554183 </td>
   <td style="text-align:right;"> 0.00089746 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.175028 </td>
   <td style="text-align:right;"> 0.00000001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.04663302 </td>
   <td style="text-align:right;"> 0.00072476 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -64.342618 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.02907927 </td>
   <td style="text-align:right;"> 0.00073764 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -39.422036 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.01374451 </td>
   <td style="text-align:right;"> 0.00087933 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -15.630727 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.00707942 </td>
   <td style="text-align:right;"> 0.00084592 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 8.368902 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.04509543 </td>
   <td style="text-align:right;"> 0.00065943 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -68.385959 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.02754168 </td>
   <td style="text-align:right;"> 0.00067369 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -40.881929 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.02082393 </td>
   <td style="text-align:right;"> 0.00082316 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 25.297596 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.03135092 </td>
   <td style="text-align:right;"> 0.00062811 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -49.912758 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.01379717 </td>
   <td style="text-align:right;"> 0.00064368 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -21.434694 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.05217486 </td>
   <td style="text-align:right;"> 0.00058340 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -89.432393 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.03462110 </td>
   <td style="text-align:right;"> 0.00059897 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -57.801361 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.01755375 </td>
   <td style="text-align:right;"> 0.00026979 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 65.064155 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.03855309 </td>
   <td style="text-align:right;"> 0.00051888 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 74.300339 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.03374400 </td>
   <td style="text-align:right;"> 0.00041933 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 80.471067 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.03252125 </td>
   <td style="text-align:right;"> 0.00044232 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 73.523494 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.05636940 </td>
   <td style="text-align:right;"> 0.00053245 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 105.867102 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.00331452 </td>
   <td style="text-align:right;"> 0.00026590 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 12.465411 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.01363271 </td>
   <td style="text-align:right;"> 0.00027175 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 50.166458 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.00480910 </td>
   <td style="text-align:right;"> 0.00055968 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.592511 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.00603184 </td>
   <td style="text-align:right;"> 0.00057724 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -10.449510 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.01781631 </td>
   <td style="text-align:right;"> 0.00064591 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 27.583273 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.03523857 </td>
   <td style="text-align:right;"> 0.00046145 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -76.364427 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.02492038 </td>
   <td style="text-align:right;"> 0.00046303 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -53.820406 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.00122275 </td>
   <td style="text-align:right;"> 0.00049041 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.493309 </td>
   <td style="text-align:right;"> 0.16154687 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.02262541 </td>
   <td style="text-align:right;"> 0.00057016 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 39.682557 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.03042948 </td>
   <td style="text-align:right;"> 0.00034581 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -87.994320 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.02011128 </td>
   <td style="text-align:right;"> 0.00034824 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -57.750422 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.02384815 </td>
   <td style="text-align:right;"> 0.00058745 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 40.596241 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.02920673 </td>
   <td style="text-align:right;"> 0.00037338 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -78.222220 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.01888854 </td>
   <td style="text-align:right;"> 0.00037569 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -50.277044 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.05305488 </td>
   <td style="text-align:right;"> 0.00047648 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -111.347932 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.04273669 </td>
   <td style="text-align:right;"> 0.00047718 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -89.560404 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.01031819 </td>
   <td style="text-align:right;"> 0.00013352 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 77.280767 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

## Continuous predictors

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Predicted mean Brier across input‑size grid</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> inputsize </th>
   <th style="text-align:right;"> emmean </th>
   <th style="text-align:right;"> SE </th>
   <th style="text-align:right;"> df </th>
   <th style="text-align:right;"> asymp.LCL </th>
   <th style="text-align:right;"> asymp.UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.8042554 </td>
   <td style="text-align:right;"> 0.00066710 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8029479 </td>
   <td style="text-align:right;"> 0.8055629 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.8631626 </td>
   <td style="text-align:right;"> 0.00041992 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8623396 </td>
   <td style="text-align:right;"> 0.8639856 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.8999639 </td>
   <td style="text-align:right;"> 0.00029374 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8993881 </td>
   <td style="text-align:right;"> 0.9005396 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 0.9224767 </td>
   <td style="text-align:right;"> 0.00023177 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9220224 </td>
   <td style="text-align:right;"> 0.9229309 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:right;"> 0.9358194 </td>
   <td style="text-align:right;"> 0.00019939 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9354286 </td>
   <td style="text-align:right;"> 0.9362102 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 0.9429949 </td>
   <td style="text-align:right;"> 0.00018107 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9426400 </td>
   <td style="text-align:right;"> 0.9433498 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 0.9455641 </td>
   <td style="text-align:right;"> 0.00017079 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9452294 </td>
   <td style="text-align:right;"> 0.9458989 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 0.9440713 </td>
   <td style="text-align:right;"> 0.00016639 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9437452 </td>
   <td style="text-align:right;"> 0.9443974 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 0.9382013 </td>
   <td style="text-align:right;"> 0.00016829 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9378715 </td>
   <td style="text-align:right;"> 0.9385311 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:right;"> 0.9266880 </td>
   <td style="text-align:right;"> 0.00018227 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9263307 </td>
   <td style="text-align:right;"> 0.9270452 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.9069612 </td>
   <td style="text-align:right;"> 0.00022833 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9065137 </td>
   <td style="text-align:right;"> 0.9074087 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 0.8745267 </td>
   <td style="text-align:right;"> 0.00035029 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8738402 </td>
   <td style="text-align:right;"> 0.8752133 </td>
  </tr>
</tbody>
</table>

### Slope of layers

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> 1 </th>
   <th style="text-align:right;"> layers.trend </th>
   <th style="text-align:right;"> SE </th>
   <th style="text-align:right;"> df </th>
   <th style="text-align:right;"> asymp.LCL </th>
   <th style="text-align:right;"> asymp.UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> overall </td>
   <td style="text-align:right;"> -0.00335605 </td>
   <td style="text-align:right;"> 0.0001265 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.00360399 </td>
   <td style="text-align:right;"> -0.00310811 </td>
  </tr>
</tbody>
</table>

### Slope of neurons

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> 1 </th>
   <th style="text-align:right;"> neurons.trend </th>
   <th style="text-align:right;"> SE </th>
   <th style="text-align:right;"> df </th>
   <th style="text-align:right;"> asymp.LCL </th>
   <th style="text-align:right;"> asymp.UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> overall </td>
   <td style="text-align:right;"> 4.503e-05 </td>
   <td style="text-align:right;"> 4.7e-07 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.411e-05 </td>
   <td style="text-align:right;"> 4.595e-05 </td>
  </tr>
</tbody>
</table>



