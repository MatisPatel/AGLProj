## Functions to export
using Combinatorics, CSV, DataFrames, IterTools, LinearAlgebra, Logging, Random, SHA, StatsBase, YAML

#==================================================================================#
# Grammar functions

# Check full transitions of grammar - check whether every state can be transitioned out of, no 0s on any rows
function check_full_transitions(grammar)
    # println("check trans")
    row_sums = sum(grammar, dims=1)
    full_trans = prod(row_sums .!= 0)
    return full_trans
end

# Generate Strictly k-Local grammars
function generate_skl_grammar(N::Int, K::Int, deterministic::Bool=true, num_transitions_per_kgram::Int=1, rng_obj::AbstractRNG=Random.MersenneTwister(0))
    """ 
    Function to generate a strictly k-local grammar.
    Grammaticality can be determined by a 'scanner' that checks substrings of length K.
    
    K=1 is the case where valid strings contain only certain letters. The transitions do not matter.
    K=2 is the case where the validity depends on 2-letter transitions. This can be formulated with an ordinary adjacency matrix with 1 transition per row. Ungrammaticality is implemented by shuffling the 1s in each row.
    K=3 is the case where the validity depends on 3-letter transitions. This can be formulated with an adjacency matrix between bigrams and monograms. Grammaticality as above.

    N is the alphabet size 
    K is the length of the kgrams. 1 is regular grammar, 2+ is a context-sensitive grammar because the validity of transitions between two letters depends on whether they are in a tuple or between two tuples.
    deterministic is whether the states can be transitioned out of deterministically or not. Essentially, does the grammar have a single 1 in each row (deterministic=true) or multiple (deterministic=false). Of course, you don't get many strings if you have a single 1 in each row, so this is not a very interesting case.
    rng_obj is the random number generator to use. Default is MersenneTwister(0), but you can set this to any other RNG.
    """
    if deterministic
        @assert num_transitions_per_kgram == 1 "If deterministic, num_transitions_per_kgram must be 1"
    else
        # @assert num_transitions_per_kgram <= div(N, 2) "If not deterministic, num_transitions_per_kgram must be less than half the alphabet size, so that the ungrammatical case can be well defined."
        @assert K > 1 "If not deterministic, K must be greater than 1, otherwise the grammar is not well defined."
    end

    if K == 1
        if N % 2 == 1
            error("ERROR: N must be even for K=1")
        end
        grammar = zeros(Int64, N, N)
        ungrammar = zeros(Int64, N, N)
        idxs = sample(rng_obj, 1:N, N, replace = false)
        for i in idxs[1:div(N, 2)] # only have ones for half the letters, so you only get strings containing those.
            for j in idxs[1:div(N, 2)]
                grammar[i, j] = 1
            end
        end
        for i in idxs[div(N, 2)+1:end] # the ungrammatical case is for the remaining letters
            for j in idxs[div(N, 2)+1:end]
                ungrammar[i, j] = 1
            end
        end
    else  # for K > 1
        num_cols = N # transition to the next character
        num_rows = N^(K-1) # transition from the previous k-1-gram
        grammar = zeros(Int64, num_rows, num_cols) # initialise empty grammar
        ungrammar = zeros(Int64, num_rows, num_cols) # initialise empty ungrammatical grammar
        while !check_full_transitions(grammar) && !check_full_transitions(ungrammar) # check that all states can be transitioned out of
            for row in axes(grammar, 1) # for every row in the grammar
                idxs = sample(rng_obj, 1:num_cols, num_transitions_per_kgram, replace = false) # sample a number of indexes for transitions to take place
                for col in idxs
                    grammar[row, col] = 1 # replace the 0s
                end
                remaining_cols = setdiff(1:num_cols, idxs) # determine the remaining columns
                if length(remaining_cols) > num_transitions_per_kgram
                    ungram_idxs = sample(rng_obj, remaining_cols, num_transitions_per_kgram, replace = false) # sample new indexes if there are enough free spots
                else
                    ungram_idxs = remaining_cols # otherwise just take the remaining columns
                end
                for col in ungram_idxs
                    ungrammar[row, col] = 1 # replace the 0s for the ungrammar
                end
            end
        end
    end
    output_dict = Dict(
        "grammar"=>grammar,
        "ungrammar"=>ungrammar,
        "kgram_size"=>K,
        "deterministic"=>deterministic,
        "num_transitions_per_kgram"=>num_transitions_per_kgram,
    )
    return output_dict
