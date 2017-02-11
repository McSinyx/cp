var
  c, i: smallint;

begin
  readln(c);
  writeln(c div 4);
  for i := 0 to c div 4 do
    writeln((c - i * 4) div 2, ' ', i)
end.
