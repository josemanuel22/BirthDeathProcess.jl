using Plots

export plot

function plot(times::Array{Float64,1}, population::Array{Float64,1})
    scatter(times, population)
    xlabel!("Time")
    ylabel!("Population")
end