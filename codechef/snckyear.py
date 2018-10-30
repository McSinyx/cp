#!/usr/bin/env python

SNCKYEAR = dict.fromkeys((2010, 2015, 2016, 2017, 2019), 'HOSTED')
for _ in range(int(input())): print(SNCKYEAR.get(int(input()), 'NOT HOSTED'))
