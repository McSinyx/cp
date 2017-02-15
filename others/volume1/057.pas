var
  n, i, j: int16;
  a: int64;

begin
  readln(n, i);
  for j := 1 to n do
    begin
      read(a);
      if i <> j then
        write(a, ' ')
    end;
  writeln
end.
