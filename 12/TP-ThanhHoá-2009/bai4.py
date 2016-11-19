#!/usr/bin/env python3


def ops(number, length):
    b = bin(number)[2:]
    return '+' * (length - len(b)) + b.replace('0', '+').replace('1', '-')


def libai4(n):
    seq, l = list(range(1, n + 1)), []

    for i in range(2 ** (n - 1)):
        s = ''.join(["{}{}".format(*j) for j in zip(ops(i, n), seq)])[1:]
        if eval(s) == 0:
            l.append(s + '=0\n')

    return l


if __name__ == '__main__':
    with open('BAI4.INP') as f:
        n = int(f.read())

    with open('BAI4.OUT', 'w') as f:
        l = libai4(n)
        f.write('{}\n'.format(len(l)))
        for s in l:
            f.write(s)
