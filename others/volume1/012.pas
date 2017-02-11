var
  n, i, j: shortint;
  pas_tri, pas_tri_old: array of int64;

begin
  readln(n);
  setlength(pas_tri_old, n + 1);
  pas_tri_old[0] := 1;
  pas_tri_old[1] := 0;
  setlength(pas_tri, n + 1);
  pas_tri[0] := 1;
  for i := 1 to n do
    pas_tri[i] := 0;
  writeln(1);
  for i := 1 to n do
    begin
      write('1 ');
      for j := 1 to i - 1 do
        begin
          pas_tri[j] := pas_tri_old[j] + pas_tri_old[j - 1];
          write(pas_tri[j], ' ')
        end;
      pas_tri[i] := 1;
      writeln(1);
      for j := 0 to n do
        pas_tri_old[j] := pas_tri[j]
    end
end.
