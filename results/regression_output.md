# Beta‑Regression Model Selection Report

*Generated on: 2025‑07‑30 11:11 *

*Author*: Konstantinos Voudouris

## Main Effects Model Selection

We fit eight nested or semi‑nested models, progressively adding interaction terms and/or a quadratic effect of `inputsize`. We do so for both output variables, Inverse Brier Score and Proportion Correct.
 We assume all main effects are in the phi (variance) sub-model. This is investigated later.

We apply Smithson-Verkuilen shrinkage to any 0s or 1s in the response variable, following standard practice.
 *Note*: We attempted the use of extended beta regressions to handle these responses natively, but they take too long to fit for our very large dataset, due to the inclusion of the nu parameters which also have to be learnt.

We fitted the following models for model selection (with logit links) for Inverse Brier Score...

```
 M1: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     recurrence + laminations + inputsize + grammartype + neurons +         layers

M2: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     inputsize:grammartype + recurrence + laminations + inputsize +     grammartype + neurons + layers | recurrence + laminations +     inputsize + grammartype + neurons + layers

M3: Inverse_Brier_Score ~ recurrence:grammartype + recurrence:laminations +     inputsize:grammartype + recurrence + laminations + inputsize +     grammartype + neurons + layers | recurrence + laminations +     inputsize + grammartype + neurons + layers

M4: Inverse_Brier_Score ~ laminations:grammartype + recurrence:laminations +     inputsize:grammartype + recurrence + laminations + inputsize +     grammartype + neurons + layers | recurrence + laminations +     inputsize + grammartype + neurons + layers

M5: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + recurrence + laminations + inputsize +     grammartype + neurons + layers | recurrence + laminations +     inputsize + grammartype + neurons + layers

M6: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons | recurrence +     laminations + inputsize + grammartype + neurons + layers

M7: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + layers | recurrence +     laminations + inputsize + grammartype + neurons + layers

M8: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype | recurrence + laminations +     inputsize + grammartype + neurons + layers 
```

We fitted the same models for model selection (with logit links) for Proportion Correct...

```
 M1: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     recurrence + laminations + inputsize + grammartype + neurons +         layers

M2: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     inputsize:grammartype + recurrence + laminations + inputsize +     grammartype + neurons + layers | recurrence + laminations +     inputsize + grammartype + neurons + layers

M3: Inverse_Brier_Score ~ recurrence:grammartype + recurrence:laminations +     inputsize:grammartype + recurrence + laminations + inputsize +     grammartype + neurons + layers | recurrence + laminations +     inputsize + grammartype + neurons + layers

M4: Inverse_Brier_Score ~ laminations:grammartype + recurrence:laminations +     inputsize:grammartype + recurrence + laminations + inputsize +     grammartype + neurons + layers | recurrence + laminations +     inputsize + grammartype + neurons + layers

M5: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + recurrence + laminations + inputsize +     grammartype + neurons + layers | recurrence + laminations +     inputsize + grammartype + neurons + layers

M6: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons | recurrence +     laminations + inputsize + grammartype + neurons + layers

M7: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + layers | recurrence +     laminations + inputsize + grammartype + neurons + layers

M8: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype | recurrence + laminations +     inputsize + grammartype + neurons + layers 
```


### Fit statistics


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Fit statistics for all candidate models with Inverse Brier Score</caption>
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
   <td style="text-align:left;"> M1 </td>
   <td style="text-align:right;"> 866892.3 </td>
   <td style="text-align:right;"> 500908 </td>
   <td style="text-align:right;"> -1733681 </td>
   <td style="text-align:right;"> -1733102 </td>
   <td style="text-align:right;"> 0.185 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M2 </td>
   <td style="text-align:right;"> 866753.9 </td>
   <td style="text-align:right;"> 500910 </td>
   <td style="text-align:right;"> -1733408 </td>
   <td style="text-align:right;"> -1732852 </td>
   <td style="text-align:right;"> 0.185 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M3 </td>
   <td style="text-align:right;"> 866763.8 </td>
   <td style="text-align:right;"> 500914 </td>
   <td style="text-align:right;"> -1733436 </td>
   <td style="text-align:right;"> -1732924 </td>
   <td style="text-align:right;"> 0.185 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M4 </td>
   <td style="text-align:right;"> 864159.3 </td>
   <td style="text-align:right;"> 500920 </td>
   <td style="text-align:right;"> -1728239 </td>
   <td style="text-align:right;"> -1727794 </td>
   <td style="text-align:right;"> 0.178 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M5 </td>
   <td style="text-align:right;"> 847963.5 </td>
   <td style="text-align:right;"> 500914 </td>
   <td style="text-align:right;"> -1695835 </td>
   <td style="text-align:right;"> -1695323 </td>
   <td style="text-align:right;"> 0.134 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M6 </td>
   <td style="text-align:right;"> 866509.7 </td>
   <td style="text-align:right;"> 500909 </td>
   <td style="text-align:right;"> -1732917 </td>
   <td style="text-align:right;"> -1732350 </td>
   <td style="text-align:right;"> 0.185 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 </td>
   <td style="text-align:right;"> 861423.9 </td>
   <td style="text-align:right;"> 500909 </td>
   <td style="text-align:right;"> -1722746 </td>
   <td style="text-align:right;"> -1722178 </td>
   <td style="text-align:right;"> 0.177 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M8 </td>
   <td style="text-align:right;"> 861072.0 </td>
   <td style="text-align:right;"> 500910 </td>
   <td style="text-align:right;"> -1722044 </td>
   <td style="text-align:right;"> -1721488 </td>
   <td style="text-align:right;"> 0.176 </td>
  </tr>
</tbody>
</table>


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Fit statistics for all candidate models with Proportion Correct</caption>
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
   <td style="text-align:left;"> M1 </td>
   <td style="text-align:right;"> 1055314 </td>
   <td style="text-align:right;"> 500908 </td>
   <td style="text-align:right;"> -2110523 </td>
   <td style="text-align:right;"> -2109945 </td>
   <td style="text-align:right;"> 0.154 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M2 </td>
   <td style="text-align:right;"> 1055151 </td>
   <td style="text-align:right;"> 500910 </td>
   <td style="text-align:right;"> -2110203 </td>
   <td style="text-align:right;"> -2109646 </td>
   <td style="text-align:right;"> 0.154 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M3 </td>
   <td style="text-align:right;"> 1055156 </td>
   <td style="text-align:right;"> 500914 </td>
   <td style="text-align:right;"> -2110220 </td>
   <td style="text-align:right;"> -2109708 </td>
   <td style="text-align:right;"> 0.154 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M4 </td>
   <td style="text-align:right;"> 1049311 </td>
   <td style="text-align:right;"> 500920 </td>
   <td style="text-align:right;"> -2098542 </td>
   <td style="text-align:right;"> -2098097 </td>
   <td style="text-align:right;"> 0.147 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M5 </td>
   <td style="text-align:right;"> 1034979 </td>
   <td style="text-align:right;"> 500914 </td>
   <td style="text-align:right;"> -2069865 </td>
   <td style="text-align:right;"> -2069354 </td>
   <td style="text-align:right;"> 0.124 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M6 </td>
   <td style="text-align:right;"> 1053821 </td>
   <td style="text-align:right;"> 500909 </td>
   <td style="text-align:right;"> -2107541 </td>
   <td style="text-align:right;"> -2106973 </td>
   <td style="text-align:right;"> 0.154 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 </td>
   <td style="text-align:right;"> 1049946 </td>
   <td style="text-align:right;"> 500909 </td>
   <td style="text-align:right;"> -2099789 </td>
   <td style="text-align:right;"> -2099222 </td>
   <td style="text-align:right;"> 0.150 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M8 </td>
   <td style="text-align:right;"> 1048459 </td>
   <td style="text-align:right;"> 500910 </td>
   <td style="text-align:right;"> -2096817 </td>
   <td style="text-align:right;"> -2096261 </td>
   <td style="text-align:right;"> 0.151 </td>
  </tr>
</tbody>
</table>

### Likelihood Ratios between nested models


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Stepwise Likelihood Ratios (Wilks Tests) on Inverse Brier Score Models</caption>
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
   <td style="text-align:left;"> M1 vs. M2 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -138.4263 </td>
   <td style="text-align:right;"> 276.8526 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M3 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -128.4664 </td>
   <td style="text-align:right;"> 256.9328 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M4 </td>
   <td style="text-align:right;"> -12 </td>
   <td style="text-align:right;"> -2733.0496 </td>
   <td style="text-align:right;"> 5466.0991 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M5 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -18928.7808 </td>
   <td style="text-align:right;"> 37857.5617 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M6 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -382.5655 </td>
   <td style="text-align:right;"> 765.1311 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M7 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -5468.4319 </td>
   <td style="text-align:right;"> 10936.8638 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M8 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -5820.3314 </td>
   <td style="text-align:right;"> 11640.6629 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table>


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Stepwise Likelihood Ratios (Wilks Tests) on Proportion Correct Models</caption>
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
   <td style="text-align:left;"> M1 vs. M2 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -188559.7 </td>
   <td style="text-align:right;"> 377119.3 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M3 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -188549.7 </td>
   <td style="text-align:right;"> 377099.4 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M4 </td>
   <td style="text-align:right;"> -12 </td>
   <td style="text-align:right;"> -191154.3 </td>
   <td style="text-align:right;"> 382308.6 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M5 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -207350.0 </td>
   <td style="text-align:right;"> 414700.0 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M6 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -188803.8 </td>
   <td style="text-align:right;"> 377607.6 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M7 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -193889.7 </td>
   <td style="text-align:right;"> 387779.3 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M8 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -194241.6 </td>
   <td style="text-align:right;"> 388483.1 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table>

### 5-Fold Cross-Validation


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Cross validation RMSEs (lower is better) for all candidate models with Inverse Brier Score</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Fold </th>
   <th style="text-align:right;"> RMSE M1 </th>
   <th style="text-align:right;"> RMSE M2 </th>
   <th style="text-align:right;"> RMSE M3 </th>
   <th style="text-align:right;"> RMSE M4 </th>
   <th style="text-align:right;"> RMSE M5 </th>
   <th style="text-align:right;"> RMSE M6 </th>
   <th style="text-align:right;"> RMSE M7 </th>
   <th style="text-align:right;"> RMSE M8 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.09 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.091 </td>
   <td style="text-align:right;"> 0.091 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.09 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.091 </td>
   <td style="text-align:right;"> 0.091 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.09 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.091 </td>
   <td style="text-align:right;"> 0.091 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.09 </td>
   <td style="text-align:right;"> 0.096 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.090 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.09 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.091 </td>
   <td style="text-align:right;"> 0.091 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mean </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.09 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.091 </td>
   <td style="text-align:right;"> 0.091 </td>
  </tr>
</tbody>
</table>


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Cross validation RMSEs (lower is better) for all candidate models with Proportion Correct</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Fold </th>
   <th style="text-align:right;"> RMSE M1 </th>
   <th style="text-align:right;"> RMSE M2 </th>
   <th style="text-align:right;"> RMSE M3 </th>
   <th style="text-align:right;"> RMSE M4 </th>
   <th style="text-align:right;"> RMSE M5 </th>
   <th style="text-align:right;"> RMSE M6 </th>
   <th style="text-align:right;"> RMSE M7 </th>
   <th style="text-align:right;"> RMSE M8 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.084 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.084 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.091 </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.084 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.084 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.091 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.084 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mean </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.084 </td>
   <td style="text-align:right;"> 0.084 </td>
  </tr>
</tbody>
</table>

### Best Main Effects Model Specification

**Maximal Model (M1)** has the lowest AIC/BIC overall and is the (joint) best performing on cross-validation, so we
 treat it as the *current best* specification:


```
 Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +      recurrence:laminations + inputsize:grammartype + recurrence +      laminations + inputsize + grammartype + neurons + layers |      recurrence + laminations + inputsize + grammartype + neurons +          layers 

 Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +      recurrence:laminations + inputsize:grammartype + recurrence +      laminations + inputsize + grammartype + neurons + layers |      recurrence + laminations + inputsize + grammartype + neurons +          layers 
```


## Link Function Selection
Now let's check if the link function is appropriate. 
 Cribari-Neto and Lima (2007; A Misspecification Test for Beta Regressions)  suggest that loglog link can be better for handling extreme values close to 0 or 1, which we have in this data.<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Link‑function comparison for M1 (Maximal Model)</caption>
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
   <td style="text-align:left;"> M7 (Inverse Brier) </td>
   <td style="text-align:left;"> logit </td>
   <td style="text-align:right;"> 866892.3 </td>
   <td style="text-align:right;"> -1733681 </td>
   <td style="text-align:right;"> -1733102 </td>
   <td style="text-align:right;"> 0.185 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 (Inverse Brier) </td>
   <td style="text-align:left;"> loglog </td>
   <td style="text-align:right;"> 867154.2 </td>
   <td style="text-align:right;"> -1734204 </td>
   <td style="text-align:right;"> -1733626 </td>
   <td style="text-align:right;"> 0.180 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 (Proportion) </td>
   <td style="text-align:left;"> logit </td>
   <td style="text-align:right;"> 1055313.5 </td>
   <td style="text-align:right;"> -2110523 </td>
   <td style="text-align:right;"> -2109945 </td>
   <td style="text-align:right;"> 0.154 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 (Proportion) </td>
   <td style="text-align:left;"> loglog </td>
   <td style="text-align:right;"> 1055373.7 </td>
   <td style="text-align:right;"> -2110643 </td>
   <td style="text-align:right;"> -2110065 </td>
   <td style="text-align:right;"> 0.150 </td>
  </tr>
