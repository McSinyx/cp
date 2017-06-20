#!/usr/bin/env python3
with open('express.inp') as fi, open('express.out', 'w') as fo:
    a = tuple(map(int, fi.read().split()))[1:]
    print(max(
        sum(a[:i]) + a[i]*a[i+1] + sum(a[i+2:j]) + a[j]*a[j+1] + sum(a[j+2:])
        for i in range(len(a) - 3) for j in range(i + 2, len(a) - 1)), file=fo)
