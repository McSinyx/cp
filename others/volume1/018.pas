var
  n: int64;

begin
  readln(n);
  if (n < 0) or
     (sqr(trunc(sqrt(n))) <> n) then
    writeln('NO')
  else
    writeln('YES')
end.
