var
  n, i: int16;
  a: array of int64;
  idx: array of int16;


procedure sort(l, r: int16);
  var
    i, j: int16;
    x, y: int64;

  begin
    i := l;
    j := r;
    x := a[(l + r) div 2];

    repeat
      while a[i] < x do
        inc(i);

      while x < a[j] do
        dec(j);

      if i <= j then
        begin
          y := a[i];
          a[i] := a[j];
          a[j] := y;
          y := idx[i];
          idx[i] := idx[j];
          idx[j] := y;
          inc(i);
          dec(j)
        end
    until i > j;

    if l < j then
      sort(l, j);
    if i < r then
      sort(i, r)
  end;


begin
  readln(n);
  setlength(a, n);
  setlength(idx, n);
  for i := 0 to n - 1 do
    begin
      read(a[i]);
      idx[i] := i + 1
    end;
  sort(0, n - 1);
  for i in idx do
    write(i, ' ');
  writeln
end.
