#!/usr/bin/env python3
ADJ = (1, 0), (0, 1), (-1, 0), (0, -1)

for i in range(int(input())):
    fences = set()
    n, m, k = map(int, input().split())
    for j in range(k):
        row, col = map(int, input().split())
        for dr, dc in ADJ:
            r, c = row + dr, col + dc
            try:
                fences.remove((r, c, row, col))
            except KeyError:
                fences.add((row, col, r, c))
    print(len(fences))
