#!/usr/bin/env python3
from heapq import heapify, heappop, heappush


with open('NUOC.INP') as f:
    m, n = map(int, f.readline().split())
    height = [[int(i) for i in line.split()] for line in f]

queue = ([(h, 0, i) for i, h in enumerate(height[0])]
         + [(h, m - 1, i) for i, h in enumerate(height[-1])]
         + [(height[i][0], i, 0) for i in range(m)]
         + [(height[i][-1], i, n - 1) for i in range(m)])
heapify(queue)
visited = ([[True] * n]
           + [[True] + [False] * (n - 2) + [True] for _ in range(m - 2)]
           + [[True] * n])
result = 0

while queue:
    h, i, j = heappop(queue)    
    for x, y in (i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1):
        if 0 <= x < m and 0 <= y < n and not visited[x][y]:
            result += max(0, h - height[x][y])
            heappush(queue, (max(height[x][y], h), x, y))
            visited[x][y] = True

with open('NUOC.OUT', 'w') as f: print(result, file=f)
