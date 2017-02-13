var
  n, n0, m, m0, i: int16;
  a: array of int16;
  b: array of boolean;

begin
  readln(n, m);
  n0 := n;
  setlength(a, n);
  setlength(b, n);
  for i := 0 to n - 1 do
    b[i] := true;
  i := -1;
  while n0 > 0 do
    begin
      m0 := m;
      while m0 > 0 do
        begin
          repeat
            if i < n - 1 then
              inc(i)
            else
              i := 0
          until b[i];
          dec(m0)
        end;
      b[i] := false;
      a[n - n0] := i + 1;
      dec(n0)
    end;
  for i in a do
    write(i, ' ');
  writeln
end.
