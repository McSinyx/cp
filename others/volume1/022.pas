var
  s: array[1..1000000] of int32;
  m, n, i, j: int32;

begin
  readln(m);
  s[1] := 0;
  for i := 2 to m do
    begin
      n := trunc(sqrt(i));
      if i mod n > 0 then
        s[i] := 1
      else if i = n * n then
        s[i] := 1 + n
      else
        s[i] := 1 + n + i div n;
      for j := 2 to n - 1 do
        if i mod j = 0 then
          inc(s[i], j + i div j)
    end;

  j := 0;
  for i := 2 to m do
    if (i <> s[i]) and
       (s[i] <= 1000000) and
       (i = s[s[i]]) then
      begin writeln(i, ' ', s[i]);
      inc(j);
    end;
  writeln(j div 2)
end.
