## Functions to export
using Combinatorics, CSV, DataFrames, IterTools, LinearAlgebra, Logging, Random, SHA, StatsBase, YAML

#==================================================================================#
# Grammar functions

# Checking Connectedness of grammar - check whether the grammar is connected.
function check_connected(grammar)
    N = size(grammar)[1]
    gramN = grammar^N
    counts = sum(gramN .> 0, dims=2)
    return sum(counts .== N) > 0
end

# Check full transitions of grammar - check whether every state can be transitioned out of, no 0s on any rows
function check_full_transitions(grammar)
    # println("check trans")
    row_sums = sum(grammar, dims=2)
    full_trans = prod(row_sums .!= 0)
    return full_trans
end

# Generate fully connected, fully transitioned grammars
function generate_connected_grammar(N::Int, edges::Int, loops::Bool, K::Int)
    """ 
    Function to generate an adjacency grammar. 

    N is the alphabet size 
    edges are the num of edges max edges is (N^K)^2
    K is the length of the kgrams. 1 is regular grammar, 2+ is a context-sensitive grammar because the legality of transitions between two letters depends on whether they are in a tuple or between two tuples.
    """
    if edges > (N^K)^2
        return "ERROR: Edges exceed the maximum possible, check edges is less than (N^K)^2"
    end

    done = false
    grammar = nothing

    if loops 

        while !done
            grammar = reshape(shuffle(vcat(repeat([1], edges), repeat([0], (N^K)^2 - edges))), N^K, N^K)
            if check_full_transitions(grammar)
                if check_connected(grammar)
                    if sum(Diagonal(grammar)) >= 1 # added constraint so that it must have loops
                        done = true
                    end
                end
            end
        end

    else

        if edges > (N^2 - N)
            return "ERROR: Edges to large to construct with no loops"
        end

        if edges == N
            return "ERROR: Too few edges to construct with no loops, or at least it will take too long..."
        end
        # [[j==i ? 0 : 1 for j in 1:N] for i in 1:N]
        while !done
            list_edges = shuffle(vcat(repeat([1], edges), repeat([0], (N^K)^2-(N^K) - edges))) 
            grammar = vcat([[j==i ? 0 : pop!(list_edges) for j in 1:(N^K)] for i in 1:(N^K)])
            grammar = reduce(hcat, grammar)
            if sum(Diagonal(grammar)) == 0 # added constraint so that it must not have loops
                if check_full_transitions(grammar)
                    if check_connected(grammar) 
                        done = true
                    end
                end
            end
        end
    end
    out_degree_matrix = diagm(vec(sum(grammar, dims=1)))
    in_degree_matrix = diagm(vec(sum(grammar, dims=2)))
    output_dict = Dict(
        "grammar"=>grammar,
        "out_degree_matrix"=>out_degree_matrix,
        "in_degree_matrix"=>in_degree_matrix,
        "out_degree_laplacian"=>(out_degree_matrix .- grammar),
        "in_degree_laplacian"=>(in_degree_matrix .- grammar),
        "signless_in_degree_laplacian"=>(in_degree_matrix .+ grammar) # For Sun et al. (2021) entropy calcs
    )
    return output_dict
end

# Generate fully transitioned grammars
function generate_grammar(N::Int, edges::Int, K::Int)
    """ 
    Function to generate an adjacency grammar, ignoring connectedness and loops. 

    N is the alphabet size 
    edges are the num of edges max edges is (N^K)^2
    K is the length of the kgrams. 1 is regular grammar, 2+ is a context-sensitive grammar because the validity of transitions between two letters depends on whether they are in a tuple or between two tuples.
    """
    if edges > (N^K)^2
        return "ERROR: Edges exceed the maximum possible, check edges is less than (N^K)^2"
    end

    done = false
    grammar = nothing

    while !done
        grammar = reshape(shuffle(vcat(repeat([1], edges), repeat([0], (N^K)^2 - edges))), N^K, N^K)
        if check_full_transitions(grammar)
            done = true
        end
    end

    out_degree_matrix = diagm(vec(sum(grammar, dims=1)))
    in_degree_matrix = diagm(vec(sum(grammar, dims=2)))
    output_dict = Dict(
        "grammar"=>grammar,
        "out_degree_matrix"=>out_degree_matrix,
        "in_degree_matrix"=>in_degree_matrix,
        "out_degree_laplacian"=>(out_degree_matrix .- grammar),
        "in_degree_laplacian"=>(in_degree_matrix .- grammar),
        "signless_in_degree_laplacian"=>(in_degree_matrix .+ grammar) # For Sun et al. (2021) entropy calcs
    )
    return output_dict
