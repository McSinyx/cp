#!/usr/bin/env python3

with open("CUT.INP") as f:
    m, n = map(int, f.readline().split())

squares = []
while m - n:
    if m > n:
        m -= n
        squares.append("{} 1 {}\n".format(m + 1, n))
    else:
        n -= m
        squares.append("1 {} {}\n".format(n + 1, m))
squares.append("1 1 {}\n".format(m))

with open("CUT.OUT", "w") as f:
    f.write("{}\n".format(len(squares)))
    for i in squares:
        f.write(i)
