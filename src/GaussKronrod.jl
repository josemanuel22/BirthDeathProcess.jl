include("BirthDeathProcess-DefaultValues.jl")

using DifferentialEquations

export gaussKronrod

function gaussKronrod(β::Number, δ::Number, n0::Number, T::Number, step::Number)::Tuple{Array{Float64,1},Array{Float64,1}}
    f(n,p,t) = β - δ * n
    n0=n0
    tspan = (0.0, T)
    prob = ODEProblem(f,n0,tspan)
    sol = solve(prob, Tsit5(), saveat=collect(0:step:T))
    return sol.t, sol.u
end