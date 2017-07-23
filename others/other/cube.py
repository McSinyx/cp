#!/usr/bin/env python3
from collections import deque


def same(*a): return all(len(set(i)) == 1 for i in a)


def add(h, k):
    d = deque(zip(h, k))
    for _ in range(3):
        if same(d[1], d[2]): yield sorted((sum(d[0]), d[1][0], d[2][1]))
        d.rotate()


def cube(d):
    for _ in range(3):
        for i in add(d[0], d[1]):
            for j in add(i, d[2]):
                if same(j): return 'TRUE'
        d.rotate()
    return 'FALSE'


for _ in range(int(input())):
    d = deque(sorted(map(int, input().split())) for _ in range(3))
    print(cube(d))
