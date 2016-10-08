var
  f : text;
  i, l, m, n : integer;
  a : array[1..1000] of longint;

procedure qsort(l, h : integer);
  var
    i, j : integer;
    x, tmp : longint;
  begin
    i := l;
    j := h;
    x := a[(i + j) div 2];
    repeat
      while a[i] < x do inc(i);
      while x < a[j] do dec(j);
      if i <= j then
        begin
          tmp := a[i];
          a[i] := a[j];
          a[j] := tmp;
          inc(i);
          dec(j)
        end
    until i > j;
    if l < j then qsort(l, j);
    if i < h then qsort(i, h)
  end;

function biin(n0 : integer) : boolean;
  var l, h, m : integer;
  begin
    l := 1;
    h := n;
    repeat
      m := (l + h) div 2;
      if a[m] = n0 then exit(true);
      if a[m] < n0 then l := m + 1
      else h := m - 1
    until l > h;
    biin := false
  end;

function libtbc(n0 : integer) : boolean;
  var i, j : integer;
  begin
    for i := 1 to n0 - 1 do
      for j := n0 + 1 to n do
        if biin(a[n0] * 3 - a[i] - a[j]) then
          exit(true);
    libtbc := false
  end;

begin
  assign(f, 'TBC.INP');
  reset(f);
  readln(f, n);
  for i := 1 to n do readln(f, a[i]);
  close(f);
  qsort(1, n);
  m := 0;
  for l := 2 to n - 1 do
    if libtbc(l) then
      inc(m);
  assign(f, 'TBC.OUT');
  rewrite(f);
  writeln(f, m);
  close(f)
end.
