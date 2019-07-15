#!/usr/bin/env python3
for _ in range(int(input())):
    n = int(input())
    k = int(input())
    m = k % n
    print(min(m * 2, (n - m) * 2, n - 1))
