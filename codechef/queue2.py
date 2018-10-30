#!/usr/bin/env python3
for _ in range(int(input())):
    n, m, k, l = map(int, input().split())
    m *= l
    d = {0: m, k: m - k + n*l}
    for i, a in enumerate(sorted(map(int, input().split()))):
        d[a] = m - a + i*l
    print(min(d.values()) + l)
