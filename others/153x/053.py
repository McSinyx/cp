#!/usr/bin/env python3
with open('MAP.INP') as fi, open('MAP.OUT', 'w') as fo:
    x = y = 0
    for i in fi.read().rstrip():
        if i == 'E':
            x -= 1
        elif i == 'W':
            x += 1
        elif i == 'N':
            y -= 1
        else:
            y += 1
    fo.write(('E' if x > 0 else 'W') * abs(x)
             + ('N' if y > 0 else 'S') * abs(y) + '\n')
