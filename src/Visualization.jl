using Plots

export plot

function plot(times, population)
    scatter(times, population)
    xlabel!("Time")
    ylabel!("Population")
end