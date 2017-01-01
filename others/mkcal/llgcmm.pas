type
  foo_t = record
            t, idx: integer
          end;

var
  f: text;
  n, m, i, j, k: integer;
  a: array of foo_t;
  b: array of array of foo_t;
  c: array of longint;
  foo: foo_t;
  tmp: longint;


procedure swp(var x, y: foo_t);
  var
    tmp: integer;

  begin
    tmp := x.t;
    x.t := y.t;
    y.t := tmp;

    tmp := x.idx;
    x.idx := y.idx;
    y.idx := tmp
  end;


begin
  assign(f, 'LLGCMM.INP');
  reset(f);

  readln(f, n, m);
  setlength(a, n);

  for i := 0 to n - 1 do
    read(f, a[i].t);

  close(f);

  for i := 1 to n do
    a[i - 1].idx := i;

  for i := 0 to n - 2 do
    for j := i to n - 1 do
      if a[i].t < a[j].t then
        swp(a[i], a[j]);

  setlength(b, m);
  setlength(c, m);

  for i := 0 to m - 1 do
    begin
      setlength(b[i], 0);
      c[i] := 0
    end;

  for i := 0 to n - 1 do
    begin
      tmp := c[0];
      k := 0;

      for j := 1 to m - 1 do
        if c[j] < tmp then
          begin
            k := j;
            tmp := c[j]
          end;

      setlength(b[k], length(b[k]) + 1);
      b[k][length(b[k]) - 1].t := a[i].t;
      b[k][length(b[k]) - 1].idx := a[i].idx;
      c[k] := c[k] + a[i].t
    end;

  tmp := 0;
  for i := 0 to m - 1 do
    if c[i] > tmp then
      tmp := c[i];

  assign(f, 'LLGCMM.OUT');
  rewrite(f);

  writeln(f, tmp);

  for i := 0 to m - 1 do
    begin
      for foo in b[i] do
        write(f, foo.idx, ' ');

      writeln(f);
    end;

  close(f)
end.
