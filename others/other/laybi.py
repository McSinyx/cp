#!/usr/bin/env python3
from itertools import combinations as C

with open('laybi.inp') as fi, open('laybi.out', 'w') as fo:
    m = map(int, fi.read().split())
    fo.write('NO\n' if all(int.__sub__(*i) % 3 for i in C(m, 2)) else 'YES\n')
