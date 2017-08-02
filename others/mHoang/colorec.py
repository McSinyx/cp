#!/usr/bin/env python3
from itertools import combinations

COLORS = {1, 2, 3, 4}

with open('COLOREC.INP') as f:
    f.readline()
    color, exes, eyes, count = {}, {}, {}, 0
    for line in f:
        x, y, c = map(int, line.split())
        color[x, y] = c
        exes.setdefault(y, [])
        exes[y].append(x)
        eyes.setdefault(x, [])
        eyes[x].append(y)

for v in eyes.values(): v.sort()
for y0, l in exes.items():
    for x0, x1 in combinations(l, 2):
        s = COLORS - {color[x0, y0], color[x1, y0]}
        if len(s) > 2: continue
        for y1 in eyes[x0][y0:]:
            try:
                count += not s - {color[x0, y1], color[x1, y1]}
            except:
                continue

with open('COLOREC.OUT', 'w') as f: print(count, file=f)
