var
  m, n, i: int16;
  a: array of int32;
  b: int32;

begin
  readln(m, n);
  setlength(a, m);
  for i := 0 to m - 1 do
    read(a[i]);
  i := 0;
  repeat
    read(b);
    while (i < m) and
          (a[i] <= b) do
      begin
        write(a[i], ' ');
        inc(i)
      end;
    write(b, ' ');
    dec(n)
  until n = 0;
  while i < m do
    begin
      write(a[i], ' ');
      inc(i)
    end;
  writeln
end.
