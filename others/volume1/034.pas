uses math, sortnfind;

var
  n, i: int16;
  a: array of int64;

begin
  readln(n);
  setlength(a, n);
  for i := 0 to n - 1 do
    read(a[i]);
  qsort(a);
  writeln(max(a[0] * a[1], a[n - 2] * a[n - 1]))
end.
