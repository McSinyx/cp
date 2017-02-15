var
  n, i: int16;
  a: array of int32;
  v: int32;

begin
  readln(n);
  setlength(a, n + 1);
  for i := 0 to n - 1 do
    read(a[i]);
  readln(i, v);
  repeat
    a[n] := a[n - 1];
    dec(n)
  until n = i;
  a[i - 1] := v;
  for i := 0 to length(a) - 2 do
    write(a[i], ' ');
  writeln(a[length(a) - 1])
end.
