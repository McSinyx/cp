#!/usr/bin/env lua
local read = io.read
local print = print

for t = 1, read('*n') do
    local s, w1, w2, w3 = read('*n', '*n', '*n', '*n')
    if w1 + w2 + w3 <= s then
        print(1)
    elseif w1 + w2 <= s or w2 + w3 <= s then
        print(2)
    else
        print(3)
    end
end