end

function _repeated_perm_from_index(index::Int, N::Int, K::Int, next_idx::Int)
    """
    Get the letter indexes in the alphabet from some k-gram index number (i.e., row in a grammar)
    """
    index = index - 1 # switch to 0-index
    seq = []
    for i in 0:K-1
        power = N^(K - i - 1)
        digit = div(index, power)
        push!(seq, digit + 1)
        index = mod(index, power)
    end
    push!(seq, next_idx) # add the next index
    return seq
end

function _find_repeated_perm_indx(X::Vector, N::Int)
    """
    Find the index of the previous (k-1)-gram in the string.

    X is the list of indices
     N is the maximum index, i.e., the length of the alphabet
    """
    k = length(X)
    index = 1
    for (i, val) in enumerate(X)
        i = i - 1
        index = index + (val - 1) * (N^(k - i - 1))
    end
    return index
end

function generate_ltk_grammar(N::Int, K::Int, num_constraints::Int, deterministic::Bool=true, num_transitions_per_kgram::Int=1, rng_obj::AbstractRNG=Random.MersenneTwister(0))
    """
    Function to generate locally k-testable grammars.
    Grammaticality can be determined by a 'scanner' that tracks if a k-gram occurs (a constraint)
    Implemented here as the num_constraints set of k-grams for SKl grammars that must be present in the string.
    The ungrammatical grammar is where those k-grams are not in the string.

    N is the alphabet size
    K is the length of the kgrams.
    num_constraints is the number of constraints to be generated. 
    """
    grammar = generate_skl_grammar(N, K, deterministic, num_transitions_per_kgram, rng_obj)["grammar"]
    if num_constraints > sum(grammar)
        error("ERROR: num_constraints must be less than the number of rows in the grammar. If it is equal, this is just an SLk grammar.")
    end
    if num_constraints > div(N, 2) && K==1
        error("ERROR: num_constraints must be less than half of the alphabet size when K=1. Otherwise we cannot generate an ungrammatical constriants.")
    end
    if K > 1
        k_grams = findall(x->x==1, grammar)
        gramm_constraints = sample(rng_obj, k_grams, num_constraints, replace = false)
        constraints = [_repeated_perm_from_index(gramm_constraints[i][1], N, (K-1), gramm_constraints[i][2]) for i in 1:num_constraints] # this converts the k-gram index to the letter indexes in the alphabet
    else
        k_grams = [i for (i, j) in enumerate(diag(grammar)) if j == 1] # get the indexes of the k-grams from the diagonal
        constraints = sample(rng_obj, k_grams, num_constraints, replace = false)
    end
    
    output_dict = Dict(
        "grammar"=>grammar,
        "locally_testable_constraints"=>constraints,
        "kgram_size"=>K,
        "deterministic"=>deterministic,
        "num_transitions_per_kgram"=>num_transitions_per_kgram,
    )
    return output_dict
end

