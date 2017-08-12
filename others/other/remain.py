#!/usr/bin/env python3
from functools import reduce
from math import gcd


with open('remain.inp') as f:
    f.readline()
    s = set(map(int, f.readline().split()))

with open('remain.out', 'w') as f:
    print(abs(reduce(gcd, map(s.pop().__sub__, s))), file=f)
