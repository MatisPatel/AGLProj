# Beta‑Regression Model Selection Report

*Generated on: 2026‑01‑22 13:56*

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
   <td style="text-align:right;"> 1601742 </td>
   <td style="text-align:right;"> 996908 </td>
   <td style="text-align:right;"> -3203380 </td>
   <td style="text-align:right;"> -3202766 </td>
   <td style="text-align:right;"> 0.203 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M2 </td>
   <td style="text-align:right;"> 1601427 </td>
   <td style="text-align:right;"> 996910 </td>
   <td style="text-align:right;"> -3202754 </td>
   <td style="text-align:right;"> -3202163 </td>
   <td style="text-align:right;"> 0.203 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M3 </td>
   <td style="text-align:right;"> 1601483 </td>
   <td style="text-align:right;"> 996914 </td>
   <td style="text-align:right;"> -3202874 </td>
   <td style="text-align:right;"> -3202331 </td>
   <td style="text-align:right;"> 0.203 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M4 </td>
   <td style="text-align:right;"> 1594549 </td>
   <td style="text-align:right;"> 996920 </td>
   <td style="text-align:right;"> -3189018 </td>
   <td style="text-align:right;"> -3188546 </td>
   <td style="text-align:right;"> 0.194 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M5 </td>
   <td style="text-align:right;"> 1574114 </td>
   <td style="text-align:right;"> 996914 </td>
   <td style="text-align:right;"> -3148136 </td>
   <td style="text-align:right;"> -3147593 </td>
   <td style="text-align:right;"> 0.164 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M6 </td>
   <td style="text-align:right;"> 1593795 </td>
   <td style="text-align:right;"> 996909 </td>
   <td style="text-align:right;"> -3187487 </td>
   <td style="text-align:right;"> -3186885 </td>
   <td style="text-align:right;"> 0.201 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 </td>
   <td style="text-align:right;"> 1580901 </td>
   <td style="text-align:right;"> 996909 </td>
   <td style="text-align:right;"> -3161700 </td>
   <td style="text-align:right;"> -3161098 </td>
   <td style="text-align:right;"> 0.188 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M8 </td>
   <td style="text-align:right;"> 1573139 </td>
   <td style="text-align:right;"> 996910 </td>
   <td style="text-align:right;"> -3146179 </td>
   <td style="text-align:right;"> -3145588 </td>
   <td style="text-align:right;"> 0.185 </td>
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
   <td style="text-align:right;"> 1975578 </td>
   <td style="text-align:right;"> 996908 </td>
   <td style="text-align:right;"> -3951052 </td>
   <td style="text-align:right;"> -3950438 </td>
   <td style="text-align:right;"> 0.163 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M2 </td>
   <td style="text-align:right;"> 1975235 </td>
   <td style="text-align:right;"> 996910 </td>
   <td style="text-align:right;"> -3950371 </td>
   <td style="text-align:right;"> -3949780 </td>
   <td style="text-align:right;"> 0.163 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M3 </td>
   <td style="text-align:right;"> 1975230 </td>
   <td style="text-align:right;"> 996914 </td>
   <td style="text-align:right;"> -3950368 </td>
   <td style="text-align:right;"> -3949825 </td>
   <td style="text-align:right;"> 0.163 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M4 </td>
   <td style="text-align:right;"> 1962692 </td>
   <td style="text-align:right;"> 996920 </td>
   <td style="text-align:right;"> -3925303 </td>
   <td style="text-align:right;"> -3924831 </td>
   <td style="text-align:right;"> 0.157 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M5 </td>
   <td style="text-align:right;"> 1946804 </td>
   <td style="text-align:right;"> 996914 </td>
   <td style="text-align:right;"> -3893517 </td>
   <td style="text-align:right;"> -3892974 </td>
   <td style="text-align:right;"> 0.142 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M6 </td>
   <td style="text-align:right;"> 1963025 </td>
   <td style="text-align:right;"> 996909 </td>
   <td style="text-align:right;"> -3925948 </td>
   <td style="text-align:right;"> -3925345 </td>
   <td style="text-align:right;"> 0.164 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 </td>
   <td style="text-align:right;"> 1955485 </td>
   <td style="text-align:right;"> 996909 </td>
   <td style="text-align:right;"> -3910869 </td>
   <td style="text-align:right;"> -3910266 </td>
   <td style="text-align:right;"> 0.158 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M8 </td>
   <td style="text-align:right;"> 1942854 </td>
   <td style="text-align:right;"> 996910 </td>
   <td style="text-align:right;"> -3885607 </td>
   <td style="text-align:right;"> -3885017 </td>
   <td style="text-align:right;"> 0.158 </td>
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
   <td style="text-align:right;"> -314.8838 </td>
   <td style="text-align:right;"> 629.7677 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M3 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -258.9969 </td>
   <td style="text-align:right;"> 517.9937 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M4 </td>
   <td style="text-align:right;"> -12 </td>
   <td style="text-align:right;"> -7192.9012 </td>
   <td style="text-align:right;"> 14385.8023 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M5 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -27627.8025 </td>
   <td style="text-align:right;"> 55255.6050 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M6 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -7947.3412 </td>
   <td style="text-align:right;"> 15894.6825 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M7 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -20840.7651 </td>
   <td style="text-align:right;"> 41681.5302 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M8 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -28602.6676 </td>
   <td style="text-align:right;"> 57205.3351 </td>
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
   <td style="text-align:right;"> -374151.0 </td>
   <td style="text-align:right;"> 748302.0 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M3 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -374095.1 </td>
   <td style="text-align:right;"> 748190.2 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M4 </td>
   <td style="text-align:right;"> -12 </td>
   <td style="text-align:right;"> -381029.0 </td>
   <td style="text-align:right;"> 762058.0 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M5 </td>
   <td style="text-align:right;"> -6 </td>
   <td style="text-align:right;"> -401463.9 </td>
   <td style="text-align:right;"> 802927.8 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M6 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -381783.5 </td>
   <td style="text-align:right;"> 763566.9 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M7 </td>
   <td style="text-align:right;"> -1 </td>
   <td style="text-align:right;"> -394676.9 </td>
   <td style="text-align:right;"> 789353.8 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 vs. M8 </td>
   <td style="text-align:right;"> -2 </td>
   <td style="text-align:right;"> -402438.8 </td>
   <td style="text-align:right;"> 804877.6 </td>
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
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.105 </td>
   <td style="text-align:right;"> 0.108 </td>
   <td style="text-align:right;"> 0.105 </td>
   <td style="text-align:right;"> 0.107 </td>
   <td style="text-align:right;"> 0.108 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.107 </td>
   <td style="text-align:right;"> 0.105 </td>
   <td style="text-align:right;"> 0.107 </td>
   <td style="text-align:right;"> 0.108 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.105 </td>
   <td style="text-align:right;"> 0.108 </td>
   <td style="text-align:right;"> 0.105 </td>
   <td style="text-align:right;"> 0.107 </td>
   <td style="text-align:right;"> 0.108 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.108 </td>
   <td style="text-align:right;"> 0.105 </td>
   <td style="text-align:right;"> 0.107 </td>
   <td style="text-align:right;"> 0.108 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.107 </td>
   <td style="text-align:right;"> 0.105 </td>
   <td style="text-align:right;"> 0.107 </td>
   <td style="text-align:right;"> 0.108 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mean </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.108 </td>
   <td style="text-align:right;"> 0.105 </td>
   <td style="text-align:right;"> 0.107 </td>
   <td style="text-align:right;"> 0.108 </td>
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
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.102 </td>
   <td style="text-align:right;"> 0.100 </td>
   <td style="text-align:right;"> 0.101 </td>
   <td style="text-align:right;"> 0.102 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.102 </td>
   <td style="text-align:right;"> 0.100 </td>
   <td style="text-align:right;"> 0.101 </td>
   <td style="text-align:right;"> 0.102 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.102 </td>
   <td style="text-align:right;"> 0.100 </td>
   <td style="text-align:right;"> 0.102 </td>
   <td style="text-align:right;"> 0.103 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.102 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.101 </td>
   <td style="text-align:right;"> 0.102 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.102 </td>
   <td style="text-align:right;"> 0.100 </td>
   <td style="text-align:right;"> 0.101 </td>
   <td style="text-align:right;"> 0.102 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mean </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.099 </td>
   <td style="text-align:right;"> 0.102 </td>
   <td style="text-align:right;"> 0.100 </td>
   <td style="text-align:right;"> 0.101 </td>
   <td style="text-align:right;"> 0.102 </td>
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
   <td style="text-align:right;"> 1601742 </td>
   <td style="text-align:right;"> -3203380 </td>
   <td style="text-align:right;"> -3202766 </td>
   <td style="text-align:right;"> 0.203 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 (Inverse Brier) </td>
   <td style="text-align:left;"> loglog </td>
   <td style="text-align:right;"> 1602313 </td>
   <td style="text-align:right;"> -3204522 </td>
   <td style="text-align:right;"> -3203907 </td>
   <td style="text-align:right;"> 0.198 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 (Proportion) </td>
   <td style="text-align:left;"> logit </td>
   <td style="text-align:right;"> 1975578 </td>
   <td style="text-align:right;"> -3951052 </td>
   <td style="text-align:right;"> -3950438 </td>
   <td style="text-align:right;"> 0.163 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 (Proportion) </td>
   <td style="text-align:left;"> loglog </td>
   <td style="text-align:right;"> 1975807 </td>
   <td style="text-align:right;"> -3951510 </td>
   <td style="text-align:right;"> -3950896 </td>
   <td style="text-align:right;"> 0.159 </td>
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
   <td style="text-align:right;"> 1602313 </td>
   <td style="text-align:right;"> -3204522 </td>
   <td style="text-align:right;"> -3203907 </td>
   <td style="text-align:right;"> 0.198 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 (Inverse Brier; φ constant) </td>
   <td style="text-align:right;"> 1501289 </td>
   <td style="text-align:right;"> -3002509 </td>
   <td style="text-align:right;"> -3002108 </td>
   <td style="text-align:right;"> 0.273 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 (Proportion; dispersion φ sub-model) </td>
   <td style="text-align:right;"> 1975807 </td>
   <td style="text-align:right;"> -3951510 </td>
   <td style="text-align:right;"> -3950896 </td>
   <td style="text-align:right;"> 0.159 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M7 (Proportion; φ constant) </td>
   <td style="text-align:right;"> 1886359 </td>
   <td style="text-align:right;"> -3772651 </td>
   <td style="text-align:right;"> -3772249 </td>
   <td style="text-align:right;"> 0.254 </td>
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
  #Df  LogLik Df  Chisq Pr(>Chisq)    
1  34 1501289                         
2  52 1602313 18 202048  < 2.2e-16 ***
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
1  34 1886359                         
2  52 1975807 18 178895  < 2.2e-16 ***
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
   <td style="text-align:right;"> 1614420 </td>
   <td style="text-align:right;"> 996896 </td>
   <td style="text-align:right;"> -3228713 </td>
   <td style="text-align:right;"> -3227957 </td>
   <td style="text-align:right;"> 0.200 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1b </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 1602405 </td>
   <td style="text-align:right;"> 996902 </td>
   <td style="text-align:right;"> -3204693 </td>
   <td style="text-align:right;"> -3204008 </td>
   <td style="text-align:right;"> 0.198 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1c </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 1602332 </td>
   <td style="text-align:right;"> 996906 </td>
   <td style="text-align:right;"> -3204557 </td>
   <td style="text-align:right;"> -3203919 </td>
   <td style="text-align:right;"> 0.198 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1d </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 1607156 </td>
   <td style="text-align:right;"> 996902 </td>
   <td style="text-align:right;"> -3214196 </td>
   <td style="text-align:right;"> -3213511 </td>
   <td style="text-align:right;"> 0.228 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1e </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 1614519 </td>
   <td style="text-align:right;"> 996890 </td>
   <td style="text-align:right;"> -3228898 </td>
   <td style="text-align:right;"> -3228071 </td>
   <td style="text-align:right;"> 0.200 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1f </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 1614528 </td>
   <td style="text-align:right;"> 996888 </td>
   <td style="text-align:right;"> -3228913 </td>
   <td style="text-align:right;"> -3228062 </td>
   <td style="text-align:right;"> 0.200 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1g </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 1618107 </td>
   <td style="text-align:right;"> 996882 </td>
   <td style="text-align:right;"> -3236059 </td>
   <td style="text-align:right;"> -3235137 </td>
   <td style="text-align:right;"> 0.222 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 </td>
   <td style="text-align:left;"> Inverse Brier Score </td>
   <td style="text-align:right;"> 1602313 </td>
   <td style="text-align:right;"> 996908 </td>
   <td style="text-align:right;"> -3204522 </td>
   <td style="text-align:right;"> -3203907 </td>
   <td style="text-align:right;"> 0.198 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1a </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1987621 </td>
   <td style="text-align:right;"> 996896 </td>
   <td style="text-align:right;"> -3975113 </td>
   <td style="text-align:right;"> -3974357 </td>
   <td style="text-align:right;"> 0.169 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1b </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1975876 </td>
   <td style="text-align:right;"> 996902 </td>
   <td style="text-align:right;"> -3951636 </td>
   <td style="text-align:right;"> -3950950 </td>
   <td style="text-align:right;"> 0.159 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1c </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1975829 </td>
   <td style="text-align:right;"> 996906 </td>
   <td style="text-align:right;"> -3951551 </td>
   <td style="text-align:right;"> -3950913 </td>
   <td style="text-align:right;"> 0.159 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1d </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1981370 </td>
   <td style="text-align:right;"> 996902 </td>
   <td style="text-align:right;"> -3962623 </td>
   <td style="text-align:right;"> -3961938 </td>
   <td style="text-align:right;"> 0.186 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1e </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1987714 </td>
   <td style="text-align:right;"> 996890 </td>
   <td style="text-align:right;"> -3975287 </td>
   <td style="text-align:right;"> -3974461 </td>
   <td style="text-align:right;"> 0.169 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1f </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1987733 </td>
   <td style="text-align:right;"> 996888 </td>
   <td style="text-align:right;"> -3975321 </td>
   <td style="text-align:right;"> -3974471 </td>
   <td style="text-align:right;"> 0.169 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1g </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1991743 </td>
   <td style="text-align:right;"> 996882 </td>
   <td style="text-align:right;"> -3983329 </td>
   <td style="text-align:right;"> -3982408 </td>
   <td style="text-align:right;"> 0.191 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> M1 </td>
   <td style="text-align:left;"> Proportion Correct </td>
   <td style="text-align:right;"> 1975807 </td>
   <td style="text-align:right;"> 996908 </td>
   <td style="text-align:right;"> -3951510 </td>
   <td style="text-align:right;"> -3950896 </td>
   <td style="text-align:right;"> 0.159 </td>
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
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.104 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.104 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.104 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.104 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.104 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mean </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.104 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.103 </td>
   <td style="text-align:right;"> 0.104 </td>
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
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.099 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.098 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.099 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.098 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.098 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mean </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.098 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.097 </td>
   <td style="text-align:right;"> 0.098 </td>
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
*Plots saved separately as pdf files*: `plots/best_model_inverse_brier_resid_dispersion.pdf`, `plots/best_model_proportion_resid_dispersion.pdf`

Breusch-Pagan tests confirm the heteroskedasticity:
```

	studentized Breusch-Pagan test

data:  best_mod_inverse_brier
BP = 133583, df = 38, p-value < 2.2e-16




	studentized Breusch-Pagan test

data:  best_mod_proportion
BP = 130737, df = 38, p-value < 2.2e-16


```

There is still heteroskedasticity in the model, as indicated by the fan shape of the residuals. This should be noted, but also beta regression doesn't have well-defined residual checks and it may not necessarily be a problem for Beta regression, since it is designed to handle heteroskedasticity.


# Final Model Statistics

## Inverse Brier Score Model

