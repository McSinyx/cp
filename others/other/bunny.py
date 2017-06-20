#!/usr/bin/env python3
with open('bunny.inp') as fi, open('bunny.out', 'w') as fo:
    # OEIS A069905 (http://oeis.org/A069905)
    print(((int(fi.read()) + 3) ** 2 + 6) // 12 % 10 ** 6, file=fo)
