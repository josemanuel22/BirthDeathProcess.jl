include("BirthDeathProcess-DefaultValues.jl")

using QuadGK

export gaussKronrod

function gaussKronrod(init, β, δ, T, step)
    # https://en.wikipedia.org/wiki/Gauss%E2%80%93Kronrod_algorithm
    t, n = 0,0
    times, population = Float64[], Float64[](init)
    while t < T && n >= 0
        n, _ = quadgk( n -> β - δ * n , t, t+step, rtol=1e-8)
        t = t + step
        push!(times, t)
        push!(population, population[end]+n)
    end
    return times, population
end