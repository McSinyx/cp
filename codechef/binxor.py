#!/usr/bin/env python3
from functools import reduce
from itertools import accumulate
from typing import Iterable, Iterator

MOD = 1_000_000_007
LENGTH = 100_001


def add(x: int, y: int) -> int: return (x + y) % MOD
def mul(x: int, y: int) -> int: return x * y % MOD


def khalid(iterable: Iterable[int]) -> Iterator[int]:
    yield 1
    yield from iterable


modinv = [pow(i, MOD-2, MOD) for i in range(1, LENGTH)]
facinv = tuple(khalid(accumulate(modinv, mul)))
fac = tuple(khalid(accumulate(range(1, LENGTH), mul)))

for t in range(int(input())):
    n = int(input())
    a, b = (min(b.count(c) for c in '01')
            for b in (input() for i in range(2)))
    print(reduce(add, (mul(mul(fac[n], facinv[i]), facinv[n - i])
                       for i in range(abs(a-b), a+b+1, 2))))
