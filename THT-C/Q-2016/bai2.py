#!/usr/bin/env python3
d = {'+': '+', '-': '-', '.': '*', ':': '/', '^': '**'}

def Steps(string):
    val = int()
    for char in string:
        if char in '+-.:^':
            val += 1
    return val

def Calc(string):
    global d
    for char in '+-.:^':
        string = string.replace(char, ' {} '.format(char))
    l = string.split()
    for char in '^.:+-':
        if char in l:
            idx = l.index(char)
            s = ' '.join(l[idx - 1:idx + 2])
            return string.replace(s, str(eval(s.replace(char, d[char]))))

def MetaCalc(string):
    for idx0, char0 in enumerate(string):
        if char0 == ')':
            for idx1, char1 in enumerate(reversed(string)):
                if char1 == '(':
                    idx1 = len(string) - idx1 - 1
                    s = '({})'.format(Calc(string[idx1 + 1:idx0]))
                    if not(Steps(s)) or ((Steps(s) == 1) and (s[:2] == '(-')):
                        s = s[1:-1]
                    return string.replace(string[idx1:idx0 + 1], s)
    return Calc(string)

with open('bai2.inp') as f:
    s = f.readline()
lines = Steps(s)
for i in d:
    s = s.replace(i, ' ' + i + ' ')
for i in d:
    s = s.replace(i + ' - ', i + ' -')
l = s.split()
with open('bai2.out', 'w') as f:
    f.write(''.join(l) + '\n')
    for _ in range(lines):
        s = MetaCalc(s).replace(' ', '')
        f.write('=' + s)
        print(s)
