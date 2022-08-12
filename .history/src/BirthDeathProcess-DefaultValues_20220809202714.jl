using JuMP;

export β, d

model = Model()
@variable(model, 10^-2 <= β <= 10^2)
β = 1

@variable(model, 10^-2 <= δ <= 10^2)
δ = 0.1
