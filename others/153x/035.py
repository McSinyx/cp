#!/usr/bin/env python3

from itertools import permutations

with open("PERMUTE.INP") as f:
    l = sorted(set(permutations(f.readline().strip())))

with open("PERMUTE.OUT", "w") as f:
    f.write("{}\n".format(len(l)))
    for i in l:
        f.write("".join(i) + '\n')
