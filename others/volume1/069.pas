uses clib;

var
  n, i, j: int16;
  b, c: array of int64;
  tmp: uint64 = 18446744073709551615;

function absum(x, y: int64): uint64;
  begin
    if (x < 0) and
       (y < 0) then
      exit(-x - y)
    else if (x > 0) and
            (y > 0) then
      exit(x + y);
    absum := abs(x + y)
  end;

begin
  readln(n);
  setlength(b, n);
  for i := n - 1 downto 0 do
    read(b[i]);
  qsort(b);
  setlength(c, n);
  for j := 0 to n - 1 do
    read(c[j]);
  qsort(c);
  while (i < n) and
        (j >= 0) do
    begin
      if absum(b[i], c[j]) < tmp then
        tmp := absum(b[i], c[j]);
      if b[i] + c[j] < 0 then
        i := i + 1
      else
        j := j - 1
    end;
  writeln(tmp)
end.
