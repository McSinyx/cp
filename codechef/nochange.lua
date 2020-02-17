#!/usr/bin/env lua
local read = io.read
local print = print
local table = {concat = table.concat, insert = table.insert}

for t = 1, read('*n') do
  local n, p = read('*n', '*n')
  local d = {}
  for i = 1, n do table.insert(d, read('*n')) end

  local unanswered, previous = true, 1
  for k, v in ipairs(d) do
    if p % v ~= 0 then
      local c = {}
      for i = 1, k-1 do table.insert(c, 0) end
      table.insert(c, p//v+1)
      for i = k+1, n do table.insert(c, 0) end
      print(('YES %s'):format(table.concat(c, ' ')))
      unanswered = false
      break
    end

    if v % previous ~= 0 then
      local c = {}
      for i = 1, k-2 do table.insert(c, 0) end
      table.insert(c, v//previous+1)
      table.insert(c, p//v-1)
      for i = k+1, n do table.insert(c, 0) end
      print(('YES %s'):format(table.concat(c, ' ')))
      unanswered = false
      break
    end
    previous = v
  end
  if unanswered then print('NO') end
end
