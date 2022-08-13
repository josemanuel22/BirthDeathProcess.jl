using Plots

export plot

function plot(times::Array{Float64,1}, population::Array{Float64,1}, n0::Number, β::Number, δ::Number)
    scatter(times, population, title=string("Simulation β=", β, " and δ=", δ,". Initial population=", n0))
    xlabel!("Time (t)")
    ylabel!("Population (N)")
    f(t)=(n0 - β/δ)*exp(-δ*t)+β/δ
    plot!(f)
end