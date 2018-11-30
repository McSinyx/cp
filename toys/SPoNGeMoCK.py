#!/usr/bin/env python3
"""SPoNGeMoCK stdin using symbols of chemical elements
and print the result to stdout.
"""

import re
from bisect import bisect_left as bisect
from sys import stdin, stdout

ELEMENTS = (
    'H', 'He', 'Li', 'Be', 'B', 'C', 'N', 'O', 'F', 'Ne', 'Na', 'Mg', 'Al',
    'Si', 'P', 'S', 'Cl', 'Ar', 'K', 'Ca', 'Sc', 'Ti', 'V', 'Cr', 'Mn', 'Fe',
    'Co', 'Ni', 'Cu', 'Zn', 'Ga', 'Ge', 'As', 'Se', 'Br', 'Kr', 'Rb', 'Sr',
    'Y', 'Zr', 'Nb', 'Mo', 'Tc', 'Ru', 'Rh', 'Pd' , 'Ag', 'Cd', 'In', 'Sn',
    'Sb', 'Te', 'I', 'Xe', 'Cs', 'Ba', 'La', 'Ce', 'Pr', 'Nd', 'Pm ', 'Sm',
    'Eu', 'Gd', 'Tb', 'Dy', 'Ho', 'Er', 'Tm', 'Yb', 'Lu', 'Hf', 'Ta', 'W',
    'Re', 'Os', 'Ir', 'Pt', 'Au', 'Hg', 'Tl', 'Pb', 'Bi', 'Po', 'At', 'Rn',
    'Fr', 'Ra', 'Ac', 'Th', 'Pa', 'U', 'Np', 'Pu', 'Am', 'Cm', 'Bk', 'Cf',
    'Es', 'Fm', 'Md', 'No', 'Lr', 'Rf', 'Db', 'Sg', 'Bh', 'Hs', 'Mt', 'Ds',
    'Rg', 'Cn', 'Nh', 'Fl', 'Mc', 'Lv', 'Ts', 'Og')
SORTED_ELEMENTS = sorted(map(str.lower, ELEMENTS))
LOWER_PATTERN = re.compile('([a-z]+)')


def bsearch(s):
    """Return capitalized s if it is a valid symbol of an element,
    otherwise return an empty string.
    """
    return (lambda i: (i < len(SORTED_ELEMENTS) and SORTED_ELEMENTS[i] == s
                       and s.capitalize() or ''))(bisect(SORTED_ELEMENTS, s))


def andd(a, b):
    """Return sum of a and b if they both evaluate to True,
    otherwise return the non-True value.
    """
    return a and b and a + b


def spongemock(word):
    """Return spongemock version of the given lowercase word,
    capitalized by symbols of chemical elements.
    """
    # For elegance, we don't handle empty strings here.
    if len(word) == 1: return bsearch(word)
    if len(word) == 2:
        return andd(bsearch(word[0]), bsearch(word[1])) or bsearch(word)
    return (andd(bsearch(word[:2]), spongemock(word[2:]))
            or andd(bsearch(word[0]), spongemock(word[1:])))


def SPoNGeMoCK(string):
    """Return spongemock version of the given lowercase string,
    capitalized by symbols of chemical elements.
    """
    return ''.join(i % 2 and spongemock(s) or s
                   for i, s in enumerate(LOWER_PATTERN.split(string)))


if __name__ == '__main__': stdout.write(SPoNGeMoCK(stdin.read().lower()))
