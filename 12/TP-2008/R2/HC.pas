var
  f : text;
  m, n, i, j : byte;
  a : array[1..200, 0..200] of smallint;

function out

begin
  assign(f, 'HC.INP');
  reset(f);
  readln(f, m, n);
  for i := 1 to m do
    begin
      a[i, 0] := 0;
      for j := 1 to n do
        read(f, a[i, j])
    end;
  close(f);
  assign(f, 'HC.OUT');
  rewrite(f);
  writeln(f, out(a));
  close(f)
end;