end


# Generate tensor grammar ignore transition rules
function generate_tensor_grammar(N::Int, edges::Int, Rank::Int)
    """ 
    Function to generate an adjacency grammar, ignoring connectedness and loops. 

    N is the alphabet size 
    edges are the num of edges max edges is (N^K)^2
    Rank is the rank of the tensor. 1 is regular grammar, 2+ is a context-sensitive grammar because the validity of transitions between two letters depends on whether they are in a tuple or between two tuples.
    """
    if edges > (N^Rank)
        return "ERROR: Edges exceed the maximum possible, check edges is less than (N^K)^2"
    end

    grammar = reshape(shuffle(vcat(repeat([1], edges), repeat([0], (N^Rank) - edges))), tuple([N for x in 1:Rank]...))

    output_dict = Dict(
        "grammar"=>grammar
    )
    return output_dict
end

# Grammar Entropy function - get the entropy of the grammar as defined by Sun et al. (2021)
function compute_eigenvalue_entropy(eigenvalues)
    # Following Sun et al. (2021) https://doi.org/10.1371/journal.pone.0251993

    absolute_values = abs.(eigenvalues)
    sum_values = sum(abs.(eigenvalues))

    scaled_logged_values = (absolute_values./sum_values) .* log.(absolute_values./sum_values)

    entropy = -1 * (sum(scaled_logged_values))

    return entropy
end

# Grammar Entropy function - get the various entropies of the grammar
function compute_grammar_entropy(adjacency_matrix, in_degree_laplacian=nothing, signless_in_degree_laplacian=nothing, rounding_precision=3)
    
    if isnothing(in_degree_laplacian) && isnothing(signless_in_degree_laplacian)
        top_entropy = abs(eigvals(adjacency_matrix)[end])
        return top_entropy

    elseif isnothing(in_degree_laplacian) ⊻ isnothing(signless_in_degree_laplacian)
        error("Supply both an indegree laplacian and a signless in degree laplacian to compute entropy.") 

    else 
        top_entropy = abs(eigvals(adjacency_matrix)[end])

        adjacency_matrix_eigenvalues = eigvals(adjacency_matrix)
        adjacency_matrix_real_entropy = compute_eigenvalue_entropy(real.(adjacency_matrix_eigenvalues))
        adjacency_matrix_imaginary_entropy = compute_eigenvalue_entropy(imag.(adjacency_matrix_eigenvalues))
        adjacency_matrix_modulus_entropy = compute_eigenvalue_entropy(abs.(adjacency_matrix_eigenvalues))

        in_degree_laplacian_eigenvalues = eigvals(in_degree_laplacian)
        in_degree_laplacian_real_entropy = compute_eigenvalue_entropy(real.(in_degree_laplacian_eigenvalues))
        in_degree_laplacian_imaginary_entropy = compute_eigenvalue_entropy(imag.(in_degree_laplacian_eigenvalues))
        in_degree_laplacian_modulus_entropy = compute_eigenvalue_entropy(abs.(in_degree_laplacian_eigenvalues))

        signless_in_degree_laplacian_eigenvalues = eigvals(signless_in_degree_laplacian)
        signless_in_degree_laplacian_real_entropy = compute_eigenvalue_entropy(real.(signless_in_degree_laplacian_eigenvalues))
        signless_in_degree_laplacian_imaginary_entropy = compute_eigenvalue_entropy(imag.(signless_in_degree_laplacian_eigenvalues))
        signless_in_degree_laplacian_modulus_entropy = compute_eigenvalue_entropy(abs.(signless_in_degree_laplacian_eigenvalues))

        output_list = [
            round(top_entropy, digits=rounding_precision),
            round(adjacency_matrix_real_entropy, digits=rounding_precision),
            round(adjacency_matrix_imaginary_entropy, digits=rounding_precision),
            round(adjacency_matrix_modulus_entropy, digits=rounding_precision),
            round(in_degree_laplacian_real_entropy, digits=rounding_precision),
            round(in_degree_laplacian_imaginary_entropy, digits=rounding_precision),
            round(in_degree_laplacian_modulus_entropy, digits=rounding_precision),
            round(signless_in_degree_laplacian_real_entropy, digits=rounding_precision),
            round(signless_in_degree_laplacian_imaginary_entropy, digits=rounding_precision),
            round(signless_in_degree_laplacian_modulus_entropy, digits=rounding_precision)
        ]

        return output_list
    end