function generate_lttk_grammar(N::Int, K::Int, num_constraints::Int, T::Int, deterministic::Bool=true, num_transitions_per_kgram::Int=1, rng_obj::AbstractRNG=Random.MersenneTwister(0))
    """
    Function to generate locally t-threshold k-testable grammars.
    Grammaticality can be determined by a 'scanner' that tracks if the number of times a k-gram occurs (a constraint) exceeds a threshold T.
    Implemented here as the num_constraints length set of rows in the adjacency matrix generated for SKl grammars that must be present 1<times<T in the string.
    The ungrammatical strings contain more than T occurrences k-grams.

    N is the alphabet size
    K is the length of the kgrams.
    num_constraints is the number of constraints to be generated. 
    T is the threshold for the number of times a k-gram can occur in the string. Here, we fix it as the same for every constraint. Best not to set the threshold too high.
    """
    ltk_dict = generate_ltk_grammar(N, K, num_constraints, deterministic, num_transitions_per_kgram, rng_obj)
    grammar, gramm_constraints = ltk_dict["grammar"], ltk_dict["locally_testable_constraints"]
    output_dict = Dict(
        "grammar"=>grammar,
        "locally_threshold_testable_constraints"=>gramm_constraints,
        "threshold"=>T,
        "kgram_size"=>K,
        "deterministic"=>deterministic,
        "num_transitions_per_kgram"=>num_transitions_per_kgram,
    )
    return output_dict
end

function generate_lttko_grammar(N::Int, K::Int, num_constraints::Int, T::Int, num_precedence_relations::Int, deterministic::Bool=true, num_transitions_per_kgram::Int=1, rng_obj::AbstractRNG=Random.MersenneTwister(0))
    """
    Function to generate locally t-threshold k-testable grammars.
    Grammaticality can be determined by a 'scanner' that tracks if the number of times a k-gram occurs (a constraint) exceeds a threshold T.
    Implemented here as the num_constraints length set of rows in the adjacency matrix generated for SKl grammars that must be present 1<times<T in the string.
    The ungrammatical strings contain more than T occurrences k-grams.

    N is the alphabet size
    K is the length of the kgrams.
    num_constraints is the number of constraints to be generated. 
    T is the threshold for the number of times a k-gram can occur in the string.
    num_precedence_relations is the number of precedence relations. Best to set this to be quite a lot less than the number of (k-1)-grams in the grammar, otherwise you will generate the same string over and over again.
    """
    ltk_dict = generate_ltk_grammar(N, K, num_constraints, deterministic, num_transitions_per_kgram, rng_obj)
    grammar, gramm_constraints = ltk_dict["grammar"], ltk_dict["locally_testable_constraints"]
    if num_precedence_relations > size(grammar, 1)
        error("ERROR: num_precedence_relations must be less than the number of rows in the grammar. Otherwise circular precedence relations would be created.")
    end
    
    precedence_relations_gramm = sample(rng_obj, 1:size(grammar, 1), num_precedence_relations+1, replace = false) # the order defines the precedence relations
    precedence_relations_gramm = [_repeated_perm_from_index(idx, N, (K-1), sample(rng_obj, 1:N, Weights(grammar[idx, :]))) for idx in precedence_relations_gramm] # this converts the k-gram index to the letter indexes in the alphabet
    precedence_relations_ungramm = reverse(precedence_relations_gramm) # reverse the precedence relations for the ungrammatical strings
    output_dict = Dict(
        "grammar"=>grammar,
        "locally_threshold_testable_constraints"=>gramm_constraints,
        "threshold"=>T,
        "precedence_relations_grammar"=>precedence_relations_gramm,
        "precedence_relations_ungrammar"=>precedence_relations_ungramm,
        "kgram_size"=>K,
        "deterministic"=>deterministic,
        "num_transitions_per_kgram"=>num_transitions_per_kgram,
    )
    return output_dict
end

function generate_monadic_second_grammar(N::Int, K::Int, mod::Int=2, deterministic::Bool=true, num_transitions_per_kgram::Int=1, rng_obj::AbstractRNG=Random.MersenneTwister(0))
    """
    Function to generate (one type) of monadic second-order language. In particular, a grammar that requires modular counting. For instance, that the number of a specific k-gram is divisible by some integer. 2 or 3 are good choices.

    """ 
    grammar = generate_skl_grammar(N, K, deterministic, num_transitions_per_kgram, rng_obj)["grammar"]
    output_dict = Dict(
        "grammar"=>grammar,
        "mod"=>mod,
        "kgram_size"=>K,
        "deterministic"=>deterministic,
        "num_transitions_per_kgram"=>num_transitions_per_kgram,
    )
    return output_dict 
