#!/usr/bin/env python3
from collections import defaultdict

for t in range(int(input())):
    n, x = map(int, input().split())
    a, edges = [int(i) for i in input().split()], defaultdict(list)
    for _ in range(1, n):
        u, v = (int(i) - 1 for i in input().split())
        edges[u].append(v)
        edges[v].append(u)

    queue, parents, walked = [0], [0] * n, [not i for i in range(n)]
    for i in queue:
        for j in edges[i]:
            if walked[j]: continue
            walked[j], parents[j] = 1, i
            queue.append(j)

    net, profit = a.copy(), a.copy()
    queue.reverse()
    queue.pop()
    for i in queue:
        parent, profit[i] = parents[i], max(net[i], -x, profit[i])
        net[parent] += net[i]
        profit[parent] += profit[i]
    print(max(net[0], -x, profit[0]))
