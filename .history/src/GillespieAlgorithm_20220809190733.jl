include("Utils.jl")

function ex(tau, mu)
    return - log(tau) / mu
end

function gillespieAlgorithm(beta, delta, initial_cond, stop_time)
    t,n = 0, initial_cond;
    while n > 0 || t < stop_time
        tau = random()
        t = t + ex(tau, beta + delta*n) 
        tau = random() * (beta + delta*n)
        if tau < beta
            n = n + 1
        else
            n = n - 1
        end
    end
end
