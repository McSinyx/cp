#!/usr/bin/env python3
"""This module provide Gaussian and Gauss-Jordan eliminations on numpy
array of floats since they are not provided by numpy.

Note that matrix operations are straightforward with numpy.array, namely
add (+ -), scalar ops (+ - * / **) and mul (@), so try to make use of
the library while doing your matrix homework ;-P
"""

from itertools import islice
from math import inf
from numpy import array


def leadidx(row):
    """Return index of leading entry in row."""
    for index, entry in enumerate(row):
        if entry: return index
    else:
        return inf


def gauss(mat, log=False):
    """Return a matrix in row-echelon form, which is row-equivalent to mat,
    along with shorthand method of notation of row operations performed.
    """
    if mat.size == 0: return mat, []
    m, matrix, operations = len(mat), mat.__copy__(), []
    # Fuck optimization: we won't have 1000x1000 matrices for homework anyway.
    for i in range(m):
        while i + 1 < m:
            eye, ar = min(islice(enumerate(matrix), i + 1, m),
                          key=(lambda t: leadidx(t[1])))
            if leadidx(ar) >= leadidx(matrix[i]): break
            operations.append('R{} <-> R{}'.format(i + 1, eye + 1))
            matrix[i], matrix[eye] = ar, matrix[i]
            if log: print(operations[-1], *matrix, sep='\n')

        row = matrix[i]
        j = leadidx(row)
        if j == inf: return matrix, operations
        if row[j] != 1:     # floating point accuracy is a total disaster tho
            operations.append('({})R{} -> R{}'.format(1 / row[j], i+1, i+1))
            row /= row[j]
            if log: print(operations[-1], *matrix, sep='\n')

        for l in range(i + 1, m):
            k = -matrix[l][j]
            if k:   # OMG I want Python 3.7 so much
                operations.append('R{} + {}R{} -> R{}'.format(
                    l + 1, '' if k == 1 else '({})'.format(k), i + 1, l + 1))
                matrix[l] += k * row
                if log: print(operations[-1], *matrix, sep='\n')
    return matrix, operations


def gauss_jordan(mat, log=False):
    """Return a matrix in reduced row-echelon form, which is
    row-equivalent to mat, along with shorthand method of notation of
    row operations performed.
    """
    if mat.size == 0: return mat, []
    matrix, operations = gauss(mat, log)
    m = len(mat)
    for i in range(1, m):
        j = leadidx(matrix[i])
        if j == inf: return matrix, operations
        k = -matrix[i - 1][j]
        if k:
            operations.append('R{} + {}R{} -> R{}'.format(
                i, '' if k == 1 else '({})'.format(k), i + 1, i))
            matrix[i - 1] += k * matrix[i]
            if log: print(operations[-1], *matrix, sep='\n')
    return matrix, operations


if __name__ == '__main__':
    A = array([[1, -2, 3, 9],
               [-1, 3, 0, -4],
               [2, -5, 5, 17]], dtype=float)
    print(*A, sep='\n', end='\n\n')
    mat, ops = gauss(A)
    print(*ops, sep='\n')
    print(*mat, sep='\n', end='\n\n')
    mat, ops = gauss_jordan(A)
    print(*ops, sep='\n')
    print(*mat, sep='\n', end='\n\n')
