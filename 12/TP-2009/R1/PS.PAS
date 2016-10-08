var
  f : text;
  m, n : byte;
  k, i, j, l, gcd0 : integer;
  a, b : array[1..30] of integer;
  c : array[0..1, 1..900] of integer;

function gcd(d, e : integer) : integer;
  var tmp : integer;
  begin
    while d > 0 do
      begin
        tmp := d;
        d := e mod d;
        e := tmp
      end;
    gcd := e
  end;

procedure qsort(b, e: integer);
  var i, j, x, tmp: integer;
  begin
    i := b;
    j := e;
    x := (b + e) div 2;
    repeat
      while c[0, i] * c[1, x] < c[0, x] * c[1, i] do inc(i);
      while c[0, x] * c[1, j] < c[0, j] * c[1, x] do dec(j);
      if i <= j then
        begin
          tmp := c[0, i];
          c[0, i] := c[0, j];
          c[0, j] := tmp;
          tmp := c[1, i];
          c[1, i] := c[1, j];
          c[1, j] := tmp;
          inc(i);
          dec(j)
        end
    until i > j;
    if b < j then qsort(b, j);
    if i < e then qsort(i, e)
  end;

begin
  assign(f, 'PS.INP');
  reset(f);
  read(f, m, n, k);
  for i := 1 to m do read(f, a[i]);
  for i := 1 to n do read(f, b[i]);
  close(f);
  l := 0;
  for i := 1 to m do
    for j := 1 to n do
      begin
        inc(l);
        gcd0 := gcd(a[i], b[j]);
        c[0, l] := a[i] div gcd0;
        c[1, l] := b[j] div gcd0
      end;
  qsort(1, l);
  i := 1;
  while i < l do
    begin
      inc(i);
      if c[0, i] * c[1, i - 1] = c[0, i - 1] * c[1, i] then
        begin
          dec(l);
          for j := i to l do
            begin
              c[0, j] := c[0, j + 1];
              c[1, j] := c[1, j + 1]
            end
        end
    end;
  assign(f, 'PS.OUT');
  rewrite(f);
  writeln(f, c[0, k], ' ', c[1, k]);
  close(f)
end.
