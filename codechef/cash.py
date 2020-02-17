#!/usr/bin/env python
for t in range(int(input())):
    n, k = map(int, input().split())
    print(sum(map(int, input().split())) % k)
