#!/usr/bin/env python3
with open('HINHVUONG.INP') as fi, open('HINHVUONG.OUT', 'w') as fo:
    A, B, C, D = sorted([int(i) for i in s.split()] for s in fi.readlines())
    if A[0] != B[0] or C[0] != D[0] or A[1] != C[1] or B[1] != D[1]:
        fo.write('-1\n')
    else:
        print((B[0]-C[0]) ** 2, file=fo)
