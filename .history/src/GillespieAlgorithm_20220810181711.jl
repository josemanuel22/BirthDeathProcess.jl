include("Utils.jl")

function ex(tau, mu)
    return - log(tau) / mu
end

function gillespieAlgorithm(β, δ, n, T)
    t,n = 0, n;
    population, times = Float64[], Float64[];
    while n > 0 && t < T
        τ = random()
        t = t + ex(τ, β + δ*n) 
        τ = random() * (β + δ*n)
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