# BirthDeathProcess

**BirthDeathProcess** is a [Julia-language](http://julialang.org/) package
implementing [Gillespie's](https://en.wikipedia.org/wiki/Gillespie_algorithm) 
stocastic simulation algorithm for the equation $n'=\beta - d\cdot n$.

It has other useful functions, both for the visualization of the results 
and for obtaining statistics.


## Numerical Algorithm
```@docs
numerical_simulation(param::Parameters, n0::Number, T::Number, step::Number)
     -> (Array{Float64,1}, Array{Float64,1})
```

```@docs
stochastic_simulation(param::Parameters, n0::Number, T::Number)
     -> (Array{Float64,1}, Array{Float64,1})
```
## Visualization
```@docs
get_plots(param::Parameters, n0::Number, T::Number)
```

```@docs
plot_solution(n0::Number, param::Parameters, T::Number) -> Plot
```

```@docs
add_plot(times::Array{Float64,1}, population::Array{Float64,1} ) -> Plot
```

```@docs
plot(times::Array{Float64,1}, population::Array{Float64,1} ) -> Plot
```

```@docs
scatter_plot(times::Array{Float64,1}, population::Array{Float64,1},
     n0::Number, param::Parameters) -> Plot
```

## Stats

```@docs
get_stats(times::Array{Float64,1}, population::Array{Float64,1},
     param::Parameters) -> (Float64, Float64)
```

