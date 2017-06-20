#!/usr/bin/env python3
from collections import deque


def not_square(A, B, C):
    """Return False is ABC is a square angle, True otherwise."""
    return (B[0]-A[0])*(B[0]-C[0]) + (B[1]-A[1])*(B[1]-C[1])


def parallelogram_last_point(A, B, C):
    """Return the (x, y) coordinates of the point D of the parallelogram
    ABCD.
    """
    return A[0] - B[0] + C[0], A[1] - B[1] + C[1]


with open('hcn.inp') as fi, open('hcn.out', 'w') as fo:
    d = deque(tuple(map(int, line.split())) for line in fi.readlines())
    while not_square(*d): d.rotate()
    print(*parallelogram_last_point(*d), file=fo)
