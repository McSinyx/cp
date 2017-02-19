var
  n, c, i, j, idx, max, tmp: int16;

begin
  readln(n);
  max := 0;
  for i := 1 to n do
    begin
      tmp := 0;
      for j := 1 to n do
        begin
          read(c);
          if c = 1 then
            inc(tmp)
        end;
      if tmp > max then
        begin
          max := tmp;
          idx := i
        end
    end;
  writeln(idx, ' ', max)
end.

