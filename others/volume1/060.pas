uses sysutils, clib;

var
  n, count: int16;
  a: int64;

begin
  count := 0;
  readln(n);
  repeat
    readln(a);
    if ispalindrome(inttostr(a)) then
      inc(count);
    dec(n)
  until n = 0;
  writeln(count)
end.
