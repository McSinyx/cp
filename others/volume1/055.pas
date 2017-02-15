var
  n, i, j: int16;
  a, min: int64;
 
begin
  min := 9223372036854775807;
  readln(n);
  for i := 1 to n do
    begin
      read(a);
      if a < min then
        begin
          j := i;
          min := a
        end
    end;
  writeln(j, ' ', min)
end.
