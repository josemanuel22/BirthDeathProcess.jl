include("Utils.jl")

function _ex(tau::Number, mu::Number)::Number
    return - log(tau) / mu
end

function gillespieAlgorithm(β::Number, δ::Number, n::Integer, T::Number)::Tuple{Array{Float64,1},Array{Float64,1}}
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
