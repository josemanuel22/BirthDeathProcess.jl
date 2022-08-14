using DifferentialEquations

export runge_kutta

"""
    runge_kutta(β::Number, δ::Number, n0::Number, T::Number) -> (Array{Float64,1}, Array{Float64,1})

Runge Kutta pairs of orders 5 and 4 methods for solving the solution of the Initial Value Problem.
Algorithm for the construction of Runge Kutta pairs of orders 5 and 4 based only in the first column simplifying assumption. The result is a pair
that outperforms other known pairs in the bibliography when tested to standard
set of problems of DETEST.
http://users.uoa.gr/~tsitourasc/RK54_new_v2.pdf

# Arguments
    - `β::Number`: parameters birth
    - `δ::Number`: parameters death
    - `n0::Number`: n(0) initial population. Unsigned Integer.
    - `T::Number`: Time limit of the simulation. Positive Number. 
    - `step::Number`: Number of time steps. Positive Integer.

# Example
```julia-repl
julia> runge_kutta(0,0,1,4,1)
([0.0, 1.0, 2.0, 3.0, 4.0], [1.0, 1.0, 1.0, 1.0, 1.0])
```
"""
function runge_kutta(β::Number, δ::Number, n0::Number, T::Number, step::Number)::Tuple{Array{Float64,1},Array{Float64,1}}
    f(n,p,t) = β - δ * n
    n0=n0
    tspan = (0.0, T)
    prob = ODEProblem(f,n0,tspan)
    sol = solve(prob, Tsit5(), saveat=collect(0:step:T))
    return sol.t, sol.u
end