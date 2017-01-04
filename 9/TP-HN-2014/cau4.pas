var
  f: text;
  n, k, i: smallint;
  a, c: array of longint;
  b: array of boolean;
  d: longint = 0;


procedure foo(
  idx: smallint;
  delta: longint
);

  var
    i: smallint;
    next: byte = 1;

  begin
    if (idx = k + 1) and (k > 0) then
      delta := delta + abs(c[k] - c[k - 1]);

    if delta >= d then
      exit;

    if idx + 1 = k then
      inc(next);

    if idx = n then
      begin
        d := delta;
        exit
      end;

    for i := 0 to n - 2 do
      if b[i] then
        begin
          b[i] := false;
          c[idx] := a[i];

          if idx > 0 then
            foo(idx + next, delta + abs(c[idx] - c[idx - 1]))
          else
            foo(idx + next, 0);

          b[i] := true;
          c[idx] := 0
        end
  end;


begin
  assign(f, 'CAU4.INP');
  reset(f);
  readln(f, n, k);
  setlength(a, n);
  for i := 0 to n - 1 do
    read(f, a[i]);
  close(f);

  setlength(c, n);
  dec(k);
  c[k] := a[k];

  for i := 0 to k - 1 do
    c[i] := 0;
  for i := k + 1 to n - 1 do
    c[i] := 0;

  for i := 1 to n - 1 do
    d := d + abs(a[i] - a[i - 1]);

  for i := k to n - 2 do
    a[i] := a[i + 1];
  setlength(a, n - 1);

  setlength(b, n - 1);
  for i := 0 to n - 2 do
    b[i] := true;

  if k = 0 then
    foo(1, 0)
  else
    foo(0, 0);

  assign(f, 'CAU4.OUT');
  rewrite(f);
  writeln(f, d);
  close(f)
end.
