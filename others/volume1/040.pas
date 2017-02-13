var
  n, i, c: int16;
  x, a, b: int32;
  s: array of boolean;

begin
  c := 0;
  readln(n, x);
  setlength(s, n);
  for i := 0 to n - 1 do
    s[i] := false;
  for i := 0 to n - 1 do
    begin
      readln(a, b);
      if (a <= x) and
         (x <= b) then
        begin
          inc(c);
          s[i] := true
        end
    end;
  writeln(c);
  for i := 0 to n - 1 do
    if s[i] then
      write(i + 1, ' ');
  writeln
end.
