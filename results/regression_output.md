# Beta‑Regression Model Selection Report

*Generated on: 2025‑08‑08 15:43*

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
 M1: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons + layers |     recurrence + laminations + inputsize + grammartype + neurons +         layers

M2: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +     inputsize:grammartype + recurrence + laminations + inputsize +     grammartype + neurons + layers | recurrence + laminations +     inputsize + grammartype + neurons + layers

M3: Proportion_Correct ~ recurrence:grammartype + recurrence:laminations +     inputsize:grammartype + recurrence + laminations + inputsize +     grammartype + neurons + layers | recurrence + laminations +     inputsize + grammartype + neurons + layers

M4: Proportion_Correct ~ laminations:grammartype + recurrence:laminations +     inputsize:grammartype + recurrence + laminations + inputsize +     grammartype + neurons + layers | recurrence + laminations +     inputsize + grammartype + neurons + layers

M5: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + recurrence + laminations + inputsize +     grammartype + neurons + layers | recurrence + laminations +     inputsize + grammartype + neurons + layers

M6: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + neurons | recurrence +     laminations + inputsize + grammartype + neurons + layers

M7: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype + layers | recurrence +     laminations + inputsize + grammartype + neurons + layers

M8: Proportion_Correct ~ recurrence:grammartype + laminations:grammartype +     recurrence:laminations + inputsize:grammartype + recurrence +     laminations + inputsize + grammartype | recurrence + laminations +     inputsize + grammartype + neurons + layers 
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
   <th style="text-align:right;"> RMSE M1 (Loglog link) </th>
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
   <th style="text-align:right;"> RMSE M1 (Loglog link) </th>
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
betareg::betareg(formula = .x, data = df, link = "loglog")

Quantile residuals:
    Min      1Q  Median      3Q     Max 
-5.0637 -0.6662  0.1299  0.7385  3.7675 

Coefficients (mean model with loglog link):
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           4.200e+00  4.562e-02  92.067  < 2e-16 ***
recurrenceRNN                        -1.789e-01  3.787e-02  -4.724 2.31e-06 ***
recurrenceGRU                         3.584e-01  3.767e-02   9.515  < 2e-16 ***
laminationsLaminated                  4.263e-02  1.824e-02   2.337 0.019453 *  
inputsize                            -1.552e-01  2.464e-03 -63.005  < 2e-16 ***
grammartypeLT                        -1.515e+00  5.238e-02 -28.915  < 2e-16 ***
grammartypeLTT                       -1.217e+00  4.943e-02 -24.621  < 2e-16 ***
grammartypeLTTO                      -1.422e+00  5.191e-02 -27.393  < 2e-16 ***
grammartypeMSO                       -3.632e+00  4.818e-02 -75.379  < 2e-16 ***
grammartypeCS                        -1.761e+00  4.665e-02 -37.751  < 2e-16 ***
grammartypeCF                        -2.496e+00  4.665e-02 -53.507  < 2e-16 ***
neurons                               8.845e-04  8.561e-06 103.308  < 2e-16 ***
layers                               -7.203e-02  2.400e-03 -30.015  < 2e-16 ***
recurrenceRNN:grammartypeLT          -2.996e-02  4.363e-02  -0.687 0.492264    
recurrenceGRU:grammartypeLT          -1.296e-01  4.340e-02  -2.987 0.002818 ** 
recurrenceRNN:grammartypeLTT         -1.012e-01  4.092e-02  -2.473 0.013389 *  
recurrenceGRU:grammartypeLTT         -2.085e-01  4.061e-02  -5.135 2.82e-07 ***
recurrenceRNN:grammartypeLTTO        -3.402e-02  4.345e-02  -0.783 0.433539    
recurrenceGRU:grammartypeLTTO        -2.840e-01  4.311e-02  -6.588 4.45e-11 ***
recurrenceRNN:grammartypeMSO          3.996e-01  3.966e-02  10.076  < 2e-16 ***
recurrenceGRU:grammartypeMSO         -1.208e-01  3.958e-02  -3.051 0.002277 ** 
recurrenceRNN:grammartypeCS           3.757e-01  3.856e-02   9.742  < 2e-16 ***
recurrenceGRU:grammartypeCS           2.754e-01  3.842e-02   7.169 7.54e-13 ***
recurrenceRNN:grammartypeCF           2.033e-01  3.889e-02   5.227 1.72e-07 ***
recurrenceGRU:grammartypeCF           8.628e-02  3.869e-02   2.230 0.025737 *  
grammartypeLT:laminationsLaminated    5.148e-02  1.909e-02   2.697 0.006996 ** 
grammartypeLTT:laminationsLaminated   1.305e-02  1.801e-02   0.724 0.468848    
grammartypeLTTO:laminationsLaminated  1.952e-02  1.877e-02   1.040 0.298341    
grammartypeMSO:laminationsLaminated   1.605e-02  1.791e-02   0.896 0.370244    
grammartypeCS:laminationsLaminated   -6.212e-02  1.711e-02  -3.630 0.000283 ***
grammartypeCF:laminationsLaminated   -2.761e-02  1.691e-02  -1.633 0.102423    
recurrenceRNN:laminationsLaminated   -1.501e-01  8.948e-03 -16.773  < 2e-16 ***
recurrenceGRU:laminationsLaminated   -8.175e-02  9.037e-03  -9.046  < 2e-16 ***
grammartypeLT:inputsize               7.680e-02  2.875e-03  26.710  < 2e-16 ***
grammartypeLTT:inputsize              5.832e-02  2.732e-03  21.349  < 2e-16 ***
grammartypeLTTO:inputsize             9.767e-02  2.825e-03  34.569  < 2e-16 ***
grammartypeMSO:inputsize              3.120e-01  2.736e-03 114.031  < 2e-16 ***
grammartypeCS:inputsize               1.449e-01  2.587e-03  56.001  < 2e-16 ***
grammartypeCF:inputsize               2.416e-01  2.548e-03  94.798  < 2e-16 ***

Phi coefficients (precision model with log link):
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           2.408e+00  5.186e-02  46.444  < 2e-16 ***
recurrenceRNN                        -2.018e-01  4.282e-02  -4.713 2.44e-06 ***
recurrenceGRU                         6.439e-01  4.287e-02  15.021  < 2e-16 ***
laminationsLaminated                  6.034e-03  2.565e-02   0.235 0.814003    
inputsize                            -1.065e-01  2.768e-03 -38.477  < 2e-16 ***
grammartypeLT                         4.800e-01  6.863e-02   6.994 2.67e-12 ***
grammartypeLTT                        6.232e-01  6.828e-02   9.127  < 2e-16 ***
grammartypeLTTO                       5.725e-01  6.892e-02   8.307  < 2e-16 ***
grammartypeMSO                        6.732e-01  6.019e-02  11.185  < 2e-16 ***
grammartypeCS                         7.611e-01  5.532e-02  13.758  < 2e-16 ***
grammartypeCF                         2.417e-01  5.527e-02   4.373 1.23e-05 ***
neurons                               7.990e-04  1.403e-05  56.937  < 2e-16 ***
layers                               -8.103e-02  4.018e-03 -20.167  < 2e-16 ***
recurrenceRNN:grammartypeLT          -2.535e-01  5.777e-02  -4.387 1.15e-05 ***
recurrenceGRU:grammartypeLT          -5.446e-01  5.787e-02  -9.410  < 2e-16 ***
recurrenceRNN:grammartypeLTT         -2.545e-01  5.757e-02  -4.421 9.81e-06 ***
recurrenceGRU:grammartypeLTT         -3.509e-01  5.762e-02  -6.091 1.12e-09 ***
recurrenceRNN:grammartypeLTTO        -2.267e-01  5.819e-02  -3.896 9.76e-05 ***
recurrenceGRU:grammartypeLTTO        -4.653e-01  5.822e-02  -7.992 1.33e-15 ***
recurrenceRNN:grammartypeMSO         -1.579e+00  5.072e-02 -31.127  < 2e-16 ***
recurrenceGRU:grammartypeMSO         -2.730e+00  5.080e-02 -53.740  < 2e-16 ***
recurrenceRNN:grammartypeCS          -5.835e-01  4.610e-02 -12.656  < 2e-16 ***
recurrenceGRU:grammartypeCS          -1.300e+00  4.618e-02 -28.143  < 2e-16 ***
recurrenceRNN:grammartypeCF          -2.652e-01  4.623e-02  -5.737 9.64e-09 ***
recurrenceGRU:grammartypeCF          -6.460e-01  4.627e-02 -13.960  < 2e-16 ***
grammartypeLT:laminationsLaminated    2.177e-03  2.457e-02   0.089 0.929401    
grammartypeLTT:laminationsLaminated  -1.393e-03  2.430e-02  -0.057 0.954287    
grammartypeLTTO:laminationsLaminated -3.298e-02  2.457e-02  -1.342 0.179443    
grammartypeMSO:laminationsLaminated   2.921e-03  2.148e-02   0.136 0.891850    
grammartypeCS:laminationsLaminated   -3.694e-03  2.006e-02  -0.184 0.853898    
grammartypeCF:laminationsLaminated   -7.109e-02  1.995e-02  -3.563 0.000366 ***
recurrenceRNN:laminationsLaminated   -5.928e-02  1.934e-02  -3.065 0.002176 ** 
recurrenceGRU:laminationsLaminated    1.853e-02  1.940e-02   0.955 0.339455    
grammartypeLT:inputsize               5.970e-02  3.680e-03  16.225  < 2e-16 ***
grammartypeLTT:inputsize              1.121e-01  3.648e-03  30.715  < 2e-16 ***
grammartypeLTTO:inputsize             8.270e-02  3.677e-03  22.490  < 2e-16 ***
grammartypeMSO:inputsize              1.901e-01  3.240e-03  58.690  < 2e-16 ***
grammartypeCS:inputsize               1.452e-01  3.017e-03  48.111  < 2e-16 ***
grammartypeCF:inputsize               1.783e-01  2.996e-03  59.519  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