```
Call:
betareg::betareg(formula = .x, data = df, link = "loglog")

Quantile residuals:
     Min       1Q   Median       3Q      Max 
-10.1805  -0.6548   0.1318   0.7409   4.0228 

Coefficients (mean model with loglog link):
                                       Estimate Std. Error  z value Pr(>|z|)
(Intercept)                           4.211e+00  3.351e-02  125.688  < 2e-16
recurrenceRNN                        -4.083e-01  2.852e-02  -14.316  < 2e-16
recurrenceGRU                         4.493e-01  2.850e-02   15.767  < 2e-16
laminationsLaminated                  2.069e-02  1.279e-02    1.618  0.10568
inputsize                            -1.533e-01  1.686e-03  -90.945  < 2e-16
grammartypeLT                        -1.390e+00  3.847e-02  -36.136  < 2e-16
grammartypeLTT                       -1.110e+00  3.651e-02  -30.407  < 2e-16
grammartypeLTTO                      -1.330e+00  3.833e-02  -34.691  < 2e-16
grammartypeMSO                       -3.153e+00  3.546e-02  -88.924  < 2e-16
grammartypeCS                        -1.677e+00  3.432e-02  -48.858  < 2e-16
grammartypeCF                        -2.014e+00  3.435e-02  -58.642  < 2e-16
neurons                               1.262e-03  6.214e-06  203.073  < 2e-16
layers                               -1.083e-01  8.072e-04 -134.192  < 2e-16
recurrenceRNN:grammartypeLT           6.545e-02  3.268e-02    2.003  0.04518
recurrenceGRU:grammartypeLT          -1.425e-01  3.262e-02   -4.370 1.25e-05
recurrenceRNN:grammartypeLTT          4.018e-03  3.086e-02    0.130  0.89643
recurrenceGRU:grammartypeLTT         -2.329e-01  3.077e-02   -7.569 3.77e-14
recurrenceRNN:grammartypeLTTO         3.586e-02  3.268e-02    1.097  0.27245
recurrenceGRU:grammartypeLTTO        -3.411e-01  3.258e-02  -10.468  < 2e-16
recurrenceRNN:grammartypeMSO          4.176e-01  2.981e-02   14.006  < 2e-16
recurrenceGRU:grammartypeMSO         -3.469e-01  2.990e-02  -11.601  < 2e-16
recurrenceRNN:grammartypeCS           4.011e-01  2.903e-02   13.820  < 2e-16
recurrenceGRU:grammartypeCS           3.023e-01  2.905e-02   10.406  < 2e-16
recurrenceRNN:grammartypeCF           1.289e-01  2.925e-02    4.409 1.04e-05
recurrenceGRU:grammartypeCF          -1.994e-01  2.924e-02   -6.821 9.06e-12
grammartypeLT:laminationsLaminated    6.041e-02  1.317e-02    4.587 4.51e-06
grammartypeLTT:laminationsLaminated   2.854e-02  1.250e-02    2.284  0.02240
grammartypeLTTO:laminationsLaminated  3.789e-02  1.303e-02    2.908  0.00364
grammartypeMSO:laminationsLaminated   3.975e-02  1.241e-02    3.202  0.00137
grammartypeCS:laminationsLaminated   -5.253e-02  1.179e-02   -4.453 8.45e-06
grammartypeCF:laminationsLaminated   -1.823e-02  1.167e-02   -1.562  0.11836
recurrenceRNN:laminationsLaminated   -1.608e-01  6.656e-03  -24.163  < 2e-16
recurrenceGRU:laminationsLaminated   -1.067e-01  6.781e-03  -15.734  < 2e-16
grammartypeLT:inputsize               6.531e-02  1.978e-03   33.016  < 2e-16
grammartypeLTT:inputsize              4.665e-02  1.890e-03   24.688  < 2e-16
grammartypeLTTO:inputsize             9.036e-02  1.955e-03   46.212  < 2e-16
grammartypeMSO:inputsize              2.581e-01  1.883e-03  137.036  < 2e-16
grammartypeCS:inputsize               1.336e-01  1.775e-03   75.237  < 2e-16
grammartypeCF:inputsize               1.945e-01  1.754e-03  110.921  < 2e-16
                                        
(Intercept)                          ***
recurrenceRNN                        ***
recurrenceGRU                        ***
laminationsLaminated                    
inputsize                            ***
grammartypeLT                        ***
grammartypeLTT                       ***
grammartypeLTTO                      ***
grammartypeMSO                       ***
grammartypeCS                        ***
grammartypeCF                        ***
neurons                              ***
layers                               ***
recurrenceRNN:grammartypeLT          *  
recurrenceGRU:grammartypeLT          ***
recurrenceRNN:grammartypeLTT            
recurrenceGRU:grammartypeLTT         ***
recurrenceRNN:grammartypeLTTO           
recurrenceGRU:grammartypeLTTO        ***
recurrenceRNN:grammartypeMSO         ***
recurrenceGRU:grammartypeMSO         ***
recurrenceRNN:grammartypeCS          ***
recurrenceGRU:grammartypeCS          ***
recurrenceRNN:grammartypeCF          ***
recurrenceGRU:grammartypeCF          ***
grammartypeLT:laminationsLaminated   ***
grammartypeLTT:laminationsLaminated  *  
grammartypeLTTO:laminationsLaminated ** 
grammartypeMSO:laminationsLaminated  ** 
grammartypeCS:laminationsLaminated   ***
grammartypeCF:laminationsLaminated      
recurrenceRNN:laminationsLaminated   ***
recurrenceGRU:laminationsLaminated   ***
grammartypeLT:inputsize              ***
grammartypeLTT:inputsize             ***
grammartypeLTTO:inputsize            ***
grammartypeMSO:inputsize             ***
grammartypeCS:inputsize              ***
grammartypeCF:inputsize              ***

Phi coefficients (precision model with log link):
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           2.271e+00  3.743e-02  60.665  < 2e-16 ***
recurrenceRNN                        -2.813e-01  3.162e-02  -8.896  < 2e-16 ***
recurrenceGRU                         9.449e-01  3.183e-02  29.690  < 2e-16 ***
laminationsLaminated                 -1.256e-02  1.817e-02  -0.691 0.489582    
inputsize                            -1.036e-01  1.892e-03 -54.743  < 2e-16 ***
grammartypeLT                         6.357e-01  4.980e-02  12.765  < 2e-16 ***
grammartypeLTT                        7.932e-01  4.963e-02  15.983  < 2e-16 ***
grammartypeLTTO                       6.958e-01  5.012e-02  13.883  < 2e-16 ***
grammartypeMSO                        9.883e-01  4.368e-02  22.624  < 2e-16 ***
grammartypeCS                         9.960e-01  4.012e-02  24.823  < 2e-16 ***
grammartypeCF                         1.197e+00  4.011e-02  29.840  < 2e-16 ***
neurons                               1.137e-03  9.921e-06 114.581  < 2e-16 ***
layers                               -1.140e-01  1.297e-03 -87.911  < 2e-16 ***
recurrenceRNN:grammartypeLT          -2.306e-01  4.243e-02  -5.434 5.50e-08 ***
recurrenceGRU:grammartypeLT          -6.708e-01  4.267e-02 -15.720  < 2e-16 ***
recurrenceRNN:grammartypeLTT         -2.242e-01  4.235e-02  -5.294 1.20e-07 ***
recurrenceGRU:grammartypeLTT         -5.713e-01  4.254e-02 -13.428  < 2e-16 ***
recurrenceRNN:grammartypeLTTO        -2.137e-01  4.283e-02  -4.989 6.07e-07 ***
recurrenceGRU:grammartypeLTTO        -7.115e-01  4.301e-02 -16.542  < 2e-16 ***
recurrenceRNN:grammartypeMSO         -1.440e+00  3.730e-02 -38.610  < 2e-16 ***
recurrenceGRU:grammartypeMSO         -3.044e+00  3.751e-02 -81.139  < 2e-16 ***
recurrenceRNN:grammartypeCS          -6.391e-01  3.394e-02 -18.829  < 2e-16 ***
recurrenceGRU:grammartypeCS          -1.455e+00  3.417e-02 -42.567  < 2e-16 ***
recurrenceRNN:grammartypeCF          -6.528e-01  3.403e-02 -19.180  < 2e-16 ***
recurrenceGRU:grammartypeCF          -1.525e+00  3.424e-02 -44.545  < 2e-16 ***
grammartypeLT:laminationsLaminated    3.035e-02  1.702e-02   1.784 0.074494 .  
grammartypeLTT:laminationsLaminated   2.700e-02  1.687e-02   1.600 0.109608    
grammartypeLTTO:laminationsLaminated  1.381e-03  1.705e-02   0.081 0.935440    
grammartypeMSO:laminationsLaminated   6.082e-02  1.484e-02   4.098 4.17e-05 ***
grammartypeCS:laminationsLaminated    1.463e-02  1.381e-02   1.059 0.289648    
grammartypeCF:laminationsLaminated   -4.967e-02  1.375e-02  -3.613 0.000302 ***
recurrenceRNN:laminationsLaminated   -5.907e-02  1.406e-02  -4.200 2.67e-05 ***
recurrenceGRU:laminationsLaminated   -3.395e-02  1.413e-02  -2.402 0.016305 *  
grammartypeLT:inputsize               5.534e-02  2.543e-03  21.763  < 2e-16 ***
grammartypeLTT:inputsize              9.965e-02  2.528e-03  39.422  < 2e-16 ***
grammartypeLTTO:inputsize             8.006e-02  2.547e-03  31.439  < 2e-16 ***
grammartypeMSO:inputsize              1.470e-01  2.229e-03  65.962  < 2e-16 ***
grammartypeCS:inputsize               1.247e-01  2.071e-03  60.192  < 2e-16 ***
grammartypeCF:inputsize               1.053e-01  2.059e-03  51.141  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

Type of estimator: ML (maximum likelihood)
Log-likelihood: 1.618e+06 on 78 Df
Pseudo R-squared: 0.2218
Number of iterations: 100 (BFGS) + 41 (Fisher scoring) 
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
   <td style="text-align:right;"> 0.9581766 </td>
   <td style="text-align:right;"> 0.9559180 </td>
   <td style="text-align:right;"> 0.9603219 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9327225 </td>
   <td style="text-align:right;"> 0.9316343 </td>
   <td style="text-align:right;"> 0.9337940 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9716553 </td>
   <td style="text-align:right;"> 0.9712178 </td>
   <td style="text-align:right;"> 0.9720863 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8984117 </td>
   <td style="text-align:right;"> 0.8954498 </td>
   <td style="text-align:right;"> 0.9012944 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8491033 </td>
   <td style="text-align:right;"> 0.8476983 </td>
   <td style="text-align:right;"> 0.8504965 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9202166 </td>
   <td style="text-align:right;"> 0.9194735 </td>
   <td style="text-align:right;"> 0.9209531 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9109032 </td>
   <td style="text-align:right;"> 0.9089388 </td>
   <td style="text-align:right;"> 0.9128273 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8594019 </td>
   <td style="text-align:right;"> 0.8582886 </td>
   <td style="text-align:right;"> 0.8605071 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9237829 </td>
   <td style="text-align:right;"> 0.9232224 </td>
   <td style="text-align:right;"> 0.9243394 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9174818 </td>
   <td style="text-align:right;"> 0.9150478 </td>
   <td style="text-align:right;"> 0.9198492 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8733214 </td>
   <td style="text-align:right;"> 0.8721393 </td>
   <td style="text-align:right;"> 0.8744933 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9217127 </td>
   <td style="text-align:right;"> 0.9210332 </td>
   <td style="text-align:right;"> 0.9223865 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8420454 </td>
   <td style="text-align:right;"> 0.8397731 </td>
   <td style="text-align:right;"> 0.8442885 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8314370 </td>
   <td style="text-align:right;"> 0.8302933 </td>
   <td style="text-align:right;"> 0.8325738 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8490059 </td>
   <td style="text-align:right;"> 0.8477554 </td>
   <td style="text-align:right;"> 0.8502471 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9091085 </td>
   <td style="text-align:right;"> 0.9081311 </td>
   <td style="text-align:right;"> 0.9100760 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9012133 </td>
   <td style="text-align:right;"> 0.9007534 </td>
   <td style="text-align:right;"> 0.9016711 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9537016 </td>
   <td style="text-align:right;"> 0.9534351 </td>
   <td style="text-align:right;"> 0.9539665 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9166643 </td>
   <td style="text-align:right;"> 0.9156155 </td>
   <td style="text-align:right;"> 0.9177007 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8827700 </td>
   <td style="text-align:right;"> 0.8822792 </td>
   <td style="text-align:right;"> 0.8832588 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9310077 </td>
   <td style="text-align:right;"> 0.9306817 </td>
   <td style="text-align:right;"> 0.9313322 </td>
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
   <td style="text-align:right;"> 0.48870659 </td>
   <td style="text-align:right;"> 0.02836083 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 17.231746 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.39595967 </td>
   <td style="text-align:right;"> 0.02833304 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -13.975194 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.88466627 </td>
   <td style="text-align:right;"> 0.01152777 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -76.742182 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.42325453 </td>
   <td style="text-align:right;"> 0.01624330 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 26.057178 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.25341273 </td>
   <td style="text-align:right;"> 0.01618276 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -15.659423 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.67666726 </td>
   <td style="text-align:right;"> 0.00711374 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -95.121182 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.48468899 </td>
   <td style="text-align:right;"> 0.01218785 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 39.768226 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.16305605 </td>
   <td style="text-align:right;"> 0.01201987 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -13.565541 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.64774504 </td>
   <td style="text-align:right;"> 0.00573441 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -112.957477 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.45284399 </td>
   <td style="text-align:right;"> 0.01624668 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 27.873024 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.05490077 </td>
   <td style="text-align:right;"> 0.01610126 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -3.409719 </td>
   <td style="text-align:right;"> 0.00188096 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.50774475 </td>
   <td style="text-align:right;"> 0.00683988 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -74.233033 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.07115291 </td>
   <td style="text-align:right;"> 0.00920586 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.729092 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.04906815 </td>
   <td style="text-align:right;"> 0.00957305 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.125653 </td>
   <td style="text-align:right;"> 0.00000089 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.12022106 </td>
   <td style="text-align:right;"> 0.00581574 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -20.671677 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.08758560 </td>
   <td style="text-align:right;"> 0.00619725 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 14.132987 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.69821664 </td>
   <td style="text-align:right;"> 0.00641165 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -108.898056 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.78580223 </td>
   <td style="text-align:right;"> 0.00389655 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -201.666288 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.35976729 </td>
   <td style="text-align:right;"> 0.00716442 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 50.215829 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.19654263 </td>
   <td style="text-align:right;"> 0.00723943 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -27.148895 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.55630992 </td>
   <td style="text-align:right;"> 0.00333813 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -166.653367 </td>
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
   <td style="text-align:right;"> 0.91927246 </td>
   <td style="text-align:right;"> 0.03149747 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 29.1855979 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.78127825 </td>
   <td style="text-align:right;"> 0.02980496 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 26.2130310 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.70102917 </td>
   <td style="text-align:right;"> 0.03150199 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 22.2534859 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.39229568 </td>
   <td style="text-align:right;"> 0.02855748 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 48.7541550 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.80219224 </td>
   <td style="text-align:right;"> 0.02801881 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 28.6304905 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.71132705 </td>
   <td style="text-align:right;"> 0.02822435 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 25.2025984 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.13799421 </td>
   <td style="text-align:right;"> 0.01938315 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.1192871 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.21824330 </td>
   <td style="text-align:right;"> 0.02190298 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.9640934 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.47302322 </td>
   <td style="text-align:right;"> 0.01740430 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 27.1785318 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.11708023 </td>
   <td style="text-align:right;"> 0.01650575 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.0932985 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.20794542 </td>
   <td style="text-align:right;"> 0.01685168 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.3397427 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.08024909 </td>
   <td style="text-align:right;"> 0.01939048 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -4.1385824 </td>
   <td style="text-align:right;"> 0.00069248 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.61101743 </td>
   <td style="text-align:right;"> 0.01411208 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 43.2974824 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.02091398 </td>
   <td style="text-align:right;"> 0.01298757 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.6103081 </td>
   <td style="text-align:right;"> 0.67569267 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.06995121 </td>
   <td style="text-align:right;"> 0.01342493 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.2105469 </td>
   <td style="text-align:right;"> 0.00000392 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.69126651 </td>
   <td style="text-align:right;"> 0.01741252 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 39.6993845 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.10116307 </td>
   <td style="text-align:right;"> 0.01651446 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.1257264 </td>
   <td style="text-align:right;"> 0.00000002 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.01029788 </td>
   <td style="text-align:right;"> 0.01686009 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.6107845 </td>
   <td style="text-align:right;"> 0.99650395 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.59010345 </td>
   <td style="text-align:right;"> 0.00979069 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -60.2718851 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.68096864 </td>
   <td style="text-align:right;"> 0.01036489 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -65.6995227 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.09086519 </td>
   <td style="text-align:right;"> 0.00877276 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -10.3576568 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.85382040 </td>
   <td style="text-align:right;"> 0.00991606 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 86.1047803 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.77726065 </td>
   <td style="text-align:right;"> 0.00952929 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 81.5654133 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.66516656 </td>
   <td style="text-align:right;"> 0.00988368 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 67.2994732 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.97474199 </td>
   <td style="text-align:right;"> 0.00928863 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 104.9392833 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.40107124 </td>
   <td style="text-align:right;"> 0.00884033 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 45.3683574 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.58238774 </td>
   <td style="text-align:right;"> 0.00877901 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 66.3386548 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.07655975 </td>
   <td style="text-align:right;"> 0.00673062 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -11.3748363 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.18865384 </td>
   <td style="text-align:right;"> 0.00722367 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -26.1160789 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.12092159 </td>
   <td style="text-align:right;"> 0.00638561 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 18.9365754 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.45274916 </td>
   <td style="text-align:right;"> 0.00571376 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -79.2383593 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.27143266 </td>
   <td style="text-align:right;"> 0.00561823 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -48.3128464 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.11209409 </td>
   <td style="text-align:right;"> 0.00668273 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -16.7737085 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.19748134 </td>
   <td style="text-align:right;"> 0.00576659 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 34.2457518 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.37618941 </td>
   <td style="text-align:right;"> 0.00501231 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -75.0530405 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.19487291 </td>
   <td style="text-align:right;"> 0.00490324 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -39.7436981 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.30957543 </td>
   <td style="text-align:right;"> 0.00633514 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 48.8663676 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.26409532 </td>
   <td style="text-align:right;"> 0.00565727 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -46.6824285 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.08277882 </td>
   <td style="text-align:right;"> 0.00556076 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -14.8862545 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.57367075 </td>
   <td style="text-align:right;"> 0.00453850 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -126.4009012 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.39235425 </td>
   <td style="text-align:right;"> 0.00441784 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -88.8114125 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.18131650 </td>
   <td style="text-align:right;"> 0.00337457 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 53.7302657 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.06181941 </td>
   <td style="text-align:right;"> 0.00933841 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 113.7045608 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.01418188 </td>
   <td style="text-align:right;"> 0.00883242 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 114.8248836 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.04208808 </td>
   <td style="text-align:right;"> 0.00916409 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 113.7142529 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.73918720 </td>
   <td style="text-align:right;"> 0.00915353 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 190.0017881 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.49993527 </td>
   <td style="text-align:right;"> 0.00847704 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 58.9752465 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.91074409 </td>
   <td style="text-align:right;"> 0.00831189 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 109.5712090 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.04763753 </td>
   <td style="text-align:right;"> 0.00628283 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.5821807 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.01973133 </td>
   <td style="text-align:right;"> 0.00674111 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.9270168 </td>
   <td style="text-align:right;"> 0.05314743 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.67736779 </td>
   <td style="text-align:right;"> 0.00672693 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 100.6950091 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.56188414 </td>
   <td style="text-align:right;"> 0.00577270 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -97.3346751 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.15107532 </td>
   <td style="text-align:right;"> 0.00552718 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -27.3331681 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.02790620 </td>
   <td style="text-align:right;"> 0.00602068 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.6350594 </td>
   <td style="text-align:right;"> 0.00007300 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.72500532 </td>
   <td style="text-align:right;"> 0.00600482 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 120.7373141 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.51424661 </td>
   <td style="text-align:right;"> 0.00491210 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -104.6896891 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.10343779 </td>
   <td style="text-align:right;"> 0.00462122 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -22.3832078 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.69709913 </td>
   <td style="text-align:right;"> 0.00648280 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 107.5306180 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.54215280 </td>
   <td style="text-align:right;"> 0.00548626 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -98.8200803 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.13134399 </td>
   <td style="text-align:right;"> 0.00522727 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -25.1266951 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -1.23925193 </td>
   <td style="text-align:right;"> 0.00546846 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -226.6181112 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.82844312 </td>
   <td style="text-align:right;"> 0.00520895 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -159.0422464 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.41080881 </td>
   <td style="text-align:right;"> 0.00389945 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 105.3503563 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

### Laminations-Grammar Interaction


#### Estimated Marginal Means (EMMs)

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Laminations × Grammar Type EMMs (Inverse Brier Score)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> laminations </th>
   <th style="text-align:left;"> grammartype </th>
   <th style="text-align:right;"> emmean </th>
   <th style="text-align:right;"> asymp.LCL </th>
   <th style="text-align:right;"> asymp.UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9583125 </td>
   <td style="text-align:right;"> 0.9573787 </td>
   <td style="text-align:right;"> 0.9592262 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9554245 </td>
   <td style="text-align:right;"> 0.9544172 </td>
   <td style="text-align:right;"> 0.9564101 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8932308 </td>
   <td style="text-align:right;"> 0.8919061 </td>
   <td style="text-align:right;"> 0.8945403 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8924141 </td>
   <td style="text-align:right;"> 0.8910448 </td>
   <td style="text-align:right;"> 0.8937673 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9031871 </td>
   <td style="text-align:right;"> 0.9022244 </td>
   <td style="text-align:right;"> 0.9041408 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8994475 </td>
   <td style="text-align:right;"> 0.8984281 </td>
   <td style="text-align:right;"> 0.9004571 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9076957 </td>
   <td style="text-align:right;"> 0.9065590 </td>
   <td style="text-align:right;"> 0.9088193 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9049691 </td>
   <td style="text-align:right;"> 0.9037688 </td>
   <td style="text-align:right;"> 0.9061553 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8430565 </td>
   <td style="text-align:right;"> 0.8419113 </td>
   <td style="text-align:right;"> 0.8441943 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8388715 </td>
   <td style="text-align:right;"> 0.8376727 </td>
   <td style="text-align:right;"> 0.8400624 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9294359 </td>
   <td style="text-align:right;"> 0.9290341 </td>
   <td style="text-align:right;"> 0.9298356 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9207282 </td>
   <td style="text-align:right;"> 0.9202747 </td>
   <td style="text-align:right;"> 0.9211792 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9157782 </td>
   <td style="text-align:right;"> 0.9153107 </td>
   <td style="text-align:right;"> 0.9162433 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9085091 </td>
   <td style="text-align:right;"> 0.9079780 </td>
   <td style="text-align:right;"> 0.9090372 </td>
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
   <td style="text-align:right;"> 0.06847997 </td>
   <td style="text-align:right;"> 0.01137152 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.022060 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.00806940 </td>
   <td style="text-align:right;"> 0.00713009 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.131739 </td>
   <td style="text-align:right;"> 0.25774426 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.03993866 </td>
   <td style="text-align:right;"> 0.00577950 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.910401 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.03059075 </td>
   <td style="text-align:right;"> 0.00687894 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.447017 </td>
   <td style="text-align:right;"> 0.00000871 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.02873280 </td>
   <td style="text-align:right;"> 0.00537820 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 5.342453 </td>
   <td style="text-align:right;"> 0.00000009 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.12100667 </td>
   <td style="text-align:right;"> 0.00381336 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 31.732298 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.08670978 </td>
   <td style="text-align:right;"> 0.00364043 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 23.818536 </td>
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
   <td style="text-align:right;"> 0.97517604 </td>
   <td style="text-align:right;"> 0.01328691 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 73.393740 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.87184425 </td>
   <td style="text-align:right;"> 0.01266561 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 68.835562 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.82170588 </td>
   <td style="text-align:right;"> 0.01323416 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 62.089749 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 1.38861521 </td>
   <td style="text-align:right;"> 0.01220774 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 113.748781 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.54146957 </td>
   <td style="text-align:right;"> 0.01189748 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 45.511285 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.72570472 </td>
   <td style="text-align:right;"> 0.01187216 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 61.126613 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.10333179 </td>
   <td style="text-align:right;"> 0.00845636 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.219415 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.15347017 </td>
   <td style="text-align:right;"> 0.00928646 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -16.526221 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.41343917 </td>
   <td style="text-align:right;"> 0.00775112 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 53.339283 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.43370648 </td>
   <td style="text-align:right;"> 0.00725327 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -59.794642 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.24947132 </td>
   <td style="text-align:right;"> 0.00721306 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -34.586066 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.05013837 </td>
   <td style="text-align:right;"> 0.00837294 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.988144 </td>
   <td style="text-align:right;"> 4.0e-08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.51677096 </td>
   <td style="text-align:right;"> 0.00663104 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 77.932092 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.33037469 </td>
   <td style="text-align:right;"> 0.00604179 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -54.681629 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.14613953 </td>
   <td style="text-align:right;"> 0.00599306 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -24.384774 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.56690933 </td>
   <td style="text-align:right;"> 0.00766233 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 73.986574 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.28023631 </td>
   <td style="text-align:right;"> 0.00715814 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -39.149304 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.09600116 </td>
   <td style="text-align:right;"> 0.00711650 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -13.489946 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.84714564 </td>
   <td style="text-align:right;"> 0.00498554 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -169.920563 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.66291049 </td>
   <td style="text-align:right;"> 0.00493996 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -134.193479 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.18423515 </td>
   <td style="text-align:right;"> 0.00411596 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 44.761200 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.91476547 </td>
   <td style="text-align:right;"> 0.01344297 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 68.047861 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.84330294 </td>
   <td style="text-align:right;"> 0.01278788 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 65.945503 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.78381666 </td>
   <td style="text-align:right;"> 0.01339044 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 58.535557 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 1.34886804 </td>
   <td style="text-align:right;"> 0.01232224 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 109.466141 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.59399626 </td>
   <td style="text-align:right;"> 0.01199146 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 49.534929 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.74393453 </td>
   <td style="text-align:right;"> 0.01198640 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 62.064906 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.07146253 </td>
   <td style="text-align:right;"> 0.00861152 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.298481 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.13094881 </td>
   <td style="text-align:right;"> 0.00948334 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -13.808303 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.43410257 </td>
   <td style="text-align:right;"> 0.00790238 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 54.933146 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.32076921 </td>
   <td style="text-align:right;"> 0.00737619 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -43.487086 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.17083094 </td>
   <td style="text-align:right;"> 0.00736840 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -23.184259 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.05948628 </td>
   <td style="text-align:right;"> 0.00852891 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.974666 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.50556510 </td>
   <td style="text-align:right;"> 0.00672787 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 75.144886 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.24930667 </td>
   <td style="text-align:right;"> 0.00610150 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -40.859891 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.09936841 </td>
   <td style="text-align:right;"> 0.00609287 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -16.308972 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.56505138 </td>
   <td style="text-align:right;"> 0.00781515 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 72.302084 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.18982040 </td>
   <td style="text-align:right;"> 0.00728240 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -26.065628 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.03988213 </td>
   <td style="text-align:right;"> 0.00727325 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.483400 </td>
   <td style="text-align:right;"> 8.7e-07 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.75487178 </td>
   <td style="text-align:right;"> 0.00502371 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -150.261806 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.60493351 </td>
   <td style="text-align:right;"> 0.00503192 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -120.219219 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.14993826 </td>
   <td style="text-align:right;"> 0.00415799 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 36.060268 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
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
   <td style="text-align:right;"> 0.9114024 </td>
   <td style="text-align:right;"> 0.9103660 </td>
   <td style="text-align:right;"> 0.9124273 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.9142646 </td>
   <td style="text-align:right;"> 0.9131961 </td>
   <td style="text-align:right;"> 0.9153206 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.8868660 </td>
   <td style="text-align:right;"> 0.8863492 </td>
   <td style="text-align:right;"> 0.8873806 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.8726294 </td>
   <td style="text-align:right;"> 0.8720686 </td>
   <td style="text-align:right;"> 0.8731880 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9343529 </td>
   <td style="text-align:right;"> 0.9340494 </td>
   <td style="text-align:right;"> 0.9346551 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9296078 </td>
   <td style="text-align:right;"> 0.9292883 </td>
   <td style="text-align:right;"> 0.9299259 </td>
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
   <td style="text-align:right;"> 0.2578709 </td>
   <td style="text-align:right;"> 0.00654364 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 39.40785 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.3120811 </td>
   <td style="text-align:right;"> 0.00656664 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -47.52525 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.5699519 </td>
   <td style="text-align:right;"> 0.00325158 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -175.28483 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.4187005 </td>
   <td style="text-align:right;"> 0.00686992 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 60.94692 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.2053923 </td>
   <td style="text-align:right;"> 0.00690387 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -29.75031 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.6240928 </td>
   <td style="text-align:right;"> 0.00319070 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -195.59731 </td>
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
   <td style="text-align:right;"> -0.03438310 </td>
   <td style="text-align:right;"> 0.00640301 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.369835 </td>
   <td style="text-align:right;"> 8e-08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.12644656 </td>
   <td style="text-align:right;"> 0.00315645 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 40.059690 </td>
   <td style="text-align:right;"> 0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.07230569 </td>
   <td style="text-align:right;"> 0.00321365 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 22.499574 </td>
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
   <th style="text-align:right;"> asymp.LCL </th>
   <th style="text-align:right;"> asymp.UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9819047 </td>
   <td style="text-align:right;"> 0.9813230 </td>
   <td style="text-align:right;"> 0.9824685 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9789386 </td>
   <td style="text-align:right;"> 0.9783189 </td>
   <td style="text-align:right;"> 0.9795408 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9754924 </td>
   <td style="text-align:right;"> 0.9748343 </td>
   <td style="text-align:right;"> 0.9761336 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9714906 </td>
   <td style="text-align:right;"> 0.9707923 </td>
   <td style="text-align:right;"> 0.9721725 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9668465 </td>
   <td style="text-align:right;"> 0.9661040 </td>
   <td style="text-align:right;"> 0.9675731 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9614610 </td>
   <td style="text-align:right;"> 0.9606658 </td>
   <td style="text-align:right;"> 0.9622406 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9552212 </td>
   <td style="text-align:right;"> 0.9543573 </td>
   <td style="text-align:right;"> 0.9560691 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9479987 </td>
   <td style="text-align:right;"> 0.9470396 </td>
   <td style="text-align:right;"> 0.9489409 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9396485 </td>
   <td style="text-align:right;"> 0.9385533 </td>
   <td style="text-align:right;"> 0.9407249 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9300078 </td>
   <td style="text-align:right;"> 0.9287190 </td>
   <td style="text-align:right;"> 0.9312741 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9188946 </td>
   <td style="text-align:right;"> 0.9173378 </td>
   <td style="text-align:right;"> 0.9204233 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9061077 </td>
   <td style="text-align:right;"> 0.9041913 </td>
   <td style="text-align:right;"> 0.9079878 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9339101 </td>
   <td style="text-align:right;"> 0.9327016 </td>
   <td style="text-align:right;"> 0.9350977 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9280551 </td>
   <td style="text-align:right;"> 0.9268593 </td>
   <td style="text-align:right;"> 0.9292322 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9217036 </td>
   <td style="text-align:right;"> 0.9205248 </td>
   <td style="text-align:right;"> 0.9228656 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9148175 </td>
   <td style="text-align:right;"> 0.9136576 </td>
   <td style="text-align:right;"> 0.9159625 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9073567 </td>
   <td style="text-align:right;"> 0.9062132 </td>
   <td style="text-align:right;"> 0.9084870 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8992793 </td>
   <td style="text-align:right;"> 0.8981429 </td>
   <td style="text-align:right;"> 0.9004037 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8905409 </td>
   <td style="text-align:right;"> 0.8893925 </td>
   <td style="text-align:right;"> 0.8916782 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8810958 </td>
   <td style="text-align:right;"> 0.8799041 </td>
   <td style="text-align:right;"> 0.8822766 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8708964 </td>
   <td style="text-align:right;"> 0.8696170 </td>
   <td style="text-align:right;"> 0.8721641 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8598936 </td>
   <td style="text-align:right;"> 0.8584715 </td>
   <td style="text-align:right;"> 0.8613027 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8480375 </td>
   <td style="text-align:right;"> 0.8464103 </td>
   <td style="text-align:right;"> 0.8496491 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8352776 </td>
   <td style="text-align:right;"> 0.8333799 </td>
   <td style="text-align:right;"> 0.8371559 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9452714 </td>
   <td style="text-align:right;"> 0.9444299 </td>
   <td style="text-align:right;"> 0.9461005 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9393027 </td>
   <td style="text-align:right;"> 0.9384569 </td>
   <td style="text-align:right;"> 0.9401372 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9327065 </td>
   <td style="text-align:right;"> 0.9318613 </td>
   <td style="text-align:right;"> 0.9335415 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9254223 </td>
   <td style="text-align:right;"> 0.9245817 </td>
   <td style="text-align:right;"> 0.9262539 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9173852 </td>
   <td style="text-align:right;"> 0.9165508 </td>
   <td style="text-align:right;"> 0.9182117 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9085256 </td>
   <td style="text-align:right;"> 0.9076945 </td>
   <td style="text-align:right;"> 0.9093496 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8987694 </td>
   <td style="text-align:right;"> 0.8979316 </td>
   <td style="text-align:right;"> 0.8996007 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8880383 </td>
   <td style="text-align:right;"> 0.8871731 </td>
   <td style="text-align:right;"> 0.8888972 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8762499 </td>
   <td style="text-align:right;"> 0.8753238 </td>
   <td style="text-align:right;"> 0.8771697 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8633186 </td>
   <td style="text-align:right;"> 0.8622850 </td>
   <td style="text-align:right;"> 0.8643452 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8491562 </td>
   <td style="text-align:right;"> 0.8479586 </td>
   <td style="text-align:right;"> 0.8503451 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8336727 </td>
   <td style="text-align:right;"> 0.8322494 </td>
   <td style="text-align:right;"> 0.8350850 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9337977 </td>
   <td style="text-align:right;"> 0.9326245 </td>
   <td style="text-align:right;"> 0.9349512 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9296521 </td>
   <td style="text-align:right;"> 0.9285148 </td>
   <td style="text-align:right;"> 0.9307720 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9252574 </td>
   <td style="text-align:right;"> 0.9241580 </td>
   <td style="text-align:right;"> 0.9263414 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9206001 </td>
   <td style="text-align:right;"> 0.9195382 </td>
   <td style="text-align:right;"> 0.9216485 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9156660 </td>
   <td style="text-align:right;"> 0.9146372 </td>
   <td style="text-align:right;"> 0.9166829 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9104404 </td>
   <td style="text-align:right;"> 0.9094349 </td>
   <td style="text-align:right;"> 0.9114354 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9049082 </td>
   <td style="text-align:right;"> 0.9039087 </td>
   <td style="text-align:right;"> 0.9058979 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8990536 </td>
   <td style="text-align:right;"> 0.8980343 </td>
   <td style="text-align:right;"> 0.9000633 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8928604 </td>
   <td style="text-align:right;"> 0.8917872 </td>
   <td style="text-align:right;"> 0.8939235 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8863117 </td>
   <td style="text-align:right;"> 0.8851443 </td>
   <td style="text-align:right;"> 0.8874679 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8793904 </td>
   <td style="text-align:right;"> 0.8780851 </td>
   <td style="text-align:right;"> 0.8806827 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8720790 </td>
   <td style="text-align:right;"> 0.8705913 </td>
   <td style="text-align:right;"> 0.8735508 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7289108 </td>
   <td style="text-align:right;"> 0.7259799 </td>
   <td style="text-align:right;"> 0.7318165 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7521993 </td>
   <td style="text-align:right;"> 0.7497861 </td>
   <td style="text-align:right;"> 0.7545932 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7738075 </td>
   <td style="text-align:right;"> 0.7718466 </td>
   <td style="text-align:right;"> 0.7757541 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7937973 </td>
   <td style="text-align:right;"> 0.7922218 </td>
   <td style="text-align:right;"> 0.7953624 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8122404 </td>
   <td style="text-align:right;"> 0.8109813 </td>
   <td style="text-align:right;"> 0.8134921 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8292155 </td>
   <td style="text-align:right;"> 0.8282004 </td>
   <td style="text-align:right;"> 0.8302253 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8448057 </td>
   <td style="text-align:right;"> 0.8439585 </td>
   <td style="text-align:right;"> 0.8456488 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8590959 </td>
   <td style="text-align:right;"> 0.8583413 </td>
   <td style="text-align:right;"> 0.8598469 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8721716 </td>
   <td style="text-align:right;"> 0.8714460 </td>
   <td style="text-align:right;"> 0.8728934 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8841170 </td>
   <td style="text-align:right;"> 0.8833783 </td>
   <td style="text-align:right;"> 0.8848512 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8950142 </td>
   <td style="text-align:right;"> 0.8942420 </td>
   <td style="text-align:right;"> 0.8957810 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9049424 </td>
   <td style="text-align:right;"> 0.9041314 </td>
   <td style="text-align:right;"> 0.9057469 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9329427 </td>
   <td style="text-align:right;"> 0.9323381 </td>
   <td style="text-align:right;"> 0.9335421 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9316537 </td>
   <td style="text-align:right;"> 0.9311022 </td>
   <td style="text-align:right;"> 0.9322009 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9303408 </td>
   <td style="text-align:right;"> 0.9298421 </td>
   <td style="text-align:right;"> 0.9308361 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9290037 </td>
   <td style="text-align:right;"> 0.9285565 </td>
   <td style="text-align:right;"> 0.9294482 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9276419 </td>
   <td style="text-align:right;"> 0.9272430 </td>
   <td style="text-align:right;"> 0.9280387 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9262551 </td>
   <td style="text-align:right;"> 0.9258987 </td>
   <td style="text-align:right;"> 0.9266098 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9248427 </td>
   <td style="text-align:right;"> 0.9245188 </td>
   <td style="text-align:right;"> 0.9251653 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9234045 </td>
   <td style="text-align:right;"> 0.9230978 </td>
   <td style="text-align:right;"> 0.9237099 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9219399 </td>
   <td style="text-align:right;"> 0.9216306 </td>
   <td style="text-align:right;"> 0.9222480 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9204485 </td>
   <td style="text-align:right;"> 0.9201149 </td>
   <td style="text-align:right;"> 0.9207807 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9189299 </td>
   <td style="text-align:right;"> 0.9185526 </td>
   <td style="text-align:right;"> 0.9193055 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9173836 </td>
   <td style="text-align:right;"> 0.9169470 </td>
   <td style="text-align:right;"> 0.9178180 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8900899 </td>
   <td style="text-align:right;"> 0.8892483 </td>
   <td style="text-align:right;"> 0.8909254 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8942843 </td>
   <td style="text-align:right;"> 0.8935496 </td>
   <td style="text-align:right;"> 0.8950143 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8983280 </td>
   <td style="text-align:right;"> 0.8976889 </td>
   <td style="text-align:right;"> 0.8989634 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9022256 </td>
   <td style="text-align:right;"> 0.9016701 </td>
   <td style="text-align:right;"> 0.9027782 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9059818 </td>
   <td style="text-align:right;"> 0.9054967 </td>
   <td style="text-align:right;"> 0.9064645 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9096009 </td>
   <td style="text-align:right;"> 0.9091716 </td>
   <td style="text-align:right;"> 0.9100283 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9130875 </td>
   <td style="text-align:right;"> 0.9126978 </td>
   <td style="text-align:right;"> 0.9134756 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9164459 </td>
   <td style="text-align:right;"> 0.9160789 </td>
   <td style="text-align:right;"> 0.9168114 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9196803 </td>
   <td style="text-align:right;"> 0.9193199 </td>
   <td style="text-align:right;"> 0.9200392 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9227949 </td>
   <td style="text-align:right;"> 0.9224275 </td>
   <td style="text-align:right;"> 0.9231606 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9257936 </td>
   <td style="text-align:right;"> 0.9254091 </td>
   <td style="text-align:right;"> 0.9261762 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9286804 </td>
   <td style="text-align:right;"> 0.9282722 </td>
   <td style="text-align:right;"> 0.9290863 </td>
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
   <td style="text-align:right;"> 0.9309762 </td>
   <td style="text-align:right;"> 0.9306041 </td>
   <td style="text-align:right;"> 0.9313465 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.9233896 </td>
   <td style="text-align:right;"> 0.9230477 </td>
   <td style="text-align:right;"> 0.9237299 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.9150077 </td>
   <td style="text-align:right;"> 0.9146731 </td>
   <td style="text-align:right;"> 0.9153411 </td>
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
   <td style="text-align:right;"> 0.8809447 </td>
   <td style="text-align:right;"> 0.8803883 </td>
   <td style="text-align:right;"> 0.8814987 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:right;"> 0.8853751 </td>
   <td style="text-align:right;"> 0.8848612 </td>
   <td style="text-align:right;"> 0.8858867 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 96 </td>
   <td style="text-align:right;"> 0.8896511 </td>
   <td style="text-align:right;"> 0.8891752 </td>
   <td style="text-align:right;"> 0.8901250 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 128 </td>
   <td style="text-align:right;"> 0.8937773 </td>
   <td style="text-align:right;"> 0.8933347 </td>
   <td style="text-align:right;"> 0.8942181 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 0.8977582 </td>
   <td style="text-align:right;"> 0.8973445 </td>
   <td style="text-align:right;"> 0.8981704 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 192 </td>
   <td style="text-align:right;"> 0.9015983 </td>
   <td style="text-align:right;"> 0.9012090 </td>
   <td style="text-align:right;"> 0.9019862 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 224 </td>
   <td style="text-align:right;"> 0.9053019 </td>
   <td style="text-align:right;"> 0.9049326 </td>
   <td style="text-align:right;"> 0.9056697 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 256 </td>
   <td style="text-align:right;"> 0.9088732 </td>
   <td style="text-align:right;"> 0.9085200 </td>
   <td style="text-align:right;"> 0.9092251 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 288 </td>
   <td style="text-align:right;"> 0.9123165 </td>
   <td style="text-align:right;"> 0.9119756 </td>
   <td style="text-align:right;"> 0.9126561 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 320 </td>
   <td style="text-align:right;"> 0.9156357 </td>
   <td style="text-align:right;"> 0.9153038 </td>
   <td style="text-align:right;"> 0.9159665 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 352 </td>
   <td style="text-align:right;"> 0.9188350 </td>
   <td style="text-align:right;"> 0.9185090 </td>
   <td style="text-align:right;"> 0.9191598 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 384 </td>
   <td style="text-align:right;"> 0.9219182 </td>
   <td style="text-align:right;"> 0.9215956 </td>
   <td style="text-align:right;"> 0.9222396 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 416 </td>
   <td style="text-align:right;"> 0.9248891 </td>
   <td style="text-align:right;"> 0.9245679 </td>
   <td style="text-align:right;"> 0.9252091 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 448 </td>
   <td style="text-align:right;"> 0.9277515 </td>
   <td style="text-align:right;"> 0.9274300 </td>
   <td style="text-align:right;"> 0.9280716 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 480 </td>
   <td style="text-align:right;"> 0.9305089 </td>
   <td style="text-align:right;"> 0.9301859 </td>
   <td style="text-align:right;"> 0.9308305 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 512 </td>
   <td style="text-align:right;"> 0.9331649 </td>
   <td style="text-align:right;"> 0.9328396 </td>
   <td style="text-align:right;"> 0.9334888 </td>
  </tr>
</tbody>
</table>


## Proportion Correct Model

```
Call:
betareg::betareg(formula = .x, data = df, link = "loglog")

