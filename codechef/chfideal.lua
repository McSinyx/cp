#!/usr/bin/env lua
print(1)
io.flush()
print(io.read('*n') == 2 and 3 or 2)
