const
  inp = 'ctmt.inp';
  out = 'ctmt.out';
type
  int200 = 1..200;
  intday = 0..8640000;
var
  f : text;
  n, i, j, ln2, ln3 : int200;
  a, b : array[1..200] of intday;
  p, q, r, s , max0, max1 : intday;
  ln0, ln1 : 0..1;
procedure swab(i0, j0 : int200);
  var tmp : intday;
  begin
    tmp := a[i0];
    a[i0] := a[j0];
    a[j0] := tmp;
    tmp := b[i0];
    b[i0] := b[j0];
    b[j0] := tmp
  end;
procedure del(m : int200);
  var o : int200;
  begin
    dec(n);
    for o := m to n do
      begin
        a[o] := a[o + 1];
        b[o] := b[o + 1]
      end
  end;
begin
  assign(f, inp);
  reset(f);
  readln(f, n);
  for i := 1 to n do
    readln(f, a[i], b[i]);
  readln(f, p, q);
  readln(f, r, s);
  close(f);
  for i := 1 to n - 1 do
    for j := i + 1 to n do
      if a[i] > a[j] then swab(i, j);
  i := 1;
  while i < n do
    begin
      j := i + 1;
      while j <= n do
        begin
          if (a[j] <= b[i]) and (b[i] <= b[j]) then
            begin
              b[i] := b[j];
              del(j)
            end
          else inc(j)
        end;
      inc(i)
    end;
  ln0 := 0;
  ln1 := 0;
  max0 := 0;
  max1 := 0;
  for i := 1 to n do
    begin
      if (a[i] <= p) and (q <= b[i]) then ln0 := 1;
      if (i < n) and (b[i] < r) and (s < a[i + 1]) then ln1 := 1;
      if b[i] - a[i] >= max0 then
        begin
          ln2 := i;
          max0 := b[i] - a[i]
        end;
      if (i < n) and (a[i + 1] - b[i] > max1) then
        begin
          ln3 := i;
          max1 := a[i + i] - b[i]
        end
    end;
  assign(f, out);
  rewrite(f);
  writeln(f, ln0);
  writeln(f, ln1);
  writeln(f, a[ln2], ' ', b[ln2]);
  writeln(f, b[ln3] + 1, ' ', a[ln3 + 1] - 1);
  close(f)
end.
