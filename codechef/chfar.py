#!/usr/bin/env python3
for _ in range(int(input())):
    n, k = map(int, input().split())
    print('NO' if input().split().count('1') + k < n else 'YES')
