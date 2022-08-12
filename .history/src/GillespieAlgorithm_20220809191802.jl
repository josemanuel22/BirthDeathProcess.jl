include("Utils.jl")

function ex(tau, mu)
    return - log(tau) / mu
end

function gillespieAlgorithm(β, delta, initial_cond, stop_time)
    t,n = 0, initial_cond;
    while n > 0 && t < stop_time
        τ = random()
        t = t + ex(τ, β + delta*n) 
        τ = random() * (β + delta*n)
        if τ < β
            n = n + 1
        else
            n = n - 1
        end
    end
    return n
end
