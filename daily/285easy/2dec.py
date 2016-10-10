#!/usr/bin/env python3

tmp = 0

with open('2dec.inp') as fi, open('2dec.out', 'w') as fo:
    for line in fi:
        l = []
        for n in line.split():
            tmp += int(n)
            if n != '255':
                l.append(str(tmp))
                tmp = 0
        fo.write(' '.join(l) + '\n')
