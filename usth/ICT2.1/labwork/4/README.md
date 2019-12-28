# Algorithms and Data Structures: Tutorial 4

This package contains the following files:

* `construct.h`, `construct.c`: Lisp construct (with `cons`, `car` and `cdr`)
* `Ex1.c`: take 2 integers from stdin and print there product to stdout
* `Ex2.c`: print all primes in 1..n to stdout with n from stdin
* `Ex3.c`: print to stdout the sum of elements from stdin
* `Ex4.c`: exchange given amount of money from stdin to least number
  of [1 2 5 10 20 50] bills and print the pairs of (amount, bill) to stdout
* `Bonus.c`: Towers of Hà Nội problem: no link list or stack needed

Compilation can be done as follows

    cc Ex1.c -o Ex1
    cc Ex2.c -o Ex2
    cc construct.c Ex3.c -o Ex3
    cc Ex4.c -o Ex4
    cc Bonus.c -o Bonus

All source files are as licensed under the Unlicense which states

> This is free and unencumbered software released into the public domain.
>
> Anyone is free to copy, modify, publish, use, compile, sell, or
> distribute this software, either in source code form or as a compiled
> binary, for any purpose, commercial or non-commercial, and by any
> means.
>
> In jurisdictions that recognize copyright laws, the author or authors
> of this software dedicate any and all copyright interest in the
> software to the public domain. We make this dedication for the benefit
> of the public at large and to the detriment of our heirs and
> successors. We intend this dedication to be an overt act of
> relinquishment in perpetuity of all present and future rights to this
> software under copyright law.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
> IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER DEALINGS IN THE SOFTWARE.
>
> For more information, please refer to <http://unlicense.org/>
