uses clib;

var
  s: ansistring;

begin
  readln(s);
  if ispalindrome(s) then
    writeln('YES')
  else
    writeln('NO')
end.
