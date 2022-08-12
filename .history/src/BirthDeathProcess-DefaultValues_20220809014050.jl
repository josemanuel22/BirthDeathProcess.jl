using JuMP;

export b, d

model = Model()
@variable(model, 10^-2 <= b <= 10^2)
b = 1

@variable(model, 10^-2 <= d <= 10^2)
d = 0.1




