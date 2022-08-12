using QuadGK

export gaussKronrod

function gaussKronrod(β, δ, T)
    # https://en.wikipedia.org/wiki/Gauss%E2%80%93Kronrod_algorithm
    return quadgk( n -> β - δ * n , 0, T, rtol=1e-8)
end


integral, err = quadgk( n -> x_interval - d * n , t_init, t_end, rtol=1e-8)