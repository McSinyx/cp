uses sortnfind;

var
  n, i: int16;
  p: int64;
  a, b: array of int64;

begin
  readln(n, p);
  setlength(a, n);
  setlength(b, n);
  for i := 0 to n - 1 do
    begin
      read(a[i]);
      b[i] := a[i]
    end;
  qsort(a);
  p := a[p - 1];
  for i := 0 to n - 1 do
    if b[i] = p then
      break;
  writeln(p, ' ', i + 1)
end.
