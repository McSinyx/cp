var
  n, i: int16;
  a, b: array of int16;

begin
  readln(n);
  setlength(a, n);
  setlength(b, n);
  for i := 0 to n - 1 do
    begin
      read(a[i]);
      b[a[i] - 1] := i + 1
    end;
  for i := 0 to n - 1 do
    if a[i] <> b[i] then
      begin
        writeln('NO');
        exit
      end;
  writeln('YES')
end.
