# Graphs
## Problem 1
`bipartite.cc` (C++17) takes an natural number `n` of edges and `n` lines
of pairs of connected vertices from stdin and print either `yes` or `no` to
stdout if the given graph is or is not bipartite respectively.

## Problem 2
`adjmat2edges.cc` takes an natural number `n` and a `n`-by-`n` adjacent matrix
of natural numbers from stdin and print triplets (`u`, `v`, `m`) separated by
spaces to stdout, where `u`, `v` are vertices and `m > 0` is the number of edges
connecting these two.

## Problem 3
`incidentmat2edges.cc` take 2 natural numbers `v`, `e` and a `v`-by-`e`
incidental matrix from stdin and print each edge along with number of its
appearance to stdout, e.g.

### Input
    2 2
    1 1
    1 1

### Output
    0 1 2

## Problem 4
`dijkstra.cc` (C++17) takes a natural number `n` of edges, 2 positive numbers
`s` and `e` (starting and ending of path), then `n` pairs of connected vertices
(both in `1..1023`) and the edge's weight.  The output to stdout is the path
and the length, e.g.

### Input
    9 1 6
    1 2 4
    1 3 2
    2 3 1
    2 4 5
    3 5 10
    3 4 8
    4 5 2
    4 6 6
    5 6 3'

### Output
    1 3 2 4 5 6 (length of 13)

## Problem 5
`connected.cc` (C++17) takes a natural number `n` and `n` pairs of connected
vertices from stdin and print the number of connected components of the given
undirected graph to stdout, e.g.

### Input
    3
    1 2
    3 4
    4 5

### Output
    2
