uses clib;

var
  n, idx, i, j: int16;
  a, b: array of int64;
  k: int64;

begin
  readln(n, k);
  setlength(a, n);
  setlength(b, n);
  for i := 0 to n - 1 do
    begin
      read(a[i]);
      b[i] := a[i]
    end;
  qsort(b);
  for i := 0 to n - 1 do
    begin
      idx := bsearch(b, a[i] + k);
      if idx > -1 then
        for j := 0 to n - 1 do
          if a[j] = b[idx] then
            begin
              writeln('YES'#10, i + 1, ' ', j + 1);
              exit
            end
    end;
  writeln('NO')
end.
