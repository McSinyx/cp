#!/usr/bin/env python3
with open('DEFRAC.INP') as f:
    v, n, m = map(int, f.readline().split())
    t, l, b = tuple(map(int, f.readline().split())), [], -1

for i in range(n):
    a, b, p = t[i * 2], t[i*2 + 1], b
    tmp = a - p - 1
    if i: l[-1].extend([tmp, l[-1][1] + tmp >= m])
    l.append([b - a + 1, tmp])
tmp = v - b - 1
l[-1].extend([tmp, l[-1][1] + tmp >= m])
s = sorted(l, key=(lambda i: i[1]), reverse=True)

with open('DEFRAC.OUT', 'w') as f:
    if s[0][1] >= m:
        f.write('0\n')
    else:
        best = None
        for i, v in enumerate(l):
            if best is None or v < best:
                if v[-1]:
                    best = v[0], i
                elif sum(v[:3]) >= m:
                    for j in s:
                        if j is not v and j[1] >= v[0]:
                            best = v[0], i
                            break
        if best is None:
            f.write('-1\n')
        else:
            print(best[1] + 1, file=f)
