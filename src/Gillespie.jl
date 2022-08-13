include("Utils.jl")

export gillespie

_ex(tau::Number, mu::Number)::Number = - log(tau) / mu

"""
    gillespie(β::Number, δ::Number, n::Number, T::Number) -> (Array{Float64,1}, Array{Float64,1})

Gillespie algorithm (or occasionally the Doob-Gillespie algorithm)
generates a statistically correct trajectory (possible solution) of
a stochastic equation system for which the reaction rates are known.

# Arguments
    - `β::Number`: parameters birth
    - `δ::Number`: parameters death
    - `n::Number`: n(0) initial population. Unsigned Integer.
    - `T::Number`: Time limit of the simulation. Positive Number. 

# Example
```julia-repl
julia> gillespie(1,0.1,1,1)
([0.18931862426539015, 1.4790115785686067], [2.0, 3.0])
```
"""
function gillespie(β::Number, δ::Number, n::Number, T::Number)::Tuple{Array{Float64,1},Array{Float64,1}}
    t,n = 0, n;
    population, times = Float64[], Float64[];
    while n > 0 && t < T
        τ = random()
        t = t + _ex(τ, β + δ * n) 
        τ = random() * (β + δ * n)
        if τ < β
            n = n + 1
        else
            n = n - 1
        end
        push!(times, t)
        push!(population, n)
    end
    return times, population
end
