#!/usr/bin/env python3
for t in range(int(input())):
    e, p = input(), input()
    a, b = int(e, 2), int(p, 2)
    count = 0
    while b:
        a, b = a^b, (a&b)<<1
        count += 1
    print(count)
