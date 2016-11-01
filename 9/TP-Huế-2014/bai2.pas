var
  a, b, c, e, p, k, tmp: real;

function det(a, b, c, d: real): real;
  begin
    exit(a * d - b * c)
  end;

begin
  read(a, b, c, e, p, k);

  tmp := det(a, b, e, p);
  
  if tmp <> 0 then
    begin
      writeln('x = ', (det(c, b, k, p) / tmp):0:6);
      writeln('y = ', (det(a, c, e, k) / tmp):0:6);
      writeln('Hai đường thẳng cắt nhau.')
    end
  else if c <> k then
    begin
      writeln('Phương trình vô nghiệm.');
      writeln('Hai đường thẳng song song.')
    end
  else
    begin
      if a = 0 then
        writeln('y = ',  (c / b):0:6)
      else if b = 0 then
        writeln('x = ', (c / a):0:6)
      else
        writeln('x = ', (-b / a):0:6, 'y + ', (c / a):0:6);
      writeln('Hai đường thẳng trùng nhau.')
    end;
end.
