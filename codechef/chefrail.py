#!/usr/bin/env python
from itertools import count, takewhile
from typing import Iterator, Set


def binary(i: int, h: int) -> Iterator[int]:
    while h % i == 0:
        yield i
        i <<= 1


def rail(x: Set[int], y: Set[int]) -> int:
    result = 0
    for h in map(abs, x):
        result += -h in y and h in y
        if h < 2: continue

        k, z = h, list(takewhile(lambda j: j < h, binary(1, h*h)))
        while k % 2 == 0: k >>= 1
        for i in takewhile(lambda j: j*j <= k, count(3, 2)):
            start, stop = 0, len(z)
            while k % i == 0:
                k //= i
                z.extend(i*j for j in z[start:stop] if i*j < h)
                start, stop = stop, len(z)
                z.extend(i*j for j in z[start:stop] if i*j < h)
                start, stop = stop, len(z)
        if k > 1:
            start, stop = 0, len(z)
            z.extend(k*j for j in z[start:stop] if k*j < h)
            start, stop = stop, len(z)
            z.extend(k*j for j in z[start:stop] if k*j < h)

        for i in z:
            j = h * h // i
            result += (-i in y and j in y) + (i in y and -j in y)
    return result


for t in range(int(input())):
    input()
    x = set(map(int, input().split()))
    y = set(map(int, input().split()))

    zero = 0 in x or 0 in y
    if 0 in x: x.remove(0)
    if 0 in y: y.remove(0)
    print((zero and len(x)*len(y)) + rail(x, y) + rail(y, x))
