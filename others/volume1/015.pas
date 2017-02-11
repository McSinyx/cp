var
  n, i: smallint;
  a: array of longint;
  min, min_: longint;

begin
  readln(n);
  min := 1000000000;
  setlength(a, n);
  for i := 0 to n - 1 do
    begin
      read(a[i]);
      if a[i] < min then
        min := a[i]
    end;
  min_ := 1000000000;
  for i := 0 to n - 1 do
    if (a[i] < min_) and
       (a[i] > min) then
         min_ := a[i];
  writeln(min, ' ', min_)
end.
