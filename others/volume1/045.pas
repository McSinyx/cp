uses cmath;

var
  n: int8 = 0;
  i, j, c: int8;
  p: array[1..20] of uint8;
  b: array of boolean;
  idx: uint64 = 1;

begin
  while not eof(input) do
    begin
      inc(n);
      read(p[n])
    end;
  setlength(b, n + 1);
  for i := 1 to n do
    b[i] := true;
  for i := 1 to n do
    begin
      c := 0;
      for j := 1 to n do
        if j = p[i] then
          break
        else if b[j] then
          inc(c);
      idx := idx + c * factorial[n - i];
      b[p[i]] := false
    end;
  writeln(idx)
end.
