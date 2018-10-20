#!/usr/bin/env python2
from bisect import bisect_right
from sys import stdin

for _ in xrange(int(stdin.readline())):
    n, k = map(int, stdin.readline().split())
    s = [1000000000 - int(i) for i in stdin.readline().split()]
    s.sort()
    print bisect_right(s, s[k - 1])
