#!/usr/bin/env lua
local n, r = io.read('*n', '*n')
for i = 1, n do print(io.read('*n') >= r and 'Good boi' or 'Bad boi') end
