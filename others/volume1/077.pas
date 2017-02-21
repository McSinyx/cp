uses clib;

var
  n, m: int32;
  a, b, c: array of int64;
  i, j: int64;

begin
  readln(n, m);
  setlength(a, n);
  repeat
    dec(n);
    read(a[n])
  until n = 0;
  qsort(a);
  setlength(b, m);
  repeat
    dec(m);
    read(b[m])
  until m = 0;
  qsort(b);

  setlength(c, 0);
  for i in a do
    if (bsearch(b, i) > -1) and
       ((length(c) = 0) or (c[length(c) - 1] < i)) then
      begin
        setlength(c, length(c) + 1);
        c[length(c) - 1] := i
      end;

  for i in c do
    begin
      dec(n, 2);
      j := bsearch(a, i);
      for m := j downto 0 do
        if a[m] = i then
          inc(n)
        else
          break;
      for m := j to length(a) - 1 do
        if a[m] = i then
          inc(n)
        else
          break;
      j := bsearch(b, i);
      for m := j downto 0 do
        if b[m] = i then
          inc(n)
        else
          break;
      for m := j to length(b) - 1 do
        if b[m] = i then
          inc(n)
        else
          break
    end;
  writeln(n)
end.