</tbody>
</table>

The loglog link appears to allow for a better fit, both on AIC and BIC, so we proceed with it given the Crebari-Neto and Lima reasoning about extreme values.

## Dispersion (phi-)Model Selection


### Dispersion vs. Equi-Dispersion


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
   <td style="text-align:left;"> M7 (Inverse Brier; dispersion φ sub-model) </td>
   <td style="text-align:right;"> 867154.2 </td>
   <td style="text-align:right;"> -1734204 </td>
   <td style="text-align:right;"> -1733626 </td>
   <td style="text-align:right;"> 0.180 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 (Inverse Brier; φ constant) </td>
   <td style="text-align:right;"> 808402.4 </td>
   <td style="text-align:right;"> -1616737 </td>
   <td style="text-align:right;"> -1616358 </td>
   <td style="text-align:right;"> 0.269 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 (Proportion; dispersion φ sub-model) </td>
   <td style="text-align:right;"> 1055373.7 </td>
   <td style="text-align:right;"> -2110643 </td>
   <td style="text-align:right;"> -2110065 </td>
   <td style="text-align:right;"> 0.150 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 (Proportion; φ constant) </td>
   <td style="text-align:right;"> 1002609.8 </td>
   <td style="text-align:right;"> -2005152 </td>
   <td style="text-align:right;"> -2004773 </td>
   <td style="text-align:right;"> 0.245 </td>
  </tr>
</tbody>
</table>

While the pseudo-R^2 is much higher without modelling phi, the AIC/BIC is improved. We use a likelihood-ratio test to confirm.
A likelihood‑ratio test confirms the dispersion sub‑model for Inverse Brier Score is warranted (higher log-likelihood):

```Likelihood ratio test

Model 1: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + 
    recurrence:laminations + recurrence + laminations + inputsize + 
    grammartype + neurons + layers
Model 2: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype + 
    recurrence:laminations + inputsize:grammartype + recurrence + 
    laminations + inputsize + grammartype + neurons + layers | 
    recurrence + laminations + inputsize + grammartype + neurons + 
        layers
  #Df LogLik Df  Chisq Pr(>Chisq)    
1  34 808402                         
2  52 867154 18 117504  < 2.2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```

A likelihood‑ratio test confirms the dispersion sub‑model for Proportion Correct is warranted (higher log-likelihood):

```Likelihood ratio test

Model 1: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + 
    recurrence:laminations + recurrence + laminations + inputsize + 
    grammartype + neurons + layers
Model 2: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype + 
    recurrence:laminations + inputsize:grammartype + recurrence + 
    laminations + inputsize + grammartype + neurons + layers | 
    recurrence + laminations + inputsize + grammartype + neurons + 
        layers
  #Df  LogLik Df  Chisq Pr(>Chisq)    
1  34 1002610                         
2  52 1055374 18 105528  < 2.2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```


### Interaction Effects

We fitted the following models for model selection (with loglog links) for Inverse Brier Score...

```
 M1a: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     recurrence:grammartype + recurrence + laminations + inputsize +         grammartype + neurons + layers

M1b: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     laminations:grammartype + recurrence + laminations + inputsize +         grammartype + neurons + layers

M1c: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     recurrence:laminations + recurrence + laminations + inputsize +         grammartype + neurons + layers

M1d: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     inputsize:grammartype + recurrence + laminations + inputsize +         grammartype + neurons + layers

M1e: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     recurrence:grammartype + laminations:grammartype + recurrence +         laminations + inputsize + grammartype + neurons + layers

M1f: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     recurrence:grammartype + laminations:grammartype + recurrence:laminations +         recurrence + laminations + inputsize + grammartype +         neurons + layers

M1g: Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     recurrence:grammartype + laminations:grammartype + recurrence:laminations +         inputsize:grammartype + recurrence + laminations + inputsize +         grammartype + neurons + layers 
```

We fitted the same models for model selection (with loglog links) for Proportion Correct...

```
 M1a: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     recurrence:grammartype + recurrence + laminations + inputsize +         grammartype + neurons + layers

M1b: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     laminations:grammartype + recurrence + laminations + inputsize +         grammartype + neurons + layers

M1c: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     recurrence:laminations + recurrence + laminations + inputsize +         grammartype + neurons + layers

M1d: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     inputsize:grammartype + recurrence + laminations + inputsize +         grammartype + neurons + layers

M1e: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     recurrence:grammartype + laminations:grammartype + recurrence +         laminations + inputsize + grammartype + neurons + layers

M1f: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     recurrence:grammartype + laminations:grammartype + recurrence:laminations +         recurrence + laminations + inputsize + grammartype +         neurons + layers

M1g: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     recurrence:grammartype + laminations:grammartype + recurrence:laminations +         inputsize:grammartype + recurrence + laminations + inputsize +         grammartype + neurons + layers 
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Fit statistics for all candidate models with phi modelling</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Model </th>
   <th style="text-align:left;"> Response Variable </th>
   <th style="text-align:right;"> logLik </th>
   <th style="text-align:right;"> df.residual </th>
   <th style="text-align:right;"> AIC </th>
   <th style="text-align:right;"> BIC </th>
   <th style="text-align:right;"> pseudo.r.squared </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> M1a </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 872422.4 </td>
   <td style="text-align:right;"> 500896 </td>
   <td style="text-align:right;"> -1744717 </td>
   <td style="text-align:right;"> -1744005 </td>
   <td style="text-align:right;"> 0.186 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1b </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 867177.7 </td>
   <td style="text-align:right;"> 500902 </td>
   <td style="text-align:right;"> -1734239 </td>
   <td style="text-align:right;"> -1733594 </td>
   <td style="text-align:right;"> 0.180 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1c </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 867194.4 </td>
   <td style="text-align:right;"> 500906 </td>
   <td style="text-align:right;"> -1734281 </td>
   <td style="text-align:right;"> -1733680 </td>
   <td style="text-align:right;"> 0.180 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1d </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 871964.2 </td>
   <td style="text-align:right;"> 500902 </td>
   <td style="text-align:right;"> -1743812 </td>
   <td style="text-align:right;"> -1743167 </td>
   <td style="text-align:right;"> 0.232 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1e </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 872445.4 </td>
   <td style="text-align:right;"> 500890 </td>
   <td style="text-align:right;"> -1744751 </td>
   <td style="text-align:right;"> -1743972 </td>
   <td style="text-align:right;"> 0.186 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1f </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 872480.9 </td>
   <td style="text-align:right;"> 500888 </td>
   <td style="text-align:right;"> -1744818 </td>
   <td style="text-align:right;"> -1744017 </td>
   <td style="text-align:right;"> 0.186 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1g </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 876306.1 </td>
   <td style="text-align:right;"> 500882 </td>
   <td style="text-align:right;"> -1752456 </td>
   <td style="text-align:right;"> -1751589 </td>
   <td style="text-align:right;"> 0.225 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 867154.2 </td>
   <td style="text-align:right;"> 500908 </td>
   <td style="text-align:right;"> -1734204 </td>
   <td style="text-align:right;"> -1733626 </td>
   <td style="text-align:right;"> 0.180 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1a </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1061664.2 </td>
   <td style="text-align:right;"> 500896 </td>
   <td style="text-align:right;"> -2123200 </td>
   <td style="text-align:right;"> -2122488 </td>
   <td style="text-align:right;"> 0.156 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1b </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1055387.7 </td>
   <td style="text-align:right;"> 500902 </td>
   <td style="text-align:right;"> -2110659 </td>
   <td style="text-align:right;"> -2110014 </td>
   <td style="text-align:right;"> 0.150 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1c </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1055380.2 </td>
   <td style="text-align:right;"> 500906 </td>
   <td style="text-align:right;"> -2110652 </td>
   <td style="text-align:right;"> -2110052 </td>
   <td style="text-align:right;"> 0.150 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1d </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1060394.3 </td>
   <td style="text-align:right;"> 500902 </td>
   <td style="text-align:right;"> -2120673 </td>
   <td style="text-align:right;"> -2120027 </td>
   <td style="text-align:right;"> 0.191 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1e </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1061693.0 </td>
   <td style="text-align:right;"> 500890 </td>
   <td style="text-align:right;"> -2123246 </td>
   <td style="text-align:right;"> -2122467 </td>
   <td style="text-align:right;"> 0.156 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1f </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1061695.8 </td>
   <td style="text-align:right;"> 500888 </td>
   <td style="text-align:right;"> -2123248 </td>
   <td style="text-align:right;"> -2122447 </td>
   <td style="text-align:right;"> 0.156 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1g </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1065494.4 </td>
   <td style="text-align:right;"> 500882 </td>
   <td style="text-align:right;"> -2130833 </td>
   <td style="text-align:right;"> -2129965 </td>
   <td style="text-align:right;"> 0.189 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1055373.7 </td>
   <td style="text-align:right;"> 500908 </td>
   <td style="text-align:right;"> -2110643 </td>
   <td style="text-align:right;"> -2110065 </td>
   <td style="text-align:right;"> 0.150 </td>
  </tr>
</tbody>
</table>


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Cross validation RMSEs (lower is better) for all candidate phi models with Inverse Brier Score</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Fold </th>
   <th style="text-align:right;"> RMSE M1a </th>
   <th style="text-align:right;"> RMSE M1b </th>
   <th style="text-align:right;"> RMSE M1c </th>
   <th style="text-align:right;"> RMSE M1d </th>
   <th style="text-align:right;"> RMSE M1e </th>
   <th style="text-align:right;"> RMSE M1f </th>
   <th style="text-align:right;"> RMSE M1g </th>
   <th style="text-align:right;"> RMSE M1 (Logit link) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.090 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.088 </td>
   <td style="text-align:right;"> 0.089 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.090 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.090 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mean </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
   <td style="text-align:right;"> 0.089 </td>
  </tr>
</tbody>
</table>


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Cross validation RMSEs (lower is better) for all candidate phi models with Proportion Correct</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Fold </th>
   <th style="text-align:right;"> RMSE M1a </th>
   <th style="text-align:right;"> RMSE M1b </th>
   <th style="text-align:right;"> RMSE M1c </th>
   <th style="text-align:right;"> RMSE M1d </th>
   <th style="text-align:right;"> RMSE M1e </th>
   <th style="text-align:right;"> RMSE M1f </th>
   <th style="text-align:right;"> RMSE M1g </th>
   <th style="text-align:right;"> RMSE M1 (Logit link) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.083 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.083 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.083 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.081 </td>
   <td style="text-align:right;"> 0.083 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.083 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mean </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.083 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.082 </td>
   <td style="text-align:right;"> 0.083 </td>
  </tr>
</tbody>
</table>


 ### Best Phi Model Specification

M1g (maximal phi-model) is much improved on AIC/BIC and is equally performant on cross-validation. Hence, we proceed with M1g as the best model specification.


```
 Inverse_Brier_Score ~ recurrence:grammartype + laminations:grammartype +      recurrence:laminations + inputsize:grammartype + recurrence +      laminations + inputsize + grammartype + neurons + layers |      recurrence:grammartype + laminations:grammartype + recurrence:laminations +          inputsize:grammartype + recurrence + laminations + inputsize +          grammartype + neurons + layers 

 Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +      recurrence:laminations + inputsize:grammartype + recurrence +      laminations + inputsize + grammartype + neurons + layers |      recurrence:grammartype + laminations:grammartype + recurrence:laminations +          inputsize:grammartype + recurrence + laminations + inputsize +          grammartype + neurons + layers 
```


### Heteroskedasticity Checks 
*Plots saved separately as svg files*: `plots/best_model_inverse_brier_resid_dispersion.svg`, `plots/best_model_proportion_resid_dispersion.svg`

Breusch-Pagan tests confirm the heteroskedasticity:
```

	studentized Breusch-Pagan test

data:  best_mod_inverse_brier
BP = 61251, df = 38, p-value < 2.2e-16




	studentized Breusch-Pagan test

data:  best_mod_proportion
BP = 64973, df = 38, p-value < 2.2e-16


```

There is still heteroskedasticity in the model, as indicated by the fan shape of the residuals. This should be noted, but also beta regression doesn't have well-defined residual checks and it may not necessarily be a problem for Beta regression, since it is designed to handle heteroskedasticity.


# Final Model Statistics

## Inverse Brier Score Model

```
Call:
betareg::betareg(formula = formulas_inverse_brier$M1, data = df, link = "loglog")

Quantile residuals:
    Min      1Q  Median      3Q     Max 
-4.4149 -0.6376  0.1306  0.7272  3.7121 

Coefficients (mean model with loglog link):
                                       Estimate Std. Error  z value Pr(>|z|)    
