#!/usr/bin/env python3
for _ in range(int(input())):
    n, d = input().split()
    n, d = [int(x) for x in n], int(d)
    for i in range(-1, -1-len(n), -1):
        if n[i] > d:
            n[i] = d
        else:
            break
    for i in range(i, -len(n), -1):
        if n[i] < n[i-1]:
            n.pop(i - 1)
            n.append(d)
    print(''.join(map(str, n)))
