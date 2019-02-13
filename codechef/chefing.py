#!/usr/bin/env python3
from functools import reduce
from operator import and_

for _ in range(int(input())):
    print(len(reduce(and_, (set(input()) for _ in range(int(input()))))))
