include("BirthDeathProcess-DefaultValues.jl")

using DifferentialEquations

export gaussKronrod

function gaussKronrod(n0, β, δ, T, step)
    # https://en.wikipedia.org/wiki/Gauss%E2%80%93Kronrod_algorithm
    t, n = 0,0
    f(n,p,t) = β - δ * n
    n0=n0
    tspan = (0.0, T)
    prob = ODEProblem(f,n0,tspan)
    push!(times, 0)
    push!(population, n0)
    while t < T
        n, _ = quadgk( f , t, t+step, rtol=1e-8)
        t = t + step
        println(n)
        push!(times, t)
        push!(population, max(population[end]+n, 0))
    end
    if t < T
        push!(times, t)
        push!(population, 0)
    end
    return times, population
end