end

function generate_reg_lang_string(grammar_dict::Dict, str_len::Int, error_bool::Bool, alphabet::StepRange, rng_obj::AbstractRNG=Random.MersenneTwister(0))
    if "ungrammar" in keys(grammar_dict)
        grammar_type = "slk"
        if error_bool
            adj_matrix = grammar_dict["ungrammar"]
        else
            adj_matrix = grammar_dict["grammar"]
        end
    elseif "locally_testable_constraints" in keys(grammar_dict)
        grammar_type = "ltk"
        adj_matrix = grammar_dict["grammar"]
    elseif "precedence_relations_grammar" in keys(grammar_dict)
        grammar_type = "lttko" 
        adj_matrix = grammar_dict["grammar"]
    elseif "locally_threshold_testable_constraints" in keys(grammar_dict)
        grammar_type = "lttk"
        adj_matrix = grammar_dict["grammar"]
    elseif "mod" in keys(grammar_dict)
        grammar_type = "monadic_second"
        adj_matrix = grammar_dict["grammar"]
    else
        error("ERROR: grammar type not recognised")
    end

    if length(alphabet) != size(adj_matrix)[2]
        error("ERROR: Alphabet length does not match grammar size")
    end

    kgram_size = grammar_dict["kgram_size"]
    alph_size = size(adj_matrix)[2]

    if grammar_type == "slk"
        if kgram_size > 1
            string_idxs = [rand(rng_obj, 1:alph_size) for _ in 1:(kgram_size-1)] # generate the first (k-1)gram
            for _ in kgram_size:str_len
                prev = string_idxs[end-kgram_size+2:end]# get the previous (k-1)gram
                next_idxs = _find_repeated_perm_indx(prev, alph_size) # get the index of the previous (k-1)gram in the grammar (assuming lexicographic order)
                next = sample(rng_obj, 1:alph_size, Weights(adj_matrix[next_idxs, :])) # sample the next letter
                push!(string_idxs, next)
            end
        else
            letters = [i for (i, j) in enumerate(diag(adj_matrix)) if j == 1] # get the indexes of the k-grams from the diagonal
            string_idxs = [rand(rng_obj, letters)] # generate the first letter
            for _ in 2:str_len
                next = sample(rng_obj, letters) # sample the next letter
                push!(string_idxs, next)
            end
        end
    elseif grammar_type == "ltk"
        done = false
        while !done
            string_idxs = [rand(1:alph_size) for _ in 1:(kgram_size-1)]
            for _ in kgram_size:str_len
                prev = string_idxs[end-kgram_size+2:end]# get the previous (k-1)gram
                next_idxs = _find_repeated_perm_indx(prev, alph_size) # get the index of the previous (k-1)gram in the grammar (assuming lexicographic order)
                next = sample(rng_obj, 1:alph_size, Weights(adj_matrix[next_idxs, :])) # sample the next letter
                push!(string_idxs, next)
            end
            string = join(alphabet[string_idxs])
            constraints = [join(alphabet[grammar_dict["locally_testable_constraints"][i]]) for i in 1:length(grammar_dict["locally_testable_constraints"])]
            if all([occursin(constraint, string) for constraint in constraints]) && !error_bool
                done = true
            elseif !all([occursin(constraint, string) for constraint in constraints]) && error_bool
                done = true
            end
        end
    elseif grammar_type == "lttk"
        done = false
        while !done
            string_idxs = [rand(rng_obj, 1:alph_size) for _ in 1:(kgram_size-1)]
            for _ in kgram_size:str_len
                prev = string_idxs[end-kgram_size+2:end]# get the previous (k-1)gram
                next_idxs = _find_repeated_perm_indx(prev, alph_size) # get the index of the previous (k-1)gram in the grammar (assuming lexicographic order)
                next = sample(rng_obj, 1:alph_size, Weights(adj_matrix[next_idxs, :])) # sample the next letter
                push!(string_idxs, next)
            end
            test_string = join(alphabet[string_idxs])
            constraints = [join(alphabet[grammar_dict["locally_threshold_testable_constraints"][i]]) for i in 1:length(grammar_dict["locally_threshold_testable_constraints"])]
            if all([count(c, test_string) <= grammar_dict["threshold"] for c in constraints]) && !error_bool
                done = true
            elseif any([count(c, test_string) > grammar_dict["threshold"] for c in constraints]) && error_bool
                done = true
            end
        end
    elseif grammar_type == "lttko" # we ignore locally testable constraints here, focusing only on precedence relations of k-grams.
        done = false
        while !done
            string_idxs = [rand(rng_obj, 1:alph_size) for _ in 1:(kgram_size-1)]
            for _ in kgram_size:str_len
                prev = string_idxs[end-kgram_size+2:end]# get the previous (k-1)gram
                next_idxs = _find_repeated_perm_indx(prev, alph_size) # get the index of the previous (k-1)gram in the grammar (assuming lexicographic order)
                next = sample(rng_obj, 1:alph_size, Weights(adj_matrix[next_idxs, :])) # sample the next letter
                push!(string_idxs, next)
            end
            test_string = join(alphabet[string_idxs])
            constraints = [join(alphabet[str_idxs]) for str_idxs in grammar_dict["precedence_relations_grammar"]]
            regex_constraint = ".*$(join(constraints, ".*")).*"
            ungram_regex_constraint = ".*$(join(reverse(constraints), ".*")).*"
            if occursin(Regex(regex_constraint), test_string) && !error_bool
                done = true
            elseif occursin(Regex(ungram_regex_constraint), test_string) && error_bool
                done = true
            end
        end
    elseif grammar_type == "monadic_second" # we ignore locally testable constraints here, focusing only on the counts of substrings.
        if error_bool
            mods = [i for i in 1:div(str_len, 2) if mod(i, grammar_dict["mod"]) != 0 && mod(str_len, i) == 0] # number of times to repeat the substring. Can't be divisible by the mod. It can be 1, this is just where the substring is not repeated.
        else
            mods = [i for i in 1:div(str_len, 2) if mod(i, grammar_dict["mod"]) == 0 && i != 1 && mod(str_len, i) == 0 && div(str_len, i) >= k_gram_size] # number of times to repeat the substring. Must be divisible by the mod. Can't be 1 and can't be smaller than kgramsize.
        end
        num_repeats = sample(rng_obj, mods, 1)[1] # randomly sample the number of times to repeat the substring
        repeatable_element = [rand(rng_obj, 1:alph_size) for _ in 1:(kgram_size-1)] # initialize the substring
        while length(repeatable_element) < div(str_len, num_repeats) # create the substring which is the length of the string divided by the number of repeats
            prev = repeatable_element[end-kgram_size+2:end]# get the previous (k-1)gram
            next_idxs = _find_repeated_perm_indx(prev, alph_size) # get the index of the previous (k-1)gram in the grammar (assuming lexicographic order)
            next = sample(rng_obj, 1:alph_size, Weights(adj_matrix[next_idxs, :])) # sample the next letter
            push!(repeatable_element, next)
        end
        string_idxs = copy(repeatable_element)
        for _ in 2:num_repeats
            push!(string_idxs, repeatable_element...)
        end
        
    end
    return join(alphabet[string_idxs]), string_idxs