Quantile residuals:
     Min       1Q   Median       3Q      Max 
-11.6095  -0.6913   0.0104   0.6308   7.7749 

Coefficients (mean model with loglog link):
                                       Estimate Std. Error  z value Pr(>|z|)
(Intercept)                           4.335e+00  3.833e-02  113.110  < 2e-16
recurrenceRNN                        -3.710e-01  3.156e-02  -11.757  < 2e-16
recurrenceGRU                         6.069e-01  3.210e-02   18.908  < 2e-16
laminationsLaminated                 -7.533e-03  1.528e-02   -0.493 0.621913
inputsize                            -1.437e-01  2.050e-03  -70.121  < 2e-16
grammartypeLT                        -1.194e+00  4.316e-02  -27.672  < 2e-16
grammartypeLTT                       -8.794e-01  4.149e-02  -21.194  < 2e-16
grammartypeLTTO                      -1.173e+00  4.301e-02  -27.268  < 2e-16
grammartypeMSO                       -2.923e+00  4.055e-02  -72.095  < 2e-16
grammartypeCS                        -1.446e+00  3.928e-02  -36.814  < 2e-16
grammartypeCF                        -1.861e+00  3.946e-02  -47.159  < 2e-16
neurons                               1.368e-03  6.926e-06  197.522  < 2e-16
layers                               -1.531e-01  9.012e-04 -169.918  < 2e-16
recurrenceRNN:grammartypeLT          -1.837e-02  3.564e-02   -0.515 0.606219
recurrenceGRU:grammartypeLT          -2.549e-01  3.610e-02   -7.060 1.67e-12
recurrenceRNN:grammartypeLTT         -7.872e-02  3.387e-02   -2.324 0.020112
recurrenceGRU:grammartypeLTT         -3.618e-01  3.433e-02  -10.538  < 2e-16
recurrenceRNN:grammartypeLTTO        -3.117e-02  3.566e-02   -0.874 0.382085
recurrenceGRU:grammartypeLTTO        -4.771e-01  3.606e-02  -13.232  < 2e-16
recurrenceRNN:grammartypeMSO          2.495e-01  3.314e-02    7.528 5.16e-14
recurrenceGRU:grammartypeMSO         -5.231e-01  3.381e-02  -15.471  < 2e-16
recurrenceRNN:grammartypeCS           2.928e-01  3.208e-02    9.126  < 2e-16
recurrenceGRU:grammartypeCS           2.478e-01  3.277e-02    7.564 3.92e-14
recurrenceRNN:grammartypeCF           6.929e-03  3.265e-02    0.212 0.831947
recurrenceGRU:grammartypeCF          -2.899e-01  3.319e-02   -8.733  < 2e-16
grammartypeLT:laminationsLaminated    6.233e-02  1.546e-02    4.031 5.54e-05
grammartypeLTT:laminationsLaminated   3.368e-02  1.486e-02    2.267 0.023404
grammartypeLTTO:laminationsLaminated  4.102e-02  1.529e-02    2.683 0.007302
grammartypeMSO:laminationsLaminated   2.608e-02  1.481e-02    1.760 0.078336
grammartypeCS:laminationsLaminated   -5.440e-02  1.425e-02   -3.817 0.000135
grammartypeCF:laminationsLaminated   -1.605e-02  1.404e-02   -1.143 0.252989
recurrenceRNN:laminationsLaminated   -1.349e-01  7.568e-03  -17.827  < 2e-16
recurrenceGRU:laminationsLaminated   -5.770e-02  7.878e-03   -7.325 2.40e-13
grammartypeLT:inputsize               4.574e-02  2.331e-03   19.627  < 2e-16
grammartypeLTT:inputsize              2.425e-02  2.269e-03   10.685  < 2e-16
grammartypeLTTO:inputsize             7.362e-02  2.303e-03   31.968  < 2e-16
grammartypeMSO:inputsize              2.479e-01  2.244e-03  110.458  < 2e-16
grammartypeCS:inputsize               1.151e-01  2.154e-03   53.438  < 2e-16
grammartypeCF:inputsize               1.887e-01  2.116e-03   89.184  < 2e-16
                                        
(Intercept)                          ***
recurrenceRNN                        ***
recurrenceGRU                        ***
laminationsLaminated                    
inputsize                            ***
grammartypeLT                        ***
grammartypeLTT                       ***
grammartypeLTTO                      ***
grammartypeMSO                       ***
grammartypeCS                        ***
grammartypeCF                        ***
neurons                              ***
layers                               ***
recurrenceRNN:grammartypeLT             
recurrenceGRU:grammartypeLT          ***
recurrenceRNN:grammartypeLTT         *  
recurrenceGRU:grammartypeLTT         ***
recurrenceRNN:grammartypeLTTO           
recurrenceGRU:grammartypeLTTO        ***
recurrenceRNN:grammartypeMSO         ***
recurrenceGRU:grammartypeMSO         ***
recurrenceRNN:grammartypeCS          ***
recurrenceGRU:grammartypeCS          ***
recurrenceRNN:grammartypeCF             
recurrenceGRU:grammartypeCF          ***
grammartypeLT:laminationsLaminated   ***
grammartypeLTT:laminationsLaminated  *  
grammartypeLTTO:laminationsLaminated ** 
grammartypeMSO:laminationsLaminated  .  
grammartypeCS:laminationsLaminated   ***
grammartypeCF:laminationsLaminated      
recurrenceRNN:laminationsLaminated   ***
recurrenceGRU:laminationsLaminated   ***
grammartypeLT:inputsize              ***
grammartypeLTT:inputsize             ***
grammartypeLTTO:inputsize            ***
grammartypeMSO:inputsize             ***
grammartypeCS:inputsize              ***
grammartypeCF:inputsize              ***

Phi coefficients (precision model with log link):
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           2.186e+00  4.120e-02  53.060  < 2e-16 ***
recurrenceRNN                        -3.515e-01  3.392e-02 -10.362  < 2e-16 ***
recurrenceGRU                         7.006e-01  3.461e-02  20.243  < 2e-16 ***
laminationsLaminated                 -3.719e-03  1.962e-02  -0.190 0.849653    
inputsize                            -1.037e-01  2.184e-03 -47.467  < 2e-16 ***
grammartypeLT                         7.672e-01  5.288e-02  14.509  < 2e-16 ***
grammartypeLTT                        3.208e-01  5.269e-02   6.089 1.13e-09 ***
grammartypeLTTO                       6.843e-01  5.316e-02  12.872  < 2e-16 ***
grammartypeMSO                        6.232e-01  4.713e-02  13.222  < 2e-16 ***
grammartypeCS                         9.898e-01  4.379e-02  22.606  < 2e-16 ***
grammartypeCF                         1.022e+00  4.383e-02  23.313  < 2e-16 ***
neurons                               1.020e-03  1.017e-05 100.264  < 2e-16 ***
layers                               -1.194e-01  1.330e-03 -89.733  < 2e-16 ***
recurrenceRNN:grammartypeLT          -1.881e-01  4.427e-02  -4.250 2.14e-05 ***
recurrenceGRU:grammartypeLT          -3.907e-01  4.490e-02  -8.703  < 2e-16 ***
recurrenceRNN:grammartypeLTT          7.539e-02  4.412e-02   1.709 0.087495 .  
recurrenceGRU:grammartypeLTT         -1.686e-01  4.469e-02  -3.772 0.000162 ***
recurrenceRNN:grammartypeLTTO        -1.020e-01  4.467e-02  -2.283 0.022415 *  
recurrenceGRU:grammartypeLTTO        -3.488e-01  4.522e-02  -7.713 1.23e-14 ***
recurrenceRNN:grammartypeMSO         -1.078e+00  3.940e-02 -27.353  < 2e-16 ***
recurrenceGRU:grammartypeMSO         -2.507e+00  4.006e-02 -62.576  < 2e-16 ***
recurrenceRNN:grammartypeCS          -5.707e-01  3.612e-02 -15.800  < 2e-16 ***
recurrenceGRU:grammartypeCS          -1.603e+00  3.688e-02 -43.467  < 2e-16 ***
recurrenceRNN:grammartypeCF          -2.582e-01  3.638e-02  -7.098 1.27e-12 ***
recurrenceGRU:grammartypeCF          -9.417e-01  3.704e-02 -25.422  < 2e-16 ***
grammartypeLT:laminationsLaminated    4.622e-02  1.856e-02   2.490 0.012778 *  
grammartypeLTT:laminationsLaminated   5.749e-02  1.835e-02   3.133 0.001731 ** 
grammartypeLTTO:laminationsLaminated  2.580e-02  1.857e-02   1.389 0.164702    
grammartypeMSO:laminationsLaminated   9.598e-02  1.659e-02   5.786 7.22e-09 ***
grammartypeCS:laminationsLaminated    8.744e-02  1.566e-02   5.584 2.35e-08 ***
grammartypeCF:laminationsLaminated    1.422e-02  1.554e-02   0.915 0.360147    
recurrenceRNN:laminationsLaminated   -7.642e-02  1.424e-02  -5.366 8.05e-08 ***
recurrenceGRU:laminationsLaminated   -8.675e-02  1.439e-02  -6.026 1.68e-09 ***
grammartypeLT:inputsize               5.337e-02  2.784e-03  19.170  < 2e-16 ***
grammartypeLTT:inputsize              1.449e-01  2.772e-03  52.265  < 2e-16 ***
grammartypeLTTO:inputsize             8.834e-02  2.783e-03  31.738  < 2e-16 ***
grammartypeMSO:inputsize              1.656e-01  2.496e-03  66.325  < 2e-16 ***
grammartypeCS:inputsize               1.303e-01  2.358e-03  55.255  < 2e-16 ***
grammartypeCF:inputsize               9.538e-02  2.336e-03  40.835  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

