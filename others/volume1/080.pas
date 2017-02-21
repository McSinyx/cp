var
  n, i, j: int32;
  b: array of boolean;

begin
  readln(n);
  setlength(b, n + 1);
  for i := 2 to n do
    b[i] := true;
  for i := 2 to trunc(sqrt(n)) do
    if b[i] then
      for j := 2 to n div i do
        b[i * j] := false;
  for i := 2 to n do
    if b[i] then
      writeln(i)
end.
