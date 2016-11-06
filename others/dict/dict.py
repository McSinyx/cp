#!/usr/bin/env python3

from bisect import bisect_left as bisect

words = []


with open('dict.inp') as fi, open('dict.out', 'w') as fo:
    for _ in range(int(fi.readline())):
        w = fi.readline().strip()
        i = bisect(words, w)
        if i == len(words) or w != words[i]:
            words.insert(i, w)

    for _ in range(int(fi.readline())):
        s = fi.readline().strip()
        i = bisect(words, s)
        count = 0
        while i + count < len(words) and words[i + count].startswith(s):
            count += 1
        fo.write("{}\n".format(count))
