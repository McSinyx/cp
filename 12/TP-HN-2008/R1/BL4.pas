var
  f: text;
  n, i: int16;
  a, b: array of int32;


procedure swp(var x, y: int32);
  var
    tmp: int32;

  begin
    tmp := x;
    x := y;
    y := tmp
  end;


procedure qsort(l, h: int16);
  var
    i, j: int16;
    tmp: int32;

  begin
    i := l;
    j := h;
    tmp := a[(l + h) div 2];

    repeat
      while a[i] < tmp do
        inc(i);
      while a[j] > tmp do
        dec(j);

      if i <= j then
        begin
          swp(a[i], a[j]);
          swp(b[i], b[j]);
          inc(i);
          dec(j)
        end;
    until i > j;

    if l < j then
      qsort(l, j);
    if i < h then
      qsort(i, h)
  end;


begin
  assign(f, 'CLB.IN');
  reset(f);
  readln(f, n);
  setlength(a, n);
  setlength(b, n);
  for i := 0 to n - 1 do
    readln(f, a[i], b[i]);
  close(f);
  qsort(0, n - 1);
  for i := 0 to n - 1 do
    writeln(a[i], ' ', b[i])
end.