end

#==================================================================================#
# String Functions

# String maker function
function make_string(alphabet, grammar, err_grammar, str_len, grammar_type, error) 
    """
    Generates a string from a grammar

    alphabet: the alphabet of the grammar
    grammar: the grammar to generate the string from
    err_grammar: the inverted adjacency matrix for producing incorrect strings
    str_len: the length of the string
    grammar_type: which type of grammar is being used to generate grammars
    error: whether to generate an error string or not
    """
    K = Int(log(length(alphabet), grammar.size[1]))
    @assert str_len % K == 0 "Can't make strings not divisible by K"
    @assert str_len % 2 == 0 "String length must be divisible by 2, to construct cfg grammars"
    @assert grammar_type in ["reg", "cfg_rep", "cfg_mirr", "csg"] "Grammar type must be either regular (reg), context-free with repeated phrases (cfg_rep), context-free with mirrored phrases (cfg_mirr), or context-sensitive (csg)."
    @assert K == 1 || (grammar_type == "csg" && K > 1) "K must be 1 for regular and context-free grammars and >1 for context-sensitive grammars."
    
    kgrams = [join(i) for i in vec(collect(Iterators.product(Iterators.repeated(alphabet, K)...)))] # get all possible kgrams

    alph_size = length(kgrams) # get length of alphabet (or kgram tuples)

    str_idxs = [rand(1:alph_size)] # assign first index to be a random letter in alphabet

    if grammar_type == "cfg_rep" || grammar_type == "cfg_mirr"
        for _ in 2:div(str_len, 2)
            next = sample(1:alph_size, Weights(grammar[str_idxs[end], :]))
            push!(str_idxs, next)
        end
        if grammar_type ==  "cfg_rep"
            if error # such that the only error is the nature of the repeated part, not the between-letter transitions
                str_idxs_copy = copy(str_idxs)
                count_identity = 0
                for idx in str_idxs_copy
                    possible_next = findall(x -> x != idx, 1:alph_size)
                    if sum(grammar[str_idxs[end], possible_next]) == 0
                        push!(str_idxs, idx)
                        count_identity = count_identity + 1
                    else
                        next = sample(possible_next, Weights(grammar[str_idxs[end], possible_next]))
                        push!(str_idxs, next)
                    end
                    if count_identity == length(str_idxs_copy)
                        error("Error string cannot be found for this string")
                    end
                end
            else
                append!(str_idxs, str_idxs)
            end
        else
            if error
                str_idxs_copy = copy(str_idxs)
                str_idxs_copy = reverse(str_idxs_copy)
                count_identity = 0
                for idx in str_idxs_copy
                    possible_next = findall(x -> x != idx, 1:alph_size)
                    if sum(grammar[str_idxs[end], possible_next]) == 0
                        push!(str_idxs, idx)
                        count_identity = count_identity + 1
                    else
                        next = sample(possible_next, Weights(grammar[str_idxs[end], possible_next]))
                        push!(str_idxs, next)
                    end
                    if count_identity == length(str_idxs_copy)
                        error("Error string cannot be found for this string")
                    end
                end
            else
                append!(str_idxs, reverse(str_idxs))
            end
        end
    else
        for _ in 2:div(str_len, K)
            if error
                next = sample(1:alph_size, Weights(err_grammar[str_idxs[end], :]))
            else 
                next = sample(1:alph_size, Weights(grammar[str_idxs[end], :]))
            end
            push!(str_idxs, next)
        end
    end
    return join(kgrams[str_idxs]), str_idxs
end