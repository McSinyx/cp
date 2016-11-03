#!/usr/bin/env python3

TESTS = (4, 3, 5, 6, 111, 222, 3333, 4444, 55555, 666666, 7777777, 88888888,
         999999999, 123456789123456789, 1000000000000000000)

# Fomular from http://mathworld.wolfram.com/TriangleTiling.html
n = lambda a: a * (a + 2) * (a * 2 + 1) // 8 % 2016

with open('TRIGRID.TXT', 'w') as f:
    for a in TESTS:
        f.write("{}\n".format(n(a)))