Type of estimator: ML (maximum likelihood)
Log-likelihood: 1.992e+06 on 78 Df
Pseudo R-squared: 0.1911
Number of iterations: 102 (BFGS) + 11 (Fisher scoring) 
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
   <td style="text-align:right;"> 0.9600485 </td>
   <td style="text-align:right;"> 0.9576509 </td>
   <td style="text-align:right;"> 0.9623131 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9387455 </td>
   <td style="text-align:right;"> 0.9376305 </td>
   <td style="text-align:right;"> 0.9398412 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9773877 </td>
   <td style="text-align:right;"> 0.9769201 </td>
   <td style="text-align:right;"> 0.9778459 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9086111 </td>
   <td style="text-align:right;"> 0.9058105 </td>
   <td style="text-align:right;"> 0.9113325 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8595557 </td>
   <td style="text-align:right;"> 0.8581686 </td>
   <td style="text-align:right;"> 0.8609304 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9329819 </td>
   <td style="text-align:right;"> 0.9322980 </td>
   <td style="text-align:right;"> 0.9336593 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9212577 </td>
   <td style="text-align:right;"> 0.9193877 </td>
   <td style="text-align:right;"> 0.9230862 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8714747 </td>
   <td style="text-align:right;"> 0.8703711 </td>
   <td style="text-align:right;"> 0.8725697 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9360702 </td>
   <td style="text-align:right;"> 0.9355148 </td>
   <td style="text-align:right;"> 0.9366210 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9244686 </td>
   <td style="text-align:right;"> 0.9221219 </td>
   <td style="text-align:right;"> 0.9267475 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8819539 </td>
   <td style="text-align:right;"> 0.8807866 </td>
   <td style="text-align:right;"> 0.8831105 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9314663 </td>
   <td style="text-align:right;"> 0.9308327 </td>
   <td style="text-align:right;"> 0.9320943 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8688542 </td>
   <td style="text-align:right;"> 0.8665434 </td>
   <td style="text-align:right;"> 0.8711281 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8438128 </td>
   <td style="text-align:right;"> 0.8426746 </td>
   <td style="text-align:right;"> 0.8449435 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8754148 </td>
   <td style="text-align:right;"> 0.8742273 </td>
   <td style="text-align:right;"> 0.8765918 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9214224 </td>
   <td style="text-align:right;"> 0.9204819 </td>
   <td style="text-align:right;"> 0.9223521 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9096696 </td>
   <td style="text-align:right;"> 0.9092124 </td>
   <td style="text-align:right;"> 0.9101245 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9648033 </td>
   <td style="text-align:right;"> 0.9645121 </td>
   <td style="text-align:right;"> 0.9650922 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9287085 </td>
   <td style="text-align:right;"> 0.9275381 </td>
   <td style="text-align:right;"> 0.9298607 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8923701 </td>
   <td style="text-align:right;"> 0.8918912 </td>
   <td style="text-align:right;"> 0.8928470 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9460673 </td>
   <td style="text-align:right;"> 0.9457735 </td>
   <td style="text-align:right;"> 0.9463595 </td>
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
   <td style="text-align:right;"> 0.43849465 </td>
   <td style="text-align:right;"> 0.03136440 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 13.980648 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.57807213 </td>
   <td style="text-align:right;"> 0.03189220 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -18.125813 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -1.01656679 </td>
   <td style="text-align:right;"> 0.01412590 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -71.964726 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.45686610 </td>
   <td style="text-align:right;"> 0.01693497 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 26.977680 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.32321415 </td>
   <td style="text-align:right;"> 0.01692196 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -19.100280 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.78008025 </td>
   <td style="text-align:right;"> 0.00760430 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -102.584089 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.51721362 </td>
   <td style="text-align:right;"> 0.01279208 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 40.432318 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.21627217 </td>
   <td style="text-align:right;"> 0.01272243 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -16.999277 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.73348579 </td>
   <td style="text-align:right;"> 0.00621547 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -118.009713 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.46966637 </td>
   <td style="text-align:right;"> 0.01698424 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 27.653066 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.10094608 </td>
   <td style="text-align:right;"> 0.01683261 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.997055 </td>
   <td style="text-align:right;"> 1.00e-08 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.57061245 </td>
   <td style="text-align:right;"> 0.00721063 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -79.134876 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.18899018 </td>
   <td style="text-align:right;"> 0.01072552 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 17.620609 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.05499508 </td>
   <td style="text-align:right;"> 0.01123270 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -4.895981 </td>
   <td style="text-align:right;"> 2.92e-06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.24398526 </td>
   <td style="text-align:right;"> 0.00646513 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -37.738645 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.14571150 </td>
   <td style="text-align:right;"> 0.00676000 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 21.554960 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.82591280 </td>
   <td style="text-align:right;"> 0.00752822 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -109.708897 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.97162431 </td>
   <td style="text-align:right;"> 0.00504447 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -192.611608 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.43156596 </td>
   <td style="text-align:right;"> 0.00909076 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 47.473051 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.28819976 </td>
   <td style="text-align:right;"> 0.00922146 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -31.253156 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.71976572 </td>
   <td style="text-align:right;"> 0.00366956 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -196.144904 </td>
   <td style="text-align:right;"> 0.00e+00 </td>
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
   <td style="text-align:right;"> 0.85467869 </td>
   <td style="text-align:right;"> 0.03440405 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 24.8423874 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.69892594 </td>
   <td style="text-align:right;"> 0.03283229 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 21.2877620 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.65557724 </td>
   <td style="text-align:right;"> 0.03443951 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 19.0356135 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.23779434 </td>
   <td style="text-align:right;"> 0.03184012 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 38.8753077 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.69674471 </td>
   <td style="text-align:right;"> 0.03101950 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 22.4615063 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.59554796 </td>
   <td style="text-align:right;"> 0.03156672 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 18.8663254 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.15575275 </td>
   <td style="text-align:right;"> 0.02042661 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.6249930 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.19910145 </td>
   <td style="text-align:right;"> 0.02292072 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.6865281 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.38311565 </td>
   <td style="text-align:right;"> 0.01879078 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 20.3884932 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.15793398 </td>
   <td style="text-align:right;"> 0.01736438 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.0952849 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.25913073 </td>
   <td style="text-align:right;"> 0.01832337 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -14.1420862 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.04334870 </td>
   <td style="text-align:right;"> 0.02048628 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.1159869 </td>
   <td style="text-align:right;"> 0.34301916 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.53886840 </td>
   <td style="text-align:right;"> 0.01572897 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 34.2596208 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.00218123 </td>
   <td style="text-align:right;"> 0.01399334 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.1558761 </td>
   <td style="text-align:right;"> 0.99999879 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.10337798 </td>
   <td style="text-align:right;"> 0.01516787 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.8155919 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.58221710 </td>
   <td style="text-align:right;"> 0.01885564 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 30.8776057 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.04116747 </td>
   <td style="text-align:right;"> 0.01743456 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 2.3612570 </td>
   <td style="text-align:right;"> 0.21523914 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.06002928 </td>
   <td style="text-align:right;"> 0.01838988 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -3.2642569 </td>
   <td style="text-align:right;"> 0.01890250 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.54104963 </td>
   <td style="text-align:right;"> 0.01147207 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -47.1623181 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.64224638 </td>
   <td style="text-align:right;"> 0.01288008 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -49.8635455 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.10119675 </td>
   <td style="text-align:right;"> 0.01069146 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.4651978 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.87305014 </td>
   <td style="text-align:right;"> 0.01093684 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 79.8265297 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.77764491 </td>
   <td style="text-align:right;"> 0.01059113 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 73.4241569 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.68674896 </td>
   <td style="text-align:right;"> 0.01090496 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 62.9758214 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.98828986 </td>
   <td style="text-align:right;"> 0.01032411 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 95.7263875 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.40396156 </td>
   <td style="text-align:right;"> 0.00987828 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 40.8939287 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.58861927 </td>
   <td style="text-align:right;"> 0.00980014 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 60.0623140 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.09540523 </td>
   <td style="text-align:right;"> 0.00715564 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -13.3328780 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.18630118 </td>
   <td style="text-align:right;"> 0.00761252 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -24.4730016 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.11523973 </td>
   <td style="text-align:right;"> 0.00675462 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 17.0608713 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.46908857 </td>
   <td style="text-align:right;"> 0.00605093 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -77.5233727 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.28443087 </td>
   <td style="text-align:right;"> 0.00592235 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -48.0266832 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.09089594 </td>
   <td style="text-align:right;"> 0.00710666 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.7902457 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.21064496 </td>
   <td style="text-align:right;"> 0.00617892 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 34.0908858 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.37368334 </td>
   <td style="text-align:right;"> 0.00540055 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -69.1935803 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.18902564 </td>
   <td style="text-align:right;"> 0.00525620 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -35.9624335 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.30154090 </td>
   <td style="text-align:right;"> 0.00670277 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 44.9875000 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.28278740 </td>
   <td style="text-align:right;"> 0.00599294 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -47.1867667 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.09812969 </td>
   <td style="text-align:right;"> 0.00586309 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -16.7368620 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.58432830 </td>
   <td style="text-align:right;"> 0.00485659 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -120.3164736 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.39967059 </td>
   <td style="text-align:right;"> 0.00469579 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -85.1126196 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.18465771 </td>
   <td style="text-align:right;"> 0.00361076 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 51.1408905 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.10953668 </td>
   <td style="text-align:right;"> 0.01184839 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 93.6444797 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.06072590 </td>
   <td style="text-align:right;"> 0.01150740 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 92.1777456 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.13270330 </td>
   <td style="text-align:right;"> 0.01163112 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 97.3855626 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.76087140 </td>
   <td style="text-align:right;"> 0.01176432 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 149.6790042 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.44890404 </td>
   <td style="text-align:right;"> 0.01139797 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 39.3845718 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.88542034 </td>
   <td style="text-align:right;"> 0.01094145 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 80.9235097 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.04881077 </td>
   <td style="text-align:right;"> 0.00704297 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -6.9304244 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.02316663 </td>
   <td style="text-align:right;"> 0.00724333 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.1983384 </td>
   <td style="text-align:right;"> 0.02339441 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.65133472 </td>
   <td style="text-align:right;"> 0.00745575 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 87.3600151 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.66063263 </td>
   <td style="text-align:right;"> 0.00686302 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -96.2597861 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.22411634 </td>
   <td style="text-align:right;"> 0.00607447 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -36.8947728 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.07197740 </td>
   <td style="text-align:right;"> 0.00667096 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 10.7896655 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.70014550 </td>
   <td style="text-align:right;"> 0.00690094 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 101.4565031 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.61182186 </td>
   <td style="text-align:right;"> 0.00625559 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -97.8040405 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.17530556 </td>
   <td style="text-align:right;"> 0.00537904 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -32.5904743 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.62816809 </td>
   <td style="text-align:right;"> 0.00710542 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 88.4069068 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.68379926 </td>
   <td style="text-align:right;"> 0.00648066 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -105.5137804 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.24728296 </td>
   <td style="text-align:right;"> 0.00563893 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -43.8528322 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -1.31196735 </td>
   <td style="text-align:right;"> 0.00671621 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -195.3434186 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.87545106 </td>
   <td style="text-align:right;"> 0.00590906 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -148.1541403 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.43651629 </td>
   <td style="text-align:right;"> 0.00514067 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 84.9142453 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
</tbody>
</table>

### Laminations-Grammar Interaction


#### Estimated Marginal Means (EMMs)

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Laminations × Grammar Type EMMs (Proportion Correct)</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> laminations </th>
   <th style="text-align:left;"> grammartype </th>
   <th style="text-align:right;"> emmean </th>
   <th style="text-align:right;"> asymp.LCL </th>
   <th style="text-align:right;"> asymp.UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9631494 </td>
   <td style="text-align:right;"> 0.9621986 </td>
   <td style="text-align:right;"> 0.9640767 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9604635 </td>
   <td style="text-align:right;"> 0.9594333 </td>
   <td style="text-align:right;"> 0.9614682 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9050780 </td>
   <td style="text-align:right;"> 0.9038207 </td>
   <td style="text-align:right;"> 0.9063197 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9042253 </td>
   <td style="text-align:right;"> 0.9029269 </td>
   <td style="text-align:right;"> 0.9055074 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9148818 </td>
   <td style="text-align:right;"> 0.9139306 </td>
   <td style="text-align:right;"> 0.9158231 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9117298 </td>
   <td style="text-align:right;"> 0.9107310 </td>
   <td style="text-align:right;"> 0.9127180 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9162617 </td>
   <td style="text-align:right;"> 0.9151626 </td>
   <td style="text-align:right;"> 0.9173472 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9137651 </td>
   <td style="text-align:right;"> 0.9126092 </td>
   <td style="text-align:right;"> 0.9149064 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8661621 </td>
   <td style="text-align:right;"> 0.8649970 </td>
   <td style="text-align:right;"> 0.8673180 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8603672 </td>
   <td style="text-align:right;"> 0.8591519 </td>
   <td style="text-align:right;"> 0.8615729 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9405904 </td>
   <td style="text-align:right;"> 0.9401838 </td>
   <td style="text-align:right;"> 0.9409942 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9328773 </td>
   <td style="text-align:right;"> 0.9324297 </td>
   <td style="text-align:right;"> 0.9333221 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9284406 </td>
   <td style="text-align:right;"> 0.9279472 </td>
   <td style="text-align:right;"> 0.9289307 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9221366 </td>
   <td style="text-align:right;"> 0.9215896 </td>
   <td style="text-align:right;"> 0.9226798 </td>
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
   <td style="text-align:right;"> 0.07173798 </td>
   <td style="text-align:right;"> 0.01374515 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 5.219148 </td>
   <td style="text-align:right;"> 0.00000018 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.00940597 </td>
   <td style="text-align:right;"> 0.00764292 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.230678 </td>
   <td style="text-align:right;"> 0.21844339 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.03806108 </td>
   <td style="text-align:right;"> 0.00630613 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.035571 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.03072268 </td>
   <td style="text-align:right;"> 0.00729891 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.209213 </td>
   <td style="text-align:right;"> 0.00002563 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.04566143 </td>
   <td style="text-align:right;"> 0.00607119 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.520999 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.12613742 </td>
   <td style="text-align:right;"> 0.00443829 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 28.420245 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.08779042 </td>
   <td style="text-align:right;"> 0.00412036 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 21.306481 </td>
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
   <td style="text-align:right;"> 0.97692117 </td>
   <td style="text-align:right;"> 0.01495736 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 65.313731 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.86260403 </td>
   <td style="text-align:right;"> 0.01445934 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 59.657235 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.84551748 </td>
   <td style="text-align:right;"> 0.01490579 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 56.724096 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 1.34202348 </td>
   <td style="text-align:right;"> 0.01402975 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 95.655552 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.48933706 </td>
   <td style="text-align:right;"> 0.01368385 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 35.760190 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.68183630 </td>
   <td style="text-align:right;"> 0.01367348 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 49.865611 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.11431714 </td>
   <td style="text-align:right;"> 0.00913693 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.511550 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.13140369 </td>
   <td style="text-align:right;"> 0.00982757 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -13.370928 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.36510230 </td>
   <td style="text-align:right;"> 0.00844430 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 43.236560 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.48758412 </td>
   <td style="text-align:right;"> 0.00785846 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -62.045798 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.29508487 </td>
   <td style="text-align:right;"> 0.00783754 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -37.650181 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.01708655 </td>
   <td style="text-align:right;"> 0.00905076 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.887857 </td>
   <td style="text-align:right;"> 0.4883768 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.47941944 </td>
   <td style="text-align:right;"> 0.00752669 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 63.695936 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.37326698 </td>
   <td style="text-align:right;"> 0.00686334 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -54.385649 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.18076773 </td>
   <td style="text-align:right;"> 0.00683934 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -26.430596 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.49650599 </td>
   <td style="text-align:right;"> 0.00835473 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 59.428128 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.35618043 </td>
   <td style="text-align:right;"> 0.00776463 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -45.872165 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.16368118 </td>
   <td style="text-align:right;"> 0.00773904 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -21.150055 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.85268642 </td>
   <td style="text-align:right;"> 0.00587891 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -145.041484 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.66018717 </td>
   <td style="text-align:right;"> 0.00587530 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -112.366587 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.19249925 </td>
   <td style="text-align:right;"> 0.00499159 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 38.564747 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.91458917 </td>
   <td style="text-align:right;"> 0.01513894 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 60.413007 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.82892713 </td>
   <td style="text-align:right;"> 0.01460228 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 56.766971 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.80450219 </td>
   <td style="text-align:right;"> 0.01508070 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 53.346493 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 1.31594693 </td>
   <td style="text-align:right;"> 0.01415249 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 92.983417 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.54373649 </td>
   <td style="text-align:right;"> 0.01378916 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 39.432172 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.69788874 </td>
   <td style="text-align:right;"> 0.01380854 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 50.540355 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.08566203 </td>
   <td style="text-align:right;"> 0.00927328 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.237516 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.11008698 </td>
   <td style="text-align:right;"> 0.01000872 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -10.999103 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.40135776 </td>
   <td style="text-align:right;"> 0.00855220 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 46.930325 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.37085267 </td>
   <td style="text-align:right;"> 0.00793920 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -46.711610 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.21670042 </td>
   <td style="text-align:right;"> 0.00796835 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -27.195147 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.02442495 </td>
   <td style="text-align:right;"> 0.00917615 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.661786 </td>
   <td style="text-align:right;"> 0.1081133 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.48701979 </td>
   <td style="text-align:right;"> 0.00755976 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 64.422615 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.28519064 </td>
   <td style="text-align:right;"> 0.00685799 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -41.585137 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.13103839 </td>
   <td style="text-align:right;"> 0.00689448 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -19.006268 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.51144474 </td>
   <td style="text-align:right;"> 0.00845087 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 60.519787 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.26076569 </td>
   <td style="text-align:right;"> 0.00783235 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -33.293416 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.10661344 </td>
   <td style="text-align:right;"> 0.00785745 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -13.568460 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.77221043 </td>
   <td style="text-align:right;"> 0.00580891 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -132.935472 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.61805818 </td>
   <td style="text-align:right;"> 0.00588064 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -105.100526 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.15415225 </td>
   <td style="text-align:right;"> 0.00494176 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 31.193806 </td>
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
   <td style="text-align:right;"> 0.9226835 </td>
   <td style="text-align:right;"> 0.9216658 </td>
   <td style="text-align:right;"> 0.9236886 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.9231058 </td>
   <td style="text-align:right;"> 0.9220469 </td>
   <td style="text-align:right;"> 0.9241510 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.8960021 </td>
   <td style="text-align:right;"> 0.8954782 </td>
   <td style="text-align:right;"> 0.8965235 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.8825334 </td>
   <td style="text-align:right;"> 0.8819674 </td>
   <td style="text-align:right;"> 0.8830969 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9459306 </td>
   <td style="text-align:right;"> 0.9456296 </td>
   <td style="text-align:right;"> 0.9462300 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9431282 </td>
   <td style="text-align:right;"> 0.9428126 </td>
   <td style="text-align:right;"> 0.9434421 </td>
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
   <td style="text-align:right;"> 0.3109027 </td>
   <td style="text-align:right;"> 0.00726206 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 42.81188 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.3699397 </td>
   <td style="text-align:right;"> 0.00740055 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -49.98814 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.6808423 </td>
   <td style="text-align:right;"> 0.00372038 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -183.00359 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.4458140 </td>
   <td style="text-align:right;"> 0.00750684 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 59.38767 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.3122353 </td>
   <td style="text-align:right;"> 0.00766716 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -40.72369 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.7580493 </td>
   <td style="text-align:right;"> 0.00365790 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -207.23626 </td>
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
   <td style="text-align:right;"> -0.00570283 </td>
   <td style="text-align:right;"> 0.00735454 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.7754156 </td>
   <td style="text-align:right;"> 0.4380941 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.12920853 </td>
   <td style="text-align:right;"> 0.00346630 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 37.2756223 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.05200158 </td>
   <td style="text-align:right;"> 0.00379629 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 13.6979932 </td>
   <td style="text-align:right;"> 0.0000000 </td>
  </tr>
</tbody>
</table>

