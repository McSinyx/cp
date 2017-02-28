uses clib;

var
  n, i: int16;
  a: intar;
  max, tmp: int64;

begin
  readln(n);
  setlength(a, n * 2);
  for i := 0 to n * 2 - 1 do
    read(a[i]);
  qsort(a);
  max := a[0] + a[n * 2 - 1];
  for i := 1 to n - 1 do
    begin
      tmp := a[i] + a[n * 2 - i - 1];
      if tmp > max then
        max := tmp
    end;
  writeln(max)
end.
