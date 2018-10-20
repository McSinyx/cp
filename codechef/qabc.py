#!/usr/bin/env python2
from operator import not_, sub
from sys import stdin

for _ in xrange(int(stdin.readline())):
    n = int(stdin.readline())
    a = map(int, stdin.readline().split())
    b = map(int, stdin.readline().split())
    c = map(sub, b, a)
    for i in xrange(n - 2):
        if c[i] < 0:
            print 'NIE'
            break
        c[i + 1] -= c[i] * 2
        c[i + 2] -= c[i] * 3
    else:
        if n < 3:
            print 'NIE' if any(c) else 'TAK'
        else:
            print 'TAK' if c[-2] == c[-1] == 0 else 'NIE'
