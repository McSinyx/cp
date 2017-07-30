#!/usr/bin/env python3
from collections import deque
from functools import reduce
from operator import mul, sub


def product(a): return reduce(mul, a)


def diff(side0, side1):
    return sum(abs(sub(*i)) for i in zip(reversed(side0), side1))


def sides(r, c):
    # Above, right, left, below
    l = [(r - 1, c), (r, c + 1), (r + 1, c), (r, c - 1)]
    return [(i, (r, c))
            for i, (r, c) in enumerate(l) if 0 < r <= R and 0 < c <= C]


def update_avail(image, r, c):
    board[(r, c)] = image
    for i in sides(r, c):
        if i[1] not in board:
            for j in range(1, 5):
                try:
                    avail[j].remove(i[1])
                except:
                    pass
            avail[sum(j[1] in board for j in sides(*i[1]))].append(i[1])


class Image:
    def __init__(self, filename, index):
        with open(filename) as f:
            self.top = deque(map(int, f.readline().split()))
            self.right = deque([self.top[-1]])
            self.left = deque([self.top[0]])
            for line in f:
                tmp = deque(map(int, line.split()))
                self.right.append(tmp[-1])
                self.left.appendleft(tmp[0])
            tmp.reverse()
            self.bottom = tmp
            self.sides = deque([self.top, self.right, self.bottom, self.left])
            self.index, self.used, self.rotation = index, False, 0

    def rotate(self, n=1):
        self.sides.rotate(n)
        self.rotation += n * 90


for test in range(26):
    print(test)
    with open('input{}/info.txt'.format(test)) as f:
        N, K, R, C = map(int, f.readline().split())
        rotated = bool(int(f.readline()))
        x, rx, cx = map(int, f.readline().split())
    size = R * C
    images = [Image('input{}/{}.txt'.format(test, j), j)
              for j in range(1, N + 1)]
    avail, board = {1: deque(), 2: deque(), 3: deque(), 4: deque()}, {}
    update_avail(images.pop(x - 1), rx, cx)

    while len(board) < size:
        for x in range(4, 0, -1):
            if len(avail[x]): break
        coordinate = avail[x].popleft()
        filled = [(i, s) for i, s in sides(*coordinate) if s in board]
        best = None
        for idx, img in enumerate(images):
            if rotated:
                for rot in range(4):
                    tmp = product(diff(board[s].sides[i - 2], img.sides[i])
                                  for i, s in filled)
                    if best is None or tmp < best:
                        best, rotation, index = tmp, rot, idx
                    img.rotate()
                img.rotate(rotation)
            else:
                tmp = product(diff(board[s].sides[i - 2], img.sides[i])
                              for i, s in filled)
                if best is None or tmp < best: best, index = tmp, idx
        print(images[index].index, images[index].rotation % 360, x, coordinate, filled)
        update_avail(images.pop(index), *coordinate)

    with open('Cxy/{}.out'.format(test), 'w') as f:
        for idx, img in board.items():
            print(img.index, *idx, img.rotation % 360, file=f)
