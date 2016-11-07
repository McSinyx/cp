#!/usr/bin/env python3

from itertools import islice
from bisect import bisect_left as bisect


with open('dict.inp') as fi, open('dict.out', 'w') as fo:
    words = list(islice(fi, int(fi.readline())))
    words.sort()

    for _ in range(int(fi.readline())):
        s = fi.readline().strip()
        i = bisect(words, s)
        count = 0
        while i + count < len(words) and words[i + count].startswith(s):
            count += 1
        fo.write("{}\n".format(count))
