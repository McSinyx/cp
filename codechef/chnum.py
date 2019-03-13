#!/usr/bin/env python3
from collections import Counter

for _ in range(int(input())):
    input()
    sizes = Counter(z // abs(z) for z in map(int, input().split())).values()
    print(max(sizes), min(sizes))
