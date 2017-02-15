uses clib;

var
  n: int16;
  a, s: int64;

begin
  s := 0;
  readln(n);
  repeat
    read(a);
    if isprime(a) then
      s := s + a;
    dec(n)
  until n = 0;
  writeln(s)
end.
