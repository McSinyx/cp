var
  a, b, c, x, v: smallint;
  f: text;


function gcd(m, n: smallint): smallint;
  var
    p: smallint;

  begin
    while (n <> 0) do
      begin
        p := m mod n;
        m := n;
        n := p
      end;

    exit(m)
  end;


begin
  assign(f, 'BAI1.INP');
  reset(f);
  read(f, a, b, c);
  close(f);

  v := 0;
  for x := 1 to c div a do
    if ((c - a * x) mod b = 0) and
       (gcd(x, (c - a * x) div b) = 1) then
      inc(v);

  assign(f, 'BAI1.OUT');
  rewrite(f);
  writeln(f, v);
  close(f)
end.
