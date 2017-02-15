var
  n, i, k: int32;
  b: array of boolean;

begin
  readln(n, k);
  setlength(b, n);
  for i := 0 to n - 1 do
    b[i] := true;
  repeat
    read(i);
    b[i - 1] := false;
    dec(k)
  until k = 0;
  for i := 0 to n - 1 do
    if b[i] then
      write(i + 1, ' ');
  writeln
end.
