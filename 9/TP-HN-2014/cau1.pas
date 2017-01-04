var
  f: text;
  a, b, g: int64;
  c, d: smallint;


function gcd(x, y: int64): int64;
  var z: int64;

  begin
    while y <> 0 do
      begin
        z := y; 
        y := x mod y;
        x := z
      end;

    gcd := a
  end;


begin
  assign(f, 'CAU1.INP');
  reset(f);
  read(f, a, b, c, d);
  close(f);

  a := a * d - c * b;
  b := b * d;

  g := gcd(a, b);

  a := a div g;
  b := b div g;

  if b < 0 then
    begin
      a := -a;
      b := -b
    end;

  assign(f, 'CAU1.OUT');
  rewrite(f);
  writeln(f, a, ' ', b);
  close(f)
end.
