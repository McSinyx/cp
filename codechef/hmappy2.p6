#!/usr/bin/env perl6
for ^get() {
    my ($N, $A, $B, $K) = get.words.map: *.Int;
    put $N div $A + $N div $B - $N div ($A lcm $B) * 2 < $K ?? 'Lose' !! 'Win';
}
