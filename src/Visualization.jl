using Plots

export plot, display, scatter_plot, add_plot, plot_solution

"""
    plot_solution(n0::Number, param::Parameters, T::Number) -> Plot

Plot the analytical solution of the birth-death process to the current grafic.

# Arguments
    - `n0::Number`: n(0) initial population. Unsigned Integer.
    - `param::Parameters`: parameters birth and death
    - `T::Number`: Time limit of the simulation. Positive Number. 
"""
function plot_solution(n0::Number, param::Parameters, T::Number)
    f(t) = (n0 - param.β/param.δ)*exp(-param.δ*t)+param.β/param.δ
    plot!(f, 0, T, linewidth=2,color="red")
end

"""
    add_plot(times::Array{Float64,1}, population::Array{Float64,1} ) -> Plot

Add a plot of the birth-death process to the current grafic.

# Arguments
    - `times::Array{Float64,1}`: array of times.
    - `population::Array{Float64,1}`: array of population.
"""
function add_plot(times::Array{Float64,1}, population::Array{Float64,1})
    return plot!(times, population)
end

"""
    plot(times::Array{Float64,1}, population::Array{Float64,1} ) -> Plot

Add a plot of the birth-death process to the current grafic.

# Arguments
    - `times::Array{Float64,1}`: array of times.
    - `population::Array{Float64,1}`: array of population.
    - `n0::Number`: n(0) initial population. Unsigned Integer.
    - `param::Parameters`: parameters birth and death
"""
function plot(times::Array{Float64,1}, population::Array{Float64,1}, n0::Number, param::Parameters)
    Plots.plot(times, population, title="Simulation β = $(param.β), and δ = $(param.δ). Initial population=$(n0)")
    xlabel!("Time (t)")
    #xlims!(0, times[end])
    ylabel!("Population (N)")
    #ylims!(0, population[end])
end

"""
    scatter_plot(times::Array{Float64,1}, population::Array{Float64,1}, n0::Number, param::Parameters) -> Plot

Create a scatter plot of the birth-death process to the current grafic.

# Arguments
    - `times::Array{Float64,1}`: array of times.
    - `population::Array{Float64,1}`: array of population.
    - `n0::Number`: n(0) initial population. Unsigned Integer.
    - `param::Parameters`: parameters birth and death
"""
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
"""
function display(p)
    Plots.display(p)
end
