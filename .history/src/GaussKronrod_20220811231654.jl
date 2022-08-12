include("BirthDeathProcess-DefaultValues.jl")

using DifferentialEquations

export gaussKronrod

function gaussKronrod(n0, β, δ, T, step)
    f(n,p,t) = β - δ * n
    n0=n0
    tspan = (0.0, T)
    prob = ODEProblem(f,n0,tspan)
    sol = solve(prob, Tsit5(), saveat=collect(0:3:50))
    return sol.u, sol.t
end