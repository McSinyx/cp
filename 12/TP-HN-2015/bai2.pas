var
  n, m, i, b, c, j: word;
  a: array of word;
  f: text;
  bc: array[1..1000, 1..1000] of boolean;
  bestprice: array[1..1000] of word;
  v: longint = 0;


begin
  assign(f, 'BAI2.INP');
  reset(f);

  read(f, n);
  setlength(a, n);
  for i := 0 to n - 1 do
    read(f, a[i]);

  fillchar(bc, sizeof(bc), false);
  readln(f, m);
  for i := 1 to m do
    begin
      read(f, b, c);
      bc[b][c] := true
    end;

  close(f);

  for i := 1 to 1000 do
    bc[i][1000] := true;

  for i := 1 to 1000 do
    if bc[1000][i] then
      begin
        bestprice[1000] := i;
        break
      end;

  for i := 999 downto 1 do
    begin
      for j := 1 to bestprice[i + 1] do
        if bc[i][j] then
          break;
      bestprice[i] := j
    end;

  for i := 0 to n - 1 do
    inc(v, bestprice[a[i]]);

  assign(f, 'BAI2.OUT');
  rewrite(f);
  writeln(f, v);
  close(f)
end.
