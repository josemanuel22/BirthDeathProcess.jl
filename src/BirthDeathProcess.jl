module BirthDeathProcess

include("RungeKutta.jl")
include("Gillespie.jl")
include("DefaultParameters.jl")
include("Visualization.jl")
include("Stats.jl")

export param, parameters, plot, get_plots, numerical_simulation, stochastic_simulation

"""
Default values for the parameters birth (param.β) and death (param.δ) 
of the birth-death process.

# Arguments
    - `β::Number`: parameters birth. 1000 >= β >= 0.001
    - `δ::Number`: parameters death.  1000 >= δ >= 0.001 
"""
param = Parameters(1, 0.1)

numerical_simulation(param::Parameters, n0::Number, T::Number, step::Number) = runge_kutta(param.β, param.δ, n0, T, step)

stochastic_simulation(param::Parameters, n0::Number, T::Number) = gillespie(param.β, param.δ, n0, T)

plot(times, population, n0, param) = plot(times, population, n0, param)

function get_plots(param::Parameters, n0::Number, T::Number)
    t, y = stochastic_simulation(param, n0, T)
    p = plot_solution(n0, param, T)
    Threads.@threads for i = 1:10
        t, y = stochastic_simulation(param, n0, T)  
        p = add_plot(t, y)
    end
    display(p)
end

end #module
