#!/usr/bin/env perl6
multi xypizq($N, 1, $x, $y, $z where $x == $z) { $x / ($N * 2 + 1) }
multi xypizq($N, 1, $x, $y, $z) { 1 - xypizq $N, 1, $z, $y, $z }
multi xypizq($N, 3, $x, $y, $z) { xypizq $N, 1, $z, $y, $x }
multi xypizq($N, $t, $x, $y, $z) { 1 - $y * 2 / ($N * 2 + 1) }
xypizq(|get.words>>.Int).nude.put for ^get
