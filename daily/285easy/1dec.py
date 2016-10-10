#!/usr/bin/env python3

from binascii import a2b_uu

with open('1dec.inp') as fi, open('1dec.out', 'w') as fo:
    for line in fi:
        fo.write(a2b_uu(bytes(line, 'ascii')).decode())
