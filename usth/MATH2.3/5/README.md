# Computations
## Problem 1
`automata.c`, e.g.

### Input
    4
    1 1 3
    0 1 2
    0 3 0
    1 1 2
    4 0011

### Output
    yes

## Problem 2
`nfa.cc` takes a state table of a non-deterministic finite-state automaton, its
final states and a string from stdin and print either `yes` or `no` to stdout
to answer whether this string is recognized by the automaton, e.g.

### Input
    12
    0 0 0
    0 0 1
    0 1 3
    1 0 0
    1 1 1
    1 1 3
    2 1 0
    2 1 2
    3 0 0
    3 0 1
    3 0 2
    3 1 1
    2
    2 3
    101

### Output
    yes

## Problem 3
`automata-to-grammar.c`

### Input
    4
    1 1 3
    0 1 2
    0 3 0
    1 1 2

### Output
    S -> $
    S -> 0T
    S -> 1V
    T -> 0T
    T -> 1U
    U -> 0V
    U -> 1S
    V -> $
    V -> 0T
    V -> 1U

## Problem 4
`grammar-to-automata.cc` (C++17)

### Input
    10
    S -> $
    S -> 0T
    S -> 1V
    T -> 0T
    T -> 1U
    U -> 0V
    U -> 1S
    V -> $
    V -> 0T
    V -> 1U

### Output
    4
    V       T       U       1
    U       V       S       0
    S       T       V       1
    T       T       U       0

## Problem 5
`turing.cc` (C++17) takes a natural number `n` and `n` 5-tuples representing a
Turing machine (with `-1` being the blank), a natural number `m` and a string
of `m` binaries from stdin, then print the output string to stdout, e.g.

### Input
    7
    0 0 0 0 1
    0 1 1 1 1
    0 -1 3 -1 1
    1 0 0 0 1
    1 1 2 0 -1
    1 -1 3 -1 1
    2 1 3 0 1
    6
    0 1 0 1 1 0

### Output
    010000
