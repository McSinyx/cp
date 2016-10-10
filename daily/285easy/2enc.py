#!/usr/bin/env python3

enc = lambda n: ' '.join([str(i) for i in n // 255 * [255] + [n % 255]])

with open('2enc.inp') as fi, open('2enc.out', 'w') as fo:
    for line in fi:
        fo.write(' '.join([enc(int(n)) for n in line.split()]) + '\n')
