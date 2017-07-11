#!/usr/bin/env python3
from fractions import Fraction
from functools import reduce
from itertools import permutations
from math import factorial
from operator import floordiv, mul


class Polynomial:
    """A fixed-length power series class.

    The Polynomial class is made to calculate the number of permutations
    and combinations using generating function, so it only provides '+',
    '*', '**' methods and doesn't support negative power degrees.

    Parameters
    ----------
    coef : iterable of numeric objects
       Polynomial coefficients in order of increasing degree, i.e.,
       ``(1, 2, 3)`` give ``1 + 2*x + 3*x**2``.

    maxdeg : int
       Highest degree the polynomial will hold.
    """
    def __init__(self, coef, maxdeg):
        self.coef = [c for i, c in enumerate(coef) if i <= maxdeg]
        self.coef += [0] * (maxdeg - len(self.coef) + 1)
        self.maxdeg = maxdeg

    def __len__(self):
        """Return len(self)."""
        return self.maxdeg + 1

    def __getitem__(self, term):
        """Return coefficient of the corresponding term."""
        return self.coef[term] if -len(self) <= term <= self.maxdeg else 0

    def __setitem__(self, term, coefficient):
        """Set coefficient of the corresponding term."""
        if 0 <= term <= self.maxdeg: self.coef[term] = coefficient

    def __repr__(self):
        return 'Polynomial({})'.format(self.coef)

    def __rshift__(self, value):
        """Return self with coefficients shifted value positions to the
        right (syntactic sugar).
        """
        return Polynomial(([0] * value + self.coef)[:len(self)], self.maxdeg)

    def __add__(self, value):
        """Return self+value."""
        length = max(len(self), len(value))
        return Polynomial([self[i]+value[i] for i in range(length)], length-1)

    def __mul__(self, value):
        """Return self*value."""
        if isinstance(value, Polynomial):
            res = Polynomial([], self.maxdeg)
            for i, c in enumerate(value.coef):
                res += (self >> i) * c
            return res
        if isinstance(value, (int, float, complex, Fraction)):
            return Polynomial([i * value for i in self.coef], self.maxdeg)
        err = "unsupported operand type(s) for *: 'Polynomial' and '{}'"
        raise TypeError(err.format(type(value).__name__))

    def __rmul__(self, value):
        """Return value*self."""
        return self * value

    def __pow__(self, value):
        """Return self**value."""
        if value == 1: return self
        tmp = self ** (value//2)
        if value % 2: return tmp * self * tmp
        return tmp * tmp


class ExpPoly(Polynomial):
    """Exponential polynomial, with highest degree of 1000."""
    maxdeg = 1000
    EXPPOLY = Polynomial([Fraction(1, factorial(i)) for i in range(maxdeg + 1)],
                         maxdeg)

    def __init__(self, degree, maxdeg):
        Polynomial.__init__(self, ExpPoly.EXPPOLY.coef[:degree+1], maxdeg)


def chonso(m, a):
    t = tuple(a.count(i) for i in set(a))
    d = {i: t.count(i) for i in set(t)}
    ExpPoly.maxdeg = m
    g = [ExpPoly(k, m) ** v for k, v in d.items()]
    print(t, d, g)
    return reduce(mul, g, factorial(m))[-1].numerator


if __name__ == '__main__':
    with open('chonso.inp') as f:
        n, m = map(int, f.readline().split())
        a = tuple(int(i) for i in f.readline().split())[:n]

    with open('chonso.out', 'w') as f: print(chonso(m, a) % (10**12 + 7), file=f)