end

function generate_context_free_string(grammar_dict::Dict, grammar_type::String, str_len::Int, error_bool::Bool, alphabet::StepRange, rng_obj::AbstractRNG=Random.MersenneTwister(0))
    """
    Function to generate a context-free string from a grammar. Uses an SLk grammar and then generates strings according to some rules.
    """
    @assert grammar_type in ["rep", "mirr", "AnBn"] "Grammar type must be either repeated (rep), mirrored (mirr), or AnBn-style."
    @assert mod(str_len, 2) == 0 "String length must be even for context-free grammars."
    kgram_size = grammar_dict["kgram_size"]
    @assert kgram_size == 2 "Kgram size must be 2 for context-free grammars. Other values are not implemented."

    grammar = grammar_dict["grammar"]
    alph_size = size(grammar)[2]

    if grammar_type == "rep" || grammar_type == "mirr"
        string_idxs = [rand(rng_obj, 1:alph_size) for _ in 1:(kgram_size-1)] # generate the first (k-1)gram
        for _ in kgram_size:div(str_len, 2)
            prev = string_idxs[end-kgram_size+2:end]# get the previous (k-1)gram
            next_idxs = _find_repeated_perm_indx(prev, alph_size) # get the index of the previous (k-1)gram in the grammar (assuming lexicographic order)
            next = sample(rng_obj, 1:alph_size, Weights(grammar[next_idxs, :])) # sample the next letter
            push!(string_idxs, next)
        end
        if error_bool
            if grammar_type == "rep"
                string_idxs = vcat(string_idxs, reverse(string_idxs)) # repeat the string in reverse order for ungrammatical strings in the repeated case
            elseif grammar_type == "mirr"
                string_idxs = vcat(string_idxs, string_idxs) # repeat the string for ungrammatical strings in the mirrored case
            end
        else
            if grammar_type == "rep"
                string_idxs = vcat(string_idxs, string_idxs)
            elseif grammar_type == "mirr"
                string_idxs = vcat(string_idxs, reverse(string_idxs))
            end
        end
    else
        if error_bool
            grammar = grammar_dict["ungrammar"]
        end
        string_idxs = Vector{Int64}(undef, str_len)
        for i in 1:div(str_len, 2)
            start = rand(rng_obj, 1:alph_size)
            next = sample(rng_obj, 1:alph_size, Weights(grammar[start, :])) # sample the next letter
            string_idxs[i] = start
            string_idxs[div(str_len, 2) + i] = next
        end
    end
    return join(alphabet[string_idxs]), string_idxs
