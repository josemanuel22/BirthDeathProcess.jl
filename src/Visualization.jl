using Plots

export plot

function plot(times::Array{Float64,1}, population::Array{Float64,1}, n0::Number, param::Parameters)
    scatter(times, population, title="Simulation β = $(param.β), and δ = $(param.δ). Initial population=$(n0)")
    xlabel!("Time (t)")
    ylabel!("Population (N)")
    #plot the analytical solution
    f(t)=(n0 - param.β/param.δ)*exp(-param.δ*t)+param.β/param.δ
    plot!(f) 
end