#!/usr/bin/env python3
d = dict()
with open('bai3.inp') as f:
    for i in f.readlines():
        for j in '.,;!?':
            i = i.replace(j, ' ')
        for j in i.split():
            d[j] = d.get(j, 0) + 1
l = [(value, key) for (key, value) in d.items()]
l.sort(reverse=True)
with open('bai3.out', 'w') as f:
    f.write(str(len(l)) + '\n')
    for i, j in l:
        f.write('{} {}\n'.format(i, j))
