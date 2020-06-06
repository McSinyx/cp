var
  f: text;
  n, i, j: smallint;
  d: longint;
  v: array of smallint;
  t: array of real;

begin
  assign(f, 'CAU2.INP');
  reset(f);
  readln(f, n, d);
  setlength(v, n);
  for i := 0 to n - 1 do
    read(f, v[i]);
  close(f);

  setlength(t, n);
  for i := 0 to n - 1 do
    t[i] := i + d / v[i];

  d := 0;
  for i := 1 to n - 1 do
    for j := 0 to i - 1 do
      if t[i] < t[j] then
        inc(d);

  assign(f, 'CAU2.OUT');
  rewrite(f);
  writeln(f, d);
  close(f)
end.
