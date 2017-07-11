#!/usr/bin/env python3
from fractions import Fraction
from functools import reduce
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

    length : int
       Maximum length for coef
    """
    MAXLEN = 1001

    def __init__(self, coef, length=None):
        self.coef = list(coef)[:(length or Polynomial.MAXLEN)+1]

    def __len__(self):
        """Return len(self)."""
        return len(self.coef)

    def __getitem__(self, term):
        """Return coefficient of the corresponding term."""
        try:
            return self.coef[term]
        except IndexError:
            return 0

    def __iter__(self):
        return iter(self.coef)

    def __repr__(self):
        return 'Polynomial({})'.format(self.coef)

    def __add__(self, value):
        """Return self+value."""
        length = max(len(self), len(value))
        return Polynomial((self[i]+value[i] for i in range(length)))

    def __mul__(self, value):
        """Return self*value."""
        if isinstance(value, Polynomial):
            l = []
            for i in range(min(len(self) + len(value) - 1, Polynomial.MAXLEN)):
                l.append(sum(value[i - j] * c for j, c in enumerate(self)
                             if 0 <= i - j < len(value)))
            return Polynomial(l)

        if isinstance(value, (int, float, complex, Fraction)):
            return Polynomial((i * value for i in self.coef))

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
    EXPPOLY = Polynomial((Fraction(1, factorial(i)) for i in range(Polynomial.MAXLEN)))

    def __init__(self, degree):
        Polynomial.__init__(self, ExpPoly.EXPPOLY.coef, length=degree)


def chonso(m, a):
    t = tuple(min(a.count(i), m) for i in set(a))
    d = {i: t.count(i) for i in set(t)}
    Polynomial.MAXLEN = m + 1
    g = (ExpPoly(k) ** v for k, v in d.items())
    return reduce(mul, g, factorial(m))[-1].numerator


if __name__ == '__main__':
    with open('chonso.inp') as fi, open('chonso.out', 'w') as fo:
        n, m = map(int, fi.readline().split())
        a = tuple(int(i) for i in fi.readline().split())[:n]
        print(chonso(m, a) % (10**12 + 7), file=fo)
