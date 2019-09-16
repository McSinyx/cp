#!/usr/bin/env python3
from collections import Counter
from functools import reduce

def mod(n): return n % 1_000_000_007

def cha1n(iterable):
    yield 1
    yield from iterable

n, k = map(int, input().split())
counts = tuple(Counter(map(int, input().split())).values())
if len(counts) <= k:
    print(reduce(lambda x, y: mod(x * (y+1)), counts, 1))
else:
    s = [0] * k
    for c in counts: s = [mod(x + y*c) for x, y in zip(s, cha1n(s))]
    print(mod(sum(s, 1)))
