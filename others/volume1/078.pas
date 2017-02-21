uses clib;

var
  n, i, j: int16;
  m: int32 = 0;
  a, b: array of int16;

procedure sort(l, h: int32);
  var
    i, j, k: int32;
    tmp: int16;
  begin
    i := l;
    j := h;
    k := (l + h) div 2;
    repeat
      while a[i] * b[k] < a[k] * b[i] do
        inc(i);
      while a[j] * b[k] > a[k] * b[j] do
        dec(j);
      if i <= j then
        begin
          tmp := a[i];
          a[i] := a[j];
          a[j] := tmp;
          tmp := b[i];
          b[i] := b[j];
          b[j] := tmp;
          inc(i);
          dec(j)
        end
    until i > j;

    if l < j then
      sort(l, j);
    if i < h then
      sort(i, h)
  end;

begin
  readln(n);
  setlength(a, m);
  setlength(b, m);
  for i := 1 to n do
    for j := 1 to n do
      if gcd(i, j) = 1 then
        begin
          inc(m);
          setlength(a, m);
          a[m - 1] := i;
          setlength(b, m);
          b[m - 1] := j
        end;
  sort(0, m - 1);
  writeln(m);
  repeat
    dec(m);
    writeln(a[m], ' ', b[m])
  until m = 0;
end.
