#!/usr/bin/env python3

from math import gcd

minx, maxx, miny, maxy = map(int, input().split())
n, step, z, s, d = int(input()), maxy - miny, len(str(maxy)), {minx, maxx}, {}
for i in range(n):
    start, end, freq = map(int, input().split())
    step = gcd(step, freq - miny)
    s.update({start, end})
    d[start] = freq
points = sorted(s)
spaces = [' ' * len(str(i)) for i in points]
for i in points:
    d.setdefault(i, 0)
while maxy >= miny:
    print(str(maxy).rjust(z), end='')
    for i, point in enumerate(points[:-1]):
        print(spaces[i], '*' if d[point] >= maxy else ' ', sep='', end='')
    print(spaces[-1])
    maxy -= step
print(' ' * z, ' '.join(str(i) for i in points), sep='')
