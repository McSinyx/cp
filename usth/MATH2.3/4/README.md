# Booleans
## Problem 1
`deg3.c` prints the a table listing the set of values of all 256 Boolean
functions of degree three to stdout.

## Problem 2
`sum-of-products.c` takes 2 natural numbers `n` and `f` from stdin, where `f`
is the encoded truth table of a Boolean function of degree `n`, for example,

|   x0  |   x1  | value |
| :---: | :---: | :---: |
|   0   |   0   |   1   |
|   0   |   1   |   0   |
|   1   |   0   |   1   |
|   1   |   1   |   0   |

will be encoded as `0b0101 = 5`.  The program then print the bitwise arithmetic
sum-of-products expression to stdout, e.g.

### Input
    2 5

### Output
    ~x0&~x1 | ~x0&x1

## Problem 3
`k-map`, e.g.

### Input
    0 0 0 1
    0 0 1 0
    0 1 0 1
    1 0 0 0
    1 1 1 0
    0 1 1 0
    1 1 0 1
    1 0 1 0

### Output
       00  01  10  11
    0   1   0   1   1
    0   0   0   0   0

## Problem 4
`threshold.c` takes in natural number `n`, a real threshold value `t` and `n`
weights, then `n` boolean values from stdin and print to stdout the output of
the given threshold gate, e.g.

### Input
    7 0.25051534245890184
    0.11609819805105248
    0.7924365005827357
    0.9835187780201641
    0.4235209817923591
    0.08303890030044114
    0.7196176517110272
    0.988645113198539
    1 1 0 1 1 0 1

### Output
    1

## Problem 5
`sum.c` takes similar input format from stdin and print the bitwise arithmetic
expression using only bit flip (`~`) and addition (`|`) to stdout, e.g.

### Input
    3 69

### Output
    ~(~x0 | x1 | x2) | ~(~x0 | ~x1 | x2) | ~(~x0 | ~x1 | ~x2)
