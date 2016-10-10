#!/usr/bin/env python3

from binascii import b2a_uu

with open('1enc.inp') as f:
    s = f.read()

with open('1enc.out', 'w') as f:
    for i in range(0, n, 45):
        f.write(b2a_uu(bytes(s[i : i+45], 'utf-8')).decode())
