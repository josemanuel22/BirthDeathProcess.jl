export Parameters 
struct Parameters 
    β::Number
    δ::Number
    Parameters(β,δ) = 10^2 >= β >= 10^-2 && 10^2 >= δ >= 10^-2 ? new(β,δ) : error("out of order")
end
