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

"""
    numerical_simulation(param::Parameters, n0::Number, T::Number, step::Number) -> (Array{Float64,1}, Array{Float64,1})
    
Use Runge Kutta pairs of orders 5 and 4 methods for solving the solution of the Initial Value Problem of birth and death process process
determined by the parameters β and δ. The ODE that determine the problem is n' = β - δ * n.

# Arguments
    - `param::Parameters`: parameters of the model.
    - `n0::Number`: n(0) initial population. Unsigned Integer.
    - `T::Number`: Time limit of the simulation. Positive Number.
    - `step::Number`: The number of steps of the simulation. Positive Number.
    
# Example
```julia-repl
julia> numerical_simulation(param, 1, 20, 1)
([0.0, 1.0 … 18.0, 19, 20.0], [1.0, 1.8564632373325913 … 9.999991209587657]) 
"""
numerical_simulation(param::Parameters, n0::Number, T::Number, step::Number) = runge_kutta(param.β, param.δ, n0, T, step)

"""
    stochastic_simulation(param::Parameters, n0::Number, T::Number) -> (Array{Float64,1}, Array{Float64,1})
    
Use dynamic stochastic algorithm (dynamic monte-carlo) for solving the solution of the Initial Value Problem of birth and death process process.

# Arguments
    - `param::Parameters`: parameters of the model.
    - `n0::Number`: n(0) initial population. Unsigned Integer.
    - `T::Number`: Time limit of the simulation. Positive Number.
    
# Example
```julia-repl
julia> stochastic_simulation(param, 1, 20)
([1.0693425409298716, 1.1801284254628217 … 19.901058921300237], [1.0, 1.8564632373325913 … 9.999991209587657]) 
"""
stochastic_simulation(param::Parameters, n0::Number, T::Number) = gillespie(param.β, param.δ, n0, T)

plot(times, population, n0, param) = plot(times, population, n0, param)

"""
    get_plots(param::Parameters, n0::Number, T::Number)

Create a multi-plot for the simulation of the birth and death process process. 
"""
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
