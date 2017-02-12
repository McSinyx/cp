uses cmath;

var
  a, b, g: int64;
  c, d: longint;

begin
  readln(a, b, c, d);
  a := a * d + b * c;
  b := b * d;
  g := gcd(a, b);
  writeln(a div g, ' ', b div g)
end.
