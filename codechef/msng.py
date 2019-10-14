#!/usr/bin/env python3
from collections import Counter

for t in range(int(input())):
    n, x = int(input()), []
    for i in range(n):
        b, y = input().split()
        if b == '-1':
            guesses = set()
            for b in range(2, 37):
                try:
                    guess = int(y, b)
                except ValueError:
                    pass
                else:
                    if guess > 10 ** 12: break
                    guesses.add(guess)
            x.extend(guesses)
        else:
            guess = int(y, int(b))
            if guess <= 10 ** 12: x.append(guess)
    try:
        print(min(k for k, v in Counter(x).items() if v == n))
    except ValueError:
        print(-1)
