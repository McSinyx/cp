# Trees
## Problem 1
`graph-is-tree.cc` (C++17) take a natural numbers `n` and a `n`-by-`n` adjacent
matrix from stdin and print to stdout either yes or no depending on whether the
given graph is a tree or not, e.g.

### Input
    3
    0 1 0
    1 0 1
    0 1 0

### Output
    yes

## Problem 2
`binary-search-tree.c` takes a natural number `n` and `n` integers from stdin
and print to stdout a horizontal binary search tree formed (naïvely) from the
given input, e.g.

### Input
    7
    34 45 21 65 12 546 23

### Output
            12
        21
            23
    34
        45
            65
                546

## Problem 3
`dc.cc` takes from stdin a list of numbers and operator, each terminated by a
semi-colon and print to stdout the evaluation of the given postfix arithmetic
expression, e.g.

### Input
    6.9;4.20;+;2;^;6.9;4;-;3;/;+;

### Output
    124.177

## Problem 4
`st-dfs.cc` (C++17) takes a natural number `n` and an `n`-by-`n` adjacent
matrix from stdin and print the edges on a spanning tree of the given graph to
stdout, e.g.

### Input
    4
    0 1 1 1
    1 0 1 1
    1 1 0 1
    1 1 1 0

### Output
    2 3
    0 3
    1 2

## Problem 5
`sum-set.cc` takes a natural number `n` and a line of positive integers on one
line from stdin and print numbers whose sum are `n`, separated by a newline, to
stdout, e.g.

### Input
    7
    1 2 3 4 5 6 7 8 9

### Output
    1 2 4
    1 6
    2 5
    3 4
    7
