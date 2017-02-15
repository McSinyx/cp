uses clib;

var
  n, a: int16;
  b: array of boolean;

begin
  readln(n);
  setlength(b, n);
  for n := n - 1 downto 0 do
    b[n] := false;
  for n := 1 to length(b) do
    begin
      read(a);
      if (a <= 0) or
         (a > length(b)) then
        continue;
      b[a - 1] := true
    end;
  if all(b) then
    writeln('YES')
  else
    writeln('NO')
end.
