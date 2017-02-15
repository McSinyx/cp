var
  n, m, i, j: int16;
  a: array of array of int32;
  s: int64 = 0;

begin
  readln(n, m);
  setlength(a, n + 2);
  setlength(a[0], m + 2);
  for i := 0 to m + 1 do
    a[0][i] := 0;
  for i := 1 to n do
    begin
      setlength(a[i], m + 2);
      a[i][0] := 0;
      for j := 1 to m do
        read(a[i][j]);
      a[i][m + 1] := 0
    end;
  setlength(a[n + 1], m + 2);
  for i := 0 to m + 1 do
    a[n + 1][i] := 0;

  for i := 1 to n do
    for j := 1 to m do
      if a[i][j] <> 0 then
        begin
          if a[i][j] > a[i - 1][j] then
            s := s + a[i][j] - a[i - 1][j];
          if a[i][j] > a[i + 1][j] then
            s := s + a[i][j] - a[i + 1][j];
          if a[i][j] > a[i][j - 1] then
            s := s + a[i][j] - a[i][j - 1];
          if a[i][j] > a[i][j + 1] then
            s := s + a[i][j] - a[i][j + 1];
          s := s + 1
        end;
  writeln(s)
end.
