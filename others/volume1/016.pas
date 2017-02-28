var
  s, z: ansistring;
  i, j, k: int16;

begin
  readln(s);
  readln(k);
  setlength(z, length(s));
  i := 0;
  j := 0;
  repeat
    inc(i);
    while (j > 0) and
    (k > 0) and
    (s[i] > z[j]) do
    begin
      dec(j);
      dec(k)
    end;
    inc(j);
    z[j] := s[i]
  until i = length(s);
  writeln(z)
end.
