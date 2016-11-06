uses math;

var
  f : text;
  m, n, i : byte;
  a, b : double;
j
begin
  assign(f, 'LT.IN');
  reset(f);
  read(f, n, m);
  close(f);
  a := 1;
  for i := 1 to n do
    a := a * 2;
  b := 1;
  for i := 1 to m do
    b := b * 3;
  a := a + b;
  for i := 1 to trunc(log10(a)) do
    a := a / 10;
  assign(f, 'LT.OU');
  rewrite(f);
  writeln(f, trunc(a));
  close(f)
end.
