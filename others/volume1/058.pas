uses clib;

var
  n, i: int16;
  a: array of int64;

begin
  readln(n);
  setlength(a, n);
  for i := 0 to n - 1 do
    read(a[i]);
  qsort(a);
  for i := 0 to n - 2 do
    write(a[i], ' ');
  writeln(a[n - 1])
end.
