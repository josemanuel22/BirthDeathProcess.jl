module BirthDeathProcess

include("RungeKutta.jl")
include("Gillespie.jl")
include("DefaultParameters.jl")
include("Visualization.jl")

export param, parameters, plot, numerical_simulation, stochastic_simulation

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

numerical_simulation(n0, T, step) = runge_kutta(param.β, param.δ, n0, T, step)

stochastic_simulation(n0, T, step) = gillespie(param.β, param.δ, n0, T, step)

plot(times, population) = plot(times, population)

end #module
