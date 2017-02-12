uses sortnfind;

var
  n, i: int16;
  a, b: array of int64;

begin
  readln(n);
  setlength(a, n);
  for i := 0 to n - 1 do
    read(a[i]);
  qsort(a);
  setlength(b, n);
  for i := 0 to n - 1 do
    read(b[i]);
  qsort(b);
  for i := 0 to n - 1 do
    if a[i] <> b[i] then
      begin
        writeln('NO');
        exit
      end;
  writeln('YES')
end.
