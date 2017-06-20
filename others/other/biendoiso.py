#!/usr/bin/env python3
from math import gcd


def xgcd(a, b):
    """Return a tuple (u, v), such that u*a + v*b == gcd(a, b).

    https://en.wikibooks.org/wiki/Algorithm_Implementation/Mathematics/Extended_Euclidean_algorithm#Iterative_algorithm
    """
    u0, u1, v0, v1 = 1, 0, 0, 1
    while b:
        q, a, b = a // b, b, a % b
        u0, v0, u1, v1 = u1, v1, u0 - q*u1, v0 - q*v1
    return u0, v0


def biendoiso(a, b, c):
    g = gcd(a, b)
    if c % g:
        return -1
    elif not c % a:
        return c // a
    elif not c % b:
        return c // b
    if a > b: a, b = b, a
    u, v = map(lambda n: n * c // g, xgcd(a, b))
    m = u * g // b
    return u + v + m*(a-b)


with open('biendoiso.inp') as fi, open('biendoiso.out', 'w') as fo:
    x, y, a, b = map(int, fi.read().split())
    fo.write('{}\n'.format(biendoiso(a, b, y - x)))
