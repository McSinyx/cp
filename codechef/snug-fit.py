#!/usr/bin/env python
for t in range(int(input())):
    input()
    print(sum(map(min, sorted(map(int, input().split())),
                  sorted(map(int, input().split())))))
