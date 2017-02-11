var
  a, b, g: int64;
  c, d: longint;


function gcd(x, y: int64): int64;
  var
    z: longint;

  begin
    while y > 0 do
      begin
        z := y;
        y := x mod y;
        x := z
      end;
    gcd := x
  end;


begin
  readln(a, b, c, d);
  a := a * d + b * c;
  b := b * d;
  g := gcd(a, b);
  writeln(a div g, ' ', b div g)
end.
