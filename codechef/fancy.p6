#!/usr/bin/env perl6
for ^get() { put /<<not>>/ ?? 'Real Fancy' !! 'regularly fancy' for get }
