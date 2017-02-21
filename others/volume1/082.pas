uses clib;

var
  n: int16;
  a, g, l: int32;

begin
  read(n, a);
  g := a;
  l := a;
  while n > 1 do
    begin
      dec(n);
      read(a);
      g := gcd(g, a);
      l := l * a div gcd(l, a);
      writeln(a, ' ', g, ' ', l)
    end;
  writeln(g, ' ', l)
end.
