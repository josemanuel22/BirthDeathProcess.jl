include("Utils.jl")

function ex(tau, mu)
    return - log(tau) / mu
end

function gillespieAlgorithm(β, δ, n, T)
    t,n = 0, n;
    while n > 0 && t < T
        τ = random()
        t = t + ex(τ, β + δ*n) 
        τ = random() * (β + δ*n)
        if τ < β
            n = n + 1
        else
            n = n - 1
        end
        println(n)
    end
    return n
end
