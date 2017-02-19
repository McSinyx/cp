{$mode objfpc}
uses math, clib;

var
  n, m, i, j: int16;
  (* For math compatibility *)
  a: array of array of integer;
  res: array of integer;
  (* For clib compatibility *)
  rowmin: array of int64;
  colmax: int64;

begin
  readln(n, m);
  setlength(a, n);
  setlength(rowmin, n);
  for i := 0 to n - 1 do
    begin
      setlength(a[i], m);
      for j := 0 to m - 1 do
        read(a[i][j]);
      rowmin[i] := minvalue(a[i])
    end;
  qsort(rowmin);
  setlength(res, 0);
  for j := 0 to m - 1 do
    begin
      colmax := a[0][j];
      for i := 1 to n - 1 do
        if a[i][j] > colmax then
          colmax := a[i][j];
      if bsearch(rowmin, colmax) > -1 then
        begin
          setlength(res, length(res) + 1);
          res[length(res) - 1] := colmax
        end
    end;
  writeln(length(res));
  for i in res do
    write(i, ' ');
  writeln
end.
