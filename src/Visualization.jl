using Plots

export plot, display, scatter_plot, add_plot, plot_solution

function plot_solution(n0::Number, param::Parameters, T::Number)
    f(t) = (n0 - param.β/param.δ)*exp(-param.δ*t)+param.β/param.δ
    plot!(f, 0, T, linewidth=2,color="red")
end

function add_plot(times::Array{Float64,1}, population::Array{Float64,1})
    return plot!(times, population)
end

function plot(times::Array{Float64,1}, population::Array{Float64,1}, n0::Number, param::Parameters)
    Plots.plot(times, population, title="Simulation β = $(param.β), and δ = $(param.δ). Initial population=$(n0)")
    xlabel!("Time (t)")
    #xlims!(0, times[end])
    ylabel!("Population (N)")
    #ylims!(0, population[end])
end

function scatter_plot(times::Array{Float64,1}, population::Array{Float64,1}, n0::Number, param::Parameters)
    scatter(times, population, title="birth-rate = $(param.β), death-rate = $(param.δ). Initial population=$(n0)", smooth=true)
    xlabel!("Time (t)")
    #xlims!(0, times[end])
    ylabel!("Population (N)")
    #ylims!(0, population[end])
end

"""
    display(p::Plots)

Force to display the plot.

# Arguments
    - `p::Plots`: plot to display

# Example
```julia-repl
julia> display(p)
```
"""
function display(p)
    Plots.display(p)
end
