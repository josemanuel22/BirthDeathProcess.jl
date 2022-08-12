using Plots

export plot

function plot(times, population)
    plot(times, population, PlotTheme.Default)
    xlabel!("Time")
    ylabel!("Population")
end