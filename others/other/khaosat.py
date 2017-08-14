#!/usr/bin/env python3
DIRECTIONS = {'E': (1, 0), 'W': (-1, 0), 'S': (0, -1), 'N': (0, 1)}

current, memory = (0, 0), {(0, 0): 0}
with open('KHAOSAT.INP') as fi, open('KHAOSAT.OUT', 'w') as fo:
    for c in fi.read().rstrip():
        prev, current = current, tuple(map(sum, zip(current, DIRECTIONS[c])))
        memory.setdefault(current, memory[prev] + 1)
    print(memory[current], file=fo)
