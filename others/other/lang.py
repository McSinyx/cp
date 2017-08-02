#!/usr/bin/env python3
def lang(index):
    global unused
    if index < len(unused) and unused[index]:
        unused[index] = False
        for i in commands[index]: lang(i)


commands = []
with open('LANG.INP') as f:
    for index, line in enumerate(f):
        l = line.split()
        if l[0] == 'NEXT':
            commands.append((index + 1,))
        elif len(l) == 2:
            commands.append((int(l[1]) - 1,))
        else:
            commands.append((int(l[1]) - 1, int(l[3]) - 1))

unused = [True] * len(commands)
lang(0)
with open('LANG.OUT', 'w') as f:
    print(sum(unused), file=f)
    print(*(i + 1 for i, b in enumerate(unused) if b), sep='\n', file=f)
