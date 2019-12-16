#!/usr/bin/env python3
print(*(sum(dict(sorted((int(p), p in '12345678' and int(s))
                        for p, s in (input().split()
                                     for i in range(int(input()))))).values())
        for t in range(int(input()))), sep='\n')
