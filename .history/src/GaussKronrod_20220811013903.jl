include("BirthDeathProcess-DefaultValues.jl")

using QuadGK

export gaussKronrod

function gaussKronrod(β, δ, T, step)
    # https://en.wikipedia.org/wiki/Gauss%E2%80%93Kronrod_algorithm
    t, n = 0,0
    while t < T && n >= 0
        n, p = quadgk( n -> β - δ * n , t, t+step, rtol=1e-8)
        t = t + step
    end
end