### Input Size 

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Input Size × Grammar EMMs (Proportion Correct)</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> inputsize </th>
   <th style="text-align:left;"> grammartype </th>
   <th style="text-align:right;"> emmean </th>
   <th style="text-align:right;"> asymp.LCL </th>
   <th style="text-align:right;"> asymp.UCL </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9831030 </td>
   <td style="text-align:right;"> 0.9824593 </td>
   <td style="text-align:right;"> 0.9837233 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9805171 </td>
   <td style="text-align:right;"> 0.9798416 </td>
   <td style="text-align:right;"> 0.9811703 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9775401 </td>
   <td style="text-align:right;"> 0.9768340 </td>
   <td style="text-align:right;"> 0.9782249 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9741141 </td>
   <td style="text-align:right;"> 0.9733778 </td>
   <td style="text-align:right;"> 0.9748304 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9701736 </td>
   <td style="text-align:right;"> 0.9694049 </td>
   <td style="text-align:right;"> 0.9709234 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9656439 </td>
   <td style="text-align:right;"> 0.9648359 </td>
   <td style="text-align:right;"> 0.9664337 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9604405 </td>
   <td style="text-align:right;"> 0.9595783 </td>
   <td style="text-align:right;"> 0.9612846 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9544677 </td>
   <td style="text-align:right;"> 0.9535244 </td>
   <td style="text-align:right;"> 0.9553922 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9476179 </td>
   <td style="text-align:right;"> 0.9465506 </td>
   <td style="text-align:right;"> 0.9486645 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9397706 </td>
   <td style="text-align:right;"> 0.9385187 </td>
   <td style="text-align:right;"> 0.9409979 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9307913 </td>
   <td style="text-align:right;"> 0.9292765 </td>
   <td style="text-align:right;"> 0.9322748 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9205309 </td>
   <td style="text-align:right;"> 0.9186588 </td>
   <td style="text-align:right;"> 0.9223618 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9445290 </td>
   <td style="text-align:right;"> 0.9434363 </td>
   <td style="text-align:right;"> 0.9456011 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9389971 </td>
   <td style="text-align:right;"> 0.9379061 </td>
   <td style="text-align:right;"> 0.9400695 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9329334 </td>
   <td style="text-align:right;"> 0.9318488 </td>
   <td style="text-align:right;"> 0.9340014 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9262910 </td>
   <td style="text-align:right;"> 0.9252153 </td>
   <td style="text-align:right;"> 0.9273518 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9190197 </td>
   <td style="text-align:right;"> 0.9179517 </td>
   <td style="text-align:right;"> 0.9200744 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9110662 </td>
   <td style="text-align:right;"> 0.9099981 </td>
   <td style="text-align:right;"> 0.9121222 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9023739 </td>
   <td style="text-align:right;"> 0.9012883 </td>
   <td style="text-align:right;"> 0.9034481 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8928830 </td>
   <td style="text-align:right;"> 0.8917497 </td>
   <td style="text-align:right;"> 0.8940051 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8825309 </td>
   <td style="text-align:right;"> 0.8813056 </td>
   <td style="text-align:right;"> 0.8837445 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8712525 </td>
   <td style="text-align:right;"> 0.8698781 </td>
   <td style="text-align:right;"> 0.8726135 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8589803 </td>
   <td style="text-align:right;"> 0.8573909 </td>
   <td style="text-align:right;"> 0.8605536 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8456453 </td>
   <td style="text-align:right;"> 0.8437700 </td>
   <td style="text-align:right;"> 0.8475003 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9553875 </td>
   <td style="text-align:right;"> 0.9545842 </td>
   <td style="text-align:right;"> 0.9561769 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9498707 </td>
   <td style="text-align:right;"> 0.9490535 </td>
   <td style="text-align:right;"> 0.9506750 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9436919 </td>
   <td style="text-align:right;"> 0.9428665 </td>
   <td style="text-align:right;"> 0.9445057 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9367773 </td>
   <td style="text-align:right;"> 0.9359490 </td>
   <td style="text-align:right;"> 0.9375953 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9290460 </td>
   <td style="text-align:right;"> 0.9282188 </td>
   <td style="text-align:right;"> 0.9298640 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9204101 </td>
   <td style="text-align:right;"> 0.9195847 </td>
   <td style="text-align:right;"> 0.9212274 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9107745 </td>
   <td style="text-align:right;"> 0.9099451 </td>
   <td style="text-align:right;"> 0.9115966 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9000370 </td>
   <td style="text-align:right;"> 0.8991872 </td>
   <td style="text-align:right;"> 0.9008800 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8880886 </td>
   <td style="text-align:right;"> 0.8871868 </td>
   <td style="text-align:right;"> 0.8889837 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8748141 </td>
   <td style="text-align:right;"> 0.8738116 </td>
   <td style="text-align:right;"> 0.8758092 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8600927 </td>
   <td style="text-align:right;"> 0.8589261 </td>
   <td style="text-align:right;"> 0.8612505 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8438000 </td>
   <td style="text-align:right;"> 0.8423961 </td>
   <td style="text-align:right;"> 0.8451925 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9423643 </td>
   <td style="text-align:right;"> 0.9412693 </td>
   <td style="text-align:right;"> 0.9434394 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9383110 </td>
   <td style="text-align:right;"> 0.9372421 </td>
   <td style="text-align:right;"> 0.9393623 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9339828 </td>
   <td style="text-align:right;"> 0.9329428 </td>
   <td style="text-align:right;"> 0.9350073 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9293626 </td>
   <td style="text-align:right;"> 0.9283519 </td>
   <td style="text-align:right;"> 0.9303596 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9244322 </td>
   <td style="text-align:right;"> 0.9234478 </td>
   <td style="text-align:right;"> 0.9254046 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9191730 </td>
   <td style="text-align:right;"> 0.9182065 </td>
   <td style="text-align:right;"> 0.9201286 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9135651 </td>
   <td style="text-align:right;"> 0.9126009 </td>
   <td style="text-align:right;"> 0.9145191 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9075880 </td>
   <td style="text-align:right;"> 0.9066020 </td>
   <td style="text-align:right;"> 0.9085642 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9012205 </td>
   <td style="text-align:right;"> 0.9001792 </td>
   <td style="text-align:right;"> 0.9022514 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8944402 </td>
   <td style="text-align:right;"> 0.8933031 </td>
   <td style="text-align:right;"> 0.8955658 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8872242 </td>
   <td style="text-align:right;"> 0.8859462 </td>
   <td style="text-align:right;"> 0.8884888 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8795491 </td>
   <td style="text-align:right;"> 0.8780833 </td>
   <td style="text-align:right;"> 0.8809984 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7652757 </td>
   <td style="text-align:right;"> 0.7623493 </td>
   <td style="text-align:right;"> 0.7681718 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7858045 </td>
   <td style="text-align:right;"> 0.7833911 </td>
   <td style="text-align:right;"> 0.7881948 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8047731 </td>
   <td style="text-align:right;"> 0.8028041 </td>
   <td style="text-align:right;"> 0.8067249 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8222566 </td>
   <td style="text-align:right;"> 0.8206636 </td>
   <td style="text-align:right;"> 0.8238370 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8383351 </td>
   <td style="text-align:right;"> 0.8370496 </td>
   <td style="text-align:right;"> 0.8396115 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8530917 </td>
   <td style="text-align:right;"> 0.8520439 </td>
   <td style="text-align:right;"> 0.8541328 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8666104 </td>
   <td style="text-align:right;"> 0.8657297 </td>
   <td style="text-align:right;"> 0.8674859 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8789748 </td>
   <td style="text-align:right;"> 0.8781932 </td>
   <td style="text-align:right;"> 0.8797518 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8902667 </td>
   <td style="text-align:right;"> 0.8895268 </td>
   <td style="text-align:right;"> 0.8910020 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9005654 </td>
   <td style="text-align:right;"> 0.8998274 </td>
   <td style="text-align:right;"> 0.9012984 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9099471 </td>
   <td style="text-align:right;"> 0.9091894 </td>
   <td style="text-align:right;"> 0.9106988 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9184840 </td>
   <td style="text-align:right;"> 0.9176991 </td>
   <td style="text-align:right;"> 0.9192619 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9461546 </td>
   <td style="text-align:right;"> 0.9455683 </td>
   <td style="text-align:right;"> 0.9467348 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9446366 </td>
   <td style="text-align:right;"> 0.9440972 </td>
   <td style="text-align:right;"> 0.9451709 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9430771 </td>
   <td style="text-align:right;"> 0.9425854 </td>
   <td style="text-align:right;"> 0.9435647 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9414750 </td>
   <td style="text-align:right;"> 0.9410308 </td>
   <td style="text-align:right;"> 0.9419160 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9398293 </td>
   <td style="text-align:right;"> 0.9394306 </td>
   <td style="text-align:right;"> 0.9402254 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9381388 </td>
   <td style="text-align:right;"> 0.9377810 </td>
   <td style="text-align:right;"> 0.9384947 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9364025 </td>
   <td style="text-align:right;"> 0.9360767 </td>
   <td style="text-align:right;"> 0.9367268 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9346192 </td>
   <td style="text-align:right;"> 0.9343107 </td>
   <td style="text-align:right;"> 0.9349262 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9327876 </td>
   <td style="text-align:right;"> 0.9324763 </td>
   <td style="text-align:right;"> 0.9330976 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9309067 </td>
   <td style="text-align:right;"> 0.9305695 </td>
   <td style="text-align:right;"> 0.9312423 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9289752 </td>
   <td style="text-align:right;"> 0.9285906 </td>
   <td style="text-align:right;"> 0.9293579 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9269918 </td>
   <td style="text-align:right;"> 0.9265419 </td>
   <td style="text-align:right;"> 0.9274392 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9043917 </td>
   <td style="text-align:right;"> 0.9035470 </td>
   <td style="text-align:right;"> 0.9052293 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9084025 </td>
   <td style="text-align:right;"> 0.9076597 </td>
   <td style="text-align:right;"> 0.9091396 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9122533 </td>
   <td style="text-align:right;"> 0.9116007 </td>
   <td style="text-align:right;"> 0.9129014 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9159499 </td>
   <td style="text-align:right;"> 0.9153750 </td>
   <td style="text-align:right;"> 0.9165210 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9194977 </td>
   <td style="text-align:right;"> 0.9189876 </td>
   <td style="text-align:right;"> 0.9200047 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9229021 </td>
   <td style="text-align:right;"> 0.9224430 </td>
   <td style="text-align:right;"> 0.9233585 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9261683 </td>
   <td style="text-align:right;"> 0.9257460 </td>
   <td style="text-align:right;"> 0.9265883 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9293016 </td>
   <td style="text-align:right;"> 0.9289019 </td>
   <td style="text-align:right;"> 0.9296991 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9323068 </td>
   <td style="text-align:right;"> 0.9319167 </td>
   <td style="text-align:right;"> 0.9326947 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9351887 </td>
   <td style="text-align:right;"> 0.9347973 </td>
   <td style="text-align:right;"> 0.9355779 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9379521 </td>
   <td style="text-align:right;"> 0.9375511 </td>
   <td style="text-align:right;"> 0.9383506 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9406014 </td>
   <td style="text-align:right;"> 0.9401850 </td>
   <td style="text-align:right;"> 0.9410150 </td>
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
   <td style="text-align:right;"> 0.9460049 </td>
   <td style="text-align:right;"> 0.9456740 </td>
   <td style="text-align:right;"> 0.9463337 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.9373553 </td>
   <td style="text-align:right;"> 0.9370386 </td>
   <td style="text-align:right;"> 0.9376704 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.9273742 </td>
   <td style="text-align:right;"> 0.9270526 </td>
   <td style="text-align:right;"> 0.9276944 </td>
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
   <td style="text-align:right;"> 0.8933113 </td>
   <td style="text-align:right;"> 0.8927562 </td>
   <td style="text-align:right;"> 0.8938637 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:right;"> 0.8976389 </td>
   <td style="text-align:right;"> 0.8971280 </td>
   <td style="text-align:right;"> 0.8981474 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 96 </td>
   <td style="text-align:right;"> 0.9018007 </td>
   <td style="text-align:right;"> 0.9013290 </td>
   <td style="text-align:right;"> 0.9022703 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 128 </td>
   <td style="text-align:right;"> 0.9058023 </td>
   <td style="text-align:right;"> 0.9053650 </td>
   <td style="text-align:right;"> 0.9062377 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 0.9096492 </td>
   <td style="text-align:right;"> 0.9092415 </td>
   <td style="text-align:right;"> 0.9100552 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 192 </td>
   <td style="text-align:right;"> 0.9133466 </td>
   <td style="text-align:right;"> 0.9129639 </td>
   <td style="text-align:right;"> 0.9137277 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 224 </td>
   <td style="text-align:right;"> 0.9168996 </td>
   <td style="text-align:right;"> 0.9165376 </td>
   <td style="text-align:right;"> 0.9172602 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 256 </td>
   <td style="text-align:right;"> 0.9203134 </td>
   <td style="text-align:right;"> 0.9199679 </td>
   <td style="text-align:right;"> 0.9206576 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 288 </td>
   <td style="text-align:right;"> 0.9235929 </td>
   <td style="text-align:right;"> 0.9232601 </td>
   <td style="text-align:right;"> 0.9239243 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 320 </td>
   <td style="text-align:right;"> 0.9267429 </td>
   <td style="text-align:right;"> 0.9264195 </td>
   <td style="text-align:right;"> 0.9270649 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 352 </td>
   <td style="text-align:right;"> 0.9297680 </td>
   <td style="text-align:right;"> 0.9294511 </td>
   <td style="text-align:right;"> 0.9300835 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 384 </td>
   <td style="text-align:right;"> 0.9326727 </td>
   <td style="text-align:right;"> 0.9323599 </td>
   <td style="text-align:right;"> 0.9329841 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 416 </td>
   <td style="text-align:right;"> 0.9354616 </td>
   <td style="text-align:right;"> 0.9351509 </td>
   <td style="text-align:right;"> 0.9357708 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 448 </td>
   <td style="text-align:right;"> 0.9381387 </td>
   <td style="text-align:right;"> 0.9378287 </td>
   <td style="text-align:right;"> 0.9384473 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 480 </td>
   <td style="text-align:right;"> 0.9407084 </td>
   <td style="text-align:right;"> 0.9403978 </td>
   <td style="text-align:right;"> 0.9410174 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 512 </td>
   <td style="text-align:right;"> 0.9431746 </td>
   <td style="text-align:right;"> 0.9428627 </td>
   <td style="text-align:right;"> 0.9434848 </td>
  </tr>
</tbody>
</table>



# Exploring Input size

One of the findings is that input size heavily impacts performance. It is possible that the recurrent architectures are performing well on context-free and context-sensitive grammars because they are able to use a finite-state strategy when given a large enough input size. 

Therefore, we need to see whether the effects are robust when we filter the data in that way.

## Inverse Brier Score Model

