#!/usr/bin/env python3
PRIMES = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61,
          67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137,
          139, 149, 151, 157, 163, 167, 173)


def factor(x):
    d = {}
    for i in PRIMES:
        if not x % i:
            d[i] = d.get(i, 0) + 1
            x //= i
    if x > 1: d[x] = 1
    return d


with open('MAXNUM.INP') as f:
    n, p, d = *map(int, f.readline().split()), {}

for i in range(2, n + 1):
    for k, v in factor(i).items():
        d[k] = d.get(k, 0) + v

with open('MAXNUM.OUT', 'w') as f:
    print(min(d[k] // v for k, v in factor(p).items()), file=f)
