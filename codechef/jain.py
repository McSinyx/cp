#!/usr/bin/env python3
from itertools import combinations

for _ in range(int(input())):
    print(sum(len(a | b) == 5 for a, b in combinations(
        (set(input()) for d in range(int(input()))), 2)))
