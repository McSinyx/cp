#!/usr/bin/env python3

with open("DIFFSUM.INP") as f:
    n = int(f.readline())

a = list(range(2, int((n * 8 + 9) ** 0.5 - 3) // 2 + 1))
a.append(n - sum(a))

while len(a) > 1 and a[-1] - a[-2] > 2:
    for i in reversed(range(1, len(a))):
        delta = (a[i] - 1 - a[i - 1]) // 2
        if delta > 0:
            a[i] -= delta
            a[i - 1] += delta

with open("DIFFSUM.OUT", "w") as f:
    f.write(' '.join(map(str, a)) + '\n')
