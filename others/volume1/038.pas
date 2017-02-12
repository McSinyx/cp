var
  n, l, h, l0, h0, len: int16;
  a: array of int32;

begin
  readln(n);
  setlength(a, n);
  for l := 0 to n - 1 do
    read(a[l]);
  len := 0;
  l0 := 0;
  h0 := 0;
  l := 0;
  while l < n do
    for h := l to n - 1 do
      if (h = n - 1) or
         ((a[h] mod a[h + 1]) * (a[h + 1] mod a[h]) > 0) then
        begin
          if len < h - l then
            begin
              len := h - l;
              l0 := l;
              h0 := h
            end;
          l := h + 1;
          break
        end;
  writeln(l0 + 1, ' ', h0 + 1)
end.
