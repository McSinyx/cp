var
  n, m, p: qword;

begin
  read(n, m);

  while m <> 0 do
    begin
      p := n mod m;
      n := m;
      m := p
    end;

  writeln(n <> 1)
end.
