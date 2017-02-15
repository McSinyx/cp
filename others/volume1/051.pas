var
  n, i, v, a: int32;

begin
  readln(n, v);
  for i := 1 to n do
    begin
      read(a);
      if a = v then
        begin
          writeln('YES'#10, i);
          exit
        end;
    end;
  writeln('NO')
end.