(Intercept)                           3.539e+00  2.856e-02  123.888  < 2e-16 ***
recurrenceRNN                        -3.606e-01  2.307e-02  -15.631  < 2e-16 ***
recurrenceGRU                        -2.189e-01  2.302e-02   -9.508  < 2e-16 ***
laminationsLaminated                  3.295e-02  1.233e-02    2.673 0.007508 ** 
inputsize                            -4.423e-02  1.421e-03  -31.137  < 2e-16 ***
grammartypeLT                        -1.079e+00  3.483e-02  -30.986  < 2e-16 ***
grammartypeLTT                       -6.233e-01  3.256e-02  -19.141  < 2e-16 ***
grammartypeLTTO                      -8.881e-01  3.445e-02  -25.781  < 2e-16 ***
grammartypeMSO                       -3.420e+00  3.252e-02 -105.153  < 2e-16 ***
grammartypeCS                        -1.163e+00  2.898e-02  -40.109  < 2e-16 ***
grammartypeCF                        -1.768e+00  2.898e-02  -61.005  < 2e-16 ***
neurons                               9.093e-04  8.670e-06  104.878  < 2e-16 ***
layers                               -7.000e-02  2.448e-03  -28.592  < 2e-16 ***
recurrenceRNN:grammartypeLT           1.854e-01  2.813e-02    6.590 4.41e-11 ***
recurrenceGRU:grammartypeLT           3.998e-01  2.810e-02   14.230  < 2e-16 ***
recurrenceRNN:grammartypeLTT          1.035e-01  2.611e-02    3.964 7.37e-05 ***
recurrenceGRU:grammartypeLTT          3.118e-01  2.607e-02   11.961  < 2e-16 ***
recurrenceRNN:grammartypeLTTO         1.523e-01  2.799e-02    5.441 5.28e-08 ***
recurrenceGRU:grammartypeLTTO         2.262e-01  2.790e-02    8.105 5.29e-16 ***
recurrenceRNN:grammartypeMSO          8.757e-01  2.706e-02   32.355  < 2e-16 ***
recurrenceGRU:grammartypeMSO          9.458e-01  2.701e-02   35.009  < 2e-16 ***
recurrenceRNN:grammartypeCS           5.822e-01  2.364e-02   24.624  < 2e-16 ***
recurrenceGRU:grammartypeCS           9.536e-01  2.362e-02   40.379  < 2e-16 ***
recurrenceRNN:grammartypeCF           3.761e-01  2.378e-02   15.813  < 2e-16 ***
recurrenceGRU:grammartypeCF           5.972e-01  2.374e-02   25.152  < 2e-16 ***
grammartypeLT:laminationsLaminated    4.763e-02  1.243e-02    3.833 0.000126 ***
grammartypeLTT:laminationsLaminated   2.074e-02  1.154e-02    1.796 0.072466 .  
grammartypeLTTO:laminationsLaminated  3.231e-02  1.219e-02    2.651 0.008016 ** 
grammartypeMSO:laminationsLaminated   2.885e-02  1.120e-02    2.575 0.010026 *  
grammartypeCS:laminationsLaminated   -5.940e-02  9.974e-03   -5.955 2.60e-09 ***
grammartypeCF:laminationsLaminated    1.112e-03  9.898e-03    0.112 0.910582    
recurrenceRNN:laminationsLaminated   -1.376e-01  8.788e-03  -15.660  < 2e-16 ***
recurrenceGRU:laminationsLaminated   -9.790e-02  8.810e-03  -11.112  < 2e-16 ***
grammartypeLT:inputsize              -7.251e-03  1.877e-03   -3.864 0.000111 ***
grammartypeLTT:inputsize             -4.455e-02  1.757e-03  -25.357  < 2e-16 ***
grammartypeLTTO:inputsize             4.459e-03  1.835e-03    2.430 0.015110 *  
grammartypeMSO:inputsize              2.069e-01  1.688e-03  122.532  < 2e-16 ***
grammartypeCS:inputsize               3.435e-02  1.494e-03   22.998  < 2e-16 ***
grammartypeCF:inputsize               1.220e-01  1.480e-03   82.376  < 2e-16 ***

Phi coefficients (precision model with log link):
                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)           1.655e+00  1.810e-02  91.449   <2e-16 ***
recurrenceRNN        -5.169e-01  1.055e-02 -48.986   <2e-16 ***
recurrenceGRU        -1.973e-01  1.057e-02 -18.666   <2e-16 ***
laminationsLaminated -3.559e-02  4.277e-03  -8.321   <2e-16 ***
inputsize             3.886e-02  6.405e-04  60.679   <2e-16 ***
grammartypeLT         7.470e-01  1.240e-02  60.244   <2e-16 ***
grammartypeLTT        1.369e+00  1.231e-02 111.182   <2e-16 ***
grammartypeLTTO       1.057e+00  1.239e-02  85.278   <2e-16 ***
grammartypeMSO        1.393e-01  1.095e-02  12.722   <2e-16 ***
grammartypeCS         1.170e+00  1.013e-02 115.464   <2e-16 ***
grammartypeCF         1.286e+00  1.007e-02 127.738   <2e-16 ***
neurons               8.119e-04  1.406e-05  57.741   <2e-16 ***
layers               -7.935e-02  4.012e-03 -19.776   <2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

