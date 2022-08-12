module BirthDeathProcess

include("GaussKronrod.jl")
include("GillespieAlgorithm.jl")
include("BirthDeathProcess-DefaultValues.jl")
include("Visualization.jl")

export param, parameters, plot, gauss, gillespie

"""
Default values for the parameters birth (param.β) and death (param.δ) 
of the birth-death process.
"""
param = Parameters(1, 0.1)

"""
Constructor for new parameters birth β and death δ. 
    1000 >= β >= 0.001 
    1000 >= δ >= 0.001 

# Arguments
    - `β::Number`: parameters birth
    - `δ::Number`: parameters death        
"""
function parameters(β::Number, δ::Number)::Parameters
    global param = Parameters(β, δ)
end

gauss(n0, T, step) = gaussKronrod(param.β, param.δ, n0, T, step)

gillespie(n0, T, step) = gillespieAlgorithm(param.β, param.δ, n0, T, step)

plot(times, population) = plot(times, population)

end #module
