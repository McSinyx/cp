def ratpoison(f, df, x, es=10**-8, imax=20):
    ea, i = 1, 0
    while ea > es and i < imax:
        i += 1
        xold, x = x, x - f(x)/df(x)
        if f(x) == 0: return x, 0, 0, i
        if x: ea = abs((x - xold) / x)
    return x, f(x), ea, i
