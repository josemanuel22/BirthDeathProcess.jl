module BirthDeathProcess

include("GaussKronrod.jl")
include("GillespieAlgorithm.jl")
include("BirthDeathProcess-DefaultValues.jl")
include("Visualization.jl")

export param, plot, gaussKronrod, gillespieAlgorithm

#Default values for the parameters birth and Default
param = Parameters(1, 0.1)

function parameters(β, δ)
    global param = Parameters(β, δ)
end


function gaussKronrod(n0, T, step)
    return gaussKronrod(param.β, param.δ, n0, T, step)
end

function gillespieAlgorithm(n0, T, step)
    return gillespieAlgorithm(param.β, param.δ, n0, T, step)
end

function plot(times, population)
    plot(times, population)
end

end #module