```
Call:
betareg::betareg(formula = formulas_inverse_brier_phi$M1g, data = df_filtered, 
    link = "loglog")

Quantile residuals:
     Min       1Q   Median       3Q      Max 
-10.5391  -0.7084   0.0703   0.7649   4.0051 

Coefficients (mean model with loglog link):
                                       Estimate Std. Error  z value Pr(>|z|)
(Intercept)                           4.127e+00  3.363e-02  122.693  < 2e-16
recurrenceRNN                        -4.902e-01  2.865e-02  -17.107  < 2e-16
recurrenceGRU                         4.285e-01  2.862e-02   14.972  < 2e-16
laminationsLaminated                 -2.867e-02  1.285e-02   -2.231 0.025677
inputsize                            -1.537e-01  1.683e-03  -91.310  < 2e-16
grammartypeLT                        -1.367e+00  3.848e-02  -35.530  < 2e-16
grammartypeLTT                       -1.094e+00  3.653e-02  -29.953  < 2e-16
grammartypeLTTO                      -1.320e+00  3.833e-02  -34.429  < 2e-16
grammartypeMSO                       -3.138e+00  3.557e-02  -88.212  < 2e-16
grammartypeCS                        -4.808e+00  4.434e-02 -108.422  < 2e-16
grammartypeCF                        -2.913e+00  3.680e-02  -79.166  < 2e-16
neurons                               9.277e-04  6.972e-06  133.050  < 2e-16
layers                               -4.538e-02  9.023e-04  -50.291  < 2e-16
recurrenceRNN:grammartypeLT           7.401e-02  3.274e-02    2.261 0.023781
recurrenceGRU:grammartypeLT          -1.510e-01  3.267e-02   -4.623 3.78e-06
recurrenceRNN:grammartypeLTT          1.738e-02  3.093e-02    0.562 0.574130
recurrenceGRU:grammartypeLTT         -2.420e-01  3.082e-02   -7.852 4.11e-15
recurrenceRNN:grammartypeLTTO         4.607e-02  3.271e-02    1.408 0.159004
recurrenceGRU:grammartypeLTTO        -3.522e-01  3.260e-02  -10.803  < 2e-16
recurrenceRNN:grammartypeMSO          4.453e-01  2.996e-02   14.863  < 2e-16
recurrenceGRU:grammartypeMSO         -3.671e-01  3.005e-02  -12.217  < 2e-16
recurrenceRNN:grammartypeCS           2.669e+00  3.729e-02   71.576  < 2e-16
recurrenceGRU:grammartypeCS           2.331e+00  3.723e-02   62.606  < 2e-16
recurrenceRNN:grammartypeCF           6.961e-01  3.094e-02   22.498  < 2e-16
recurrenceGRU:grammartypeCF           3.491e-01  3.085e-02   11.316  < 2e-16
grammartypeLT:laminationsLaminated    6.039e-02  1.314e-02    4.594 4.34e-06
grammartypeLTT:laminationsLaminated   2.829e-02  1.247e-02    2.268 0.023333
grammartypeLTTO:laminationsLaminated  3.923e-02  1.301e-02    3.016 0.002564
grammartypeMSO:laminationsLaminated   4.343e-02  1.241e-02    3.501 0.000464
grammartypeCS:laminationsLaminated   -3.394e-02  1.219e-02   -2.784 0.005375
grammartypeCF:laminationsLaminated    1.470e-02  1.185e-02    1.240 0.214808
recurrenceRNN:laminationsLaminated   -1.130e-01  7.023e-03  -16.089  < 2e-16
recurrenceGRU:laminationsLaminated   -6.650e-02  6.893e-03   -9.647  < 2e-16
grammartypeLT:inputsize               6.387e-02  1.973e-03   32.366  < 2e-16
grammartypeLTT:inputsize              4.566e-02  1.885e-03   24.228  < 2e-16
grammartypeLTTO:inputsize             9.024e-02  1.951e-03   46.242  < 2e-16
grammartypeMSO:inputsize              2.559e-01  1.882e-03  135.935  < 2e-16
grammartypeCS:inputsize               3.937e-01  2.927e-03  134.524  < 2e-16
grammartypeCF:inputsize               2.679e-01  2.057e-03  130.250  < 2e-16
                                        
(Intercept)                          ***
recurrenceRNN                        ***
recurrenceGRU                        ***
laminationsLaminated                 *  
inputsize                            ***
grammartypeLT                        ***
grammartypeLTT                       ***
grammartypeLTTO                      ***
grammartypeMSO                       ***
grammartypeCS                        ***
grammartypeCF                        ***
neurons                              ***
layers                               ***
recurrenceRNN:grammartypeLT          *  
recurrenceGRU:grammartypeLT          ***
recurrenceRNN:grammartypeLTT            
recurrenceGRU:grammartypeLTT         ***
recurrenceRNN:grammartypeLTTO           
recurrenceGRU:grammartypeLTTO        ***
recurrenceRNN:grammartypeMSO         ***
recurrenceGRU:grammartypeMSO         ***
recurrenceRNN:grammartypeCS          ***
recurrenceGRU:grammartypeCS          ***
recurrenceRNN:grammartypeCF          ***
recurrenceGRU:grammartypeCF          ***
grammartypeLT:laminationsLaminated   ***
grammartypeLTT:laminationsLaminated  *  
grammartypeLTTO:laminationsLaminated ** 
grammartypeMSO:laminationsLaminated  ***
grammartypeCS:laminationsLaminated   ** 
grammartypeCF:laminationsLaminated      
recurrenceRNN:laminationsLaminated   ***
recurrenceGRU:laminationsLaminated   ***
grammartypeLT:inputsize              ***
grammartypeLTT:inputsize             ***
grammartypeLTTO:inputsize            ***
grammartypeMSO:inputsize             ***
grammartypeCS:inputsize              ***
grammartypeCF:inputsize              ***

Phi coefficients (precision model with log link):
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           2.124e+00  3.766e-02  56.411  < 2e-16 ***
recurrenceRNN                        -3.603e-01  3.178e-02 -11.338  < 2e-16 ***
recurrenceGRU                         9.160e-01  3.200e-02  28.624  < 2e-16 ***
laminationsLaminated                 -6.489e-02  1.834e-02  -3.538 0.000402 ***
inputsize                            -1.042e-01  1.889e-03 -55.167  < 2e-16 ***
grammartypeLT                         7.049e-01  4.988e-02  14.131  < 2e-16 ***
grammartypeLTT                        8.796e-01  4.970e-02  17.699  < 2e-16 ***
grammartypeLTTO                       7.488e-01  5.019e-02  14.920  < 2e-16 ***
grammartypeMSO                        1.091e+00  4.378e-02  24.926  < 2e-16 ***
grammartypeCS                         4.823e-01  6.473e-02   7.451 9.27e-14 ***
grammartypeCF                        -7.730e-01  4.747e-02 -16.283  < 2e-16 ***
neurons                               8.148e-04  1.177e-05  69.256  < 2e-16 ***
layers                               -3.298e-02  1.534e-03 -21.503  < 2e-16 ***
recurrenceRNN:grammartypeLT          -2.725e-01  4.254e-02  -6.407 1.48e-10 ***
recurrenceGRU:grammartypeLT          -6.749e-01  4.279e-02 -15.773  < 2e-16 ***
recurrenceRNN:grammartypeLTT         -2.931e-01  4.245e-02  -6.904 5.06e-12 ***
recurrenceGRU:grammartypeLTT         -5.762e-01  4.265e-02 -13.510  < 2e-16 ***
recurrenceRNN:grammartypeLTTO        -2.603e-01  4.292e-02  -6.065 1.32e-09 ***
recurrenceGRU:grammartypeLTTO        -7.268e-01  4.312e-02 -16.857  < 2e-16 ***
recurrenceRNN:grammartypeMSO         -1.439e+00  3.740e-02 -38.475  < 2e-16 ***
recurrenceGRU:grammartypeMSO         -3.082e+00  3.763e-02 -81.903  < 2e-16 ***
recurrenceRNN:grammartypeCS          -1.089e-01  5.346e-02  -2.038 0.041563 *  
recurrenceGRU:grammartypeCS          -5.181e-01  5.357e-02  -9.672  < 2e-16 ***
recurrenceRNN:grammartypeCF           5.049e-01  3.909e-02  12.915  < 2e-16 ***
recurrenceGRU:grammartypeCF           2.922e-01  3.924e-02   7.447 9.55e-14 ***
grammartypeLT:laminationsLaminated    2.068e-02  1.700e-02   1.216 0.223829    
grammartypeLTT:laminationsLaminated   7.010e-03  1.686e-02   0.416 0.677500    
grammartypeLTTO:laminationsLaminated -7.831e-03  1.704e-02  -0.460 0.645754    
grammartypeMSO:laminationsLaminated   5.801e-02  1.484e-02   3.909 9.26e-05 ***
grammartypeCS:laminationsLaminated   -1.883e-02  1.547e-02  -1.217 0.223649    
grammartypeCF:laminationsLaminated   -1.302e-03  1.459e-02  -0.089 0.928893    
recurrenceRNN:laminationsLaminated   -3.793e-02  1.447e-02  -2.621 0.008765 ** 
recurrenceGRU:laminationsLaminated    3.436e-02  1.450e-02   2.370 0.017799 *  
grammartypeLT:inputsize               5.215e-02  2.540e-03  20.532  < 2e-16 ***
grammartypeLTT:inputsize              9.614e-02  2.524e-03  38.086  < 2e-16 ***
grammartypeLTTO:inputsize             7.917e-02  2.544e-03  31.127  < 2e-16 ***
grammartypeMSO:inputsize              1.353e-01  2.229e-03  60.706  < 2e-16 ***
grammartypeCS:inputsize               1.695e-01  4.699e-03  36.079  < 2e-16 ***
grammartypeCF:inputsize               2.673e-01  2.936e-03  91.047  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

Type of estimator: ML (maximum likelihood)
Log-likelihood: 1.067e+06 on 78 Df
Pseudo R-squared: 0.2328
Number of iterations: 101 (BFGS) + 14 (Fisher scoring) 
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
   <td style="text-align:right;"> 0.9648521 </td>
   <td style="text-align:right;"> 0.9628946 </td>
   <td style="text-align:right;"> 0.9667081 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9400622 </td>
   <td style="text-align:right;"> 0.9390414 </td>
   <td style="text-align:right;"> 0.9410664 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9761901 </td>
   <td style="text-align:right;"> 0.9758064 </td>
   <td style="text-align:right;"> 0.9765678 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9096762 </td>
   <td style="text-align:right;"> 0.9069723 </td>
   <td style="text-align:right;"> 0.9123054 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8591028 </td>
   <td style="text-align:right;"> 0.8577265 </td>
   <td style="text-align:right;"> 0.8604669 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9285306 </td>
   <td style="text-align:right;"> 0.9278528 </td>
   <td style="text-align:right;"> 0.9292023 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9219957 </td>
   <td style="text-align:right;"> 0.9202303 </td>
   <td style="text-align:right;"> 0.9237236 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8712054 </td>
   <td style="text-align:right;"> 0.8701036 </td>
   <td style="text-align:right;"> 0.8722986 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9326988 </td>
   <td style="text-align:right;"> 0.9321802 </td>
   <td style="text-align:right;"> 0.9332135 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9245268 </td>
   <td style="text-align:right;"> 0.9222594 </td>
   <td style="text-align:right;"> 0.9267307 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8785740 </td>
   <td style="text-align:right;"> 0.8773893 </td>
   <td style="text-align:right;"> 0.8797481 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9275904 </td>
   <td style="text-align:right;"> 0.9269487 </td>
   <td style="text-align:right;"> 0.9282267 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8289201 </td>
   <td style="text-align:right;"> 0.8262886 </td>
   <td style="text-align:right;"> 0.8315160 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8124961 </td>
   <td style="text-align:right;"> 0.8112625 </td>
   <td style="text-align:right;"> 0.8137226 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8332474 </td>
   <td style="text-align:right;"> 0.8319084 </td>
   <td style="text-align:right;"> 0.8345768 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.6236953 </td>
   <td style="text-align:right;"> 0.6144683 </td>
   <td style="text-align:right;"> 0.6327722 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9450574 </td>
   <td style="text-align:right;"> 0.9440969 </td>
   <td style="text-align:right;"> 0.9460019 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9695648 </td>
   <td style="text-align:right;"> 0.9690381 </td>
   <td style="text-align:right;"> 0.9700827 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8675990 </td>
   <td style="text-align:right;"> 0.8652440 </td>
   <td style="text-align:right;"> 0.8699160 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8848762 </td>
   <td style="text-align:right;"> 0.8840082 </td>
   <td style="text-align:right;"> 0.8857382 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9347580 </td>
   <td style="text-align:right;"> 0.9343178 </td>
   <td style="text-align:right;"> 0.9351954 </td>
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
   <td style="text-align:right;"> 0.54665081 </td>
   <td style="text-align:right;"> 0.02847250 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 19.199253 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.39527711 </td>
   <td style="text-align:right;"> 0.02845135 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -13.893087 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.94192791 </td>
   <td style="text-align:right;"> 0.01151297 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -81.814483 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.47264265 </td>
   <td style="text-align:right;"> 0.01617006 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 29.229498 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.24424439 </td>
   <td style="text-align:right;"> 0.01606470 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -15.203797 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.71688705 </td>
   <td style="text-align:right;"> 0.00709749 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -101.005721 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.52926851 </td>
   <td style="text-align:right;"> 0.01209957 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 43.742755 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.15328405 </td>
   <td style="text-align:right;"> 0.01186630 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.917594 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.68255256 </td>
   <td style="text-align:right;"> 0.00574550 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -118.797702 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.50057633 </td>
   <td style="text-align:right;"> 0.01612135 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 31.050515 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.04307266 </td>
   <td style="text-align:right;"> 0.01593211 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.703512 </td>
   <td style="text-align:right;"> 0.01881186 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.54364899 </td>
   <td style="text-align:right;"> 0.00684461 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -79.427282 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.10134602 </td>
   <td style="text-align:right;"> 0.00934381 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 10.846323 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.02814225 </td>
   <td style="text-align:right;"> 0.00968716 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.905110 </td>
   <td style="text-align:right;"> 0.01026437 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.12948827 </td>
   <td style="text-align:right;"> 0.00581077 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -22.284196 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -2.12276669 </td>
   <td style="text-align:right;"> 0.02409379 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -88.104307 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -2.72616362 </td>
   <td style="text-align:right;"> 0.02402006 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -113.495272 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.60339692 </td>
   <td style="text-align:right;"> 0.00533875 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -113.022218 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.14946951 </td>
   <td style="text-align:right;"> 0.01212641 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.325951 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.74436091 </td>
   <td style="text-align:right;"> 0.01193736 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -62.355585 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.59489140 </td>
   <td style="text-align:right;"> 0.00414061 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -143.672376 </td>
   <td style="text-align:right;"> 0.00000000 </td>
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
   <td style="text-align:right;"> 0.97295837 </td>
   <td style="text-align:right;"> 0.03228780 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 30.133928 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.81969479 </td>
   <td style="text-align:right;"> 0.03057128 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 26.812579 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.78535602 </td>
   <td style="text-align:right;"> 0.03225027 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 24.351919 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.65707773 </td>
   <td style="text-align:right;"> 0.02943722 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 56.291930 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 2.57977453 </td>
   <td style="text-align:right;"> 0.03231979 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 79.820263 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.37860584 </td>
   <td style="text-align:right;"> 0.02977485 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 46.301018 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.15326358 </td>
   <td style="text-align:right;"> 0.01976679 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.753591 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.18760235 </td>
   <td style="text-align:right;"> 0.02227546 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.421931 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.68411936 </td>
   <td style="text-align:right;"> 0.01796349 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 38.083885 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.60681616 </td>
   <td style="text-align:right;"> 0.02237659 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 71.807896 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.40564747 </td>
   <td style="text-align:right;"> 0.01851131 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 21.913490 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.03433877 </td>
   <td style="text-align:right;"> 0.01970537 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.742609 </td>
   <td style="text-align:right;"> 0.58715589 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.83738294 </td>
   <td style="text-align:right;"> 0.01465563 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 57.137298 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.76007974 </td>
   <td style="text-align:right;"> 0.01981944 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 88.805727 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.55891105 </td>
   <td style="text-align:right;"> 0.01532225 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 36.477077 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.87172171 </td>
   <td style="text-align:right;"> 0.01789598 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 48.710472 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.79441851 </td>
   <td style="text-align:right;"> 0.02232244 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 80.386293 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.59324982 </td>
   <td style="text-align:right;"> 0.01844574 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 32.161892 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.92269680 </td>
   <td style="text-align:right;"> 0.01802077 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 51.201865 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.27847189 </td>
   <td style="text-align:right;"> 0.01291225 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -21.566487 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -1.20116869 </td>
   <td style="text-align:right;"> 0.01856738 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -64.692420 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.89895022 </td>
   <td style="text-align:right;"> 0.01037996 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 86.604403 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.80231249 </td>
   <td style="text-align:right;"> 0.01003828 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 79.925264 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.73928154 </td>
   <td style="text-align:right;"> 0.01034531 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 71.460541 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 1.21177294 </td>
   <td style="text-align:right;"> 0.00963675 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 125.744973 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.08964297 </td>
   <td style="text-align:right;"> 0.01272153 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.046556 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.68248552 </td>
   <td style="text-align:right;"> 0.00978074 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 69.778493 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.09663772 </td>
   <td style="text-align:right;"> 0.00710197 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -13.607167 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.15966867 </td>
   <td style="text-align:right;"> 0.00752967 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -21.205264 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.31282273 </td>
   <td style="text-align:right;"> 0.00652234 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 47.961759 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.98859318 </td>
   <td style="text-align:right;"> 0.01055984 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -93.618187 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.21646469 </td>
   <td style="text-align:right;"> 0.00673309 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -32.149404 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.06303095 </td>
   <td style="text-align:right;"> 0.00705117 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.939074 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.40946045 </td>
   <td style="text-align:right;"> 0.00596354 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 68.660612 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.89195546 </td>
   <td style="text-align:right;"> 0.01022412 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -87.240344 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.11982697 </td>
   <td style="text-align:right;"> 0.00619331 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -19.347801 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.47249140 </td>
   <td style="text-align:right;"> 0.00646702 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 73.061742 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.82892451 </td>
   <td style="text-align:right;"> 0.01052575 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -78.752035 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.05679602 </td>
   <td style="text-align:right;"> 0.00667949 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.503053 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -1.30141591 </td>
   <td style="text-align:right;"> 0.00983029 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -132.388403 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.52928742 </td>
   <td style="text-align:right;"> 0.00551905 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -95.901876 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.77212849 </td>
   <td style="text-align:right;"> 0.00997139 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 77.434404 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.12399108 </td>
   <td style="text-align:right;"> 0.00965222 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 116.448956 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.06168785 </td>
   <td style="text-align:right;"> 0.00919913 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 115.411760 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.13756047 </td>
   <td style="text-align:right;"> 0.00948851 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 119.888165 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 2.02421258 </td>
   <td style="text-align:right;"> 0.00939243 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 215.515384 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.24888802 </td>
   <td style="text-align:right;"> 0.01213391 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 20.511774 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.02952203 </td>
   <td style="text-align:right;"> 0.00898718 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 114.554528 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.06230323 </td>
   <td style="text-align:right;"> 0.00643823 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.677072 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.01356939 </td>
   <td style="text-align:right;"> 0.00684531 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.982290 </td>
   <td style="text-align:right;"> 0.42594744 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.90022150 </td>
   <td style="text-align:right;"> 0.00671166 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 134.127993 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.87510306 </td>
   <td style="text-align:right;"> 0.01020096 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -85.786332 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.09446905 </td>
   <td style="text-align:right;"> 0.00613158 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -15.406961 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.07587262 </td>
   <td style="text-align:right;"> 0.00619009 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 12.257116 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.96252473 </td>
   <td style="text-align:right;"> 0.00604195 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 159.306872 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.81279983 </td>
   <td style="text-align:right;"> 0.00977333 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -83.165074 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.03216582 </td>
   <td style="text-align:right;"> 0.00539027 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.967389 </td>
   <td style="text-align:right;"> 0.00000005 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.88665211 </td>
   <td style="text-align:right;"> 0.00647403 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 136.955174 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.88867245 </td>
   <td style="text-align:right;"> 0.01004620 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -88.458557 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.10803844 </td>
   <td style="text-align:right;"> 0.00587049 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -18.403645 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -1.77532456 </td>
   <td style="text-align:right;"> 0.00995550 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -178.325927 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.99469055 </td>
   <td style="text-align:right;"> 0.00571409 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -174.076912 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.78063401 </td>
   <td style="text-align:right;"> 0.00957409 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 81.536107 </td>
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
   <td style="text-align:right;"> 0.9646372 </td>
   <td style="text-align:right;"> 0.9637944 </td>
   <td style="text-align:right;"> 0.9654607 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9614287 </td>
   <td style="text-align:right;"> 0.9605031 </td>
   <td style="text-align:right;"> 0.9623331 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9041779 </td>
   <td style="text-align:right;"> 0.9029189 </td>
   <td style="text-align:right;"> 0.9054215 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9015845 </td>
   <td style="text-align:right;"> 0.9002602 </td>
   <td style="text-align:right;"> 0.9028922 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9145452 </td>
   <td style="text-align:right;"> 0.9136363 </td>
   <td style="text-align:right;"> 0.9154450 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9094891 </td>
   <td style="text-align:right;"> 0.9085064 </td>
   <td style="text-align:right;"> 0.9104619 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9146837 </td>
   <td style="text-align:right;"> 0.9135785 </td>
   <td style="text-align:right;"> 0.9157756 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9105731 </td>
   <td style="text-align:right;"> 0.9093860 </td>
   <td style="text-align:right;"> 0.9117454 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8286295 </td>
   <td style="text-align:right;"> 0.8273002 </td>
   <td style="text-align:right;"> 0.8299496 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8214798 </td>
   <td style="text-align:right;"> 0.8200709 </td>
   <td style="text-align:right;"> 0.8228788 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9155746 </td>
   <td style="text-align:right;"> 0.9150403 </td>
   <td style="text-align:right;"> 0.9161057 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9051160 </td>
   <td style="text-align:right;"> 0.9045049 </td>
   <td style="text-align:right;"> 0.9057234 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9033798 </td>
   <td style="text-align:right;"> 0.9027884 </td>
   <td style="text-align:right;"> 0.9039677 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8963763 </td>
   <td style="text-align:right;"> 0.8957189 </td>
   <td style="text-align:right;"> 0.8970298 </td>
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
   <td style="text-align:right;"> 0.08850190 </td>
   <td style="text-align:right;"> 0.01136510 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.787167 </td>
   <td style="text-align:right;"> 0.000e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.02811660 </td>
   <td style="text-align:right;"> 0.00711188 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.953470 </td>
   <td style="text-align:right;"> 7.703e-05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.06021170 </td>
   <td style="text-align:right;"> 0.00576348 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 10.447115 </td>
   <td style="text-align:right;"> 0.000e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.04927443 </td>
   <td style="text-align:right;"> 0.00686758 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.174933 </td>
   <td style="text-align:right;"> 0.000e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.04506793 </td>
   <td style="text-align:right;"> 0.00541231 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 8.326935 </td>
   <td style="text-align:right;"> 0.000e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.12244140 </td>
   <td style="text-align:right;"> 0.00472390 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 25.919556 </td>
   <td style="text-align:right;"> 0.000e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.07380049 </td>
   <td style="text-align:right;"> 0.00416489 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 17.719671 </td>
   <td style="text-align:right;"> 0.000e+00 </td>
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
   <td style="text-align:right;"> 1.02882587 </td>
   <td style="text-align:right;"> 0.01405730 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 73.1880252 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.90871014 </td>
   <td style="text-align:right;"> 0.01343162 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 67.6545287 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.90701308 </td>
   <td style="text-align:right;"> 0.01398821 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 64.8412329 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 1.65273807 </td>
   <td style="text-align:right;"> 0.01295372 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 127.5879174 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.89603678 </td>
   <td style="text-align:right;"> 0.01267524 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 70.6919076 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 1.03755517 </td>
   <td style="text-align:right;"> 0.01262543 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 82.1797925 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.12011573 </td>
   <td style="text-align:right;"> 0.00893643 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -13.4411355 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.12181279 </td>
   <td style="text-align:right;"> 0.00975326 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -12.4894455 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.62391220 </td>
   <td style="text-align:right;"> 0.00819868 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 76.0990745 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.13278909 </td>
   <td style="text-align:right;"> 0.00774928 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -17.1356716 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.00872930 </td>
   <td style="text-align:right;"> 0.00767079 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.1379922 </td>
   <td style="text-align:right;"> 0.91643299 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.00169706 </td>
   <td style="text-align:right;"> 0.00882666 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -0.1922654 </td>
   <td style="text-align:right;"> 0.99999579 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.74402793 </td>
   <td style="text-align:right;"> 0.00707396 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 105.1784852 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.01267336 </td>
   <td style="text-align:right;"> 0.00654291 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.9369620 </td>
   <td style="text-align:right;"> 0.45561164 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.12884503 </td>
   <td style="text-align:right;"> 0.00644996 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 19.9760847 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.74572499 </td>
   <td style="text-align:right;"> 0.00808159 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 92.2745042 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.01097630 </td>
   <td style="text-align:right;"> 0.00762337 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.4398223 </td>
   <td style="text-align:right;"> 0.78014081 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.13054209 </td>
   <td style="text-align:right;"> 0.00754228 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 17.3080444 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.75670129 </td>
   <td style="text-align:right;"> 0.00547105 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -138.3100646 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.61518290 </td>
   <td style="text-align:right;"> 0.00538472 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -114.2461253 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.14151839 </td>
   <td style="text-align:right;"> 0.00465685 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 30.3892989 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.96844058 </td>
   <td style="text-align:right;"> 0.01420369 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 68.1823281 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.88041995 </td>
   <td style="text-align:right;"> 0.01354904 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 64.9802585 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.86778561 </td>
   <td style="text-align:right;"> 0.01413550 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 61.3904977 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 1.60930410 </td>
   <td style="text-align:right;"> 0.01305722 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 123.2501368 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.92997628 </td>
   <td style="text-align:right;"> 0.01277437 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 72.8001804 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 1.02285376 </td>
   <td style="text-align:right;"> 0.01272789 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 80.3632111 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.08802063 </td>
   <td style="text-align:right;"> 0.00910571 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.6665337 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.10065497 </td>
   <td style="text-align:right;"> 0.00995749 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -10.1084708 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.64086353 </td>
   <td style="text-align:right;"> 0.00835624 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 76.6927893 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.03846430 </td>
   <td style="text-align:right;"> 0.00790656 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -4.8648593 </td>
   <td style="text-align:right;"> 0.00002363 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.05441318 </td>
   <td style="text-align:right;"> 0.00783155 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.9479454 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.01263434 </td>
   <td style="text-align:right;"> 0.00899810 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -1.4041120 </td>
   <td style="text-align:right;"> 0.79989701 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.72888416 </td>
   <td style="text-align:right;"> 0.00718847 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 101.3962171 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.04955633 </td>
   <td style="text-align:right;"> 0.00665459 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.4469435 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.14243381 </td>
   <td style="text-align:right;"> 0.00656635 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 21.6914630 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.74151849 </td>
   <td style="text-align:right;"> 0.00824227 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 89.9652948 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.06219067 </td>
   <td style="text-align:right;"> 0.00778410 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.9894524 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.15506815 </td>
   <td style="text-align:right;"> 0.00770592 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 20.1232469 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.67932783 </td>
   <td style="text-align:right;"> 0.00555722 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -122.2424182 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.58645034 </td>
   <td style="text-align:right;"> 0.00548191 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -106.9792807 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.09287748 </td>
   <td style="text-align:right;"> 0.00475126 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 19.5479622 </td>
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
   <td style="text-align:right;"> 0.8914180 </td>
   <td style="text-align:right;"> 0.8900519 </td>
   <td style="text-align:right;"> 0.8927682 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.8907044 </td>
   <td style="text-align:right;"> 0.8892533 </td>
   <td style="text-align:right;"> 0.8921377 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.8987457 </td>
   <td style="text-align:right;"> 0.8981867 </td>
   <td style="text-align:right;"> 0.8993018 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.8866029 </td>
   <td style="text-align:right;"> 0.8859891 </td>
   <td style="text-align:right;"> 0.8872136 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9418994 </td>
   <td style="text-align:right;"> 0.9415897 </td>
   <td style="text-align:right;"> 0.9422075 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9376127 </td>
   <td style="text-align:right;"> 0.9372867 </td>
   <td style="text-align:right;"> 0.9379370 </td>
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
   <td style="text-align:right;"> 0.00694287 </td>
   <td style="text-align:right;"> 0.00645684 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 1.075274 </td>
   <td style="text-align:right;"> 0.282252 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.11993360 </td>
   <td style="text-align:right;"> 0.00355073 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 33.777137 </td>
   <td style="text-align:right;"> 0.000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.07344401 </td>
   <td style="text-align:right;"> 0.00329446 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 22.293177 </td>
   <td style="text-align:right;"> 0.000000 </td>
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
   <td style="text-align:right;"> -0.07388849 </td>
   <td style="text-align:right;"> 0.00754677 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.790744 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.65247128 </td>
   <td style="text-align:right;"> 0.00749398 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -87.066021 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.57858279 </td>
   <td style="text-align:right;"> 0.00347949 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -166.283741 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.03910224 </td>
   <td style="text-align:right;"> 0.00785127 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.980371 </td>
   <td style="text-align:right;"> 1.9e-06 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.58597014 </td>
   <td style="text-align:right;"> 0.00779757 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -75.147814 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.62507239 </td>
   <td style="text-align:right;"> 0.00342377 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -182.568472 </td>
   <td style="text-align:right;"> 0.0e+00 </td>
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
   <td style="text-align:right;"> 0.9818966 </td>
   <td style="text-align:right;"> 0.9813143 </td>
   <td style="text-align:right;"> 0.9824609 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9789214 </td>
   <td style="text-align:right;"> 0.9783007 </td>
   <td style="text-align:right;"> 0.9795244 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9754633 </td>
   <td style="text-align:right;"> 0.9748036 </td>
   <td style="text-align:right;"> 0.9761060 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9714463 </td>
   <td style="text-align:right;"> 0.9707457 </td>
   <td style="text-align:right;"> 0.9721304 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9667829 </td>
   <td style="text-align:right;"> 0.9660372 </td>
   <td style="text-align:right;"> 0.9675125 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9613732 </td>
   <td style="text-align:right;"> 0.9605738 </td>
   <td style="text-align:right;"> 0.9621567 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9551030 </td>
   <td style="text-align:right;"> 0.9542339 </td>
   <td style="text-align:right;"> 0.9559561 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9478430 </td>
   <td style="text-align:right;"> 0.9468773 </td>
   <td style="text-align:right;"> 0.9487917 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9394467 </td>
   <td style="text-align:right;"> 0.9383434 </td>
   <td style="text-align:right;"> 0.9405309 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9297496 </td>
   <td style="text-align:right;"> 0.9284514 </td>
   <td style="text-align:right;"> 0.9310253 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9185681 </td>
   <td style="text-align:right;"> 0.9170001 </td>
   <td style="text-align:right;"> 0.9201078 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9056990 </td>
   <td style="text-align:right;"> 0.9037695 </td>
   <td style="text-align:right;"> 0.9075918 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9352270 </td>
   <td style="text-align:right;"> 0.9340492 </td>
   <td style="text-align:right;"> 0.9363845 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9293608 </td>
   <td style="text-align:right;"> 0.9281935 </td>
   <td style="text-align:right;"> 0.9305100 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9229856 </td>
   <td style="text-align:right;"> 0.9218330 </td>
   <td style="text-align:right;"> 0.9241220 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9160615 </td>
   <td style="text-align:right;"> 0.9149254 </td>
   <td style="text-align:right;"> 0.9171830 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9085462 </td>
   <td style="text-align:right;"> 0.9074243 </td>
   <td style="text-align:right;"> 0.9096551 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9003953 </td>
   <td style="text-align:right;"> 0.8992785 </td>
   <td style="text-align:right;"> 0.9015005 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8915624 </td>
   <td style="text-align:right;"> 0.8904316 </td>
   <td style="text-align:right;"> 0.8926822 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8819986 </td>
   <td style="text-align:right;"> 0.8808229 </td>
   <td style="text-align:right;"> 0.8831636 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8716538 </td>
   <td style="text-align:right;"> 0.8703889 </td>
   <td style="text-align:right;"> 0.8729073 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8604758 </td>
   <td style="text-align:right;"> 0.8590667 </td>
   <td style="text-align:right;"> 0.8618720 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8484117 </td>
   <td style="text-align:right;"> 0.8467961 </td>
   <td style="text-align:right;"> 0.8500118 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8354076 </td>
   <td style="text-align:right;"> 0.8335198 </td>
   <td style="text-align:right;"> 0.8372762 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9461101 </td>
   <td style="text-align:right;"> 0.9452886 </td>
   <td style="text-align:right;"> 0.9469196 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9401510 </td>
   <td style="text-align:right;"> 0.9393245 </td>
   <td style="text-align:right;"> 0.9409667 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9335565 </td>
   <td style="text-align:right;"> 0.9327297 </td>
   <td style="text-align:right;"> 0.9343736 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9262643 </td>
   <td style="text-align:right;"> 0.9254410 </td>
   <td style="text-align:right;"> 0.9270788 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9182074 </td>
   <td style="text-align:right;"> 0.9173893 </td>
   <td style="text-align:right;"> 0.9190177 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9093140 </td>
   <td style="text-align:right;"> 0.9084983 </td>
   <td style="text-align:right;"> 0.9101228 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8995077 </td>
   <td style="text-align:right;"> 0.8986844 </td>
   <td style="text-align:right;"> 0.9003247 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8887074 </td>
   <td style="text-align:right;"> 0.8878559 </td>
   <td style="text-align:right;"> 0.8895528 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8768278 </td>
   <td style="text-align:right;"> 0.8759146 </td>
   <td style="text-align:right;"> 0.8777348 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8637802 </td>
   <td style="text-align:right;"> 0.8627587 </td>
   <td style="text-align:right;"> 0.8647948 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8494730 </td>
   <td style="text-align:right;"> 0.8482870 </td>
   <td style="text-align:right;"> 0.8506505 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8338127 </td>
   <td style="text-align:right;"> 0.8324005 </td>
   <td style="text-align:right;"> 0.8352143 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9344213 </td>
   <td style="text-align:right;"> 0.9332655 </td>
   <td style="text-align:right;"> 0.9355579 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9302800 </td>
   <td style="text-align:right;"> 0.9291594 </td>
   <td style="text-align:right;"> 0.9313835 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9258877 </td>
   <td style="text-align:right;"> 0.9248045 </td>
   <td style="text-align:right;"> 0.9269559 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9212305 </td>
   <td style="text-align:right;"> 0.9201843 </td>
   <td style="text-align:right;"> 0.9222636 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9162942 </td>
   <td style="text-align:right;"> 0.9152807 </td>
   <td style="text-align:right;"> 0.9172961 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9110636 </td>
   <td style="text-align:right;"> 0.9100731 </td>
   <td style="text-align:right;"> 0.9120438 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9055234 </td>
   <td style="text-align:right;"> 0.9045388 </td>
   <td style="text-align:right;"> 0.9064985 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8996575 </td>
   <td style="text-align:right;"> 0.8986531 </td>
   <td style="text-align:right;"> 0.9006525 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8934492 </td>
   <td style="text-align:right;"> 0.8923911 </td>
   <td style="text-align:right;"> 0.8944976 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8868815 </td>
   <td style="text-align:right;"> 0.8857293 </td>
   <td style="text-align:right;"> 0.8880229 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8799368 </td>
   <td style="text-align:right;"> 0.8786469 </td>
   <td style="text-align:right;"> 0.8812140 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8725972 </td>
   <td style="text-align:right;"> 0.8711252 </td>
   <td style="text-align:right;"> 0.8740537 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7327726 </td>
   <td style="text-align:right;"> 0.7298782 </td>
   <td style="text-align:right;"> 0.7356419 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7552473 </td>
   <td style="text-align:right;"> 0.7528617 </td>
   <td style="text-align:right;"> 0.7576137 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7761297 </td>
   <td style="text-align:right;"> 0.7741887 </td>
   <td style="text-align:right;"> 0.7780565 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7954787 </td>
   <td style="text-align:right;"> 0.7939164 </td>
   <td style="text-align:right;"> 0.7970308 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8133617 </td>
   <td style="text-align:right;"> 0.8121099 </td>
   <td style="text-align:right;"> 0.8146062 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8298523 </td>
   <td style="text-align:right;"> 0.8288390 </td>
   <td style="text-align:right;"> 0.8308602 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8450275 </td>
   <td style="text-align:right;"> 0.8441770 </td>
   <td style="text-align:right;"> 0.8458738 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8589666 </td>
   <td style="text-align:right;"> 0.8582041 </td>
   <td style="text-align:right;"> 0.8597254 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8717487 </td>
   <td style="text-align:right;"> 0.8710114 </td>
   <td style="text-align:right;"> 0.8724821 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8834521 </td>
   <td style="text-align:right;"> 0.8826988 </td>
   <td style="text-align:right;"> 0.8842010 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8941534 </td>
   <td style="text-align:right;"> 0.8933639 </td>
   <td style="text-align:right;"> 0.8949373 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9039261 </td>
   <td style="text-align:right;"> 0.9030956 </td>
   <td style="text-align:right;"> 0.9047499 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.7483117 </td>
   <td style="text-align:right;"> 0.7435513 </td>
   <td style="text-align:right;"> 0.7529991 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.7960749 </td>
   <td style="text-align:right;"> 0.7929272 </td>
   <td style="text-align:right;"> 0.7991810 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.8357778 </td>
   <td style="text-align:right;"> 0.8338522 </td>
   <td style="text-align:right;"> 0.8376833 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.8683944 </td>
   <td style="text-align:right;"> 0.8673372 </td>
   <td style="text-align:right;"> 0.8694438 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.8949424 </td>
   <td style="text-align:right;"> 0.8944099 </td>
   <td style="text-align:right;"> 0.8954723 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9163940 </td>
   <td style="text-align:right;"> 0.9159745 </td>
   <td style="text-align:right;"> 0.9168115 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9336284 </td>
   <td style="text-align:right;"> 0.9330893 </td>
   <td style="text-align:right;"> 0.9341634 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9474124 </td>
   <td style="text-align:right;"> 0.9467673 </td>
   <td style="text-align:right;"> 0.9480499 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9583976 </td>
   <td style="text-align:right;"> 0.9577010 </td>
   <td style="text-align:right;"> 0.9590831 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9671280 </td>
   <td style="text-align:right;"> 0.9664253 </td>
   <td style="text-align:right;"> 0.9678163 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9740511 </td>
   <td style="text-align:right;"> 0.9733738 </td>
   <td style="text-align:right;"> 0.9747114 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9795316 </td>
   <td style="text-align:right;"> 0.9788995 </td>
   <td style="text-align:right;"> 0.9801450 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8349506 </td>
   <td style="text-align:right;"> 0.8329132 </td>
   <td style="text-align:right;"> 0.8369656 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8513636 </td>
   <td style="text-align:right;"> 0.8498049 </td>
   <td style="text-align:right;"> 0.8529075 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8662774 </td>
   <td style="text-align:right;"> 0.8651182 </td>
   <td style="text-align:right;"> 0.8674273 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8798020 </td>
   <td style="text-align:right;"> 0.8789645 </td>
   <td style="text-align:right;"> 0.8806341 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8920452 </td>
   <td style="text-align:right;"> 0.8914465 </td>
   <td style="text-align:right;"> 0.8926409 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9031109 </td>
   <td style="text-align:right;"> 0.9026542 </td>
   <td style="text-align:right;"> 0.9035655 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9130981 </td>
   <td style="text-align:right;"> 0.9126787 </td>
   <td style="text-align:right;"> 0.9135157 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9221007 </td>
   <td style="text-align:right;"> 0.9216442 </td>
   <td style="text-align:right;"> 0.9225547 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9302067 </td>
   <td style="text-align:right;"> 0.9296860 </td>
   <td style="text-align:right;"> 0.9307237 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9374980 </td>
   <td style="text-align:right;"> 0.9369133 </td>
   <td style="text-align:right;"> 0.9380774 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9440506 </td>
   <td style="text-align:right;"> 0.9434123 </td>
   <td style="text-align:right;"> 0.9446819 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9499347 </td>
   <td style="text-align:right;"> 0.9492560 </td>
   <td style="text-align:right;"> 0.9506045 </td>
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
   <td style="text-align:right;"> 0.9200262 </td>
   <td style="text-align:right;"> 0.9195546 </td>
   <td style="text-align:right;"> 0.9204952 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.9164731 </td>
   <td style="text-align:right;"> 0.9160685 </td>
   <td style="text-align:right;"> 0.9168759 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.9127698 </td>
   <td style="text-align:right;"> 0.9123997 </td>
   <td style="text-align:right;"> 0.9131384 </td>
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
   <td style="text-align:right;"> 0.8899843 </td>
   <td style="text-align:right;"> 0.8894192 </td>
   <td style="text-align:right;"> 0.8905467 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:right;"> 0.8930235 </td>
   <td style="text-align:right;"> 0.8924982 </td>
   <td style="text-align:right;"> 0.8935463 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 96 </td>
   <td style="text-align:right;"> 0.8959837 </td>
   <td style="text-align:right;"> 0.8954941 </td>
   <td style="text-align:right;"> 0.8964711 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 128 </td>
   <td style="text-align:right;"> 0.8988666 </td>
   <td style="text-align:right;"> 0.8984083 </td>
   <td style="text-align:right;"> 0.8993230 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 0.9016742 </td>
   <td style="text-align:right;"> 0.9012428 </td>
   <td style="text-align:right;"> 0.9021038 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 192 </td>
   <td style="text-align:right;"> 0.9044080 </td>
   <td style="text-align:right;"> 0.9039991 </td>
   <td style="text-align:right;"> 0.9048152 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 224 </td>
   <td style="text-align:right;"> 0.9070698 </td>
   <td style="text-align:right;"> 0.9066789 </td>
   <td style="text-align:right;"> 0.9074591 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 256 </td>
   <td style="text-align:right;"> 0.9096612 </td>
   <td style="text-align:right;"> 0.9092840 </td>
   <td style="text-align:right;"> 0.9100368 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 288 </td>
   <td style="text-align:right;"> 0.9121839 </td>
   <td style="text-align:right;"> 0.9118164 </td>
   <td style="text-align:right;"> 0.9125499 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 320 </td>
   <td style="text-align:right;"> 0.9146395 </td>
   <td style="text-align:right;"> 0.9142778 </td>
   <td style="text-align:right;"> 0.9149997 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 352 </td>
   <td style="text-align:right;"> 0.9170296 </td>
   <td style="text-align:right;"> 0.9166704 </td>
   <td style="text-align:right;"> 0.9173872 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 384 </td>
   <td style="text-align:right;"> 0.9193557 </td>
   <td style="text-align:right;"> 0.9189962 </td>
   <td style="text-align:right;"> 0.9197138 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 416 </td>
   <td style="text-align:right;"> 0.9216195 </td>
   <td style="text-align:right;"> 0.9212570 </td>
   <td style="text-align:right;"> 0.9219804 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 448 </td>
   <td style="text-align:right;"> 0.9238224 </td>
   <td style="text-align:right;"> 0.9234551 </td>
   <td style="text-align:right;"> 0.9241880 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 480 </td>
   <td style="text-align:right;"> 0.9259659 </td>
   <td style="text-align:right;"> 0.9255922 </td>
   <td style="text-align:right;"> 0.9263378 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 512 </td>
   <td style="text-align:right;"> 0.9280515 </td>
   <td style="text-align:right;"> 0.9276702 </td>
   <td style="text-align:right;"> 0.9284308 </td>
  </tr>
</tbody>
</table>

## Proportion Correct Model

```
Call:
betareg::betareg(formula = formulas_proportion_phi$M1g, data = df_filtered, 
    link = "loglog")

