#!/usr/bin/env python3

from sys import stdin

puncs_list = [[''], ['+', '-', '*', '/']]


def puncs(length):
    global puncs_list
    if length < len(puncs_list):
        return puncs_list[length]
    else:   # length is certainly equal to len(puncs_list)
        l = []
        for i in puncs_list[-1]:
            l.extend([i + c for c in '+-*/'])
        puncs_list.append(l)
        return l


def ar(m, n):
    i = 1
    while True:
        s = n * i



if __name__ == '__main__':
    #(m, n) = tuple(stdin.readline().split()[:2])
    #print(ar(int(m), n))
    for i in range(5):
        print(puncs(i))
