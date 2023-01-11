using DataFrames
using StatsBase
using CSV 
using Plots

normaliseScores(x) = (maximum(x) .- x)/(maximum(x) - minimum(x)) 
normaliseScores(x, y) = (maximum(y) .- x)/(maximum(y) - minimum(y)) 

df1 = CSV.read(string("../data/", "permuteModelData_1layer_3grammars.csv"), DataFrame)
df2 = CSV.read(string("../data/", "permuteModelData_2layer_3grammars.csv"), DataFrame)

plot([df1.change0.*normaliseScores(df1.scores, vcat(df1.scores, df2.scores)), df2.change0.*normaliseScores(df2.scores, vcat(df1.scores, df2.scores))])

dfhalf1 = df1[2:2:100, :]
dfhalf2 = df2[1:50, :]
plot([dfhalf1.change0.*normaliseScores(dfhalf1.scores, vcat(dfhalf1.scores, dfhalf2.scores)), dfhalf2.change0.*normaliseScores(dfhalf2.scores, vcat(dfhalf1.scores, dfhalf2.scores))])

plot([normaliseScores(dfhalf1.scores, vcat(dfhalf1.scores, dfhalf2.scores)), normaliseScores(dfhalf2.scores, vcat(dfhalf1.scores, dfhalf2.scores))])