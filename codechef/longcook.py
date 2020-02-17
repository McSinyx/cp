#!/usr/bin/env python
from calendar import isleap
from datetime import datetime

OVERLAP = [datetime(i or 400, 2, 7).weekday()
           in ([4] if isleap(i or 400) else [4, 5]) for i in range(400)]
OOP = sum(OVERLAP)


def longcook(start, end):
    delta = end - start
    if delta <= 0: return 0
    return delta//400*OOP + sum(OVERLAP[y % 400]
                                for y in range(start, start + delta%400))


for t in range(int(input())):
    m1, y1 = map(int, input().split())
    m2, y2 = map(int, input().split())
    print(longcook(y1+(m1>2), y2+(m2!=1)))
