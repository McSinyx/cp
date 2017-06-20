#!/usr/bin/env python3
from functools import reduce

primes_dict = dict.fromkeys(range(3, 31608, 2), True)
primes_dict[2] = True
for i in range(3, 174, 2):
    if primes_dict[i]:
        primes_dict.update(dict.fromkeys(range(i * i, 31608, i * 2), False))
primes = [key for key, value in primes_dict.items() if value]
primes.sort()

with open('uocso.inp') as fi, open('uocso.out', 'w') as fo:
    a, b, counts = *map(int, fi.read().split()), {}
    for n in range(a, b + 1):
        l = []
        for p in primes:
            if p > n: break
            m, tmp = 0, n
            while not tmp % p:
                tmp //= p
                m += 1
            l.append(m)
        counts[n] = reduce(int.__mul__, (m + 1 for m in l)) if sum(l) else 2

    cmin = max(counts.values())
    for n in range(a, b + 1):
        if counts[n] == cmin:
            nmin, count = n, 1
            break
    for n in range(nmin + 1, b + 1):
        if counts[n] == cmin: count += 1
    print(nmin, cmin, count, file=fo)
