var
  n, m, i, j, k, l: int16;
  a: array of int16;

begin
  readln(n, m);
  setlength(a, m);
  for i := 0 to m - 1 do
    a[i] := 0;
  for i := 1 to n do
    begin
      read(k);
      for j := 1 to k do
        begin
          read(l);
          inc(a[l - 1])
        end
    end;
  k := 0;
  for i := 0 to m - 1 do
    if a[i] = n then
      inc(k);
  l := 0;
  for i := 0 to m - 1 do
    if a[i] = 0 then
      inc(l);
  writeln(k, ' ', l)
end.
