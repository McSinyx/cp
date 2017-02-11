var
  n, d, m, i: byte;
  p: qword = 1;

begin
  readln(n);
  d := n div 3;
  m := n mod 3;

  if n < 3 then
    begin
      writeln(n);
      exit
    end;

  if m = 1 then
    begin
      for i := 2 to d do
        p := p * 3;
      p := p * 4
    end
  else
    for i := 1 to d do
      p := p * 3;

  if m = 2 then
    p := p * 2;

  writeln(p)
end.