Quantile residuals:
     Min       1Q   Median       3Q      Max 
-11.2321  -0.7247   0.0064   0.7243   7.5994 

Coefficients (mean model with loglog link):
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           4.230e+00  3.850e-02 109.880  < 2e-16 ***
recurrenceRNN                        -4.346e-01  3.170e-02 -13.710  < 2e-16 ***
recurrenceGRU                         5.820e-01  3.223e-02  18.060  < 2e-16 ***
laminationsLaminated                 -5.424e-02  1.537e-02  -3.528 0.000419 ***
inputsize                            -1.437e-01  2.052e-03 -70.008  < 2e-16 ***
grammartypeLT                        -1.164e+00  4.322e-02 -26.941  < 2e-16 ***
grammartypeLTT                       -8.536e-01  4.155e-02 -20.546  < 2e-16 ***
grammartypeLTTO                      -1.156e+00  4.304e-02 -26.855  < 2e-16 ***
grammartypeMSO                       -2.912e+00  4.074e-02 -71.484  < 2e-16 ***
grammartypeCS                        -3.603e+00  5.077e-02 -70.976  < 2e-16 ***
grammartypeCF                        -2.354e+00  4.193e-02 -56.141  < 2e-16 ***
neurons                               9.654e-04  7.631e-06 126.517  < 2e-16 ***
layers                               -8.231e-02  9.908e-04 -83.078  < 2e-16 ***
recurrenceRNN:grammartypeLT          -1.936e-02  3.569e-02  -0.542 0.587515    
recurrenceGRU:grammartypeLT          -2.643e-01  3.614e-02  -7.313 2.61e-13 ***
recurrenceRNN:grammartypeLTT         -7.483e-02  3.392e-02  -2.206 0.027377 *  
recurrenceGRU:grammartypeLTT         -3.734e-01  3.437e-02 -10.864  < 2e-16 ***
recurrenceRNN:grammartypeLTTO        -2.977e-02  3.569e-02  -0.834 0.404156    
recurrenceGRU:grammartypeLTTO        -4.895e-01  3.607e-02 -13.572  < 2e-16 ***
recurrenceRNN:grammartypeMSO          2.753e-01  3.334e-02   8.257  < 2e-16 ***
recurrenceGRU:grammartypeMSO         -5.345e-01  3.400e-02 -15.722  < 2e-16 ***
recurrenceRNN:grammartypeCS           1.791e+00  4.209e-02  42.557  < 2e-16 ***
recurrenceGRU:grammartypeCS           1.355e+00  4.253e-02  31.854  < 2e-16 ***
recurrenceRNN:grammartypeCF           3.128e-01  3.440e-02   9.092  < 2e-16 ***
recurrenceGRU:grammartypeCF          -6.810e-02  3.484e-02  -1.955 0.050599 .  
grammartypeLT:laminationsLaminated    6.121e-02  1.546e-02   3.959 7.53e-05 ***
grammartypeLTT:laminationsLaminated   3.220e-02  1.486e-02   2.166 0.030279 *  
grammartypeLTTO:laminationsLaminated  4.081e-02  1.529e-02   2.669 0.007599 ** 
grammartypeMSO:laminationsLaminated   2.973e-02  1.484e-02   2.003 0.045173 *  
grammartypeCS:laminationsLaminated   -2.934e-02  1.462e-02  -2.008 0.044680 *  
grammartypeCF:laminationsLaminated    1.992e-02  1.425e-02   1.398 0.162182    
recurrenceRNN:laminationsLaminated   -8.820e-02  7.937e-03 -11.113  < 2e-16 ***
recurrenceGRU:laminationsLaminated   -1.456e-02  7.954e-03  -1.830 0.067191 .  
grammartypeLT:inputsize               4.383e-02  2.331e-03  18.807  < 2e-16 ***
grammartypeLTT:inputsize              2.264e-02  2.270e-03   9.973  < 2e-16 ***
grammartypeLTTO:inputsize             7.307e-02  2.303e-03  31.727  < 2e-16 ***
grammartypeMSO:inputsize              2.454e-01  2.250e-03 109.086  < 2e-16 ***
grammartypeCS:inputsize               2.938e-01  3.428e-03  85.688  < 2e-16 ***
grammartypeCF:inputsize               2.277e-01  2.409e-03  94.496  < 2e-16 ***

Phi coefficients (precision model with log link):
                                       Estimate Std. Error z value Pr(>|z|)    
(Intercept)                           2.000e+00  4.146e-02  48.241  < 2e-16 ***
recurrenceRNN                        -3.885e-01  3.409e-02 -11.396  < 2e-16 ***
recurrenceGRU                         6.842e-01  3.479e-02  19.668  < 2e-16 ***
laminationsLaminated                 -1.165e-02  1.981e-02  -0.588 0.556384    
inputsize                            -1.036e-01  2.186e-03 -47.360  < 2e-16 ***
grammartypeLT                         8.413e-01  5.300e-02  15.872  < 2e-16 ***
grammartypeLTT                        3.953e-01  5.280e-02   7.487 7.05e-14 ***
grammartypeLTTO                       7.456e-01  5.327e-02  13.998  < 2e-16 ***
grammartypeMSO                        7.046e-01  4.729e-02  14.899  < 2e-16 ***
grammartypeCS                         3.581e+00  6.818e-02  52.525  < 2e-16 ***
grammartypeCF                        -3.339e-01  5.087e-02  -6.563 5.26e-11 ***
neurons                               8.638e-04  1.199e-05  72.068  < 2e-16 ***
layers                               -4.981e-02  1.563e-03 -31.857  < 2e-16 ***
recurrenceRNN:grammartypeLT          -2.323e-01  4.439e-02  -5.232 1.68e-07 ***
recurrenceGRU:grammartypeLT          -3.885e-01  4.502e-02  -8.628  < 2e-16 ***
recurrenceRNN:grammartypeLTT          1.832e-02  4.423e-02   0.414 0.678712    
recurrenceGRU:grammartypeLTT         -1.728e-01  4.481e-02  -3.857 0.000115 ***
recurrenceRNN:grammartypeLTTO        -1.516e-01  4.477e-02  -3.385 0.000711 ***
recurrenceGRU:grammartypeLTTO        -3.561e-01  4.533e-02  -7.857 3.93e-15 ***
recurrenceRNN:grammartypeMSO         -1.053e+00  3.953e-02 -26.631  < 2e-16 ***
recurrenceGRU:grammartypeMSO         -2.512e+00  4.021e-02 -62.459  < 2e-16 ***
recurrenceRNN:grammartypeCS          -2.320e+00  5.589e-02 -41.518  < 2e-16 ***
recurrenceGRU:grammartypeCS          -2.889e+00  5.636e-02 -51.270  < 2e-16 ***
recurrenceRNN:grammartypeCF           5.061e-01  4.128e-02  12.260  < 2e-16 ***
recurrenceGRU:grammartypeCF           4.724e-01  4.183e-02  11.292  < 2e-16 ***
grammartypeLT:laminationsLaminated    3.502e-02  1.857e-02   1.885 0.059377 .  
grammartypeLTT:laminationsLaminated   3.959e-02  1.836e-02   2.156 0.031102 *  
grammartypeLTTO:laminationsLaminated  1.412e-02  1.858e-02   0.760 0.447096    
grammartypeMSO:laminationsLaminated   9.321e-02  1.662e-02   5.609 2.03e-08 ***
grammartypeCS:laminationsLaminated    1.969e-02  1.715e-02   1.148 0.250894    
grammartypeCF:laminationsLaminated    4.837e-02  1.634e-02   2.960 0.003076 ** 
recurrenceRNN:laminationsLaminated   -1.031e-01  1.467e-02  -7.033 2.03e-12 ***
recurrenceGRU:laminationsLaminated   -5.627e-02  1.473e-02  -3.819 0.000134 ***
grammartypeLT:inputsize               4.981e-02  2.786e-03  17.879  < 2e-16 ***
grammartypeLTT:inputsize              1.426e-01  2.774e-03  51.403  < 2e-16 ***
grammartypeLTTO:inputsize             8.688e-02  2.785e-03  31.198  < 2e-16 ***
grammartypeMSO:inputsize              1.522e-01  2.502e-03  60.848  < 2e-16 ***
grammartypeCS:inputsize              -8.331e-02  4.939e-03 -16.867  < 2e-16 ***
grammartypeCF:inputsize               2.051e-01  3.159e-03  64.926  < 2e-16 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

