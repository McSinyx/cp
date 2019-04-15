#!/usr/bin/env python3
from collections import defaultdict, deque
from math import gcd

for t in range(int(input())):
    n, edges = int(input()), defaultdict(list)
    for _ in range(1, n):
        x, y = (int(i) - 1 for i in input().split())
        edges[x].append(y)
        edges[y].append(x)
    v = [int(i) for i in input().split()]
    m = [int(i) for i in input().split()]

    queue, count = deque([0]), defaultdict(int, {0: 1})
    while queue:
        i = queue.popleft()
        for j in edges[i]:
            count[j] += 1
            if count[j] > 1: continue
            v[j] = gcd(v[i], v[j])
            queue.append(j)
    print(*(m[i] - gcd(v[i], m[i]) for i in range(n) if count[i] == 1))
