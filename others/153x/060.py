#!/usr/bin/env python3
from fractions import Fraction


def dec_div(n):
    return n, l2, l5


def decimal(fraction):
    a, b, l2, l5 = fraction.numerator, fraction.denominator, 0, 0
    if b == 1: return '{}\n'.format(a)
    while not b % 2:
        b //= 2
        l2 += 1
    while not b % 5:
        b //= 5
        l5 += 1
    b2, b5, finited = 2 ** l2, 5 ** l5, 10 ** max(l2, l5)
    if b == 1: return '{}\n'.format(a / (b2*b5))
    finiten = a * finited // b2 // b5 // b
    finite = str(finiten / finited).rstrip('0')
    f = Fraction(a, b * b2 * b5) - Fraction(finiten, finited)
    a, b, d9 = f.numerator, f.denominator // finited, 9
    while d9 % b: d9 = d9*10 + 9
    return '{}({})\n'.format(finite, a * d9 // b)


with open('DECIMAL.INP') as fi, open('DECIMAL.OUT', 'w') as fo:
    for line in fi:
        fo.write(decimal(Fraction(*map(int, line.split()))))
