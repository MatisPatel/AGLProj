using Flux 

dat = ["abc", "abc"]

encodedStrings = [Float32.(Flux.onehotbatch(string, 'a':'c', 'a')) for string in dat] 

# extend to 9x1 vectors and put into batch of size 2
test_X = cat(vec.(encodedStrings)..., dims=2)

# check with FFN which I have working in the full script
modelFFN = Chain(Dense(9, 9, relu), Dense(9, 3, sigmoid))

batchOutFFN = modelFFN(test_X) # as expected 3x2 outpus with identical columns 

modelRNN = Chain(RNN(3=>6, relu), Dense(6, 3, sigmoid))

singleOutRNN = modelRNN(encodedStrings[1]) 
# I think this is 3x3 with each column being the 
# output at that point in the sequence 
# so [:, 3] will have the final output for loss computation. 

# so simply adding a batch dimension doesnt work [features, time, batch]
# these outputs aren't the same so it works but isn't right
batchOutRNN = modelRNN(cat(encodedStrings..., dims=3))
Flux.reset!(modelRNN)
# trying to permute [feature, batch, time] as docs say
batchOutRNN = modelRNN(permutedims(cat(encodedStrings..., dims=3), (1, 3, 2)))
Flux.reset!(modelRNN)
# trying [time, batch, feature]
batchOutRNN = modelRNN(permutedims(cat(encodedStrings..., dims=3), (2, 3, 1)))
Flux.reset!(modelRNN)
# why do these two permutations both seemingly work with the same output but?

# larger bantches which wouldnt work earlier. 
dat = ["abc", "abc", "cba", "cba", "acb", "acb"]

encodedStrings = [Float32.(Flux.onehotbatch(string, 'a':'c', 'a')) for string in dat] 
# think this is right
batchOutRNN = modelRNN(permutedims(cat(encodedStrings..., dims=3), (1, 3, 2)))
Flux.reset!(modelRNN)
# still confused why this works
batchOutRNN = modelRNN(permutedims(cat(encodedStrings..., dims=3), (2, 3, 1)))
Flux.reset!(modelRNN)