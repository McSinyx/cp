uses clib;

var
  a: intar;
  i: int8;
  n, m: int64;

begin
  readln(n);
  setlength(a, 87);
  for i := 2 to 88 do
    a[i - 1] := fibonacci[i];
  while n > 0 do
    begin
      m := bisect_left(a, n);
      if a[m] > n then
        m := m - 1;
      writeln(a[m]);
      n := n - a[m]
    end
end.
