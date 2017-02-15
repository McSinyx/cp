uses strutils, clib;

var
  n, u: int64;
  s: string;
  code: word;

begin
  readln(n);
  str(n, s);
  val(reversestring(s), u, code);
  if isprime(n) and
     isprime(u) then
    writeln('YES')
  else
    writeln('NO')
end.
