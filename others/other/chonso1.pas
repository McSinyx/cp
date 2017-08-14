var
  f: text;
  n, k, i, j: uint8;
  max, count: uint64;
  a: array[1..10, 1..10] of uint64;
  avail: array[1..10] of boolean = (true, true, true, true, true,
                                    true, true, true, true, true);


procedure chonso1(
  depth, len: uint8;
  sum: uint64
);

  var
    i: uint8;

  begin
    if len = k then
      begin
        if sum > max then
          begin
            max := sum;
            count := 1
          end
        else if sum = max then
          inc(count);
        exit
      end;

    for i := 1 to n do
      if avail[i] then
        begin
          avail[i] := false;
          chonso1(depth + 1, len + 1, sum + a[depth, i]);
          avail[i] := true
        end;

    if k - len <= n - depth then
      chonso1(depth + 1, len, sum);
  end;


begin
  assign(f, 'CHONSO1.INP');
  reset(f);
  readln(f, n, k);
  for i := 1 to n do
    for j := 1 to n do
      read(f, a[i, j]);
  close(f);

  max := 0;
  chonso1(1, 0, 0);

  assign(f, 'CHONSO1.OUT');
  rewrite(f);
  writeln(f, max, ' ', count);
  close(f)
end.
