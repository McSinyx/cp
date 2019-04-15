#!/usr/bin/env python3
from bisect import bisect   # bisect takes no key argument. What a dick.

input()
a = [-int(i) for i in input().split()]
a.sort()

res = 0
for i in a:
    if i > res: break
    for j in range(i, a[0] + i, i):
        idx = bisect(a, j)
        try:
            tmp = a[idx] % i
        except IndexError:
            continue
        if tmp < res: res = tmp
        if res == i + 1: break

print(-res)
