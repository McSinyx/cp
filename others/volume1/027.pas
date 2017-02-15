uses clib;

var
  n: int64;
  m: int32;

begin
  readln(n);
  m := trunc(sqrt(n));
  if issquare(n) then
    writeln(m, ' ', m)
  else if n > m * (m + 1) then
    writeln(m + 1, ' ', m + 1)
  else
    writeln(m, ' ', m + 1)
end.
