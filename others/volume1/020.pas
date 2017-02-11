var
  n, max, l, h, l0, h0: smallint;
  a: array of int64;

begin
  readln(n);
  setlength(a, n + 1);
  for l := 0 to n - 1 do
    read(a[l]);
  a[n] := 0;
  max := 0;
  l := 0;
  h := 0;

  l0 := 0;
  while l0 < n do
    for h0 := l0 to n - 1 do
      if a[h0] * a[h0 + 1] >= 0 then
        begin
          if max < h0 - l0 then
            begin
              max := h0 - l0;
              l := l0;
              h := h0
            end;
          l0 := h0 + 1;
          break
        end;

  writeln(l + 1, ' ', h + 1)
end.
end.
