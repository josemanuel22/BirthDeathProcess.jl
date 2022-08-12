include("BirthDeathProcess-DefaultValues.jl")

using QuadGK

export gaussKronrod

print(d)

function gaussKronrod(β, δ, T)
    d =1 
    # https://en.wikipedia.org/wiki/Gauss%E2%80%93Kronrod_algorithm
    return quadgk( n -> β - δ * n , 0, T, rtol=1e-8)
end