Type of estimator: ML (maximum likelihood)
Log-likelihood: 8.672e+05 on 52 Df
Pseudo R-squared: 0.1799
Number of iterations: 67 (BFGS) + 6 (Fisher scoring) 
```


### Recurrence-Grammar Interaction


#### Estimated Marginal Means (EMMs)

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Recurrence × Grammar Type EMMs (Inverse Brier Score)</caption>
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
   <td style="text-align:right;"> 0.9648465 </td>
   <td style="text-align:right;"> 0.00078649 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9633050 </td>
   <td style="text-align:right;"> 0.9663880 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9463654 </td>
   <td style="text-align:right;"> 0.00051367 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9453586 </td>
   <td style="text-align:right;"> 0.9473722 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9542638 </td>
   <td style="text-align:right;"> 0.00042748 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9534260 </td>
   <td style="text-align:right;"> 0.9551017 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8972070 </td>
   <td style="text-align:right;"> 0.00162785 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8940165 </td>
   <td style="text-align:right;"> 0.9003975 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8708945 </td>
   <td style="text-align:right;"> 0.00081569 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8692958 </td>
   <td style="text-align:right;"> 0.8724933 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9094683 </td>
   <td style="text-align:right;"> 0.00059442 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9083032 </td>
   <td style="text-align:right;"> 0.9106333 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9141990 </td>
   <td style="text-align:right;"> 0.00107593 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9120902 </td>
   <td style="text-align:right;"> 0.9163078 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8830239 </td>
   <td style="text-align:right;"> 0.00060372 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8818406 </td>
   <td style="text-align:right;"> 0.8842071 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9177728 </td>
   <td style="text-align:right;"> 0.00043901 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9169124 </td>
   <td style="text-align:right;"> 0.9186332 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9201462 </td>
   <td style="text-align:right;"> 0.00125946 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9176777 </td>
   <td style="text-align:right;"> 0.9226147 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8960021 </td>
   <td style="text-align:right;"> 0.00064499 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8947379 </td>
   <td style="text-align:right;"> 0.8972663 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9168401 </td>
   <td style="text-align:right;"> 0.00050312 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9158540 </td>
   <td style="text-align:right;"> 0.9178262 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7695767 </td>
   <td style="text-align:right;"> 0.00287601 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.7639398 </td>
   <td style="text-align:right;"> 0.7752136 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8393243 </td>
   <td style="text-align:right;"> 0.00081556 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8377258 </td>
   <td style="text-align:right;"> 0.8409227 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8734650 </td>
   <td style="text-align:right;"> 0.00064251 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8722057 </td>
   <td style="text-align:right;"> 0.8747243 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9104298 </td>
   <td style="text-align:right;"> 0.00067203 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9091126 </td>
   <td style="text-align:right;"> 0.9117469 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9226613 </td>
   <td style="text-align:right;"> 0.00025394 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9221636 </td>
   <td style="text-align:right;"> 0.9231591 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9538965 </td>
   <td style="text-align:right;"> 0.00016740 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9535684 </td>
   <td style="text-align:right;"> 0.9542247 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9118464 </td>
   <td style="text-align:right;"> 0.00071496 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9104451 </td>
   <td style="text-align:right;"> 0.9132477 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9072244 </td>
   <td style="text-align:right;"> 0.00026651 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9067021 </td>
   <td style="text-align:right;"> 0.9077468 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9360157 </td>
   <td style="text-align:right;"> 0.00019146 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9356405 </td>
   <td style="text-align:right;"> 0.9363910 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Architectures By Grammar Type (Inverse Brier Score)</caption>
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
   <td style="text-align:right;"> 0.01848110 </td>
   <td style="text-align:right;"> 0.00084691 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 21.821922 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.01058267 </td>
   <td style="text-align:right;"> 0.00081551 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 12.976787 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.00789843 </td>
   <td style="text-align:right;"> 0.00047877 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -16.497216 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.02631249 </td>
   <td style="text-align:right;"> 0.00176807 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 14.882029 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.01226127 </td>
   <td style="text-align:right;"> 0.00168982 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.255972 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.03857376 </td>
   <td style="text-align:right;"> 0.00093514 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -41.249278 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.03117515 </td>
   <td style="text-align:right;"> 0.00118161 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 26.383623 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.00357381 </td>
   <td style="text-align:right;"> 0.00111891 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -3.193998 </td>
   <td style="text-align:right;"> 0.00400921 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.03474896 </td>
   <td style="text-align:right;"> 0.00070335 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -49.405255 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.02414414 </td>
   <td style="text-align:right;"> 0.00137598 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 17.546873 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.00330610 </td>
   <td style="text-align:right;"> 0.00132297 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.498994 </td>
   <td style="text-align:right;"> 0.03333192 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.02083804 </td>
   <td style="text-align:right;"> 0.00076231 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -27.335235 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.06974757 </td>
   <td style="text-align:right;"> 0.00300423 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -23.216428 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.10388833 </td>
   <td style="text-align:right;"> 0.00296525 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -35.035300 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.03414076 </td>
   <td style="text-align:right;"> 0.00095080 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -35.907479 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.01223154 </td>
   <td style="text-align:right;"> 0.00070767 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -17.284202 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.04346674 </td>
   <td style="text-align:right;"> 0.00068499 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -63.455638 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.03123520 </td>
   <td style="text-align:right;"> 0.00028345 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -110.197295 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.00462196 </td>
   <td style="text-align:right;"> 0.00076705 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.025669 </td>
   <td style="text-align:right;"> 0.00000001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.02416936 </td>
   <td style="text-align:right;"> 0.00074349 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -32.507924 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.02879132 </td>
   <td style="text-align:right;"> 0.00031164 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -92.385844 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Types By Architecture (Inverse Brier Score)</caption>
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
   <td style="text-align:right;"> 0.06763949 </td>
   <td style="text-align:right;"> 0.00178410 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 37.9123576 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.05064752 </td>
   <td style="text-align:right;"> 0.00131608 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 38.4837390 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.04470028 </td>
   <td style="text-align:right;"> 0.00146165 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 30.5820812 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.19526982 </td>
   <td style="text-align:right;"> 0.00293013 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 66.6420905 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.05441671 </td>
   <td style="text-align:right;"> 0.00099602 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 54.6341842 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.05300013 </td>
   <td style="text-align:right;"> 0.00101806 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 52.0597329 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.01699197 </td>
   <td style="text-align:right;"> 0.00193877 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.7643163 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.02293921 </td>
   <td style="text-align:right;"> 0.00204221 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.2325267 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.12763033 </td>
   <td style="text-align:right;"> 0.00326577 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 39.0812636 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.01322278 </td>
   <td style="text-align:right;"> 0.00173921 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.6027482 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.01463936 </td>
   <td style="text-align:right;"> 0.00175429 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.3449146 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.00594723 </td>
   <td style="text-align:right;"> 0.00164488 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -3.6156094 </td>
   <td style="text-align:right;"> 0.00555789 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.14462231 </td>
   <td style="text-align:right;"> 0.00304814 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 47.4461264 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.00376919 </td>
   <td style="text-align:right;"> 0.00125071 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.0136457 </td>
   <td style="text-align:right;"> 0.04131354 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.00235261 </td>
   <td style="text-align:right;"> 0.00127346 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.8474238 </td>
   <td style="text-align:right;"> 0.51571059 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.15056954 </td>
   <td style="text-align:right;"> 0.00310671 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 48.4659647 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.00971643 </td>
   <td style="text-align:right;"> 0.00140630 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.9092021 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.00829985 </td>
   <td style="text-align:right;"> 0.00142494 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 5.8247023 </td>
   <td style="text-align:right;"> 0.00000012 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.14085311 </td>
   <td style="text-align:right;"> 0.00291381 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -48.3397608 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.14226969 </td>
   <td style="text-align:right;"> 0.00291589 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -48.7911345 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.00141658 </td>
   <td style="text-align:right;"> 0.00094164 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.5043734 </td>
   <td style="text-align:right;"> 0.74237823 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.07547088 </td>
   <td style="text-align:right;"> 0.00095564 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 78.9742398 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.06334156 </td>
   <td style="text-align:right;"> 0.00078652 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 80.5344341 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.05036332 </td>
   <td style="text-align:right;"> 0.00081680 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 61.6591843 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.10704115 </td>
   <td style="text-align:right;"> 0.00095309 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 112.3095665 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.02370407 </td>
   <td style="text-align:right;"> 0.00056335 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 42.0770875 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.03914099 </td>
   <td style="text-align:right;"> 0.00057032 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 68.6293904 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.01212931 </td>
   <td style="text-align:right;"> 0.00101044 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.0039431 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.02510756 </td>
   <td style="text-align:right;"> 0.00103442 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -24.2721886 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.03157028 </td>
   <td style="text-align:right;"> 0.00114603 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 27.5476318 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.05176681 </td>
   <td style="text-align:right;"> 0.00084859 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -61.0029817 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.03632988 </td>
   <td style="text-align:right;"> 0.00085329 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -42.5763644 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.01297824 </td>
   <td style="text-align:right;"> 0.00087951 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -14.7561890 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.04369959 </td>
   <td style="text-align:right;"> 0.00101022 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 43.2576463 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.03963750 </td>
   <td style="text-align:right;"> 0.00065045 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -60.9384839 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.02420057 </td>
   <td style="text-align:right;"> 0.00065632 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -36.8729156 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.05667783 </td>
   <td style="text-align:right;"> 0.00103288 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 54.8733359 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.02665925 </td>
   <td style="text-align:right;"> 0.00068755 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -38.7742666 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.01122233 </td>
   <td style="text-align:right;"> 0.00069303 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -16.1931532 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.08333709 </td>
   <td style="text-align:right;"> 0.00084631 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -98.4707538 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.06790016 </td>
   <td style="text-align:right;"> 0.00084924 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -79.9540708 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.01543692 </td>
   <td style="text-align:right;"> 0.00035979 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 42.9057350 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.04479554 </td>
   <td style="text-align:right;"> 0.00072505 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 61.7825095 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.03649103 </td>
   <td style="text-align:right;"> 0.00060768 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 60.0499684 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.03742371 </td>
   <td style="text-align:right;"> 0.00065420 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 57.2055577 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.08079882 </td>
   <td style="text-align:right;"> 0.00076273 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 105.9335352 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.00036729 </td>
   <td style="text-align:right;"> 0.00045158 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8133449 </td>
   <td style="text-align:right;"> 0.98370135 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.01824810 </td>
   <td style="text-align:right;"> 0.00046194 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 39.5029739 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.00830451 </td>
   <td style="text-align:right;"> 0.00073509 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.2972567 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.00737184 </td>
   <td style="text-align:right;"> 0.00077411 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.5230209 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.03600327 </td>
   <td style="text-align:right;"> 0.00086831 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 41.4636518 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.04442825 </td>
   <td style="text-align:right;"> 0.00061249 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -72.5373374 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.02654745 </td>
   <td style="text-align:right;"> 0.00062016 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -42.8077015 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.00093268 </td>
   <td style="text-align:right;"> 0.00066448 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.4036217 </td>
   <td style="text-align:right;"> 0.80016219 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.04430778 </td>
   <td style="text-align:right;"> 0.00077402 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 57.2434802 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.03612374 </td>
   <td style="text-align:right;"> 0.00046593 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -77.5309919 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.01824294 </td>
   <td style="text-align:right;"> 0.00047575 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -38.3455276 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.04337511 </td>
   <td style="text-align:right;"> 0.00081024 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 53.5338694 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.03705641 </td>
   <td style="text-align:right;"> 0.00052574 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -70.4836855 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.01917561 </td>
   <td style="text-align:right;"> 0.00053445 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -35.8793096 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.08043152 </td>
   <td style="text-align:right;"> 0.00065714 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -122.3962685 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.06255072 </td>
   <td style="text-align:right;"> 0.00066313 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -94.3271005 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.01788080 </td>
   <td style="text-align:right;"> 0.00024679 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 72.4520868 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

### Laminations-Grammar Interaction


#### Estimated Marginal Means (EMMs)

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Laminations × Grammar EMMs (Inverse Brier Score)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> laminations </th>
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
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9563566 </td>
   <td style="text-align:right;"> 0.00045795 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9554590 </td>
   <td style="text-align:right;"> 0.9572542 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9539606 </td>
   <td style="text-align:right;"> 0.00048119 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9530174 </td>
   <td style="text-align:right;"> 0.9549037 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8925882 </td>
   <td style="text-align:right;"> 0.00080024 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8910198 </td>
   <td style="text-align:right;"> 0.8941567 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8924583 </td>
   <td style="text-align:right;"> 0.00082296 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8908454 </td>
   <td style="text-align:right;"> 0.8940713 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9063610 </td>
   <td style="text-align:right;"> 0.00055897 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9052654 </td>
   <td style="text-align:right;"> 0.9074566 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9036361 </td>
   <td style="text-align:right;"> 0.00058846 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9024828 </td>
   <td style="text-align:right;"> 0.9047895 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9117668 </td>
   <td style="text-align:right;"> 0.00062724 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9105374 </td>
   <td style="text-align:right;"> 0.9129961 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9102255 </td>
   <td style="text-align:right;"> 0.00065091 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9089498 </td>
   <td style="text-align:right;"> 0.9115013 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8284252 </td>
   <td style="text-align:right;"> 0.00114197 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8261870 </td>
   <td style="text-align:right;"> 0.8306634 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8264855 </td>
   <td style="text-align:right;"> 0.00118789 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8241572 </td>
   <td style="text-align:right;"> 0.8288137 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9323015 </td>
   <td style="text-align:right;"> 0.00029088 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9317314 </td>
   <td style="text-align:right;"> 0.9328716 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9256903 </td>
   <td style="text-align:right;"> 0.00032752 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9250484 </td>
   <td style="text-align:right;"> 0.9263322 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9200804 </td>
   <td style="text-align:right;"> 0.00030700 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9194787 </td>
   <td style="text-align:right;"> 0.9206821 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9166440 </td>
   <td style="text-align:right;"> 0.00033106 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9159951 </td>
   <td style="text-align:right;"> 0.9172928 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Laminations By Grammar Type (Inverse Brier Score)</caption>
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
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.00239604 </td>
   <td style="text-align:right;"> 0.00042255 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 5.6704174 </td>
   <td style="text-align:right;"> 0.00000001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.00012991 </td>
   <td style="text-align:right;"> 0.00088937 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.1460641 </td>
   <td style="text-align:right;"> 0.88387081 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.00272486 </td>
   <td style="text-align:right;"> 0.00065413 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.1656192 </td>
   <td style="text-align:right;"> 0.00003105 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.00154123 </td>
   <td style="text-align:right;"> 0.00071043 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.1694348 </td>
   <td style="text-align:right;"> 0.03004969 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.00193972 </td>
   <td style="text-align:right;"> 0.00113376 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.7108722 </td>
   <td style="text-align:right;"> 0.08710471 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.00661116 </td>
   <td style="text-align:right;"> 0.00035366 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 18.6936978 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.00343642 </td>
   <td style="text-align:right;"> 0.00036457 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 9.4259762 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Types By Laminations (Inverse Brier Score)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> contrast </th>
   <th style="text-align:left;"> laminations </th>
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
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.06376837 </td>
   <td style="text-align:right;"> 0.00091053 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 70.034268 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.04999563 </td>
   <td style="text-align:right;"> 0.00071372 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 70.049536 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.04458984 </td>
   <td style="text-align:right;"> 0.00076606 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 58.206882 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.12793142 </td>
   <td style="text-align:right;"> 0.00121056 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 105.679545 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.02405513 </td>
   <td style="text-align:right;"> 0.00052604 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 45.728930 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.03627621 </td>
   <td style="text-align:right;"> 0.00053514 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 67.788129 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.01377274 </td>
   <td style="text-align:right;"> 0.00096611 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -14.255884 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.01917853 </td>
   <td style="text-align:right;"> 0.00100582 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -19.067649 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.06416305 </td>
   <td style="text-align:right;"> 0.00137298 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 46.732749 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.03971324 </td>
   <td style="text-align:right;"> 0.00083697 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -47.449022 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.02749216 </td>
   <td style="text-align:right;"> 0.00084312 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -32.607545 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.00540579 </td>
   <td style="text-align:right;"> 0.00083115 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.503978 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.07793580 </td>
   <td style="text-align:right;"> 0.00125613 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 62.044414 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.02594050 </td>
   <td style="text-align:right;"> 0.00061667 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -42.065400 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.01371941 </td>
   <td style="text-align:right;"> 0.00062499 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -21.951513 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.08334158 </td>
   <td style="text-align:right;"> 0.00128460 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 64.877354 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.02053471 </td>
   <td style="text-align:right;"> 0.00067751 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -30.309080 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.00831363 </td>
   <td style="text-align:right;"> 0.00068475 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.141053 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.10387629 </td>
   <td style="text-align:right;"> 0.00115620 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -89.842720 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.09165521 </td>
   <td style="text-align:right;"> 0.00115773 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -79.168230 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.01222108 </td>
   <td style="text-align:right;"> 0.00039763 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 30.735002 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.06150223 </td>
   <td style="text-align:right;"> 0.00093770 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 65.588642 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.05032445 </td>
   <td style="text-align:right;"> 0.00074727 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 67.344813 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.04373503 </td>
   <td style="text-align:right;"> 0.00079510 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 55.005546 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.12747510 </td>
   <td style="text-align:right;"> 0.00125572 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 101.515344 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.02827025 </td>
   <td style="text-align:right;"> 0.00055928 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 50.547780 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.03731660 </td>
   <td style="text-align:right;"> 0.00056209 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 66.389463 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.01117779 </td>
   <td style="text-align:right;"> 0.00099396 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.245672 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.01776720 </td>
   <td style="text-align:right;"> 0.00103092 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -17.234337 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.06597287 </td>
   <td style="text-align:right;"> 0.00140948 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 46.806458 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.03323199 </td>
   <td style="text-align:right;"> 0.00086081 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -38.605298 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.02418564 </td>
   <td style="text-align:right;"> 0.00086283 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -28.030524 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.00658941 </td>
   <td style="text-align:right;"> 0.00086136 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.649978 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.07715066 </td>
   <td style="text-align:right;"> 0.00129780 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 59.447138 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.02205420 </td>
   <td style="text-align:right;"> 0.00064921 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -33.970765 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.01300785 </td>
   <td style="text-align:right;"> 0.00065164 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -19.961560 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.08374007 </td>
   <td style="text-align:right;"> 0.00132421 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 63.237693 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.01546478 </td>
   <td style="text-align:right;"> 0.00070475 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -21.943652 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.00641844 </td>
   <td style="text-align:right;"> 0.00070680 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.081029 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.09920486 </td>
   <td style="text-align:right;"> 0.00119414 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -83.076571 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.09015851 </td>
   <td style="text-align:right;"> 0.00119300 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -75.573084 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.00904635 </td>
   <td style="text-align:right;"> 0.00042239 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 21.416978 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table>

### Recurrence-Laminations Interaction


#### Estimated Marginal Means (EMMs)

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Laminations × Recurrence EMMs (Inverse Brier Score)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> laminations </th>
   <th style="text-align:left;"> recurrence </th>
   <th style="text-align:right;"> emmean </th>
   <th style="text-align:right;"> SE </th>
   <th style="text-align:right;"> df </th>
   <th style="text-align:right;"> asymp.LCL </th>
   <th style="text-align:right;"> asymp.UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.8962067 </td>
   <td style="text-align:right;"> 0.00068271 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8948686 </td>
   <td style="text-align:right;"> 0.8975448 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.9004366 </td>
   <td style="text-align:right;"> 0.00074653 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8989734 </td>
   <td style="text-align:right;"> 0.9018998 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.8994664 </td>
   <td style="text-align:right;"> 0.00029552 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8988872 </td>
   <td style="text-align:right;"> 0.9000456 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.8906753 </td>
   <td style="text-align:right;"> 0.00031188 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8900640 </td>
   <td style="text-align:right;"> 0.8912866 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9248468 </td>
   <td style="text-align:right;"> 0.00022860 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9243987 </td>
   <td style="text-align:right;"> 0.9252948 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9213596 </td>
   <td style="text-align:right;"> 0.00023632 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9208965 </td>
   <td style="text-align:right;"> 0.9218228 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Recurrence By Lamination (Inverse Brier Score)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> contrast </th>
   <th style="text-align:left;"> laminations </th>
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
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.00325969 </td>
   <td style="text-align:right;"> 0.00073090 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -4.459843 </td>
   <td style="text-align:right;"> 2.442e-05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.02864004 </td>
   <td style="text-align:right;"> 0.00070969 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -40.355560 </td>
   <td style="text-align:right;"> 0.000e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.02538035 </td>
   <td style="text-align:right;"> 0.00033682 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -75.352824 </td>
   <td style="text-align:right;"> 0.000e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.00976133 </td>
   <td style="text-align:right;"> 0.00079098 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 12.340751 </td>
   <td style="text-align:right;"> 0.000e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.02092303 </td>
   <td style="text-align:right;"> 0.00076886 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -27.213158 </td>
   <td style="text-align:right;"> 0.000e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.03068435 </td>
   <td style="text-align:right;"> 0.00035331 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -86.849193 </td>
   <td style="text-align:right;"> 0.000e+00 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Types By Architecture (Inverse Brier Score)</caption>
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
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.00422991 </td>
   <td style="text-align:right;"> 0.00077890 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.430656 </td>
   <td style="text-align:right;"> 6e-08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.00879110 </td>
   <td style="text-align:right;"> 0.00038200 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 23.013186 </td>
   <td style="text-align:right;"> 0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.00348710 </td>
   <td style="text-align:right;"> 0.00029178 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 11.951257 </td>
   <td style="text-align:right;"> 0e+00 </td>
  </tr>
</tbody>
</table>

### Input Size 

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Input Size × Grammar EMMs (Inverse Brier Score)</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> inputsize </th>
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
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9651174 </td>
   <td style="text-align:right;"> 0.00048878 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9641594 </td>
   <td style="text-align:right;"> 0.9660754 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9635594 </td>
   <td style="text-align:right;"> 0.00047213 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9626341 </td>
   <td style="text-align:right;"> 0.9644848 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9619347 </td>
   <td style="text-align:right;"> 0.00045592 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9610411 </td>
   <td style="text-align:right;"> 0.9628282 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9602405 </td>
   <td style="text-align:right;"> 0.00044113 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9593759 </td>
   <td style="text-align:right;"> 0.9611051 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9584743 </td>
   <td style="text-align:right;"> 0.00042906 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9576334 </td>
   <td style="text-align:right;"> 0.9593153 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9566333 </td>
   <td style="text-align:right;"> 0.00042132 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9558076 </td>
   <td style="text-align:right;"> 0.9574591 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9547147 </td>
   <td style="text-align:right;"> 0.00041983 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9538918 </td>
   <td style="text-align:right;"> 0.9555375 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9527155 </td>
   <td style="text-align:right;"> 0.00042661 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9518793 </td>
   <td style="text-align:right;"> 0.9535516 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9506327 </td>
   <td style="text-align:right;"> 0.00044345 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9497636 </td>
   <td style="text-align:right;"> 0.9515018 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9484633 </td>
   <td style="text-align:right;"> 0.00047167 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9475388 </td>
   <td style="text-align:right;"> 0.9493877 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9462041 </td>
   <td style="text-align:right;"> 0.00051195 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9452007 </td>
   <td style="text-align:right;"> 0.9472075 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9438519 </td>
   <td style="text-align:right;"> 0.00056439 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9427457 </td>
   <td style="text-align:right;"> 0.9449580 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9191434 </td>
   <td style="text-align:right;"> 0.00094044 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9173001 </td>
   <td style="text-align:right;"> 0.9209866 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9150064 </td>
   <td style="text-align:right;"> 0.00089327 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9132556 </td>
   <td style="text-align:right;"> 0.9167572 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9106788 </td>
   <td style="text-align:right;"> 0.00084365 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9090253 </td>
   <td style="text-align:right;"> 0.9123323 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9061539 </td>
   <td style="text-align:right;"> 0.00079335 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9045990 </td>
   <td style="text-align:right;"> 0.9077089 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9014252 </td>
   <td style="text-align:right;"> 0.00074517 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8999647 </td>
   <td style="text-align:right;"> 0.9028857 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8964859 </td>
   <td style="text-align:right;"> 0.00070333 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8951074 </td>
   <td style="text-align:right;"> 0.8978645 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8913297 </td>
   <td style="text-align:right;"> 0.00067373 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8900092 </td>
   <td style="text-align:right;"> 0.8926501 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8859499 </td>
   <td style="text-align:right;"> 0.00066363 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8846492 </td>
   <td style="text-align:right;"> 0.8872505 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8803402 </td>
   <td style="text-align:right;"> 0.00068030 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8790068 </td>
   <td style="text-align:right;"> 0.8816735 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8744944 </td>
   <td style="text-align:right;"> 0.00072876 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8730661 </td>
   <td style="text-align:right;"> 0.8759228 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8684066 </td>
   <td style="text-align:right;"> 0.00081031 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8668184 </td>
   <td style="text-align:right;"> 0.8699947 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8620708 </td>
   <td style="text-align:right;"> 0.00092314 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8602615 </td>
   <td style="text-align:right;"> 0.8638801 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9423263 </td>
   <td style="text-align:right;"> 0.00056954 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9412101 </td>
   <td style="text-align:right;"> 0.9434426 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9370293 </td>
   <td style="text-align:right;"> 0.00055852 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9359346 </td>
   <td style="text-align:right;"> 0.9381240 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9312823 </td>
   <td style="text-align:right;"> 0.00054326 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9302175 </td>
   <td style="text-align:right;"> 0.9323470 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9250538 </td>
   <td style="text-align:right;"> 0.00052443 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9240260 </td>
   <td style="text-align:right;"> 0.9260817 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9183117 </td>
   <td style="text-align:right;"> 0.00050353 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9173247 </td>
   <td style="text-align:right;"> 0.9192986 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9110228 </td>
   <td style="text-align:right;"> 0.00048349 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9100752 </td>
   <td style="text-align:right;"> 0.9119704 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9031539 </td>
   <td style="text-align:right;"> 0.00046917 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9022343 </td>
   <td style="text-align:right;"> 0.9040734 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8946715 </td>
   <td style="text-align:right;"> 0.00046778 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8937546 </td>
   <td style="text-align:right;"> 0.8955883 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8855424 </td>
   <td style="text-align:right;"> 0.00048798 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8845860 </td>
   <td style="text-align:right;"> 0.8864988 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8757345 </td>
   <td style="text-align:right;"> 0.00053731 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8746814 </td>
   <td style="text-align:right;"> 0.8767876 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8652169 </td>
   <td style="text-align:right;"> 0.00061966 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8640024 </td>
   <td style="text-align:right;"> 0.8664314 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8539605 </td>
   <td style="text-align:right;"> 0.00073508 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8525198 </td>
   <td style="text-align:right;"> 0.8554012 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9286879 </td>
   <td style="text-align:right;"> 0.00077650 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9271660 </td>
   <td style="text-align:right;"> 0.9302099 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9258744 </td>
   <td style="text-align:right;"> 0.00072968 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9244442 </td>
   <td style="text-align:right;"> 0.9273046 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9229592 </td>
   <td style="text-align:right;"> 0.00068196 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9216226 </td>
   <td style="text-align:right;"> 0.9242958 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9199394 </td>
   <td style="text-align:right;"> 0.00063487 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9186951 </td>
   <td style="text-align:right;"> 0.9211837 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9168121 </td>
   <td style="text-align:right;"> 0.00059079 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9156541 </td>
   <td style="text-align:right;"> 0.9179700 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9135742 </td>
   <td style="text-align:right;"> 0.00055314 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9124901 </td>
   <td style="text-align:right;"> 0.9146583 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9102228 </td>
   <td style="text-align:right;"> 0.00052662 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9091907 </td>
   <td style="text-align:right;"> 0.9112550 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9067549 </td>
   <td style="text-align:right;"> 0.00051675 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9057421 </td>
   <td style="text-align:right;"> 0.9077677 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9031675 </td>
   <td style="text-align:right;"> 0.00052872 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9021313 </td>
   <td style="text-align:right;"> 0.9042038 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8994576 </td>
   <td style="text-align:right;"> 0.00056558 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8983491 </td>
   <td style="text-align:right;"> 0.9005661 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8956222 </td>
   <td style="text-align:right;"> 0.00062744 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8943924 </td>
   <td style="text-align:right;"> 0.8968519 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8916583 </td>
   <td style="text-align:right;"> 0.00071219 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8902624 </td>
   <td style="text-align:right;"> 0.8930542 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.6420940 </td>
   <td style="text-align:right;"> 0.00228673 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.6376121 </td>
   <td style="text-align:right;"> 0.6465759 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.6801099 </td>
   <td style="text-align:right;"> 0.00201323 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.6761641 </td>
   <td style="text-align:right;"> 0.6840558 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7159136 </td>
   <td style="text-align:right;"> 0.00175383 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.7124761 </td>
   <td style="text-align:right;"> 0.7193510 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7492291 </td>
   <td style="text-align:right;"> 0.00151703 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.7462558 </td>
   <td style="text-align:right;"> 0.7522025 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7798805 </td>
   <td style="text-align:right;"> 0.00130881 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.7773153 </td>
   <td style="text-align:right;"> 0.7824457 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8077857 </td>
   <td style="text-align:right;"> 0.00113231 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8055664 </td>
   <td style="text-align:right;"> 0.8100049 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8329464 </td>
   <td style="text-align:right;"> 0.00098776 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8310104 </td>
   <td style="text-align:right;"> 0.8348824 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8554339 </td>
   <td style="text-align:right;"> 0.00087266 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8537235 </td>
   <td style="text-align:right;"> 0.8571442 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8753732 </td>
   <td style="text-align:right;"> 0.00078244 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8738396 </td>
   <td style="text-align:right;"> 0.8769067 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8929280 </td>
   <td style="text-align:right;"> 0.00071143 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8915337 </td>
   <td style="text-align:right;"> 0.8943224 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9082864 </td>
   <td style="text-align:right;"> 0.00065399 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9070046 </td>
   <td style="text-align:right;"> 0.9095682 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9216487 </td>
   <td style="text-align:right;"> 0.00060537 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9204622 </td>
   <td style="text-align:right;"> 0.9228352 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9326468 </td>
   <td style="text-align:right;"> 0.00041778 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9318280 </td>
   <td style="text-align:right;"> 0.9334657 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9320270 </td>
   <td style="text-align:right;"> 0.00038442 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9312736 </td>
   <td style="text-align:right;"> 0.9327804 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9314019 </td>
   <td style="text-align:right;"> 0.00035216 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9307117 </td>
   <td style="text-align:right;"> 0.9320921 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9307715 </td>
   <td style="text-align:right;"> 0.00032164 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9301411 </td>
   <td style="text-align:right;"> 0.9314019 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9301358 </td>
   <td style="text-align:right;"> 0.00029369 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9295602 </td>
   <td style="text-align:right;"> 0.9307114 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9294947 </td>
   <td style="text-align:right;"> 0.00026950 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9289665 </td>
   <td style="text-align:right;"> 0.9300229 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9288482 </td>
   <td style="text-align:right;"> 0.00025053 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9283572 </td>
   <td style="text-align:right;"> 0.9293392 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9281963 </td>
   <td style="text-align:right;"> 0.00023848 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9277289 </td>
   <td style="text-align:right;"> 0.9286637 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9275389 </td>
   <td style="text-align:right;"> 0.00023486 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9270785 </td>
   <td style="text-align:right;"> 0.9279992 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9268759 </td>
   <td style="text-align:right;"> 0.00024050 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9264046 </td>
   <td style="text-align:right;"> 0.9273473 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9262075 </td>
   <td style="text-align:right;"> 0.00025523 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9257072 </td>
   <td style="text-align:right;"> 0.9267077 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9255334 </td>
   <td style="text-align:right;"> 0.00027802 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9249885 </td>
   <td style="text-align:right;"> 0.9260783 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8756171 </td>
   <td style="text-align:right;"> 0.00060840 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8744247 </td>
   <td style="text-align:right;"> 0.8768095 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8841911 </td>
   <td style="text-align:right;"> 0.00052324 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8831656 </td>
   <td style="text-align:right;"> 0.8852167 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8922484 </td>
   <td style="text-align:right;"> 0.00044859 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8913692 </td>
   <td style="text-align:right;"> 0.8931277 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8998101 </td>
   <td style="text-align:right;"> 0.00038447 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8990565 </td>
   <td style="text-align:right;"> 0.9005637 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9068977 </td>
   <td style="text-align:right;"> 0.00033094 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9062491 </td>
   <td style="text-align:right;"> 0.9075463 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9135332 </td>
   <td style="text-align:right;"> 0.00028804 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9129687 </td>
   <td style="text-align:right;"> 0.9140978 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9197386 </td>
   <td style="text-align:right;"> 0.00025563 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9192376 </td>
   <td style="text-align:right;"> 0.9202396 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9255359 </td>
   <td style="text-align:right;"> 0.00023319 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9250788 </td>
   <td style="text-align:right;"> 0.9259929 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9309466 </td>
   <td style="text-align:right;"> 0.00021958 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9305162 </td>
   <td style="text-align:right;"> 0.9313769 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9359920 </td>
   <td style="text-align:right;"> 0.00021308 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9355743 </td>
   <td style="text-align:right;"> 0.9364096 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9406928 </td>
   <td style="text-align:right;"> 0.00021168 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9402779 </td>
   <td style="text-align:right;"> 0.9411077 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9450692 </td>
   <td style="text-align:right;"> 0.00021347 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9446508 </td>
   <td style="text-align:right;"> 0.9454876 </td>
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
   <td style="text-align:right;"> -0.00609502 </td>
   <td style="text-align:right;"> 0.00021703 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.00652039 </td>
   <td style="text-align:right;"> -0.00566965 </td>
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
   <td style="text-align:right;"> 7.958e-05 </td>
   <td style="text-align:right;"> 7.8e-07 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.806e-05 </td>
   <td style="text-align:right;"> 8.111e-05 </td>
  </tr>
</tbody>
</table>


## Proportion Correct Model

```
Call:
betareg::betareg(formula = formulas_proportion$M1, data = df, link = "loglog")

