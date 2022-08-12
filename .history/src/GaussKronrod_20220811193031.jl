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
    sol = solve(prob)
    return sol.u, sol.t
end