Type of estimator: ML (maximum likelihood)
Log-likelihood: 1.297e+06 on 78 Df
Pseudo R-squared: 0.2212
Number of iterations: 113 (BFGS) + 15 (Fisher scoring) 
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
   <td style="text-align:right;"> 0.9658388 </td>
   <td style="text-align:right;"> 0.9637165 </td>
   <td style="text-align:right;"> 0.9678390 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9454468 </td>
   <td style="text-align:right;"> 0.9443918 </td>
   <td style="text-align:right;"> 0.9464824 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9806261 </td>
   <td style="text-align:right;"> 0.9802104 </td>
   <td style="text-align:right;"> 0.9810331 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9193269 </td>
   <td style="text-align:right;"> 0.9167889 </td>
   <td style="text-align:right;"> 0.9217909 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8707439 </td>
   <td style="text-align:right;"> 0.8693992 </td>
   <td style="text-align:right;"> 0.8720757 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9401977 </td>
   <td style="text-align:right;"> 0.9395746 </td>
   <td style="text-align:right;"> 0.9408146 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9318477 </td>
   <td style="text-align:right;"> 0.9301828 </td>
   <td style="text-align:right;"> 0.9334743 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8844646 </td>
   <td style="text-align:right;"> 0.8833678 </td>
   <td style="text-align:right;"> 0.8855517 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9439197 </td>
   <td style="text-align:right;"> 0.9433948 </td>
   <td style="text-align:right;"> 0.9444399 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9311706 </td>
   <td style="text-align:right;"> 0.9289956 </td>
   <td style="text-align:right;"> 0.9332814 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8881879 </td>
   <td style="text-align:right;"> 0.8870263 </td>
   <td style="text-align:right;"> 0.8893383 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9366115 </td>
   <td style="text-align:right;"> 0.9360097 </td>
   <td style="text-align:right;"> 0.9372079 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8559774 </td>
   <td style="text-align:right;"> 0.8532635 </td>
   <td style="text-align:right;"> 0.8586454 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8264709 </td>
   <td style="text-align:right;"> 0.8252336 </td>
   <td style="text-align:right;"> 0.8277004 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8612365 </td>
   <td style="text-align:right;"> 0.8599424 </td>
   <td style="text-align:right;"> 0.8625196 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.7846287 </td>
   <td style="text-align:right;"> 0.7777920 </td>
   <td style="text-align:right;"> 0.7912842 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9367998 </td>
   <td style="text-align:right;"> 0.9355112 </td>
   <td style="text-align:right;"> 0.9380636 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9653886 </td>
   <td style="text-align:right;"> 0.9646644 </td>
   <td style="text-align:right;"> 0.9660983 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9058321 </td>
   <td style="text-align:right;"> 0.9038044 </td>
   <td style="text-align:right;"> 0.9078194 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8898110 </td>
   <td style="text-align:right;"> 0.8889264 </td>
   <td style="text-align:right;"> 0.8906890 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9421502 </td>
   <td style="text-align:right;"> 0.9417178 </td>
   <td style="text-align:right;"> 0.9425794 </td>
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
   <td style="text-align:right;"> 0.47867348 </td>
   <td style="text-align:right;"> 0.03147712 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 15.207027 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -0.57472803 </td>
   <td style="text-align:right;"> 0.03201085 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -17.954165 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> -1.05340151 </td>
   <td style="text-align:right;"> 0.01414228 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -74.485987 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.49803469 </td>
   <td style="text-align:right;"> 0.01683637 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 29.580883 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.31044838 </td>
   <td style="text-align:right;"> 0.01677655 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -18.504894 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> -0.80848306 </td>
   <td style="text-align:right;"> 0.00757484 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -106.732645 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.55350534 </td>
   <td style="text-align:right;"> 0.01265118 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 43.751266 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.20132778 </td>
   <td style="text-align:right;"> 0.01252446 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -16.074765 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> -0.75483313 </td>
   <td style="text-align:right;"> 0.00620275 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -121.693263 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.50844415 </td>
   <td style="text-align:right;"> 0.01682372 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 30.221861 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.08522971 </td>
   <td style="text-align:right;"> 0.01662557 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.126425 </td>
   <td style="text-align:right;"> 0.00000088 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> -0.59367386 </td>
   <td style="text-align:right;"> 0.00719932 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -82.462534 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.20340933 </td>
   <td style="text-align:right;"> 0.01098658 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 18.514338 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.04018365 </td>
   <td style="text-align:right;"> 0.01146612 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -3.504554 </td>
   <td style="text-align:right;"> 0.00132888 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> -0.24359298 </td>
   <td style="text-align:right;"> 0.00647214 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -37.637143 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -1.31241384 </td>
   <td style="text-align:right;"> 0.02794098 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -46.970937 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -1.92944332 </td>
   <td style="text-align:right;"> 0.02800294 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -68.901459 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> -0.61702948 </td>
   <td style="text-align:right;"> 0.00590080 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -104.567163 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.16588064 </td>
   <td style="text-align:right;"> 0.01389196 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 11.940762 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.50662403 </td>
   <td style="text-align:right;"> 0.01375680 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -36.827171 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> -0.67250467 </td>
   <td style="text-align:right;"> 0.00437796 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -153.611295 </td>
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
   <td style="text-align:right;"> 0.88374640 </td>
   <td style="text-align:right;"> 0.03538727 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 24.9735677 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.70841002 </td>
   <td style="text-align:right;"> 0.03380822 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 20.9537809 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.71865565 </td>
   <td style="text-align:right;"> 0.03537007 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 20.3181843 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.49829780 </td>
   <td style="text-align:right;"> 0.03296192 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 45.4554215 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.94276553 </td>
   <td style="text-align:right;"> 0.03615505 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 53.7342711 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.04570151 </td>
   <td style="text-align:right;"> 0.03332827 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 31.3758117 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.17533638 </td>
   <td style="text-align:right;"> 0.02085451 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -8.4076006 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.16509075 </td>
   <td style="text-align:right;"> 0.02330126 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.0850561 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.61455140 </td>
   <td style="text-align:right;"> 0.01945297 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 31.5916554 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.05901913 </td>
   <td style="text-align:right;"> 0.02447683 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 43.2661901 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.16195511 </td>
   <td style="text-align:right;"> 0.02006724 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 8.0706227 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.01024563 </td>
   <td style="text-align:right;"> 0.02082531 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.4919797 </td>
   <td style="text-align:right;"> 0.99896306 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.78988778 </td>
   <td style="text-align:right;"> 0.01640558 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 48.1474995 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.23435550 </td>
   <td style="text-align:right;"> 0.02213232 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 55.7716181 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.33729149 </td>
   <td style="text-align:right;"> 0.01712972 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 19.6904214 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.77964215 </td>
   <td style="text-align:right;"> 0.01942168 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 40.1428800 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 1.22410987 </td>
   <td style="text-align:right;"> 0.02445197 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 50.0618174 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.32704586 </td>
   <td style="text-align:right;"> 0.02003689 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 16.3221847 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.44446772 </td>
   <td style="text-align:right;"> 0.02081609 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 21.3521196 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.45259629 </td>
   <td style="text-align:right;"> 0.01539201 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -29.4046207 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> -0.89706402 </td>
   <td style="text-align:right;"> 0.02139183 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -41.9348838 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.90310761 </td>
   <td style="text-align:right;"> 0.01154045 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 78.2558388 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.78324189 </td>
   <td style="text-align:right;"> 0.01128761 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 69.3895123 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.74842632 </td>
   <td style="text-align:right;"> 0.01150876 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 65.0310388 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 1.22303366 </td>
   <td style="text-align:right;"> 0.01081847 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 113.0504852 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.15167821 </td>
   <td style="text-align:right;"> 0.01464298 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 10.3584247 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.73290867 </td>
   <td style="text-align:right;"> 0.01094632 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 66.9548087 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.11986572 </td>
   <td style="text-align:right;"> 0.00764260 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -15.6838926 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.15468128 </td>
   <td style="text-align:right;"> 0.00796557 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -19.4187219 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.31992605 </td>
   <td style="text-align:right;"> 0.00693135 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 46.1564025 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.75142940 </td>
   <td style="text-align:right;"> 0.01205900 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -62.3127309 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.17019894 </td>
   <td style="text-align:right;"> 0.00712897 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -23.8742633 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.03481557 </td>
   <td style="text-align:right;"> 0.00759458 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -4.5842621 </td>
   <td style="text-align:right;"> 0.00009299 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.43979177 </td>
   <td style="text-align:right;"> 0.00650155 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 67.6441316 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.63156368 </td>
   <td style="text-align:right;"> 0.01181717 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -53.4445924 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.05033322 </td>
   <td style="text-align:right;"> 0.00671180 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.4992145 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.47460733 </td>
   <td style="text-align:right;"> 0.00687840 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 68.9996740 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.59674812 </td>
   <td style="text-align:right;"> 0.01202864 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -49.6106149 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.01551765 </td>
   <td style="text-align:right;"> 0.00707747 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -2.1925413 </td>
   <td style="text-align:right;"> 0.29940874 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -1.07135545 </td>
   <td style="text-align:right;"> 0.01137001 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -94.2264286 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> -0.49012499 </td>
   <td style="text-align:right;"> 0.00588912 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -83.2254873 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.58123046 </td>
   <td style="text-align:right;"> 0.01149160 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 50.5787334 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.14802606 </td>
   <td style="text-align:right;"> 0.01222327 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 93.9213330 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.08181027 </td>
   <td style="text-align:right;"> 0.01198295 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 90.2791143 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.20815397 </td>
   <td style="text-align:right;"> 0.01201988 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 100.5129917 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 2.03284219 </td>
   <td style="text-align:right;"> 0.01207250 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 168.3862457 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.58805024 </td>
   <td style="text-align:right;"> 0.01534035 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 38.3335567 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 1.11380552 </td>
   <td style="text-align:right;"> 0.01161755 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 95.8726512 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.06621578 </td>
   <td style="text-align:right;"> 0.00732890 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.0348858 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.06012792 </td>
   <td style="text-align:right;"> 0.00738907 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 8.1374079 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.88481613 </td>
   <td style="text-align:right;"> 0.00747468 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 118.3751128 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.55997581 </td>
   <td style="text-align:right;"> 0.01206026 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -46.4314871 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.03422054 </td>
   <td style="text-align:right;"> 0.00671487 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -5.0962335 </td>
   <td style="text-align:right;"> 0.00000719 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.12634370 </td>
   <td style="text-align:right;"> 0.00698440 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 18.0894153 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.95103191 </td>
   <td style="text-align:right;"> 0.00707478 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 134.4256008 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.49376003 </td>
   <td style="text-align:right;"> 0.01181659 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -41.7853404 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.03199524 </td>
   <td style="text-align:right;"> 0.00626673 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 5.1055760 </td>
   <td style="text-align:right;"> 0.00000685 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.82468821 </td>
   <td style="text-align:right;"> 0.00713723 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 115.5474129 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.62010373 </td>
   <td style="text-align:right;"> 0.01185407 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -52.3114724 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.09434846 </td>
   <td style="text-align:right;"> 0.00633707 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -14.8883382 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -1.44479195 </td>
   <td style="text-align:right;"> 0.01190732 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -121.3364430 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> -0.91903667 </td>
   <td style="text-align:right;"> 0.00643651 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -142.7849246 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.52575528 </td>
   <td style="text-align:right;"> 0.01144585 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 45.9341392 </td>
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
   <td style="text-align:right;"> 0.9683069 </td>
   <td style="text-align:right;"> 0.9674310 </td>
   <td style="text-align:right;"> 0.9691597 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9654259 </td>
   <td style="text-align:right;"> 0.9644637 </td>
   <td style="text-align:right;"> 0.9663624 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9154608 </td>
   <td style="text-align:right;"> 0.9142715 </td>
   <td style="text-align:right;"> 0.9166344 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9132270 </td>
   <td style="text-align:right;"> 0.9119822 </td>
   <td style="text-align:right;"> 0.9144551 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9257277 </td>
   <td style="text-align:right;"> 0.9248265 </td>
   <td style="text-align:right;"> 0.9266185 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9216000 </td>
   <td style="text-align:right;"> 0.9206388 </td>
   <td style="text-align:right;"> 0.9225502 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9229476 </td>
   <td style="text-align:right;"> 0.9218816 </td>
   <td style="text-align:right;"> 0.9239996 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9193410 </td>
   <td style="text-align:right;"> 0.9182049 </td>
   <td style="text-align:right;"> 0.9204619 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8526106 </td>
   <td style="text-align:right;"> 0.8512410 </td>
   <td style="text-align:right;"> 0.8539686 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8444219 </td>
   <td style="text-align:right;"> 0.8429823 </td>
   <td style="text-align:right;"> 0.8458495 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9253285 </td>
   <td style="text-align:right;"> 0.9247935 </td>
   <td style="text-align:right;"> 0.9258598 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9163915 </td>
   <td style="text-align:right;"> 0.9157937 </td>
   <td style="text-align:right;"> 0.9169852 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9182306 </td>
   <td style="text-align:right;"> 0.9176241 </td>
   <td style="text-align:right;"> 0.9188329 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9126874 </td>
   <td style="text-align:right;"> 0.9120314 </td>
   <td style="text-align:right;"> 0.9133387 </td>
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
   <td style="text-align:right;"> 0.08849007 </td>
   <td style="text-align:right;"> 0.01377295 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.424916 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.02728320 </td>
   <td style="text-align:right;"> 0.00762010 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.580425 </td>
   <td style="text-align:right;"> 0.00034304 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.05628958 </td>
   <td style="text-align:right;"> 0.00628844 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 8.951274 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.04767570 </td>
   <td style="text-align:right;"> 0.00727335 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 6.554849 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.05876327 </td>
   <td style="text-align:right;"> 0.00613519 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 9.578071 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.11783249 </td>
   <td style="text-align:right;"> 0.00520367 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 22.644096 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.06857469 </td>
   <td style="text-align:right;"> 0.00465931 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 14.717767 </td>
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
   <td style="text-align:right;"> 1.00889679 </td>
   <td style="text-align:right;"> 0.01592853 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 63.3389722 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.87392097 </td>
   <td style="text-align:right;"> 0.01546461 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 56.5110291 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.91215250 </td>
   <td style="text-align:right;"> 0.01585650 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 57.5254482 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 1.59958795 </td>
   <td style="text-align:right;"> 0.01498767 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 106.7269566 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.87949345 </td>
   <td style="text-align:right;"> 0.01461830 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 60.1638802 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.97409626 </td>
   <td style="text-align:right;"> 0.01461736 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 66.6396991 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.13497581 </td>
   <td style="text-align:right;"> 0.00973802 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -13.8607062 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.09674429 </td>
   <td style="text-align:right;"> 0.01034830 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -9.3488112 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.59069116 </td>
   <td style="text-align:right;"> 0.00896676 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 65.8756862 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.12940334 </td>
   <td style="text-align:right;"> 0.00832878 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -15.5368937 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.03480053 </td>
   <td style="text-align:right;"> 0.00832514 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -4.1801744 </td>
   <td style="text-align:right;"> 0.00057928 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.03823153 </td>
   <td style="text-align:right;"> 0.00961766 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.9751371 </td>
   <td style="text-align:right;"> 0.00137143 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.72566698 </td>
   <td style="text-align:right;"> 0.00811373 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 89.4368664 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.00557247 </td>
   <td style="text-align:right;"> 0.00740010 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.7530264 </td>
   <td style="text-align:right;"> 0.98911929 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.10017528 </td>
   <td style="text-align:right;"> 0.00739700 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 13.5426842 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.68743545 </td>
   <td style="text-align:right;"> 0.00884007 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 77.7636102 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.03265906 </td>
   <td style="text-align:right;"> 0.00819114 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -3.9871208 </td>
   <td style="text-align:right;"> 0.00130570 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.06194376 </td>
   <td style="text-align:right;"> 0.00818253 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 7.5702463 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.72009450 </td>
   <td style="text-align:right;"> 0.00633077 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -113.7451886 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.62549169 </td>
   <td style="text-align:right;"> 0.00635551 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -98.4172603 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> 0.09460281 </td>
   <td style="text-align:right;"> 0.00541342 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 17.4756240 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.94768992 </td>
   <td style="text-align:right;"> 0.01607933 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 58.9383861 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.84172049 </td>
   <td style="text-align:right;"> 0.01558137 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 54.0209582 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.87133813 </td>
   <td style="text-align:right;"> 0.01600201 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 54.4517982 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 1.56986115 </td>
   <td style="text-align:right;"> 0.01508037 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 104.0996694 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.90883587 </td>
   <td style="text-align:right;"> 0.01471956 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 61.7434330 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SL - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.95418088 </td>
   <td style="text-align:right;"> 0.01472359 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 64.8062645 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTT </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.10596944 </td>
   <td style="text-align:right;"> 0.00986840 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -10.7382636 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.07635179 </td>
   <td style="text-align:right;"> 0.01051883 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -7.2585788 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.62217123 </td>
   <td style="text-align:right;"> 0.00906314 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 68.6485361 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.03885405 </td>
   <td style="text-align:right;"> 0.00844523 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -4.6007119 </td>
   <td style="text-align:right;"> 0.00008600 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.00649095 </td>
   <td style="text-align:right;"> 0.00844680 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 0.7684514 </td>
   <td style="text-align:right;"> 0.98788855 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - LTTO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.02961765 </td>
   <td style="text-align:right;"> 0.00973949 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 3.0409865 </td>
   <td style="text-align:right;"> 0.03808060 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.72814066 </td>
   <td style="text-align:right;"> 0.00814534 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 89.3934788 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.06711539 </td>
   <td style="text-align:right;"> 0.00744731 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 9.0120341 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTT - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.11246039 </td>
   <td style="text-align:right;"> 0.00745308 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 15.0891252 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - MSO </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.69852302 </td>
   <td style="text-align:right;"> 0.00892719 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 78.2466832 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.03749774 </td>
   <td style="text-align:right;"> 0.00829793 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.5189282 </td>
   <td style="text-align:right;"> 0.00012645 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LTTO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.08284274 </td>
   <td style="text-align:right;"> 0.00829431 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 9.9879027 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CS </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.66102528 </td>
   <td style="text-align:right;"> 0.00631334 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -104.7028962 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MSO - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.61568027 </td>
   <td style="text-align:right;"> 0.00635495 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -96.8819696 </td>
   <td style="text-align:right;"> 0.00000000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> CS - CF </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.04534500 </td>
   <td style="text-align:right;"> 0.00542802 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 8.3538776 </td>
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
   <td style="text-align:right;"> 0.9136335 </td>
   <td style="text-align:right;"> 0.9123956 </td>
   <td style="text-align:right;"> 0.9148548 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> FFN </td>
   <td style="text-align:right;"> 0.9109403 </td>
   <td style="text-align:right;"> 0.9096210 </td>
   <td style="text-align:right;"> 0.9122413 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.9038687 </td>
   <td style="text-align:right;"> 0.9032804 </td>
   <td style="text-align:right;"> 0.9044536 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.8922588 </td>
   <td style="text-align:right;"> 0.8916148 </td>
   <td style="text-align:right;"> 0.8928992 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9481427 </td>
   <td style="text-align:right;"> 0.9478149 </td>
   <td style="text-align:right;"> 0.9484686 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.9457310 </td>
   <td style="text-align:right;"> 0.9453896 </td>
   <td style="text-align:right;"> 0.9460703 </td>
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
   <td style="text-align:right;"> 0.03216090 </td>
   <td style="text-align:right;"> 0.00743544 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 4.325353 </td>
   <td style="text-align:right;"> 1.523e-05 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> RNN </td>
   <td style="text-align:right;"> 0.12036566 </td>
   <td style="text-align:right;"> 0.00381133 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 31.580994 </td>
   <td style="text-align:right;"> 0.000e+00 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dense - Laminated </td>
   <td style="text-align:left;"> GRU </td>
   <td style="text-align:right;"> 0.04672016 </td>
   <td style="text-align:right;"> 0.00380122 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 12.290840 </td>
   <td style="text-align:right;"> 0.000e+00 </td>
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
   <td style="text-align:right;"> 0.1124025 </td>
   <td style="text-align:right;"> 0.00845715 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 13.29081 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.5284203 </td>
   <td style="text-align:right;"> 0.00849445 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -62.20771 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Dense </td>
   <td style="text-align:right;"> -0.6408228 </td>
   <td style="text-align:right;"> 0.00387416 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -165.40930 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - RNN </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> 0.2006072 </td>
   <td style="text-align:right;"> 0.00865726 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> 23.17213 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> FFN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.5138611 </td>
   <td style="text-align:right;"> 0.00870525 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -59.02889 </td>
   <td style="text-align:right;"> 0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RNN - GRU </td>
   <td style="text-align:left;"> Laminated </td>
   <td style="text-align:right;"> -0.7144683 </td>
   <td style="text-align:right;"> 0.00382808 </td>
   <td style="text-align:right;"> Inf </td>
   <td style="text-align:right;"> -186.63873 </td>
   <td style="text-align:right;"> 0 </td>
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
   <td style="text-align:right;"> 0.9830181 </td>
   <td style="text-align:right;"> 0.9823698 </td>
   <td style="text-align:right;"> 0.9836428 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9804198 </td>
   <td style="text-align:right;"> 0.9797394 </td>
   <td style="text-align:right;"> 0.9810776 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9774285 </td>
   <td style="text-align:right;"> 0.9767172 </td>
   <td style="text-align:right;"> 0.9781184 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9739864 </td>
   <td style="text-align:right;"> 0.9732444 </td>
   <td style="text-align:right;"> 0.9747080 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9700274 </td>
   <td style="text-align:right;"> 0.9692527 </td>
   <td style="text-align:right;"> 0.9707829 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9654766 </td>
   <td style="text-align:right;"> 0.9646622 </td>
   <td style="text-align:right;"> 0.9662726 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9602492 </td>
   <td style="text-align:right;"> 0.9593800 </td>
   <td style="text-align:right;"> 0.9611002 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9542492 </td>
   <td style="text-align:right;"> 0.9532981 </td>
   <td style="text-align:right;"> 0.9551814 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9473687 </td>
   <td style="text-align:right;"> 0.9462925 </td>
   <td style="text-align:right;"> 0.9484239 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9394866 </td>
   <td style="text-align:right;"> 0.9382244 </td>
   <td style="text-align:right;"> 0.9407237 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9304680 </td>
   <td style="text-align:right;"> 0.9289414 </td>
   <td style="text-align:right;"> 0.9319630 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> SL </td>
   <td style="text-align:right;"> 0.9201634 </td>
   <td style="text-align:right;"> 0.9182773 </td>
   <td style="text-align:right;"> 0.9220079 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9455515 </td>
   <td style="text-align:right;"> 0.9444855 </td>
   <td style="text-align:right;"> 0.9465976 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9400086 </td>
   <td style="text-align:right;"> 0.9389424 </td>
   <td style="text-align:right;"> 0.9410567 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9339213 </td>
   <td style="text-align:right;"> 0.9328596 </td>
   <td style="text-align:right;"> 0.9349669 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9272407 </td>
   <td style="text-align:right;"> 0.9261860 </td>
   <td style="text-align:right;"> 0.9282809 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9199141 </td>
   <td style="text-align:right;"> 0.9188653 </td>
   <td style="text-align:right;"> 0.9209500 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9118854 </td>
   <td style="text-align:right;"> 0.9108348 </td>
   <td style="text-align:right;"> 0.9129242 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.9030951 </td>
   <td style="text-align:right;"> 0.9020255 </td>
   <td style="text-align:right;"> 0.9041537 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8934802 </td>
   <td style="text-align:right;"> 0.8923614 </td>
   <td style="text-align:right;"> 0.8945880 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8829746 </td>
   <td style="text-align:right;"> 0.8817624 </td>
   <td style="text-align:right;"> 0.8841751 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8715093 </td>
   <td style="text-align:right;"> 0.8701467 </td>
   <td style="text-align:right;"> 0.8728587 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8590132 </td>
   <td style="text-align:right;"> 0.8574340 </td>
   <td style="text-align:right;"> 0.8605763 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LT </td>
   <td style="text-align:right;"> 0.8454130 </td>
   <td style="text-align:right;"> 0.8435460 </td>
   <td style="text-align:right;"> 0.8472598 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9560691 </td>
   <td style="text-align:right;"> 0.9552826 </td>
   <td style="text-align:right;"> 0.9568420 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9505581 </td>
   <td style="text-align:right;"> 0.9497572 </td>
   <td style="text-align:right;"> 0.9513465 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9443761 </td>
   <td style="text-align:right;"> 0.9435662 </td>
   <td style="text-align:right;"> 0.9451746 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9374469 </td>
   <td style="text-align:right;"> 0.9366334 </td>
   <td style="text-align:right;"> 0.9382502 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9296871 </td>
   <td style="text-align:right;"> 0.9288741 </td>
   <td style="text-align:right;"> 0.9304910 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9210059 </td>
   <td style="text-align:right;"> 0.9201944 </td>
   <td style="text-align:right;"> 0.9218095 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9113050 </td>
   <td style="text-align:right;"> 0.9104893 </td>
   <td style="text-align:right;"> 0.9121135 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.9004784 </td>
   <td style="text-align:right;"> 0.8996424 </td>
   <td style="text-align:right;"> 0.9013079 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8884132 </td>
   <td style="text-align:right;"> 0.8875253 </td>
   <td style="text-align:right;"> 0.8892944 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8749894 </td>
   <td style="text-align:right;"> 0.8740009 </td>
   <td style="text-align:right;"> 0.8759708 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8600819 </td>
   <td style="text-align:right;"> 0.8589288 </td>
   <td style="text-align:right;"> 0.8612263 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTT </td>
   <td style="text-align:right;"> 0.8435609 </td>
   <td style="text-align:right;"> 0.8421697 </td>
   <td style="text-align:right;"> 0.8449411 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9427897 </td>
   <td style="text-align:right;"> 0.9417106 </td>
   <td style="text-align:right;"> 0.9438494 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9387341 </td>
   <td style="text-align:right;"> 0.9376806 </td>
   <td style="text-align:right;"> 0.9397704 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9344012 </td>
   <td style="text-align:right;"> 0.9333760 </td>
   <td style="text-align:right;"> 0.9354111 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9297734 </td>
   <td style="text-align:right;"> 0.9287771 </td>
   <td style="text-align:right;"> 0.9307563 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9248325 </td>
   <td style="text-align:right;"> 0.9238622 </td>
   <td style="text-align:right;"> 0.9257910 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9195592 </td>
   <td style="text-align:right;"> 0.9186067 </td>
   <td style="text-align:right;"> 0.9205011 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9139336 </td>
   <td style="text-align:right;"> 0.9129833 </td>
   <td style="text-align:right;"> 0.9148739 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9079345 </td>
   <td style="text-align:right;"> 0.9069625 </td>
   <td style="text-align:right;"> 0.9088969 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.9015402 </td>
   <td style="text-align:right;"> 0.9005132 </td>
   <td style="text-align:right;"> 0.9025572 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8947282 </td>
   <td style="text-align:right;"> 0.8936056 </td>
   <td style="text-align:right;"> 0.8958396 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8874749 </td>
   <td style="text-align:right;"> 0.8862116 </td>
   <td style="text-align:right;"> 0.8887249 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> LTTO </td>
   <td style="text-align:right;"> 0.8797562 </td>
   <td style="text-align:right;"> 0.8783056 </td>
   <td style="text-align:right;"> 0.8811907 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7672799 </td>
   <td style="text-align:right;"> 0.7643655 </td>
   <td style="text-align:right;"> 0.7701640 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.7871883 </td>
   <td style="text-align:right;"> 0.7847802 </td>
   <td style="text-align:right;"> 0.7895733 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8056153 </td>
   <td style="text-align:right;"> 0.8036459 </td>
   <td style="text-align:right;"> 0.8075674 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8226309 </td>
   <td style="text-align:right;"> 0.8210328 </td>
   <td style="text-align:right;"> 0.8242164 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8383099 </td>
   <td style="text-align:right;"> 0.8370149 </td>
   <td style="text-align:right;"> 0.8395956 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8527295 </td>
   <td style="text-align:right;"> 0.8516683 </td>
   <td style="text-align:right;"> 0.8537837 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8659678 </td>
   <td style="text-align:right;"> 0.8650699 </td>
   <td style="text-align:right;"> 0.8668601 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8781025 </td>
   <td style="text-align:right;"> 0.8773005 </td>
   <td style="text-align:right;"> 0.8788997 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8892100 </td>
   <td style="text-align:right;"> 0.8884470 </td>
   <td style="text-align:right;"> 0.8899681 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.8993641 </td>
   <td style="text-align:right;"> 0.8986008 </td>
   <td style="text-align:right;"> 0.9001219 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9086359 </td>
   <td style="text-align:right;"> 0.9078513 </td>
   <td style="text-align:right;"> 0.9094142 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> MSO </td>
   <td style="text-align:right;"> 0.9170934 </td>
   <td style="text-align:right;"> 0.9162797 </td>
   <td style="text-align:right;"> 0.9178994 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.8464326 </td>
   <td style="text-align:right;"> 0.8429696 </td>
   <td style="text-align:right;"> 0.8498263 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.8663304 </td>
   <td style="text-align:right;"> 0.8639406 </td>
   <td style="text-align:right;"> 0.8686814 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.8838291 </td>
   <td style="text-align:right;"> 0.8822956 </td>
   <td style="text-align:right;"> 0.8853440 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.8991719 </td>
   <td style="text-align:right;"> 0.8982906 </td>
   <td style="text-align:right;"> 0.9000461 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9125895 </td>
   <td style="text-align:right;"> 0.9121187 </td>
   <td style="text-align:right;"> 0.9130580 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9242974 </td>
   <td style="text-align:right;"> 0.9238542 </td>
   <td style="text-align:right;"> 0.9247381 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9344938 </td>
   <td style="text-align:right;"> 0.9338575 </td>
   <td style="text-align:right;"> 0.9351241 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9433591 </td>
   <td style="text-align:right;"> 0.9425353 </td>
   <td style="text-align:right;"> 0.9441715 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9510563 </td>
   <td style="text-align:right;"> 0.9500923 </td>
   <td style="text-align:right;"> 0.9520020 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9577309 </td>
   <td style="text-align:right;"> 0.9566741 </td>
   <td style="text-align:right;"> 0.9587626 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9635129 </td>
   <td style="text-align:right;"> 0.9624032 </td>
   <td style="text-align:right;"> 0.9645904 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CS </td>
   <td style="text-align:right;"> 0.9685170 </td>
   <td style="text-align:right;"> 0.9673868 </td>
   <td style="text-align:right;"> 0.9696086 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8771830 </td>
   <td style="text-align:right;"> 0.8754957 </td>
   <td style="text-align:right;"> 0.8788492 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8864920 </td>
   <td style="text-align:right;"> 0.8851623 </td>
   <td style="text-align:right;"> 0.8878073 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.8951382 </td>
   <td style="text-align:right;"> 0.8941122 </td>
   <td style="text-align:right;"> 0.8961548 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9031622 </td>
   <td style="text-align:right;"> 0.9023837 </td>
   <td style="text-align:right;"> 0.9039348 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 5 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9106033 </td>
   <td style="text-align:right;"> 0.9100087 </td>
   <td style="text-align:right;"> 0.9111942 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9174990 </td>
   <td style="text-align:right;"> 0.9170120 </td>
   <td style="text-align:right;"> 0.9179833 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9238853 </td>
   <td style="text-align:right;"> 0.9234243 </td>
   <td style="text-align:right;"> 0.9243436 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9297963 </td>
   <td style="text-align:right;"> 0.9292999 </td>
   <td style="text-align:right;"> 0.9302894 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9352645 </td>
   <td style="text-align:right;"> 0.9347037 </td>
   <td style="text-align:right;"> 0.9358207 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 10 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9403206 </td>
   <td style="text-align:right;"> 0.9396888 </td>
   <td style="text-align:right;"> 0.9409460 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9449935 </td>
   <td style="text-align:right;"> 0.9442948 </td>
   <td style="text-align:right;"> 0.9456836 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:left;"> CF </td>
   <td style="text-align:right;"> 0.9493104 </td>
   <td style="text-align:right;"> 0.9485535 </td>
   <td style="text-align:right;"> 0.9500565 </td>
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
   <td style="text-align:right;"> 0.9358811 </td>
   <td style="text-align:right;"> 0.9354557 </td>
   <td style="text-align:right;"> 0.9363038 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 0.9305754 </td>
   <td style="text-align:right;"> 0.9301960 </td>
   <td style="text-align:right;"> 0.9309528 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 0.9248485 </td>
   <td style="text-align:right;"> 0.9244888 </td>
   <td style="text-align:right;"> 0.9252065 </td>
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
   <td style="text-align:right;"> 0.9025975 </td>
   <td style="text-align:right;"> 0.9020382 </td>
   <td style="text-align:right;"> 0.9031539 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 64 </td>
   <td style="text-align:right;"> 0.9054157 </td>
   <td style="text-align:right;"> 0.9048959 </td>
   <td style="text-align:right;"> 0.9059329 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 96 </td>
   <td style="text-align:right;"> 0.9081566 </td>
   <td style="text-align:right;"> 0.9076720 </td>
   <td style="text-align:right;"> 0.9086387 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 128 </td>
   <td style="text-align:right;"> 0.9108220 </td>
   <td style="text-align:right;"> 0.9103685 </td>
   <td style="text-align:right;"> 0.9112733 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 160 </td>
   <td style="text-align:right;"> 0.9134138 </td>
   <td style="text-align:right;"> 0.9129870 </td>
   <td style="text-align:right;"> 0.9138386 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 192 </td>
   <td style="text-align:right;"> 0.9159337 </td>
   <td style="text-align:right;"> 0.9155294 </td>
   <td style="text-align:right;"> 0.9163363 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 224 </td>
   <td style="text-align:right;"> 0.9183837 </td>
   <td style="text-align:right;"> 0.9179974 </td>
   <td style="text-align:right;"> 0.9187683 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 256 </td>
   <td style="text-align:right;"> 0.9207654 </td>
   <td style="text-align:right;"> 0.9203931 </td>
   <td style="text-align:right;"> 0.9211361 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 288 </td>
   <td style="text-align:right;"> 0.9230805 </td>
   <td style="text-align:right;"> 0.9227182 </td>
   <td style="text-align:right;"> 0.9234412 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 320 </td>
   <td style="text-align:right;"> 0.9253308 </td>
   <td style="text-align:right;"> 0.9249750 </td>
   <td style="text-align:right;"> 0.9256851 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 352 </td>
   <td style="text-align:right;"> 0.9275179 </td>
   <td style="text-align:right;"> 0.9271653 </td>
   <td style="text-align:right;"> 0.9278689 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 384 </td>
   <td style="text-align:right;"> 0.9296433 </td>
   <td style="text-align:right;"> 0.9292912 </td>
   <td style="text-align:right;"> 0.9299938 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 416 </td>
   <td style="text-align:right;"> 0.9317088 </td>
   <td style="text-align:right;"> 0.9313548 </td>
   <td style="text-align:right;"> 0.9320611 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 448 </td>
   <td style="text-align:right;"> 0.9337158 </td>
   <td style="text-align:right;"> 0.9333580 </td>
   <td style="text-align:right;"> 0.9340717 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 480 </td>
   <td style="text-align:right;"> 0.9356659 </td>
   <td style="text-align:right;"> 0.9353029 </td>
   <td style="text-align:right;"> 0.9360269 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 512 </td>
   <td style="text-align:right;"> 0.9375605 </td>
   <td style="text-align:right;"> 0.9371912 </td>
   <td style="text-align:right;"> 0.9379277 </td>
  </tr>
</tbody>
</table>



