var
  n, i: uint16;
  a: array of int64;

begin
  readln(n);
  setlength(a, n);
  for i := 0 to n - 1 do
    read(a[i]);
  for i := 1 to n - 2 do
    if (a[i] < a[i - 1]) and
       (a[i] < a[i + 1]) then
      begin
        dec(n);
        a[i] := a[i - 1]
      end;
  writeln(length(a) - n)
end.
