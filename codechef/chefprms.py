#!/usr/bin/env python3
from itertools import combinations, combinations_with_replacement
from operator import add, mul


def prime(n):
    """Check if n is a prime using trial division."""
    for i in range(2, n):
        if not n%i: return False
    return True


def up200(n): return n <= 200
def apply(f): return lambda x: f(*x)


primes = filter(prime, range(2, 200))
semis = set(filter(up200, map(apply(mul), combinations(primes, 2))))
chefprms = filter(up200, map(apply(add),
                             combinations_with_replacement(semis, 2)))
print(len(set(chefprms)))
