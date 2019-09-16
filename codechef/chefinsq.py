#!/usr/bin/env python3
from bisect import bisect_left, bisect_right
from functools import reduce
from math import factorial


def c(n, r):
    return reduce(int.__mul__, range(n, n - r, -1), 1) // factorial(r)


for t in range(int(input())):
    n, k = map(int, input().split())
    a = sorted(map(int, input().split()))
    l, r = bisect_left(a, a[k - 1]), bisect_right(a, a[k - 1])
    print(c(r - l, min(k - l, r - k)))
