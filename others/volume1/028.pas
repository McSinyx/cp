var
  a, i: int16;
  b: array[0..9999] of boolean;

begin
  for i := 0 to 9999 do
    b[i] := false;
  readln(a);
  for i := 0 to 9999 do
    begin
      b[a] := true;
      a := sqr(a) div 100 mod 10000
    end;
  a := 0;
  for i := 0 to 9999 do
    if b[i] then
      inc(a);
  writeln(a)
end.
