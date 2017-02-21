uses clib;

var
  a, b: int64;
  i, j: int32;
  p: array[2..999983] of boolean;
  primes: intar;

begin
  for i := 2 to 999983 do
    p[i] := true;
  for i := 2 to 997 do
    for j := 2 to 999983 div i do
      p[i * j] := false;
  j := 0;
  setlength(primes, 78498);
  for i := 2 to 999983 do
    if p[i] then
      begin
        primes[j] := i;
        inc(j)
      end;

  repeat
    readln(a, b);
    a := a * b div sqr(gcd(a, b));
    b := 0;
    for i := 0 to bisect_left(primes, trunc(sqrt(a))) do
      while a mod primes[i] = 0 do
        begin
          a := a div primes[i];
          b := b + 1
        end;
    if a = 1 then
      writeln(b)
    else
      writeln(b + 1)
  until eof(input)
end.
