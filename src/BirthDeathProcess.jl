module BirthDeathProcess

include("RungeKutta.jl")
include("Gillespie.jl")
include("DefaultParameters.jl")
include("Visualization.jl")

export param, parameters, plot, numerical_simulation, stochastic_simulation

"""
Default values for the parameters birth (param.β) and death (param.δ) 
of the birth-death process.

# Arguments
    - `β::Number`: parameters birth. 1000 >= β >= 0.001
    - `δ::Number`: parameters death.  1000 >= δ >= 0.001 
"""
param = Parameters(1, 0.1)

numerical_simulation(param, n0, T, step) = runge_kutta(param.β, param.δ, n0, T, step)

stochastic_simulation(param, n0, T) = gillespie(param.β, param.δ, n0, T)

plot(times, population) = plot(times, population)

end #module
