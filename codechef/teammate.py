#!/usr/bin/env python3
from collections import defaultdict

for _ in range(int(input())):
    n = int(input())
    s = map(int, input().split())
    d = defaultdict(int)
    for i in s: d[i] += 1
    result = 0
    for value in s.values():
        if value % 2:
            pass
        else:
            result += value * (value-1) // 2