Quantile residuals:
    Min      1Q  Median      3Q     Max 
-5.9288 -0.6672  0.0046  0.6043  5.9378 

Coefficients (mean model with loglog link):
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           3.578e+00  3.027e-02 118.197  < 2e-16 ***
recurrenceRNN                        -2.719e-01  2.425e-02 -11.214  < 2e-16 ***
recurrenceGRU                        -4.922e-02  2.428e-02  -2.027   0.0427 *  
laminationsLaminated                  3.341e-02  1.327e-02   2.517   0.0118 *  
inputsize                            -2.331e-02  1.462e-03 -15.942  < 2e-16 ***
grammartypeLT                        -8.994e-01  3.674e-02 -24.478  < 2e-16 ***
grammartypeLTT                       -1.467e-01  3.479e-02  -4.217 2.47e-05 ***
grammartypeLTTO                      -5.914e-01  3.624e-02 -16.319  < 2e-16 ***
grammartypeMSO                       -3.072e+00  3.418e-02 -89.870  < 2e-16 ***
grammartypeCS                        -8.767e-01  3.053e-02 -28.714  < 2e-16 ***
grammartypeCF                        -1.353e+00  3.051e-02 -44.330  < 2e-16 ***
neurons                               1.020e-03  9.931e-06 102.727  < 2e-16 ***
layers                               -1.575e-01  2.818e-03 -55.878  < 2e-16 ***
recurrenceRNN:grammartypeLT           1.380e-01  2.965e-02   4.653 3.27e-06 ***
recurrenceGRU:grammartypeLT           2.920e-01  2.973e-02   9.820  < 2e-16 ***
recurrenceRNN:grammartypeLTT         -6.016e-02  2.772e-02  -2.170   0.0300 *  
recurrenceGRU:grammartypeLTT          1.392e-01  2.782e-02   5.006 5.57e-07 ***
recurrenceRNN:grammartypeLTTO         7.507e-02  2.936e-02   2.556   0.0106 *  
recurrenceGRU:grammartypeLTTO         4.037e-02  2.937e-02   1.375   0.1692    
recurrenceRNN:grammartypeMSO          6.967e-01  2.836e-02  24.566  < 2e-16 ***
recurrenceGRU:grammartypeMSO          7.974e-01  2.838e-02  28.095  < 2e-16 ***
recurrenceRNN:grammartypeCS           4.520e-01  2.480e-02  18.226  < 2e-16 ***
recurrenceGRU:grammartypeCS           1.113e+00  2.486e-02  44.768  < 2e-16 ***
recurrenceRNN:grammartypeCF           6.389e-02  2.495e-02   2.560   0.0105 *  
recurrenceGRU:grammartypeCF           3.421e-01  2.497e-02  13.700  < 2e-16 ***
grammartypeLT:laminationsLaminated    1.242e-02  1.285e-02   0.967   0.3336    
grammartypeLTT:laminationsLaminated  -1.573e-02  1.209e-02  -1.301   0.1933    
grammartypeLTTO:laminationsLaminated -3.215e-03  1.256e-02  -0.256   0.7980    
grammartypeMSO:laminationsLaminated  -2.306e-02  1.155e-02  -1.997   0.0458 *  
grammartypeCS:laminationsLaminated   -1.116e-01  1.027e-02 -10.864  < 2e-16 ***
grammartypeCF:laminationsLaminated   -4.263e-02  1.017e-02  -4.190 2.79e-05 ***
recurrenceRNN:laminationsLaminated   -9.881e-02  9.895e-03  -9.986  < 2e-16 ***
recurrenceGRU:laminationsLaminated   -1.975e-02  1.000e-02  -1.974   0.0484 *  
grammartypeLT:inputsize              -2.386e-02  1.933e-03 -12.345  < 2e-16 ***
grammartypeLTT:inputsize             -8.561e-02  1.842e-03 -46.473  < 2e-16 ***
grammartypeLTTO:inputsize            -2.191e-02  1.887e-03 -11.613  < 2e-16 ***
grammartypeMSO:inputsize              1.857e-01  1.733e-03 107.167  < 2e-16 ***
grammartypeCS:inputsize               9.975e-03  1.532e-03   6.511 7.48e-11 ***
grammartypeCF:inputsize               1.130e-01  1.516e-03  74.555  < 2e-16 ***

