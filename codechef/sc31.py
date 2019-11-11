#!/usr/bin/env python3
from functools import reduce

for t in range(int(input())):
    print(bin(reduce(int.__xor__, (int(input(), 2)
                                   for i in range(int(input()))))).count('1'))
