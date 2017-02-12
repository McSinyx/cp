uses cmath;

var
  prime: array [2..1000000] of boolean;
  i, j, n, k: longint;

begin
  for i := 2 to 1000000 do
    prime[i] := true;
  for i := 2 to 1000 do
    if prime[i] then
      for j := i to 1000000 div i do
        prime[i * j] := false;

  readln(n, k);
  writeln(isprime(n));
  for i := 2 to k do
    if prime[i] then
      write(i, ' ');
  writeln
end.
