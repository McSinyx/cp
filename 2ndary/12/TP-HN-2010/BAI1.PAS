var
  f : text;
  i : 1..30;
  a : array[0..30] of qword;

function gcd(a, b : qword) : qword;
  var tmp : qword;
  begin
    while b > 0 do
      begin
        tmp := b;
        b := a mod b;
        a := tmp
      end;
    gcd := a
  end;

begin
  assign(f, 'bai1.inp');
  reset(f);
  readln(f, a[0]);
  for i := 1 to a[0] do read(f, a[i]);
  close(f);
  for i := a[0] - 1 downto 1 do
    a[i] := a[i] * a[i + 1] div gcd(a[i], a[i + 1]);
  assign(f, 'bai1.out');
  rewrite(f);
  writeln(f, a[1]);
  close(f)
end.
