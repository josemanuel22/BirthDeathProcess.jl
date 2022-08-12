using QuadGK

export gaussKronrod

function gaussKronrod(f, a, b, n)
    x = linspace(a, b, n)
    y = f(x)
    w = ones(n, 1)
    return QuadGK.integrate(x, y, w)
end


integral, err = quadgk( n -> x_interval - d * n , t_init, t_end, rtol=1e-8)