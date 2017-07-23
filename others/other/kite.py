#!/usr/bin/env python3
from bisect import bisect_left, insort

with open('KITE.INP') as inp, open('KITE.OUT', 'w') as out:
    n, a = inp.readline(), []
    for line in inp:
        x = -int(line)
        insort(a, x)
        print(bisect_left(a, x) + 1, file=out)