Phi coefficients (precision model with log link):
                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)           1.403e+00  1.922e-02  73.005   <2e-16 ***
recurrenceRNN        -3.580e-01  1.092e-02 -32.794   <2e-16 ***
recurrenceGRU        -1.477e-01  1.100e-02 -13.430   <2e-16 ***
laminationsLaminated -6.469e-03  4.472e-03  -1.447    0.148    
inputsize             4.136e-02  6.688e-04  61.840   <2e-16 ***
grammartypeLT         9.234e-01  1.342e-02  68.811   <2e-16 ***
grammartypeLTT        1.478e+00  1.335e-02 110.710   <2e-16 ***
grammartypeLTTO       1.271e+00  1.338e-02  94.968   <2e-16 ***
grammartypeMSO        2.920e-01  1.208e-02  24.178   <2e-16 ***
grammartypeCS         1.144e+00  1.137e-02 100.644   <2e-16 ***
grammartypeCF         1.462e+00  1.121e-02 130.361   <2e-16 ***
neurons               6.194e-04  1.455e-05  42.559   <2e-16 ***
layers               -1.037e-01  4.154e-03 -24.972   <2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

Type of estimator: ML (maximum likelihood)
Log-likelihood: 1.055e+06 on 52 Df
Pseudo R-squared: 0.1499
Number of iterations: 78 (BFGS) + 5 (Fisher scoring) 
```


### Recurrence-Grammar Interaction


#### Estimated Marginal Means (EMMs)

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Recurrence × Grammar Type EMMs (Proportion Correct)</caption>
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
   <td style="text-align:right;"> 0.9645310 </td>
   <td style="text-align:right;"> 0.00084467 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9628755 </td>
   <td style="text-align:right;"> 0.9661865 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9513921 </td>
   <td style="text-align:right;"> 0.00052195 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9503691 </td>
   <td style="text-align:right;"> 0.9524151 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9625031 </td>
   <td style="text-align:right;"> 0.00040944 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9617006 </td>
   <td style="text-align:right;"> 0.9633056 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9012838 </td>
   <td style="text-align:right;"> 0.00170000 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8979518 </td>
   <td style="text-align:right;"> 0.9046157 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8828166 </td>
   <td style="text-align:right;"> 0.00077627 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8812952 </td>
   <td style="text-align:right;"> 0.8843381 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9211140 </td>
   <td style="text-align:right;"> 0.00057230 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9199923 </td>
   <td style="text-align:right;"> 0.9222357 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9275305 </td>
   <td style="text-align:right;"> 0.00104064 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9254909 </td>
   <td style="text-align:right;"> 0.9295701 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8951629 </td>
   <td style="text-align:right;"> 0.00058821 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8940100 </td>
   <td style="text-align:right;"> 0.8963158 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9328776 </td>
   <td style="text-align:right;"> 0.00042107 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9320523 </td>
   <td style="text-align:right;"> 0.9337029 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9269952 </td>
   <td style="text-align:right;"> 0.00124194 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9245610 </td>
   <td style="text-align:right;"> 0.9294293 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9075900 </td>
   <td style="text-align:right;"> 0.00059658 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9064207 </td>
   <td style="text-align:right;"> 0.9087593 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9256694 </td>
   <td style="text-align:right;"> 0.00048629 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9247163 </td>
   <td style="text-align:right;"> 0.9266226 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8007194 </td>
   <td style="text-align:right;"> 0.00282328 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.7951859 </td>
   <td style="text-align:right;"> 0.8062529 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8540124 </td>
   <td style="text-align:right;"> 0.00078254 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8524786 </td>
   <td style="text-align:right;"> 0.8555461 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8985209 </td>
   <td style="text-align:right;"> 0.00058930 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8973659 </td>
   <td style="text-align:right;"> 0.8996759 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9175340 </td>
   <td style="text-align:right;"> 0.00073947 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9160846 </td>
   <td style="text-align:right;"> 0.9189833 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9273973 </td>
   <td style="text-align:right;"> 0.00026797 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9268720 </td>
   <td style="text-align:right;"> 0.9279225 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9705957 </td>
   <td style="text-align:right;"> 0.00014271 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9703160 </td>
   <td style="text-align:right;"> 0.9708754 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9352559 </td>
   <td style="text-align:right;"> 0.00064749 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9339869 </td>
   <td style="text-align:right;"> 0.9365250 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9174200 </td>
   <td style="text-align:right;"> 0.00025187 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9169263 </td>
   <td style="text-align:right;"> 0.9179137 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9513497 </td>
   <td style="text-align:right;"> 0.00017252 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9510116 </td>
   <td style="text-align:right;"> 0.9516879 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Architectures By Grammar Type (Proportion Correct)</caption>
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
   <td style="text-align:right;"> 0.01313889 </td>
   <td style="text-align:right;"> 0.00087201 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 15.067389 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.00202788 </td>
   <td style="text-align:right;"> 0.00083941 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.415830 </td>
   <td style="text-align:right;"> 0.04154531 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.01111101 </td>
   <td style="text-align:right;"> 0.00043591 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -25.489440 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.01846714 </td>
   <td style="text-align:right;"> 0.00181372 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 10.181898 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.01983024 </td>
   <td style="text-align:right;"> 0.00174989 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.332298 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.03829738 </td>
   <td style="text-align:right;"> 0.00087959 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -43.540166 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.03236761 </td>
   <td style="text-align:right;"> 0.00113242 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 28.582806 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.00534710 </td>
   <td style="text-align:right;"> 0.00107438 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -4.976904 </td>
   <td style="text-align:right;"> 0.00000193 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.03771471 </td>
   <td style="text-align:right;"> 0.00066682 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -56.559234 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.01940517 </td>
   <td style="text-align:right;"> 0.00133508 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 14.534788 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.00132572 </td>
   <td style="text-align:right;"> 0.00129711 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.022060 </td>
   <td style="text-align:right;"> 0.56289220 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.01807945 </td>
   <td style="text-align:right;"> 0.00070768 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -25.547344 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.05329298 </td>
   <td style="text-align:right;"> 0.00293137 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -18.180212 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.09780150 </td>
   <td style="text-align:right;"> 0.00288620 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -33.885934 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.04450851 </td>
   <td style="text-align:right;"> 0.00087847 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -50.665662 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.00986330 </td>
   <td style="text-align:right;"> 0.00077083 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.795612 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.05306176 </td>
   <td style="text-align:right;"> 0.00074395 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -71.324355 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.04319846 </td>
   <td style="text-align:right;"> 0.00027444 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -157.403652 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.01783594 </td>
   <td style="text-align:right;"> 0.00069662 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 25.603694 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.01609381 </td>
   <td style="text-align:right;"> 0.00067049 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -24.003132 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.03392975 </td>
   <td style="text-align:right;"> 0.00028602 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -118.626717 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Types By Architecture (Proportion Correct)</caption>
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
   <td style="text-align:right;"> 0.06324721 </td>
   <td style="text-align:right;"> 0.00186608 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 33.8931484 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.03700047 </td>
   <td style="text-align:right;"> 0.00131832 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 28.0664185 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.03753582 </td>
   <td style="text-align:right;"> 0.00147181 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 25.5032263 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.16381160 </td>
   <td style="text-align:right;"> 0.00287376 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 57.0024678 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.04699703 </td>
   <td style="text-align:right;"> 0.00106564 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 44.1021841 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.02927505 </td>
   <td style="text-align:right;"> 0.00100216 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 29.2120982 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.02624674 </td>
   <td style="text-align:right;"> 0.00197819 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -13.2680409 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.02571139 </td>
   <td style="text-align:right;"> 0.00208566 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.3276800 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.10056439 </td>
   <td style="text-align:right;"> 0.00324234 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 31.0159768 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.01625018 </td>
   <td style="text-align:right;"> 0.00182257 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.9160942 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.03397216 </td>
   <td style="text-align:right;"> 0.00178950 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -18.9841421 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.00053535 </td>
   <td style="text-align:right;"> 0.00160680 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.3331771 </td>
   <td style="text-align:right;"> 0.99989129 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.12681113 </td>
   <td style="text-align:right;"> 0.00298051 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 42.5468056 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.00999656 </td>
   <td style="text-align:right;"> 0.00125261 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.9805535 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.00772542 </td>
   <td style="text-align:right;"> 0.00120377 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.4176734 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.12627578 </td>
   <td style="text-align:right;"> 0.00304206 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 41.5099607 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.00946121 </td>
   <td style="text-align:right;"> 0.00141611 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.6811358 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.00826077 </td>
   <td style="text-align:right;"> 0.00137186 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.0215843 </td>
   <td style="text-align:right;"> 0.00000004 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.11681457 </td>
   <td style="text-align:right;"> 0.00285733 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -40.8823883 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.13453655 </td>
   <td style="text-align:right;"> 0.00283169 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -47.5110011 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.01772198 </td>
   <td style="text-align:right;"> 0.00092624 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -19.1332608 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.06857547 </td>
   <td style="text-align:right;"> 0.00092704 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 73.9722368 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.05622920 </td>
   <td style="text-align:right;"> 0.00077993 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 72.0950460 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.04380211 </td>
   <td style="text-align:right;"> 0.00078496 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 55.8020258 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.09737973 </td>
   <td style="text-align:right;"> 0.00092939 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 104.7777648 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.02399485 </td>
   <td style="text-align:right;"> 0.00057717 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 41.5732111 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.03397210 </td>
   <td style="text-align:right;"> 0.00057142 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 59.4524150 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.01234627 </td>
   <td style="text-align:right;"> 0.00096859 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.7465891 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.02477336 </td>
   <td style="text-align:right;"> 0.00097285 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -25.4647797 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.02880426 </td>
   <td style="text-align:right;"> 0.00109390 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 26.3316203 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.04458063 </td>
   <td style="text-align:right;"> 0.00081458 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -54.7285925 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.03460337 </td>
   <td style="text-align:right;"> 0.00081081 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -42.6773140 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.01242709 </td>
   <td style="text-align:right;"> 0.00083297 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -14.9190348 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.04115053 </td>
   <td style="text-align:right;"> 0.00097420 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 42.2402404 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.03223435 </td>
   <td style="text-align:right;"> 0.00064084 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -50.3003530 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.02225710 </td>
   <td style="text-align:right;"> 0.00063597 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -34.9972411 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.05357763 </td>
   <td style="text-align:right;"> 0.00097656 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 54.8638318 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.01980726 </td>
   <td style="text-align:right;"> 0.00064749 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -30.5909314 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.00983001 </td>
   <td style="text-align:right;"> 0.00064229 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -15.3045810 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.07338489 </td>
   <td style="text-align:right;"> 0.00081851 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -89.6561979 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.06340763 </td>
   <td style="text-align:right;"> 0.00081212 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -78.0769351 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.00997726 </td>
   <td style="text-align:right;"> 0.00035895 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 27.7960259 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.04138910 </td>
   <td style="text-align:right;"> 0.00069498 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 59.5540024 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.02962550 </td>
   <td style="text-align:right;"> 0.00058069 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 51.0179804 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.03683367 </td>
   <td style="text-align:right;"> 0.00062852 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 58.6039385 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.06398223 </td>
   <td style="text-align:right;"> 0.00070529 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 90.7177534 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.00809260 </td>
   <td style="text-align:right;"> 0.00042398 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -19.0874452 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.01115337 </td>
   <td style="text-align:right;"> 0.00043611 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 25.5747069 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.01176360 </td>
   <td style="text-align:right;"> 0.00070485 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -16.6895762 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.00455543 </td>
   <td style="text-align:right;"> 0.00074482 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.1161284 </td>
   <td style="text-align:right;"> 0.00000002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.02259313 </td>
   <td style="text-align:right;"> 0.00081133 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 27.8469078 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.04948171 </td>
   <td style="text-align:right;"> 0.00058277 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -84.9070717 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.03023574 </td>
   <td style="text-align:right;"> 0.00059182 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -51.0892077 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.00720817 </td>
   <td style="text-align:right;"> 0.00063856 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 11.2882148 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.03435673 </td>
   <td style="text-align:right;"> 0.00071790 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 47.8571564 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.03771810 </td>
   <td style="text-align:right;"> 0.00043867 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -85.9826888 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.01847214 </td>
   <td style="text-align:right;"> 0.00045041 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -41.0121240 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.02714856 </td>
   <td style="text-align:right;"> 0.00075599 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 35.9112001 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.04492627 </td>
   <td style="text-align:right;"> 0.00050067 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -89.7318326 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.02568030 </td>
   <td style="text-align:right;"> 0.00051089 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -50.2658334 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.07207483 </td>
   <td style="text-align:right;"> 0.00059624 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -120.8813936 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.05282887 </td>
   <td style="text-align:right;"> 0.00060381 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -87.4932049 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.01924597 </td>
   <td style="text-align:right;"> 0.00021251 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 90.5650992 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

### Laminations-Grammar Interaction


#### Estimated Marginal Means (EMMs)

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Laminations × Grammar EMMs (Proportion Correct)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> laminations </th>
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
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9597157 </td>
   <td style="text-align:right;"> 0.00048529 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9587645 </td>
   <td style="text-align:right;"> 0.9606668 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9592351 </td>
   <td style="text-align:right;"> 0.00049512 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9582647 </td>
   <td style="text-align:right;"> 0.9602055 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9016535 </td>
   <td style="text-align:right;"> 0.00080721 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9000714 </td>
   <td style="text-align:right;"> 0.9032356 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9018227 </td>
   <td style="text-align:right;"> 0.00082973 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9001965 </td>
   <td style="text-align:right;"> 0.9034490 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9196756 </td>
   <td style="text-align:right;"> 0.00054437 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9186087 </td>
   <td style="text-align:right;"> 0.9207426 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9173718 </td>
   <td style="text-align:right;"> 0.00057201 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9162506 </td>
   <td style="text-align:right;"> 0.9184929 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9205994 </td>
   <td style="text-align:right;"> 0.00060869 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9194064 </td>
   <td style="text-align:right;"> 0.9217924 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9195703 </td>
   <td style="text-align:right;"> 0.00063128 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9183330 </td>
   <td style="text-align:right;"> 0.9208076 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8531739 </td>
   <td style="text-align:right;"> 0.00111166 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8509951 </td>
   <td style="text-align:right;"> 0.8553527 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8489945 </td>
   <td style="text-align:right;"> 0.00116804 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8467052 </td>
   <td style="text-align:right;"> 0.8512838 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9420365 </td>
   <td style="text-align:right;"> 0.00030927 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9414304 </td>
   <td style="text-align:right;"> 0.9426427 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9349814 </td>
   <td style="text-align:right;"> 0.00035294 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9342897 </td>
   <td style="text-align:right;"> 0.9356731 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9364406 </td>
   <td style="text-align:right;"> 0.00027778 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9358962 </td>
   <td style="text-align:right;"> 0.9369850 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9329098 </td>
   <td style="text-align:right;"> 0.00030032 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9323212 </td>
   <td style="text-align:right;"> 0.9334985 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Laminations By Grammar Type (Proportion Correct)</caption>
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
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.00048056 </td>
   <td style="text-align:right;"> 0.00039849 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.2059617 </td>
   <td style="text-align:right;"> 0.22783225 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.00016920 </td>
   <td style="text-align:right;"> 0.00086799 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.1949337 </td>
   <td style="text-align:right;"> 0.84544488 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.00230386 </td>
   <td style="text-align:right;"> 0.00062131 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.7080533 </td>
   <td style="text-align:right;"> 0.00020886 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.00102911 </td>
   <td style="text-align:right;"> 0.00067393 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.5270265 </td>
   <td style="text-align:right;"> 0.12675442 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.00417942 </td>
   <td style="text-align:right;"> 0.00107570 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.8852824 </td>
   <td style="text-align:right;"> 0.00010221 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.00705515 </td>
   <td style="text-align:right;"> 0.00036329 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 19.4200498 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.00353079 </td>
   <td style="text-align:right;"> 0.00032137 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 10.9865738 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Types By Laminations (Proportion Correct)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> contrast </th>
   <th style="text-align:left;"> laminations </th>
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
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.05806214 </td>
   <td style="text-align:right;"> 0.00092720 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 62.620810 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.04004008 </td>
   <td style="text-align:right;"> 0.00071820 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 55.750266 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.03911626 </td>
   <td style="text-align:right;"> 0.00076540 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 51.105660 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.10654176 </td>
   <td style="text-align:right;"> 0.00118578 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 89.849723 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.01767913 </td>
   <td style="text-align:right;"> 0.00055327 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 31.954113 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.02327506 </td>
   <td style="text-align:right;"> 0.00053943 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 43.147887 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.01802207 </td>
   <td style="text-align:right;"> 0.00096134 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -18.746809 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.01894589 </td>
   <td style="text-align:right;"> 0.00099732 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -18.996891 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.04847962 </td>
   <td style="text-align:right;"> 0.00134562 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 36.027600 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.04038301 </td>
   <td style="text-align:right;"> 0.00084472 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -47.806223 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.03478708 </td>
   <td style="text-align:right;"> 0.00083782 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -41.520985 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.00092382 </td>
   <td style="text-align:right;"> 0.00080587 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.146368 </td>
   <td style="text-align:right;"> 0.91364908 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.06650169 </td>
   <td style="text-align:right;"> 0.00121957 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 54.528623 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.02236095 </td>
   <td style="text-align:right;"> 0.00060880 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -36.729516 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.01676501 </td>
   <td style="text-align:right;"> 0.00059787 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -28.041324 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.06742550 </td>
   <td style="text-align:right;"> 0.00124459 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 54.174897 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.02143713 </td>
   <td style="text-align:right;"> 0.00066436 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -32.267412 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.01584120 </td>
   <td style="text-align:right;"> 0.00065397 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -24.223231 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.08886263 </td>
   <td style="text-align:right;"> 0.00112309 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -79.123680 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.08326670 </td>
   <td style="text-align:right;"> 0.00111615 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -74.601521 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.00559593 </td>
   <td style="text-align:right;"> 0.00038523 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 14.526338 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.05741238 </td>
   <td style="text-align:right;"> 0.00094694 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 60.629555 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.04186337 </td>
   <td style="text-align:right;"> 0.00074125 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 56.477091 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.03966481 </td>
   <td style="text-align:right;"> 0.00078505 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 50.525308 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.11024062 </td>
   <td style="text-align:right;"> 0.00123531 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 89.241459 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.02425372 </td>
   <td style="text-align:right;"> 0.00057855 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 41.921669 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.02632529 </td>
   <td style="text-align:right;"> 0.00055386 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 47.530925 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.01554901 </td>
   <td style="text-align:right;"> 0.00098753 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -15.745386 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.01774757 </td>
   <td style="text-align:right;"> 0.00102081 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -17.385693 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.05282824 </td>
   <td style="text-align:right;"> 0.00138983 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 38.010650 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.03315866 </td>
   <td style="text-align:right;"> 0.00087020 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -38.104725 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.03108710 </td>
   <td style="text-align:right;"> 0.00085738 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -36.258319 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.00219856 </td>
   <td style="text-align:right;"> 0.00083403 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.636076 </td>
   <td style="text-align:right;"> 0.11523785 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.06837724 </td>
   <td style="text-align:right;"> 0.00127058 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 53.815953 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.01760966 </td>
   <td style="text-align:right;"> 0.00064384 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -27.350894 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.01553809 </td>
   <td style="text-align:right;"> 0.00062384 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -24.907295 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.07057581 </td>
   <td style="text-align:right;"> 0.00129296 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 54.584717 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.01541109 </td>
   <td style="text-align:right;"> 0.00069395 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -22.207863 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.01333952 </td>
   <td style="text-align:right;"> 0.00067528 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -19.754149 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.08598690 </td>
   <td style="text-align:right;"> 0.00117280 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -73.317863 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.08391533 </td>
   <td style="text-align:right;"> 0.00116383 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -72.102995 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.00207157 </td>
   <td style="text-align:right;"> 0.00041739 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.963169 </td>
   <td style="text-align:right;"> 0.00001435 </td>
  </tr>
</tbody>
</table>

### Recurrence-Laminations Interaction


#### Estimated Marginal Means (EMMs)

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Laminations × Recurrence EMMs (Proportion Correct)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> laminations </th>
   <th style="text-align:left;"> recurrence </th>
   <th style="text-align:right;"> emmean </th>
   <th style="text-align:right;"> SE </th>
   <th style="text-align:right;"> df </th>
   <th style="text-align:right;"> asymp.LCL </th>
   <th style="text-align:right;"> asymp.UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.9103332 </td>
   <td style="text-align:right;"> 0.00069395 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9089731 </td>
   <td style="text-align:right;"> 0.9116933 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.9107667 </td>
   <td style="text-align:right;"> 0.00076396 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9092694 </td>
   <td style="text-align:right;"> 0.9122640 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.9091319 </td>
   <td style="text-align:right;"> 0.00028656 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9085703 </td>
   <td style="text-align:right;"> 0.9096936 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.9010942 </td>
   <td style="text-align:right;"> 0.00029953 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9005071 </td>
   <td style="text-align:right;"> 0.9016812 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9376615 </td>
   <td style="text-align:right;"> 0.00022173 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9372269 </td>
   <td style="text-align:right;"> 0.9380960 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9373759 </td>
   <td style="text-align:right;"> 0.00022126 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9369422 </td>
   <td style="text-align:right;"> 0.9378095 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Recurrence By Lamination (Proportion Correct)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> contrast </th>
   <th style="text-align:left;"> laminations </th>
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
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.00120129 </td>
   <td style="text-align:right;"> 0.00073647 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.631151 </td>
   <td style="text-align:right;"> 0.2324862 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.02732824 </td>
   <td style="text-align:right;"> 0.00071704 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -38.112490 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.02852953 </td>
   <td style="text-align:right;"> 0.00032299 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -88.329719 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.00967256 </td>
   <td style="text-align:right;"> 0.00080200 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 12.060473 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.02660913 </td>
   <td style="text-align:right;"> 0.00078101 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -34.070358 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.03628169 </td>
   <td style="text-align:right;"> 0.00033319 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -108.892825 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Types By Architecture (Proportion Correct)</caption>
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
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.00043350 </td>
   <td style="text-align:right;"> 0.00079218 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.5472255 </td>
   <td style="text-align:right;"> 0.5842238 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.00803777 </td>
   <td style="text-align:right;"> 0.00036695 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 21.9044917 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.00028560 </td>
   <td style="text-align:right;"> 0.00027235 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.0486418 </td>
   <td style="text-align:right;"> 0.2943430 </td>
  </tr>
</tbody>
</table>

### Input Size 

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Input Size × Grammar EMMs (Inverse Brier Score)</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> inputsize </th>
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
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9644973 </td>
   <td style="text-align:right;"> 0.00054596 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9634273 </td>
   <td style="text-align:right;"> 0.9655674 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9636724 </td>
   <td style="text-align:right;"> 0.00052221 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9626489 </td>
   <td style="text-align:right;"> 0.9646959 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9628291 </td>
   <td style="text-align:right;"> 0.00050012 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9618488 </td>
   <td style="text-align:right;"> 0.9638093 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9619669 </td>
   <td style="text-align:right;"> 0.00048053 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9610251 </td>
   <td style="text-align:right;"> 0.9629087 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9610856 </td>
   <td style="text-align:right;"> 0.00046441 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9601754 </td>
   <td style="text-align:right;"> 0.9619958 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9601848 </td>
   <td style="text-align:right;"> 0.00045290 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9592971 </td>
   <td style="text-align:right;"> 0.9610724 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9592639 </td>
   <td style="text-align:right;"> 0.00044718 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9583875 </td>
   <td style="text-align:right;"> 0.9601404 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9583228 </td>
   <td style="text-align:right;"> 0.00044838 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9574440 </td>
   <td style="text-align:right;"> 0.9592016 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9573608 </td>
   <td style="text-align:right;"> 0.00045742 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9564643 </td>
   <td style="text-align:right;"> 0.9582574 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9563777 </td>
   <td style="text-align:right;"> 0.00047486 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9554470 </td>
   <td style="text-align:right;"> 0.9573084 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9553730 </td>
   <td style="text-align:right;"> 0.00050087 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9543913 </td>
   <td style="text-align:right;"> 0.9563547 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9543463 </td>
   <td style="text-align:right;"> 0.00053525 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9532973 </td>
   <td style="text-align:right;"> 0.9553954 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9243453 </td>
   <td style="text-align:right;"> 0.00094594 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9224912 </td>
   <td style="text-align:right;"> 0.9261993 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9208031 </td>
   <td style="text-align:right;"> 0.00089897 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9190411 </td>
   <td style="text-align:right;"> 0.9225650 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9171103 </td>
   <td style="text-align:right;"> 0.00085033 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9154437 </td>
   <td style="text-align:right;"> 0.9187769 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9132619 </td>
   <td style="text-align:right;"> 0.00080178 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9116905 </td>
   <td style="text-align:right;"> 0.9148334 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9092530 </td>
   <td style="text-align:right;"> 0.00075595 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9077714 </td>
   <td style="text-align:right;"> 0.9107346 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9050785 </td>
   <td style="text-align:right;"> 0.00071666 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9036739 </td>
   <td style="text-align:right;"> 0.9064831 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9007334 </td>
   <td style="text-align:right;"> 0.00068909 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8993828 </td>
   <td style="text-align:right;"> 0.9020840 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8962128 </td>
   <td style="text-align:right;"> 0.00067946 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8948810 </td>
   <td style="text-align:right;"> 0.8975445 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8915116 </td>
   <td style="text-align:right;"> 0.00069395 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8901515 </td>
   <td style="text-align:right;"> 0.8928717 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8866250 </td>
   <td style="text-align:right;"> 0.00073696 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8851806 </td>
   <td style="text-align:right;"> 0.8880694 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8815482 </td>
   <td style="text-align:right;"> 0.00080996 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8799607 </td>
   <td style="text-align:right;"> 0.8831357 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8762765 </td>
   <td style="text-align:right;"> 0.00091177 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8744895 </td>
   <td style="text-align:right;"> 0.8780636 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9561772 </td>
   <td style="text-align:right;"> 0.00048988 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9552171 </td>
   <td style="text-align:right;"> 0.9571373 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9511221 </td>
   <td style="text-align:right;"> 0.00049188 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9501580 </td>
   <td style="text-align:right;"> 0.9520862 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9455186 </td>
   <td style="text-align:right;"> 0.00048994 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9445583 </td>
   <td style="text-align:right;"> 0.9464788 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9393153 </td>
   <td style="text-align:right;"> 0.00048434 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9383661 </td>
   <td style="text-align:right;"> 0.9402646 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9324583 </td>
   <td style="text-align:right;"> 0.00047617 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9315251 </td>
   <td style="text-align:right;"> 0.9333916 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9248910 </td>
   <td style="text-align:right;"> 0.00046783 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9239740 </td>
   <td style="text-align:right;"> 0.9258079 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9165546 </td>
   <td style="text-align:right;"> 0.00046371 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9156457 </td>
   <td style="text-align:right;"> 0.9174634 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9073890 </td>
   <td style="text-align:right;"> 0.00047069 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9064665 </td>
   <td style="text-align:right;"> 0.9083115 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8973336 </td>
   <td style="text-align:right;"> 0.00049769 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8963581 </td>
   <td style="text-align:right;"> 0.8983090 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8863278 </td>
   <td style="text-align:right;"> 0.00055354 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8852429 </td>
   <td style="text-align:right;"> 0.8874127 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8743130 </td>
   <td style="text-align:right;"> 0.00064417 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8730504 </td>
   <td style="text-align:right;"> 0.8755755 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8612332 </td>
   <td style="text-align:right;"> 0.00077180 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8597206 </td>
   <td style="text-align:right;"> 0.8627459 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9379699 </td>
   <td style="text-align:right;"> 0.00072191 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9365550 </td>
   <td style="text-align:right;"> 0.9393849 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9351645 </td>
   <td style="text-align:right;"> 0.00068402 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9338238 </td>
   <td style="text-align:right;"> 0.9365052 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9322414 </td>
   <td style="text-align:right;"> 0.00064492 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9309774 </td>
   <td style="text-align:right;"> 0.9335054 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9291967 </td>
   <td style="text-align:right;"> 0.00060600 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9280090 </td>
   <td style="text-align:right;"> 0.9303844 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9260261 </td>
   <td style="text-align:right;"> 0.00056940 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9249101 </td>
   <td style="text-align:right;"> 0.9271421 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9227255 </td>
   <td style="text-align:right;"> 0.00053824 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9216706 </td>
   <td style="text-align:right;"> 0.9237804 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9192906 </td>
   <td style="text-align:right;"> 0.00051675 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9182778 </td>
   <td style="text-align:right;"> 0.9203035 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9157172 </td>
   <td style="text-align:right;"> 0.00051004 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9147175 </td>
   <td style="text-align:right;"> 0.9167168 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9120008 </td>
   <td style="text-align:right;"> 0.00052304 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9109757 </td>
   <td style="text-align:right;"> 0.9130259 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9081372 </td>
   <td style="text-align:right;"> 0.00055906 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9070415 </td>
   <td style="text-align:right;"> 0.9092329 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9041220 </td>
   <td style="text-align:right;"> 0.00061893 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9029089 </td>
   <td style="text-align:right;"> 0.9053351 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8999508 </td>
   <td style="text-align:right;"> 0.00070138 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8985761 </td>
   <td style="text-align:right;"> 0.9013255 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.6821921 </td>
   <td style="text-align:right;"> 0.00232992 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.6776255 </td>
   <td style="text-align:right;"> 0.6867586 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7176528 </td>
   <td style="text-align:right;"> 0.00203588 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.7136626 </td>
   <td style="text-align:right;"> 0.7216431 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7506534 </td>
   <td style="text-align:right;"> 0.00176249 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.7471990 </td>
   <td style="text-align:right;"> 0.7541078 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7810225 </td>
   <td style="text-align:right;"> 0.00151670 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.7780498 </td>
   <td style="text-align:right;"> 0.7839951 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8086804 </td>
   <td style="text-align:right;"> 0.00130281 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8061269 </td>
   <td style="text-align:right;"> 0.8112338 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8336290 </td>
   <td style="text-align:right;"> 0.00112237 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8314292 </td>
   <td style="text-align:right;"> 0.8358288 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8559381 </td>
   <td style="text-align:right;"> 0.00097438 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8540283 </td>
   <td style="text-align:right;"> 0.8578478 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8757303 </td>
   <td style="text-align:right;"> 0.00085564 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8740532 </td>
   <td style="text-align:right;"> 0.8774073 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8931660 </td>
   <td style="text-align:right;"> 0.00076140 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8916737 </td>
   <td style="text-align:right;"> 0.8946584 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9084299 </td>
   <td style="text-align:right;"> 0.00068625 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9070849 </td>
   <td style="text-align:right;"> 0.9097749 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9217187 </td>
   <td style="text-align:right;"> 0.00062497 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9204938 </td>
   <td style="text-align:right;"> 0.9229436 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9332321 </td>
   <td style="text-align:right;"> 0.00057317 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9321087 </td>
   <td style="text-align:right;"> 0.9343555 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9427578 </td>
   <td style="text-align:right;"> 0.00042704 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9419209 </td>
   <td style="text-align:right;"> 0.9435948 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9420418 </td>
   <td style="text-align:right;"> 0.00039658 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9412646 </td>
   <td style="text-align:right;"> 0.9428191 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9413175 </td>
   <td style="text-align:right;"> 0.00036710 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9405980 </td>
   <td style="text-align:right;"> 0.9420371 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9405848 </td>
   <td style="text-align:right;"> 0.00033920 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9399200 </td>
   <td style="text-align:right;"> 0.9412497 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9398437 </td>
   <td style="text-align:right;"> 0.00031368 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9392289 </td>
   <td style="text-align:right;"> 0.9404584 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9390939 </td>
   <td style="text-align:right;"> 0.00029158 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9385224 </td>
   <td style="text-align:right;"> 0.9396654 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9383355 </td>
   <td style="text-align:right;"> 0.00027422 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9377980 </td>
   <td style="text-align:right;"> 0.9388730 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9375684 </td>
   <td style="text-align:right;"> 0.00026306 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9370528 </td>
   <td style="text-align:right;"> 0.9380840 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9367925 </td>
   <td style="text-align:right;"> 0.00025943 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9362840 </td>
   <td style="text-align:right;"> 0.9373009 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9360076 </td>
   <td style="text-align:right;"> 0.00026422 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9354898 </td>
   <td style="text-align:right;"> 0.9365255 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9352139 </td>
   <td style="text-align:right;"> 0.00027754 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9346699 </td>
   <td style="text-align:right;"> 0.9357578 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9344110 </td>
   <td style="text-align:right;"> 0.00029878 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9338254 </td>
   <td style="text-align:right;"> 0.9349966 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8929150 </td>
   <td style="text-align:right;"> 0.00058040 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.8917774 </td>
   <td style="text-align:right;"> 0.8940525 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9015296 </td>
   <td style="text-align:right;"> 0.00049433 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9005608 </td>
   <td style="text-align:right;"> 0.9024985 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9095243 </td>
   <td style="text-align:right;"> 0.00042013 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9087009 </td>
   <td style="text-align:right;"> 0.9103477 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9169321 </td>
   <td style="text-align:right;"> 0.00035743 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9162315 </td>
   <td style="text-align:right;"> 0.9176326 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9237862 </td>
   <td style="text-align:right;"> 0.00030589 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9231867 </td>
   <td style="text-align:right;"> 0.9243858 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9301198 </td>
   <td style="text-align:right;"> 0.00026509 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9296002 </td>
   <td style="text-align:right;"> 0.9306393 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9359650 </td>
   <td style="text-align:right;"> 0.00023439 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9355056 </td>
   <td style="text-align:right;"> 0.9364244 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9413535 </td>
   <td style="text-align:right;"> 0.00021281 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9409365 </td>
   <td style="text-align:right;"> 0.9417706 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9463158 </td>
   <td style="text-align:right;"> 0.00019890 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9459259 </td>
   <td style="text-align:right;"> 0.9467056 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9508811 </td>
   <td style="text-align:right;"> 0.00019090 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9505069 </td>
   <td style="text-align:right;"> 0.9512552 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9550774 </td>
   <td style="text-align:right;"> 0.00018697 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9547109 </td>
   <td style="text-align:right;"> 0.9554438 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9589314 </td>
   <td style="text-align:right;"> 0.00018549 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9585678 </td>
   <td style="text-align:right;"> 0.9592950 </td>
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
   <td style="text-align:right;"> -0.01220787 </td>
   <td style="text-align:right;"> 0.00022215 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.01264329 </td>
   <td style="text-align:right;"> -0.01177246 </td>
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
   <td style="text-align:right;"> 7.861e-05 </td>
   <td style="text-align:right;"> 7.9e-07 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.707e-05 </td>
   <td style="text-align:right;"> 8.016e-05 </td>
  </tr>
</tbody>
</table>



