#!/usr/bin/env python3

a = (4, 3, 5, 6, 111, 222, 3333, 4444, 55555, 666666, 7777777, 88888888,
     999999999, 123456789123456789, 1000000000000000000)

t = lambda n: n * (n + 2) * (n * 2 + 1) // 8 % 2016

with open('TRIGRID.TXT', 'w') as f:
    for i in a:
        f.write("{}\n".format(t(i)))
