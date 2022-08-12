using QuadGK

export gaussKronrod

function gaussKronrod(t, T)
    # https://en.wikipedia.org/wiki/Gauss%E2%80%93Kronrod_algorithm

    quadgk( n -> x - δ * n , t, T, rtol=1e-8)

end


integral, err = quadgk( n -> x_interval - d * n , t_init, t_end, rtol=1e-8)