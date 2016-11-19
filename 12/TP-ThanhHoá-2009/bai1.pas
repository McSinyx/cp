var
  prime: array[1..4999] of boolean;
  n, i, k, a, j: word;
  f: text;

begin
  fillchar(prime, sizeof(prime), true);
  prime[1] := false;

  for i := 2 to 70 do
    if prime[i] then
      for j := 2 to 4999 div i do
        prime[i * j] := false;

  for i := 1 to 4999 do
    if prime[i] then
      writeln(i);

  assign(f, 'BAI1.INP');
  reset(f);

  readln(f, n, k);

  j := 0;
  for i := 1 to n do
    begin
      read(f, a);
      if (a < k) and
         prime[a] then
        inc(j)
    end;

  close(f);

  assign(f, 'BAI1.OUT');
  rewrite(f);
  writeln(f, j);
  close(f)
end.
