var
  b: array[0..1000001] of boolean;
  n, a, i, max: int32;

begin
  for i := 0 to 1000001 do
    b[i] := false;
  readln(n);
  repeat
    dec(n);
    read(a);
    b[a] := true
  until n = 0;
  max := 1;
  while n < 1000000 do
    if b[n + 1] and not b[n] then
      for i := n + 1 to 1000001 do
        begin
          if not b[i] then
            begin
              if i - n > max then
                max := i - n;
              n := i;
              break
            end
        end
    else
      inc(n);
  writeln(max - 1)
end.
