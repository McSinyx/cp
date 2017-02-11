var
  prime: array [2..1000000] of boolean;
  i, j, n, k: longint;
  b: boolean = true;

begin
  for i := 2 to 1000000 do
    prime[i] := true;
  for i := 2 to 1000 do
    if prime[i] then
      for j := i to 1000000 div i do
        prime[i * j] := false;

  readln(n, k);
  if n < 2 then
    writeln('FALSE')
  else if n <= 1000000 then
    writeln(prime[n])
  else
    begin
      for i := 2 to trunc(sqrt(n)) do
        if n mod i = 0 then
        begin
          b := false;
          break
        end;
      writeln(b)
    end;
  for i := 2 to k do
    if prime[i] then
      write(i, ' ');
  writeln
end.