Type of estimator: ML (maximum likelihood)
Log-likelihood: 8.763e+05 on 78 Df
Pseudo R-squared: 0.2252
Number of iterations: 95 (BFGS) + 19 (Fisher scoring) 
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
   <th style="text-align:right;"> asymp.LCL </th>
   <th style="text-align:right;"> asymp.UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9612829 </td>
   <td style="text-align:right;"> 0.9585097 </td>
   <td style="text-align:right;"> 0.9638742 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9503715 </td>
   <td style="text-align:right;"> 0.9491692 </td>
   <td style="text-align:right;"> 0.9515460 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9716651 </td>
   <td style="text-align:right;"> 0.9710309 </td>
   <td style="text-align:right;"> 0.9722857 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9011920 </td>
   <td style="text-align:right;"> 0.8972966 </td>
   <td style="text-align:right;"> 0.9049477 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8709302 </td>
   <td style="text-align:right;"> 0.8691781 </td>
   <td style="text-align:right;"> 0.8726605 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9173976 </td>
   <td style="text-align:right;"> 0.9162979 </td>
   <td style="text-align:right;"> 0.9184834 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9146165 </td>
   <td style="text-align:right;"> 0.9121514 </td>
   <td style="text-align:right;"> 0.9170156 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8804624 </td>
   <td style="text-align:right;"> 0.8791083 </td>
   <td style="text-align:right;"> 0.8818024 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9230853 </td>
   <td style="text-align:right;"> 0.9223168 </td>
   <td style="text-align:right;"> 0.9238465 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9197469 </td>
   <td style="text-align:right;"> 0.9166036 </td>
   <td style="text-align:right;"> 0.9227768 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8944244 </td>
   <td style="text-align:right;"> 0.8929921 </td>
   <td style="text-align:right;"> 0.8958387 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9222854 </td>
   <td style="text-align:right;"> 0.9213617 </td>
   <td style="text-align:right;"> 0.9231988 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8362193 </td>
   <td style="text-align:right;"> 0.8331665 </td>
   <td style="text-align:right;"> 0.8392217 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8567362 </td>
   <td style="text-align:right;"> 0.8552937 </td>
   <td style="text-align:right;"> 0.8581657 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8633653 </td>
   <td style="text-align:right;"> 0.8618017 </td>
   <td style="text-align:right;"> 0.8649126 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9149901 </td>
   <td style="text-align:right;"> 0.9137756 </td>
   <td style="text-align:right;"> 0.9161884 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9243555 </td>
   <td style="text-align:right;"> 0.9238435 </td>
   <td style="text-align:right;"> 0.9248641 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9520840 </td>
   <td style="text-align:right;"> 0.9517017 </td>
   <td style="text-align:right;"> 0.9524633 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9097392 </td>
   <td style="text-align:right;"> 0.9081975 </td>
   <td style="text-align:right;"> 0.9112562 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9052792 </td>
   <td style="text-align:right;"> 0.9047099 </td>
   <td style="text-align:right;"> 0.9058452 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9387844 </td>
   <td style="text-align:right;"> 0.9384166 </td>
   <td style="text-align:right;"> 0.9391499 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Architectures By Grammar Type (Inverse Brier Score) (On Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 0.25394940 </td>
   <td style="text-align:right;"> 0.03768924 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.737982 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.31752925 </td>
   <td style="text-align:right;"> 0.03748125 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.471682 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.57147865 </td>
   <td style="text-align:right;"> 0.01689016 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -33.835002 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.28390896 </td>
   <td style="text-align:right;"> 0.02202803 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 12.888533 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.18790907 </td>
   <td style="text-align:right;"> 0.02192585 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.570206 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.47181803 </td>
   <td style="text-align:right;"> 0.01020135 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -46.250565 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.35516369 </td>
   <td style="text-align:right;"> 0.01601582 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 22.175800 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.10899940 </td>
   <td style="text-align:right;"> 0.01569846 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.943317 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.46416310 </td>
   <td style="text-align:right;"> 0.00796347 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -58.286570 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.28797356 </td>
   <td style="text-align:right;"> 0.02166558 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 13.291752 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.03350176 </td>
   <td style="text-align:right;"> 0.02135429 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.568854 </td>
   <td style="text-align:right;"> 0.25920188 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.32147532 </td>
   <td style="text-align:right;"> 0.00960899 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -33.455683 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.14562415 </td>
   <td style="text-align:right;"> 0.01241922 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.725709 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.19675776 </td>
   <td style="text-align:right;"> 0.01279088 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -15.382663 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.05113362 </td>
   <td style="text-align:right;"> 0.00809111 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.319729 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.12174278 </td>
   <td style="text-align:right;"> 0.00827694 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -14.708662 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.59295896 </td>
   <td style="text-align:right;"> 0.00853965 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -69.435998 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.47121618 </td>
   <td style="text-align:right;"> 0.00547432 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -86.077512 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.05064789 </td>
   <td style="text-align:right;"> 0.00972690 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 5.206993 </td>
   <td style="text-align:right;"> 0.00000057 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.40380797 </td>
   <td style="text-align:right;"> 0.00970516 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -41.607560 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.45445585 </td>
   <td style="text-align:right;"> 0.00448383 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -101.354316 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Types By Architecture (Inverse Brier Score)  (On Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 0.96878585 </td>
   <td style="text-align:right;"> 0.04158023 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 23.2991928 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.81548623 </td>
   <td style="text-align:right;"> 0.03907465 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 20.8699559 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.75076207 </td>
   <td style="text-align:right;"> 0.04140552 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 18.1319317 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.51066813 </td>
   <td style="text-align:right;"> 0.03745200 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 40.3361144 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.81089943 </td>
   <td style="text-align:right;"> 0.03678957 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 22.0415582 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.87366938 </td>
   <td style="text-align:right;"> 0.03712009 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 23.5362952 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.15329962 </td>
   <td style="text-align:right;"> 0.02572738 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.9586175 </td>
   <td style="text-align:right;"> 0.00000005 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.21802378 </td>
   <td style="text-align:right;"> 0.02914570 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.4804779 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.54188228 </td>
   <td style="text-align:right;"> 0.02318927 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 23.3678047 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.15788642 </td>
   <td style="text-align:right;"> 0.02210379 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.1429576 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.09511647 </td>
   <td style="text-align:right;"> 0.02264859 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -4.1996641 </td>
   <td style="text-align:right;"> 0.00053246 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.06472415 </td>
   <td style="text-align:right;"> 0.02544401 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.5437878 </td>
   <td style="text-align:right;"> 0.14382466 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.69518190 </td>
   <td style="text-align:right;"> 0.01832066 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 37.9452425 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.00458680 </td>
   <td style="text-align:right;"> 0.01692543 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.2710007 </td>
   <td style="text-align:right;"> 0.99996775 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.05818315 </td>
   <td style="text-align:right;"> 0.01763189 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.2998816 </td>
   <td style="text-align:right;"> 0.01680825 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.75990605 </td>
   <td style="text-align:right;"> 0.02287466 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 33.2204357 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.06013735 </td>
   <td style="text-align:right;"> 0.02177355 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.7619449 </td>
   <td style="text-align:right;"> 0.08359779 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.12290731 </td>
   <td style="text-align:right;"> 0.02232618 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 5.5050755 </td>
   <td style="text-align:right;"> 0.00000077 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.69976870 </td>
   <td style="text-align:right;"> 0.01273769 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -54.9368631 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.63699875 </td>
   <td style="text-align:right;"> 0.01366476 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -46.6161734 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.06276996 </td>
   <td style="text-align:right;"> 0.01172858 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 5.3518792 </td>
   <td style="text-align:right;"> 0.00000181 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.99874540 </td>
   <td style="text-align:right;"> 0.01454405 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 68.6703640 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.91670052 </td>
   <td style="text-align:right;"> 0.01395151 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 65.7061751 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.78478623 </td>
   <td style="text-align:right;"> 0.01449139 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 54.1553611 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 1.11109458 </td>
   <td style="text-align:right;"> 0.01369792 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 81.1141138 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.43520724 </td>
   <td style="text-align:right;"> 0.01303335 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 33.3918234 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.67036787 </td>
   <td style="text-align:right;"> 0.01293780 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 51.8146845 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.08204488 </td>
   <td style="text-align:right;"> 0.00959541 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.5504260 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.21395917 </td>
   <td style="text-align:right;"> 0.01036465 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -20.6431655 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.11234917 </td>
   <td style="text-align:right;"> 0.00922290 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 12.1815425 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.56353816 </td>
   <td style="text-align:right;"> 0.00820359 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -68.6940526 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.32837754 </td>
   <td style="text-align:right;"> 0.00805062 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -40.7891107 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.13191428 </td>
   <td style="text-align:right;"> 0.00951536 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -13.8632947 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.19439406 </td>
   <td style="text-align:right;"> 0.00825696 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 23.5430604 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.48149328 </td>
   <td style="text-align:right;"> 0.00710014 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -67.8146558 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.24633265 </td>
   <td style="text-align:right;"> 0.00692302 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -35.5816549 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.32630834 </td>
   <td style="text-align:right;"> 0.00913960 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 35.7026793 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.34957899 </td>
   <td style="text-align:right;"> 0.00810982 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -43.1056171 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.11441837 </td>
   <td style="text-align:right;"> 0.00795503 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -14.3831416 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.67588734 </td>
   <td style="text-align:right;"> 0.00658801 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -102.5935648 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.44072671 </td>
   <td style="text-align:right;"> 0.00639677 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -68.8983217 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.23516063 </td>
   <td style="text-align:right;"> 0.00481196 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 48.8700352 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.09840603 </td>
   <td style="text-align:right;"> 0.01345486 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 81.6363537 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.02401607 </td>
   <td style="text-align:right;"> 0.01261922 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 81.1473258 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.03478956 </td>
   <td style="text-align:right;"> 0.01306905 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 79.1786571 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.63143961 </td>
   <td style="text-align:right;"> 0.01305706 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 124.9469461 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.53546972 </td>
   <td style="text-align:right;"> 0.01219071 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 43.9244164 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.78739066 </td>
   <td style="text-align:right;"> 0.01188686 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 66.2404245 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.07438995 </td>
   <td style="text-align:right;"> 0.00880811 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.4456179 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.06361646 </td>
   <td style="text-align:right;"> 0.00944123 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.7381517 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.53303358 </td>
   <td style="text-align:right;"> 0.00942477 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 56.5566655 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.56293631 </td>
   <td style="text-align:right;"> 0.00818265 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -68.7963720 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.31101536 </td>
   <td style="text-align:right;"> 0.00772236 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -40.2746678 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.01077349 </td>
   <td style="text-align:right;"> 0.00820666 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.3127742 </td>
   <td style="text-align:right;"> 0.84626749 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.60742354 </td>
   <td style="text-align:right;"> 0.00818769 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 74.1874431 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.48854636 </td>
   <td style="text-align:right;"> 0.00672046 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -72.6953816 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.23662541 </td>
   <td style="text-align:right;"> 0.00615198 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -38.4632827 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.59665005 </td>
   <td style="text-align:right;"> 0.00886528 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 67.3019069 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.49931985 </td>
   <td style="text-align:right;"> 0.00753143 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -66.2981327 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.24739890 </td>
   <td style="text-align:right;"> 0.00702860 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -35.1989023 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -1.09596990 </td>
   <td style="text-align:right;"> 0.00751042 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -145.9265233 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.84404895 </td>
   <td style="text-align:right;"> 0.00700647 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -120.4670093 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.25192095 </td>
   <td style="text-align:right;"> 0.00521719 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 48.2867018 </td>
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
   <td style="text-align:right;"> 3.270313 </td>
   <td style="text-align:right;"> 0.01561787 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.239702 </td>
   <td style="text-align:right;"> 3.300923 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.235664 </td>
   <td style="text-align:right;"> 0.01608684 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.204135 </td>
   <td style="text-align:right;"> 3.267194 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.222595 </td>
   <td style="text-align:right;"> 0.00903107 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.204894 </td>
   <td style="text-align:right;"> 2.240295 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.239424 </td>
   <td style="text-align:right;"> 0.00950457 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.220795 </td>
   <td style="text-align:right;"> 2.258053 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.345054 </td>
   <td style="text-align:right;"> 0.00701841 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.331298 </td>
   <td style="text-align:right;"> 2.358810 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.323454 </td>
   <td style="text-align:right;"> 0.00734563 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.309057 </td>
   <td style="text-align:right;"> 2.337851 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.403773 </td>
   <td style="text-align:right;"> 0.00872314 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.386676 </td>
   <td style="text-align:right;"> 2.420870 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.388646 </td>
   <td style="text-align:right;"> 0.00917349 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.370666 </td>
   <td style="text-align:right;"> 2.406626 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 1.844554 </td>
   <td style="text-align:right;"> 0.00527837 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.834209 </td>
   <td style="text-align:right;"> 1.854899 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 1.825955 </td>
   <td style="text-align:right;"> 0.00562186 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.814936 </td>
   <td style="text-align:right;"> 1.836973 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.707515 </td>
   <td style="text-align:right;"> 0.00404069 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.699595 </td>
   <td style="text-align:right;"> 2.715434 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.610745 </td>
   <td style="text-align:right;"> 0.00419771 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.602517 </td>
   <td style="text-align:right;"> 2.618972 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.506975 </td>
   <td style="text-align:right;"> 0.00395567 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.499222 </td>
   <td style="text-align:right;"> 2.514728 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.444717 </td>
   <td style="text-align:right;"> 0.00428477 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.436319 </td>
   <td style="text-align:right;"> 2.453115 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Laminations By Grammar Type (Inverse Brier Score) (On Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 0.03464819 </td>
   <td style="text-align:right;"> 0.01651447 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.098050 </td>
   <td style="text-align:right;"> 0.03590072 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.01682914 </td>
   <td style="text-align:right;"> 0.01014128 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.659469 </td>
   <td style="text-align:right;"> 0.09702139 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.02159999 </td>
   <td style="text-align:right;"> 0.00792370 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.725997 </td>
   <td style="text-align:right;"> 0.00641076 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.01512687 </td>
   <td style="text-align:right;"> 0.00955368 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.583356 </td>
   <td style="text-align:right;"> 0.11334038 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.01859926 </td>
   <td style="text-align:right;"> 0.00735592 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.528475 </td>
   <td style="text-align:right;"> 0.01145591 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.09677019 </td>
   <td style="text-align:right;"> 0.00524441 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 18.452070 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.06225850 </td>
   <td style="text-align:right;"> 0.00491985 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 12.654547 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Types By Laminations (Inverse Brier Score) (On Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 1.04771776 </td>
   <td style="text-align:right;"> 0.01799203 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 58.232328 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.92525837 </td>
   <td style="text-align:right;"> 0.01707102 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 54.200538 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.86653995 </td>
   <td style="text-align:right;"> 0.01783753 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 48.579602 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 1.42575857 </td>
   <td style="text-align:right;"> 0.01645970 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 86.621186 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.56279779 </td>
   <td style="text-align:right;"> 0.01609672 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 34.963502 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.76333748 </td>
   <td style="text-align:right;"> 0.01605695 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 47.539388 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.12245939 </td>
   <td style="text-align:right;"> 0.01136494 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -10.775192 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.18117781 </td>
   <td style="text-align:right;"> 0.01248693 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -14.509396 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.37804081 </td>
   <td style="text-align:right;"> 0.01042015 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 36.279777 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.48491997 </td>
   <td style="text-align:right;"> 0.00983755 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -49.292764 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.28438028 </td>
   <td style="text-align:right;"> 0.00977501 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -29.092596 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.05871843 </td>
   <td style="text-align:right;"> 0.01111800 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.281382 </td>
   <td style="text-align:right;"> 2.67e-06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.50050019 </td>
   <td style="text-align:right;"> 0.00873625 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 57.290055 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.36246058 </td>
   <td style="text-align:right;"> 0.00803341 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -45.119165 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.16192089 </td>
   <td style="text-align:right;"> 0.00795447 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -20.355973 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.55921862 </td>
   <td style="text-align:right;"> 0.01015502 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 55.068201 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.30374216 </td>
   <td style="text-align:right;"> 0.00955631 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -31.784446 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.10320247 </td>
   <td style="text-align:right;"> 0.00948870 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -10.876355 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.86296078 </td>
   <td style="text-align:right;"> 0.00659664 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -130.818136 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.66242109 </td>
   <td style="text-align:right;"> 0.00653172 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -101.415987 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.20053969 </td>
   <td style="text-align:right;"> 0.00555545 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 36.097847 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.99624043 </td>
   <td style="text-align:right;"> 0.01856790 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 53.653909 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.91221017 </td>
   <td style="text-align:right;"> 0.01756485 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 51.933846 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.84701864 </td>
   <td style="text-align:right;"> 0.01839694 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 46.041287 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 1.40970964 </td>
   <td style="text-align:right;"> 0.01696494 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 83.095458 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.62491980 </td>
   <td style="text-align:right;"> 0.01653598 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 37.791526 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.79094779 </td>
   <td style="text-align:right;"> 0.01651762 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 47.885083 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.08403025 </td>
   <td style="text-align:right;"> 0.01183613 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.099471 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.14922179 </td>
   <td style="text-align:right;"> 0.01303903 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.444242 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.41346921 </td>
   <td style="text-align:right;"> 0.01092430 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 37.848586 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.37132063 </td>
   <td style="text-align:right;"> 0.01024547 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -36.242409 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.20529263 </td>
   <td style="text-align:right;"> 0.01021671 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -20.093804 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.06519154 </td>
   <td style="text-align:right;"> 0.01156510 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.636921 </td>
   <td style="text-align:right;"> 3.60e-07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.49749947 </td>
   <td style="text-align:right;"> 0.00911619 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 54.573153 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.28729038 </td>
   <td style="text-align:right;"> 0.00829192 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -34.647019 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.12126238 </td>
   <td style="text-align:right;"> 0.00825596 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -14.687857 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.56269101 </td>
   <td style="text-align:right;"> 0.01063642 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 52.902286 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.22209884 </td>
   <td style="text-align:right;"> 0.00993782 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -22.348840 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.05607084 </td>
   <td style="text-align:right;"> 0.00990378 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.661561 </td>
   <td style="text-align:right;"> 3.10e-07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.78478985 </td>
   <td style="text-align:right;"> 0.00688186 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -114.037396 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.61876185 </td>
   <td style="text-align:right;"> 0.00688264 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -89.901802 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.16602800 </td>
   <td style="text-align:right;"> 0.00574474 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 28.900879 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
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
   <th style="text-align:right;"> asymp.LCL </th>
   <th style="text-align:right;"> asymp.UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.9125374 </td>
   <td style="text-align:right;"> 0.9112036 </td>
   <td style="text-align:right;"> 0.9138522 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.9161486 </td>
   <td style="text-align:right;"> 0.9147285 </td>
   <td style="text-align:right;"> 0.9175461 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.9071479 </td>
   <td style="text-align:right;"> 0.9065309 </td>
   <td style="text-align:right;"> 0.9077609 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.8973189 </td>
   <td style="text-align:right;"> 0.8966520 </td>
   <td style="text-align:right;"> 0.8979818 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9346926 </td>
   <td style="text-align:right;"> 0.9342697 </td>
   <td style="text-align:right;"> 0.9351128 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9322744 </td>
   <td style="text-align:right;"> 0.9318450 </td>
   <td style="text-align:right;"> 0.9327011 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Recurrence By Lamination (Inverse Brier Score) (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 0.06271268 </td>
   <td style="text-align:right;"> 0.00864285 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.256015 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.30394062 </td>
   <td style="text-align:right;"> 0.00862383 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -35.244274 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.36665330 </td>
   <td style="text-align:right;"> 0.00458413 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -79.983209 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.21279492 </td>
   <td style="text-align:right;"> 0.00935935 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 22.736073 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.22219200 </td>
   <td style="text-align:right;"> 0.00935324 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -23.755630 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.43498691 </td>
   <td style="text-align:right;"> 0.00451717 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -96.296359 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Types By Architecture (Inverse Brier Score) (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> -0.04410926 </td>
   <td style="text-align:right;"> 0.00855646 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.155084 </td>
   <td style="text-align:right;"> 2.5e-07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.10597298 </td>
   <td style="text-align:right;"> 0.00452663 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 23.410993 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.03763936 </td>
   <td style="text-align:right;"> 0.00445334 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 8.451946 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
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
   <td style="text-align:right;"> 4.1491186 </td>
   <td style="text-align:right;"> 0.02302222 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.1039958 </td>
   <td style="text-align:right;"> 4.1942413 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.9938713 </td>
   <td style="text-align:right;"> 0.02099900 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.9527140 </td>
   <td style="text-align:right;"> 4.0350286 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.8386241 </td>
   <td style="text-align:right;"> 0.01907975 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.8012285 </td>
   <td style="text-align:right;"> 3.8760197 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.6833769 </td>
   <td style="text-align:right;"> 0.01729909 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.6494713 </td>
   <td style="text-align:right;"> 3.7172825 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.5281297 </td>
   <td style="text-align:right;"> 0.01570425 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.4973499 </td>
   <td style="text-align:right;"> 3.5589094 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.3728824 </td>
   <td style="text-align:right;"> 0.01435727 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.3447427 </td>
   <td style="text-align:right;"> 3.4010222 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.2176352 </td>
   <td style="text-align:right;"> 0.01333350 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.1915020 </td>
   <td style="text-align:right;"> 3.2437684 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.0623880 </td>
   <td style="text-align:right;"> 0.01271127 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.0374744 </td>
   <td style="text-align:right;"> 3.0873016 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 2.9071408 </td>
   <td style="text-align:right;"> 0.01255045 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.8825423 </td>
   <td style="text-align:right;"> 2.9317392 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 2.7518935 </td>
   <td style="text-align:right;"> 0.01286834 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.7266721 </td>
   <td style="text-align:right;"> 2.7771150 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 2.5966463 </td>
   <td style="text-align:right;"> 0.01363149 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.5699291 </td>
   <td style="text-align:right;"> 2.6233636 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 2.4413991 </td>
   <td style="text-align:right;"> 0.01477106 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.4124484 </td>
   <td style="text-align:right;"> 2.4703498 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.6838554 </td>
   <td style="text-align:right;"> 0.01339024 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6576110 </td>
   <td style="text-align:right;"> 2.7100998 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.6054035 </td>
   <td style="text-align:right;"> 0.01217365 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.5815436 </td>
   <td style="text-align:right;"> 2.6292634 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.5269517 </td>
   <td style="text-align:right;"> 0.01102210 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.5053488 </td>
   <td style="text-align:right;"> 2.5485546 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.4484998 </td>
   <td style="text-align:right;"> 0.00995817 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.4289821 </td>
   <td style="text-align:right;"> 2.4680175 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.3700479 </td>
   <td style="text-align:right;"> 0.00901296 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.3523828 </td>
   <td style="text-align:right;"> 2.3877130 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.2915960 </td>
   <td style="text-align:right;"> 0.00822747 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.2754705 </td>
   <td style="text-align:right;"> 2.3077216 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.2131442 </td>
   <td style="text-align:right;"> 0.00765107 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.1981483 </td>
   <td style="text-align:right;"> 2.2281400 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.1346923 </td>
   <td style="text-align:right;"> 0.00733322 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.1203195 </td>
   <td style="text-align:right;"> 2.1490651 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.0562404 </td>
   <td style="text-align:right;"> 0.00730773 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.0419175 </td>
   <td style="text-align:right;"> 2.0705633 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 1.9777886 </td>
   <td style="text-align:right;"> 0.00757756 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.9629368 </td>
   <td style="text-align:right;"> 1.9926403 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 1.8993367 </td>
   <td style="text-align:right;"> 0.00811330 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.8834349 </td>
   <td style="text-align:right;"> 1.9152384 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 1.8208848 </td>
   <td style="text-align:right;"> 0.00886687 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.8035060 </td>
   <td style="text-align:right;"> 1.8382635 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.8937198 </td>
   <td style="text-align:right;"> 0.01092947 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.8722984 </td>
   <td style="text-align:right;"> 2.9151411 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.7967969 </td>
   <td style="text-align:right;"> 0.00991659 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.7773608 </td>
   <td style="text-align:right;"> 2.8162331 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.6998741 </td>
   <td style="text-align:right;"> 0.00894470 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6823428 </td>
   <td style="text-align:right;"> 2.7174054 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.6029512 </td>
   <td style="text-align:right;"> 0.00802869 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.5872153 </td>
   <td style="text-align:right;"> 2.6186872 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.5060284 </td>
   <td style="text-align:right;"> 0.00718997 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.4919363 </td>
   <td style="text-align:right;"> 2.5201205 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.4091056 </td>
   <td style="text-align:right;"> 0.00645871 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.3964467 </td>
   <td style="text-align:right;"> 2.4217644 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.3121827 </td>
   <td style="text-align:right;"> 0.00587517 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.3006676 </td>
   <td style="text-align:right;"> 2.3236979 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.2152599 </td>
   <td style="text-align:right;"> 0.00548670 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.2045062 </td>
   <td style="text-align:right;"> 2.2260136 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.1183371 </td>
   <td style="text-align:right;"> 0.00533606 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.1078786 </td>
   <td style="text-align:right;"> 2.1287955 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.0214142 </td>
   <td style="text-align:right;"> 0.00544304 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.0107461 </td>
   <td style="text-align:right;"> 2.0320824 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 1.9244914 </td>
   <td style="text-align:right;"> 0.00579338 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.9131366 </td>
   <td style="text-align:right;"> 1.9358462 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 1.8275685 </td>
   <td style="text-align:right;"> 0.00634692 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.8151288 </td>
   <td style="text-align:right;"> 1.8400083 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.7285500 </td>
   <td style="text-align:right;"> 0.01269453 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.7036692 </td>
   <td style="text-align:right;"> 2.7534309 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.6709747 </td>
   <td style="text-align:right;"> 0.01157754 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6482832 </td>
   <td style="text-align:right;"> 2.6936663 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.6133994 </td>
   <td style="text-align:right;"> 0.01052380 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.5927731 </td>
   <td style="text-align:right;"> 2.6340257 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.5558241 </td>
   <td style="text-align:right;"> 0.00955426 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.5370980 </td>
   <td style="text-align:right;"> 2.5745501 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.4982487 </td>
   <td style="text-align:right;"> 0.00869712 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.4812027 </td>
   <td style="text-align:right;"> 2.5152948 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.4406734 </td>
   <td style="text-align:right;"> 0.00798864 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.4250159 </td>
   <td style="text-align:right;"> 2.4563308 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.3830980 </td>
   <td style="text-align:right;"> 0.00747124 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.3684547 </td>
   <td style="text-align:right;"> 2.3977414 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.3255227 </td>
   <td style="text-align:right;"> 0.00718630 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.3114378 </td>
   <td style="text-align:right;"> 2.3396076 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.2679474 </td>
   <td style="text-align:right;"> 0.00716163 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.2539108 </td>
   <td style="text-align:right;"> 2.2819839 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.2103720 </td>
   <td style="text-align:right;"> 0.00739982 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.1958686 </td>
   <td style="text-align:right;"> 2.2248754 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.1527967 </td>
   <td style="text-align:right;"> 0.00787708 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.1373579 </td>
   <td style="text-align:right;"> 2.1682355 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.0952214 </td>
   <td style="text-align:right;"> 0.00855347 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.0784569 </td>
   <td style="text-align:right;"> 2.1119858 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9301697 </td>
   <td style="text-align:right;"> 0.00889991 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.9127262 </td>
   <td style="text-align:right;"> 0.9476132 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 1.0869683 </td>
   <td style="text-align:right;"> 0.00784425 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.0715938 </td>
   <td style="text-align:right;"> 1.1023427 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 1.2437668 </td>
   <td style="text-align:right;"> 0.00683300 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.2303744 </td>
   <td style="text-align:right;"> 1.2571592 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 1.4005654 </td>
   <td style="text-align:right;"> 0.00588906 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.3890230 </td>
   <td style="text-align:right;"> 1.4121077 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 1.5573639 </td>
   <td style="text-align:right;"> 0.00505033 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.5474655 </td>
   <td style="text-align:right;"> 1.5672624 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 1.7141625 </td>
   <td style="text-align:right;"> 0.00437769 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.7055824 </td>
   <td style="text-align:right;"> 1.7227426 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 1.8709610 </td>
   <td style="text-align:right;"> 0.00395679 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.8632059 </td>
   <td style="text-align:right;"> 1.8787162 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 2.0277596 </td>
   <td style="text-align:right;"> 0.00387062 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.0201733 </td>
   <td style="text-align:right;"> 2.0353459 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 2.1845581 </td>
   <td style="text-align:right;"> 0.00414016 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.1764436 </td>
   <td style="text-align:right;"> 2.1926727 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 2.3413567 </td>
   <td style="text-align:right;"> 0.00470464 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.3321358 </td>
   <td style="text-align:right;"> 2.3505776 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 2.4981553 </td>
   <td style="text-align:right;"> 0.00547358 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.4874273 </td>
   <td style="text-align:right;"> 2.5088833 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 2.6549538 </td>
   <td style="text-align:right;"> 0.00637338 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6424622 </td>
   <td style="text-align:right;"> 2.6674454 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.7188606 </td>
   <td style="text-align:right;"> 0.00668747 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.7057534 </td>
   <td style="text-align:right;"> 2.7319678 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.7085127 </td>
   <td style="text-align:right;"> 0.00597905 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6967940 </td>
   <td style="text-align:right;"> 2.7202315 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.6981649 </td>
   <td style="text-align:right;"> 0.00529363 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6877895 </td>
   <td style="text-align:right;"> 2.7085402 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.6878170 </td>
   <td style="text-align:right;"> 0.00464141 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6787200 </td>
   <td style="text-align:right;"> 2.6969140 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.6774691 </td>
   <td style="text-align:right;"> 0.00403852 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6695537 </td>
   <td style="text-align:right;"> 2.6853844 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.6671212 </td>
   <td style="text-align:right;"> 0.00351046 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6602408 </td>
   <td style="text-align:right;"> 2.6740016 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.6567733 </td>
   <td style="text-align:right;"> 0.00309577 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6507057 </td>
   <td style="text-align:right;"> 2.6628409 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.6464254 </td>
   <td style="text-align:right;"> 0.00284446 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6408504 </td>
   <td style="text-align:right;"> 2.6520005 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.6360775 </td>
   <td style="text-align:right;"> 0.00280088 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6305879 </td>
   <td style="text-align:right;"> 2.6415672 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.6257296 </td>
   <td style="text-align:right;"> 0.00297416 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6199004 </td>
   <td style="text-align:right;"> 2.6315589 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.6153817 </td>
   <td style="text-align:right;"> 0.00333063 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6088538 </td>
   <td style="text-align:right;"> 2.6219097 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.6050339 </td>
   <td style="text-align:right;"> 0.00381933 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.5975481 </td>
   <td style="text-align:right;"> 2.6125196 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 1.9775525 </td>
   <td style="text-align:right;"> 0.00566036 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.9664584 </td>
   <td style="text-align:right;"> 1.9886466 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.0638778 </td>
   <td style="text-align:right;"> 0.00513531 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.0538128 </td>
   <td style="text-align:right;"> 2.0739428 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.1502031 </td>
   <td style="text-align:right;"> 0.00464194 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.1411050 </td>
   <td style="text-align:right;"> 2.1593011 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.2365283 </td>
   <td style="text-align:right;"> 0.00419145 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.2283132 </td>
   <td style="text-align:right;"> 2.2447434 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.3228536 </td>
   <td style="text-align:right;"> 0.00379913 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.3154074 </td>
   <td style="text-align:right;"> 2.3302998 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.4091789 </td>
   <td style="text-align:right;"> 0.00348468 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.4023490 </td>
   <td style="text-align:right;"> 2.4160087 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.4955041 </td>
   <td style="text-align:right;"> 0.00327063 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.4890938 </td>
   <td style="text-align:right;"> 2.5019145 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.5818294 </td>
   <td style="text-align:right;"> 0.00317735 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.5756019 </td>
   <td style="text-align:right;"> 2.5880569 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.6681547 </td>
   <td style="text-align:right;"> 0.00321536 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.6618527 </td>
   <td style="text-align:right;"> 2.6744567 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.7544799 </td>
   <td style="text-align:right;"> 0.00338023 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.7478548 </td>
   <td style="text-align:right;"> 2.7611051 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.8408052 </td>
   <td style="text-align:right;"> 0.00365484 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.8336418 </td>
   <td style="text-align:right;"> 2.8479686 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.9271305 </td>
   <td style="text-align:right;"> 0.00401674 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.9192578 </td>
   <td style="text-align:right;"> 2.9350031 </td>
  </tr>
</tbody>
</table>

### Slope of layers

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Predicted mean inverse Brier score across layers grid
Results averaged over the levels of: recurrence, laminations, grammartype</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> Layers </th>
   <th style="text-align:right;"> Estimate </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.9257460 </td>
   <td style="text-align:right;"> 0.9251296 </td>
   <td style="text-align:right;"> 0.9263576 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.9204265 </td>
   <td style="text-align:right;"> 0.9199843 </td>
   <td style="text-align:right;"> 0.9208665 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.9147438 </td>
   <td style="text-align:right;"> 0.9142456 </td>
   <td style="text-align:right;"> 0.9152393 </td>
  </tr>
</tbody>
</table>

### Slope of neurons

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Predicted mean inverse Brier score across neurons grid
Results averaged over the levels of: recurrence, laminations, grammartype</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> Neurons </th>
   <th style="text-align:right;"> Estimate </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 0.8992689 </td>
   <td style="text-align:right;"> 0.8986225 </td>
   <td style="text-align:right;"> 0.8999115 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:right;"> 0.9019373 </td>
   <td style="text-align:right;"> 0.9013354 </td>
   <td style="text-align:right;"> 0.9025358 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 96 </td>
   <td style="text-align:right;"> 0.9045388 </td>
   <td style="text-align:right;"> 0.9039767 </td>
   <td style="text-align:right;"> 0.9050979 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 128 </td>
   <td style="text-align:right;"> 0.9070749 </td>
   <td style="text-align:right;"> 0.9065477 </td>
   <td style="text-align:right;"> 0.9075993 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 0.9095471 </td>
   <td style="text-align:right;"> 0.9090499 </td>
   <td style="text-align:right;"> 0.9100416 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 192 </td>
   <td style="text-align:right;"> 0.9119567 </td>
   <td style="text-align:right;"> 0.9114846 </td>
   <td style="text-align:right;"> 0.9124263 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 224 </td>
   <td style="text-align:right;"> 0.9143052 </td>
   <td style="text-align:right;"> 0.9138533 </td>
   <td style="text-align:right;"> 0.9147547 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 256 </td>
   <td style="text-align:right;"> 0.9165939 </td>
   <td style="text-align:right;"> 0.9161574 </td>
   <td style="text-align:right;"> 0.9170282 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 288 </td>
   <td style="text-align:right;"> 0.9188243 </td>
   <td style="text-align:right;"> 0.9183986 </td>
   <td style="text-align:right;"> 0.9192478 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 320 </td>
   <td style="text-align:right;"> 0.9209976 </td>
   <td style="text-align:right;"> 0.9205785 </td>
   <td style="text-align:right;"> 0.9214146 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 352 </td>
   <td style="text-align:right;"> 0.9231152 </td>
   <td style="text-align:right;"> 0.9226989 </td>
   <td style="text-align:right;"> 0.9235294 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 384 </td>
   <td style="text-align:right;"> 0.9251784 </td>
   <td style="text-align:right;"> 0.9247615 </td>
   <td style="text-align:right;"> 0.9255931 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 416 </td>
   <td style="text-align:right;"> 0.9271884 </td>
   <td style="text-align:right;"> 0.9267682 </td>
   <td style="text-align:right;"> 0.9276064 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 448 </td>
   <td style="text-align:right;"> 0.9291465 </td>
   <td style="text-align:right;"> 0.9287206 </td>
   <td style="text-align:right;"> 0.9295700 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 480 </td>
   <td style="text-align:right;"> 0.9310540 </td>
   <td style="text-align:right;"> 0.9306207 </td>
   <td style="text-align:right;"> 0.9314847 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 512 </td>
   <td style="text-align:right;"> 0.9329119 </td>
   <td style="text-align:right;"> 0.9324699 </td>
   <td style="text-align:right;"> 0.9333512 </td>
  </tr>
</tbody>
</table>


## Proportion Correct Model

```
Call:
betareg::betareg(formula = .x, data = df, link = "loglog")

Quantile residuals:
     Min       1Q   Median       3Q      Max 
-11.9853  -0.6961   0.0008   0.6175   7.7422 

Coefficients (mean model with loglog link):
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           4.492e+00  5.317e-02  84.473  < 2e-16 ***
recurrenceRNN                        -1.924e-01  4.328e-02  -4.445 8.78e-06 ***
recurrenceGRU                         4.924e-01  4.369e-02  11.270  < 2e-16 ***
laminationsLaminated                  1.844e-02  2.176e-02   0.847 0.396735    
inputsize                            -1.516e-01  2.944e-03 -51.500  < 2e-16 ***
grammartypeLT                        -1.399e+00  5.981e-02 -23.389  < 2e-16 ***
grammartypeLTT                       -1.064e+00  5.730e-02 -18.573  < 2e-16 ***
grammartypeLTTO                      -1.341e+00  5.926e-02 -22.632  < 2e-16 ***
grammartypeMSO                       -3.566e+00  5.615e-02 -63.506  < 2e-16 ***
grammartypeCS                        -1.628e+00  5.443e-02 -29.914  < 2e-16 ***
grammartypeCF                        -2.451e+00  5.481e-02 -44.722  < 2e-16 ***
neurons                               1.007e-03  9.760e-06 103.126  < 2e-16 ***
layers                               -1.677e-01  2.756e-03 -60.853  < 2e-16 ***
recurrenceRNN:grammartypeLT          -6.874e-02  4.897e-02  -1.404 0.160432    
recurrenceGRU:grammartypeLT          -2.117e-01  4.931e-02  -4.294 1.76e-05 ***
recurrenceRNN:grammartypeLTT         -1.416e-01  4.631e-02  -3.058 0.002230 ** 
recurrenceGRU:grammartypeLTT         -2.967e-01  4.664e-02  -6.360 2.01e-10 ***
recurrenceRNN:grammartypeLTTO        -4.747e-02  4.878e-02  -0.973 0.330435    
recurrenceGRU:grammartypeLTTO        -3.811e-01  4.895e-02  -7.785 6.99e-15 ***
recurrenceRNN:grammartypeMSO          2.718e-01  4.554e-02   5.969 2.39e-09 ***
recurrenceGRU:grammartypeMSO         -2.258e-01  4.610e-02  -4.899 9.65e-07 ***
recurrenceRNN:grammartypeCS           3.164e-01  4.403e-02   7.184 6.75e-13 ***
recurrenceGRU:grammartypeCS           2.652e-01  4.466e-02   5.939 2.86e-09 ***
recurrenceRNN:grammartypeCF           1.245e-01  4.509e-02   2.762 0.005738 ** 
recurrenceGRU:grammartypeCF           3.265e-02  4.549e-02   0.718 0.473005    
grammartypeLT:laminationsLaminated    4.526e-02  2.223e-02   2.036 0.041740 *  
grammartypeLTT:laminationsLaminated   6.329e-03  2.125e-02   0.298 0.765801    
grammartypeLTTO:laminationsLaminated  1.360e-02  2.182e-02   0.623 0.533136    
grammartypeMSO:laminationsLaminated  -1.524e-02  2.119e-02  -0.719 0.472235    
grammartypeCS:laminationsLaminated   -7.263e-02  2.045e-02  -3.551 0.000384 ***
grammartypeCF:laminationsLaminated   -2.868e-02  2.011e-02  -1.426 0.153848    
recurrenceRNN:laminationsLaminated   -1.133e-01  1.056e-02 -10.725  < 2e-16 ***
recurrenceGRU:laminationsLaminated   -2.425e-02  1.093e-02  -2.219 0.026482 *  
grammartypeLT:inputsize               6.354e-02  3.352e-03  18.954  < 2e-16 ***
grammartypeLTT:inputsize              4.225e-02  3.251e-03  12.998  < 2e-16 ***
grammartypeLTTO:inputsize             8.644e-02  3.289e-03  26.281  < 2e-16 ***
grammartypeMSO:inputsize              3.249e-01  3.220e-03 100.913  < 2e-16 ***
grammartypeCS:inputsize               1.364e-01  3.097e-03  44.041  < 2e-16 ***
grammartypeCF:inputsize               2.497e-01  3.033e-03  82.311  < 2e-16 ***

Phi coefficients (precision model with log link):
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           2.407e+00  5.779e-02  41.648  < 2e-16 ***
recurrenceRNN                        -2.007e-01  4.694e-02  -4.275 1.91e-05 ***
recurrenceGRU                         5.713e-01  4.751e-02  12.024  < 2e-16 ***
laminationsLaminated                  1.724e-02  2.773e-02   0.622 0.534130    
inputsize                            -1.112e-01  3.164e-03 -35.162  < 2e-16 ***
grammartypeLT                         7.528e-01  7.356e-02  10.235  < 2e-16 ***
grammartypeLTT                        1.251e-01  7.315e-02   1.710 0.087225 .  
grammartypeLTTO                       5.812e-01  7.375e-02   7.880 3.28e-15 ***
grammartypeMSO                        1.580e-02  6.566e-02   0.241 0.809823    
grammartypeCS                         7.907e-01  6.113e-02  12.935  < 2e-16 ***
grammartypeCF                         4.727e-02  6.127e-02   0.772 0.440396    
neurons                               6.343e-04  1.449e-05  43.787  < 2e-16 ***
layers                               -1.185e-01  4.149e-03 -28.575  < 2e-16 ***
recurrenceRNN:grammartypeLT          -3.617e-01  6.112e-02  -5.919 3.25e-09 ***
recurrenceGRU:grammartypeLT          -4.872e-01  6.165e-02  -7.903 2.73e-15 ***
recurrenceRNN:grammartypeLTT         -6.920e-03  6.076e-02  -0.114 0.909321    
recurrenceGRU:grammartypeLTT         -1.271e-01  6.122e-02  -2.077 0.037840 *  
recurrenceRNN:grammartypeLTTO        -2.068e-01  6.151e-02  -3.362 0.000775 ***
recurrenceGRU:grammartypeLTTO        -2.164e-01  6.192e-02  -3.495 0.000474 ***
recurrenceRNN:grammartypeMSO         -1.136e+00  5.451e-02 -20.831  < 2e-16 ***
recurrenceGRU:grammartypeMSO         -2.117e+00  5.509e-02 -38.433  < 2e-16 ***
recurrenceRNN:grammartypeCS          -6.128e-01  5.002e-02 -12.252  < 2e-16 ***
recurrenceGRU:grammartypeCS          -1.607e+00  5.071e-02 -31.699  < 2e-16 ***
recurrenceRNN:grammartypeCF           1.335e-01  5.054e-02   2.641 0.008255 ** 
recurrenceGRU:grammartypeCF          -1.697e-01  5.108e-02  -3.323 0.000891 ***
grammartypeLT:laminationsLaminated    3.344e-02  2.676e-02   1.250 0.211379    
grammartypeLTT:laminationsLaminated   2.738e-02  2.637e-02   1.038 0.299192    
grammartypeLTTO:laminationsLaminated -6.555e-03  2.668e-02  -0.246 0.805952    
grammartypeMSO:laminationsLaminated   3.616e-02  2.393e-02   1.511 0.130850    
grammartypeCS:laminationsLaminated    6.622e-02  2.264e-02   2.925 0.003444 ** 
grammartypeCF:laminationsLaminated   -1.499e-03  2.244e-02  -0.067 0.946748    
recurrenceRNN:laminationsLaminated   -5.940e-02  1.965e-02  -3.023 0.002506 ** 
recurrenceGRU:laminationsLaminated   -5.180e-02  1.983e-02  -2.612 0.009000 ** 
grammartypeLT:inputsize               4.924e-02  4.015e-03  12.266  < 2e-16 ***
grammartypeLTT:inputsize              1.622e-01  3.989e-03  40.650  < 2e-16 ***
grammartypeLTTO:inputsize             9.265e-02  4.003e-03  23.146  < 2e-16 ***
grammartypeMSO:inputsize              2.356e-01  3.606e-03  65.328  < 2e-16 ***
grammartypeCS:inputsize               1.506e-01  3.414e-03  44.094  < 2e-16 ***
grammartypeCF:inputsize               1.645e-01  3.375e-03  48.727  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

Type of estimator: ML (maximum likelihood)
Log-likelihood: 1.065e+06 on 78 Df
Pseudo R-squared: 0.1888
Number of iterations: 115 (BFGS) + 8 (Fisher scoring) 
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
   <th style="text-align:right;"> asymp.LCL </th>
   <th style="text-align:right;"> asymp.UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9648766 </td>
   <td style="text-align:right;"> 0.9619734 </td>
   <td style="text-align:right;"> 0.9675619 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9551700 </td>
   <td style="text-align:right;"> 0.9539526 </td>
   <td style="text-align:right;"> 0.9563560 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9781241 </td>
   <td style="text-align:right;"> 0.9774927 </td>
   <td style="text-align:right;"> 0.9787381 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9120299 </td>
   <td style="text-align:right;"> 0.9083231 </td>
   <td style="text-align:right;"> 0.9155939 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8811507 </td>
   <td style="text-align:right;"> 0.8794199 </td>
   <td style="text-align:right;"> 0.8828584 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9320257 </td>
   <td style="text-align:right;"> 0.9310213 </td>
   <td style="text-align:right;"> 0.9330159 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9253236 </td>
   <td style="text-align:right;"> 0.9229410 </td>
   <td style="text-align:right;"> 0.9276354 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8916301 </td>
   <td style="text-align:right;"> 0.8902937 </td>
   <td style="text-align:right;"> 0.8929511 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9374488 </td>
   <td style="text-align:right;"> 0.9366820 </td>
   <td style="text-align:right;"> 0.9382065 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9271725 </td>
   <td style="text-align:right;"> 0.9241216 </td>
   <td style="text-align:right;"> 0.9301054 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9032879 </td>
   <td style="text-align:right;"> 0.9018759 </td>
   <td style="text-align:right;"> 0.9046806 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9338164 </td>
   <td style="text-align:right;"> 0.9329847 </td>
   <td style="text-align:right;"> 0.9346382 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8683251 </td>
   <td style="text-align:right;"> 0.8651516 </td>
   <td style="text-align:right;"> 0.8714296 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8710945 </td>
   <td style="text-align:right;"> 0.8696894 </td>
   <td style="text-align:right;"> 0.8724855 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8963076 </td>
   <td style="text-align:right;"> 0.8949319 </td>
   <td style="text-align:right;"> 0.8976663 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9277360 </td>
   <td style="text-align:right;"> 0.9265455 </td>
   <td style="text-align:right;"> 0.9289079 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9322780 </td>
   <td style="text-align:right;"> 0.9317697 </td>
   <td style="text-align:right;"> 0.9327827 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9650355 </td>
   <td style="text-align:right;"> 0.9646254 </td>
   <td style="text-align:right;"> 0.9654409 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9253273 </td>
   <td style="text-align:right;"> 0.9234937 </td>
   <td style="text-align:right;"> 0.9271186 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9158566 </td>
   <td style="text-align:right;"> 0.9153111 </td>
   <td style="text-align:right;"> 0.9163987 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9545956 </td>
   <td style="text-align:right;"> 0.9542688 </td>
   <td style="text-align:right;"> 0.9549201 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Architectures By Grammar Type (Proportion Correct) (On Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 0.24902940 </td>
   <td style="text-align:right;"> 0.04304572 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 5.785230 </td>
   <td style="text-align:right;"> 0.00000002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.48027070 </td>
   <td style="text-align:right;"> 0.04344588 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.054459 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.72930011 </td>
   <td style="text-align:right;"> 0.02019395 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -36.114778 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.31776762 </td>
   <td style="text-align:right;"> 0.02340517 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 13.576811 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.26856337 </td>
   <td style="text-align:right;"> 0.02337266 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.490494 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.58633099 </td>
   <td style="text-align:right;"> 0.01104325 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -53.094062 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.39063507 </td>
   <td style="text-align:right;"> 0.01714762 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 22.780714 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.18361073 </td>
   <td style="text-align:right;"> 0.01703496 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -10.778466 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.57424580 </td>
   <td style="text-align:right;"> 0.00878794 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -65.344740 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.29650136 </td>
   <td style="text-align:right;"> 0.02299610 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 12.893552 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.09918873 </td>
   <td style="text-align:right;"> 0.02261318 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -4.386324 </td>
   <td style="text-align:right;"> 0.00003430 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.39569010 </td>
   <td style="text-align:right;"> 0.01019015 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -38.830631 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.02281124 </td>
   <td style="text-align:right;"> 0.01494820 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.526019 </td>
   <td style="text-align:right;"> 0.27865949 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.25443451 </td>
   <td style="text-align:right;"> 0.01549003 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -16.425690 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.23162328 </td>
   <td style="text-align:right;"> 0.00903762 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -25.628797 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.06732810 </td>
   <td style="text-align:right;"> 0.00936104 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.192371 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.74551990 </td>
   <td style="text-align:right;"> 0.01042665 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -71.501372 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.67819179 </td>
   <td style="text-align:right;"> 0.00721180 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -94.039228 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.12448045 </td>
   <td style="text-align:right;"> 0.01350040 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 9.220503 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.51291590 </td>
   <td style="text-align:right;"> 0.01357794 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -37.775687 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.63739635 </td>
   <td style="text-align:right;"> 0.00501926 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -126.989996 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Types By Architecture (Proportion Correct) (On Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 0.94599186 </td>
   <td style="text-align:right;"> 0.04679369 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 20.21622890 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.77502641 </td>
   <td style="text-align:right;"> 0.04449978 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 17.41641044 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.74897051 </td>
   <td style="text-align:right;"> 0.04664659 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 16.05627631 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.37340717 </td>
   <td style="text-align:right;"> 0.04327910 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 31.73372390 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.74090307 </td>
   <td style="text-align:right;"> 0.04216413 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 17.57187894 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.77497514 </td>
   <td style="text-align:right;"> 0.04322033 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 17.93080139 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.17096546 </td>
   <td style="text-align:right;"> 0.02762756 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.18822194 </td>
   <td style="text-align:right;"> 0.00000001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.19702135 </td>
   <td style="text-align:right;"> 0.03096683 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.36233581 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.42741530 </td>
   <td style="text-align:right;"> 0.02561540 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 16.68586942 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.20508879 </td>
   <td style="text-align:right;"> 0.02368337 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.65961148 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.17101672 </td>
   <td style="text-align:right;"> 0.02551567 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.70241889 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.02605589 </td>
   <td style="text-align:right;"> 0.02737768 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.95172045 </td>
   <td style="text-align:right;"> 0.96394666 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.59838076 </td>
   <td style="text-align:right;"> 0.02113542 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 28.31175582 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.03412333 </td>
   <td style="text-align:right;"> 0.01874635 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.82026546 </td>
   <td style="text-align:right;"> 0.53418630 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.00005126 </td>
   <td style="text-align:right;"> 0.02101494 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.00243938 </td>
   <td style="text-align:right;"> 1.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.62443665 </td>
   <td style="text-align:right;"> 0.02534593 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 24.63656840 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.00806744 </td>
   <td style="text-align:right;"> 0.02339195 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.34488102 </td>
   <td style="text-align:right;"> 0.99986694 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.02600463 </td>
   <td style="text-align:right;"> 0.02524493 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.03009305 </td>
   <td style="text-align:right;"> 0.94719995 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.63250409 </td>
   <td style="text-align:right;"> 0.01562638 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -40.47668894 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.59843202 </td>
   <td style="text-align:right;"> 0.01828867 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -32.72146173 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.03407207 </td>
   <td style="text-align:right;"> 0.01546605 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.20302277 </td>
   <td style="text-align:right;"> 0.29368795 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 1.01473008 </td>
   <td style="text-align:right;"> 0.01605276 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 63.21219344 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.91663207 </td>
   <td style="text-align:right;"> 0.01548325 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 59.20152357 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.79644247 </td>
   <td style="text-align:right;"> 0.01601380 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 49.73474411 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 1.10156653 </td>
   <td style="text-align:right;"> 0.01519835 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 72.47933436 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.42454557 </td>
   <td style="text-align:right;"> 0.01454010 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 29.19824932 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.65042619 </td>
   <td style="text-align:right;"> 0.01441087 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 45.13440783 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.09809801 </td>
   <td style="text-align:right;"> 0.01028612 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.53692632 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.21828761 </td>
   <td style="text-align:right;"> 0.01106866 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -19.72123157 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.08683644 </td>
   <td style="text-align:right;"> 0.00985225 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 8.81386993 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.59018451 </td>
   <td style="text-align:right;"> 0.00880283 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -67.04482874 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.36430389 </td>
   <td style="text-align:right;"> 0.00858759 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -42.42214449 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.12018960 </td>
   <td style="text-align:right;"> 0.01022518 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.75428236 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.18493446 </td>
   <td style="text-align:right;"> 0.00889407 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 20.79299642 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.49208650 </td>
   <td style="text-align:right;"> 0.00771523 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -63.78120217 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.26620588 </td>
   <td style="text-align:right;"> 0.00746888 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -35.64200611 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.30512405 </td>
   <td style="text-align:right;"> 0.00978863 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 31.17127749 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.37189691 </td>
   <td style="text-align:right;"> 0.00873156 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -42.59227855 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.14601628 </td>
   <td style="text-align:right;"> 0.00851449 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -17.14915709 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.67702096 </td>
   <td style="text-align:right;"> 0.00712628 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -95.00335359 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.45114034 </td>
   <td style="text-align:right;"> 0.00685909 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -65.77262208 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.22588062 </td>
   <td style="text-align:right;"> 0.00524099 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 43.09885612 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.15769920 </td>
   <td style="text-align:right;"> 0.01660471 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 69.72115373 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.07168638 </td>
   <td style="text-align:right;"> 0.01602583 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 66.87244158 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.13005248 </td>
   <td style="text-align:right;"> 0.01609637 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 70.20543143 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.59924336 </td>
   <td style="text-align:right;"> 0.01631281 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 98.03602341 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.47565388 </td>
   <td style="text-align:right;"> 0.01588280 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 29.94772900 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.74232995 </td>
   <td style="text-align:right;"> 0.01515277 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 48.98970452 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.08601282 </td>
   <td style="text-align:right;"> 0.01006804 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.54315533 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.02764672 </td>
   <td style="text-align:right;"> 0.01017992 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.71580952 </td>
   <td style="text-align:right;"> 0.09426897 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.44154415 </td>
   <td style="text-align:right;"> 0.01051898 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 41.97594444 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.68204532 </td>
   <td style="text-align:right;"> 0.00983897 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -69.32082184 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.41536926 </td>
   <td style="text-align:right;"> 0.00861075 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -48.23845961 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.05836611 </td>
   <td style="text-align:right;"> 0.00920554 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.34032705 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.52755698 </td>
   <td style="text-align:right;"> 0.00957905 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 55.07402820 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.59603250 </td>
   <td style="text-align:right;"> 0.00882662 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -67.52671345 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.32935643 </td>
   <td style="text-align:right;"> 0.00743335 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -44.30796872 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.46919087 </td>
   <td style="text-align:right;"> 0.00969671 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 48.38662158 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.65439860 </td>
   <td style="text-align:right;"> 0.00895445 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -73.08085527 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.38772254 </td>
   <td style="text-align:right;"> 0.00758429 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -51.12178201 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -1.12358947 </td>
   <td style="text-align:right;"> 0.00933720 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -120.33476216 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.85691341 </td>
   <td style="text-align:right;"> 0.00803349 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -106.66757334 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.26667606 </td>
   <td style="text-align:right;"> 0.00711948 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 37.45722220 </td>
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
   <td style="text-align:right;"> 3.421845 </td>
   <td style="text-align:right;"> 0.01816794 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.386237 </td>
   <td style="text-align:right;"> 3.457454 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.394440 </td>
   <td style="text-align:right;"> 0.01877960 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.357633 </td>
   <td style="text-align:right;"> 3.431248 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.359743 </td>
   <td style="text-align:right;"> 0.00969350 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.340744 </td>
   <td style="text-align:right;"> 2.378742 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.377595 </td>
   <td style="text-align:right;"> 0.01014467 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.357712 </td>
   <td style="text-align:right;"> 2.397478 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.497565 </td>
   <td style="text-align:right;"> 0.00804302 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.481801 </td>
   <td style="text-align:right;"> 2.513329 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.476490 </td>
   <td style="text-align:right;"> 0.00834154 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.460141 </td>
   <td style="text-align:right;"> 2.492839 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.523224 </td>
   <td style="text-align:right;"> 0.00935239 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.504894 </td>
   <td style="text-align:right;"> 2.541555 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.509418 </td>
   <td style="text-align:right;"> 0.00978124 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.490247 </td>
   <td style="text-align:right;"> 2.528588 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 2.071391 </td>
   <td style="text-align:right;"> 0.00643279 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.058783 </td>
   <td style="text-align:right;"> 2.083999 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 2.028750 </td>
   <td style="text-align:right;"> 0.00668848 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.015641 </td>
   <td style="text-align:right;"> 2.041859 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.911124 </td>
   <td style="text-align:right;"> 0.00495001 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.901422 </td>
   <td style="text-align:right;"> 2.920826 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.811093 </td>
   <td style="text-align:right;"> 0.00498206 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.801329 </td>
   <td style="text-align:right;"> 2.820858 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.713606 </td>
   <td style="text-align:right;"> 0.00522621 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.703363 </td>
   <td style="text-align:right;"> 2.723850 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.657525 </td>
   <td style="text-align:right;"> 0.00547992 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.646784 </td>
   <td style="text-align:right;"> 2.668265 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Laminations By Grammar Type (Proportion Correct) (On Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 0.02740467 </td>
   <td style="text-align:right;"> 0.01969964 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.391125 </td>
   <td style="text-align:right;"> 0.16418750 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.01785231 </td>
   <td style="text-align:right;"> 0.01101902 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.620135 </td>
   <td style="text-align:right;"> 0.10520329 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.02107521 </td>
   <td style="text-align:right;"> 0.00884709 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.382165 </td>
   <td style="text-align:right;"> 0.01721121 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.01380662 </td>
   <td style="text-align:right;"> 0.01019929 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.353684 </td>
   <td style="text-align:right;"> 0.17583719 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.04264060 </td>
   <td style="text-align:right;"> 0.00852363 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 5.002636 </td>
   <td style="text-align:right;"> 0.00000057 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.10003038 </td>
   <td style="text-align:right;"> 0.00626705 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 15.961330 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.05608154 </td>
   <td style="text-align:right;"> 0.00576458 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 9.728644 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Types By Laminations (Proportion Correct) (On Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 1.06210220 </td>
   <td style="text-align:right;"> 0.02052991 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 51.734372 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.92427968 </td>
   <td style="text-align:right;"> 0.01980593 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 46.666820 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.89862085 </td>
   <td style="text-align:right;"> 0.02036854 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 44.118080 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 1.35045438 </td>
   <td style="text-align:right;"> 0.01922389 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 70.248773 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.51072132 </td>
   <td style="text-align:right;"> 0.01879093 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 27.179142 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.70823866 </td>
   <td style="text-align:right;"> 0.01882803 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 37.616185 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.13782252 </td>
   <td style="text-align:right;"> 0.01249791 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.027647 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.16348135 </td>
   <td style="text-align:right;"> 0.01337071 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.226827 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.28835218 </td>
   <td style="text-align:right;"> 0.01155491 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 24.954949 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.55138089 </td>
   <td style="text-align:right;"> 0.01082096 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -50.954892 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.35386354 </td>
   <td style="text-align:right;"> 0.01088372 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -32.513108 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.02565883 </td>
   <td style="text-align:right;"> 0.01222913 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.098173 </td>
   <td style="text-align:right;"> 0.3536047 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.42617470 </td>
   <td style="text-align:right;"> 0.01021278 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 41.729569 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.41355836 </td>
   <td style="text-align:right;"> 0.00937465 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -44.114554 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.21604102 </td>
   <td style="text-align:right;"> 0.00944774 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -22.866960 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.45183353 </td>
   <td style="text-align:right;"> 0.01127043 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 40.090167 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.38789953 </td>
   <td style="text-align:right;"> 0.01052321 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -36.861329 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.19038219 </td>
   <td style="text-align:right;"> 0.01057633 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -18.000772 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.83973306 </td>
   <td style="text-align:right;"> 0.00803727 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -104.479894 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.64221572 </td>
   <td style="text-align:right;"> 0.00815980 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -78.704808 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.19751734 </td>
   <td style="text-align:right;"> 0.00708149 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 27.892062 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 1.01684523 </td>
   <td style="text-align:right;"> 0.02121207 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 47.937106 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.91795023 </td>
   <td style="text-align:right;"> 0.02041772 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 44.958504 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.88502280 </td>
   <td style="text-align:right;"> 0.02103584 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 42.072147 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 1.36569032 </td>
   <td style="text-align:right;"> 0.01982766 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 68.878045 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.58334703 </td>
   <td style="text-align:right;"> 0.01934211 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 30.159424 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.73691553 </td>
   <td style="text-align:right;"> 0.01940822 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 37.969258 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.09889500 </td>
   <td style="text-align:right;"> 0.01292738 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.650041 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.13182243 </td>
   <td style="text-align:right;"> 0.01388165 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.496167 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.34884509 </td>
   <td style="text-align:right;"> 0.01197629 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 29.127972 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.43349820 </td>
   <td style="text-align:right;"> 0.01115655 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -38.855945 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.27992970 </td>
   <td style="text-align:right;"> 0.01126704 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -24.845011 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.03292743 </td>
   <td style="text-align:right;"> 0.01263384 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.606288 </td>
   <td style="text-align:right;"> 0.1239413 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.44774009 </td>
   <td style="text-align:right;"> 0.01050280 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 42.630558 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.33460319 </td>
   <td style="text-align:right;"> 0.00955622 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -35.014183 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.18103470 </td>
   <td style="text-align:right;"> 0.00968986 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -18.682899 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.48066752 </td>
   <td style="text-align:right;"> 0.01166744 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 41.197356 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.30167577 </td>
   <td style="text-align:right;"> 0.01083180 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -27.850939 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.14810727 </td>
   <td style="text-align:right;"> 0.01093175 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -13.548361 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.78234328 </td>
   <td style="text-align:right;"> 0.00817415 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -95.709468 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.62877479 </td>
   <td style="text-align:right;"> 0.00837790 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -75.051639 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.15356850 </td>
   <td style="text-align:right;"> 0.00715639 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 21.458939 </td>
   <td style="text-align:right;"> 0.0000000 </td>
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
   <th style="text-align:right;"> asymp.LCL </th>
   <th style="text-align:right;"> asymp.UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.9256006 </td>
   <td style="text-align:right;"> 0.9242804 </td>
   <td style="text-align:right;"> 0.9268987 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.9263911 </td>
   <td style="text-align:right;"> 0.9249640 </td>
   <td style="text-align:right;"> 0.9277921 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.9159286 </td>
   <td style="text-align:right;"> 0.9153083 </td>
   <td style="text-align:right;"> 0.9165446 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.9073162 </td>
   <td style="text-align:right;"> 0.9066550 </td>
   <td style="text-align:right;"> 0.9079729 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9482825 </td>
   <td style="text-align:right;"> 0.9478815 </td>
   <td style="text-align:right;"> 0.9486805 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9476164 </td>
   <td style="text-align:right;"> 0.9472093 </td>
   <td style="text-align:right;"> 0.9480204 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Recurrence By Lamination (Proportion Correct) (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 0.1273987 </td>
   <td style="text-align:right;"> 0.00988323 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 12.89039 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.3756254 </td>
   <td style="text-align:right;"> 0.01000886 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -37.52929 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.5030240 </td>
   <td style="text-align:right;"> 0.00525799 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -95.66845 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.2406798 </td>
   <td style="text-align:right;"> 0.01056642 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 22.77780 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.3513757 </td>
   <td style="text-align:right;"> 0.01073350 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -32.73635 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.5920555 </td>
   <td style="text-align:right;"> 0.00518921 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -114.09346 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Types By Architecture (Proportion Correct) (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> -0.01110265 </td>
   <td style="text-align:right;"> 0.01021559 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.086834 </td>
   <td style="text-align:right;"> 0.27711019 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.10217850 </td>
   <td style="text-align:right;"> 0.00500187 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 20.428054 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.01314703 </td>
   <td style="text-align:right;"> 0.00528903 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.485719 </td>
   <td style="text-align:right;"> 0.01292901 </td>
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
   <td style="text-align:right;"> 4.283320 </td>
   <td style="text-align:right;"> 0.02715064 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.230105 </td>
   <td style="text-align:right;"> 4.336534 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 4.131702 </td>
   <td style="text-align:right;"> 0.02470670 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.083278 </td>
   <td style="text-align:right;"> 4.180127 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.980085 </td>
   <td style="text-align:right;"> 0.02238346 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.936214 </td>
   <td style="text-align:right;"> 4.023956 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.828468 </td>
   <td style="text-align:right;"> 0.02022255 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.788832 </td>
   <td style="text-align:right;"> 3.868103 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.676851 </td>
   <td style="text-align:right;"> 0.01828165 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.641019 </td>
   <td style="text-align:right;"> 3.712682 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.525233 </td>
   <td style="text-align:right;"> 0.01663790 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.492624 </td>
   <td style="text-align:right;"> 3.557843 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.373616 </td>
   <td style="text-align:right;"> 0.01538686 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.343458 </td>
   <td style="text-align:right;"> 3.403774 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.221999 </td>
   <td style="text-align:right;"> 0.01462960 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.193325 </td>
   <td style="text-align:right;"> 3.250672 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 3.070382 </td>
   <td style="text-align:right;"> 0.01444401 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.042072 </td>
   <td style="text-align:right;"> 3.098691 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 2.918764 </td>
   <td style="text-align:right;"> 0.01485153 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.889656 </td>
   <td style="text-align:right;"> 2.947873 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 2.767147 </td>
   <td style="text-align:right;"> 0.01580636 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.736167 </td>
   <td style="text-align:right;"> 2.798127 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 2.615530 </td>
   <td style="text-align:right;"> 0.01721767 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.581784 </td>
   <td style="text-align:right;"> 2.649276 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.877094 </td>
   <td style="text-align:right;"> 0.01437273 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.848924 </td>
   <td style="text-align:right;"> 2.905264 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.789013 </td>
   <td style="text-align:right;"> 0.01305071 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.763434 </td>
   <td style="text-align:right;"> 2.814592 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.700933 </td>
   <td style="text-align:right;"> 0.01179854 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.677808 </td>
   <td style="text-align:right;"> 2.724058 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.612852 </td>
   <td style="text-align:right;"> 0.01064090 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.591997 </td>
   <td style="text-align:right;"> 2.633708 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.524772 </td>
   <td style="text-align:right;"> 0.00961202 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.505933 </td>
   <td style="text-align:right;"> 2.543611 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.436692 </td>
   <td style="text-align:right;"> 0.00875738 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.419527 </td>
   <td style="text-align:right;"> 2.453856 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.348611 </td>
   <td style="text-align:right;"> 0.00813213 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.332672 </td>
   <td style="text-align:right;"> 2.364550 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.260531 </td>
   <td style="text-align:right;"> 0.00779166 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.245259 </td>
   <td style="text-align:right;"> 2.275802 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.172450 </td>
   <td style="text-align:right;"> 0.00777350 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.157214 </td>
   <td style="text-align:right;"> 2.187686 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 2.084370 </td>
   <td style="text-align:right;"> 0.00807981 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.068534 </td>
   <td style="text-align:right;"> 2.100206 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 1.996289 </td>
   <td style="text-align:right;"> 0.00867630 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.979284 </td>
   <td style="text-align:right;"> 2.013295 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 1.908209 </td>
   <td style="text-align:right;"> 0.00950852 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.889572 </td>
   <td style="text-align:right;"> 1.926845 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 3.118306 </td>
   <td style="text-align:right;"> 0.01304509 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.092739 </td>
   <td style="text-align:right;"> 3.143874 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 3.008943 </td>
   <td style="text-align:right;"> 0.01182655 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.985763 </td>
   <td style="text-align:right;"> 3.032122 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.899579 </td>
   <td style="text-align:right;"> 0.01064707 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.878711 </td>
   <td style="text-align:right;"> 2.920447 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.790215 </td>
   <td style="text-align:right;"> 0.00952115 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.771554 </td>
   <td style="text-align:right;"> 2.808876 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.680851 </td>
   <td style="text-align:right;"> 0.00847020 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.664250 </td>
   <td style="text-align:right;"> 2.697452 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.571487 </td>
   <td style="text-align:right;"> 0.00752567 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.556737 </td>
   <td style="text-align:right;"> 2.586237 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.462123 </td>
   <td style="text-align:right;"> 0.00673252 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.448928 </td>
   <td style="text-align:right;"> 2.475319 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.352759 </td>
   <td style="text-align:right;"> 0.00614959 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.340706 </td>
   <td style="text-align:right;"> 2.364812 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.243395 </td>
   <td style="text-align:right;"> 0.00584018 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.231949 </td>
   <td style="text-align:right;"> 2.254842 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.134031 </td>
   <td style="text-align:right;"> 0.00584787 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.122570 </td>
   <td style="text-align:right;"> 2.145493 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 2.024668 </td>
   <td style="text-align:right;"> 0.00617147 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.012572 </td>
   <td style="text-align:right;"> 2.036763 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 1.915304 </td>
   <td style="text-align:right;"> 0.00676581 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.902043 </td>
   <td style="text-align:right;"> 1.928564 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.892546 </td>
   <td style="text-align:right;"> 0.01359602 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.865898 </td>
   <td style="text-align:right;"> 2.919194 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.827368 </td>
   <td style="text-align:right;"> 0.01240650 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.803052 </td>
   <td style="text-align:right;"> 2.851684 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.762190 </td>
   <td style="text-align:right;"> 0.01128240 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.740077 </td>
   <td style="text-align:right;"> 2.784303 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.697012 </td>
   <td style="text-align:right;"> 0.01024528 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.676932 </td>
   <td style="text-align:right;"> 2.717093 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.631834 </td>
   <td style="text-align:right;"> 0.00932421 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.613559 </td>
   <td style="text-align:right;"> 2.650109 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.566656 </td>
   <td style="text-align:right;"> 0.00855673 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.549885 </td>
   <td style="text-align:right;"> 2.583427 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.501478 </td>
   <td style="text-align:right;"> 0.00798726 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.485824 </td>
   <td style="text-align:right;"> 2.517133 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.436301 </td>
   <td style="text-align:right;"> 0.00766008 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.421287 </td>
   <td style="text-align:right;"> 2.451314 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.371123 </td>
   <td style="text-align:right;"> 0.00760652 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.356214 </td>
   <td style="text-align:right;"> 2.386031 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.305945 </td>
   <td style="text-align:right;"> 0.00783219 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.290594 </td>
   <td style="text-align:right;"> 2.321295 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.240767 </td>
   <td style="text-align:right;"> 0.00831440 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.224471 </td>
   <td style="text-align:right;"> 2.257063 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 2.175589 </td>
   <td style="text-align:right;"> 0.00901204 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.157926 </td>
   <td style="text-align:right;"> 2.193252 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 1.049896 </td>
   <td style="text-align:right;"> 0.01011922 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.030063 </td>
   <td style="text-align:right;"> 1.069730 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 1.223168 </td>
   <td style="text-align:right;"> 0.00899271 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.205543 </td>
   <td style="text-align:right;"> 1.240794 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 1.396440 </td>
   <td style="text-align:right;"> 0.00792053 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.380916 </td>
   <td style="text-align:right;"> 1.411964 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 1.569712 </td>
   <td style="text-align:right;"> 0.00692796 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.556134 </td>
   <td style="text-align:right;"> 1.583291 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 1.742984 </td>
   <td style="text-align:right;"> 0.00605429 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.731118 </td>
   <td style="text-align:right;"> 1.754851 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 1.916256 </td>
   <td style="text-align:right;"> 0.00535799 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.905755 </td>
   <td style="text-align:right;"> 1.926758 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 2.089528 </td>
   <td style="text-align:right;"> 0.00491504 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.079895 </td>
   <td style="text-align:right;"> 2.099162 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 2.262800 </td>
   <td style="text-align:right;"> 0.00479614 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.253400 </td>
   <td style="text-align:right;"> 2.272201 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 2.436072 </td>
   <td style="text-align:right;"> 0.00502436 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.426225 </td>
   <td style="text-align:right;"> 2.445920 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 2.609344 </td>
   <td style="text-align:right;"> 0.00555710 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.598453 </td>
   <td style="text-align:right;"> 2.620236 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 2.782616 </td>
   <td style="text-align:right;"> 0.00631778 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.770234 </td>
   <td style="text-align:right;"> 2.794999 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 2.955888 </td>
   <td style="text-align:right;"> 0.00723486 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.941708 </td>
   <td style="text-align:right;"> 2.970068 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.948919 </td>
   <td style="text-align:right;"> 0.00816333 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.932919 </td>
   <td style="text-align:right;"> 2.964919 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.933706 </td>
   <td style="text-align:right;"> 0.00729714 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.919404 </td>
   <td style="text-align:right;"> 2.948008 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.918494 </td>
   <td style="text-align:right;"> 0.00645818 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.905836 </td>
   <td style="text-align:right;"> 2.931152 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.903282 </td>
   <td style="text-align:right;"> 0.00565860 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.892191 </td>
   <td style="text-align:right;"> 2.914372 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.888069 </td>
   <td style="text-align:right;"> 0.00491762 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.878431 </td>
   <td style="text-align:right;"> 2.897707 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.872857 </td>
   <td style="text-align:right;"> 0.00426589 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.864496 </td>
   <td style="text-align:right;"> 2.881218 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.857644 </td>
   <td style="text-align:right;"> 0.00375025 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.850294 </td>
   <td style="text-align:right;"> 2.864995 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.842432 </td>
   <td style="text-align:right;"> 0.00343257 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.835704 </td>
   <td style="text-align:right;"> 2.849160 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.827220 </td>
   <td style="text-align:right;"> 0.00336933 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.820616 </td>
   <td style="text-align:right;"> 2.833823 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.812007 </td>
   <td style="text-align:right;"> 0.00357405 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.805002 </td>
   <td style="text-align:right;"> 2.819012 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.796795 </td>
   <td style="text-align:right;"> 0.00400586 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.788943 </td>
   <td style="text-align:right;"> 2.804646 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 2.781582 </td>
   <td style="text-align:right;"> 0.00460127 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.772564 </td>
   <td style="text-align:right;"> 2.790601 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.119681 </td>
   <td style="text-align:right;"> 0.00674680 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.106457 </td>
   <td style="text-align:right;"> 2.132904 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.217716 </td>
   <td style="text-align:right;"> 0.00621464 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.205535 </td>
   <td style="text-align:right;"> 2.229896 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.315751 </td>
   <td style="text-align:right;"> 0.00572613 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.304528 </td>
   <td style="text-align:right;"> 2.326974 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.413786 </td>
   <td style="text-align:right;"> 0.00529335 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.403411 </td>
   <td style="text-align:right;"> 2.424160 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.511821 </td>
   <td style="text-align:right;"> 0.00493102 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.502156 </td>
   <td style="text-align:right;"> 2.521485 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.609856 </td>
   <td style="text-align:right;"> 0.00465560 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.600731 </td>
   <td style="text-align:right;"> 2.618980 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.707890 </td>
   <td style="text-align:right;"> 0.00448314 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.699104 </td>
   <td style="text-align:right;"> 2.716677 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.805925 </td>
   <td style="text-align:right;"> 0.00442570 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.797251 </td>
   <td style="text-align:right;"> 2.814600 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 2.903960 </td>
   <td style="text-align:right;"> 0.00448769 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.895165 </td>
   <td style="text-align:right;"> 2.912756 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 3.001995 </td>
   <td style="text-align:right;"> 0.00466435 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.992853 </td>
   <td style="text-align:right;"> 3.011137 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 3.100030 </td>
   <td style="text-align:right;"> 0.00494341 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.090341 </td>
   <td style="text-align:right;"> 3.109719 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 3.198065 </td>
   <td style="text-align:right;"> 0.00530875 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.187660 </td>
   <td style="text-align:right;"> 3.208470 </td>
  </tr>
</tbody>
</table>

### Slope of layers

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Predicted mean proportion correct across layers grid
Results averaged over the levels of: recurrence, laminations, grammartype</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> Layers </th>
   <th style="text-align:right;"> Estimate </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.9451131 </td>
   <td style="text-align:right;"> 0.9445813 </td>
   <td style="text-align:right;"> 0.9456398 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.9354196 </td>
   <td style="text-align:right;"> 0.9350047 </td>
   <td style="text-align:right;"> 0.9358319 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.9240841 </td>
   <td style="text-align:right;"> 0.9235786 </td>
   <td style="text-align:right;"> 0.9245863 </td>
  </tr>
</tbody>
</table>

### Slope of neurons

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Predicted mean proportion correct across neurons grid
Results averaged over the levels of: recurrence, laminations, grammartype</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> Neurons </th>
   <th style="text-align:right;"> Estimate </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 0.9119151 </td>
   <td style="text-align:right;"> 0.9112727 </td>
   <td style="text-align:right;"> 0.9125532 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:right;"> 0.9145842 </td>
   <td style="text-align:right;"> 0.9139881 </td>
   <td style="text-align:right;"> 0.9151763 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 96 </td>
   <td style="text-align:right;"> 0.9171761 </td>
   <td style="text-align:right;"> 0.9166214 </td>
   <td style="text-align:right;"> 0.9177274 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 128 </td>
   <td style="text-align:right;"> 0.9196929 </td>
   <td style="text-align:right;"> 0.9191743 </td>
   <td style="text-align:right;"> 0.9202084 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 0.9221365 </td>
   <td style="text-align:right;"> 0.9216489 </td>
   <td style="text-align:right;"> 0.9226212 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 192 </td>
   <td style="text-align:right;"> 0.9245088 </td>
   <td style="text-align:right;"> 0.9240470 </td>
   <td style="text-align:right;"> 0.9249679 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 224 </td>
   <td style="text-align:right;"> 0.9268118 </td>
   <td style="text-align:right;"> 0.9263708 </td>
   <td style="text-align:right;"> 0.9272502 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 256 </td>
   <td style="text-align:right;"> 0.9290472 </td>
   <td style="text-align:right;"> 0.9286221 </td>
   <td style="text-align:right;"> 0.9294697 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 288 </td>
   <td style="text-align:right;"> 0.9312169 </td>
   <td style="text-align:right;"> 0.9308032 </td>
   <td style="text-align:right;"> 0.9316281 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 320 </td>
   <td style="text-align:right;"> 0.9333226 </td>
   <td style="text-align:right;"> 0.9329163 </td>
   <td style="text-align:right;"> 0.9337266 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 352 </td>
   <td style="text-align:right;"> 0.9353662 </td>
   <td style="text-align:right;"> 0.9349634 </td>
   <td style="text-align:right;"> 0.9357665 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 384 </td>
   <td style="text-align:right;"> 0.9373492 </td>
   <td style="text-align:right;"> 0.9369469 </td>
   <td style="text-align:right;"> 0.9377490 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 416 </td>
   <td style="text-align:right;"> 0.9392734 </td>
   <td style="text-align:right;"> 0.9388690 </td>
   <td style="text-align:right;"> 0.9396752 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 448 </td>
   <td style="text-align:right;"> 0.9411404 </td>
   <td style="text-align:right;"> 0.9407317 </td>
   <td style="text-align:right;"> 0.9415463 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 480 </td>
   <td style="text-align:right;"> 0.9429517 </td>
   <td style="text-align:right;"> 0.9425373 </td>
   <td style="text-align:right;"> 0.9433632 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 512 </td>
   <td style="text-align:right;"> 0.9447089 </td>
   <td style="text-align:right;"> 0.9442876 </td>
   <td style="text-align:right;"> 0.9451272 </td>
  </tr>
</tbody>
</table>



# Exploring Input size

One of the findings is that input size heavily impacts performance. It is possible that the recurrent architectures are performing well on context-free and context-sensitive grammars because they are able to use a finite-state strategy when given a large enough input size. 

Therefore, we need to see whether the effects are robust when we filter the data in that way.## Inverse Brier Score Model

```
Call:
betareg::betareg(formula = formulas_inverse_brier_phi$M1g, data = df_filtered, link = "loglog")

Quantile residuals:
    Min      1Q  Median      3Q     Max 
-5.8877 -0.7088  0.0672  0.7597  3.7068 

Coefficients (mean model with loglog link):
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           4.179e+00  4.572e-02  91.388  < 2e-16 ***
recurrenceRNN                        -2.408e-01  3.792e-02  -6.351 2.14e-10 ***
recurrenceGRU                         3.403e-01  3.771e-02   9.025  < 2e-16 ***
laminationsLaminated                 -1.459e-03  1.833e-02  -0.080 0.936567    
inputsize                            -1.553e-01  2.464e-03 -63.037  < 2e-16 ***
grammartypeLT                        -1.509e+00  5.236e-02 -28.816  < 2e-16 ***
grammartypeLTT                       -1.213e+00  4.939e-02 -24.566  < 2e-16 ***
grammartypeLTTO                      -1.420e+00  5.187e-02 -27.379  < 2e-16 ***
grammartypeMSO                       -3.629e+00  4.820e-02 -75.302  < 2e-16 ***
grammartypeCS                        -5.264e+00  6.102e-02 -86.265  < 2e-16 ***
grammartypeCF                        -3.073e+00  5.019e-02 -61.233  < 2e-16 ***
neurons                               5.740e-04  9.695e-06  59.204  < 2e-16 ***
layers                               -1.499e-02  2.678e-03  -5.596 2.19e-08 ***
recurrenceRNN:grammartypeLT          -2.467e-02  4.361e-02  -0.566 0.571633    
recurrenceGRU:grammartypeLT          -1.339e-01  4.337e-02  -3.087 0.002025 ** 
recurrenceRNN:grammartypeLTT         -9.531e-02  4.090e-02  -2.330 0.019790 *  
recurrenceGRU:grammartypeLTT         -2.133e-01  4.057e-02  -5.257 1.46e-07 ***
recurrenceRNN:grammartypeLTTO        -2.814e-02  4.342e-02  -0.648 0.516811    
recurrenceGRU:grammartypeLTTO        -2.887e-01  4.307e-02  -6.704 2.03e-11 ***
recurrenceRNN:grammartypeMSO          4.094e-01  3.967e-02  10.322  < 2e-16 ***
recurrenceGRU:grammartypeMSO         -1.303e-01  3.959e-02  -3.292 0.000994 ***
recurrenceRNN:grammartypeCS           2.903e+00  5.065e-02  57.315  < 2e-16 ***
recurrenceGRU:grammartypeCS           2.583e+00  5.041e-02  51.245  < 2e-16 ***
recurrenceRNN:grammartypeCF           5.488e-01  4.131e-02  13.284  < 2e-16 ***
recurrenceGRU:grammartypeCF           3.459e-01  4.102e-02   8.432  < 2e-16 ***
grammartypeLT:laminationsLaminated    5.044e-02  1.908e-02   2.644 0.008191 ** 
grammartypeLTT:laminationsLaminated   1.361e-02  1.800e-02   0.756 0.449483    
grammartypeLTTO:laminationsLaminated  2.070e-02  1.876e-02   1.104 0.269717    
grammartypeMSO:laminationsLaminated   1.458e-02  1.791e-02   0.814 0.415423    
grammartypeCS:laminationsLaminated   -4.341e-02  1.764e-02  -2.461 0.013837 *  
grammartypeCF:laminationsLaminated    4.367e-03  1.722e-02   0.254 0.799741    
recurrenceRNN:laminationsLaminated   -8.856e-02  9.453e-03  -9.369  < 2e-16 ***
recurrenceGRU:laminationsLaminated   -5.517e-02  9.216e-03  -5.987 2.14e-09 ***
grammartypeLT:inputsize               7.649e-02  2.874e-03  26.618  < 2e-16 ***
grammartypeLTT:inputsize              5.815e-02  2.729e-03  21.308  < 2e-16 ***
grammartypeLTTO:inputsize             9.769e-02  2.823e-03  34.605  < 2e-16 ***
grammartypeMSO:inputsize              3.120e-01  2.737e-03 113.978  < 2e-16 ***
grammartypeCS:inputsize               4.361e-01  4.172e-03 104.540  < 2e-16 ***
grammartypeCF:inputsize               2.888e-01  2.976e-03  97.037  < 2e-16 ***

Phi coefficients (precision model with log link):
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           2.401e+00  5.220e-02  45.996  < 2e-16 ***
recurrenceRNN                        -2.478e-01  4.293e-02  -5.772 7.83e-09 ***
recurrenceGRU                         6.250e-01  4.298e-02  14.540  < 2e-16 ***
laminationsLaminated                 -2.371e-02  2.590e-02  -0.915  0.35998    
inputsize                            -1.066e-01  2.767e-03 -38.538  < 2e-16 ***
grammartypeLT                         5.039e-01  6.867e-02   7.338 2.17e-13 ***
grammartypeLTT                        6.556e-01  6.830e-02   9.599  < 2e-16 ***
grammartypeLTTO                       5.944e-01  6.894e-02   8.622  < 2e-16 ***
grammartypeMSO                        7.555e-01  6.023e-02  12.543  < 2e-16 ***
grammartypeCS                         1.358e-01  9.075e-02   1.497  0.13446    
grammartypeCF                        -1.072e+00  6.586e-02 -16.281  < 2e-16 ***
neurons                               5.242e-04  1.662e-05  31.531  < 2e-16 ***
layers                               -3.631e-02  4.714e-03  -7.702 1.34e-14 ***
recurrenceRNN:grammartypeLT          -2.714e-01  5.780e-02  -4.696 2.66e-06 ***
recurrenceGRU:grammartypeLT          -5.439e-01  5.792e-02  -9.391  < 2e-16 ***
recurrenceRNN:grammartypeLTT         -2.916e-01  5.760e-02  -5.063 4.12e-07 ***
recurrenceGRU:grammartypeLTT         -3.445e-01  5.765e-02  -5.976 2.29e-09 ***
recurrenceRNN:grammartypeLTTO        -2.488e-01  5.821e-02  -4.275 1.91e-05 ***
recurrenceGRU:grammartypeLTTO        -4.644e-01  5.825e-02  -7.972 1.56e-15 ***
recurrenceRNN:grammartypeMSO         -1.623e+00  5.075e-02 -31.981  < 2e-16 ***
recurrenceGRU:grammartypeMSO         -2.784e+00  5.084e-02 -54.754  < 2e-16 ***
recurrenceRNN:grammartypeCS           2.584e-02  7.449e-02   0.347  0.72869    
recurrenceGRU:grammartypeCS          -2.425e-01  7.449e-02  -3.256  0.00113 ** 
recurrenceRNN:grammartypeCF           5.192e-01  5.356e-02   9.695  < 2e-16 ***
recurrenceGRU:grammartypeCF           4.961e-01  5.355e-02   9.265  < 2e-16 ***
grammartypeLT:laminationsLaminated   -4.919e-03  2.457e-02  -0.200  0.84130    
grammartypeLTT:laminationsLaminated  -1.379e-02  2.429e-02  -0.568  0.57019    
grammartypeLTTO:laminationsLaminated -3.871e-02  2.456e-02  -1.576  0.11495    
grammartypeMSO:laminationsLaminated  -4.815e-03  2.148e-02  -0.224  0.82266    
grammartypeCS:laminationsLaminated   -3.806e-02  2.233e-02  -1.704  0.08832 .  
grammartypeCF:laminationsLaminated   -3.413e-02  2.114e-02  -1.614  0.10648    
recurrenceRNN:laminationsLaminated   -3.896e-02  1.995e-02  -1.953  0.05087 .  
recurrenceGRU:laminationsLaminated    5.503e-02  1.995e-02   2.758  0.00582 ** 
grammartypeLT:inputsize               5.884e-02  3.679e-03  15.994  < 2e-16 ***
grammartypeLTT:inputsize              1.116e-01  3.647e-03  30.602  < 2e-16 ***
grammartypeLTTO:inputsize             8.232e-02  3.676e-03  22.393  < 2e-16 ***
grammartypeMSO:inputsize              1.858e-01  3.241e-03  57.338  < 2e-16 ***
grammartypeCS:inputsize               1.993e-01  6.700e-03  29.740  < 2e-16 ***
grammartypeCF:inputsize               2.874e-01  4.219e-03  68.128  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

Type of estimator: ML (maximum likelihood)
Log-likelihood: 5.67e+05 on 78 Df
Pseudo R-squared: 0.2694
Number of iterations: 102 (BFGS) + 6 (Fisher scoring) 
```


### Recurrence-Grammar Interaction


#### Estimated Marginal Means (EMMs)

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Recurrence × Grammar Type EMMs (Inverse Brier Score)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Architecture </th>
   <th style="text-align:left;"> Grammar Type </th>
   <th style="text-align:right;"> Inverse Brier Score </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9673142 </td>
   <td style="text-align:right;"> 0.9648977 </td>
   <td style="text-align:right;"> 0.9695671 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9567674 </td>
   <td style="text-align:right;"> 0.9556713 </td>
   <td style="text-align:right;"> 0.9578369 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9759855 </td>
   <td style="text-align:right;"> 0.9754243 </td>
   <td style="text-align:right;"> 0.9765341 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9099307 </td>
   <td style="text-align:right;"> 0.9062689 </td>
   <td style="text-align:right;"> 0.9134563 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8792728 </td>
   <td style="text-align:right;"> 0.8775722 </td>
   <td style="text-align:right;"> 0.8809514 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9241057 </td>
   <td style="text-align:right;"> 0.9230731 </td>
   <td style="text-align:right;"> 0.9251250 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9235781 </td>
   <td style="text-align:right;"> 0.9213025 </td>
   <td style="text-align:right;"> 0.9257905 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8902085 </td>
   <td style="text-align:right;"> 0.8888803 </td>
   <td style="text-align:right;"> 0.8915217 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9305537 </td>
   <td style="text-align:right;"> 0.9298205 </td>
   <td style="text-align:right;"> 0.9312796 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9253251 </td>
   <td style="text-align:right;"> 0.9223287 </td>
   <td style="text-align:right;"> 0.9282105 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8992810 </td>
   <td style="text-align:right;"> 0.8978675 </td>
   <td style="text-align:right;"> 0.9006759 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9270304 </td>
   <td style="text-align:right;"> 0.9261434 </td>
   <td style="text-align:right;"> 0.9279070 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8131491 </td>
   <td style="text-align:right;"> 0.8094777 </td>
   <td style="text-align:right;"> 0.8167580 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8330530 </td>
   <td style="text-align:right;"> 0.8314406 </td>
   <td style="text-align:right;"> 0.8346516 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8416790 </td>
   <td style="text-align:right;"> 0.8399423 </td>
   <td style="text-align:right;"> 0.8433987 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.5858526 </td>
   <td style="text-align:right;"> 0.5722226 </td>
   <td style="text-align:right;"> 0.5992121 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9617458 </td>
   <td style="text-align:right;"> 0.9607752 </td>
   <td style="text-align:right;"> 0.9626929 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9708856 </td>
   <td style="text-align:right;"> 0.9701653 </td>
   <td style="text-align:right;"> 0.9715888 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8725927 </td>
   <td style="text-align:right;"> 0.8694385 </td>
   <td style="text-align:right;"> 0.8756763 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9006021 </td>
   <td style="text-align:right;"> 0.8995231 </td>
   <td style="text-align:right;"> 0.9016701 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9318952 </td>
   <td style="text-align:right;"> 0.9312390 </td>
   <td style="text-align:right;"> 0.9325454 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Architectures By Grammar Type (Inverse Brier Score) (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 0.28510268 </td>
   <td style="text-align:right;"> 0.03770868 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.560665 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.31272324 </td>
   <td style="text-align:right;"> 0.03750802 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.337503 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.59782592 </td>
   <td style="text-align:right;"> 0.01689161 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -35.391891 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.30977186 </td>
   <td style="text-align:right;"> 0.02196960 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 14.100024 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.17885572 </td>
   <td style="text-align:right;"> 0.02183538 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.191097 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.48862758 </td>
   <td style="text-align:right;"> 0.01019850 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -47.911730 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.38041335 </td>
   <td style="text-align:right;"> 0.01591822 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 23.897990 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.09943128 </td>
   <td style="text-align:right;"> 0.01554377 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.396857 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.47984463 </td>
   <td style="text-align:right;"> 0.00796903 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -60.213668 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.31324755 </td>
   <td style="text-align:right;"> 0.02157709 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 14.517602 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.02400875 </td>
   <td style="text-align:right;"> 0.02122870 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.130957 </td>
   <td style="text-align:right;"> 0.4949445 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.33725631 </td>
   <td style="text-align:right;"> 0.00961391 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -35.080042 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.12433365 </td>
   <td style="text-align:right;"> 0.01240038 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -10.026598 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.18238394 </td>
   <td style="text-align:right;"> 0.01275474 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -14.299308 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.05805029 </td>
   <td style="text-align:right;"> 0.00808837 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.177009 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -2.61798866 </td>
   <td style="text-align:right;"> 0.03384781 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -77.345889 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -2.89571083 </td>
   <td style="text-align:right;"> 0.03370208 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -85.920843 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.27772217 </td>
   <td style="text-align:right;"> 0.00753449 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -36.860137 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.26373802 </td>
   <td style="text-align:right;"> 0.01695392 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -15.556167 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.65865111 </td>
   <td style="text-align:right;"> 0.01668892 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -39.466373 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.39491309 </td>
   <td style="text-align:right;"> 0.00584788 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -67.530935 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Type By Architecture (Inverse Brier Score) (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 1.04389240 </td>
   <td style="text-align:right;"> 0.04270973 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 24.441561 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.87224700 </td>
   <td style="text-align:right;"> 0.04014628 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 21.726722 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.84818822 </td>
   <td style="text-align:right;"> 0.04248388 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 19.964942 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.82843981 </td>
   <td style="text-align:right;"> 0.03861076 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 47.355708 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 2.77817219 </td>
   <td style="text-align:right;"> 0.04303776 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 64.551972 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.41124889 </td>
   <td style="text-align:right;"> 0.03934052 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 35.872654 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.17164541 </td>
   <td style="text-align:right;"> 0.02638311 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.505882 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.19570418 </td>
   <td style="text-align:right;"> 0.02981961 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.562936 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.78454740 </td>
   <td style="text-align:right;"> 0.02398253 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 32.713287 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.73427979 </td>
   <td style="text-align:right;"> 0.03060464 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 56.667217 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.36735649 </td>
   <td style="text-align:right;"> 0.02514008 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 14.612386 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.02405878 </td>
   <td style="text-align:right;"> 0.02601585 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.924774 </td>
   <td style="text-align:right;"> 0.96871122 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.95619281 </td>
   <td style="text-align:right;"> 0.01904632 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 50.203546 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.90592519 </td>
   <td style="text-align:right;"> 0.02691147 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 70.822051 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.53900189 </td>
   <td style="text-align:right;"> 0.02048485 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 26.312216 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.98025158 </td>
   <td style="text-align:right;"> 0.02357814 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 41.574590 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.92998397 </td>
   <td style="text-align:right;"> 0.03028875 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 63.719500 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.56306067 </td>
   <td style="text-align:right;"> 0.02475437 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 22.745910 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.94973238 </td>
   <td style="text-align:right;"> 0.02456122 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 38.667962 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.41719092 </td>
   <td style="text-align:right;"> 0.01728340 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -24.138244 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -1.36692330 </td>
   <td style="text-align:right;"> 0.02569393 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -53.200245 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 1.06856158 </td>
   <td style="text-align:right;"> 0.01512392 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 70.653733 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.96755766 </td>
   <td style="text-align:right;"> 0.01459536 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 66.292150 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.87633309 </td>
   <td style="text-align:right;"> 0.01506593 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 58.166547 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 1.41900348 </td>
   <td style="text-align:right;"> 0.01412953 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 100.428216 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.12491915 </td>
   <td style="text-align:right;"> 0.01845829 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.767644 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.86240818 </td>
   <td style="text-align:right;"> 0.01429724 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 60.319908 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.10100392 </td>
   <td style="text-align:right;"> 0.01002092 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -10.079308 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.19222849 </td>
   <td style="text-align:right;"> 0.01069459 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -17.974368 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.35044190 </td>
   <td style="text-align:right;"> 0.00932953 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 37.562651 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -1.19348073 </td>
   <td style="text-align:right;"> 0.01510319 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -79.021753 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.20615340 </td>
   <td style="text-align:right;"> 0.00958148 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -21.515822 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.09122457 </td>
   <td style="text-align:right;"> 0.00993315 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.183854 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.45144581 </td>
   <td style="text-align:right;"> 0.00844584 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 53.451860 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -1.09247681 </td>
   <td style="text-align:right;"> 0.01457386 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -74.961403 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.10514948 </td>
   <td style="text-align:right;"> 0.00872337 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.053765 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.54267038 </td>
   <td style="text-align:right;"> 0.00923520 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 58.761057 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -1.00125225 </td>
   <td style="text-align:right;"> 0.01504511 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -66.550013 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.01392491 </td>
   <td style="text-align:right;"> 0.00948964 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.467380 </td>
   <td style="text-align:right;"> 0.76432643 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -1.54392263 </td>
   <td style="text-align:right;"> 0.01410736 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -109.440907 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.55659529 </td>
   <td style="text-align:right;"> 0.00791950 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -70.281589 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.98732734 </td>
   <td style="text-align:right;"> 0.01427530 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 69.163352 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.17775992 </td>
   <td style="text-align:right;"> 0.01392437 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 84.582638 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.08553895 </td>
   <td style="text-align:right;"> 0.01316320 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 82.467724 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.13690271 </td>
   <td style="text-align:right;"> 0.01354294 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 83.947984 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.95877911 </td>
   <td style="text-align:right;"> 0.01339116 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 146.274028 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.19518460 </td>
   <td style="text-align:right;"> 0.01739544 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 11.220447 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.06532102 </td>
   <td style="text-align:right;"> 0.01296515 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 82.168076 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.09222096 </td>
   <td style="text-align:right;"> 0.00907631 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -10.160627 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.04085721 </td>
   <td style="text-align:right;"> 0.00961870 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -4.247686 </td>
   <td style="text-align:right;"> 0.00043188 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.78101919 </td>
   <td style="text-align:right;"> 0.00940396 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 83.052153 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.98257531 </td>
   <td style="text-align:right;"> 0.01455036 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -67.529257 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.11243890 </td>
   <td style="text-align:right;"> 0.00878658 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.796658 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.05136376 </td>
   <td style="text-align:right;"> 0.00847952 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.057388 </td>
   <td style="text-align:right;"> 0.00000003 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.87324015 </td>
   <td style="text-align:right;"> 0.00823508 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 106.039027 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.89035435 </td>
   <td style="text-align:right;"> 0.01382369 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -64.407877 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.02021793 </td>
   <td style="text-align:right;"> 0.00752240 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.687698 </td>
   <td style="text-align:right;"> 0.10128617 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.82187640 </td>
   <td style="text-align:right;"> 0.00882937 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 93.084378 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.94171810 </td>
   <td style="text-align:right;"> 0.01418578 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -66.384657 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.07158169 </td>
   <td style="text-align:right;"> 0.00816866 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.762971 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -1.76359450 </td>
   <td style="text-align:right;"> 0.01404092 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -125.603928 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.89345809 </td>
   <td style="text-align:right;"> 0.00791466 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -112.886542 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.87013642 </td>
   <td style="text-align:right;"> 0.01363523 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 63.815324 </td>
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
   <th style="text-align:left;"> Lamination </th>
   <th style="text-align:left;"> Grammar Type </th>
   <th style="text-align:right;"> Inverse Brier Score </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9683860 </td>
   <td style="text-align:right;"> 0.9673564 </td>
   <td style="text-align:right;"> 0.9693837 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9668129 </td>
   <td style="text-align:right;"> 0.9657045 </td>
   <td style="text-align:right;"> 0.9678862 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9060598 </td>
   <td style="text-align:right;"> 0.9043703 </td>
   <td style="text-align:right;"> 0.9077210 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9061558 </td>
   <td style="text-align:right;"> 0.9043865 </td>
   <td style="text-align:right;"> 0.9078940 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9178156 </td>
   <td style="text-align:right;"> 0.9166481 </td>
   <td style="text-align:right;"> 0.9189676 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9149546 </td>
   <td style="text-align:right;"> 0.9136958 </td>
   <td style="text-align:right;"> 0.9161959 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9192023 </td>
   <td style="text-align:right;"> 0.9177957 </td>
   <td style="text-align:right;"> 0.9205859 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9169529 </td>
   <td style="text-align:right;"> 0.9154396 </td>
   <td style="text-align:right;"> 0.9184404 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8323362 </td>
   <td style="text-align:right;"> 0.8306410 </td>
   <td style="text-align:right;"> 0.8340163 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8269467 </td>
   <td style="text-align:right;"> 0.8251011 </td>
   <td style="text-align:right;"> 0.8287749 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9219736 </td>
   <td style="text-align:right;"> 0.9213027 </td>
   <td style="text-align:right;"> 0.9226390 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9147204 </td>
   <td style="text-align:right;"> 0.9139509 </td>
   <td style="text-align:right;"> 0.9154834 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9066643 </td>
   <td style="text-align:right;"> 0.9058891 </td>
   <td style="text-align:right;"> 0.9074335 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9025843 </td>
   <td style="text-align:right;"> 0.9017143 </td>
   <td style="text-align:right;"> 0.9034470 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Laminations By Grammar Type (Inverse Brier Score) (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 0.04936989 </td>
   <td style="text-align:right;"> 0.01652038 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.9884240 </td>
   <td style="text-align:right;"> 0.00280420 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.00107378 </td>
   <td style="text-align:right;"> 0.01014004 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.1058947 </td>
   <td style="text-align:right;"> 0.91566589 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.03575845 </td>
   <td style="text-align:right;"> 0.00790467 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.5237108 </td>
   <td style="text-align:right;"> 0.00000608 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.02866733 </td>
   <td style="text-align:right;"> 0.00954267 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.0041210 </td>
   <td style="text-align:right;"> 0.00266349 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.03478627 </td>
   <td style="text-align:right;"> 0.00734562 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.7356501 </td>
   <td style="text-align:right;"> 0.00000218 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.09278063 </td>
   <td style="text-align:right;"> 0.00648090 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 14.3160085 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.04500263 </td>
   <td style="text-align:right;"> 0.00581063 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.7448845 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Types By Lamination (Inverse Brier Score) (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 1.12195980 </td>
   <td style="text-align:right;"> 0.01912762 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 58.6565201 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.98192026 </td>
   <td style="text-align:right;"> 0.01819223 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 53.9747112 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.96415929 </td>
   <td style="text-align:right;"> 0.01894278 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 50.8985106 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 1.74269927 </td>
   <td style="text-align:right;"> 0.01752605 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 99.4347905 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.92777385 </td>
   <td style="text-align:right;"> 0.01721904 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 53.8807072 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 1.11517633 </td>
   <td style="text-align:right;"> 0.01715605 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 65.0019375 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.14003954 </td>
   <td style="text-align:right;"> 0.01209149 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.5816615 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.15780051 </td>
   <td style="text-align:right;"> 0.01319393 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.9600875 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.62073947 </td>
   <td style="text-align:right;"> 0.01105983 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 56.1256104 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.19418595 </td>
   <td style="text-align:right;"> 0.01056661 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -18.3773131 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.00678347 </td>
   <td style="text-align:right;"> 0.01046735 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.6480597 </td>
   <td style="text-align:right;"> 0.99515619 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.01776097 </td>
   <td style="text-align:right;"> 0.01179550 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.5057416 </td>
   <td style="text-align:right;"> 0.74155155 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.76077901 </td>
   <td style="text-align:right;"> 0.00935184 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 81.3507708 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.05414641 </td>
   <td style="text-align:right;"> 0.00875590 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.1839885 </td>
   <td style="text-align:right;"> 0.00000001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.13325607 </td>
   <td style="text-align:right;"> 0.00863624 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 15.4298674 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.77853998 </td>
   <td style="text-align:right;"> 0.01074124 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 72.4813945 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.03638544 </td>
   <td style="text-align:right;"> 0.01022864 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -3.5572111 </td>
   <td style="text-align:right;"> 0.00688059 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.15101704 </td>
   <td style="text-align:right;"> 0.01012352 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 14.9174370 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.81492543 </td>
   <td style="text-align:right;"> 0.00722154 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -112.8465336 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.62752294 </td>
   <td style="text-align:right;"> 0.00712136 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -88.1183812 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.18740248 </td>
   <td style="text-align:right;"> 0.00631092 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 29.6949350 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 1.07151613 </td>
   <td style="text-align:right;"> 0.01966558 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 54.4868752 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.96830882 </td>
   <td style="text-align:right;"> 0.01865422 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 51.9082885 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.94345673 </td>
   <td style="text-align:right;"> 0.01946586 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 48.4672472 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 1.72811565 </td>
   <td style="text-align:right;"> 0.01799426 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 96.0370722 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.97118458 </td>
   <td style="text-align:right;"> 0.01766329 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 54.9832308 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 1.11080907 </td>
   <td style="text-align:right;"> 0.01759769 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 63.1224355 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.10320732 </td>
   <td style="text-align:right;"> 0.01255161 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.2226353 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.12805941 </td>
   <td style="text-align:right;"> 0.01372877 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.3278119 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.65659952 </td>
   <td style="text-align:right;"> 0.01154654 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 56.8654658 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.10033155 </td>
   <td style="text-align:right;"> 0.01102544 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.1000048 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.03929293 </td>
   <td style="text-align:right;"> 0.01091996 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.5982673 </td>
   <td style="text-align:right;"> 0.00592408 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.02485209 </td>
   <td style="text-align:right;"> 0.01223438 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.0313325 </td>
   <td style="text-align:right;"> 0.39464892 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.75980684 </td>
   <td style="text-align:right;"> 0.00972622 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 78.1194415 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.00287576 </td>
   <td style="text-align:right;"> 0.00909168 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.3163072 </td>
   <td style="text-align:right;"> 0.99991985 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.14250025 </td>
   <td style="text-align:right;"> 0.00896604 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 15.8933245 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.78465893 </td>
   <td style="text-align:right;"> 0.01120883 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 70.0036679 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.02772785 </td>
   <td style="text-align:right;"> 0.01066623 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.5995935 </td>
   <td style="text-align:right;"> 0.12596478 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.16735234 </td>
   <td style="text-align:right;"> 0.01055327 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 15.8578668 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.75693107 </td>
   <td style="text-align:right;"> 0.00758740 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -99.7616503 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.61730659 </td>
   <td style="text-align:right;"> 0.00749492 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -82.3633435 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.13962448 </td>
   <td style="text-align:right;"> 0.00664195 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 21.0216239 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

### Recurrence-Laminations Interaction


#### Estimated Marginal Means (EMMs)

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Laminations × Recurrence EMMs (Inverse Brier Score)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Lamination </th>
   <th style="text-align:left;"> Architecture </th>
   <th style="text-align:right;"> Inverse Brier Score </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.8896360 </td>
   <td style="text-align:right;"> 0.8878058 </td>
   <td style="text-align:right;"> 0.8914383 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.8903781 </td>
   <td style="text-align:right;"> 0.8883977 </td>
   <td style="text-align:right;"> 0.8923256 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.9161864 </td>
   <td style="text-align:right;"> 0.9155175 </td>
   <td style="text-align:right;"> 0.9168502 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.9094098 </td>
   <td style="text-align:right;"> 0.9086920 </td>
   <td style="text-align:right;"> 0.9101223 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9407345 </td>
   <td style="text-align:right;"> 0.9402870 </td>
   <td style="text-align:right;"> 0.9411789 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9379117 </td>
   <td style="text-align:right;"> 0.9374534 </td>
   <td style="text-align:right;"> 0.9383668 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Laminations By Architecture (Inverse Brier Score) (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> -0.00715541 </td>
   <td style="text-align:right;"> 0.00860008 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.8320163 </td>
   <td style="text-align:right;"> 0.4053997 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.08140570 </td>
   <td style="text-align:right;"> 0.00509033 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 15.9922239 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.04801746 </td>
   <td style="text-align:right;"> 0.00463492 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 10.3599385 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Architecture By Laminations (Inverse Brier Score)  (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> -0.2896413 </td>
   <td style="text-align:right;"> 0.01013343 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -28.58274 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.6492671 </td>
   <td style="text-align:right;"> 0.01002966 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -64.73470 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.3596259 </td>
   <td style="text-align:right;"> 0.00493680 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -72.84597 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.2010801 </td>
   <td style="text-align:right;"> 0.01076747 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -18.67477 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.5940943 </td>
   <td style="text-align:right;"> 0.01065046 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -55.78109 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.3930141 </td>
   <td style="text-align:right;"> 0.00488198 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -80.50303 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
</tbody>
</table>

### Input Size 

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Input Size × Grammar EMMs (Inverse Brier Score)</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> Input Size </th>
   <th style="text-align:left;"> Grammar Type </th>
   <th style="text-align:right;"> Inverse Brier Score </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9843724 </td>
   <td style="text-align:right;"> 0.9836570 </td>
   <td style="text-align:right;"> 0.9850568 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9817711 </td>
   <td style="text-align:right;"> 0.9810124 </td>
   <td style="text-align:right;"> 0.9824997 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9787414 </td>
   <td style="text-align:right;"> 0.9779402 </td>
   <td style="text-align:right;"> 0.9795138 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9752146 </td>
   <td style="text-align:right;"> 0.9743707 </td>
   <td style="text-align:right;"> 0.9760311 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9711113 </td>
   <td style="text-align:right;"> 0.9702216 </td>
   <td style="text-align:right;"> 0.9719748 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9663406 </td>
   <td style="text-align:right;"> 0.9653964 </td>
   <td style="text-align:right;"> 0.9672595 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9607980 </td>
   <td style="text-align:right;"> 0.9597807 </td>
   <td style="text-align:right;"> 0.9617902 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9543646 </td>
   <td style="text-align:right;"> 0.9532400 </td>
   <td style="text-align:right;"> 0.9554627 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9469048 </td>
   <td style="text-align:right;"> 0.9456183 </td>
   <td style="text-align:right;"> 0.9481617 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9382656 </td>
   <td style="text-align:right;"> 0.9367388 </td>
   <td style="text-align:right;"> 0.9397567 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9282748 </td>
   <td style="text-align:right;"> 0.9264049 </td>
   <td style="text-align:right;"> 0.9300989 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9167401 </td>
   <td style="text-align:right;"> 0.9144012 </td>
   <td style="text-align:right;"> 0.9190179 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9344288 </td>
   <td style="text-align:right;"> 0.9327493 </td>
   <td style="text-align:right;"> 0.9360679 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9292474 </td>
   <td style="text-align:right;"> 0.9276065 </td>
   <td style="text-align:right;"> 0.9308524 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9236734 </td>
   <td style="text-align:right;"> 0.9220777 </td>
   <td style="text-align:right;"> 0.9252378 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9176801 </td>
   <td style="text-align:right;"> 0.9161322 </td>
   <td style="text-align:right;"> 0.9192007 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9112392 </td>
   <td style="text-align:right;"> 0.9097357 </td>
   <td style="text-align:right;"> 0.9127188 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9043211 </td>
   <td style="text-align:right;"> 0.9028488 </td>
   <td style="text-align:right;"> 0.9057723 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8968950 </td>
   <td style="text-align:right;"> 0.8954268 </td>
   <td style="text-align:right;"> 0.8983437 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8889286 </td>
   <td style="text-align:right;"> 0.8874201 </td>
   <td style="text-align:right;"> 0.8904182 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8803888 </td>
   <td style="text-align:right;"> 0.8787778 </td>
   <td style="text-align:right;"> 0.8819799 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8712412 </td>
   <td style="text-align:right;"> 0.8694517 </td>
   <td style="text-align:right;"> 0.8730081 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8614506 </td>
   <td style="text-align:right;"> 0.8593993 </td>
   <td style="text-align:right;"> 0.8634745 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8509812 </td>
   <td style="text-align:right;"> 0.8485830 </td>
   <td style="text-align:right;"> 0.8533448 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9464430 </td>
   <td style="text-align:right;"> 0.9453219 </td>
   <td style="text-align:right;"> 0.9475417 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9411432 </td>
   <td style="text-align:right;"> 0.9400297 </td>
   <td style="text-align:right;"> 0.9422365 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9353371 </td>
   <td style="text-align:right;"> 0.9342384 </td>
   <td style="text-align:right;"> 0.9364180 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9289801 </td>
   <td style="text-align:right;"> 0.9279019 </td>
   <td style="text-align:right;"> 0.9300428 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9220247 </td>
   <td style="text-align:right;"> 0.9209698 </td>
   <td style="text-align:right;"> 0.9230661 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9144200 </td>
   <td style="text-align:right;"> 0.9133853 </td>
   <td style="text-align:right;"> 0.9154428 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9061121 </td>
   <td style="text-align:right;"> 0.9050853 </td>
   <td style="text-align:right;"> 0.9071283 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8970440 </td>
   <td style="text-align:right;"> 0.8959985 </td>
   <td style="text-align:right;"> 0.8980797 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8871560 </td>
   <td style="text-align:right;"> 0.8860481 </td>
   <td style="text-align:right;"> 0.8882539 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8763854 </td>
   <td style="text-align:right;"> 0.8751548 </td>
   <td style="text-align:right;"> 0.8776048 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8646674 </td>
   <td style="text-align:right;"> 0.8632424 </td>
   <td style="text-align:right;"> 0.8660788 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8519354 </td>
   <td style="text-align:right;"> 0.8502390 </td>
   <td style="text-align:right;"> 0.8536144 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9370547 </td>
   <td style="text-align:right;"> 0.9355269 </td>
   <td style="text-align:right;"> 0.9385475 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9334495 </td>
   <td style="text-align:right;"> 0.9319810 </td>
   <td style="text-align:right;"> 0.9348875 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9296457 </td>
   <td style="text-align:right;"> 0.9282391 </td>
   <td style="text-align:right;"> 0.9310258 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9256333 </td>
   <td style="text-align:right;"> 0.9242879 </td>
   <td style="text-align:right;"> 0.9269557 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9214018 </td>
   <td style="text-align:right;"> 0.9201118 </td>
   <td style="text-align:right;"> 0.9226720 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9169406 </td>
   <td style="text-align:right;"> 0.9156926 </td>
   <td style="text-align:right;"> 0.9181710 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9122384 </td>
   <td style="text-align:right;"> 0.9110091 </td>
   <td style="text-align:right;"> 0.9134515 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9072837 </td>
   <td style="text-align:right;"> 0.9060384 </td>
   <td style="text-align:right;"> 0.9085133 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9020646 </td>
   <td style="text-align:right;"> 0.9007574 </td>
   <td style="text-align:right;"> 0.9033554 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8965687 </td>
   <td style="text-align:right;"> 0.8951462 </td>
   <td style="text-align:right;"> 0.8979731 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8907835 </td>
   <td style="text-align:right;"> 0.8891887 </td>
   <td style="text-align:right;"> 0.8923568 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8846961 </td>
   <td style="text-align:right;"> 0.8828727 </td>
   <td style="text-align:right;"> 0.8864929 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.6750215 </td>
   <td style="text-align:right;"> 0.6703794 </td>
   <td style="text-align:right;"> 0.6796149 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7146191 </td>
   <td style="text-align:right;"> 0.7109194 </td>
   <td style="text-align:right;"> 0.7182812 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7503098 </td>
   <td style="text-align:right;"> 0.7474208 </td>
   <td style="text-align:right;"> 0.7531715 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7822339 </td>
   <td style="text-align:right;"> 0.7800182 </td>
   <td style="text-align:right;"> 0.7844304 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8106022 </td>
   <td style="text-align:right;"> 0.8089220 </td>
   <td style="text-align:right;"> 0.8122695 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8356703 </td>
   <td style="text-align:right;"> 0.8343886 </td>
   <td style="text-align:right;"> 0.8369431 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8577161 </td>
   <td style="text-align:right;"> 0.8566998 </td>
   <td style="text-align:right;"> 0.8587258 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8770248 </td>
   <td style="text-align:right;"> 0.8761540 </td>
   <td style="text-align:right;"> 0.8778899 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8938771 </td>
   <td style="text-align:right;"> 0.8930626 </td>
   <td style="text-align:right;"> 0.8946858 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9085416 </td>
   <td style="text-align:right;"> 0.9077346 </td>
   <td style="text-align:right;"> 0.9093419 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9212697 </td>
   <td style="text-align:right;"> 0.9204536 </td>
   <td style="text-align:right;"> 0.9220778 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9322929 </td>
   <td style="text-align:right;"> 0.9314691 </td>
   <td style="text-align:right;"> 0.9331071 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.7240369 </td>
   <td style="text-align:right;"> 0.7168337 </td>
   <td style="text-align:right;"> 0.7310928 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.7836088 </td>
   <td style="text-align:right;"> 0.7789651 </td>
   <td style="text-align:right;"> 0.7881687 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.8318210 </td>
   <td style="text-align:right;"> 0.8290732 </td>
   <td style="text-align:right;"> 0.8345292 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.8701841 </td>
   <td style="text-align:right;"> 0.8687373 </td>
   <td style="text-align:right;"> 0.8716161 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9003219 </td>
   <td style="text-align:right;"> 0.8996319 </td>
   <td style="text-align:right;"> 0.9010074 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9237700 </td>
   <td style="text-align:right;"> 0.9232429 </td>
   <td style="text-align:right;"> 0.9242936 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9418804 </td>
   <td style="text-align:right;"> 0.9412166 </td>
   <td style="text-align:right;"> 0.9425370 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9557914 </td>
   <td style="text-align:right;"> 0.9550243 </td>
   <td style="text-align:right;"> 0.9565456 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9664321 </td>
   <td style="text-align:right;"> 0.9656354 </td>
   <td style="text-align:right;"> 0.9672106 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9745458 </td>
   <td style="text-align:right;"> 0.9737738 </td>
   <td style="text-align:right;"> 0.9752954 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9807179 </td>
   <td style="text-align:right;"> 0.9800034 </td>
   <td style="text-align:right;"> 0.9814071 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9854046 </td>
   <td style="text-align:right;"> 0.9847643 </td>
   <td style="text-align:right;"> 0.9860182 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8278953 </td>
   <td style="text-align:right;"> 0.8249136 </td>
   <td style="text-align:right;"> 0.8308317 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8476641 </td>
   <td style="text-align:right;"> 0.8454212 </td>
   <td style="text-align:right;"> 0.8498774 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8653497 </td>
   <td style="text-align:right;"> 0.8637129 </td>
   <td style="text-align:right;"> 0.8669684 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8811281 </td>
   <td style="text-align:right;"> 0.8799705 </td>
   <td style="text-align:right;"> 0.8822753 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8951710 </td>
   <td style="text-align:right;"> 0.8943636 </td>
   <td style="text-align:right;"> 0.8959725 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9076428 </td>
   <td style="text-align:right;"> 0.9070425 </td>
   <td style="text-align:right;"> 0.9082394 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9186988 </td>
   <td style="text-align:right;"> 0.9181565 </td>
   <td style="text-align:right;"> 0.9192377 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9284839 </td>
   <td style="text-align:right;"> 0.9278994 </td>
   <td style="text-align:right;"> 0.9290639 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9371319 </td>
   <td style="text-align:right;"> 0.9364730 </td>
   <td style="text-align:right;"> 0.9377842 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9447655 </td>
   <td style="text-align:right;"> 0.9440363 </td>
   <td style="text-align:right;"> 0.9454854 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9514962 </td>
   <td style="text-align:right;"> 0.9507133 </td>
   <td style="text-align:right;"> 0.9522670 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9574254 </td>
   <td style="text-align:right;"> 0.9566074 </td>
   <td style="text-align:right;"> 0.9582283 </td>
  </tr>
</tbody>
</table>

### Slope of layers

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Layers EMMs (Inverse Brier Score)</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> Layers </th>
   <th style="text-align:right;"> Inverse Brier Score </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.9181766 </td>
   <td style="text-align:right;"> 0.9174318 </td>
   <td style="text-align:right;"> 0.9189150 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.9169939 </td>
   <td style="text-align:right;"> 0.9164940 </td>
   <td style="text-align:right;"> 0.9174909 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.9157948 </td>
   <td style="text-align:right;"> 0.9152572 </td>
   <td style="text-align:right;"> 0.9163292 </td>
  </tr>
</tbody>
</table>

### Slope of neurons

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Neurons EMMs (Inverse Brier Score)</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> Neurons </th>
   <th style="text-align:right;"> Inverse Brier Score </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 0.9046849 </td>
   <td style="text-align:right;"> 0.9040084 </td>
   <td style="text-align:right;"> 0.9053569 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:right;"> 0.9063358 </td>
   <td style="text-align:right;"> 0.9057021 </td>
   <td style="text-align:right;"> 0.9069654 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 96 </td>
   <td style="text-align:right;"> 0.9079595 </td>
   <td style="text-align:right;"> 0.9073642 </td>
   <td style="text-align:right;"> 0.9085511 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 128 </td>
   <td style="text-align:right;"> 0.9095565 </td>
   <td style="text-align:right;"> 0.9089950 </td>
   <td style="text-align:right;"> 0.9101147 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 0.9111271 </td>
   <td style="text-align:right;"> 0.9105945 </td>
   <td style="text-align:right;"> 0.9116568 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 192 </td>
   <td style="text-align:right;"> 0.9126719 </td>
   <td style="text-align:right;"> 0.9121628 </td>
   <td style="text-align:right;"> 0.9131781 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 224 </td>
   <td style="text-align:right;"> 0.9141910 </td>
   <td style="text-align:right;"> 0.9137003 </td>
   <td style="text-align:right;"> 0.9146791 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 256 </td>
   <td style="text-align:right;"> 0.9156850 </td>
   <td style="text-align:right;"> 0.9152072 </td>
   <td style="text-align:right;"> 0.9161602 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 288 </td>
   <td style="text-align:right;"> 0.9171541 </td>
   <td style="text-align:right;"> 0.9166841 </td>
   <td style="text-align:right;"> 0.9176217 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 320 </td>
   <td style="text-align:right;"> 0.9185988 </td>
   <td style="text-align:right;"> 0.9181315 </td>
   <td style="text-align:right;"> 0.9190637 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 352 </td>
   <td style="text-align:right;"> 0.9200195 </td>
   <td style="text-align:right;"> 0.9195502 </td>
   <td style="text-align:right;"> 0.9204861 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 384 </td>
   <td style="text-align:right;"> 0.9214164 </td>
   <td style="text-align:right;"> 0.9209412 </td>
   <td style="text-align:right;"> 0.9218888 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 416 </td>
   <td style="text-align:right;"> 0.9227899 </td>
   <td style="text-align:right;"> 0.9223052 </td>
   <td style="text-align:right;"> 0.9232717 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 448 </td>
   <td style="text-align:right;"> 0.9241405 </td>
   <td style="text-align:right;"> 0.9236433 </td>
   <td style="text-align:right;"> 0.9246345 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 480 </td>
   <td style="text-align:right;"> 0.9254683 </td>
   <td style="text-align:right;"> 0.9249563 </td>
   <td style="text-align:right;"> 0.9259770 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 512 </td>
   <td style="text-align:right;"> 0.9267739 </td>
   <td style="text-align:right;"> 0.9262452 </td>
   <td style="text-align:right;"> 0.9272990 </td>
  </tr>
</tbody>
</table>
## Proportion Correct Model

```
Call:
betareg::betareg(formula = formulas_proportion_phi$M1g, data = df_filtered, link = "loglog")

Quantile residuals:
     Min       1Q   Median       3Q      Max 
-11.9767  -0.7264   0.0002   0.7180   7.5865 

Coefficients (mean model with loglog link):
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           4.441e+00  5.334e-02  83.267  < 2e-16 ***
recurrenceRNN                        -2.541e-01  4.337e-02  -5.860 4.63e-09 ***
recurrenceGRU                         4.627e-01  4.377e-02  10.571  < 2e-16 ***
laminationsLaminated                 -3.446e-02  2.187e-02  -1.576  0.11510    
inputsize                            -1.516e-01  2.947e-03 -51.439  < 2e-16 ***
grammartypeLT                        -1.391e+00  5.984e-02 -23.236  < 2e-16 ***
grammartypeLTT                       -1.057e+00  5.733e-02 -18.441  < 2e-16 ***
grammartypeLTTO                      -1.338e+00  5.927e-02 -22.576  < 2e-16 ***
grammartypeMSO                       -3.574e+00  5.629e-02 -63.498  < 2e-16 ***
grammartypeCS                        -3.863e+00  7.116e-02 -54.281  < 2e-16 ***
grammartypeCF                        -2.509e+00  5.828e-02 -43.047  < 2e-16 ***
neurons                               6.373e-04  1.077e-05  59.192  < 2e-16 ***
layers                               -9.102e-02  3.015e-03 -30.187  < 2e-16 ***
recurrenceRNN:grammartypeLT          -6.839e-02  4.898e-02  -1.396  0.16260    
recurrenceGRU:grammartypeLT          -2.164e-01  4.931e-02  -4.390 1.13e-05 ***
recurrenceRNN:grammartypeLTT         -1.403e-01  4.630e-02  -3.030  0.00245 ** 
recurrenceGRU:grammartypeLTT         -3.018e-01  4.663e-02  -6.473 9.62e-11 ***
recurrenceRNN:grammartypeLTTO        -4.629e-02  4.877e-02  -0.949  0.34257    
recurrenceGRU:grammartypeLTTO        -3.864e-01  4.893e-02  -7.898 2.84e-15 ***
recurrenceRNN:grammartypeMSO          2.857e-01  4.565e-02   6.259 3.88e-10 ***
recurrenceGRU:grammartypeMSO         -2.251e-01  4.621e-02  -4.872 1.11e-06 ***
recurrenceRNN:grammartypeCS           1.846e+00  5.878e-02  31.402  < 2e-16 ***
recurrenceGRU:grammartypeCS           1.417e+00  5.912e-02  23.966  < 2e-16 ***
recurrenceRNN:grammartypeCF           1.372e-01  4.751e-02   2.888  0.00388 ** 
recurrenceGRU:grammartypeCF          -1.090e-01  4.781e-02  -2.280  0.02260 *  
grammartypeLT:laminationsLaminated    4.536e-02  2.223e-02   2.041  0.04125 *  
grammartypeLTT:laminationsLaminated   6.531e-03  2.125e-02   0.307  0.75855    
grammartypeLTTO:laminationsLaminated  1.634e-02  2.181e-02   0.749  0.45371    
grammartypeMSO:laminationsLaminated  -1.510e-02  2.121e-02  -0.712  0.47648    
grammartypeCS:laminationsLaminated   -4.369e-02  2.090e-02  -2.090  0.03659 *  
grammartypeCF:laminationsLaminated    7.568e-04  2.040e-02   0.037  0.97041    
recurrenceRNN:laminationsLaminated   -4.177e-02  1.107e-02  -3.775  0.00016 ***
recurrenceGRU:laminationsLaminated    1.142e-02  1.107e-02   1.031  0.30238    
grammartypeLT:inputsize               6.300e-02  3.353e-03  18.789  < 2e-16 ***
grammartypeLTT:inputsize              4.181e-02  3.252e-03  12.858  < 2e-16 ***
grammartypeLTTO:inputsize             8.634e-02  3.289e-03  26.252  < 2e-16 ***
grammartypeMSO:inputsize              3.250e-01  3.224e-03 100.802  < 2e-16 ***
grammartypeCS:inputsize               3.215e-01  4.911e-03  65.464  < 2e-16 ***
grammartypeCF:inputsize               2.532e-01  3.443e-03  73.542  < 2e-16 ***

Phi coefficients (precision model with log link):
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           2.317e+00  5.816e-02  39.840  < 2e-16 ***
recurrenceRNN                        -2.225e-01  4.708e-02  -4.725 2.30e-06 ***
recurrenceGRU                         5.549e-01  4.765e-02  11.644  < 2e-16 ***
laminationsLaminated                  1.159e-02  2.800e-02   0.414 0.678919    
inputsize                            -1.111e-01  3.166e-03 -35.091  < 2e-16 ***
grammartypeLT                         7.881e-01  7.364e-02  10.702  < 2e-16 ***
grammartypeLTT                        1.597e-01  7.323e-02   2.180 0.029230 *  
grammartypeLTTO                       6.104e-01  7.382e-02   8.269  < 2e-16 ***
grammartypeMSO                        4.571e-02  6.578e-02   0.695 0.487120    
grammartypeCS                         3.589e+00  9.624e-02  37.291  < 2e-16 ***
grammartypeCF                        -7.119e-01  7.128e-02  -9.987  < 2e-16 ***
neurons                               5.359e-04  1.701e-05  31.505  < 2e-16 ***
layers                               -6.584e-02  4.832e-03 -13.627  < 2e-16 ***
recurrenceRNN:grammartypeLT          -3.864e-01  6.117e-02  -6.316 2.68e-10 ***
recurrenceGRU:grammartypeLT          -4.898e-01  6.171e-02  -7.936 2.08e-15 ***
recurrenceRNN:grammartypeLTT         -4.257e-02  6.081e-02  -0.700 0.483952    
recurrenceGRU:grammartypeLTT         -1.294e-01  6.128e-02  -2.111 0.034758 *  
recurrenceRNN:grammartypeLTTO        -2.352e-01  6.155e-02  -3.822 0.000133 ***
recurrenceGRU:grammartypeLTTO        -2.151e-01  6.197e-02  -3.471 0.000519 ***
recurrenceRNN:grammartypeMSO         -1.129e+00  5.459e-02 -20.681  < 2e-16 ***
recurrenceGRU:grammartypeMSO         -2.117e+00  5.517e-02 -38.362  < 2e-16 ***
recurrenceRNN:grammartypeCS          -2.521e+00  7.870e-02 -32.035  < 2e-16 ***
recurrenceGRU:grammartypeCS          -3.092e+00  7.907e-02 -39.109  < 2e-16 ***
recurrenceRNN:grammartypeCF           5.568e-01  5.752e-02   9.681  < 2e-16 ***
recurrenceGRU:grammartypeCF           6.283e-01  5.795e-02  10.841  < 2e-16 ***
grammartypeLT:laminationsLaminated    2.765e-02  2.676e-02   1.033 0.301463    
grammartypeLTT:laminationsLaminated   1.622e-02  2.638e-02   0.615 0.538758    
grammartypeLTTO:laminationsLaminated -1.045e-02  2.669e-02  -0.392 0.695351    
grammartypeMSO:laminationsLaminated   3.166e-02  2.395e-02   1.322 0.186216    
grammartypeCS:laminationsLaminated    4.069e-03  2.464e-02   0.165 0.868849    
grammartypeCF:laminationsLaminated    2.023e-02  2.353e-02   0.860 0.389962    
recurrenceRNN:laminationsLaminated   -7.266e-02  2.029e-02  -3.580 0.000343 ***
recurrenceGRU:laminationsLaminated   -3.210e-02  2.036e-02  -1.577 0.114898    
grammartypeLT:inputsize               4.762e-02  4.017e-03  11.855  < 2e-16 ***
grammartypeLTT:inputsize              1.618e-01  3.991e-03  40.553  < 2e-16 ***
grammartypeLTTO:inputsize             9.185e-02  4.004e-03  22.939  < 2e-16 ***
grammartypeMSO:inputsize              2.305e-01  3.611e-03  63.817  < 2e-16 ***
grammartypeCS:inputsize              -8.050e-02  7.061e-03 -11.400  < 2e-16 ***
grammartypeCF:inputsize               2.263e-01  4.527e-03  49.993  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

Type of estimator: ML (maximum likelihood)
Log-likelihood: 6.8e+05 on 78 Df
Pseudo R-squared: 0.2516
Number of iterations: 120 (BFGS) + 10 (Fisher scoring) 
```


### Recurrence-Grammar Interaction


#### Estimated Marginal Means (EMMs)

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Recurrence × Grammar Type EMMs (Proportion Correct)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Architecture </th>
   <th style="text-align:left;"> Grammar Type </th>
   <th style="text-align:right;"> Proportion Correct </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9702721 </td>
   <td style="text-align:right;"> 0.9677283 </td>
   <td style="text-align:right;"> 0.9726183 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9610474 </td>
   <td style="text-align:right;"> 0.9599343 </td>
   <td style="text-align:right;"> 0.9621302 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9812859 </td>
   <td style="text-align:right;"> 0.9807257 </td>
   <td style="text-align:right;"> 0.9818300 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9208097 </td>
   <td style="text-align:right;"> 0.9173680 </td>
   <td style="text-align:right;"> 0.9241140 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8902030 </td>
   <td style="text-align:right;"> 0.8885473 </td>
   <td style="text-align:right;"> 0.8918357 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9378878 </td>
   <td style="text-align:right;"> 0.9369540 </td>
   <td style="text-align:right;"> 0.9388082 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9341833 </td>
   <td style="text-align:right;"> 0.9320100 </td>
   <td style="text-align:right;"> 0.9362896 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9020063 </td>
   <td style="text-align:right;"> 0.9006817 </td>
   <td style="text-align:right;"> 0.9033143 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9439964 </td>
   <td style="text-align:right;"> 0.9432535 </td>
   <td style="text-align:right;"> 0.9447298 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9328971 </td>
   <td style="text-align:right;"> 0.9300208 </td>
   <td style="text-align:right;"> 0.9356593 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9086641 </td>
   <td style="text-align:right;"> 0.9072798 </td>
   <td style="text-align:right;"> 0.9100287 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9380116 </td>
   <td style="text-align:right;"> 0.9372109 </td>
   <td style="text-align:right;"> 0.9388025 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8458563 </td>
   <td style="text-align:right;"> 0.8419429 </td>
   <td style="text-align:right;"> 0.8496817 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8473647 </td>
   <td style="text-align:right;"> 0.8457565 </td>
   <td style="text-align:right;"> 0.8489576 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8769996 </td>
   <td style="text-align:right;"> 0.8754186 </td>
   <td style="text-align:right;"> 0.8785620 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.7935004 </td>
   <td style="text-align:right;"> 0.7841286 </td>
   <td style="text-align:right;"> 0.8025182 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9530618 </td>
   <td style="text-align:right;"> 0.9516492 </td>
   <td style="text-align:right;"> 0.9544341 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9655031 </td>
   <td style="text-align:right;"> 0.9644497 </td>
   <td style="text-align:right;"> 0.9665258 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9171512 </td>
   <td style="text-align:right;"> 0.9145295 </td>
   <td style="text-align:right;"> 0.9196960 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9055081 </td>
   <td style="text-align:right;"> 0.9044169 </td>
   <td style="text-align:right;"> 0.9065874 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9414140 </td>
   <td style="text-align:right;"> 0.9407866 </td>
   <td style="text-align:right;"> 0.9420349 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Architectures By Grammar Type (Proportion Correct) (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 0.27501018 </td>
   <td style="text-align:right;"> 0.04309828 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.3810013 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.46842866 </td>
   <td style="text-align:right;"> 0.04350582 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -10.7670348 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.74343884 </td>
   <td style="text-align:right;"> 0.02020679 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -36.7915397 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.34340082 </td>
   <td style="text-align:right;"> 0.02332134 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 14.7247448 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.25198752 </td>
   <td style="text-align:right;"> 0.02325710 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -10.8348620 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.59538833 </td>
   <td style="text-align:right;"> 0.01102384 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -54.0091354 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.41530547 </td>
   <td style="text-align:right;"> 0.01700235 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 24.4263626 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.16662657 </td>
   <td style="text-align:right;"> 0.01684318 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.8928219 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.58193204 </td>
   <td style="text-align:right;"> 0.00877105 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -66.3469065 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.32129543 </td>
   <td style="text-align:right;"> 0.02287675 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 14.0446260 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.08198384 </td>
   <td style="text-align:right;"> 0.02245359 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -3.6512574 </td>
   <td style="text-align:right;"> 0.00076277 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.40327927 </td>
   <td style="text-align:right;"> 0.01018058 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -39.6125898 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.01069971 </td>
   <td style="text-align:right;"> 0.01511464 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.7079033 </td>
   <td style="text-align:right;"> 0.75881668 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.24332652 </td>
   <td style="text-align:right;"> 0.01563815 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -15.5597999 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.23262681 </td>
   <td style="text-align:right;"> 0.00904494 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -25.7189871 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -1.57094736 </td>
   <td style="text-align:right;"> 0.04000104 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -39.2726591 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -1.88535009 </td>
   <td style="text-align:right;"> 0.04005977 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -47.0634281 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.31440273 </td>
   <td style="text-align:right;"> 0.00837849 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -37.5249950 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.13778600 </td>
   <td style="text-align:right;"> 0.02006020 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.8686248 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.35941715 </td>
   <td style="text-align:right;"> 0.01988179 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -18.0777099 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.49720315 </td>
   <td style="text-align:right;"> 0.00617229 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -80.5540726 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Type By Architecture (Proportion Correct) (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 1.00568549 </td>
   <td style="text-align:right;"> 0.04818500 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 20.8713412 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.81358515 </td>
   <td style="text-align:right;"> 0.04586461 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 17.7388429 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.83362054 </td>
   <td style="text-align:right;"> 0.04797217 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 17.3771681 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.71328459 </td>
   <td style="text-align:right;"> 0.04476130 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 38.2760207 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 2.03658494 </td>
   <td style="text-align:right;"> 0.04962376 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 41.0405192 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.05281158 </td>
   <td style="text-align:right;"> 0.04566239 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 23.0564248 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.19210034 </td>
   <td style="text-align:right;"> 0.02837587 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.7698486 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.17206495 </td>
   <td style="text-align:right;"> 0.03166931 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.4331767 </td>
   <td style="text-align:right;"> 0.00000116 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.70759910 </td>
   <td style="text-align:right;"> 0.02655596 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 26.6455902 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.03089945 </td>
   <td style="text-align:right;"> 0.03411992 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 30.2140040 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.04712608 </td>
   <td style="text-align:right;"> 0.02804785 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.6802031 </td>
   <td style="text-align:right;"> 0.62939231 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.02003539 </td>
   <td style="text-align:right;"> 0.02801294 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.7152191 </td>
   <td style="text-align:right;"> 0.99173261 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.89969944 </td>
   <td style="text-align:right;"> 0.02206732 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 40.7706792 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.22299979 </td>
   <td style="text-align:right;"> 0.03075552 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 39.7652134 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.23922642 </td>
   <td style="text-align:right;"> 0.02384211 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 10.0337791 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.87966405 </td>
   <td style="text-align:right;"> 0.02616803 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 33.6159803 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.20296440 </td>
   <td style="text-align:right;"> 0.03381891 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 35.5707649 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.21919104 </td>
   <td style="text-align:right;"> 0.02768058 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.9185860 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.32330035 </td>
   <td style="text-align:right;"> 0.02908347 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 11.1162921 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.66047301 </td>
   <td style="text-align:right;"> 0.02164385 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -30.5155014 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.98377337 </td>
   <td style="text-align:right;"> 0.03045306 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -32.3045860 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 1.07407614 </td>
   <td style="text-align:right;"> 0.01675702 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 64.0970796 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.95388045 </td>
   <td style="text-align:right;"> 0.01634828 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 58.3474646 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.87990579 </td>
   <td style="text-align:right;"> 0.01673533 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 52.5777264 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 1.42757471 </td>
   <td style="text-align:right;"> 0.01577969 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 90.4690965 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.19062740 </td>
   <td style="text-align:right;"> 0.02134278 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 8.9317038 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.91558740 </td>
   <td style="text-align:right;"> 0.01590907 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 57.5512696 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.12019569 </td>
   <td style="text-align:right;"> 0.01085119 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.0767239 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.19417035 </td>
   <td style="text-align:right;"> 0.01142596 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -16.9937849 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.35349857 </td>
   <td style="text-align:right;"> 0.00997419 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 35.4413185 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.88344874 </td>
   <td style="text-align:right;"> 0.01749284 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -50.5034622 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.15848874 </td>
   <td style="text-align:right;"> 0.01017750 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -15.5724557 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.07397466 </td>
   <td style="text-align:right;"> 0.01081765 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.8383291 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.47369426 </td>
   <td style="text-align:right;"> 0.00927100 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 51.0941791 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.76325305 </td>
   <td style="text-align:right;"> 0.01710162 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -44.6304585 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.03829305 </td>
   <td style="text-align:right;"> 0.00948940 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -4.0353511 </td>
   <td style="text-align:right;"> 0.00106981 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.54766892 </td>
   <td style="text-align:right;"> 0.00993772 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 55.1101050 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.68927839 </td>
   <td style="text-align:right;"> 0.01747206 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -39.4503115 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.03568161 </td>
   <td style="text-align:right;"> 0.01014174 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.5182923 </td>
   <td style="text-align:right;"> 0.00791522 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -1.23694731 </td>
   <td style="text-align:right;"> 0.01655891 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -74.6997969 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.51198731 </td>
   <td style="text-align:right;"> 0.00847252 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -60.4291881 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.72496000 </td>
   <td style="text-align:right;"> 0.01668224 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 43.4569851 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.22212664 </td>
   <td style="text-align:right;"> 0.01710896 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 71.4319813 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.11538725 </td>
   <td style="text-align:right;"> 0.01669664 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 66.8030916 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.22006536 </td>
   <td style="text-align:right;"> 0.01663164 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 73.3580734 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.93838673 </td>
   <td style="text-align:right;"> 0.01671493 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 115.9673849 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.61966351 </td>
   <td style="text-align:right;"> 0.02179335 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 28.4336081 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.16182309 </td>
   <td style="text-align:right;"> 0.01619439 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 71.7423370 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.10673939 </td>
   <td style="text-align:right;"> 0.01047633 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -10.1886242 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.00206128 </td>
   <td style="text-align:right;"> 0.01037238 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.1987280 </td>
   <td style="text-align:right;"> 0.99999488 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.71626009 </td>
   <td style="text-align:right;"> 0.01050558 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 68.1790306 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.60246313 </td>
   <td style="text-align:right;"> 0.01749078 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -34.4446084 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.06030355 </td>
   <td style="text-align:right;"> 0.00965577 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.2453369 </td>
   <td style="text-align:right;"> 0.00000001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.10467811 </td>
   <td style="text-align:right;"> 0.00967722 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 10.8169594 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.82299949 </td>
   <td style="text-align:right;"> 0.00981972 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 83.8108650 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.49572373 </td>
   <td style="text-align:right;"> 0.01708763 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -29.0106838 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.04643585 </td>
   <td style="text-align:right;"> 0.00890476 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 5.2147203 </td>
   <td style="text-align:right;"> 0.00000383 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.71832137 </td>
   <td style="text-align:right;"> 0.00970891 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 73.9858080 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.60040184 </td>
   <td style="text-align:right;"> 0.01702419 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -35.2675762 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.05824227 </td>
   <td style="text-align:right;"> 0.00878232 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.6317669 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -1.31872322 </td>
   <td style="text-align:right;"> 0.01710541 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -77.0939487 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.77656364 </td>
   <td style="text-align:right;"> 0.00893907 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -86.8729702 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.54215958 </td>
   <td style="text-align:right;"> 0.01659719 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 32.6657418 </td>
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
   <th style="text-align:left;"> Lamination </th>
   <th style="text-align:left;"> Grammar Type </th>
   <th style="text-align:right;"> Proportion Correct </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9727087 </td>
   <td style="text-align:right;"> 0.9716652 </td>
   <td style="text-align:right;"> 0.9737143 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9714823 </td>
   <td style="text-align:right;"> 0.9703620 </td>
   <td style="text-align:right;"> 0.9725610 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9184318 </td>
   <td style="text-align:right;"> 0.9168446 </td>
   <td style="text-align:right;"> 0.9199900 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9184926 </td>
   <td style="text-align:right;"> 0.9168423 </td>
   <td style="text-align:right;"> 0.9201116 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9299982 </td>
   <td style="text-align:right;"> 0.9288325 </td>
   <td style="text-align:right;"> 0.9311454 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9273842 </td>
   <td style="text-align:right;"> 0.9261389 </td>
   <td style="text-align:right;"> 0.9286093 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9285106 </td>
   <td style="text-align:right;"> 0.9271673 </td>
   <td style="text-align:right;"> 0.9298300 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9265400 </td>
   <td style="text-align:right;"> 0.9251057 </td>
   <td style="text-align:right;"> 0.9279480 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8613179 </td>
   <td style="text-align:right;"> 0.8595723 </td>
   <td style="text-align:right;"> 0.8630436 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8534454 </td>
   <td style="text-align:right;"> 0.8515499 </td>
   <td style="text-align:right;"> 0.8553188 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9324597 </td>
   <td style="text-align:right;"> 0.9317853 </td>
   <td style="text-align:right;"> 0.9331276 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9264615 </td>
   <td style="text-align:right;"> 0.9257057 </td>
   <td style="text-align:right;"> 0.9272099 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9244252 </td>
   <td style="text-align:right;"> 0.9236193 </td>
   <td style="text-align:right;"> 0.9252230 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9211764 </td>
   <td style="text-align:right;"> 0.9202984 </td>
   <td style="text-align:right;"> 0.9220451 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Laminations By Grammar Type (Proportion Correct) (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 0.04458293 </td>
   <td style="text-align:right;"> 0.01972222 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.26054371 </td>
   <td style="text-align:right;"> 0.02378753 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.00077880 </td>
   <td style="text-align:right;"> 0.01100848 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.07074507 </td>
   <td style="text-align:right;"> 0.94360065 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.03805176 </td>
   <td style="text-align:right;"> 0.00882966 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.30953948 </td>
   <td style="text-align:right;"> 0.00001636 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.02824035 </td>
   <td style="text-align:right;"> 0.01017049 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.77669430 </td>
   <td style="text-align:right;"> 0.00549148 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.05968719 </td>
   <td style="text-align:right;"> 0.00857466 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.96088196 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.08827170 </td>
   <td style="text-align:right;"> 0.00726365 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 12.15251953 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.04382614 </td>
   <td style="text-align:right;"> 0.00661806 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.62220486 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Grammar Types By Lamination (Proportion Correct) (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 1.12331029 </td>
   <td style="text-align:right;"> 0.02190031 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 51.29198985 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.96421653 </td>
   <td style="text-align:right;"> 0.02123030 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 45.41699084 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.98603519 </td>
   <td style="text-align:right;"> 0.02171177 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 45.41478102 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 1.68552988 </td>
   <td style="text-align:right;"> 0.02054884 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 82.02554124 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.92711423 </td>
   <td style="text-align:right;"> 0.02009683 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 46.13236780 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 1.04378575 </td>
   <td style="text-align:right;"> 0.02014394 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 51.81637706 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.15909375 </td>
   <td style="text-align:right;"> 0.01338602 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.88506377 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.13727510 </td>
   <td style="text-align:right;"> 0.01413592 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.71108028 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.56221959 </td>
   <td style="text-align:right;"> 0.01227907 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 45.78682377 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.19619605 </td>
   <td style="text-align:right;"> 0.01150259 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -17.05668046 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.07952454 </td>
   <td style="text-align:right;"> 0.01158480 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.86455770 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.02181865 </td>
   <td style="text-align:right;"> 0.01307252 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.66904747 </td>
   <td style="text-align:right;"> 0.63686951 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.72131334 </td>
   <td style="text-align:right;"> 0.01103923 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 65.34092419 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.03710230 </td>
   <td style="text-align:right;"> 0.01016503 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -3.64999394 </td>
   <td style="text-align:right;"> 0.00489241 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.07956922 </td>
   <td style="text-align:right;"> 0.01026052 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.75488772 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.69949469 </td>
   <td style="text-align:right;"> 0.01194429 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 58.56309058 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.05892095 </td>
   <td style="text-align:right;"> 0.01114301 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.28770716 </td>
   <td style="text-align:right;"> 0.00000258 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.05775057 </td>
   <td style="text-align:right;"> 0.01121712 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 5.14843300 </td>
   <td style="text-align:right;"> 0.00000546 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.75841564 </td>
   <td style="text-align:right;"> 0.00862465 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -87.93577738 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.64174413 </td>
   <td style="text-align:right;"> 0.00877788 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -73.10924845 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.11667152 </td>
   <td style="text-align:right;"> 0.00765509 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 15.24103060 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 1.07794856 </td>
   <td style="text-align:right;"> 0.02250567 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 47.89675005 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.95768536 </td>
   <td style="text-align:right;"> 0.02177134 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 43.98835994 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.96969261 </td>
   <td style="text-align:right;"> 0.02230431 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 43.47557273 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 1.70063414 </td>
   <td style="text-align:right;"> 0.02107846 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 80.68113844 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.97080300 </td>
   <td style="text-align:right;"> 0.02062762 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 47.06326458 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 1.04302896 </td>
   <td style="text-align:right;"> 0.02066671 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 50.46903554 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.12026320 </td>
   <td style="text-align:right;"> 0.01377935 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.72778154 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.10825595 </td>
   <td style="text-align:right;"> 0.01460502 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.41224390 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.62268558 </td>
   <td style="text-align:right;"> 0.01265984 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 49.18588929 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.10714556 </td>
   <td style="text-align:right;"> 0.01189146 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.01029151 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.03491960 </td>
   <td style="text-align:right;"> 0.01195580 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.92072355 </td>
   <td style="text-align:right;"> 0.05410851 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.01200724 </td>
   <td style="text-align:right;"> 0.01344454 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.89309398 </td>
   <td style="text-align:right;"> 0.97371260 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.74294878 </td>
   <td style="text-align:right;"> 0.01130069 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 65.74369195 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.01311764 </td>
   <td style="text-align:right;"> 0.01042635 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.25812407 </td>
   <td style="text-align:right;"> 0.87091394 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.08534360 </td>
   <td style="text-align:right;"> 0.01050659 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 8.12286320 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.73094153 </td>
   <td style="text-align:right;"> 0.01230442 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 59.40481103 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.00111040 </td>
   <td style="text-align:right;"> 0.01151105 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.09646364 </td>
   <td style="text-align:right;"> 0.99999993 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.07333635 </td>
   <td style="text-align:right;"> 0.01156353 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.34203920 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.72983114 </td>
   <td style="text-align:right;"> 0.00885086 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -82.45879987 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.65760518 </td>
   <td style="text-align:right;"> 0.00899883 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -73.07673923 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.07222596 </td>
   <td style="text-align:right;"> 0.00787759 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 9.16853567 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

### Recurrence-Laminations Interaction


#### Estimated Marginal Means (EMMs)

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Laminations × Recurrence EMMs (Proportion Correct)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Lamination </th>
   <th style="text-align:left;"> Architecture </th>
   <th style="text-align:right;"> Proportion Correct </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.9174863 </td>
   <td style="text-align:right;"> 0.9158762 </td>
   <td style="text-align:right;"> 0.9190670 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.9148386 </td>
   <td style="text-align:right;"> 0.9130600 </td>
   <td style="text-align:right;"> 0.9165825 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.9200992 </td>
   <td style="text-align:right;"> 0.9193888 </td>
   <td style="text-align:right;"> 0.9208037 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.9141689 </td>
   <td style="text-align:right;"> 0.9134153 </td>
   <td style="text-align:right;"> 0.9149162 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9485176 </td>
   <td style="text-align:right;"> 0.9480572 </td>
   <td style="text-align:right;"> 0.9489741 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9474243 </td>
   <td style="text-align:right;"> 0.9469559 </td>
   <td style="text-align:right;"> 0.9478886 </td>
  </tr>
</tbody>
</table>

#### Pairwise Contrasts  

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Laminations By Architecture (Proportion Correct) (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> 0.03300792 </td>
   <td style="text-align:right;"> 0.01032217 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.197768 </td>
   <td style="text-align:right;"> 0.00138496 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.07478292 </td>
   <td style="text-align:right;"> 0.00547280 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 13.664463 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.02158686 </td>
   <td style="text-align:right;"> 0.00536249 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.025530 </td>
   <td style="text-align:right;"> 0.00005685 </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Pairwise Contrasts Between Architecture By Laminations (Proportion Correct)  (Log-Log Scale)</caption>
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
   <td style="text-align:right;"> -0.03358024 </td>
   <td style="text-align:right;"> 0.01165506 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.881174 </td>
   <td style="text-align:right;"> 0.01105382 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.48816381 </td>
   <td style="text-align:right;"> 0.01166937 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -41.832927 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.45458357 </td>
   <td style="text-align:right;"> 0.00549670 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -82.701135 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.00819476 </td>
   <td style="text-align:right;"> 0.01223006 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.670051 </td>
   <td style="text-align:right;"> 0.78090980 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.49958486 </td>
   <td style="text-align:right;"> 0.01225620 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -40.761792 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.50777963 </td>
   <td style="text-align:right;"> 0.00545157 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -93.143734 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

### Input Size 

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Input Size × Grammar EMMs (Proportion Correct)</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> Input Size </th>
   <th style="text-align:left;"> Grammar Type </th>
   <th style="text-align:right;"> Proportion Correct </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9863192 </td>
   <td style="text-align:right;"> 0.9855760 </td>
   <td style="text-align:right;"> 0.9870243 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9840978 </td>
   <td style="text-align:right;"> 0.9833146 </td>
   <td style="text-align:right;"> 0.9848446 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9815192 </td>
   <td style="text-align:right;"> 0.9806975 </td>
   <td style="text-align:right;"> 0.9823063 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9785271 </td>
   <td style="text-align:right;"> 0.9776676 </td>
   <td style="text-align:right;"> 0.9793538 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9750567 </td>
   <td style="text-align:right;"> 0.9741575 </td>
   <td style="text-align:right;"> 0.9759250 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9710338 </td>
   <td style="text-align:right;"> 0.9700869 </td>
   <td style="text-align:right;"> 0.9719511 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9663733 </td>
   <td style="text-align:right;"> 0.9653605 </td>
   <td style="text-align:right;"> 0.9673570 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9609782 </td>
   <td style="text-align:right;"> 0.9598647 </td>
   <td style="text-align:right;"> 0.9620614 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9547379 </td>
   <td style="text-align:right;"> 0.9534673 </td>
   <td style="text-align:right;"> 0.9559747 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9475273 </td>
   <td style="text-align:right;"> 0.9460181 </td>
   <td style="text-align:right;"> 0.9489954 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9392050 </td>
   <td style="text-align:right;"> 0.9373510 </td>
   <td style="text-align:right;"> 0.9410058 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9296125 </td>
   <td style="text-align:right;"> 0.9272839 </td>
   <td style="text-align:right;"> 0.9318692 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9456820 </td>
   <td style="text-align:right;"> 0.9441795 </td>
   <td style="text-align:right;"> 0.9471452 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9408025 </td>
   <td style="text-align:right;"> 0.9393217 </td>
   <td style="text-align:right;"> 0.9422483 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9354998 </td>
   <td style="text-align:right;"> 0.9340474 </td>
   <td style="text-align:right;"> 0.9369213 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9297401 </td>
   <td style="text-align:right;"> 0.9283196 </td>
   <td style="text-align:right;"> 0.9311335 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9234875 </td>
   <td style="text-align:right;"> 0.9220966 </td>
   <td style="text-align:right;"> 0.9248545 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9167037 </td>
   <td style="text-align:right;"> 0.9153308 </td>
   <td style="text-align:right;"> 0.9180554 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9093486 </td>
   <td style="text-align:right;"> 0.9079678 </td>
   <td style="text-align:right;"> 0.9107096 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9013796 </td>
   <td style="text-align:right;"> 0.8999472 </td>
   <td style="text-align:right;"> 0.9027926 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8927523 </td>
   <td style="text-align:right;"> 0.8912055 </td>
   <td style="text-align:right;"> 0.8942783 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8834202 </td>
   <td style="text-align:right;"> 0.8816809 </td>
   <td style="text-align:right;"> 0.8851357 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8733352 </td>
   <td style="text-align:right;"> 0.8713160 </td>
   <td style="text-align:right;"> 0.8753251 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8624477 </td>
   <td style="text-align:right;"> 0.8600576 </td>
   <td style="text-align:right;"> 0.8648003 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9570307 </td>
   <td style="text-align:right;"> 0.9559468 </td>
   <td style="text-align:right;"> 0.9580885 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9521663 </td>
   <td style="text-align:right;"> 0.9510769 </td>
   <td style="text-align:right;"> 0.9532321 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9467668 </td>
   <td style="text-align:right;"> 0.9456801 </td>
   <td style="text-align:right;"> 0.9478323 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9407769 </td>
   <td style="text-align:right;"> 0.9397009 </td>
   <td style="text-align:right;"> 0.9418342 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9341368 </td>
   <td style="text-align:right;"> 0.9330779 </td>
   <td style="text-align:right;"> 0.9351795 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9267816 </td>
   <td style="text-align:right;"> 0.9257417 </td>
   <td style="text-align:right;"> 0.9278074 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9186413 </td>
   <td style="text-align:right;"> 0.9176142 </td>
   <td style="text-align:right;"> 0.9196563 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9096410 </td>
   <td style="text-align:right;"> 0.9086059 </td>
   <td style="text-align:right;"> 0.9106650 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8997006 </td>
   <td style="text-align:right;"> 0.8986167 </td>
   <td style="text-align:right;"> 0.9007736 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8887350 </td>
   <td style="text-align:right;"> 0.8875388 </td>
   <td style="text-align:right;"> 0.8899194 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8766549 </td>
   <td style="text-align:right;"> 0.8752640 </td>
   <td style="text-align:right;"> 0.8780315 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8633670 </td>
   <td style="text-align:right;"> 0.8616887 </td>
   <td style="text-align:right;"> 0.8650266 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9463094 </td>
   <td style="text-align:right;"> 0.9449077 </td>
   <td style="text-align:right;"> 0.9476765 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9427950 </td>
   <td style="text-align:right;"> 0.9414364 </td>
   <td style="text-align:right;"> 0.9441230 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9390580 </td>
   <td style="text-align:right;"> 0.9377460 </td>
   <td style="text-align:right;"> 0.9403432 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9350853 </td>
   <td style="text-align:right;"> 0.9338205 </td>
   <td style="text-align:right;"> 0.9363269 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9308634 </td>
   <td style="text-align:right;"> 0.9296414 </td>
   <td style="text-align:right;"> 0.9320650 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9263779 </td>
   <td style="text-align:right;"> 0.9251876 </td>
   <td style="text-align:right;"> 0.9275499 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9216137 </td>
   <td style="text-align:right;"> 0.9204346 </td>
   <td style="text-align:right;"> 0.9227761 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9165554 </td>
   <td style="text-align:right;"> 0.9153554 </td>
   <td style="text-align:right;"> 0.9177392 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9111867 </td>
   <td style="text-align:right;"> 0.9099221 </td>
   <td style="text-align:right;"> 0.9124344 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9054907 </td>
   <td style="text-align:right;"> 0.9041089 </td>
   <td style="text-align:right;"> 0.9068535 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8994499 </td>
   <td style="text-align:right;"> 0.8978937 </td>
   <td style="text-align:right;"> 0.9009837 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8930463 </td>
   <td style="text-align:right;"> 0.8912572 </td>
   <td style="text-align:right;"> 0.8948078 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7043318 </td>
   <td style="text-align:right;"> 0.6993951 </td>
   <td style="text-align:right;"> 0.7092053 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7447622 </td>
   <td style="text-align:right;"> 0.7408631 </td>
   <td style="text-align:right;"> 0.7486131 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7805449 </td>
   <td style="text-align:right;"> 0.7775198 </td>
   <td style="text-align:right;"> 0.7835347 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8119564 </td>
   <td style="text-align:right;"> 0.8096428 </td>
   <td style="text-align:right;"> 0.8142452 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8393420 </td>
   <td style="text-align:right;"> 0.8375845 </td>
   <td style="text-align:right;"> 0.8410823 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8630801 </td>
   <td style="text-align:right;"> 0.8617343 </td>
   <td style="text-align:right;"> 0.8644139 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8835568 </td>
   <td style="text-align:right;"> 0.8824923 </td>
   <td style="text-align:right;"> 0.8846123 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9011483 </td>
   <td style="text-align:right;"> 0.9002555 </td>
   <td style="text-align:right;"> 0.9020335 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9162091 </td>
   <td style="text-align:right;"> 0.9154081 </td>
   <td style="text-align:right;"> 0.9170029 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9290662 </td>
   <td style="text-align:right;"> 0.9283100 </td>
   <td style="text-align:right;"> 0.9298149 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9400155 </td>
   <td style="text-align:right;"> 0.9392836 </td>
   <td style="text-align:right;"> 0.9407389 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9493209 </td>
   <td style="text-align:right;"> 0.9486089 </td>
   <td style="text-align:right;"> 0.9500233 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.8489427 </td>
   <td style="text-align:right;"> 0.8440691 </td>
   <td style="text-align:right;"> 0.8536774 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.8709468 </td>
   <td style="text-align:right;"> 0.8676514 </td>
   <td style="text-align:right;"> 0.8741663 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.8899557 </td>
   <td style="text-align:right;"> 0.8878891 </td>
   <td style="text-align:right;"> 0.8919866 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9063167 </td>
   <td style="text-align:right;"> 0.9051622 </td>
   <td style="text-align:right;"> 0.9074578 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9203548 </td>
   <td style="text-align:right;"> 0.9197600 </td>
   <td style="text-align:right;"> 0.9209454 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9323684 </td>
   <td style="text-align:right;"> 0.9318075 </td>
   <td style="text-align:right;"> 0.9329249 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9426267 </td>
   <td style="text-align:right;"> 0.9418242 </td>
   <td style="text-align:right;"> 0.9434184 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9513697 </td>
   <td style="text-align:right;"> 0.9503477 </td>
   <td style="text-align:right;"> 0.9523712 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9588097 </td>
   <td style="text-align:right;"> 0.9576361 </td>
   <td style="text-align:right;"> 0.9599514 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9651323 </td>
   <td style="text-align:right;"> 0.9638702 </td>
   <td style="text-align:right;"> 0.9663511 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9704994 </td>
   <td style="text-align:right;"> 0.9691996 </td>
   <td style="text-align:right;"> 0.9717451 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9750511 </td>
   <td style="text-align:right;"> 0.9737527 </td>
   <td style="text-align:right;"> 0.9762860 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8779582 </td>
   <td style="text-align:right;"> 0.8755663 </td>
   <td style="text-align:right;"> 0.8803074 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8890725 </td>
   <td style="text-align:right;"> 0.8872115 </td>
   <td style="text-align:right;"> 0.8909046 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8992334 </td>
   <td style="text-align:right;"> 0.8978136 </td>
   <td style="text-align:right;"> 0.9006347 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9085121 </td>
   <td style="text-align:right;"> 0.9074438 </td>
   <td style="text-align:right;"> 0.9095687 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9169763 </td>
   <td style="text-align:right;"> 0.9161645 </td>
   <td style="text-align:right;"> 0.9177807 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9246902 </td>
   <td style="text-align:right;"> 0.9240295 </td>
   <td style="text-align:right;"> 0.9253454 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9317143 </td>
   <td style="text-align:right;"> 0.9311000 </td>
   <td style="text-align:right;"> 0.9323233 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9381053 </td>
   <td style="text-align:right;"> 0.9374619 </td>
   <td style="text-align:right;"> 0.9387424 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9439164 </td>
   <td style="text-align:right;"> 0.9432093 </td>
   <td style="text-align:right;"> 0.9446150 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9491967 </td>
   <td style="text-align:right;"> 0.9484193 </td>
   <td style="text-align:right;"> 0.9499627 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9539921 </td>
   <td style="text-align:right;"> 0.9531511 </td>
   <td style="text-align:right;"> 0.9548184 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9583448 </td>
   <td style="text-align:right;"> 0.9574520 </td>
   <td style="text-align:right;"> 0.9592194 </td>
  </tr>
</tbody>
</table>

### Slope of layers

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Layers EMMs (Proportion Correct)</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> Layers </th>
   <th style="text-align:right;"> Proportion Correct </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.9374051 </td>
   <td style="text-align:right;"> 0.9367489 </td>
   <td style="text-align:right;"> 0.9380548 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.9316490 </td>
   <td style="text-align:right;"> 0.9311743 </td>
   <td style="text-align:right;"> 0.9321206 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.9253849 </td>
   <td style="text-align:right;"> 0.9248430 </td>
   <td style="text-align:right;"> 0.9259231 </td>
  </tr>
</tbody>
</table>

### Slope of neurons

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Neurons EMMs (Proportion Correct)</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> Neurons </th>
   <th style="text-align:right;"> Proportion Correct </th>
   <th style="text-align:right;"> Asymptotic LCL </th>
   <th style="text-align:right;"> Asymptotic UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 0.9174385 </td>
   <td style="text-align:right;"> 0.9167733 </td>
   <td style="text-align:right;"> 0.9180986 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:right;"> 0.9190358 </td>
   <td style="text-align:right;"> 0.9184130 </td>
   <td style="text-align:right;"> 0.9196541 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 96 </td>
   <td style="text-align:right;"> 0.9206036 </td>
   <td style="text-align:right;"> 0.9200187 </td>
   <td style="text-align:right;"> 0.9211844 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 128 </td>
   <td style="text-align:right;"> 0.9221423 </td>
   <td style="text-align:right;"> 0.9215908 </td>
   <td style="text-align:right;"> 0.9226902 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 0.9236525 </td>
   <td style="text-align:right;"> 0.9231294 </td>
   <td style="text-align:right;"> 0.9241722 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 192 </td>
   <td style="text-align:right;"> 0.9251346 </td>
   <td style="text-align:right;"> 0.9246349 </td>
   <td style="text-align:right;"> 0.9256311 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 224 </td>
   <td style="text-align:right;"> 0.9265891 </td>
   <td style="text-align:right;"> 0.9261078 </td>
   <td style="text-align:right;"> 0.9270673 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 256 </td>
   <td style="text-align:right;"> 0.9280164 </td>
   <td style="text-align:right;"> 0.9275483 </td>
   <td style="text-align:right;"> 0.9284815 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 288 </td>
   <td style="text-align:right;"> 0.9294170 </td>
   <td style="text-align:right;"> 0.9289573 </td>
   <td style="text-align:right;"> 0.9298738 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 320 </td>
   <td style="text-align:right;"> 0.9307914 </td>
   <td style="text-align:right;"> 0.9303354 </td>
   <td style="text-align:right;"> 0.9312445 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 352 </td>
   <td style="text-align:right;"> 0.9321400 </td>
   <td style="text-align:right;"> 0.9316835 </td>
   <td style="text-align:right;"> 0.9325937 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 384 </td>
   <td style="text-align:right;"> 0.9334634 </td>
   <td style="text-align:right;"> 0.9330024 </td>
   <td style="text-align:right;"> 0.9339212 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 416 </td>
   <td style="text-align:right;"> 0.9347618 </td>
   <td style="text-align:right;"> 0.9342932 </td>
   <td style="text-align:right;"> 0.9352271 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 448 </td>
   <td style="text-align:right;"> 0.9360357 </td>
   <td style="text-align:right;"> 0.9355569 </td>
   <td style="text-align:right;"> 0.9365111 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 480 </td>
   <td style="text-align:right;"> 0.9372856 </td>
   <td style="text-align:right;"> 0.9367943 </td>
   <td style="text-align:right;"> 0.9377733 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 512 </td>
   <td style="text-align:right;"> 0.9385119 </td>
   <td style="text-align:right;"> 0.9380064 </td>
   <td style="text-align:right;"> 0.9390135 </td>
  </tr>
</tbody>
</table>



