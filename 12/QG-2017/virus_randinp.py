#!/usr/bin/env python3
import random
import string

with open('VIRUS.INP', 'w') as f:
    f.write('10\n')
    for _ in range(3000):
        f.write(random.choice(string.ascii_lowercase))
    f.write('\n0\n1\n2\n3\n5\n6\n7\n8\n9\n10\n')
