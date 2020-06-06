var
  n: word;
  k, a: smallint;
  f: text;
  b: array[-999..999] of byte;


function libai2(): byte;
  var
    i: smallint;

  begin
    for i := -999 to k - 1 do
      if (b[i] > 0) and
         (b[k * 2 - i] > 0) then
        exit(1);

    if b[k] > 1 then
      exit(1);

    exit(0)
  end;


begin
  assign(f, 'BAI2.INP');
  reset(f);
  readln(f, n, k);
  fillchar(b, sizeof(b), 0);
  repeat
    read(f, a);
    inc(b[a]);
    dec(n)
  until n = 0;
  close(f);

  assign(f, 'BAI2.OUT');
  rewrite(f);
  writeln(f, libai2());
  close(f)
end.
