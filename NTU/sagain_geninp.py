#!/usr/bin/env python3

from random import choice, randint
from string import ascii_lowercase


with open('sagain.txt', 'w') as f:
    length = randint(1, 2000000)
    k = str(randint(1, min(length, 1000))) + '\n'
    f.write(k)
    for _ in range(length):
        f.write(choice(ascii_lowercase))
    f.write('\n')