end

function generate_context_sensitive_string(grammar_dict::Dict, str_len::Int, error_bool::Bool, alphabet::StepRange, rng_obj::AbstractRNG=Random.MersenneTwister(0))
    """
    Function to generate a context-sensitive string from a grammar. Uses an SLk grammar and then generates strings according to the AnBnCn style only..
    """
    @assert mod(str_len, 3) == 0 "String length must be a multiple of 3 for context-sensitive grammars."
    kgram_size = grammar_dict["kgram_size"]
    @assert kgram_size == 2 "Kgram size must be 2 for context-sensitive grammars. Other values are not implemented."
    
    if error_bool
        grammar = grammar_dict["ungrammar"]
    else
        grammar = grammar_dict["grammar"]
    end
    alph_size = size(grammar)[2]
    string_idxs = Vector{Int64}(undef, str_len)
    for i in 1:div(str_len, 3)
        start = rand(rng_obj, 1:alph_size)
        next = sample(rng_obj, 1:alph_size, Weights(grammar[start, :])) # sample the next letter
        next_next = sample(rng_obj, 1:alph_size, Weights(grammar[next, :])) # sample the next letter
        string_idxs[i] = start
        string_idxs[div(str_len, 3) + i] = next
        string_idxs[(div(str_len, 3)*2) + i] = next_next
    end
    return join(alphabet[string_idxs]), string_idxs
end

#==================================================================================#