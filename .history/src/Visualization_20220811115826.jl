using Plots

function plot(times, population)
    plt = plot3d(
    1,
    xlim = (-30, 30),
    ylim = (-30, 30),
    zlim = (0, 60),
    title = "Lorenz Attractor",
    marker = 2,
)
    plot(times, population, PlotTheme.Default)
end