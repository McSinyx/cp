#!/usr/bin/env perl6
# Exercise 4.1
sub MAIN(Int $seconds=240_000) {
    put 'Days: ', $seconds div 86400;
    put 'Hours: ', $seconds div 3600 % 24;
    put 'Minutes: ', $seconds div 60 % 60;
    put 'Seconds: ', $seconds % 60
}
