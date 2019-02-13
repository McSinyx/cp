#!/usr/bin/env python3
for _ in range(int(input())):
    input()
    a, d = ([int(i) for i in input().split()] for _ in range(2))
    a.extend((a[0], a[-1]))
    try:
        print(max(d for i, d in enumerate(d) if d > a[i-1] + a[i+1]))
    except ValueError:
        print(-1)
