#!/usr/bin/env perl6
my @a = <AP PP PA>;
for ^get() {
    my ($d, $s) = get.Int, get;
    my $p = elems $s ~~ m:g/P/;
    put 0 when $p * 4 >= $d * 3;
    my $m = ceiling $d * 0.75 - $p;
    put ($m > elems $s ~~ m:g:ex/@a A @a/) ?? -1 !! $m
}
