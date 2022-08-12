using JuMP;

export β, d

model = Model()
@variable(model, 10^-2 <= β <= 10^2)
b = 1

@variable(model, 10^-2 <= d <= 10^2)
d = 0.1
