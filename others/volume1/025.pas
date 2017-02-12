var
  x0, y0, x1, y1, x2, y2: int64;

begin
  read(x0, y0, x1, y1, x2, y2);
  if x1 = x2 then
    write(x0, ' ')
  else if x2 = x0 then
    write(x1, ' ')
  else
    write(x2, ' ');
  if y1 = y2 then
    writeln(y0)
  else if y2 = y0 then
    writeln(y1)
  else
    writeln(y2)
end.
