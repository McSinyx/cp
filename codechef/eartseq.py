#!/usr/bin/env python3
from math import gcd
from itertools import cycle, islice
from sys import stdin

CANDIDATES = cycle(range(2, 30000))

a, b, new = 30011, 30013, {}
coprimes, result = [a, b], [a * b]
for _ in range(49998):
    for i in CANDIDATES:
        if new.get(b * i, True) and gcd(a, i) == 1 == gcd(b, i):
            coprimes.append(i)
            a, b = b, i
            break
    new[a * b] = False
    result.append(a * b)

next(stdin)
for N in map(int, stdin):
    N -= 1
    print(coprimes[N] * 30011, end=' ')
    print(*islice(result, N))
