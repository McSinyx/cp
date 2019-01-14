#!/usr/bin/env python3
from bisect import bisect_left as bsearch

input()
X, A = zip(*sorted(enumerate(map(int, input().split())), key=lambda t: t[1]))
Y, B = zip(*sorted(enumerate(map(int, input().split())), key=lambda t: t[1]))

N, M = len(A), len(B)
i = j = 0
for _ in range(N + M - 1):
    print(X[i], Y[j])
    try:
        if A[i + 1] < B[j + 1]: i += 1
        else: j += 1
    except IndexError:
        if i + 1 < N: i += 1
        else: j += 1
