var
  n, i, j: int16;

begin
  readln(n);
  for i := 0 to n - 1 do
    begin
      if i mod 2 = 0 then
        for j := 1 to n do
          write(i * n + j, ' ')
      else
        for j := n downto 1 do
          write(i * n + j, ' ');
      writeln
    end
end.
