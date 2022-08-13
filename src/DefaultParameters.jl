export Parameters
"""
Default values for the parameters birth (param.β) and death (param.δ)
#Arguments
    - `β::Number`: parameters birth. 1000 >= β >= 0.001 
    - `δ::Number`: parameters death. 1000 >= δ >= 0.001 
"""
struct Parameters 
    β::Number
    δ::Number
    Parameters(β,δ) = 10^2 >= β >= 10^-2 && 10^2 >= δ >= 10^-2 ? new(β,δ) : error("out of order")
end
