using Statistics


export get_stats

"""
    get_stats(times::Array{Float64,1}, population::Array{Float64,1}, param::Parameters) -> (Float64, Float64)

Get the statistics of the simulation. Return mean and standard deviation of the simulation with respect the analytical solution.

# Arguments
    - `times::Array{Float64,1}`: array of times
    - `population::Array{Float64,1}`: array of solution of the birth-death process
    - `param::Array{Float64,1}`: param of the model

# Example
```julia-repl
julia> get_stats(times, population, param)
(2.961779087019126, 3.176174109503726)
```
"""
function get_stats(times::Array{Float64,1}, population::Array{Float64,1}, n0::Number, param::Parameters)::Tuple{Float64, Float64}
    f(t) = (n0 - param.β/param.δ)*exp(-param.δ*t)+param.β/param.δ
    diff = f.(times) - population
    return mean(abs.(diff)), sqrt(var(diff))
end