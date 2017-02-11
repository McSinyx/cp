var
  n, i: int64;
  a, b, c: smallint;

begin
  readln(n);
  a := 1;
  b := 1;
  i := 2;
  while i < n do
    begin
      c := a;
      a := b;
      b := (c + a) mod 1000;
      inc(i)
    end;
  writeln(b)
end.
