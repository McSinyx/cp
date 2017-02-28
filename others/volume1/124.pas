uses clib;

var
  m, n, i, k: int8;
  a: intar;
  s: array of array of ansistring;

begin
  readln(n, k);
  setlength(a, n);
  for i := 0 to n - 1 do
    read(a[i]);
  qsort(a);
  m := 1;
  for i := 1 to n - 1 do
    if a[i] > a[i - 1] then
      inc(m);
  setlength(s, m);
  for n := 0 to m - 1 do
    begin
      setlength(s[n], n + 2);
      s[n][0] := '1';
      for i := 1 to n do
        s[n][i] := addintstr(s[n - 1][i], s[n - 1][i - 1]);
      s[n][n + 1] := '0'
    end;
  writeln(addintstr(s[m - 1][k], s[m - 1][k - 1]))
end.
