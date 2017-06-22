#!/usr/bin/env python3
from collections import deque
with open('CLIST.INP') as fi, open('CLIST.OUT', 'w') as fo:
    n, k, l = map(int, fi.readline().split())
    d = deque(map(int, fi.readline().split()))
    d.rotate(int(fi.read()) * (l - k) % n)
    print(*d, file=fo)
