#!/usr/bin/env python3
from functools import reduce
from math import gcd

for t in range(int(input())):
    N, a, b = map(int, input().split())
    lcm = a * b // gcd(a, b)
    rm = map(lambda x: (x%a==0, x%lcm==0, x%b==0), map(int, input().split()))
    Bob, both, Alice = reduce(lambda x, y: map(int.__add__, x, y), rm)
    print('BOB' if Bob + bool(both) > Alice else 'ALICE')
