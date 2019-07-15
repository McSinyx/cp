#!/usr/bin/env python3
for _ in range(int(input())):
    input()
    a = [int(i) for i in input().split()]
    d, m = divmod(sum(a), len(a))
    if m:
        print('Impossible')
        continue
    try:
        print(a.index(d) + 1)
    except ValueError:
        print('Impossible')
